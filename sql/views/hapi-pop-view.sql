-- ---------------------------------------------------------------------
-- Denormalised baseline-population view for HAPI
--
-- Started 2023-08-09
--
-- Depends on hapi-core-tables.sql and hapi-pop-tables.sql
-- ---------------------------------------------------------------------

DROP VIEW IF EXISTS PopulationView;

-- TODO fill in fields
CREATE VIEW PopulationView AS
SELECT POP.*
FROM Population POP
LEFT JOIN Gender G ON POP.gender_code=G.code
LEFT JOIN AgeRange AR ON POP.age_range_code=AR.code
LEFT JOIN Admin2 ADM2 ON POP.admin2_ref=ADM2.id
LEFT JOIN Admin1 ADM1 ON ADM2.admin1_ref=ADM1.id
LEFT JOIN Location LOC ON ADM1.location_ref=LOC.id;

-- end
