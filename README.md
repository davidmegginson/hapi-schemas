HAPI database schemas
=====================

SQL schemas for the Humanitarian API (HAPI) from the [Centre for
Humanitarian Data](https://centre.humdata.org).

In this release, the schemas are designed for SQLite for early
development and testing, but may/should also work with PostgreSQL.

The included Makefile manages dependencies and creates a test database
in ``databases/hapi-test.sql``. To generate the test database, simply
type ``make`` in the root directory of the distro.