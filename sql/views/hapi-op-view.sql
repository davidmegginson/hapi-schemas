-- ---------------------------------------------------------------------
-- Denormalised operation presence (3W) view for HAPI
--
-- Started 2023-08-09
--
-- Depends on hapi-core-tables.sql and hapi-op-tables.sql
-- ---------------------------------------------------------------------

DROP VIEW IF EXISTS operational_presence_view;

CREATE VIEW operational_presence_view AS
SELECT OP.*,
       D.code AS dataset_code,
       D.hdx_stub as dataset_hdx_stub,
       D.title AS dataset_title,
       D.provider_code AS dataset_provider_code,
       D.provider_name AS dataset_provider_name,
       R.code AS resource_code,
       R.filename AS resource_filename,
       R.update_date AS resource_update_date,
       O.acronym AS org_acronym,
       O.name AS org_name,
       O.org_type_code AS org_type_code,
       OT.description AS org_type_description,
       S.name AS sector_name,
       LOC.code AS location_code,
       LOC.name AS location_name,
       ADM1.name AS admin1_name,
       ADM1.is_unspecified AS admin1_is_unspecified,
       ADM2.name AS admin2_name,
       ADM2.is_unspecified AS admin2_is_unspecified
FROM operational_presence OP
LEFT JOIN resource R ON OP.resource_ref=R.id
LEFT JOIN dataset D ON R.dataset_ref=D.id
LEFT JOIN org O ON OP.org_ref=O.id
LEFT JOIN org_type OT ON O.org_type_code=OT.code
LEFT JOIN sector S ON OP.sector_code=S.code
LEFT JOIN admin2 ADM2 ON OP.admin2_ref=ADM2.id
LEFT JOIN admin1 ADM1 ON ADM2.admin1_ref=ADM1.id
LEFT JOIN location LOC ON ADM1.location_ref=LOC.id;

-- end

