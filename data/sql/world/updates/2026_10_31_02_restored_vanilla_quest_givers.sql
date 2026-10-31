-- Vanilla quests the CMaNGOS Classic and VMaNGOS databases give and the realm has
-- no giver for. Each returns to its Vanilla giver and ender: Troll Necklace Bounty's
-- repeatable turn-in after the first bounty, Mastering the Elements, Mortal
-- Champions, and the Darnassus Commendation Officer's repeatable signets (as in
-- VMaNGOS, which also matches their Darnassus reputation). The first three left
-- with TBC, so they stay before the rewarded TBC marker; the era content update
-- opens each with the tier of its patch.
DELETE FROM `creature_queststarter` WHERE (`id` = 7884 AND `quest` = 2881) OR (`id` = 6176 AND `quest` = 8411)
    OR (`id` = 15503 AND `quest` = 8579) OR (`id` = 15731 AND `quest` IN (8830, 8831));
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES
(7884, 2881), (6176, 8411), (15503, 8579), (15731, 8830), (15731, 8831);

DELETE FROM `creature_questender` WHERE (`id` = 7884 AND `quest` = 2881) OR (`id` = 6176 AND `quest` = 8411)
    OR (`id` = 15503 AND `quest` = 8579) OR (`id` = 15731 AND `quest` IN (8830, 8831));
INSERT INTO `creature_questender` (`id`, `quest`) VALUES
(7884, 2881), (6176, 8411), (15503, 8579), (15731, 8830), (15731, 8831);

-- The repeatable bounty follows the first one, where no other prerequisite is set.
UPDATE `quest_template_addon` SET `PrevQuestID` = 2880 WHERE `ID` = 2881 AND `PrevQuestID` = 0;

-- Before TBC only, on every existing alternative.
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 19 AND `Comment` = 'Restored Vanilla quest: before TBC';
INSERT IGNORE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
SELECT DISTINCT 19, 0, q.`ID`, 0, COALESCE(c.`ElseGroup`, 0), 8, 0, 66008, 0, 0, 1, 0, 0, '', 'Restored Vanilla quest: before TBC'
FROM `quest_template` q
LEFT JOIN `conditions` c ON c.`SourceTypeOrReferenceId` = 19 AND c.`SourceGroup` = 0 AND c.`SourceEntry` = q.`ID` AND c.`SourceId` = 0
WHERE q.`ID` IN (2881, 8411, 8579);
