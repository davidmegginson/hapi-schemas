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

CREATE TABLE Population (
       id INTEGER PRIMARY KEY,
       resource_ref INT NOT NULL,
       admin2_ref INT NOT NULL,
       gender_code CHAR(1),
       age_range_code VARCHAR(32),
       population INT NOT NULL,
       reference_period_start DATE NOT NULL,
       reference_period_end DATE DEFAULT NULL,
       source_data TEXT,
       FOREIGN KEY (gender_code) REFERENCES Gender(code)
               ON UPDATE CASCADE,
       FOREIGN KEY (age_range_code) REFERENCES AgeRange(code)
               ON UPDATE CASCADE
);

CREATE INDEX Population_population_index
ON Population(population);

-- end
