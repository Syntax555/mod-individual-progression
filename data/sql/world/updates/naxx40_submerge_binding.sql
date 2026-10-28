-- Follow naxx40_spells.sql while preserving unrelated spell and script bindings.
INSERT IGNORE INTO `spell_script_names` (`spell_id`, `ScriptName`)
SELECT `spell_id`, 'spell_gen_submerge_visual' FROM `spell_script_names`
WHERE `spell_id` = 28819 AND `ScriptName` = 'spell_submerge_visual_aura';
DELETE FROM `spell_script_names`
WHERE `spell_id` = 28819 AND `ScriptName` = 'spell_submerge_visual_aura';
