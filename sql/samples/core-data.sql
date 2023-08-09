-- ---------------------------------------------------------------------
-- Dummy core data for testing.
--
-- Note: we add explicit IDs here to simply cross referencing, but in
-- production we'll let the database generate them automatically.
--
-- Started 2023-08-09
-- ---------------------------------------------------------------------

INSERT INTO Dataset (id, hdx_link, code, title, provider_code, provider_name, api_link)
VALUES
(1, 'https://example.org/dataset01', 'dataset01', 'Dataset #1', 'provider01', 'Provider #1', 'https://example.org/api/dataset01'),
(2, 'https://example.org/dataset02', 'dataset02', 'Dataset #2', 'provider02', 'Provider #2', 'https://example.org/api/dataset02');

INSERT INTO Resource (id, dataset_ref, hdx_link, code, filename, mime_type, update_date, is_hxl, api_link)
VALUES
(1, 1, 'https://example.org/resource01', 'resource01', 'resource-01.csv', 'text/csv', '2023-06-01', TRUE, 'https://example.org/api/resource01'),
(2, 1, 'https://example.org/resource02', 'resource02', 'resource-02.xlsx', 'application/ms-excel', '2023-07-01', TRUE, 'https://example.org/api/resource02'),
(3, 2, 'https://example.org/resource03', 'resource03', 'resource-03.csv', 'text/csv', '2023-08-01', TRUE, 'https://example.org/api/resource03');

-- these are the actual datatypes from
-- https://data.humdata.org/dataset/organization-types-beta
INSERT INTO OrgType (code, description) VALUES
('431', 'Academic / Research'),
('433', 'Donor'),
('434', 'Embassy'),
('435', 'Government'),
('437', 'International NGO'),
('438', 'International Organization'),
('439', 'Media'),
('440', 'Military'),
('441', 'National NGO'),
('443', 'Other'),
('444', 'Private sector'),
('445', 'Red Cross / Red Crescent'),
('446', 'Religious'),
('447', 'United Nations');

-- dummy data
INSERT INTO Org (id, hdx_link, acronym, name, org_type_code, valid_date) VALUES
(1, 'https://example.org/org01', 'ORG01', 'Organisation 1', '433', '2023-08-01'),
(2, 'https://example.org/org02', 'ORG02', 'Organisation 2', '437', '2023-07-01'),
(3, 'https://example.org/org03', 'ORG03', 'Organisation 3', '447', '2023-06-01');

-- these are the actual sector codes from
-- https://data.humdata.org/dataset/global-coordination-groups-beta
-- (they won't be sufficient for production; we'll have to add to them)
INSERT INTO Sector (code, name, valid_date)
VALUES
('SHL', 'Emergency Shelter and NFI', '2023-01-01'),
('CCM', 'Camp Coordination / Management', '2023-01-01'),
('PRO-MIN', 'Mine Action', '2023-01-01'),
('FSC', 'Food Security', '2023-01-01'),
('WSH', 'Water Sanitation Hygiene', '2023-01-01'),
('LOG', 'Logistics', '2023-01-01'),
('PRO-CPN', 'Child Protection', '2023-01-01'),
('PRO', 'Protection', '2023-01-01'),
('EDU', 'Education', '2023-01-01'),
('NUT', 'Nutrition', '2023-01-01'),
('HEA', 'Health', '2023-01-01'),
('ERY', 'Early Recovery', '2023-01-01'),
('TEL', 'Emergency Telecommunications', '2023-01-01'),
('PRO-GBV', 'Gender Based Violence', '2023-01-01'),
('PRO-HLP', 'Housing, Land and Property', '2023-01-01');

-- dummy data
INSERT INTO Location (id, code, name, centroid_lat, centroid_lon, valid_date_start, valid_date_end)
VALUES
(1, 'FOO', 'Foolandia', 1, -1, '2023-01-01', NULL);

-- dummy data
INSERT INTO Admin1 (id, location_ref, code, name, centroid_lat, centroid_lon, is_unspecified, valid_date_start, valid_date_end)
VALUES
(1, 1, 'FOO-XXX', 'Unspecified', 1, -1, TRUE, '2023-01-01', NULL),
(2, 1, 'FOO-001', 'Province 01', 1, -1, FALSE, '2023-01-01', NULL),
(3, 1, 'FOO-002', 'Province 02', 1, -1, FALSE, '2023-01-01', NULL);

-- dummy data
-- note that we need an "Unspecified" for every Admin1, including the unspecified one
INSERT INTO Admin2 (id, admin1_ref, code, name, centroid_lat, centroid_lon, is_unspecified, valid_date_start, valid_date_end)
VALUES
(1, 1, 'FOO-XXX-XXX', 'Unspecified', 1, -1, TRUE, '2023-01-01', NULL),
(2, 2, 'FOO-001-XXX', 'Unspecified', 1, -1, TRUE, '2023-01-01', NULL),
(3, 3, 'FOO-002-XXX', 'Unspecified', 1, -1, TRUE, '2023-01-01', NULL),
(4, 2, 'FOO-001-A', 'District A', 1, -1, FALSE, '2023-01-01', NULL),
(5, 2, 'FOO-001-B', 'District B', 1, -1, FALSE, '2023-01-01', NULL),
(6, 3, 'FOO-002-C', 'District C', 1, -1, FALSE, '2023-01-01', NULL),
(7, 3, 'FOO-002-D', 'District D', 1, -1, FALSE, '2023-01-01', NULL);


-- may be OK for production
INSERT INTO GENDER (code, description) VALUES
('f', 'female'),
('m', 'male'),
('x', 'non-binary');

-- will likely change for production
INSERT INTO AgeRange (code, description) VALUES
('infants', 'children under 5'),
('children', 'children 5-12'),
('adolescents', 'children 13-17'),
('adults', 'adults 18-64'),
('elderly', 'adults 65+');

-- end

