/*
    Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license: https://github.com/azerothcore/azerothcore-wotlk/blob/master/LICENSE-AGPL3
*/

#ifndef ERA_EXPERIENCE_POLICY_H
#define ERA_EXPERIENCE_POLICY_H

#include <cmath>
#include <cstdint>

// Experience rules of a character's earned era, using the eras of
// IndividualProgression_GetEarnedEra: 0 Vanilla, 1 TBC, 2 Wrath. Any other
// value applies no era rule.
namespace EraExperiencePolicy
{
constexpr std::uint8_t Vanilla = 0;
constexpr std::uint8_t TBC = 1;
constexpr std::uint8_t Wrath = 2;
constexpr std::uint8_t NoEra = 255;

// mangos-classic and mangos-tbc Quest::XPValue: the full value up to five
// levels above the quest, then 80/60/40/20 percent and finally a tenth,
// rounded up. Quests without a level count at the character's level.
constexpr std::uint32_t HistoricalQuestXP(std::uint32_t full, std::int32_t questLevel, std::uint8_t level)
{
    std::int32_t const above = std::int32_t(level) - (questLevel > 0 ? questLevel : std::int32_t(level));
    if (above <= 5)
        return full;

    std::uint64_t const tenths = above >= 10 ? 1 : 2 * (10 - above);
    return std::uint32_t((std::uint64_t(full) * tenths + 9) / 10);
}

// Battleground objective and bonus experience arrived in patch 3.2.0.
constexpr bool BattlegroundXP(std::uint8_t era)
{
    return era >= Wrath;
}

// Heirloom bonuses and the Essence of Wintergrasp are Wrath content.
constexpr bool WrathOnlyXPBonus(std::uint32_t spellId)
{
    switch (spellId)
    {
        case 57353: // Heirloom Experience Bonus +10%
        case 71354: // Heirloom Experience Bonus +5%
        case 57940: // Essence of Wintergrasp
        case 58045: // Essence of Wintergrasp
            return true;
        default:
            return false;
    }
}

// Thrallmar's and Honor Hold's Favor cast this effect, and Player::GiveXP
// already adds their 5% to non-kill gains in Hellfire Peninsula.
constexpr bool CoreAppliedXPBonus(std::uint32_t spellId)
{
    return spellId == 32172; // [PH] Buffbot Buff Effect
}

// 1.12 had no experience aura; 2.4.3 had the holiday and Auchindoun bonuses.
// Penalties always apply.
constexpr bool XPAuraCounts(std::uint8_t era, std::uint32_t spellId, std::int32_t amount)
{
    if (amount <= 0 || era > TBC)
        return true;

    return era == TBC && !WrathOnlyXPBonus(spellId);
}

// mangos-tbc applies the experience bonus auras to every gain, quests and
// exploration included; the 3.3.5 core applies them, and their penalties, to
// kills only.
constexpr bool GeneralXPBonus(std::uint8_t era, std::uint32_t spellId, std::int32_t amount)
{
    return era == TBC && amount > 0 && !WrathOnlyXPBonus(spellId) && !CoreAppliedXPBonus(spellId);
}

// Removes ignored bonus effects from experience the core already multiplied.
inline std::uint32_t WithoutBonus(std::uint32_t amount, float applied, float kept)
{
    if (!(applied > 0.0f) || !(kept < applied))
        return amount;

    return std::uint32_t(std::lround(double(amount) * kept / applied));
}

// Individual Progression stops experience at 60 before TBC and at 70 before Wrath.
constexpr bool AtEraCap(std::uint8_t era, std::uint8_t level)
{
    return (era == Vanilla && level >= 60) || (era == TBC && level >= 70);
}

// Completing a progression marker that ends an era (66000 + 8 for TBC,
// 66000 + 13 for Wrath) at that era's cap.
constexpr bool LeavesEraCap(std::uint32_t questId, std::uint8_t level)
{
    return (questId == 66008 && level >= 60) || (questId == 66013 && level >= 70);
}

// Copper paid at the era cap for the quest experience the character would
// receive there: patch 1.10.0 paid 1 gold per 1,600 XP, and mangos-tbc's
// RewMoneyMaxLevel divisors encode XP at level 70 times 6 copper.
constexpr std::uint32_t CapMoney(std::uint8_t era, std::uint32_t xp)
{
    if (era == Vanilla)
        return std::uint32_t(std::uint64_t(xp) * 25 / 4);

    return era == TBC ? xp * 6 : 0;
}
}

#endif
