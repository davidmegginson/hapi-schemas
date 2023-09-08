-- ----------------------------------------------------------------------
-- Views for core data types
--
-- Started 2023-08-09
--
-- On the API end, we will always reference the views rather than the
-- tables, to insulate us from changes in the underlying structure.
-- That's why there are views even for tables that have no joins.
-- ---------------------------------------------------------------------

DROP VIEW IF EXISTS dataset_view;

CREATE VIEW dataset_view AS
SELECT D.*
FROM dataset D;


DROP VIEW IF EXISTS resource_view;

CREATE VIEW resource_view AS
SELECT R.*,
       D.title AS dataset_title,
       D.provider_code AS dataset_provider_code,
       D.provider_name AS dataset_provider_name
FROM resource R
LEFT JOIN dataset D ON R.dataset_ref=D.id;


DROP VIEW IF EXISTS sector_view;

CREATE VIEW sector_view AS
SELECT S.*
FROM sector S;


DROP VIEW IF EXISTS org_type_view;

CREATE VIEW org_type_view AS
SELECT OT.*
FROM org_type OT;


DROP VIEW IF EXISTS org_view;

CREATE VIEW org_view AS
SELECT O.*, OT.description AS org_type_description
FROM org O
LEFT JOIN org_type OT ON O.org_type_code=OT.code;


DROP VIEW IF EXISTS admin2_view;

CREATE VIEW admin2_view AS
SELECT ADM2.*,
       ADM1.name AS admin1_name,
       ADM1.is_unspecified AS admin1_is_unspecified,
       ADM1.reference_period_start AS admin1_reference_period_start,
       ADM1.reference_period_end AS admin1_reference_period_end,
       LOC.code AS location_code,
       LOC.name AS location_name,
       LOC.reference_period_start AS location_reference_period_start,
       LOC.reference_period_end AS location_reference_period_end
FROM admin2 ADM2
LEFT JOIN admin1 ADM1 ON ADM2.admin1_ref=ADM1.id
LEFT JOIN location LOC ON ADM1.location_ref=LOC.id;


DROP VIEW IF EXISTS admin1_view;

CREATE VIEW admin1_view AS
SELECT ADM1.*,
       LOC.code AS location_code,
       LOC.name AS location_name,
       LOC.reference_period_start AS location_reference_period_start,
       LOC.reference_period_end AS location_reference_period_end
FROM admin1 ADM1
LEFT JOIN location LOC ON ADM1.location_ref=LOC.id;


DROP VIEW IF EXISTS location_view;

CREATE VIEW location_view AS
SELECT LOC.*
FROM location LOC;


DROP VIEW IF EXISTS gender_view;

CREATE VIEW gender_view AS
SELECT G.*
FROM gender G;


DROP VIEW IF EXISTS age_range_view;

CREATE VIEW age_range_view AS
SELECT AR.*
FROM age_range AR;

-- end
