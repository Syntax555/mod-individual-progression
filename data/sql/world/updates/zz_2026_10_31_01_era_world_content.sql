-- World content of later expansions and patches stays out of reach until the character
-- earns the milestone of its tier: TBC content needs the rewarded marker of tier 8 (66008),
-- Wrath content tier 13 (66013), and each patch the tier of its raid. Generated from the
-- CMaNGOS world databases (classic-db ec4f596, tbc-db ebe51a8, wotlk-db 78e8dc0): an entry
-- absent from Classic arrived with TBC, an entry absent from TBC too arrived with Wrath.
-- VMaNGOS (core 9b7fb4d, world dump of 14 June 2021) dates Vanilla content to its patch:
-- 1.6 opens with tier 1, 1.7, 1.8 and 1.10 with tier 3, 1.9 with tier 4, 1.11 and 1.12
-- with tier 6. ChromieCraft's progression brackets (9235693) date TBC and Wrath phases:
-- 2.1 with tier 10, 2.3 and 2.4 with 12, 3.1 with 14, 3.2 with 15, 3.3 with 16, 3.3.5 with 17.
--
-- Spawns on the old-world continents, and a later tier's in Outland or Northrend, get
-- visibility conditions, which keep their AI and scripts; a hidden creature does not
-- perceive the character either, so it neither shows nor engages. Quests and vendor
-- items reachable before their tier get availability conditions on every existing
-- alternative. Left alone: spawns of modules and awareness scripts, invisible helpers,
-- spirit healers, objects with collision or mechanics, creatures and objects that
-- earlier quests use or that drop their quest items, entries the earlier database
-- places at the same spot under another number, quests or items the earlier database
-- knows by the same name, and for Vanilla patches Classic battlegrounds, holidays and
-- Individual Progression's own placements.
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (19, 23, 30) AND `Comment` LIKE 'Era content: %';

-- Vanilla creatures opening at tier 1.
INSERT IGNORE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
SELECT 30, 0, `id`, `guid`, 0, 8, 0, 66001, 0, 0, 0, 0, 0, '', 'Era content: Vanilla creature'
FROM `creature` WHERE `id` IN (
    10378, 14850, 14857, 14859, 14872, 14873, 14874, 14875, 14876, 14892, 14893, 14894, 14908, 14909, 14912,
    14921
) AND `guid` IN (
    280, 281, 282, 283, 284, 285, 286, 287, 366, 391, 2368, 13093, 13166, 13170, 13178, 13179, 13180, 13578,
    13579, 13586, 13587, 13588, 13589, 13964, 13980, 15033, 200615
);

-- Vanilla gameobjects opening at tier 1.
INSERT IGNORE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
SELECT 30, 1, `id`, `guid`, 0, 8, 0, 66001, 0, 0, 0, 0, 0, '', 'Era content: Vanilla gameobject'
FROM `gameobject` WHERE `id` IN (
    179984, 180025, 180038, 180056
) AND `guid` IN (
    991, 18622, 27057, 151265, 151266, 151267, 151268
);

-- Vanilla quests opening at tier 1; every existing alternative keeps its own conditions.
INSERT IGNORE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
SELECT DISTINCT 19, 0, q.`ID`, 0, COALESCE(c.`ElseGroup`, 0), 8, 0, 66001, 0, 0, 0, 0, 0, '', 'Era content: Vanilla quest'
FROM `quest_template` q
LEFT JOIN `conditions` c ON c.`SourceTypeOrReferenceId` = 19 AND c.`SourceGroup` = 0 AND c.`SourceEntry` = q.`ID` AND c.`SourceId` = 0
WHERE q.`ID` IN (
    7761, 7781, 7782, 7783, 7784, 7785, 7786, 7787
);

-- Vanilla items opening at tier 1, sold by vendors that are visible earlier.
INSERT IGNORE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
SELECT DISTINCT 23, v.`entry`, v.`item`, 0, 0, 8, 0, 66001, 0, 0, 0, 0, 0, '', 'Era content: Vanilla vendor item'
FROM `npc_vendor` v
WHERE (v.`entry` = 10856 AND v.`item` IN (19203, 19205, 19216, 19217, 19328, 19329, 19442, 19446, 19447))
   OR (v.`entry` = 10857 AND v.`item` IN (19203, 19205, 19216, 19217, 19328, 19329, 19442, 19446, 19447))
   OR (v.`entry` = 11536 AND v.`item` IN (19203, 19205, 19216, 19217, 19328, 19329, 19442, 19446, 19447))
   OR (v.`entry` = 11557 AND v.`item` IN (19202, 19204, 19215, 19218, 19326, 19327, 19445));

-- Vanilla creatures opening at tier 3.
INSERT IGNORE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
SELECT 30, 0, `id`, `guid`, 0, 8, 0, 66003, 0, 0, 0, 0, 0, '', 'Era content: Vanilla creature'
FROM `creature` WHERE `id` IN (
    5814, 7951, 11346, 11737, 11880, 11883, 14911, 14961, 14962, 14963, 14964, 14994, 15076, 15080, 15124,
    15125, 15128, 15130, 15131, 15162, 15165, 15169, 15170, 15171, 15172, 15174, 15175, 15177, 15178, 15179,
    15182, 15184, 15185, 15186, 15196, 15200, 15201, 15202, 15213, 15215, 15308, 15315, 15545, 16014, 16015,
    16033, 16043, 16072, 16090, 16094, 16096, 16117, 16123
) AND `guid` IN (
    313, 314, 315, 385, 436, 556, 606, 609, 661, 677, 690, 723, 730, 732, 733, 736, 739, 742, 748, 1792, 4600,
    6492, 6493, 7944, 7947, 10349, 11258, 11259, 11260, 11261, 11264, 11270, 11918, 11919, 11920, 11921,
    14400, 14809, 16397, 16572, 16573, 22788, 23273, 29776, 29782, 30872, 32334, 32656, 34109, 34110, 38248,
    39068, 42208, 42751, 42752, 42753, 42754, 42755, 42756, 42758, 42759, 42760, 42764, 42770, 42771, 42773,
    42774, 42775, 42778, 42779, 42780, 42781, 42784, 42785, 42885, 42886, 42891, 42892, 42895, 42896, 42897,
    42898, 42899, 42900, 42901, 42902, 42903, 42921, 42923, 42924, 42925, 42926, 42927, 42928, 42929, 42930,
    42931, 42932, 42933, 42934, 42935, 42936, 42937, 42945, 42946, 42954, 42985, 42986, 42987, 43069, 43070,
    43071, 43076, 43077, 43078, 43079, 43080, 43081, 43082, 43083, 43084, 43085, 43086, 43087, 43088, 43089,
    43090, 43091, 43092, 43093, 43094, 43095, 43096, 43097, 43206, 43207, 43208, 43209, 43213, 43214, 43215,
    43216, 43217, 43218, 43219, 43220, 43322, 43323, 44396, 44397, 54194, 54195, 54196, 54197, 54198, 54199,
    54209, 54254, 54255, 54256, 54809, 54859, 55363, 56312, 56313, 56318, 90954, 90956, 92035, 94490, 200122,
    200123
);

