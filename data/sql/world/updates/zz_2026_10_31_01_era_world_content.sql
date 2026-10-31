-- Later-expansion world content stays out of reach until the character earns its
-- expansion: TBC content needs the rewarded TBC marker (66008), Wrath content the
-- Wrath marker (66013). Generated from the CMaNGOS world databases (classic-db
-- ec4f596, tbc-db ebe51a8, wotlk-db 78e8dc0): an entry absent from Classic arrived
-- with TBC, an entry absent from TBC too arrived with Wrath.
--
-- Creature and gameobject spawns on the old-world continents, and Wrath's in
-- Outland, get visibility conditions, which keep their AI and scripts. Quests and vendor items reachable before their expansion get
-- availability conditions on every existing alternative. Left alone: spawns of
-- modules and awareness scripts, invisible helpers, creatures that would attack
-- unseen, objects with collision or mechanics, objects of earlier quests, entries the
-- earlier database places at the same spot under another number, and quests or items
-- the earlier database knows by the same name.
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (19, 23, 30) AND `Comment` LIKE 'Era content: %';

-- TBC creatures on the old-world continents.
INSERT IGNORE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
SELECT 30, 0, `id`, `guid`, 0, 8, 0, 66008, 0, 0, 0, 0, 0, '', 'Era content: TBC creature'
FROM `creature` WHERE `id` IN (
    16287, 16288, 17092, 17093, 17094, 17095, 17097, 17098, 17099, 17100, 17103, 17104, 17105, 17106, 17109,
    17111, 17112, 17113, 17119, 17127, 17178, 17218, 17223, 17238, 17287, 17291, 17303, 17310, 17355, 17406,
    17409, 17412, 17531, 17541, 18165, 18221, 18241, 19855, 19905, 19906, 19907, 19908, 19910, 19914, 19918,
    19932, 19933, 19935, 20025, 20055, 20131, 20142, 20406, 21045, 21448, 22834, 22916, 22931, 22935, 22936,
    22985, 23050, 23090, 23103, 23128, 23131, 23536, 23566, 23567, 23568, 23569, 23570, 23571, 23572, 23573,
    23579, 23600, 23601, 23602, 23612, 23616, 23618, 23635, 23636, 23704, 23713, 23720, 23723, 23797, 23835,
    23843, 23892, 23896, 23905, 23942, 23949, 23950, 23969, 23979, 23995, 24025, 24208, 24366, 24729, 24734,
    25058, 25109, 26081, 27703, 27704, 27705, 28126, 29093, 29095
) AND `guid` IN (
    563, 564, 720, 1846, 3466, 4200, 6501, 6502, 6503, 6506, 6867, 8470, 8503, 8504, 8505, 8506, 8507, 8508,
    8509, 8510, 10496, 11215, 11271, 12600, 12603, 12813, 15318, 15540, 15938, 16571, 16596, 16599, 17284,
    17427, 17631, 18574, 18575, 18580, 18589, 18592, 18593, 18594, 18595, 18596, 18597, 18598, 18599, 18600,
    18601, 18603, 18604, 18605, 18606, 18608, 18609, 20428, 20946, 21232, 21699, 22780, 23088, 23089, 23090,
    23091, 23092, 23093, 23094, 23095, 23096, 23097, 23285, 23289, 23419, 23426, 23429, 23432, 23433, 23435,
    23436, 23437, 23438, 23439, 23440, 23450, 23451, 23453, 24051, 24762, 24763, 25169, 27825, 30449, 30509,
    30511, 30649, 30780, 30801, 30840, 30923, 30948, 31032, 31033, 31045, 31046, 31047, 31050, 31051, 31052,
    31053, 31054, 31055, 31065, 31069, 31072, 31074, 31075, 31328, 31330, 31332, 31333, 31383, 31555, 31571,
    31572, 31639, 31641, 31645, 31666, 31667, 31668, 31671, 31723, 31725, 31726, 31733, 31805, 31937, 31941,
    31942, 31943, 32035, 32054, 32055, 32066, 32101, 32102, 32107, 32325, 32327, 32789, 32809, 32859, 32911,
    32912, 32915, 32936, 32937, 33316, 33392, 33393, 33394, 33682, 33684, 33691, 33788, 33789, 33790, 33886,
    33900, 33924, 33926, 33927, 34007, 34141, 34142, 34182, 35095, 35096, 37032, 37033, 37036, 37038, 37039,
    39104, 41829, 42360, 42408, 43438, 44180, 44251, 45246, 47640, 49590, 49591, 79736, 80305, 83207, 83208,
    88299, 92983, 94505, 94506, 120784, 120801, 200150, 200151, 200152, 1975960
);

