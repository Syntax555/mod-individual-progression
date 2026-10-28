/*
    Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license: https://github.com/azerothcore/azerothcore-wotlk/blob/master/LICENSE-AGPL3
*/

#include "EarnedEraRidingPricesPolicy.h"
#include "IndividualProgression.h"

class IndividualProgressionEraRidingPrices : public PlayerScript
{
public:
    IndividualProgressionEraRidingPrices()
        : PlayerScript("IndividualProgressionEraRidingPrices", {PLAYERHOOK_ON_GET_TRAINER_SPELL_COST})
    {
    }

    void OnPlayerGetTrainerSpellCost(Player const* player, Creature const* /*trainer*/, uint32 spellId,
                                     uint32& moneyCost) override
    {
        if (!player || !player->IsInWorld())
            return;

        uint8 const era = IndividualProgression_GetEarnedEra(const_cast<Player*>(player));
        moneyCost = EarnedEraRidingPricesPolicy::BaseCost(era, spellId, moneyCost);
    }
};

void AddSC_individual_progression_era_riding_prices()
{
    new IndividualProgressionEraRidingPrices();
}