-- Vanilla gameobjects opening at tier 3.
INSERT IGNORE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
SELECT 30, 1, `id`, `guid`, 0, 8, 0, 66003, 0, 0, 0, 0, 0, '', 'Era content: Vanilla gameobject'
FROM `gameobject` WHERE `id` IN (
    177281, 180204, 180205, 180216, 180367, 180375, 180417, 180435, 180436, 180438, 180439, 180440, 180441,
    180442, 180451, 180453, 180454, 180455, 180456, 180461, 180466, 180473, 180474, 180475, 180476, 180477,
    180478, 180479, 180480, 180501, 180503, 180504, 180505, 180518, 180529, 180534, 180539, 180544, 180549,
    180554, 180559, 180564, 181053, 181062, 181063, 181064, 181065, 181066, 181067, 181098
) AND `guid` IN (
    4528, 4529, 4530, 4531, 4532, 4533, 4534, 4535, 4536, 4537, 4601, 4602, 4603, 4604, 4605, 4606, 4607,
    4608, 4609, 4610, 4617, 4618, 4619, 4624, 4625, 4626, 4627, 4628, 4629, 4630, 4631, 4632, 4633, 4634,
    4635, 4636, 4637, 4638, 4639, 4640, 4641, 4642, 4643, 4645, 5586, 6171, 6186, 6200, 6271, 6293, 6381,
    6767, 6768, 6769, 9115, 9118, 9122, 10089, 18001, 18002, 18003, 20808, 20809, 20810, 20811, 20812, 20813,
    49271, 49285, 49286, 49287, 49288, 49289, 49290, 49291, 49292, 49293, 49294, 49295, 49296, 49297, 49310,
    49311, 49314, 49316, 49317, 49321, 49332, 49333, 49334, 49335, 49378, 49396, 49414, 49415, 49416, 49417,
    49418, 49419, 49420, 49421, 49422, 49423, 49424, 49425, 49429, 49430, 49431, 49432, 49433, 49450, 49452,
    49460, 49461, 49462, 49463, 49464, 49465, 49466, 49838, 50207, 50214, 50215, 50230, 50231, 50237, 50257,
    99865, 99897, 99898, 99899, 99997
);

-- Vanilla quests opening at tier 3; every existing alternative keeps its own conditions.
INSERT IGNORE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
SELECT DISTINCT 19, 0, q.`ID`, 0, COALESCE(c.`ElseGroup`, 0), 8, 0, 66003, 0, 0, 0, 0, 0, '', 'Era content: Vanilla quest'
FROM `quest_template` q
LEFT JOIN `conditions` c ON c.`SourceTypeOrReferenceId` = 19 AND c.`SourceGroup` = 0 AND c.`SourceEntry` = q.`ID` AND c.`SourceId` = 0
WHERE q.`ID` IN (
    8151, 8153, 8183, 8184, 8185, 8186, 8187, 8188, 8189, 8190, 8191, 8192, 8196, 8227, 8231, 8232, 8233,
    8234, 8235, 8236, 8241, 8242, 8243, 8246, 8249, 8250, 8251, 8252, 8253, 8254, 8255, 8256, 8257, 8258,
    8273, 8307, 8308, 8309, 8310, 8313, 8314, 8317, 8365, 8366, 8410, 8412, 8413, 8414, 8415, 8416, 8417,
    8418, 8419, 8420, 8421, 8422, 8423, 8424, 8425, 8446, 8447, 8921, 8924, 8925, 8928, 8945, 8946, 8947,
    8948, 8949, 8950, 8951, 8952, 8953, 8954, 8955, 8956, 8957, 8958, 8959, 8961, 8962, 8963, 8964, 8965,
    8966, 8967, 8968, 8969, 8970, 8977, 8978, 8985, 8986, 8987, 8988, 8989, 8990, 8991, 8992, 8994, 8995,
    8997, 8998, 9015, 9016, 9017, 9018, 9019, 9020, 9021, 9022, 9051, 9052, 9053, 9063
);

-- Vanilla items opening at tier 3, sold by vendors that are visible earlier.
INSERT IGNORE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
SELECT DISTINCT 23, v.`entry`, v.`item`, 0, 0, 8, 0, 66003, 0, 0, 0, 0, 0, '', 'Era content: Vanilla vendor item'
FROM `npc_vendor` v
WHERE (v.`entry` = 777 AND v.`item` IN (20576))
   OR (v.`entry` = 1318 AND v.`item` IN (22307))
   OR (v.`entry` = 3012 AND v.`item` IN (22307))
   OR (v.`entry` = 3346 AND v.`item` IN (22307))
   OR (v.`entry` = 3405 AND v.`item` IN (22250))
   OR (v.`entry` = 3548 AND v.`item` IN (22250))
   OR (v.`entry` = 4216 AND v.`item` IN (22250))
   OR (v.`entry` = 4228 AND v.`item` IN (22307))
   OR (v.`entry` = 4615 AND v.`item` IN (22250))
   OR (v.`entry` = 4617 AND v.`item` IN (22307))
   OR (v.`entry` = 4879 AND v.`item` IN (20075))
   OR (v.`entry` = 4899 AND v.`item` IN (22250))
   OR (v.`entry` = 5138 AND v.`item` IN (22250))
   OR (v.`entry` = 5158 AND v.`item` IN (22307))
   OR (v.`entry` = 5503 AND v.`item` IN (22250))
   OR (v.`entry` = 5757 AND v.`item` IN (22307))
   OR (v.`entry` = 5758 AND v.`item` IN (22307))
   OR (v.`entry` = 10856 AND v.`item` IN (22014))
   OR (v.`entry` = 10857 AND v.`item` IN (22014))
   OR (v.`entry` = 11118 AND v.`item` IN (22324))
   OR (v.`entry` = 11536 AND v.`item` IN (22014))
   OR (v.`entry` = 11557 AND v.`item` IN (20253, 20254, 22392))
   OR (v.`entry` = 12919 AND v.`item` IN (19974))
   OR (v.`entry` = 14921 AND v.`item` IN (19764, 19765, 19766, 19769, 19770, 19771, 19772, 19773, 19776, 19777, 19778, 19779, 19780, 19781, 20000, 20001, 20011, 20012, 20013, 20014));

