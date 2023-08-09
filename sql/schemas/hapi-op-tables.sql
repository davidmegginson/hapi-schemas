-- ---------------------------------------------------------------------
-- HAPI operational-presence database tables.
--
-- Started 2023-08-09
--
-- These depend on the tables in hapi-core-tables.sql
--
-- For ANSI SQL, replace "SERIAL PRIMARY KEY" with "GENERATED ALWAYS
-- AS IDENTITY" (works with PostgreSQL, but not SQLite or MySQL).
-- ---------------------------------------------------------------------

--
-- Data sources on HDX
--
-- Dataset ::= Resource*
-- Resource ::= [SpecificDataType]*
--

CREATE TABLE OperationalPresence (
       id SERIAL PRIMARY KEY NOT NULL,
       resource_ref INT NOT NULL,
       org_ref INT NOT NULL,
       sector_ref INT NOT NULL,
       admin2_ref INT NOT NULL,
       valid_date DATE NOT NULL,
       source_data TEXT
);

CREATE INDEX OperationalPresence_valid_date_index
ON OperationalPresence(valid_date);

-- end
