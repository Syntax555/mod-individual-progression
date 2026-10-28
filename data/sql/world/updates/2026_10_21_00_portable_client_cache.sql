-- Quest rewards/objectives and item templates supplied by the portable world SQL
-- differ from the stock ACDB client cache. Keep a stable ID between data updates.
-- Preserve a higher administrator-managed version; ClientCacheVersion = 0 uses this row.
UPDATE `version` SET `cache_id` = 20261021 WHERE `cache_id` < 20261021 OR `cache_id` IS NULL;
