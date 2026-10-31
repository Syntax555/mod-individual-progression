-- Core updates newer than zone_wetlands.sql and zone_netherstorm.sql reach
-- existing realms after them. Restore what a fresh installation keeps where
-- the realm still has exactly the core rows.

-- The Wetlands Dark Iron dwarves keep the module's scripts. FLOAT casts
-- compare coordinates at the same precision as their stored values.
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (1051, 1052, 1053, 1054) AND `source_type` = 0
  AND (SELECT `core` FROM (
    SELECT COUNT(*) = 16 AND MIN((
      `entryorguid`, `source_type`, `id`, `link`, `event_type`,
      `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`,
      `event_param3`, `event_param4`, `event_param5`, `event_param6`, `action_type`,
      `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`,
      `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`,
      `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`,
      HEX(`comment`)
    ) IN (
      (1051, 0, 0, 0, 4, 0, 15, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, CAST(0 AS FLOAT), CAST(0 AS FLOAT), CAST(0 AS FLOAT), CAST(0 AS FLOAT), HEX('Dark Iron Dwarf - On Aggro - Say Line 0 (No Repeat)')),
      (1051, 0, 1, 0, 0, 0, 100, 512, 2000, 8300, 18000, 34200, 0, 0, 11, 7891, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, CAST(0 AS FLOAT), CAST(0 AS FLOAT), CAST(0 AS FLOAT), CAST(0 AS FLOAT), HEX('Dark Iron Dwarf - In Combat - Cast ''Gift of Ragnaros'' (No Repeat)')),
      (1051, 0, 2, 0, 2, 0, 100, 1, 0, 15, 0, 0, 0, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(0 AS FLOAT), CAST(0 AS FLOAT), CAST(0 AS FLOAT), CAST(0 AS FLOAT), HEX('Dark Iron Dwarf - Between 0-15% Health - Flee For Assist (No Repeat)')),
      (1052, 0, 0, 0, 0, 0, 100, 512, 2100, 7300, 18000, 26000, 0, 0, 11, 7891, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, CAST(0 AS FLOAT), CAST(0 AS FLOAT), CAST(0 AS FLOAT), CAST(0 AS FLOAT), HEX('Dark Iron Saboteur - In Combat - Cast ''Gift of Ragnaros'' (No Repeat)')),
      (1052, 0, 1, 0, 2, 0, 100, 1, 0, 15, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, CAST(0 AS FLOAT), CAST(0 AS FLOAT), CAST(0 AS FLOAT), CAST(0 AS FLOAT), HEX('Dark Iron Saboteur - Between 0-15% Health - Say Line 0 (No Repeat)')),
      (1052, 0, 2, 0, 2, 0, 100, 1, 0, 15, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, CAST(0 AS FLOAT), CAST(0 AS FLOAT), CAST(0 AS FLOAT), CAST(0 AS FLOAT), HEX('Dark Iron Saboteur - Between 0-15% Health - Say Line 1 (No Repeat)')),
      (1052, 0, 3, 0, 2, 0, 100, 1, 0, 15, 0, 0, 0, 0, 11, 3204, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, CAST(0 AS FLOAT), CAST(0 AS FLOAT), CAST(0 AS FLOAT), CAST(0 AS FLOAT), HEX('Dark Iron Saboteur - Between 0-15% Health - Cast ''Sapper Explode'' (No Repeat)')),
      (1053, 0, 0, 0, 4, 0, 15, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, CAST(0 AS FLOAT), CAST(0 AS FLOAT), CAST(0 AS FLOAT), CAST(0 AS FLOAT), HEX('Dark Iron Tunneler - On Aggro - Say Line 0 (No Repeat)')),
      (1053, 0, 1, 0, 0, 0, 100, 0, 500, 1000, 1300, 5000, 0, 0, 11, 7164, 33, 0, 0, 0, 0, 1, 0, 0, 0, 0, CAST(0 AS FLOAT), CAST(0 AS FLOAT), CAST(0 AS FLOAT), CAST(0 AS FLOAT), HEX('Dark Iron Tunneler - In Combat - Cast ''Defensive Stance'' (No Repeat)')),
      (1053, 0, 2, 0, 0, 0, 100, 512, 2000, 8500, 18000, 22000, 0, 0, 11, 7891, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, CAST(0 AS FLOAT), CAST(0 AS FLOAT), CAST(0 AS FLOAT), CAST(0 AS FLOAT), HEX('Dark Iron Tunneler - In Combat - Cast ''Gift of Ragnaros'' (No Repeat)')),
      (1053, 0, 3, 0, 0, 0, 100, 0, 3100, 12400, 8900, 15900, 0, 0, 11, 11971, 1, 0, 0, 0, 0, 2, 0, 0, 0, 0, CAST(0 AS FLOAT), CAST(0 AS FLOAT), CAST(0 AS FLOAT), CAST(0 AS FLOAT), HEX('Dark Iron Tunneler - In Combat - Cast ''Sunder Armor'' (No Repeat)')),
      (1053, 0, 4, 0, 2, 0, 100, 1, 0, 15, 0, 0, 0, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(0 AS FLOAT), CAST(0 AS FLOAT), CAST(0 AS FLOAT), CAST(0 AS FLOAT), HEX('Dark Iron Tunneler - Between 0-15% Health - Flee For Assist (No Repeat)')),
      (1054, 0, 0, 0, 4, 0, 15, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, CAST(0 AS FLOAT), CAST(0 AS FLOAT), CAST(0 AS FLOAT), CAST(0 AS FLOAT), HEX('Dark Iron Demolitionist - On Aggro - Say Line 0')),
      (1054, 0, 1, 0, 0, 0, 100, 0, 0, 0, 3600, 3800, 0, 0, 11, 8858, 64, 0, 0, 0, 0, 2, 0, 0, 0, 0, CAST(0 AS FLOAT), CAST(0 AS FLOAT), CAST(0 AS FLOAT), CAST(0 AS FLOAT), HEX('Dark Iron Demolitionist - In Combat CMC - Cast ''Bomb''')),
      (1054, 0, 2, 0, 0, 0, 100, 512, 1200, 8300, 8200, 20100, 0, 0, 11, 7891, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, CAST(0 AS FLOAT), CAST(0 AS FLOAT), CAST(0 AS FLOAT), CAST(0 AS FLOAT), HEX('Dark Iron Demolitionist - In Combat - Cast ''Gift of Ragnaros''')),
      (1054, 0, 3, 0, 2, 0, 100, 1, 0, 15, 0, 0, 0, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(0 AS FLOAT), CAST(0 AS FLOAT), CAST(0 AS FLOAT), CAST(0 AS FLOAT), HEX('Dark Iron Demolitionist - Between 0-15% Health - Flee For Assist (No Repeat)'))
    )) = 1 AS `core`
    FROM `smart_scripts` WHERE `entryorguid` IN (1051, 1052, 1053, 1054) AND `source_type` = 0) AS `previous`) = 1;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
