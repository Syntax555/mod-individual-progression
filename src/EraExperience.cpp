/*
    Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license: https://github.com/azerothcore/azerothcore-wotlk/blob/master/LICENSE-AGPL3
*/

#include "EraExperiencePolicy.h"
#include "IndividualProgression.h"
#include "SpellAuraEffects.h"

namespace
{
uint8 ExperienceEra(Player* player)
{
    if (!player || !player->IsInWorld() || !sIndividualProgression->EraExperienceActive())
        return EraExperiencePolicy::NoEra;

    return IndividualProgression_GetEarnedEra(player);
}

// The era's full quest value reduced at level; quests without one keep the
// native 3.3.5 value. TBC values fall back to Individual Progression's table,
// and QuestXPFix = 0 keeps native values, also after a reload left the tables.
uint32 EraQuestXP(Quest const* quest, uint8 era, uint8 level)
{
    if (!sIndividualProgression->questXpFix)
        return quest->XPValue(level);

    uint32 const id = quest->GetQuestId();
    questXpMapType const& tbc = sIndividualProgression->questXpTbcMap;
    bool const tbcValue = era == EraExperiencePolicy::TBC && tbc.count(id);
    questXpMapType const& values = tbcValue ? tbc : sIndividualProgression->questXpMap;
    auto const value = values.find(id);
    if (value == values.end())
        return quest->XPValue(level);

    // The reduction counts from the quest level of the value's own era.
    auto const& levels = tbcValue ? sIndividualProgression->questLevelTbcMap : sIndividualProgression->questLevelMap;
    auto const questLevel = levels.find(id);
    return EraExperiencePolicy::HistoricalQuestXP(
        value->second, questLevel != levels.end() ? questLevel->second : quest->GetQuestLevel(), level);
}

// One effect at a time with truncation, as mangos-tbc's Player::GiveXP.
uint32 WithGeneralXPBonus(Player* player, uint8 era, uint32 xp)
{
    for (AuraEffect const* effect : player->GetAuraEffectsByType(SPELL_AURA_MOD_XP_PCT))
        if (EraExperiencePolicy::GeneralXPBonus(era, effect->GetId(), effect->GetAmount()))
            xp = uint32(xp * (1.0f + effect->GetAmount() / 100.0f));

    return xp;
}

void ClearRestAtEraCap(Player* player)
{
    if (player && EraExperiencePolicy::AtEraCap(ExperienceEra(player), player->GetLevel()))
        player->SetRestBonus(0);
}
}

uint32 IndividualProgression_EraCapQuestMoney(Player* player, Quest const* quest)
{
    uint8 const era = ExperienceEra(player);
    if (!player || !quest || !EraExperiencePolicy::AtEraCap(era, player->GetLevel()))
        return 0;

    // The core converts quest experience itself at the realm's maximum level.
    if (player->GetLevel() >= sWorld->getIntConfig(CONFIG_MAX_PLAYER_LEVEL) || quest->HasFlag(QUEST_FLAGS_NO_MONEY_FROM_XP))
        return 0;

    return EraExperiencePolicy::CapMoney(era, EraQuestXP(quest, era, player->GetLevel()));
}

class IndividualProgressionEraExperience : public PlayerScript
{
public:
    IndividualProgressionEraExperience()
        : PlayerScript("IndividualProgressionEraExperience",
                       {PLAYERHOOK_ON_GIVE_EXP, PLAYERHOOK_ON_QUEST_COMPUTE_EXP, PLAYERHOOK_ON_LOGIN,
                        PLAYERHOOK_ON_LEVEL_CHANGED, PLAYERHOOK_ON_PLAYER_COMPLETE_QUEST})
    {
    }

