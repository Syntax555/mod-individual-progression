/*
 * Historical priest racial quest acquisition for Individual Progression.
 * Integration follows AzerothCore GPL terms. Historical source data retain
 * the CMaNGOS GPL licenses documented in THIRD_PARTY_NOTICES.md.
 */
#include "IndividualProgression.h"
#include "NPCPackets.h"
#include "Spell.h"
#include "SpellScript.h"
#include "SpellAuras.h"
#include "Trainer.h"
#include <algorithm>
#include <array>

namespace HistoricalClassQuests
{
struct Family
{
    std::array<uint32, 8> quests;
    std::array<uint32, 2> raceMasks;
    std::array<uint32, 2> questRequired;
    uint32 learnSpell;
    std::array<std::array<uint32, 8>, 2> ranks;
    std::array<std::array<uint32, 8>, 2> triggered;
    std::array<std::array<uint8, 8>, 2> levels;
};
constexpr std::array<Family, 12> Families = {{
    {{5634, 5635, 5636, 5637, 5638, 5639, 0, 0}, {5, 5}, {5, 5}, 948090, {{{948081, 948082, 948083, 948084, 948085, 948086, 948087, 0}, {949300, 949301, 949302, 949303, 949304, 949305, 949306, 949307}}}, {{{0, 0, 0, 0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0, 0, 0}}}, {{{10, 18, 26, 34, 42, 50, 58, 0}, {10, 18, 26, 34, 42, 50, 58, 66}}}}, // Desperate Prayer
    {{5641, 5645, 5647, 0, 0, 0, 0, 0}, {4, 4}, {4, 4}, 948091, {{{948089, 0, 0, 0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0, 0, 0}}}, {{{0, 0, 0, 0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0, 0, 0}}}, {{{20, 0, 0, 0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0, 0, 0}}}}, // Fear Ward
    {{5627, 5628, 5629, 5630, 5631, 5632, 5633, 0}, {8, 8}, {8, 8}, 949290, {{{949100, 949101, 949102, 949103, 949104, 949105, 949106, 0}, {949308, 949309, 949310, 949311, 949312, 949313, 949314, 949315}}}, {{{0, 0, 0, 0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0, 0, 0}}}, {{{10, 18, 26, 34, 42, 50, 58, 0}, {10, 18, 26, 34, 42, 50, 58, 66}}}}, // Starshards
    {{5672, 5673, 5674, 5675, 0, 0, 0, 0}, {8, 8}, {8, 8}, 949291, {{{949107, 949108, 949109, 949110, 949111, 0, 0, 0}, {949316, 0, 0, 0, 0, 0, 0, 0}}}, {{{0, 0, 0, 0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0, 0, 0}}}, {{{20, 30, 40, 50, 60, 0, 0, 0}, {20, 0, 0, 0, 0, 0, 0, 0}}}}, // Elune's Grace
    {{5658, 5660, 5661, 5662, 5663, 0, 0, 0}, {16, 528}, {16, 16}, 949292, {{{949112, 949113, 949114, 949115, 949116, 949117, 0, 0}, {949317, 949318, 949319, 949320, 949321, 949322, 949323, 0}}}, {{{949118, 949119, 949120, 949121, 949122, 949123, 0, 0}, {949324, 949325, 949326, 949327, 949328, 949329, 949330, 0}}}, {{{10, 20, 30, 40, 50, 60, 0, 0}, {10, 20, 30, 40, 50, 60, 70, 0}}}}, // Touch of Weakness
    {{5652, 5654, 5655, 5656, 5657, 0, 0, 0}, {128, 128}, {128, 128}, 949293, {{{949124, 949125, 949126, 949127, 949128, 949129, 0, 0}, {949331, 949332, 949333, 949334, 949335, 949336, 949337, 0}}}, {{{0, 0, 0, 0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0, 0, 0}}}, {{{10, 20, 30, 40, 50, 60, 0, 0}, {10, 20, 30, 40, 50, 60, 70, 0}}}}, // Hex of Weakness
    {{5642, 5643, 5680, 0, 0, 0, 0, 0}, {128, 128}, {128, 128}, 949294, {{{949130, 949131, 949132, 949133, 949134, 949135, 0, 0}, {949338, 949339, 949340, 949341, 949342, 949343, 949344, 0}}}, {{{949136, 949137, 949138, 949139, 949140, 949141, 0, 0}, {949345, 949346, 949347, 949348, 949349, 949350, 949351, 0}}}, {{{20, 28, 36, 44, 52, 60, 0, 0}, {20, 28, 36, 44, 52, 60, 68, 0}}}}, // Shadowguard
    {{5676, 5677, 0, 0, 0, 0, 0, 0}, {1, 1}, {1, 1}, 949295, {{{949142, 949143, 949144, 949145, 949146, 0, 0, 0}, {949352, 949353, 949354, 949355, 949356, 949357, 0, 0}}}, {{{949147, 949148, 949149, 949150, 949151, 0, 0, 0}, {949358, 949359, 949360, 949361, 949362, 949363, 0, 0}}}, {{{20, 30, 40, 50, 60, 0, 0, 0}, {20, 30, 40, 50, 60, 70, 0, 0}}}}, // Feedback
    {{5644, 5646, 5679, 0, 0, 0, 0, 0}, {16, 16}, {16, 16}, 949296, {{{949152, 949153, 949154, 949155, 949156, 949157, 0, 0}, {949364, 949365, 949366, 949367, 949368, 949369, 949370, 0}}}, {{{0, 0, 0, 0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0, 0, 0}}}, {{{20, 28, 36, 44, 52, 60, 0, 0}, {20, 28, 36, 44, 52, 60, 68, 0}}}}, // Devouring Plague
    {{0, 0, 0, 0, 0, 0, 0, 0}, {0, 1028}, {0, 0}, 0, {{{0, 0, 0, 0, 0, 0, 0, 0}, {949371, 949372, 949373, 949374, 949375, 949376, 0, 0}}}, {{{0, 0, 0, 0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0, 0, 0}}}, {{{0, 0, 0, 0, 0, 0, 0, 0}, {20, 30, 40, 50, 60, 70, 0, 0}}}}, // Chastise
    {{0, 0, 0, 0, 0, 0, 0, 0}, {0, 1024}, {0, 0}, 0, {{{0, 0, 0, 0, 0, 0, 0, 0}, {949377, 0, 0, 0, 0, 0, 0, 0}}}, {{{0, 0, 0, 0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0, 0, 0}}}, {{{0, 0, 0, 0, 0, 0, 0, 0}, {10, 0, 0, 0, 0, 0, 0, 0}}}}, // Symbol of Hope
    {{0, 0, 0, 0, 0, 0, 0, 0}, {0, 512}, {0, 0}, 0, {{{0, 0, 0, 0, 0, 0, 0, 0}, {949378, 0, 0, 0, 0, 0, 0, 0}}}, {{{0, 0, 0, 0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0, 0, 0}}}, {{{0, 0, 0, 0, 0, 0, 0, 0}, {20, 0, 0, 0, 0, 0, 0, 0}}}}, // Consume Magic
}};

bool Active(Player* player)
{
    return player && player->IsInWorld() && sIndividualProgression->IsStrictDefaultProgression();
}

Family const* FamilyForSpell(uint32 spell, uint8& era, uint8& rank)
{
    if (!spell)
        return nullptr;
    for (auto const& family : Families)
    {
        for (uint8 e = 0; e < 2; ++e)
            for (uint8 r = 0; r < 8; ++r)
                if (family.ranks[e][r] == spell || family.triggered[e][r] == spell)
                {
                    era = e;
                    rank = r;
                    return &family;
                }
    }
    return nullptr;
}

bool Rewarded(Player* player, Family const& family)
{
    return std::any_of(family.quests.begin(), family.quests.end(),
        [player](uint32 quest) { return quest && player->GetQuestRewardStatus(quest); });
}

bool Eligible(Player* player, Family const& family)
{
    if (!Active(player) || player->getClass() != CLASS_PRIEST)
        return false;
    uint8 era = IndividualProgression_GetEarnedEra(player);
    return era < 2 && (family.raceMasks[era] & (1u << (player->getRace() - 1))) && family.ranks[era][0] && player->GetLevel() >= family.levels[era][0];
}

bool CanUseSpell(Player* player, uint32 spell)
{
    for (auto const& family : Families)
        if (family.learnSpell && spell == family.learnSpell)
            return Eligible(player, family) &&
                (family.questRequired[IndividualProgression_GetEarnedEra(player)] & (1u << (player->getRace() - 1))) && Rewarded(player, family);
    uint8 era = 0, rank = 0;
    if (Family const* family = FamilyForSpell(spell, era, rank))
        return Eligible(player, *family) && IndividualProgression_GetEarnedEra(player) == era &&
            (!(family->questRequired[era] & (1u << (player->getRace() - 1))) || Rewarded(player, *family)) &&
            player->GetLevel() >= family->levels[era][rank];

    // Native Wrath Desperate Prayer remains a talent. Native Fear Ward is
    // a TBC baseline ability; native Devouring Plague is a Wrath baseline.
    static constexpr std::array<uint32, 9> prayer = {19236, 19238, 19240, 19241,
        19242, 19243, 25437, 48172, 48173};
    static constexpr std::array<uint32, 8> plague = {2944, 19276, 19277, 19278,
        19279, 19280, 25467, 48299};
    bool p = std::find(prayer.begin(), prayer.end(), spell) != prayer.end();
    bool d = std::find(plague.begin(), plague.end(), spell) != plague.end() || spell == 48300;
    if ((!p && !d && spell != 6346) || !Active(player))
        return true;
    return spell == 6346 ? IndividualProgression_GetEarnedEra(player) >= 1 : IndividualProgression_GetEarnedEra(player) == 2;
}

uint32 RootForEra(Player* player, Family const& family)
{
    uint8 era = IndividualProgression_GetEarnedEra(player);
    return era < 2 ? family.ranks[era][0] : 0;
}

void TeachReward(Player* player, uint32 learnSpell)
{
    for (auto const& family : Families)
        if (family.learnSpell == learnSpell && CanUseSpell(player, learnSpell))
        {
            uint32 root = RootForEra(player, family);
            if (root && !player->HasSpell(root))
                player->learnSpell(root);
            return;
        }
}

void RestoreEarnedRoots(Player* player)
{
    // Persistent native rewarded-quest credit restores only rank one.
    // Higher ranks still require their previous rank and normal paid training.
    for (auto const& family : Families)
        if (Eligible(player, family) && Rewarded(player, family))
            TeachReward(player, family.learnSpell);
}
} // namespace HistoricalClassQuests

