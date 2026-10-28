-- Frostmane Hold is available without Senir's Observations in Blizzard Classic and Wrath Classic.
-- Sources: https://github.com/Questie/Questie/pull/4602 and https://github.com/Questie/Questie/issues/5063
-- Preserve other quests, follow-up requirements and customized prerequisites.
UPDATE `quest_template_addon` SET `PrevQuestID` = 0 WHERE `ID` = 287 AND `PrevQuestID` = 420;
