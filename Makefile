SQLITE_CMD=/usr/bin/sqlite3
SCHEMA_DIR=./sql/schemas
VIEW_DIR=./sql/views
SAMPLE_DIR=./sql/samples
DATABASE_DIR=./databases

CORE_SCHEMA=${SCHEMA_DIR}/hapi-core-tables.sql
OP_SCHEMA=${SCHEMA_DIR}/hapi-op-tables.sql
POP_SCHEMA=${SCHEMA_DIR}/hapi-pop-tables.sql

CORE_VIEWS=${VIEW_DIR}/hapi-core-views.sql
OP_VIEW=${VIEW_DIR}/hapi-op-view.sql
POP_VIEW=${VIEW_DIR}/hapi-pop-view.sql

ORG_TYPE_DATA=${SAMPLE_DIR}/org-type-data.sql
ORG_DATA=${SAMPLE_DIR}/org-data.sql
GENDER_DATA=${SAMPLE_DIR}/gender-data.sql
AGE_RANGE_DATA=${SAMPLE_DIR}/age-range-data.sql

TEST_SCHEMAS=${CORE_SCHEMA} ${OP_SCHEMA} ${POP_SCHEMA}
TEST_VIEWS=${CORE_VIEWS} ${OP_VIEW} ${POP_VIEW}
TEST_DATA=${ORG_TYPE_DATA} ${ORG_DATA} ${GENDER_DATA} ${AGE_RANGE_DATA}

TEST_DATABASE=${DATABASE_DIR}/hapi-test.sqlite

all: test-database-recreate

test-database-create: ${TEST_DATABASE}

test-database-delete:
	rm -f ${TEST_DATABASE}

test-database-recreate: test-database-delete test-database-create

${TEST_DATABASE}: ${DATABASE_DIR} ${CORE_SCHEMA}
	cat ${TEST_SCHEMAS} ${TEST_VIEWS} ${TEST_DATA} | ${SQLITE_CMD} ${TEST_DATABASE}

${DATABASE_DIR}:
	mkdir -p ${DATABASE_DIR}
