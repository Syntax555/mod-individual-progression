-- Quests of Vanilla and TBC that the VMaNGOS and CMaNGOS databases give and the realm has no
-- giver for. Each returns to the giver of its era; the era content update opens it with the
-- tier of its patch. The Magisters' Terrace dailies stay out of Shattrath's shared pools
-- (zone_shattrath.sql): on their days, lower tiers would have no daily at all.

-- Vanilla's battleground reputation turn-ins: Warsong Gulch marks for the Silverwing Sentinels
-- and Warsong Outriders, Arathi Basin marks for the League of Arathor and the Defilers, one
-- quest per level bracket as in VMaNGOS. They left with TBC, so they stay before the TBC marker.
DELETE FROM `creature_queststarter` WHERE (`id` = 14733 AND `quest` IN (7788, 7871, 7872, 7873, 8291))
    OR (`id` = 14781 AND `quest` IN (7789, 7874, 7875, 7876, 8294))
    OR (`id` = 14984 AND `quest` IN (8080, 8154, 8155, 8156, 8297))
    OR (`id` = 15022 AND `quest` IN (8123, 8160, 8161, 8162, 8299));
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES
(14733, 7788), (14733, 7871), (14733, 7872), (14733, 7873), (14733, 8291),
(14781, 7789), (14781, 7874), (14781, 7875), (14781, 7876), (14781, 8294),
(14984, 8080), (14984, 8154), (14984, 8155), (14984, 8156), (14984, 8297),
(15022, 8123), (15022, 8160), (15022, 8161), (15022, 8162), (15022, 8299);

DELETE FROM `creature_questender` WHERE (`id` = 14733 AND `quest` IN (7788, 7871, 7872, 7873, 8291))
    OR (`id` = 14781 AND `quest` IN (7789, 7874, 7875, 7876, 8294))
    OR (`id` = 14984 AND `quest` IN (8080, 8154, 8155, 8156, 8297))
    OR (`id` = 15022 AND `quest` IN (8123, 8160, 8161, 8162, 8299));
INSERT INTO `creature_questender` (`id`, `quest`) VALUES
(14733, 7788), (14733, 7871), (14733, 7872), (14733, 7873), (14733, 8291),
(14781, 7789), (14781, 7874), (14781, 7875), (14781, 7876), (14781, 8294),
(14984, 8080), (14984, 8154), (14984, 8155), (14984, 8156), (14984, 8297),
(15022, 8123), (15022, 8160), (15022, 8161), (15022, 8162), (15022, 8299);

DELETE FROM `disables` WHERE `sourceType` = 1 AND `entry` IN (8080, 8123, 8154, 8155, 8156, 8160, 8161, 8162, 8297, 8299);

-- Each bracket's quest ends with its bracket, where no other maximum is set.
UPDATE `quest_template_addon` SET `MaxLevel` = 29 WHERE `ID` IN (7788, 7789, 8155, 8162) AND `MaxLevel` = 0;
UPDATE `quest_template_addon` SET `MaxLevel` = 39 WHERE `ID` IN (7871, 7874, 8156, 8161) AND `MaxLevel` = 0;
UPDATE `quest_template_addon` SET `MaxLevel` = 49 WHERE `ID` IN (7872, 7875, 8154, 8160) AND `MaxLevel` = 0;
UPDATE `quest_template_addon` SET `MaxLevel` = 59 WHERE `ID` IN (7873, 7876, 8080, 8123) AND `MaxLevel` = 0;
UPDATE `quest_template_addon` SET `MaxLevel` = 69 WHERE `ID` IN (8291, 8294, 8297, 8299) AND `MaxLevel` = 0;

-- Before TBC only, on every existing alternative.
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 19 AND `Comment` = 'Restored Vanilla battleground quest: before TBC';
INSERT IGNORE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
SELECT DISTINCT 19, 0, q.`ID`, 0, COALESCE(c.`ElseGroup`, 0), 8, 0, 66008, 0, 0, 1, 0, 0, '', 'Restored Vanilla battleground quest: before TBC'
FROM `quest_template` q
LEFT JOIN `conditions` c ON c.`SourceTypeOrReferenceId` = 19 AND c.`SourceGroup` = 0 AND c.`SourceEntry` = q.`ID` AND c.`SourceId` = 0
WHERE q.`ID` IN (7788, 7789, 7871, 7872, 7873, 7874, 7875, 7876, 8080, 8123, 8154, 8155, 8156, 8160, 8161, 8162, 8291, 8294, 8297, 8299);

-- Kal and Gennia Runetotem already offer Heeding the Call as 5923 and 5926, so their historical
-- 5925 and 5928 would only repeat the breadcrumb; an earlier version of this update added them.
DELETE FROM `creature_queststarter` WHERE (`id` = 3602 AND `quest` = 5925) OR (`id` = 3064 AND `quest` = 5928);

-- Patch 1.11's Guard Didier gives the Argent Dawn's Writ of Safe Passage at Light's Hope Chapel,
-- beside Dispatch Commander Metz who takes it; TBC's Seer Nakha has her vision in Garadar.
-- Their spawns take Individual Progression's free GUID block 677000.
DELETE FROM `creature` WHERE `guid` IN (677001, 677002);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `ScriptName`, `VerifiedBuild`) VALUES
(677001, 16226, 0, 0, 0, 1, 1, 1, 2305.3, -5286.12, 82.0618, 4.83456, 300, 0, 0, 0, 0, 0, 0, 0, 0, '', 0),
(677002, 23265, 530, 0, 0, 1, 1, 1, -1333.53, 7221.96, 33.583, 2.26893, 300, 0, 0, 0, 0, 0, 0, 0, 0, '', 0);

-- Guard Didier arrives with patch 1.11's tier, like his quest.
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 30 AND `Comment` = 'Restored Vanilla creature: patch 1.11';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(30, 0, 16226, 677001, 0, 8, 0, 66006, 0, 0, 0, 0, 0, '', 'Restored Vanilla creature: patch 1.11');