-- TBC gameobjects on the old-world continents.
INSERT IGNORE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
SELECT 30, 1, `id`, `guid`, 0, 8, 0, 66008, 0, 0, 0, 0, 0, '', 'Era content: TBC gameobject'
FROM `gameobject` WHERE `id` IN (
    15885, 181626, 181628, 181632, 181653, 181824, 182058, 182187, 182257, 182560, 184084, 184463, 184503,
    185004, 185322, 185475, 185476, 185491, 185492, 185494, 185495, 185503, 185504, 185518, 185566, 186241,
    186242, 186266, 186272, 186273, 186278, 186299, 186301, 186310, 186315, 186329, 186332, 186336, 186422,
    186423, 186424, 186432, 186441, 186450, 186463, 186475, 186807, 187290, 187292, 187294, 187295, 187296,
    187299, 187329, 187337
) AND `guid` IN (
    38, 84, 85, 171, 7456, 7502, 9124, 9126, 9128, 9134, 9153, 9158, 9175, 9176, 9183, 9212, 9219, 9221, 9991,
    10000, 10020, 10080, 10082, 10227, 10824, 11176, 11177, 11178, 11179, 11180, 11182, 11186, 11187, 11188,
    11189, 11190, 11191, 11192, 11193, 11194, 11419, 11709, 11712, 11713, 11714, 11715, 11716, 11717, 11718,
    11721, 11725, 11727, 11728, 11737, 11740, 11741, 11742, 11743, 11744, 11745, 11746, 11747, 11748, 11749,
    11750, 11751, 11752, 11753, 12468, 12496, 12497, 12892, 12903, 12914, 12921, 12923, 12995, 13010, 13133,
    13606, 13607, 13608, 13633, 13637, 13638, 13643, 13644, 13645, 13646, 13647, 13648, 13649, 13651, 13652,
    13653, 13654, 13658, 13659, 13660, 13661, 13662, 13663, 13664, 13665, 13666, 13667, 13668, 13750, 13751,
    13752, 13754, 13756, 14003, 14602, 14603, 14605, 14606, 14610, 14614, 14615, 14617, 14620, 14621, 14622,
    14623, 14624, 14641, 14668, 14672, 14673, 14674, 14849, 14850, 14851, 14920, 14922, 14923, 14924, 14925,
    14929, 14933, 14934, 14935, 14936, 14937, 14938, 14939, 14940, 14941, 14942, 14944, 14957, 14958, 15752,
    15772, 17269, 17352, 17353, 18221, 18566, 18876, 18877, 18878, 18879, 18880, 18881, 18882, 18883, 18884,
    20621, 21607, 30215, 30217, 30219, 30221, 30835, 32113, 32868, 32870, 32882, 33558, 40745, 40746, 40747,
    40749, 40750, 40751, 40752, 40753, 40754, 40755, 40756, 40760, 40762, 40764, 40766, 40768, 40769, 40770,
    40771, 40774, 40775, 40777, 40779, 40781, 40783, 40785, 40786, 40787, 40788, 40789, 40790, 40791, 40792,
    40794, 40798, 40800, 40802, 40804, 40806, 40807, 40809, 40810, 40811, 40813, 40814, 40816, 40818, 40819,
    40820, 40826, 40827, 40829, 40830, 40831, 40834, 40835, 40836, 40837, 40838, 40839, 40840, 40841, 41911,
    41912, 41913, 41914, 44715, 44716, 44984, 45029, 45030, 45069, 45132, 45493, 45752, 45882, 45883, 45884,
    45885, 48447, 48641, 49095, 49218, 49219, 49220, 49221, 49222, 49224, 49227, 49228, 49229, 49230, 49231,
    49232, 49233, 49234, 49235, 49236, 49237, 49238, 49239, 49240, 49241, 49242, 49243, 49244, 49245, 49246,
    49247, 49248, 49249, 49250, 49251, 49252, 49253, 49254, 49256, 49257, 49258, 49259, 49260, 49261, 49262,
    49263, 49264, 49265, 49266, 49267, 49268, 49269, 49270, 49434, 49804, 49821, 49822, 50005, 50006, 50007,
    50356, 50357, 61893, 99849, 99855, 99858, 99859, 99860, 99867, 99922, 99923, 268872, 268881
);

-- TBC quests reachable earlier; every existing alternative keeps its own conditions.
INSERT IGNORE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
SELECT DISTINCT 19, 0, q.`ID`, 0, COALESCE(c.`ElseGroup`, 0), 8, 0, 66008, 0, 0, 0, 0, 0, '', 'Era content: TBC quest'
FROM `quest_template` q
LEFT JOIN `conditions` c ON c.`SourceTypeOrReferenceId` = 19 AND c.`SourceGroup` = 0 AND c.`SourceEntry` = q.`ID` AND c.`SourceId` = 0
WHERE q.`ID` IN (
    9400, 9405, 9431, 9433, 9434, 9435, 9436, 9437, 9438, 9439, 9440, 9441, 9443, 9444, 9446, 9448, 9457,
    9469, 9470, 9471, 9474, 9475, 9476, 9495, 9516, 9517, 9518, 9519, 9520, 9521, 9522, 9526, 9533, 9534,
    9535, 9536, 9601, 9609, 9813, 9829, 10121, 10136, 10212, 10279, 10390, 10391, 10392, 10460, 10461, 10462,
    10463, 10464, 10465, 10466, 10467, 10468, 10469, 10470, 10471, 10472, 10473, 10474, 10475, 10590, 10592,
    10593, 10752, 10756, 10789, 10790, 10876, 10891, 10892, 10955, 10965, 11103, 11104, 11105, 11106, 11123,
    11124, 11126, 11128, 11129, 11133, 11134, 11136, 11137, 11138, 11139, 11140, 11141, 11142, 11143, 11144,
    11145, 11146, 11147, 11148, 11149, 11150, 11151, 11152, 11156, 11158, 11159, 11160, 11161, 11162, 11169,
    11172, 11173, 11174, 11177, 11180, 11181, 11183, 11184, 11185, 11186, 11191, 11192, 11193, 11194, 11198,
    11200, 11201, 11203, 11204, 11205, 11206, 11207, 11208, 11209, 11210, 11211, 11212, 11213, 11214, 11215,
    11217, 11222, 11223, 11225, 11531, 12513
);