SELECT * FROM (
  SELECT 1051 AS `entryorguid`, 0 AS `source_type`, 0 AS `id`, 0 AS `link`, 4 AS `event_type`, 0 AS `event_phase_mask`, 15 AS `event_chance`, 0 AS `event_flags`, 0 AS `event_param1`, 0 AS `event_param2`, 0 AS `event_param3`, 0 AS `event_param4`, 0 AS `event_param5`, 0 AS `event_param6`, 1 AS `action_type`, 0 AS `action_param1`, 0 AS `action_param2`, 0 AS `action_param3`, 0 AS `action_param4`, 0 AS `action_param5`, 0 AS `action_param6`, 21 AS `target_type`, 40 AS `target_param1`, 0 AS `target_param2`, 0 AS `target_param3`, 0 AS `target_param4`, 0 AS `target_x`, 0 AS `target_y`, 0 AS `target_z`, 0 AS `target_o`, 'Dark Iron Dwarf - On Aggro - Say Line 0' AS `comment`
  UNION ALL SELECT 1051, 0, 1, 0, 0, 0, 100, 0, 2000, 8000, 18000, 34000, 0, 0, 11, 7891, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Dark Iron Dwarf - In Combat - Cast Gift of Ragnaros'
  UNION ALL SELECT 1051, 0, 2, 0, 2, 0, 100, 1, 0, 15, 0, 0, 0, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dark Iron Dwarf - Between 0-15% Health - Flee For Assist (No Repeat)'
  UNION ALL SELECT 1052, 0, 0, 0, 4, 0, 15, 0, 0, 0, 0, 0, 0, 0, 1, 2, 0, 0, 0, 0, 0, 21, 40, 0, 0, 0, 0, 0, 0, 0, 'Dark Iron Saboteur - On Aggro - Say Line 2'
  UNION ALL SELECT 1052, 0, 1, 0, 0, 0, 100, 0, 2000, 7000, 18000, 26000, 0, 0, 11, 7891, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Dark Iron Saboteur - In Combat - Cast Gift of Ragnaros'
  UNION ALL SELECT 1052, 0, 2, 3, 2, 0, 100, 1, 0, 15, 0, 0, 0, 0, 11, 3204, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Dark Iron Saboteur - Between 0-15% Health - Cast Sapper Explode (No Repeat)'
  UNION ALL SELECT 1052, 0, 3, 4, 61, 0, 100, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Dark Iron Saboteur - On Sapper Explode - Say Line 0'
  UNION ALL SELECT 1052, 0, 4, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Dark Iron Saboteur - On Sapper Explode - Say Line 1'
  UNION ALL SELECT 1053, 0, 0, 0, 4, 0, 15, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 21, 40, 0, 0, 0, 0, 0, 0, 0, 'Dark Iron Tunneler - On Aggro - Say Line 0'
  UNION ALL SELECT 1053, 0, 1, 0, 0, 0, 100, 0, 1000, 3000, 180000, 180000, 0, 0, 11, 7164, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Dark Iron Tunneler - In Combat - Cast Defensive Stance'
  UNION ALL SELECT 1053, 0, 2, 0, 0, 0, 100, 512, 2000, 8000, 18000, 22000, 0, 0, 11, 7891, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Dark Iron Tunneler - In Combat - Cast Gift of Ragnaros'
  UNION ALL SELECT 1053, 0, 3, 0, 9, 0, 100, 0, 0, 0, 5000, 9000, 0, 5, 11, 11971, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'Dark Iron Tunneler - Within 0-5 Range - Cast Sunder Armor'
  UNION ALL SELECT 1053, 0, 4, 0, 2, 0, 100, 1, 0, 15, 0, 0, 0, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dark Iron Tunneler - Between 0-15% Health - Flee For Assist (No Repeat)'
  UNION ALL SELECT 1054, 0, 0, 0, 4, 0, 15, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 21, 40, 0, 0, 0, 0, 0, 0, 0, 'Dark Iron Demolitionist - On Aggro - Say Line 0'
  UNION ALL SELECT 1054, 0, 1, 0, 9, 0, 100, 0, 0, 0, 4000, 4000, 30, 60, 21, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Dark Iron Demolitionist - Outside 30 Range - Start Combat Movement'
  UNION ALL SELECT 1054, 0, 2, 0, 9, 0, 100, 0, 0, 0, 4000, 4000, 5, 30, 21, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Dark Iron Demolitionist - Within 5-30 Range - Stop Combat Movement'
  UNION ALL SELECT 1054, 0, 3, 0, 9, 0, 100, 0, 0, 0, 4000, 4000, 0, 5, 21, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Dark Iron Demolitionist - Within 0-5 Range - Start Combat Movement'
  UNION ALL SELECT 1054, 0, 4, 0, 9, 0, 100, 0, 0, 0, 2000, 4000, 5, 30, 11, 8858, 64, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'Dark Iron Demolitionist - Within 5-30 Range - Cast Bomb'
  UNION ALL SELECT 1054, 0, 5, 0, 0, 0, 100, 512, 2000, 8000, 18000, 22000, 0, 0, 11, 7891, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Dark Iron Demolitionist - In Combat - Cast Gift of Ragnaros'
  UNION ALL SELECT 1054, 0, 6, 0, 2, 0, 100, 1, 0, 15, 0, 0, 0, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dark Iron Demolitionist - Between 0-15% Health - Flee For Assist (No Repeat)'
) AS `individual_progression`
WHERE NOT EXISTS (SELECT 1 FROM `smart_scripts` WHERE `entryorguid` IN (1051, 1052, 1053, 1054) AND `source_type` = 0);

-- The core height for this Mageslayer belongs to its former spawn point.
UPDATE `creature` SET `position_z` = 76.2261
WHERE `guid` = 67474 AND `id` = 18866 AND `map` = 530
  AND `position_x` = CAST(2185.01 AS FLOAT) AND `position_y` = CAST(2281.85 AS FLOAT)
  AND `position_z` = CAST(76.0324 AS FLOAT);
