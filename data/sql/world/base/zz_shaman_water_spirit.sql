-- Quest 100 starts the water ritual in the pinned CMaNGOS Classic/TBC quest scripts (relay 700701).
-- Keep the existing quest 63 reward and quest 1103 recovery events.
DELETE FROM `smart_scripts` WHERE (`entryorguid` = 113791 AND `source_type` = 1 AND `id` = 1)
    OR (`entryorguid` = 7007 AND `source_type` = 0 AND `id` = 1);
INSERT INTO `smart_scripts`
(`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`,
 `event_param1`, `event_param2`, `event_param3`, `action_type`, `action_param1`, `action_param2`, `target_type`, `comment`) VALUES
(113791, 1, 1, 0, 19, 0, 100, 0, 100, 1000, 1000, 80, 11379100, 2, 1, 'Brazier of Everfount - On Quest 100 Accepted - Run Water Ritual'),
(7007, 0, 1, 0, 19, 0, 100, 0, 100, 1000, 1000, 80, 700700, 2, 1, 'Tiev Mordune - On Quest 100 Accepted - Run Water Ritual');

-- Timed-list conditions use their base object (target 1); the quest invoker is absent on timer ticks.
-- Check at the actual summon step so separate queued rituals do not create duplicate living spirits.
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceId` = 9
    AND ((`SourceEntry` = 11379100 AND `SourceGroup` = 3) OR (`SourceEntry` = 700700 AND `SourceGroup` = 2))
    AND `ConditionTypeOrReference` = 29 AND `ConditionTarget` = 1 AND `ConditionValue1` = 5895;
INSERT INTO `conditions`
(`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`,
 `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(22, 3, 11379100, 9, 0, 29, 1, 5895, 100, 0, 1, 0, 0, '', 'Water ritual - Summon only when no living Minor Manifestation of Water is nearby'),
(22, 2, 700700, 9, 0, 29, 1, 5895, 100, 0, 1, 0, 0, '', 'Water recovery - Summon only when no living Minor Manifestation of Water is nearby');