-- TBC items sold by vendors that are visible earlier.
INSERT IGNORE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
SELECT DISTINCT 23, v.`entry`, v.`item`, 0, 0, 8, 0, 66008, 0, 0, 0, 0, 0, '', 'Era content: TBC vendor item'
FROM `npc_vendor` v
WHERE (v.`entry` = 151 AND v.`item` IN (28979))
   OR (v.`entry` = 152 AND v.`item` IN (28979))
   OR (v.`entry` = 491 AND v.`item` IN (28979))
   OR (v.`entry` = 734 AND v.`item` IN (29013, 29014))
   OR (v.`entry` = 829 AND v.`item` IN (28979))
   OR (v.`entry` = 989 AND v.`item` IN (21941))
   OR (v.`entry` = 1148 AND v.`item` IN (21943))
   OR (v.`entry` = 1149 AND v.`item` IN (29013, 29014))
   OR (v.`entry` = 1250 AND v.`item` IN (28979))
   OR (v.`entry` = 1285 AND v.`item` IN (28979, 29013, 29014))
   OR (v.`entry` = 1286 AND v.`item` IN (20856))
   OR (v.`entry` = 1448 AND v.`item` IN (20970))
   OR (v.`entry` = 1457 AND v.`item` IN (21835, 21927, 22053, 22054, 22055))
   OR (v.`entry` = 1682 AND v.`item` IN (28979))
   OR (v.`entry` = 1685 AND v.`item` IN (28979))
   OR (v.`entry` = 1691 AND v.`item` IN (28979))
   OR (v.`entry` = 2084 AND v.`item` IN (29013, 29014))
   OR (v.`entry` = 2115 AND v.`item` IN (28979))
   OR (v.`entry` = 2134 AND v.`item` IN (28979))
   OR (v.`entry` = 2140 AND v.`item` IN (28979))
   OR (v.`entry` = 2381 AND v.`item` IN (20971, 20973))
   OR (v.`entry` = 2393 AND v.`item` IN (20971))
   OR (v.`entry` = 2401 AND v.`item` IN (29013, 29014))
   OR (v.`entry` = 2622 AND v.`item` IN (21835, 21927, 22053, 22054, 22055))
   OR (v.`entry` = 2803 AND v.`item` IN (29013, 29014))
   OR (v.`entry` = 2806 AND v.`item` IN (29013, 29014))
   OR (v.`entry` = 2808 AND v.`item` IN (29013, 29014))
   OR (v.`entry` = 2810 AND v.`item` IN (21942))
   OR (v.`entry` = 2820 AND v.`item` IN (29013, 29014))
   OR (v.`entry` = 2821 AND v.`item` IN (21942))
   OR (v.`entry` = 2908 AND v.`item` IN (29013, 29014))
   OR (v.`entry` = 3072 AND v.`item` IN (28979))
   OR (v.`entry` = 3076 AND v.`item` IN (28979))
   OR (v.`entry` = 3090 AND v.`item` IN (21835, 21927, 22053, 22054, 22055))
   OR (v.`entry` = 3135 AND v.`item` IN (21835, 21927, 22053, 22054, 22055))
   OR (v.`entry` = 3158 AND v.`item` IN (28979))
   OR (v.`entry` = 3164 AND v.`item` IN (28979))
   OR (v.`entry` = 3186 AND v.`item` IN (28979))
   OR (v.`entry` = 3350 AND v.`item` IN (29013, 29014))
   OR (v.`entry` = 3367 AND v.`item` IN (20856))
   OR (v.`entry` = 3392 AND v.`item` IN (20815, 20824))
   OR (v.`entry` = 3481 AND v.`item` IN (28979))
   OR (v.`entry` = 3499 AND v.`item` IN (20855))
   OR (v.`entry` = 3541 AND v.`item` IN (29013, 29014))
   OR (v.`entry` = 3542 AND v.`item` IN (21835, 21927, 22053, 22054, 22055))
   OR (v.`entry` = 3546 AND v.`item` IN (23848))
   OR (v.`entry` = 3551 AND v.`item` IN (21835, 21927, 22053, 22054, 22055))
   OR (v.`entry` = 3561 AND v.`item` IN (21835, 21927, 22053, 22054, 22055))
   OR (v.`entry` = 3587 AND v.`item` IN (28979))
   OR (v.`entry` = 3608 AND v.`item` IN (28979))
   OR (v.`entry` = 3954 AND v.`item` IN (20855))
   OR (v.`entry` = 3969 AND v.`item` IN (21835, 21927, 22053, 22054, 22055))
   OR (v.`entry` = 4170 AND v.`item` IN (25876, 28979, 29010, 29013, 29014))
   OR (v.`entry` = 4182 AND v.`item` IN (28979))
   OR (v.`entry` = 4229 AND v.`item` IN (20854))
   OR (v.`entry` = 4241 AND v.`item` IN (25873, 25875, 25876, 28979, 29009, 29010, 29013, 29014))
   OR (v.`entry` = 4555 AND v.`item` IN (25872, 25873, 25875, 25876, 29007, 29008, 29009, 29010, 29013, 29014))
   OR (v.`entry` = 4561 AND v.`item` IN (20854))
   OR (v.`entry` = 4585 AND v.`item` IN (21835, 21927, 22053, 22054, 22055))
   OR (v.`entry` = 4775 AND v.`item` IN (20975))
   OR (v.`entry` = 4877 AND v.`item` IN (20970))
   OR (v.`entry` = 4896 AND v.`item` IN (29013, 29014))
   OR (v.`entry` = 4897 AND v.`item` IN (21941, 21943))
   OR (v.`entry` = 5049 AND v.`item` IN (23999, 31774, 31775, 31776, 31777, 31778, 31779, 31780, 31781, 31804, 32445, 32828, 35221))
   OR (v.`entry` = 5101 AND v.`item` IN (29013, 29014))
   OR (v.`entry` = 5163 AND v.`item` IN (20975, 21948))
   OR (v.`entry` = 5169 AND v.`item` IN (21835, 21927, 22053, 22054, 22055))
   OR (v.`entry` = 5190 AND v.`item` IN (24004, 31773, 31775, 31776, 31777, 31778, 31779, 31780, 31781, 31804, 32445, 32828, 35221))
   OR (v.`entry` = 5191 AND v.`item` IN (23999, 31774, 31775, 31776, 31777, 31778, 31779, 31780, 31781, 31804, 32445, 32828, 35221))
   OR (v.`entry` = 5193 AND v.`item` IN (23999, 31774))
   OR (v.`entry` = 6746 AND v.`item` IN (27857))
   OR (v.`entry` = 6779 AND v.`item` IN (21835, 21927, 22053, 22054, 22055))
   OR (v.`entry` = 7942 AND v.`item` IN (29013, 29014))
   OR (v.`entry` = 8139 AND v.`item` IN (29013, 29014))
   OR (v.`entry` = 8362 AND v.`item` IN (28979, 29013, 29014))
   OR (v.`entry` = 8363 AND v.`item` IN (21948))
   OR (v.`entry` = 9499 AND v.`item` IN (38427, 38428, 38429, 38430, 38431, 38432, 38466))
   OR (v.`entry` = 9636 AND v.`item` IN (20973))
   OR (v.`entry` = 11038 AND v.`item` IN (29013, 29014))
   OR (v.`entry` = 11185 AND v.`item` IN (32381))
   OR (v.`entry` = 11189 AND v.`item` IN (21957))
   OR (v.`entry` = 11555 AND v.`item` IN (29013, 29014))
   OR (v.`entry` = 12021 AND v.`item` IN (29013, 29014))
   OR (v.`entry` = 12027 AND v.`item` IN (29013, 29014))
   OR (v.`entry` = 12777 AND v.`item` IN (29594, 29595, 29596, 29597, 29598, 29599, 29606, 29607, 29608, 29609, 29610, 29611))
   OR (v.`entry` = 12792 AND v.`item` IN (29600, 29601, 29602, 29603, 29604, 29605))
   OR (v.`entry` = 12941 AND v.`item` IN (21954))
   OR (v.`entry` = 12959 AND v.`item` IN (29013, 29014))
   OR (v.`entry` = 12960 AND v.`item` IN (29013, 29014))
   OR (v.`entry` = 14624 AND v.`item` IN (29013, 29014))
   OR (v.`entry` = 15165 AND v.`item` IN (37915, 38327, 38328))
   OR (v.`entry` = 15174 AND v.`item` IN (29013, 29014))
   OR (v.`entry` = 15175 AND v.`item` IN (21835, 21927, 22053, 22054, 22055))
   OR (v.`entry` = 15179 AND v.`item` IN (21952))
   OR (v.`entry` = 24834 AND v.`item` IN (30817))
   OR (v.`entry` = 24843 AND v.`item` IN (22147, 22148))
   OR (v.`entry` = 24935 AND v.`item` IN (22147, 22148))
   OR (v.`entry` = 24993 AND v.`item` IN (30817))
   OR (v.`entry` = 24995 AND v.`item` IN (22147, 22148))
   OR (v.`entry` = 25019 AND v.`item` IN (22147, 22148))
   OR (v.`entry` = 25020 AND v.`item` IN (30817))
   OR (v.`entry` = 25089 AND v.`item` IN (30817));