class historical_class_quests : public PlayerScript
{
public:
    historical_class_quests() : PlayerScript("historical_class_quests", {
        PLAYERHOOK_CAN_LEARN_SPELL, PLAYERHOOK_ON_LOGIN,
        PLAYERHOOK_ON_GET_TRAINER_SPELL_STATE, PLAYERHOOK_ON_BEFORE_RECEIVE_SPELL_LIST_FROM_TRAINER,
        PLAYERHOOK_ON_SPELL_CAST}) { }

    bool OnPlayerCanLearnSpell(Player* player, uint32 spell) override
    {
        return HistoricalClassQuests::CanUseSpell(player, spell);
    }

    void OnPlayerGetTrainerSpellState(Player const* player, uint32 /*trainerId*/, uint32 spell,
        Trainer::SpellState& state) override
    {
        if (!HistoricalClassQuests::CanUseSpell(const_cast<Player*>(player), spell))
            state = Trainer::SpellState::Unavailable;
    }

    void OnPlayerBeforeReceiveSpellListFromTrainer(Player* player, Creature* /*trainer*/,
        WorldPackets::NPC::TrainerList& list) override
    {
        list.Spells.erase(std::remove_if(list.Spells.begin(), list.Spells.end(),
            [player](WorldPackets::NPC::TrainerListSpell const& entry)
            { return !HistoricalClassQuests::CanUseSpell(player, uint32(entry.SpellID)); }), list.Spells.end());
    }

