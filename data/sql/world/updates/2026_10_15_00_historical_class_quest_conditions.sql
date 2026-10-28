-- Historical quest availability uses each character's rewarded progression markers.
-- Fear Ward ends at TBC; the remaining restored quests end at Wrath.
-- Gate every existing alternative without replacing custom conditions or rewards.
-- Value2=1 is ignored by rewarded-quest checks and keeps custom positive rows intact.
INSERT IGNORE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
SELECT DISTINCT 19, 0, q.`ID`, 0, COALESCE(c.`ElseGroup`, 0), 8, 0, marker.`ID`, 1, 0, 1, 0, 0, '', 'Historical priest quest: before later personal progression'
FROM `quest_template` q
CROSS JOIN (
    SELECT 66008 AS `ID` UNION ALL SELECT 66009 UNION ALL SELECT 66010
    UNION ALL SELECT 66011 UNION ALL SELECT 66012 UNION ALL SELECT 66013
    UNION ALL SELECT 66014 UNION ALL SELECT 66015 UNION ALL SELECT 66016
    UNION ALL SELECT 66017 UNION ALL SELECT 66018
) marker
LEFT JOIN `conditions` c ON c.`SourceTypeOrReferenceId` = 19 AND c.`SourceGroup` = 0 AND c.`SourceEntry` = q.`ID` AND c.`SourceId` = 0
WHERE q.`ID` IN (5634, 5635, 5636, 5637, 5638, 5639, 5641, 5645, 5647,
    5627, 5628, 5629, 5630, 5631, 5632, 5633, 5672, 5673, 5674, 5675,
    5658, 5660, 5661, 5662, 5663, 5652, 5654, 5655, 5656, 5657,
    5642, 5643, 5680, 5676, 5677, 5644, 5646, 5679)
AND q.`RewardSpell` IN (948090, 948091, 949290, 949291, 949292, 949293, 949294, 949295, 949296)
AND marker.`ID` >= CASE WHEN q.`RewardSpell` = 948091 THEN 66008 ELSE 66013 END;

-- The native Fear Ward quest also allows draenei; its Vanilla reward is dwarf-only.
INSERT IGNORE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
SELECT DISTINCT 19, 0, q.`ID`, 0, COALESCE(c.`ElseGroup`, 0), 16, 0, 4, 0, 0, 0, 0, 0, '', 'Historical Fear Ward: dwarf-only Vanilla quest'
FROM `quest_template` q
LEFT JOIN `conditions` c ON c.`SourceTypeOrReferenceId` = 19 AND c.`SourceGroup` = 0 AND c.`SourceEntry` = q.`ID` AND c.`SourceId` = 0
WHERE q.`ID` IN (5641, 5645, 5647) AND q.`RewardSpell` = 948091;