-- Wrath creatures on the old-world continents and Outland.
INSERT IGNORE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
SELECT 30, 0, `id`, `guid`, 0, 8, 0, 66013, 0, 0, 0, 0, 0, '', 'Era content: Wrath creature'
FROM `creature` WHERE `id` IN (
    26537, 26539, 26546, 26548, 27928, 28092, 28347, 28355, 28486, 28488, 28489, 28490, 28491, 28500, 28650,
    29016, 29019, 29088, 29141, 29142, 29143, 29144, 29152, 29154, 29194, 29195, 29196, 29202, 29203, 29205,
    29207, 29208, 29212, 29239, 29246, 29287, 29288, 29289, 29290, 29291, 29292, 29293, 29294, 29295, 29296,
    29297, 29298, 29299, 29300, 29480, 29587, 29712, 29725, 29728, 29865, 29866, 29867, 29868, 29873, 30217,
    30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 30723, 30724, 30727, 30729, 30730,
    30731, 30732, 30733, 30734, 30735, 32346, 32547, 33638, 33642, 33679, 33712, 33713, 33996, 34155, 34158,
    34238, 34526, 34528, 34765, 34766, 34986, 35068, 35073, 35168, 35169, 35281, 35364, 35365, 35477, 36479,
    36481, 37072, 37888, 37915, 39263, 39275, 39386, 39396, 39623, 39675, 39678, 39711, 40405
) AND `guid` IN (
    37, 1550, 3548, 10497, 34033, 34034, 34037, 34039, 34040, 34041, 34042, 34043, 34044, 34045, 42161, 45215,
    45216, 47642, 47646, 48343, 49578, 49579, 49580, 49581, 49582, 49583, 49584, 49585, 49586, 49587, 49588,
    49589, 49592, 49649, 75090, 83209, 83210, 83211, 83212, 83213, 83214, 83215, 83216, 83217, 83218, 83219,
    83220, 83221, 83222, 83223, 83224, 83225, 83226, 83227, 83228, 83229, 83230, 83231, 83232, 83233, 83234,
    83235, 83245, 83246, 83247, 83248, 83249, 83250, 83251, 83252, 83253, 83255, 83257, 83258, 83259, 84645,
    88157, 88164, 88227, 88241, 88246, 88274, 88275, 96270, 97112, 120600, 120602, 120607, 120608, 120609,
    120610, 120611, 120612, 120613, 120614, 120615, 120616, 120617, 120618, 120619, 120620, 120621, 120622,
    120623, 120624, 120625, 120626, 120627, 120628, 120629, 120630, 120631, 120632, 120633, 120634, 120635,
    120636, 120637, 120638, 120676, 120704, 120705, 120706, 120707, 120708, 120709, 120710, 120711, 120712,
    120713, 120714, 120715, 120716, 120720, 120721, 120722, 120723, 120724, 120725, 120779, 120780, 120781,
    120782, 120783, 120786, 120795, 120797, 120798, 120799, 120802, 120826, 125641, 125642, 125643, 125644,
    125645, 125646, 125647, 125648, 125651, 125712, 125713, 125714, 125715, 125716, 125717, 125718, 125719,
    125721, 125722, 125723, 125724, 125725, 125726, 125727, 125728, 125729, 125730, 125731, 125732, 125733,
    125734, 125735, 125736, 125737, 125738, 125739, 125740, 125741, 125742, 125743, 125744, 125745, 125746,
    125747, 125748, 125749, 125750, 125751, 125752, 125753, 125754, 125755, 125756, 125757, 125758, 125759,
    125760, 125761, 125762, 125766, 125768, 125769, 125770, 125771, 125772, 125773, 125774, 125775, 125776,
    125777, 125778, 125779, 125780, 125781, 125782, 125783, 125784, 125785, 125786, 125787, 125788, 125789,
    125790, 125791, 125792, 125793, 125794, 125795, 125796, 125797, 125798, 125799, 125800, 125801, 125802,
    125803, 125804, 125805, 125807, 125808, 125809, 125810, 125811, 125824, 125825, 125826, 125827, 125828,
    125829, 125830, 125831, 125832, 125833, 125834, 125838, 125839, 125840, 125841, 125842, 125843, 125844,
    125845, 125846, 125847, 125848, 125849, 125850, 125851, 125852, 125853, 125854, 125855, 125856, 125857,
    125858, 125859, 125860, 125861, 125862, 125863, 125864, 125865, 125866, 125867, 125868, 125869, 125870,
    135120, 137646, 137653, 137654, 145354, 145355, 145356, 145357, 145358, 145359, 145360, 145361, 145362,
    145363, 145364, 145365, 145423, 145424, 145425, 145426, 150154, 150155, 200117, 200144, 200818, 200877,
    202482, 202771, 202844, 202845, 203459, 203461, 203466, 203467, 203468, 203469, 203470, 203471, 203472,
    203473, 203474, 203475, 203476, 203477, 203478, 203479, 203480, 203481, 203482, 203483, 203484, 203485,
    203490, 203491, 207172, 207173, 207187, 207188, 207189, 207190, 207191, 207192, 207193, 207197, 207198,
    207199, 207200, 207201, 207202, 207203, 207204, 207205, 207206, 207207, 207208, 207209, 1976212
);

