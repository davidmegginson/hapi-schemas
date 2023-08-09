-- ---------------------------------------------------------------------
-- HAPI baseline population database tables.
--
-- Started 2023-08-09
--
-- These depend on the tables in hapi-core-tables.sql
--
-- For ANSI SQL, replace "SERIAL PRIMARY KEY" with "GENERATED ALWAYS
-- AS IDENTITY" (works with PostgreSQL, but not SQLite or MySQL).
-- ---------------------------------------------------------------------

CREATE TABLE Population (
       id SERIAL PRIMARY KEY,
       resource_ref INT NOT NULL,
       admin2_ref INT NOT NULL,
       gender CHAR(1),
       age_range VARCHAR(32),
       population INT NOT NULL,
       valid_date DATE NOT NULL,
       source_data TEXT,
       FOREIGN KEY (gender) REFERENCES Gender(code)
               ON UPDATE CASCADE,
       FOREIGN KEY (age_range) REFERENCES AgeRange(code)
               ON UPDATE CASCADE
);

CREATE INDEX Population_population_index
ON Population(population);

-- end
