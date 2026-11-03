-- City combat training dummies arrived with Wrath: these entries are absent from
-- the pinned CMaNGOS Classic ec4f596 and TBC ebe51a8 creature templates.
-- The native npc_training_dummy AI is visible combat content, not an invisible
-- spell/quest helper. Keep custom visibility decisions and module-added spawns.
INSERT IGNORE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
SELECT 30, 0, s.`id`, s.`guid`, 0, 8, 0, 66013, 0, 0, 0, 0, 0, '', 'Era content: Wrath creature'
FROM `creature` s
LEFT JOIN `conditions` c ON c.`SourceTypeOrReferenceId` = 30 AND c.`SourceGroup` = 0
    AND c.`SourceEntry` = s.`id` AND c.`SourceId` IN (0, s.`guid`)
WHERE s.`id` IN (
    31144, 31146, 32542, 32543, 32545, 32546, 32666, 32667
) AND s.`guid` IN (
    42153, 42154, 42155, 42156, 42157, 48316, 48317, 48318, 48319, 48320, 48321, 48322, 48323, 48324, 48325,
    48326, 48327, 48334, 48335, 48336, 48337, 48338, 48339, 48340, 48341, 48342, 88213, 88214, 88215, 88216,
    88223, 88224, 125812, 125813, 125814, 125815, 125816, 125817, 125818, 125819, 125820, 125821, 125822,
    125823, 201235, 201236, 201237, 201239, 201241, 201242, 202721, 202722, 202723, 202726, 202727, 202730,
    202731, 202958, 202959, 202960, 202961, 202962, 202963, 202964, 202965, 202966, 202967, 202968, 204942,
    204943, 204944, 204945, 204946, 204947, 204948
) AND s.`map` IN (0, 1, 530)
AND c.`SourceTypeOrReferenceId` IS NULL;
