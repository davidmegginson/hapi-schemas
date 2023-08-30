# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),

## Next version (date and number TBD)

### Changed

- Simplified OperationalPresenceView and PopulationView by removing many metadata fields pulled in from the Dataset, Resource, Org, Sector, Loc, Admin1, and Admin2 tables. These fields weren't required for API queries or API results.

## [1.0] - 2023-08-24

### Changed

- Age range: removed description, added integer range
- Dates: renamed to "reference_period", added "start" and
  "end" to all relevant datasets
- Change resource metadata to provide format instead of MIME type
- Use DATETIME instead of DATE type for all dates
- Remove all centroid columns
 