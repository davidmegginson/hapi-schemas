HAPI database schemas
=====================

SQL schemas for the Humanitarian API (HAPI) from the [Centre for
Humanitarian Data](https://centre.humdata.org).

In this release, the schemas are designed for SQLite for early
development and testing, but may/should also work with PostgreSQL.

## Prerequisites

- SQLite3 database manager.
- Unix _make_ command

## Usage

To create a test database in ``databases/hapi-test.sql`` with simple
sample data:

```
$ make
```

To explore the database:

```
$ sqlite3 databases/hapi-test.sql
```

## Design notes

There is a denormalised view in ``sql/views`` corresponding to every
table type in ``sql/schema``. On the API side, we will _always_
reference the views rather than the tables; that way, if the
underlying table structures change, the views can insulate our API
code.

Any changes to the tables in ``sql/schema/hapi-core-tables.sql`` need
to be reflected in the views in ``sql/views/`` as well; otherwise, the
database may break.

## Files

-- | -- | --
Directory | File | Description
-- | -- | --
``./`` | ``README.md`` | You are here.
``./`` | ``UNLICENSE.md`` | Public-domain non-license.
``./`` | ``Makefile`` | Build file for the test data.
``./sql/schema/`` | | Definitions for the database tables, relational-dependencies, and indices.
``./sql/schema/`` | ``hapi-core-tables.sql`` | Definitions for the core tables (used by more than one type of data)
``./sql/schema/`` | ``hapi-op-tables.sql`` | Definition for the operational-presence table. Depends on ``hapi-core-tables.sql``
``./sql/schema/`` | ``hapi-pop-tables.sql`` | Definition for the baseline-population table. Depends on ``hapi-core-tables.sql``
``./sql/views/`` | | SQL view definitions.  The API application layer code should _always_ use these, never the tables themselves.
``./sql/views/`` | ``hapi-core-views.sql`` | SQL views for the core tables. You must create the tables in ``./sql/schema/`` first
``./sql/views/`` | ``hapi-op-views.sql`` | SQL view for the operation-presence table.
``./sql/views/`` | ``hapi-pop-views.sql`` | SQL view for the baseline-population table.
``./sql/samples/`` | | _Very_ simple sample data to test the database and views. You must create the tables in ``./sql/schema/`` first.
``./sql/samples/`` | ``core-data.sql`` | Sample data for the core tables.
``./sql/samples/`` | ``op-data.sql`` | Sample data for the operational-presence table.
``./sql/samples/`` | ``pop-data.sql`` | Sample data for the baseline-population table.
``./databases/`` | | Test SQLite3 databases.
``./databases/`` | ``hapi-test.sql`` | Test database build by the ``Makefile``

As we progress, we can import larger sample datasets from CSV instead of declaring them in SQL.

## Automated tests

Coming soon.

## Unlicense

This code and sample data is in the PUBLIC DOMAIN (see UNLICENSE.md).