-- Vanilla creatures opening at tier 4.
INSERT IGNORE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
SELECT 30, 0, `id`, `guid`, 0, 8, 0, 66004, 0, 0, 0, 0, 0, '', 'Era content: Vanilla creature'
FROM `creature` WHERE `id` IN (
    8669, 8670, 8672, 8674, 8719, 8721, 8722, 8723, 9857, 9858, 14471, 15184, 15395, 15481, 15520, 15526,
    15552, 15553, 15609, 15610, 15611, 15659, 15675, 15676, 15677, 15678, 15679, 15681, 15682, 15683, 15684,
    15686, 15722, 15801, 16069, 16076
) AND `guid` IN (
    568, 569, 570, 6497, 6498, 18612, 18614, 23283, 24708, 26769, 32058, 32059, 32060, 32061, 32062, 32063,
    32064, 32065, 35867, 39108, 40530, 42203, 42766, 42767, 42769, 42772, 42776, 42777, 42868, 42884, 43044,
    43211, 43212, 46164, 46165, 46166, 46190, 46240, 46243, 49214, 51838, 79705, 79706, 79707
);

-- Vanilla gameobjects opening at tier 4.
INSERT IGNORE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
SELECT 30, 1, `id`, `guid`, 0, 8, 0, 66004, 0, 0, 0, 0, 0, '', 'Era content: Vanilla gameobject'
FROM `gameobject` WHERE `id` IN (
    180582, 180651, 180655, 180656, 180657, 180658, 180659, 180661, 180662, 180663, 180664, 180665, 180666,
    180669, 180673, 180682, 180683, 180684, 180685, 180750, 180751, 180752, 180753, 180788, 180866, 180867,
    180900, 180901, 180902, 180913, 180914, 180915
) AND `guid` IN (
    96, 479, 485, 502, 536, 543, 553, 554, 559, 581, 618, 622, 624, 639, 649, 676, 698, 706, 708, 713, 722,
    724, 725, 726, 732, 733, 738, 751, 767, 776, 807, 808, 811, 822, 823, 840, 841, 846, 854, 861, 865, 872,
    873, 874, 875, 894, 897, 898, 899, 915, 916, 919, 936, 952, 961, 964, 965, 973, 977, 985, 986, 988, 989,
    1012, 1048, 1124, 1188, 1431, 1438, 1441, 1442, 1457, 1461, 1465, 1466, 1477, 1489, 1492, 1526, 1604,
    1605, 1611, 1617, 1618, 1619, 1624, 1635, 1637, 1639, 1645, 1646, 1650, 1655, 1656, 1691, 1699, 1729,
    1732, 1734, 1735, 1736, 1744, 1762, 1768, 1769, 1770, 1771, 1773, 1784, 1791, 1805, 1839, 1851, 1858,
    1895, 1912, 1929, 2001, 2026, 2031, 2045, 2051, 2208, 4561, 4562, 4583, 4679, 4773, 4775, 4860, 4993,
    5012, 5021, 5032, 5033, 5071, 5074, 5097, 5119, 5120, 5121, 5123, 5124, 5169, 5178, 5179, 5181, 5182,
    5183, 5190, 5192, 5322, 5328, 5340, 5435, 5439, 5441, 5442, 5465, 5476, 6808, 6843, 6844, 6856, 6864,
    10705, 10949, 10951, 10963, 10964, 10966, 10967, 10969, 11145, 11146, 11147, 11148, 11149, 11153, 11166,
    11167, 11168, 11169, 11170, 11171, 11172, 11173, 11645, 11650, 11661, 11662, 11663, 11668, 11688, 11701,
    11804, 11968, 12059, 12060, 12062, 12074, 12075, 12076, 12077, 12770, 12773, 12774, 12775, 12778, 12780,
    12782, 13421, 13422, 13429, 13430, 13431, 13432, 14085, 14086, 14087, 14088, 14089, 14096, 14097, 14625,
    14626, 14627, 14722, 14778, 14841, 14842, 14843, 14844, 14852, 14902, 14903, 15110, 15111, 15199, 15200,
    15202, 15203, 15204, 15397, 15419, 15420, 15476, 15497, 15505, 15633, 15634, 15707, 15708, 15763, 15764,
    15771, 15775, 15776, 15777, 15779, 15783, 16548, 16574, 16576, 16577, 16578, 16579, 16580, 16616, 16644,
    16645, 16716, 16734, 16744, 16766, 16773, 17241, 17242, 17245, 17246, 17247, 17250, 17251, 17356, 17357,
    18062, 18063, 18064, 18065, 18066, 18069, 18070, 18071, 18082, 18083, 18085, 18105, 18107, 18109, 18111,
    18117, 18118, 18119, 18120, 18121, 18123, 18125, 18127, 18128, 18139, 18140, 18141, 18142, 18144, 18145,
    18146, 18147, 18148, 18149, 18151, 18153, 18154, 18157, 18158, 18161, 18162, 18165, 18169, 18172, 18181,
    18185, 18189, 18193, 18195, 18200, 18202, 18206, 18211, 18213, 18223, 18225, 20337, 20339, 20354, 20377,
    20803, 20804, 20805, 20819, 20821, 20823, 20826, 20827, 20857, 20877, 20879, 20915, 21221, 21222, 21223,
    21224, 21225, 21226, 21228, 21229, 21230, 21231, 21232, 21234, 21236, 21238, 21241, 21242, 21243, 21244,
    21245, 21246, 21247, 21260, 21261, 21262, 21264, 21268, 21269, 27558, 27589, 29977, 32090, 32091, 32191,
    32556, 32560, 32561, 32562, 32563, 32564, 32565, 33209, 33210, 33211, 33212, 33284, 33300, 35423, 35424,
    35425, 35426, 35428, 35429, 35438, 35439, 35441, 35453, 35466, 35482, 35505, 42693, 42694, 42695, 42696,
    42697, 42698, 47247, 47283, 47318, 47319, 47320, 47321, 47322, 47323, 47324, 47325, 47326, 47327, 47328,
    47329, 47330, 47331, 47332, 47333, 47334, 47335, 47336, 47337, 47338, 47339, 47340, 47341, 47342, 47343,
    47344, 47345, 47346, 47348, 47349, 47351, 47352, 47353, 47354, 47355, 47356, 47358, 47359, 47360, 47361,
    47363, 47366, 47367, 47368, 47369, 47371, 47372, 47373, 47375, 47379, 47380, 47381, 47382, 47383, 47384,
    47385, 47387, 47390, 47391, 47392, 47393, 47394, 47395, 47396, 47397, 47398, 47400, 47401, 47403, 47404,
    47405, 47406, 47407, 47408, 47409, 47410, 47412, 47414, 47415, 47417, 47418, 47419, 47420, 47421, 47422,
    47423, 47424, 47425, 47426, 47427, 47428, 47429, 47430, 47431, 47432, 47433, 47434, 47435, 47436, 47437,
    47439, 47441, 47442, 47443, 47446, 47448, 47453, 47461, 47462, 47463, 47464, 47466, 47467, 47469, 47470,
    47471, 47472, 47473, 47505, 47506, 47507, 47508, 47509, 47510, 47511, 47512, 47513, 47516, 47517, 47518,
    47519, 47520, 47521, 47522, 47523, 47524, 47525, 47526, 47527, 47528, 47529, 47530, 47531, 47533, 47534,
    47535, 47536, 47537, 47538, 47539, 47540, 47541, 47543, 47544, 47545, 47546, 47618, 47619, 47620, 47621,
    47622, 47623, 47624, 48059, 48060, 48061, 48062, 48063, 48064, 48065, 48066, 48067, 48525, 48539, 48541,
    48556, 48638, 48646, 48647, 48648, 48650, 48658, 48663, 48667, 49315, 49380, 49393, 49394, 49395, 49900,
    49901, 49902, 49903, 49904, 49905, 49906, 49907, 49908, 49909, 49910, 49911, 49912, 49913, 49914, 49915,
    49916, 50259, 50260, 50261, 50262, 50263, 50264, 50265, 50266, 50267, 50268, 50269, 50270, 50271, 50272,
    50273, 50274, 50275, 50276, 50277, 50278, 50279, 50280, 50281, 50282, 50283, 50284, 50285, 50286, 50287,
    50288, 50289, 50290, 50291, 50292, 50293, 50294, 50295, 50296, 50297, 50299, 50300, 50303, 50304, 50305,
    50306, 50307, 50308, 50309, 50310, 50311, 50312, 50313, 50314, 50315, 50316, 50317, 50318, 50319, 50320,
    50321, 50322, 50323, 50324, 50325, 50326, 50327, 50328, 50329, 50330, 50331, 50332, 50333, 50334, 50335,
    50336, 50337, 50339, 50340, 50341, 50342, 50343, 50344, 50345, 50346, 50473, 50474, 64512, 64513, 64514,
    64515, 64516, 64517, 64518, 64616, 64617, 64618, 64619, 64620, 64621, 64622, 64623, 64624, 64625, 64626,
    64682, 64683, 64684, 64685, 64686, 64687, 64736, 64737, 64738, 64739, 64740, 64753, 64754, 64755, 64756,
    64757, 64758, 64759, 64760, 64761, 64794, 64795, 64796, 64797, 64798, 64799, 64811, 64827, 64837, 64839,
    64843, 64859, 99900, 99998, 100089, 241010, 241011, 241012, 241013, 241014, 241015, 268645, 268646, 268871
);

