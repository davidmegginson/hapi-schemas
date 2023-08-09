-- ---------------------------------------------------------------------
-- Denormalised operation presence (3W) view for HAPI
--
-- Started 2023-08-09
--
-- Depends on hapi-core-tables.sql and hapi-op-tables.sql
-- ---------------------------------------------------------------------

DROP VIEW IF EXISTS OperationalPresenceView;

-- TODO: fill in fields
CREATE VIEW OperationalPresenceView AS
SELECT OP.*
FROM OperationalPresence OP
LEFT JOIN Resource R ON OP.resource_ref=R.id
LEFT JOIN Dataset D ON R.dataset_ref=D.id
LEFT JOIN Org O ON OP.org_ref=O.id
LEFT JOIN OrgType OT ON O.org_type_code=OT.code
LEFT JOIN Sector S ON OP.sector_ref=S.id
LEFT JOIN Admin2 ADM2 ON OP.admin2_ref=ADM2.id
LEFT JOIN Admin1 ADM1 ON ADM2.admin1_ref=ADM1.id
LEFT JOIN Location LOC ON ADM1.location_ref=LOC.id;

-- end

