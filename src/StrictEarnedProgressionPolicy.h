/*
    Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license:
   https://github.com/azerothcore/azerothcore-wotlk/blob/master/LICENSE-AGPL3
*/

#ifndef STRICT_EARNED_PROGRESSION_POLICY_H
#define STRICT_EARNED_PROGRESSION_POLICY_H

#include <cstdint>

namespace StrictEarnedProgressionPolicy
{
constexpr char SettingsSource[] = "mod-individual-progression-strict-earned";
constexpr std::uint32_t SettingsIndex = 0;
constexpr std::uint8_t LastStage = 18;

// Stage 11 has no milestone in the upstream default progression.
constexpr std::uint8_t NextStage(std::uint8_t current)
{
    return current >= LastStage ? 0 : (current == 10 ? 12 : current + 1);
}

constexpr std::uint32_t BossCredit(std::uint8_t stage)
{
    switch (stage)
    {
        case 1:
        case 2:
        case 3:
        case 6:
        case 7:
        case 9:
        case 10:
        case 12:
        case 13:
        case 14:
        case 15:
        case 16:
        case 17:
        case 18:
            return std::uint32_t{1} << stage;
        default:
            return 0;
    }
}

constexpr std::uint8_t BossStage(std::uint32_t entry)
{
    switch (entry)
    {
        case 11502:
            return 1;  // Ragnaros
        case 301000:
            return 2;  // Vanilla Onyxia
        case 11583:
            return 3;  // Nefarian
        case 15727:
            return 6;  // C'Thun
        case 351019:
            return 7;  // Kel'Thuzad 40
        case 15690:
            return 9;  // Prince Malchezaar
        case 19622:
            return 10;  // Kael'thas
        case 22917:
            return 12;  // Illidan
        case 25315:
            return 13;  // Kil'jaeden
        case 15990:
            return 14;  // Wrath Kel'Thuzad
        case 33288:
            return 15;  // Yogg-Saron
        case 34564:
            return 16;  // Anub'arak
        case 36597:
            return 17;  // Lich King
        case 39863:
            return 18;  // Halion
        default:
            return 0;
    }
}
}  // namespace StrictEarnedProgressionPolicy

#endif