    void OnPlayerSpellCast(Player* player, Spell* spell, bool /*skipCheck*/) override
    {
        if (spell && !HistoricalClassQuests::CanUseSpell(player, spell->GetSpellInfo()->Id))
            spell->cancel();
    }

    void OnPlayerLogin(Player* player) override
    {
        if (HistoricalClassQuests::Active(player))
            HistoricalClassQuests::RestoreEarnedRoots(player);
    }
};

// One quest reward wrapper chooses the character's earned historical era.
// Native RewardQuest records the reward before invoking this effect.
class spell_historical_priest_training : public SpellScript
{
    PrepareSpellScript(spell_historical_priest_training);

    void HandleDummy(SpellEffIndex /*index*/)
    {
        if (Player* player = GetCaster()->ToPlayer())
            HistoricalClassQuests::TeachReward(player, GetSpellInfo()->Id);
    }

    void Register() override
    {
        OnEffectHitTarget += SpellEffectFn(spell_historical_priest_training::HandleDummy,
            EFFECT_0, SPELL_EFFECT_DUMMY);
    }
};

// Consume Magic requires a current beneficial, nonpassive Priest aura on the
// caster. The aura may have been cast by another Priest. CheckCast stores no
// aura pointer; the effect rescans before removing one and restoring mana.
class spell_historical_consume_magic : public SpellScript
{
    PrepareSpellScript(spell_historical_consume_magic);

    AuraApplication* FindEligibleAura()
    {
        for (auto const& entry : GetCaster()->GetAppliedAuras())
        {
            AuraApplication* application = entry.second;
            Aura const* aura = application->GetBase();
            if (!application->GetRemoveMode() && !aura->IsRemoved() &&
                application->IsPositive() && !aura->IsPassive() &&
                aura->GetSpellInfo()->SpellFamilyName == SPELLFAMILY_PRIEST)
                return application;
        }
        return nullptr;
    }

    SpellCastResult CheckCast()
    {
        return FindEligibleAura() ? SPELL_CAST_OK : SPELL_FAILED_NOTHING_TO_DISPEL;
    }

    void HandleEnergize(SpellEffIndex /*index*/)
    {
        if (AuraApplication* application = FindEligibleAura())
            GetCaster()->RemoveAura(application);
        else
            PreventHitDefaultEffect(EFFECT_0);
    }

    void Register() override
    {
        OnCheckCast += SpellCheckCastFn(spell_historical_consume_magic::CheckCast);
        OnEffectHitTarget += SpellEffectFn(spell_historical_consume_magic::HandleEnergize,
            EFFECT_0, SPELL_EFFECT_ENERGIZE);
    }
};

void AddSC_individual_progression_historical_class_quests()
{
    new historical_class_quests();
    RegisterSpellScript(spell_historical_priest_training);
    RegisterSpellScript(spell_historical_consume_magic);
}