    void OnPlayerQuestComputeXP(Player* player, Quest const* quest, uint32& xpValue) override
    {
        uint8 const era = ExperienceEra(player);
        if (!quest || era > EraExperiencePolicy::TBC)
            return;

        uint8 level = player->GetLevel();
        sScriptMgr->OnPlayerBeforeGetLevelForXPGain(player, level);

        // Keep the core's decisions to pay nothing: repeated completions, and
        // money, a zero rate or an aura replacing native experience.
        bool const rewarded = player->IsQuestRewarded(quest->GetQuestId()) && !quest->IsDFQuest() &&
                              !(quest->IsDaily() || quest->IsWeekly() || quest->IsMonthly());
        if (rewarded || (!xpValue && quest->XPValue(level)))
        {
            xpValue = 0;
            return;
        }

        uint32 xp = uint32(EraQuestXP(quest, era, level) * player->GetQuestRate(quest->IsDFQuest()));
        xp *= player->GetTotalAuraMultiplier(SPELL_AURA_MOD_XP_QUEST_PCT, [era](AuraEffect const* effect)
        {
            return EraExperiencePolicy::XPAuraCounts(era, effect->GetId(), effect->GetAmount());
        });
        xpValue = WithGeneralXPBonus(player, era, xp);
    }

    void OnPlayerGiveXP(Player* player, uint32& amount, Unit* /*victim*/, uint8 xpSource) override
    {
        // Only battleground experience, and kills and exploration with an
        // experience aura, can change.
        if (!player || !amount ||
            (xpSource != XPSOURCE_BATTLEGROUND &&
             ((xpSource != XPSOURCE_KILL && xpSource != XPSOURCE_EXPLORE) ||
              player->GetAuraEffectsByType(SPELL_AURA_MOD_XP_PCT).empty())))
            return;

        uint8 const era = ExperienceEra(player);
        if (xpSource == XPSOURCE_BATTLEGROUND)
        {
            if (!EraExperiencePolicy::BattlegroundXP(era))
                amount = 0;

            return;
        }

        if (xpSource == XPSOURCE_EXPLORE)
        {
            amount = WithGeneralXPBonus(player, era, amount);
            return;
        }

        // KillRewarder applies the auras before this hook; remove the bonuses
        // of later eras from its result.
        float const applied = player->GetTotalAuraMultiplier(SPELL_AURA_MOD_XP_PCT);
        float const kept = player->GetTotalAuraMultiplier(SPELL_AURA_MOD_XP_PCT, [era](AuraEffect const* effect)
        {
            return EraExperiencePolicy::XPAuraCounts(era, effect->GetId(), effect->GetAmount());
        });
        amount = EraExperiencePolicy::WithoutBonus(amount, applied, kept);
    }

    // No rested experience at an era's maximum level, as at the 1.12 and
    // 2.4.3 maximum levels; the offline rest of a login is added before this.
    void OnPlayerLogin(Player* player) override
    {
        ClearRestAtEraCap(player);
    }

    void OnPlayerLevelChanged(Player* player, uint8 /*oldLevel*/) override
    {
        ClearRestAtEraCap(player);
    }

    // Rest gathered in an inn while capped does not carry into the next era.
    void OnPlayerCompleteQuest(Player* player, Quest const* quest) override
    {
        if (quest && ExperienceEra(player) != EraExperiencePolicy::NoEra &&
            EraExperiencePolicy::LeavesEraCap(quest->GetQuestId(), player->GetLevel()))
            player->SetRestBonus(0);
    }
};

class IndividualProgressionEraExperienceWorld : public WorldScript
{
public:
    IndividualProgressionEraExperienceWorld()
        : WorldScript("IndividualProgressionEraExperienceWorld", {WORLDHOOK_ON_AFTER_CONFIG_LOAD})
    {
    }

    // Recruit-a-Friend triples experience inside Player::GiveXP, after every
    // hook, and grants levels. It started after the 2.4.3 release, and its
    // level limit covers the levels of the Vanilla era.
    void OnAfterConfigLoad(bool /*reload*/) override
    {
        if (!sIndividualProgression->EraExperienceActive())
            return;

        sWorld->setIntConfig(CONFIG_MAX_RECRUIT_A_FRIEND_BONUS_PLAYER_LEVEL, 0);
        sWorld->setRate(RATE_REPUTATION_RECRUIT_A_FRIEND_BONUS, 0.0f);
    }
};

void AddSC_individual_progression_era_experience()
{
    new IndividualProgressionEraExperience();
    new IndividualProgressionEraExperienceWorld();
}
