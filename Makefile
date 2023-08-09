SQLITE_CMD=/usr/bin/sqlite3
SCHEMA_DIR=./sql/schemas
VIEW_DIR=./sql/views
SAMPLE_DIR=./sql/samples
DATABASE_DIR=./databases

# SQL table definitions (in order of dependency)
CORE_SCHEMA=${SCHEMA_DIR}/hapi-core-tables.sql
OP_SCHEMA=${SCHEMA_DIR}/hapi-op-tables.sql
POP_SCHEMA=${SCHEMA_DIR}/hapi-pop-tables.sql

# SQL view definitions
CORE_VIEWS=${VIEW_DIR}/hapi-core-views.sql
OP_VIEW=${VIEW_DIR}/hapi-op-view.sql
POP_VIEW=${VIEW_DIR}/hapi-pop-view.sql

# Sample data (in order of dependency)
CORE_DATA=${SAMPLE_DIR}/core-data.sql
OP_DATA=${SAMPLE_DIR}/op-data.sql
POP_DATA=${SAMPLE_DIR}/pop-data.sql

# Info for a simple test database
TEST_DATABASE=${DATABASE_DIR}/hapi-test.sqlite
TEST_SCHEMAS=${CORE_SCHEMA} ${OP_SCHEMA} ${POP_SCHEMA}
TEST_VIEWS=${CORE_VIEWS} ${OP_VIEW} ${POP_VIEW}
TEST_DATA=${CORE_DATA} ${OP_DATA} ${POP_DATA}

all: test-database-recreate

test-database-create: ${TEST_DATABASE}

test-database-delete:
	rm -f ${TEST_DATABASE}

test-database-recreate: test-database-delete test-database-create

${TEST_DATABASE}: ${DATABASE_DIR} ${CORE_SCHEMA}
	cat ${TEST_SCHEMAS} ${TEST_VIEWS} ${TEST_DATA} | ${SQLITE_CMD} ${TEST_DATABASE}

${DATABASE_DIR}:
	mkdir -p ${DATABASE_DIR}
