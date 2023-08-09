HAPI database schemas
=====================

SQL schemas for the Humanitarian API (HAPI) from the [Centre for
Humanitarian Data](https://centre.humdata.org).

In this release, the schemas are designed for SQLite for early
development and testing, but may/should also work with PostgreSQL.

The included Makefile manages dependencies and creates a test database
in ``databases/hapi-test.sql``. To generate the test database, simply
type ``make`` in the root directory of the distro.

## Design notes

There is a denormalised view in ``sql/views`` corresponding to every
table type in ``sql/schema``. On the API side, we will _always_
reference the views rather than the tables; that way, if the
underlying table structures change, the views can insulate our API
code.

Any changes to the tables in ``sql/schema/hapi-core-tables.sql`` need
to be reflected in the views in ``sql/views/`` as well; otherwise, the
database may break.