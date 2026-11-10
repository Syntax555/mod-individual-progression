-- These trainers are absent from pinned CMaNGOS Classic ec4f596 and present in
-- TBC ebe51a8. Sharing Vanilla class quests (7562, 8410, 8419) with original
-- trainers does not make the later questgivers Vanilla content.
-- Keep custom visibility decisions and module-added or changed spawns.
INSERT IGNORE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
SELECT 30, 0, s.`id`, s.`guid`, 0, 8, 0, 66008, 0, 0, 0, 0, 0, '', 'Era content: TBC creature'
FROM `creature` s
LEFT JOIN `conditions` c ON c.`SourceTypeOrReferenceId` = 30 AND c.`SourceGroup` = 0
    AND c.`SourceEntry` = s.`id` AND c.`SourceId` IN (0, s.`guid`)
WHERE ((s.`id` = 20407 AND s.`guid` = 79860) -- Farseer Umbrua, Stormwind
    OR (s.`id` = 23127 AND s.`guid` = 1815) -- Farseer Javad, Ironforge
    OR (s.`id` = 23534 AND s.`guid` = 20943) -- Babagaya Shadowcleft, Ratchet
    OR (s.`id` = 23535 AND s.`guid` = 20945)) -- Matero Zeshuwal, Ratchet
AND s.`map` IN (0, 1)
AND c.`SourceTypeOrReferenceId` IS NULL;