-- Vanilla quests opening at tier 4; every existing alternative keeps its own conditions.
INSERT IGNORE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
SELECT DISTINCT 19, 0, q.`ID`, 0, COALESCE(c.`ElseGroup`, 0), 8, 0, 66004, 0, 0, 0, 0, 0, '', 'Era content: Vanilla quest'
FROM `quest_template` q
LEFT JOIN `conditions` c ON c.`SourceTypeOrReferenceId` = 19 AND c.`SourceGroup` = 0 AND c.`SourceEntry` = q.`ID` AND c.`SourceId` = 0
WHERE q.`ID` IN (
    8460, 8461, 8462, 8464, 8465, 8466, 8467, 8469, 8470, 8471, 8481, 8484, 8485, 8496, 8497, 8498, 8501,
    8502, 8534, 8535, 8536, 8537, 8538, 8539, 8540, 8541, 8544, 8551, 8552, 8553, 8554, 8559, 8560, 8561,
    8562, 8592, 8593, 8594, 8595, 8596, 8599, 8602, 8603, 8621, 8622, 8623, 8624, 8625, 8626, 8627, 8628,
    8629, 8630, 8631, 8632, 8633, 8634, 8637, 8638, 8639, 8640, 8641, 8655, 8656, 8657, 8658, 8659, 8660,
    8661, 8662, 8663, 8664, 8665, 8666, 8667, 8668, 8669, 8687, 8737, 8738, 8739, 8740, 8747, 8748, 8749,
    8750, 8751, 8752, 8753, 8754, 8755, 8756, 8757, 8758, 8759, 8760, 8761, 8764, 8765, 8766, 8770, 8771,
    8772, 8773, 8774, 8775, 8776, 8777, 8778, 8779, 8780, 8781, 8782, 8783, 8784, 8785, 8786, 8787, 8789,
    8790, 8798, 8801, 8802, 8804, 8805, 8806, 8807, 8808, 8809, 8810, 8812, 8813, 8814, 8815, 8816, 8818,
    8820, 8821, 8822, 8823, 8824, 8825, 8826, 8829, 8842, 8893
);