-- Wrath gameobjects on the old-world continents and Outland.
INSERT IGNORE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
SELECT 30, 1, `id`, `guid`, 0, 8, 0, 66013, 0, 0, 0, 0, 0, '', 'Era content: Wrath gameobject'
FROM `gameobject` WHERE `id` IN (
    180414, 187912, 188167, 188168, 188169, 188170, 190557, 190671, 190683, 190684, 190697, 190698, 190699,
    190704, 190710, 190711, 190712, 190713, 190714, 190715, 191206, 191383, 191384, 191385, 191503, 191504,
    191505, 191506, 191507, 191508, 191540, 191541, 191746, 191747, 191748, 191817, 192612, 192835, 193955,
    193981, 194340, 194466, 194467, 194468, 194498, 195022, 195037, 195139, 195140, 195218, 195219, 195457,
    195458, 195459, 195467, 195468, 195528, 195529, 195530, 195554, 195555, 195556, 195557, 195558, 195559,
    195560, 195561, 195603, 195605, 195606, 195607, 195608, 195609, 195610, 195611, 195612, 195613, 195614,
    195615, 195616, 195617, 195618, 195619, 195620, 195624, 195625, 195626, 195627, 195629, 196417, 202081,
    202082, 202275, 202564, 202713
) AND `guid` IN (
    50, 164, 170, 364, 465, 466, 467, 504, 505, 931, 932, 933, 1160, 4718, 4958, 5136, 5496, 12365, 12366,
    14990, 14991, 14992, 14993, 14994, 14995, 14996, 14997, 14998, 23299, 23300, 23301, 23302, 23303, 23304,
    23305, 23306, 23307, 23308, 23309, 23310, 23311, 23312, 23313, 23314, 23315, 23316, 54960, 54962, 54964,
    54965, 54966, 55884, 60195, 60857, 61022, 61023, 61024, 61952, 61967, 61997, 61998, 62000, 63170, 63171,
    63172, 63173, 63174, 63175, 63176, 63177, 63178, 63179, 63181, 63183, 63184, 63185, 63188, 63189, 63191,
    63192, 63193, 66336, 66392, 66396, 66476, 81131, 81132, 81133, 81134, 81135, 81136, 81561, 81562, 81563,
    81564, 81565, 81566, 81674, 92053, 100030, 100031, 100032, 100033, 100034, 100035, 100036, 100037, 100038,
    100039, 100040, 100041, 100042, 100043, 100044, 100045, 100046, 100047, 100048, 100049, 100050, 100051,
    100052, 100053, 100156, 100158, 100159, 100257, 100431, 100499, 100500, 100502, 100503, 100505, 100506,
    121573, 121574, 121575, 150114, 150115, 150736, 150737, 150738, 150739, 150740, 150741, 150742, 150743,
    150744, 150745, 150746, 150747, 150748, 150749, 150750, 150751, 150752, 150753, 150754, 150756, 151239,
    151240, 151241, 151242, 151244, 151245, 151246, 151247, 151248, 151249, 151250, 151251, 151252, 151253,
    151254, 151255, 151271, 151272, 151273, 151274, 151275, 151276, 151277, 151888, 268683, 2133395
);

