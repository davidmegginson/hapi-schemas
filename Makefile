SQLITE_CMD=/usr/bin/sqlite3
SCHEMA_DIR=./sql/schemas
SAMPLE_DIR=./sql/samples
DATABASE_DIR=./databases

CORE_SCHEMA=${SCHEMA_DIR}/hapi-core-tables.sql
OP_SCHEMA=${SCHEMA_DIR}/hapi-op-tables.sql
POP_SCHEMA=${SCHEMA_DIR}/hapi-pop-tables.sql

GENDER_DATA=${SAMPLE_DIR}/gender-data.sql
AGE_RANGE_DATA=${SAMPLE_DIR}/age-range-data.sql

TEST_DATABASE=${DATABASE_DIR}/hapi-test.sql
TEST_SCHEMAS=${CORE_SCHEMA} ${OP_SCHEMA} ${POP_SCHEMA}
TEST_DATA=${GENDER_DATA} ${AGE_RANGE_DATA}

all: test-database-recreate

test-database-create: ${TEST_DATABASE}

test-database-delete:
	rm -f ${TEST_DATABASE}

test-database-recreate: test-database-delete test-database-create

${TEST_DATABASE}: ${DATABASE_DIR} ${CORE_SCHEMA}
	cat ${TEST_SCHEMAS} ${TEST_DATA} | ${SQLITE_CMD} ${TEST_DATABASE_FILE}

${DATABASE_DIR}:
	mkdir -p ${DATABASE_DIR}
