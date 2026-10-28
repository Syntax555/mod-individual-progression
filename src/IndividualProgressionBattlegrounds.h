/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>
 * Released under the GNU AGPL v3 license:
 * https://github.com/azerothcore/azerothcore-wotlk/blob/master/LICENSE-AGPL3
 */

#ifndef INDIVIDUAL_PROGRESSION_BATTLEGROUNDS_H
#define INDIVIDUAL_PROGRESSION_BATTLEGROUNDS_H

#include "Define.h"

class Player;
class Battleground;

// 0: Vanilla, 1: TBC, 2: Wrath; 255: unavailable or unrestricted policy.
uint8 IndividualProgression_BattlegroundEra(Player* player);
bool IndividualProgression_CanJoinBattleground(Player* player, uint32 battlegroundType);
uint8 IndividualProgression_BattlegroundMatchEra(Battleground* battleground);

#endif
