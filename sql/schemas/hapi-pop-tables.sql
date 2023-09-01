-- ---------------------------------------------------------------------
-- HAPI baseline population database tables.
--
-- Started 2023-08-09
--
-- These depend on the tables in hapi-core-tables.sql
--
-- For auto incrementing primary keys, use:
-- PostgreSQL: SERIAL PRIMARY KEY
-- sqlite: INTEGER PRIMARY KEY
-- ANSI SQL: GENERATED ALWAYS AS IDENTITY
-- ---------------------------------------------------------------------

CREATE TABLE population (
       id INTEGER PRIMARY KEY,
       resource_ref INT NOT NULL,
       admin2_ref INT NOT NULL,
       gender_code CHAR(1),
       age_range_code VARCHAR(32),
       population INT NOT NULL,
       reference_period_start DATETIME NOT NULL,
       reference_period_end DATETIME DEFAULT NULL,
       source_data TEXT,
       FOREIGN KEY (resource_ref) REFERENCES resource(id)
               ON UPDATE CASCADE,
       FOREIGN KEY (admin2_ref) REFERENCES admin2(id)
               ON UPDATE CASCADE,
       FOREIGN KEY (gender_code) REFERENCES gender(code)
               ON UPDATE CASCADE,
       FOREIGN KEY (age_range_code) REFERENCES age_range(code)
               ON UPDATE CASCADE
);

CREATE INDEX population_population_index
ON population(population);

-- end