-- Vanilla items opening at tier 4, sold by vendors that are visible earlier.
INSERT IGNORE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
SELECT DISTINCT 23, v.`entry`, v.`item`, 0, 0, 8, 0, 66004, 0, 0, 0, 0, 0, '', 'Era content: Vanilla vendor item'
FROM `npc_vendor` v
WHERE (v.`entry` = 1318 AND v.`item` IN (20752, 20753, 20758))
   OR (v.`entry` = 1325 AND v.`item` IN (20844))
   OR (v.`entry` = 1326 AND v.`item` IN (20844))
   OR (v.`entry` = 1457 AND v.`item` IN (20844))
   OR (v.`entry` = 1678 AND v.`item` IN (21552))
   OR (v.`entry` = 1684 AND v.`item` IN (21552))
   OR (v.`entry` = 2303 AND v.`item` IN (21030, 21031, 21033))
   OR (v.`entry` = 2381 AND v.`item` IN (21099, 21219))
   OR (v.`entry` = 2397 AND v.`item` IN (21099, 21219))
   OR (v.`entry` = 2622 AND v.`item` IN (20844))
   OR (v.`entry` = 2664 AND v.`item` IN (21099, 21219))
   OR (v.`entry` = 2842 AND v.`item` IN (21552))
   OR (v.`entry` = 3012 AND v.`item` IN (20752, 20753, 20758))
   OR (v.`entry` = 3027 AND v.`item` IN (21099, 21219))
   OR (v.`entry` = 3085 AND v.`item` IN (21099, 21219))
   OR (v.`entry` = 3086 AND v.`item` IN (21552))
   OR (v.`entry` = 3090 AND v.`item` IN (20844))
   OR (v.`entry` = 3135 AND v.`item` IN (20844))
   OR (v.`entry` = 3178 AND v.`item` IN (21552))
   OR (v.`entry` = 3334 AND v.`item` IN (20844))
   OR (v.`entry` = 3346 AND v.`item` IN (20752, 20753, 20758))
   OR (v.`entry` = 3400 AND v.`item` IN (21099, 21219))
   OR (v.`entry` = 3490 AND v.`item` IN (20844))
   OR (v.`entry` = 3497 AND v.`item` IN (21552))
   OR (v.`entry` = 3540 AND v.`item` IN (21552))
   OR (v.`entry` = 3542 AND v.`item` IN (20844))
   OR (v.`entry` = 3551 AND v.`item` IN (20844))
   OR (v.`entry` = 3561 AND v.`item` IN (20844))
   OR (v.`entry` = 3961 AND v.`item` IN (21030, 21031, 21033))
   OR (v.`entry` = 3969 AND v.`item` IN (20844))
   OR (v.`entry` = 4167 AND v.`item` IN (21030, 21031, 21033))
   OR (v.`entry` = 4181 AND v.`item` IN (21030, 21031, 21033))
   OR (v.`entry` = 4191 AND v.`item` IN (21030, 21031, 21033))
   OR (v.`entry` = 4195 AND v.`item` IN (21030, 21031, 21033))
   OR (v.`entry` = 4200 AND v.`item` IN (21552))
   OR (v.`entry` = 4221 AND v.`item` IN (21552))
   OR (v.`entry` = 4223 AND v.`item` IN (21099, 21219))
   OR (v.`entry` = 4228 AND v.`item` IN (20752, 20753, 20758))
   OR (v.`entry` = 4265 AND v.`item` IN (21099, 21219))
   OR (v.`entry` = 4266 AND v.`item` IN (21030, 21031, 21033))
   OR (v.`entry` = 4305 AND v.`item` IN (21552))
   OR (v.`entry` = 4307 AND v.`item` IN (21552))
   OR (v.`entry` = 4553 AND v.`item` IN (21099, 21219))
   OR (v.`entry` = 4585 AND v.`item` IN (20844))
   OR (v.`entry` = 4617 AND v.`item` IN (20752, 20753, 20758))
   OR (v.`entry` = 5158 AND v.`item` IN (20752, 20753, 20758))
   OR (v.`entry` = 5160 AND v.`item` IN (21099, 21219))
   OR (v.`entry` = 5169 AND v.`item` IN (20844))
   OR (v.`entry` = 5483 AND v.`item` IN (21099, 21219))
   OR (v.`entry` = 5757 AND v.`item` IN (20752, 20753, 20758))
   OR (v.`entry` = 5758 AND v.`item` IN (20752, 20753, 20758))
   OR (v.`entry` = 5814 AND v.`item` IN (21552))
   OR (v.`entry` = 6091 AND v.`item` IN (21030, 21031, 21033))
   OR (v.`entry` = 6568 AND v.`item` IN (21358))
   OR (v.`entry` = 6727 AND v.`item` IN (21552))
   OR (v.`entry` = 6779 AND v.`item` IN (20844))
   OR (v.`entry` = 6791 AND v.`item` IN (21552))
   OR (v.`entry` = 6807 AND v.`item` IN (21552))
   OR (v.`entry` = 7941 AND v.`item` IN (21030, 21031, 21033))
   OR (v.`entry` = 7943 AND v.`item` IN (21552))
   OR (v.`entry` = 8137 AND v.`item` IN (21552))
   OR (v.`entry` = 8307 AND v.`item` IN (21099, 21219))
   OR (v.`entry` = 8931 AND v.`item` IN (21552))
   OR (v.`entry` = 11187 AND v.`item` IN (21552))
   OR (v.`entry` = 12019 AND v.`item` IN (21030, 21031, 21033))
   OR (v.`entry` = 12026 AND v.`item` IN (21030, 21031, 21033))
   OR (v.`entry` = 12033 AND v.`item` IN (21099, 21219))
   OR (v.`entry` = 12962 AND v.`item` IN (21552))
   OR (v.`entry` = 14731 AND v.`item` IN (21552))
   OR (v.`entry` = 14738 AND v.`item` IN (21099, 21219))
   OR (v.`entry` = 14921 AND v.`item` IN (20756, 20757))
   OR (v.`entry` = 15175 AND v.`item` IN (20844))
   OR (v.`entry` = 24834 AND v.`item` IN (21552))
   OR (v.`entry` = 24993 AND v.`item` IN (21552))
   OR (v.`entry` = 25020 AND v.`item` IN (21552))
   OR (v.`entry` = 25089 AND v.`item` IN (21552));

-- Vanilla creatures opening at tier 6.
INSERT IGNORE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
SELECT 30, 0, `id`, `guid`, 0, 8, 0, 66006, 0, 0, 0, 0, 0, '', 'Era content: Vanilla creature'
FROM `creature` WHERE `id` IN (
    10583, 11704, 16030, 16227, 16392, 16399, 16416, 16417, 16418, 16458, 17074, 17090, 17249, 17598, 18199
) AND `guid` IN (
    554, 565, 13551, 14323, 16990, 21821, 23723, 29239, 41519, 42745, 43179, 43223, 53738, 92885, 108869,
    108870, 108871
);

