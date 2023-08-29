-- ----------------------------------------------------------------------
-- Views for core data types
--
-- Started 2023-08-09
--
-- On the API end, we will always reference the views rather than the
-- tables, to insulate us from changes in the underlying structure.
-- That's why there are views even for tables that have no joins.
-- ---------------------------------------------------------------------

DROP VIEW IF EXISTS DatasetView;

CREATE VIEW DatasetView AS
SELECT D.*
FROM Dataset D;


DROP VIEW IF EXISTS ResourceView;

CREATE VIEW ResourceView AS
SELECT R.*,
       D.hdx_link AS dataset_hdx_link,
       D.title AS dataset_title,
       D.provider_code AS dataset_provider_code,
       D.provider_name AS dataset_provider_name,
       D.api_link AS dataset_provider_link
FROM Resource R
LEFT JOIN Dataset D ON R.dataset_ref=D.id;


DROP VIEW IF EXISTS SectorView;

CREATE VIEW SectorView AS
SELECT S.*
FROM Sector S;


DROP VIEW IF EXISTS OrgTypeView;

CREATE VIEW OrgTypeView AS
SELECT OT.*
FROM OrgType OT;


DROP VIEW IF EXISTS OrgView;

CREATE VIEW OrgView AS
SELECT O.*, OT.description AS org_type_description
FROM Org O
LEFT JOIN OrgType OT ON O.org_type_code=OT.code;


DROP VIEW IF EXISTS Admin2View;

CREATE VIEW Admin2View AS
SELECT ADM2.*,
       ADM1.name AS admin1_name,
       ADM1.is_unspecified AS admin1_is_unspecified,
       ADM1.reference_period_start AS admin1_reference_period_start,
       ADM1.reference_period_end AS admin1_reference_period_end,
       LOC.name AS location_name,
       LOC.reference_period_start AS location_reference_period_start,
       LOC.reference_period_end AS location_reference_period_end
FROM Admin2 ADM2
LEFT JOIN Admin1 ADM1 ON ADM2.admin1_ref=ADM1.id
LEFT JOIN Location LOC ON ADM1.location_ref=LOC.id;


DROP VIEW IF EXISTS Admin1View;

CREATE VIEW Admin1View AS
SELECT ADM1.*,
       LOC.name AS location_name,
       LOC.reference_period_start AS location_reference_period_start,
       LOC.reference_period_end AS location_reference_period_end
FROM Admin1 ADM1
LEFT JOIN Location LOC ON ADM1.location_ref=LOC.id;


DROP VIEW IF EXISTS LocationView;

CREATE VIEW LocationView AS
SELECT LOC.*
FROM Location LOC;


DROP VIEW IF EXISTS GenderView;

CREATE VIEW GenderView AS
SELECT G.*
FROM Gender G;


DROP VIEW IF EXISTS AgeRangeView;

CREATE VIEW AgeRangeView AS
SELECT AR.*
FROM AgeRange AR;

-- end
