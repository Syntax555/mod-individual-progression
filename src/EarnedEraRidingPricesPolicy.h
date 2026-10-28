/*
    Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license: https://github.com/azerothcore/azerothcore-wotlk/blob/master/LICENSE-AGPL3
*/

#ifndef EARNED_ERA_RIDING_PRICES_POLICY_H
#define EARNED_ERA_RIDING_PRICES_POLICY_H

#include <cstdint>

namespace EarnedEraRidingPricesPolicy
{
// Undiscounted copper, using late Vanilla (1.12.1), original TBC (2.4.3),
// and the pinned Wrath trainer table. This changes costs, not availability.
constexpr std::uint32_t BaseCost(std::uint8_t era, std::uint32_t spellId, std::uint32_t configuredCost)
{
    if (era > 2)
        return configuredCost;

    switch (spellId)
    {
        case 33388: // Apprentice Riding
            return era == 0 ? 900000 : era == 1 ? 350000 : 40000;
        case 33391: // Journeyman Riding
            return era == 0 ? 9000000 : era == 1 ? 6000000 : 500000;
        case 34090: // Expert Riding
            return era == 0 ? configuredCost : era == 1 ? 8000000 : 2500000;
        case 34091: // Artisan Riding
            return era == 0 ? configuredCost : 50000000;
        default:
            return configuredCost;
    }
}
}

#endif