-- Vanilla gameobjects opening at tier 6.
INSERT IGNORE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
SELECT 30, 1, `id`, `guid`, 0, 8, 0, 66006, 0, 0, 0, 0, 0, '', 'Era content: Vanilla gameobject'
FROM `gameobject` WHERE `id` IN (
    180712, 180750, 180751, 180752, 181134, 181135, 181598, 181633, 181634, 181635, 181639, 182075, 182076,
    182077, 182078, 182079, 182080, 182081, 182106
) AND `guid` IN (
    11689, 11700, 11703, 11986, 12053, 17466, 17467, 17468, 17469, 17470, 17891, 18067, 18084, 18086, 18122,
    18227, 18232, 18279, 18282, 18284, 18293, 18629, 18631, 30712, 33285, 42097, 45608, 45610, 45693, 45694,
    45695, 45696, 45722, 45723, 45724, 45725, 45726, 45727, 45728, 45729, 45753, 45754, 45755, 45756, 47474,
    47475, 47476, 47477, 47478, 47479, 47547, 47548, 47549, 47550, 47551, 47593, 48230, 48231, 48232, 48233,
    48451, 49336, 49337, 49338, 49339, 49340, 49341, 49342, 49343, 49344, 49345, 49346, 49347, 49348, 49349,
    49350, 49351, 49377, 49379, 49381, 50178, 50179, 50180, 50181, 50182, 50183, 50184, 50298, 50301, 50302,
    64627, 64628
);

-- Vanilla quests opening at tier 6; every existing alternative keeps its own conditions.
INSERT IGNORE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
SELECT DISTINCT 19, 0, q.`ID`, 0, COALESCE(c.`ElseGroup`, 0), 8, 0, 66006, 0, 0, 0, 0, 0, '', 'Era content: Vanilla quest'
FROM `quest_template` q
LEFT JOIN `conditions` c ON c.`SourceTypeOrReferenceId` = 19 AND c.`SourceGroup` = 0 AND c.`SourceEntry` = q.`ID` AND c.`SourceId` = 0
WHERE q.`ID` IN (
    9120, 9178, 9179, 9181, 9182, 9183, 9184, 9185, 9186, 9187, 9188, 9190, 9191, 9194, 9195, 9196, 9197,
    9198, 9200, 9201, 9202, 9203, 9204, 9205, 9206, 9208, 9209, 9210, 9233, 9247, 9250, 9251, 9257, 9259,
    9266, 9267, 9268, 9269, 9270, 9271, 9272, 9295, 9299, 9300, 9301, 9302, 9304, 9362, 9364
);

-- Vanilla items opening at tier 6, sold by vendors that are visible earlier.
INSERT IGNORE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
SELECT DISTINCT 23, v.`entry`, v.`item`, 0, 0, 8, 0, 66006, 0, 0, 0, 0, 0, '', 'Era content: Vanilla vendor item'
FROM `npc_vendor` v
WHERE (v.`entry` = 15179 AND v.`item` IN (22683, 22772, 22773, 22774));

-- TBC creatures opening at tier 8.
INSERT IGNORE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
SELECT 30, 0, `id`, `guid`, 0, 8, 0, 66008, 0, 0, 0, 0, 0, '', 'Era content: TBC creature'
FROM `creature` WHERE `id` IN (
    7370, 12377, 12378, 12379, 12380, 16287, 16288, 17092, 17093, 17094, 17095, 17097, 17098, 17099, 17100,
    17103, 17104, 17105, 17106, 17108, 17109, 17111, 17112, 17113, 17115, 17119, 17127, 17178, 17218, 17223,
    17238, 17287, 17291, 17300, 17303, 17304, 17310, 17355, 17406, 17409, 17412, 17531, 17541, 18165, 18241,
    19855, 19905, 19906, 19907, 19908, 19910, 19914, 19918, 19932, 19933, 19935, 20025, 20055, 20131, 20142,
    20406, 21045, 21448, 22834, 22916, 22931, 22935, 22936, 22985, 23050, 23090, 23103, 23128, 23131, 23536,
    23554, 23555, 23566, 23567, 23568, 23569, 23570, 23571, 23572, 23573, 23579, 23590, 23591, 23592, 23593,
    23594, 23595, 23600, 23601, 23602, 23612, 23616, 23618, 23620, 23635, 23636, 23637, 23679, 23687, 23704,
    23713, 23714, 23720, 23723, 23797, 23835, 23843, 23873, 23881, 23892, 23896, 23905, 23941, 23942, 23949,
    23950, 23969, 23995, 24005, 24006, 24007, 24025, 24208, 24366, 24729, 24734, 24735, 24736, 24737, 24738,
    24739, 24740, 25058, 25109, 26081, 27703, 27704, 27705, 28126, 29093, 29095
) AND `guid` IN (
    563, 564, 720, 1846, 3466, 3961, 3965, 3966, 3967, 3968, 3976, 3977, 3978, 3979, 3986, 3987, 3988, 3989,
    4000, 4001, 4002, 4003, 4004, 4006, 4007, 4008, 4009, 4011, 4012, 4013, 4014, 4015, 4016, 4017, 4018,
    4019, 4020, 4021, 4022, 4023, 4024, 4025, 4026, 4027, 4028, 4029, 4030, 4031, 4032, 4033, 4034, 4035,
    4036, 4040, 4041, 4042, 4043, 4044, 4045, 4046, 4047, 4049, 4050, 4051, 4052, 4053, 4054, 4055, 4056,
    4057, 4058, 4059, 4060, 4200, 6501, 6502, 6503, 6506, 6867, 8470, 8493, 8494, 8495, 8496, 8497, 8498,
    8499, 8500, 8501, 8502, 8503, 8504, 8505, 8506, 8507, 8508, 8509, 8510, 10496, 11215, 11271, 12600, 12603,
    12813, 15318, 15540, 15576, 15577, 15702, 15703, 15705, 15938, 16571, 16596, 16599, 17284, 17427, 17631,
    18574, 18575, 18580, 18589, 18592, 18593, 18594, 18595, 18596, 18597, 18598, 18599, 18600, 18601, 18603,
    18604, 18605, 18606, 18608, 18609, 20428, 20946, 21232, 21699, 22780, 23088, 23089, 23090, 23091, 23092,
    23093, 23094, 23095, 23096, 23097, 23285, 23289, 23419, 23426, 23429, 23432, 23433, 23435, 23436, 23437,
    23438, 23439, 23440, 23450, 23451, 23453, 24051, 24762, 24763, 25169, 27825, 30449, 30463, 30490, 30509,
    30511, 30512, 30649, 30702, 30707, 30710, 30743, 30744, 30758, 30775, 30777, 30778, 30780, 30801, 30821,
    30840, 30865, 30866, 30879, 30901, 30907, 30923, 30934, 30945, 30950, 30951, 30969, 30970, 30972, 30973,
    30974, 30981, 31007, 31008, 31021, 31032, 31033, 31043, 31045, 31046, 31047, 31050, 31051, 31052, 31053,
    31054, 31055, 31056, 31057, 31058, 31059, 31060, 31061, 31062, 31072, 31073, 31074, 31075, 31078, 31084,
    31171, 31173, 31174, 31178, 31179, 31181, 31209, 31239, 31240, 31241, 31243, 31269, 31275, 31276, 31296,
    31302, 31303, 31304, 31325, 31334, 31337, 31340, 31342, 31345, 31347, 31348, 31349, 31398, 31425, 31490,
    31530, 31549, 31552, 31553, 31554, 31557, 31560, 31562, 31564, 31568, 31573, 31574, 31576, 31578, 31579,
    31580, 31581, 31597, 31630, 31632, 31633, 31635, 31636, 31639, 31641, 31642, 31644, 31645, 31646, 31649,
    31652, 31686, 31689, 31701, 31716, 31730, 31940, 32035, 32054, 32055, 32066, 32101, 32102, 32107, 32325,
    32327, 32789, 32809, 32859, 32896, 32911, 32912, 32915, 32918, 32936, 32937, 32943, 32959, 33005, 33027,
    33046, 33070, 33316, 33681, 33686, 33687, 33688, 33689, 33693, 33759, 33760, 33761, 33766, 33767, 33788,
    33789, 33790, 33794, 33800, 33827, 33833, 33839, 33845, 33846, 33854, 33861, 33863, 33886, 33890, 33896,
    33900, 33901, 33902, 33906, 33912, 33913, 33915, 33924, 33926, 33927, 33929, 34007, 34141, 34182, 35095,
    35096, 37032, 37033, 37036, 37038, 37039, 38337, 38844, 38847, 38856, 38889, 38908, 38909, 39104, 39304,
    39305, 39306, 39307, 39308, 39310, 40184, 41708, 41829, 42360, 42408, 43438, 44180, 44251, 45246, 47640,
    49590, 49591, 79736, 79765, 79801, 80305, 83207, 83208, 83454, 84638, 88299, 92983, 94505, 94506, 120784,
    120801, 200150, 200151, 200152, 1975960
);