-- Wrath quests reachable earlier; every existing alternative keeps its own conditions.
INSERT IGNORE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
SELECT DISTINCT 19, 0, q.`ID`, 0, COALESCE(c.`ElseGroup`, 0), 8, 0, 66013, 0, 0, 0, 0, 0, '', 'Era content: Wrath quest'
FROM `quest_template` q
LEFT JOIN `conditions` c ON c.`SourceTypeOrReferenceId` = 19 AND c.`SourceGroup` = 0 AND c.`SourceEntry` = q.`ID` AND c.`SourceId` = 0
WHERE q.`ID` IN (
    7702, 12547, 12797, 13074, 13075, 13082, 13148, 13850, 13887, 13906, 14079, 14081, 14082, 14083, 14084,
    14085, 14086, 14087, 14088, 14089, 14095, 14100, 14111, 14160, 24428, 24429, 25199, 25212, 25283, 25286,
    25500
);

-- Wrath items sold by vendors that are visible earlier.
INSERT IGNORE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
SELECT DISTINCT 23, v.`entry`, v.`item`, 0, 0, 8, 0, 66013, 0, 0, 0, 0, 0, '', 'Era content: Wrath vendor item'
FROM `npc_vendor` v
WHERE (v.`entry` = 66 AND v.`item` IN (39354))
   OR (v.`entry` = 777 AND v.`item` IN (39354))
   OR (v.`entry` = 960 AND v.`item` IN (39354))
   OR (v.`entry` = 983 AND v.`item` IN (37201))
   OR (v.`entry` = 1250 AND v.`item` IN (39354))
   OR (v.`entry` = 1257 AND v.`item` IN (44605, 44614, 44615))
   OR (v.`entry` = 1275 AND v.`item` IN (44605, 44614, 44615))
   OR (v.`entry` = 1308 AND v.`item` IN (44605, 44614, 44615))
   OR (v.`entry` = 1351 AND v.`item` IN (44605, 44614, 44615))
   OR (v.`entry` = 1456 AND v.`item` IN (39354))
   OR (v.`entry` = 1457 AND v.`item` IN (43230, 43231, 43232, 43233, 43234, 43235, 43237))
   OR (v.`entry` = 1463 AND v.`item` IN (37201))
   OR (v.`entry` = 1465 AND v.`item` IN (39354))
   OR (v.`entry` = 1673 AND v.`item` IN (37201))
   OR (v.`entry` = 1692 AND v.`item` IN (39354))
   OR (v.`entry` = 2381 AND v.`item` IN (39354))
   OR (v.`entry` = 2393 AND v.`item` IN (39354))
   OR (v.`entry` = 2622 AND v.`item` IN (43230, 43231, 43232, 43233, 43234, 43235, 43237))
   OR (v.`entry` = 2805 AND v.`item` IN (37201))
   OR (v.`entry` = 3081 AND v.`item` IN (39354))
   OR (v.`entry` = 3090 AND v.`item` IN (43230, 43231, 43232, 43233, 43234, 43235, 43237))
   OR (v.`entry` = 3135 AND v.`item` IN (43230, 43231, 43232, 43233, 43234, 43235, 43237))
   OR (v.`entry` = 3168 AND v.`item` IN (39354))
   OR (v.`entry` = 3187 AND v.`item` IN (39354))
   OR (v.`entry` = 3335 AND v.`item` IN (44605, 44614, 44615))
   OR (v.`entry` = 3351 AND v.`item` IN (44605, 44614, 44615))
   OR (v.`entry` = 3392 AND v.`item` IN (44977))
   OR (v.`entry` = 3490 AND v.`item` IN (37201))
   OR (v.`entry` = 3500 AND v.`item` IN (37201))
   OR (v.`entry` = 3542 AND v.`item` IN (37201, 43230, 43231, 43232, 43233, 43234, 43235, 43237))
   OR (v.`entry` = 3556 AND v.`item` IN (39354))
   OR (v.`entry` = 3561 AND v.`item` IN (43230, 43231, 43232, 43233, 43234, 43235, 43237))
   OR (v.`entry` = 3562 AND v.`item` IN (37201, 44605, 44614, 44615))
   OR (v.`entry` = 3614 AND v.`item` IN (39354))
   OR (v.`entry` = 3700 AND v.`item` IN (37201))
   OR (v.`entry` = 3969 AND v.`item` IN (43230, 43231, 43232, 43233, 43234, 43235, 43237))
   OR (v.`entry` = 3970 AND v.`item` IN (37201))
   OR (v.`entry` = 4083 AND v.`item` IN (37201))
   OR (v.`entry` = 4194 AND v.`item` IN (39354))
   OR (v.`entry` = 4220 AND v.`item` IN (37201, 44605, 44614, 44615))
   OR (v.`entry` = 4453 AND v.`item` IN (39684, 40533))
   OR (v.`entry` = 4562 AND v.`item` IN (37201))
   OR (v.`entry` = 4575 AND v.`item` IN (37201, 44605, 44614, 44615))
   OR (v.`entry` = 4730 AND v.`item` IN (47100))
   OR (v.`entry` = 4877 AND v.`item` IN (39354))
   OR (v.`entry` = 4878 AND v.`item` IN (37201))
   OR (v.`entry` = 5100 AND v.`item` IN (39354))
   OR (v.`entry` = 5110 AND v.`item` IN (37201, 44605, 44614, 44615))
   OR (v.`entry` = 5151 AND v.`item` IN (37201, 44605, 44614, 44615))
   OR (v.`entry` = 5169 AND v.`item` IN (43230, 43231, 43232, 43233, 43234, 43235, 43237))
   OR (v.`entry` = 6301 AND v.`item` IN (39354))
   OR (v.`entry` = 6746 AND v.`item` IN (33443, 35952))
   OR (v.`entry` = 6779 AND v.`item` IN (43230, 43231, 43232, 43233, 43234, 43235, 43237))
   OR (v.`entry` = 7947 AND v.`item` IN (39354))
   OR (v.`entry` = 8145 AND v.`item` IN (39354))
   OR (v.`entry` = 9636 AND v.`item` IN (39354))
   OR (v.`entry` = 11185 AND v.`item` IN (39684, 40533))
   OR (v.`entry` = 11557 AND v.`item` IN (38426))
   OR (v.`entry` = 12022 AND v.`item` IN (39354))
   OR (v.`entry` = 12028 AND v.`item` IN (39354))
   OR (v.`entry` = 12043 AND v.`item` IN (39354))
   OR (v.`entry` = 13476 AND v.`item` IN (37201))
   OR (v.`entry` = 14739 AND v.`item` IN (37201))
   OR (v.`entry` = 15165 AND v.`item` IN (38426))
   OR (v.`entry` = 15175 AND v.`item` IN (37201, 43230, 43231, 43232, 43233, 43234, 43235, 43237))
   OR (v.`entry` = 16015 AND v.`item` IN (37201))
   OR (v.`entry` = 16224 AND v.`item` IN (39354))
   OR (v.`entry` = 16261 AND v.`item` IN (39354))
   OR (v.`entry` = 16262 AND v.`item` IN (39354))
   OR (v.`entry` = 16268 AND v.`item` IN (43230, 43231, 43232, 43233, 43234, 43235, 43237))
   OR (v.`entry` = 16366 AND v.`item` IN (38426))
   OR (v.`entry` = 16367 AND v.`item` IN (40411))
   OR (v.`entry` = 16588 AND v.`item` IN (37201))
   OR (v.`entry` = 16611 AND v.`item` IN (37201, 44605, 44614, 44615))
   OR (v.`entry` = 16612 AND v.`item` IN (37201, 40411, 44605, 44614, 44615))
   OR (v.`entry` = 16618 AND v.`item` IN (33444, 33445, 33451, 33454, 35951, 35953, 35954))
   OR (v.`entry` = 16638 AND v.`item` IN (38426))
   OR (v.`entry` = 16641 AND v.`item` IN (40411))
   OR (v.`entry` = 16657 AND v.`item` IN (39684, 40533))
   OR (v.`entry` = 16683 AND v.`item` IN (43230, 43231, 43232, 43233, 43234, 43235, 43237))
   OR (v.`entry` = 16689 AND v.`item` IN (38426))
   OR (v.`entry` = 16705 AND v.`item` IN (40411))
   OR (v.`entry` = 16706 AND v.`item` IN (37201, 40411, 44605, 44614, 44615))
   OR (v.`entry` = 16739 AND v.`item` IN (33444, 33445, 33449, 33451, 33454, 35950, 35951, 35953, 35954))
   OR (v.`entry` = 16748 AND v.`item` IN (38426))
   OR (v.`entry` = 16757 AND v.`item` IN (37201, 44605, 44614, 44615))
   OR (v.`entry` = 16767 AND v.`item` IN (38426))
   OR (v.`entry` = 16782 AND v.`item` IN (39684, 40533))
   OR (v.`entry` = 16829 AND v.`item` IN (37201, 40411))
   OR (v.`entry` = 17222 AND v.`item` IN (39684, 40533))
   OR (v.`entry` = 17421 AND v.`item` IN (39684, 40533))
   OR (v.`entry` = 17490 AND v.`item` IN (39354))
   OR (v.`entry` = 17518 AND v.`item` IN (37201))
   OR (v.`entry` = 17630 AND v.`item` IN (33443, 33444, 33445, 33449, 33454, 35948, 35949, 35950, 35952, 35953, 35954))
   OR (v.`entry` = 18005 AND v.`item` IN (40411))
   OR (v.`entry` = 18006 AND v.`item` IN (37201, 43230, 43231, 43232, 43233, 43234, 43235, 43237))
   OR (v.`entry` = 18017 AND v.`item` IN (37201))
   OR (v.`entry` = 18019 AND v.`item` IN (37201))
   OR (v.`entry` = 18243 AND v.`item` IN (37201))
   OR (v.`entry` = 18277 AND v.`item` IN (38426))
   OR (v.`entry` = 18278 AND v.`item` IN (39684, 40533))
   OR (v.`entry` = 18426 AND v.`item` IN (39354))
   OR (v.`entry` = 18427 AND v.`item` IN (39354))
   OR (v.`entry` = 18484 AND v.`item` IN (39684, 40533))
   OR (v.`entry` = 18749 AND v.`item` IN (38426))
   OR (v.`entry` = 18752 AND v.`item` IN (39684, 40533))
   OR (v.`entry` = 18754 AND v.`item` IN (38426))
   OR (v.`entry` = 18771 AND v.`item` IN (38426))
   OR (v.`entry` = 18772 AND v.`item` IN (38426))
   OR (v.`entry` = 18775 AND v.`item` IN (39684, 40533))
   OR (v.`entry` = 18802 AND v.`item` IN (37201))
   OR (v.`entry` = 18998 AND v.`item` IN (37201))
   OR (v.`entry` = 19004 AND v.`item` IN (37201))
   OR (v.`entry` = 19013 AND v.`item` IN (37201))
   OR (v.`entry` = 19014 AND v.`item` IN (37201))
   OR (v.`entry` = 19074 AND v.`item` IN (40411))
   OR (v.`entry` = 19196 AND v.`item` IN (38426))
   OR (v.`entry` = 19213 AND v.`item` IN (38426))
   OR (v.`entry` = 19235 AND v.`item` IN (37201))
   OR (v.`entry` = 19383 AND v.`item` IN (39684, 40533))
   OR (v.`entry` = 19521 AND v.`item` IN (38426))
   OR (v.`entry` = 19532 AND v.`item` IN (38426))
   OR (v.`entry` = 19535 AND v.`item` IN (37201))
   OR (v.`entry` = 19678 AND v.`item` IN (37201))
   OR (v.`entry` = 19679 AND v.`item` IN (37201))
   OR (v.`entry` = 19718 AND v.`item` IN (37201))
   OR (v.`entry` = 19722 AND v.`item` IN (38426))
   OR (v.`entry` = 19837 AND v.`item` IN (40411))
   OR (v.`entry` = 20081 AND v.`item` IN (37201))
   OR (v.`entry` = 20092 AND v.`item` IN (37201))
   OR (v.`entry` = 20121 AND v.`item` IN (43230, 43231, 43232, 43233, 43234, 43235, 43237))
   OR (v.`entry` = 20890 AND v.`item` IN (39684, 40533))
   OR (v.`entry` = 20915 AND v.`item` IN (37201))
   OR (v.`entry` = 20989 AND v.`item` IN (40411))
   OR (v.`entry` = 21085 AND v.`item` IN (38426))
   OR (v.`entry` = 22479 AND v.`item` IN (37201))
   OR (v.`entry` = 23112 AND v.`item` IN (37201))
   OR (v.`entry` = 23145 AND v.`item` IN (37201))
   OR (v.`entry` = 23157 AND v.`item` IN (37201))
   OR (v.`entry` = 23373 AND v.`item` IN (37201))
   OR (v.`entry` = 23560 AND v.`item` IN (37201))
   OR (v.`entry` = 24843 AND v.`item` IN (37201))
   OR (v.`entry` = 24935 AND v.`item` IN (37201))
   OR (v.`entry` = 24995 AND v.`item` IN (37201))
   OR (v.`entry` = 25010 AND v.`item` IN (37201))
   OR (v.`entry` = 25019 AND v.`item` IN (37201))
   OR (v.`entry` = 25051 AND v.`item` IN (37201))
   OR (v.`entry` = 25082 AND v.`item` IN (37201))
   OR (v.`entry` = 27711 AND v.`item` IN (39684, 40533));
