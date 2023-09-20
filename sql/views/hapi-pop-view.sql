-- ---------------------------------------------------------------------
-- Denormalised baseline-population view for HAPI
--
-- Started 2023-08-09
--
-- Depends on hapi-core-tables.sql and hapi-pop-tables.sql
-- ---------------------------------------------------------------------

DROP VIEW IF EXISTS population_view;

CREATE VIEW population_view AS
SELECT POP.*,
       D.hdx_id AS dataset_hdx_id,
       D.hdx_stub as dataset_hdx_stub,
       D.title AS dataset_title,
       D.provider_code AS dataset_provider_code,
       D.provider_name AS dataset_provider_name,
       R.hdx_id AS resource_hdx_id,
       R.filename AS resource_filename,
       R.update_date AS resource_update_date,
       G.description AS gender_description,
       LOC.code AS location_code,
       LOC.name AS location_name,
       ADM1.code AS admin1_code,
       ADM1.name AS admin1_name,
       ADM1.is_unspecified AS admin1_is_unspecified,
       ADM2.code AS admin2_code,
       ADM2.name AS admin2_name,
       ADM2.is_unspecified AS admin2_is_unspecified
FROM population POP
LEFT JOIN resource R ON POP.resource_ref=R.id
LEFT JOIN dataset D ON R.dataset_ref=D.id
LEFT JOIN gender G ON POP.gender_code=G.code
LEFT JOIN age_range AR ON POP.age_range_code=AR.code
LEFT JOIN admin2 ADM2 ON POP.admin2_ref=ADM2.id
LEFT JOIN admin1 ADM1 ON ADM2.admin1_ref=ADM1.id
LEFT JOIN location LOC ON ADM1.location_ref=LOC.id;

-- end
