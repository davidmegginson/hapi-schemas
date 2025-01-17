# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),

## [1.2.0] - 2023-09-14

### Changed

- Switch from sqlite to PostgreSQL
  
## [1.1.2] - 2023-09-06

### Fixed

- Removed duplicate field sector_code in operational_presence_view
- Add location code back to views

### Changed

- removed *_link fields (they can be constructed in the API layer)
- add download_url to resource table
- dataset and resource codes set to VARCHAR(36) (instead of 128)
- column hdx_stub added to dataset table
- rename code to hdx_id in the resource and dataset tables

## [1.1.1] - 2023-09-01

### Fixed

- Specified all foreign key references

## [1.1.0] - 2023-08-31

### Changed

- Table and view names changed to snake case for better compatability
  with PostgreSQL

## [1.0.0] - 2023-08-24

### Changed

- Age range: removed description, added integer range
- Dates: renamed to "reference_period", added "start" and
  "end" to all relevant datasets
- Change resource metadata to provide format instead of MIME type
- Update primary key to sqlite syntax
- Use DATETIME instead of DATE type for all dates
- Remove all centroid columns
- Simplified OperationalPresenceView and PopulationView by removing many metadata
  fields pulled in from the Dataset, Resource, Org, Sector, Loc, Admin1, and Admin2
  tables. These fields weren't required for API queries or API results.
