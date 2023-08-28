-- ---------------------------------------------------------------------
-- Sample data for the baseline population table.
--
-- Started 2023-08-09
--
-- Note: we add explicit IDs here to simply cross referencing, but in
-- production we'll let the database generate them automatically.
--
-- Depends on core-data.sql
-- ------------------------------------------------------------------------

INSERT INTO Population (id, resource_ref, admin2_ref, gender_code, age_range_code, population, reference_period_start, reference_period_end, source_data)
VALUES
(1, 1, 1, NULL, NULL, 1000000, '2023-01-01 00:00:00', '2023-06-30 00:00:00', 'DATA,DATA,DATA'),       -- total national
(2, 1, 1, 'f', NULL, 500001, '2023-01-01 00:00:00',  '2023-06-30 00:00:00','DATA,DATA,DATA'),         -- national (f), all ages
(3, 1, 1, 'm', NULL, 489999, '2023-01-01 00:00:00',  '2023-06-30 00:00:00','DATA,DATA,DATA'),         -- national (f), all ages
(4, 1, 1, 'x', NULL, 9999, '2023-01-01 00:00:00',  '2023-06-30 00:00:00','DATA,DATA,DATA'),           -- national (x), all ages
(5, 1, 1, 'f', '0-4', 300000, '2023-01-01 00:00:00',  '2023-06-30 00:00:00','DATA,DATA,DATA'),   -- national (f) children
(6, 1, 2, 'x', '5-9', 2000, '2023-01-01 00:00:00',  '2023-06-30 00:00:00','DATA,DATA,DATA'),  -- admin1 (x) adolescents
(7, 1, 4, 'm', '10-14', 100000, '2023-01-01 00:00:00',  '2023-06-30 00:00:00','DATA,DATA,DATA');    -- admin2 (m) elderly

-- end
