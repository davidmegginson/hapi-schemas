-- ---------------------------------------------------------------------
-- HAPI operational-presence database tables.
--
-- Started 2023-08-09
--
-- These depend on the tables in hapi-core-tables.sql
--
-- For auto incrementing primary keys, use:
-- PostgreSQL: SERIAL PRIMARY KEY
-- sqlite: SERIAL PRIMARY KEY
-- ANSI SQL: GENERATED ALWAYS AS IDENTITY
-- ---------------------------------------------------------------------

--
-- Data sources on HDX
--
-- Dataset ::= Resource*
-- Resource ::= [SpecificDataType]*
--

CREATE TABLE operational_presence (
       id SERIAL PRIMARY KEY,
       resource_ref INT NOT NULL,
       org_ref INT NOT NULL,
       sector_code VARCHAR(32) NOT NULL,
       admin2_ref INT NOT NULL,
       reference_period_start TIMESTAMP NOT NULL,
       reference_period_end TIMESTAMP DEFAULT NULL,
       source_data TEXT,
       FOREIGN KEY (resource_ref) REFERENCES resource(id)
               ON UPDATE CASCADE ON DELETE CASCADE,
       FOREIGN KEY (org_ref) REFERENCES org(id)
               ON UPDATE CASCADE,
       FOREIGN KEY (sector_code) REFERENCES sector(code)
               ON UPDATE CASCADE,
       FOREIGN KEY (admin2_ref) REFERENCES admin2(id)
               ON UPDATE CASCADE
);

CREATE INDEX operational_presence_reference_period_start_index
ON operational_presence(reference_period_start);

-- end