-- TBC gameobjects opening at tier 8.
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

-- TBC quests opening at tier 8; every existing alternative keeps its own conditions.
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

-- TBC items opening at tier 8, sold by vendors that are visible earlier.
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

-- TBC creatures opening at tier 9.
INSERT IGNORE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
SELECT 30, 0, `id`, `guid`, 0, 8, 0, 66009, 0, 0, 0, 0, 0, '', 'Era content: TBC creature'
FROM `creature` WHERE `id` IN (
    17711, 18728, 20613, 20616
) AND `guid` IN (
    72880, 72884, 84633, 96999
);

-- TBC creatures opening at tier 10.
INSERT IGNORE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
SELECT 30, 0, `id`, `guid`, 0, 8, 0, 66010, 0, 0, 0, 0, 0, '', 'Era content: TBC creature'
FROM `creature` WHERE `id` IN (
    21905, 21906, 22987, 23449
) AND `guid` IN (
    76643, 76644, 79011, 79033
);

-- TBC gameobjects opening at tier 10.
INSERT IGNORE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
SELECT 30, 1, `id`, `guid`, 0, 8, 0, 66010, 0, 0, 0, 0, 0, '', 'Era content: TBC gameobject'
FROM `gameobject` WHERE `id` IN (
    185877, 185881, 185915
) AND `guid` IN (
    104615, 104616, 104617, 104618, 104619, 104620, 104621, 104622, 104623, 104624, 104625, 104626, 104627,
    104628, 104629, 104630, 104631, 104632, 104633, 104634, 104635, 104636, 104637, 104638, 104639, 104640,
    104641, 104642, 104643, 104644, 104645, 104646, 104647, 104648, 104649, 104650, 104651, 104652, 104653,
    104654, 104655, 104656, 104657, 104658, 104659, 104660, 104661, 104662, 104663, 104664, 104665, 104666,
    104667, 104668, 104669, 104670, 104671, 104672, 104673, 104674, 104675, 104676, 104677, 104678, 104679,
    104680, 104681, 104682, 104683, 104684, 104685, 104686, 104687, 104688, 104689, 104690, 104691, 104692,
    104693, 104694, 104695, 104696, 104697, 104698, 104699, 104700, 104701, 104702, 104703, 104704, 104705,
    104706, 104707, 104708, 104709, 104710, 104711, 104712, 104713, 104714, 104715, 104716, 104717, 104718,
    104719, 104720, 104721, 104722, 104723, 104724, 104725, 104726, 104727, 104728, 104729, 104730, 104731,
    104732, 104733, 104734, 104735, 104736, 104737, 104738, 104739, 104740, 104741, 104742, 104743, 104744,
    104745, 104746, 104747, 104748, 104749, 104750, 104751, 104752, 104753, 104754, 104755, 104756, 104757,
    104758, 104759, 104760, 104761, 104762, 104763, 104764, 104765, 104766, 104767, 104768, 104769, 104770,
    104771, 104772, 104773, 104774, 104775, 104776, 104777, 104778, 104779, 104780, 104781, 104782, 104783,
    104784, 104785, 104786, 104787, 104788, 104789, 104790, 104791, 104792, 104793, 104794, 104795, 104796,
    104797, 104798, 104799, 104800, 104801, 104802, 104803, 104804, 104805, 104806, 104807, 104808, 104809,
    104810, 104811, 104812, 104813, 104814, 104815, 104816, 104817, 104818, 104819, 104820, 104821, 104822,
    104823, 104824, 104825, 104826, 104827, 104828, 104829, 104830, 104831, 104832, 104833, 104834, 104835,
    104836, 104837, 104838, 104839, 104840, 104841, 104842, 104843, 104844, 104845, 104846, 104847, 104848,
    104849, 104850, 104851, 104852
);

