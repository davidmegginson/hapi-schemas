-- ---------------------------------------------------------------------
-- Sample data for the operational presence table.
--
-- Started 2023-08-09
--
-- Note: we add explicit IDs here to simply cross referencing, but in
-- production we'll let the database generate them automatically.
--
-- Depends on core-data.sql
-- ------------------------------------------------------------------------

INSERT INTO OperationalPresence (id, resource_ref, org_ref, sector_code, admin2_ref, reference_period_start, reference_period_end, source_data)
VALUES
(1, 1, 1, 'SHL', 2, '2023-01-01', NULL, 'DATA,DATA,DATA'),
(2, 1, 2, 'FSC', 4, '2023-01-01', NULL, 'DATA,DATA,DATA'),
(3, 1, 3, 'WSH', 4, '2023-01-01', NULL, 'DATA,DATA,DATA'),
(4, 1, 3, 'HEA', 6, '2023-01-01', NULL, 'DATA,DATA,DATA'),
(5, 1, 2, 'WSH', 1, '2023-01-01', NULL, 'DATA,DATA,DATA');

-- end
