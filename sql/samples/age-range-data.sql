-- ---------------------------------------------------------------------
-- Sample age ranges for the test database.
--
-- Started 2023-08-09
--
-- These are temporary and will change for production.-- ---------------------------------------------------------------------

INSERT INTO AgeRange (code, description) VALUES
('infants', 'children under 5'),
('children', 'children 5-12'),
('adolescents', 'children 13-17'),
('adults', 'adults 18-64'),
('elderly', 'adults 65+');

-- end