-- TBC quests opening at tier 10; every existing alternative keeps its own conditions.
INSERT IGNORE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
SELECT DISTINCT 19, 0, q.`ID`, 0, COALESCE(c.`ElseGroup`, 0), 8, 0, 66010, 0, 0, 0, 0, 0, '', 'Era content: TBC quest'
FROM `quest_template` q
LEFT JOIN `conditions` c ON c.`SourceTypeOrReferenceId` = 19 AND c.`SourceGroup` = 0 AND c.`SourceEntry` = q.`ID` AND c.`SourceId` = 0
WHERE q.`ID` IN (
    10944, 11004, 11005, 11006, 11008, 11009, 11010, 11012, 11013, 11015, 11016, 11017, 11018, 11020, 11021,
    11023, 11024, 11025, 11026, 11027, 11028, 11029, 11030, 11035, 11041, 11049, 11050, 11051, 11053, 11054,
    11055, 11056, 11058, 11059, 11060, 11061, 11062, 11064, 11065, 11066, 11067, 11068, 11069, 11070, 11071,
    11073, 11074, 11075, 11076, 11077, 11078, 11079, 11080, 11081, 11082, 11083, 11084, 11085, 11086, 11089,
    11090, 11091, 11092, 11093, 11094, 11096, 11097, 11098, 11099, 11101, 11102, 11107, 11108, 11119, 11885
);

-- TBC quests opening at tier 12; every existing alternative keeps its own conditions.
INSERT IGNORE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
SELECT DISTINCT 19, 0, q.`ID`, 0, COALESCE(c.`ElseGroup`, 0), 8, 0, 66012, 0, 0, 0, 0, 0, '', 'Era content: TBC quest'
FROM `quest_template` q
LEFT JOIN `conditions` c ON c.`SourceTypeOrReferenceId` = 19 AND c.`SourceGroup` = 0 AND c.`SourceEntry` = q.`ID` AND c.`SourceId` = 0
WHERE q.`ID` IN (
    11178, 11195
);

-- Wrath creatures opening at tier 13.
INSERT IGNORE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
SELECT 30, 0, `id`, `guid`, 0, 8, 0, 66013, 0, 0, 0, 0, 0, '', 'Era content: Wrath creature'
FROM `creature` WHERE `id` IN (
    26537, 26539, 26546, 26548, 27616, 27618, 27619, 27620, 27624, 27928, 28092, 28347, 28355, 28486, 28488,
    28489, 28490, 28491, 28500, 28601, 28650, 29016, 29019, 29088, 29141, 29142, 29143, 29144, 29152, 29154,
    29194, 29195, 29196, 29202, 29203, 29205, 29207, 29208, 29212, 29239, 29246, 29287, 29288, 29289, 29290,
    29291, 29292, 29293, 29294, 29295, 29296, 29297, 29298, 29299, 29300, 29480, 29587, 29712, 29725, 29728,
    29865, 29866, 29867, 29868, 29873, 30217, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721,
    30722, 30723, 30724, 30727, 30729, 30730, 30731, 30732, 30733, 30734, 30735, 32346, 32547, 33638, 33642,
    33679, 33712, 33713, 33996, 34155, 34158, 34238, 34526, 34528, 34765, 34766, 34986, 35068, 35073, 35168,
    35169, 35281, 35364, 35365, 35477, 36479, 36481, 37072, 37888, 37915, 39263, 39275, 39349, 39368, 39386,
    39396, 39623, 39675, 39678, 39711, 39715, 39716, 39717, 40405
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
    135120, 137646, 137653, 137654, 142712, 142713, 142714, 142715, 142716, 145354, 145355, 145356, 145357,
    145358, 145359, 145360, 145361, 145362, 145363, 145364, 145365, 145423, 145424, 145425, 145426, 150154,
    150155, 200117, 200144, 200818, 200877, 202482, 202771, 202844, 202845, 203459, 203461, 203466, 203467,
    203468, 203469, 203470, 203471, 203472, 203473, 203474, 203475, 203476, 203477, 203478, 203479, 203480,
    203481, 203482, 203483, 203484, 203485, 203490, 203491, 207172, 207173, 207174, 207175, 207176, 207177,
    207178, 207179, 207180, 207181, 207182, 207183, 207184, 207185, 207186, 207187, 207188, 207189, 207190,
    207191, 207192, 207193, 207194, 207195, 207196, 207197, 207198, 207199, 207200, 207201, 207202, 207203,
    207204, 207205, 207206, 207207, 207208, 207209, 209112, 1976212
);

-- Wrath gameobjects opening at tier 13.
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

-- Wrath quests opening at tier 13; every existing alternative keeps its own conditions.
INSERT IGNORE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
SELECT DISTINCT 19, 0, q.`ID`, 0, COALESCE(c.`ElseGroup`, 0), 8, 0, 66013, 0, 0, 0, 0, 0, '', 'Era content: Wrath quest'
FROM `quest_template` q
LEFT JOIN `conditions` c ON c.`SourceTypeOrReferenceId` = 19 AND c.`SourceGroup` = 0 AND c.`SourceEntry` = q.`ID` AND c.`SourceId` = 0
WHERE q.`ID` IN (
    7702, 12547, 12797, 13074, 13075, 13082, 13148, 13850, 13887, 13906, 14079, 14081, 14082, 14083, 14084,
    14085, 14086, 14087, 14088, 14089, 14095, 14100, 14111, 14160, 24428, 24429, 25199, 25212, 25283, 25286,
    25500
);

-- Wrath items opening at tier 13, sold by vendors that are visible earlier.
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

-- Wrath quests opening at tier 15; every existing alternative keeps its own conditions.
INSERT IGNORE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
SELECT DISTINCT 19, 0, q.`ID`, 0, COALESCE(c.`ElseGroup`, 0), 8, 0, 66015, 0, 0, 0, 0, 0, '', 'Era content: Wrath quest'
FROM `quest_template` q
LEFT JOIN `conditions` c ON c.`SourceTypeOrReferenceId` = 19 AND c.`SourceGroup` = 0 AND c.`SourceEntry` = q.`ID` AND c.`SourceId` = 0
WHERE q.`ID` IN (
    24589
);

-- Wrath quests opening at tier 17; every existing alternative keeps its own conditions.
INSERT IGNORE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
SELECT DISTINCT 19, 0, q.`ID`, 0, COALESCE(c.`ElseGroup`, 0), 8, 0, 66017, 0, 0, 0, 0, 0, '', 'Era content: Wrath quest'
FROM `quest_template` q
LEFT JOIN `conditions` c ON c.`SourceTypeOrReferenceId` = 19 AND c.`SourceGroup` = 0 AND c.`SourceEntry` = q.`ID` AND c.`SourceId` = 0
WHERE q.`ID` IN (
    26013
);
