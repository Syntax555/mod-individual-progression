-- Mirelow uses the Wetlands waypoint patrol instead of the former spawn pool.
DELETE FROM `pool_template`
WHERE `entry` = 1072 AND `max_limit` = 1 AND `description` = 'Mirelow (14424)'
  AND NOT EXISTS (SELECT 1 FROM `pool_creature` WHERE `pool_entry` = 1072)
  AND NOT EXISTS (SELECT 1 FROM `pool_gameobject` WHERE `pool_entry` = 1072)
  AND NOT EXISTS (SELECT 1 FROM `pool_quest` WHERE `pool_entry` = 1072)
  AND NOT EXISTS (SELECT 1 FROM `pool_pool` WHERE `pool_id` = 1072 OR `mother_pool` = 1072)
  AND NOT EXISTS (SELECT 1 FROM `game_event_pool` WHERE `pool_entry` = 1072);
