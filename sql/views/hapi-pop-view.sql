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
SELECT POP.*,
       D.code AS dataset_code,
       D.title AS dataset_title,
       D.provider_code AS dataset_provider_code,
       D.provider_name AS dataset_provider_name,
       R.code AS resource_code,
       R.filename AS resource_filename,
       R.update_date AS resource_update_date,
       G.description AS gender_description,
       ADM2.name AS admin2_name,
       ADM2.is_unspecified AS admin2_is_unspecified,
       ADM1.name AS admin1_name,
       ADM1.is_unspecified AS admin1_is_unspecified,
       LOC.name AS location_name
FROM Population POP
LEFT JOIN Resource R ON POP.resource_ref=R.id
LEFT JOIN Dataset D ON R.dataset_ref=D.id
LEFT JOIN Gender G ON POP.gender_code=G.code
LEFT JOIN AgeRange AR ON POP.age_range_code=AR.code
LEFT JOIN Admin2 ADM2 ON POP.admin2_ref=ADM2.id
LEFT JOIN Admin1 ADM1 ON ADM2.admin1_ref=ADM1.id
LEFT JOIN Location LOC ON ADM1.location_ref=LOC.id;

-- end
