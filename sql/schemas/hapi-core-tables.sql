-- ---------------------------------------------------------------------
-- HAPI core common database tables.
--
-- Started 2023-08-09
--
-- NOTE: any changes here also need to be reflected in the views
-- under sql/views; otherwise, the database will break.
--
-- For auto incrementing primary keys, use:
-- PostgreSQL: SERIAL PRIMARY KEY
-- sqlite: INTEGER PRIMARY KEY
-- ANSI SQL: GENERATED ALWAYS AS IDENTITY
-- ---------------------------------------------------------------------

--
-- Data sources on HDX
--
-- Dataset ::= Resource*
-- Resource ::= [SpecificDataType]*
--

CREATE TABLE dataset (
       id INTEGER PRIMARY KEY,
       hdx_id VARCHAR(36) UNIQUE NOT NULL,
       hdx_stub VARCHAR(128) UNIQUE NOT NULL,
       title VARCHAR(1024) NOT NULL,
       provider_code VARCHAR(128) NOT NULL,
       provider_name VARCHAR(512) NOT NULL
);

CREATE INDEX dataset_provider_code_index
ON dataset(provider_code);

CREATE INDEX dataset_provider_name_index
ON dataset(provider_name);

CREATE TABLE resource (
       id INTEGER PRIMARY KEY,
       dataset_ref INT NOT NULL,
       hdx_id VARCHAR(36) UNIQUE NOT NULL,
       filename VARCHAR(256) NOT NULL,
       format VARCHAR(32) NOT NULL,
       update_date DATETIME NOT NULL,
       is_hxl BOOLEAN NOT NULL,
       download_url VARCHAR(1024) UNIQUE NOT NULL,
       FOREIGN KEY(dataset_ref) REFERENCES dataset(id)
              ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX resource_update_date_index
ON resource(update_date);

CREATE INDEX resource_is_hxl_index
ON resource(is_hxl);


--
-- Humanitarian response
--

CREATE TABLE sector (
       code VARCHAR(32) PRIMARY KEY UNIQUE NOT NULL,
       name VARCHAR(512) NOT NULL,
       reference_period_start DATETIME NOT NULL,
       reference_period_end DATETIME DEFAULT NULL
);

CREATE INDEX sector_name_index
ON sector(name);

CREATE INDEX sector_reference_period_start_index
ON sector(reference_period_start);

CREATE TABLE org_type (
       code VARCHAR(32) PRIMARY KEY NOT NULL,
       description VARCHAR(512) NOT NULL
);

CREATE TABLE org (
       id INTEGER PRIMARY KEY,
       acronym VARCHAR(32) NOT NULL,
       name VARCHAR(512) NOT NULL,
       org_type_code VARCHAR(32),
       reference_period_start DATETIME NOT NULL,
       reference_period_end DATETIME DEFAULT NULL,
       FOREIGN KEY (org_type_code) REFERENCES org_type(code)
               ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX org_acronym_index
ON org(acronym);

CREATE INDEX org_reference_period_start_index
ON org(reference_period_start);


--
-- Geodata
--
-- Location ::= Admin1+
-- Admin1 ::= Admin2+
--

CREATE TABLE location (
       id INTEGER PRIMARY KEY,
       code VARCHAR(128) UNIQUE NOT NULL,
       name VARCHAR(512) NOT NULL,
       reference_period_start DATETIME NOT NULL,
       reference_period_end DATETIME DEFAULT NULL
);

CREATE TABLE admin1 (
       id INTEGER PRIMARY KEY,
       location_ref INT,
       code VARCHAR(128) UNIQUE NOT NULL,
       name VARCHAR(512) NOT NULL,
       is_unspecified BOOLEAN DEFAULT FALSE,
       reference_period_start DATETIME NOT NULL,
       reference_period_end DATETIME DEFAULT NULL,
       FOREIGN KEY(location_ref) REFERENCES location(id)
              ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE admin2 (
       id INTEGER PRIMARY KEY,
       admin1_ref INT,
       code VARCHAR(128) UNIQUE NOT NULL,
       name VARCHAR(512) NOT NULL,
       is_unspecified BOOLEAN DEFAULT FALSE,
       reference_period_start DATETIME NOT NULL,
       reference_period_end DATETIME DEFAULT NULL,
       FOREIGN KEY(admin1_ref) REFERENCES admin1(id)
              ON UPDATE CASCADE ON DELETE CASCADE
);


--
-- Demographics
--

CREATE TABLE gender (
       code CHAR(1) PRIMARY KEY NOT NULL,
       description VARCHAR(256)
);

CREATE TABLE age_range (
       code VARCHAR(32) PRIMARY KEY NOT NULL,
       age_min INT NOT NULL,
       age_max INT
);

-- end
