-- ---------------------------------------------------------------------
-- HAPI core common database tables.
--
-- Started 2023-08-09
--
-- NOTE: any changes here also need to be reflected in the views
-- under sql/views; otherwise, the database will break.
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

CREATE TABLE Dataset (
       id SERIAL PRIMARY KEY,
       hdx_link VARCHAR(512) UNIQUE NOT NULL,
       code VARCHAR(128) UNIQUE NOT NULL,
       title VARCHAR(1024) NOT NULL,
       provider_code VARCHAR(128) NOT NULL,
       provider_name VARCHAR(512) NOT NULL,
       api_link VARCHAR(1024) UNIQUE NOT NULL
);

CREATE INDEX Dataset_provider_code_index
ON Dataset(provider_code);

CREATE INDEX Dataset_provider_name_index
ON Dataset(provider_name);

CREATE TABLE Resource (
       id SERIAL PRIMARY KEY,
       dataset_ref INT NOT NULL,
       hdx_link VARCHAR(512) UNIQUE NOT NULL,
       code VARCHAR(128) UNIQUE NOT NULL,
       filename VARCHAR(256) NOT NULL,
       format VARCHAR(32) NOT NULL,
       update_date DATETIME NOT NULL,
       is_hxl BOOLEAN NOT NULL,
       api_link VARCHAR(1024) UNIQUE NOT NULL,
       FOREIGN KEY(dataset_ref) REFERENCES Dataset(id)
              ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX Resource_update_date_index
ON Resource(update_date);

CREATE INDEX Resource_is_hxl_index
ON Resource(is_hxl);


--
-- Humanitarian response
--

CREATE TABLE Sector (
       code VARCHAR(32) PRIMARY KEY UNIQUE NOT NULL,
       name VARCHAR(512) NOT NULL,
       reference_period_start DATETIME NOT NULL,
       reference_period_end DATETIME DEFAULT NULL
);

CREATE INDEX Sector_name_index
ON Sector(name);

CREATE INDEX Sector_reference_period_start_index
ON Sector(reference_period_start);

CREATE TABLE OrgType (
       code VARCHAR(32) PRIMARY KEY NOT NULL,
       description VARCHAR(512) NOT NULL
);

CREATE TABLE Org (
       id SERIAL PRIMARY KEY,
       hdx_link VARCHAR(1024) NOT NULL,
       acronym VARCHAR(32) NOT NULL,
       name VARCHAR(512) NOT NULL,
       org_type_code VARCHAR(32),
       reference_period_start DATETIME NOT NULL,
       reference_period_end DATETIME DEFAULT NULL,
       FOREIGN KEY (org_type_code) REFERENCES OrgType(code)
               ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX Org_acronym_index
ON Org(acronym);

CREATE INDEX Org_reference_period_start_index
ON Org(reference_period_start);


--
-- Geodata
--
-- Location ::= Admin1+
-- Admin1 ::= Admin2+
--

CREATE TABLE Location (
       id SERIAL PRIMARY KEY,
       code VARCHAR(128) UNIQUE NOT NULL,
       name VARCHAR(512) NOT NULL,
       reference_period_start DATETIME NOT NULL,
       reference_period_end DATETIME DEFAULT NULL
);

CREATE TABLE Admin1 (
       id SERIAL PRIMARY KEY,
       location_ref INT,
       code VARCHAR(128) UNIQUE NOT NULL,
       name VARCHAR(512) NOT NULL,
       is_unspecified BOOLEAN DEFAULT FALSE,
       reference_period_start DATETIME NOT NULL,
       reference_period_end DATETIME DEFAULT NULL,
       FOREIGN KEY(location_ref) REFERENCES Location(id)
              ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Admin2 (
       id SERIAL PRIMARY KEY,
       admin1_ref INT,
       code VARCHAR(128) UNIQUE NOT NULL,
       name VARCHAR(512) NOT NULL,
       is_unspecified BOOLEAN DEFAULT FALSE,
       reference_period_start DATETIME NOT NULL,
       reference_period_end DATETIME DEFAULT NULL,
       FOREIGN KEY(admin1_ref) REFERENCES Admin1(id)
              ON UPDATE CASCADE ON DELETE CASCADE
);


--
-- Demographics
--

CREATE TABLE Gender (
       code CHAR(1) PRIMARY KEY NOT NULL,
       description VARCHAR(256)
);

CREATE TABLE AgeRange (
       code VARCHAR(32) PRIMARY KEY NOT NULL,
       age_min INT NOT NULL,
       age_max INT
);

-- end
