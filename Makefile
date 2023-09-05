# PostgreSQL settings
PG_CONTAINER_NAME=hapi-schema-db
PG_DATABASE=hapi
PG_USER=postgres
PG_PASSWORD=postgres
PG_PORT=5432
PG_HOST=localhost

# Directories
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

all: recreate-db

recreate-db:
	@docker-compose down
	@docker-compose up -d
	@sleep 2  # Wait for PostgreSQL to start
	@make setup-db

setup-db: create-tables create-views insert-data

create-tables:
	@cat ${CORE_SCHEMA} ${OP_SCHEMA} ${POP_SCHEMA} | docker exec -i ${PG_CONTAINER_NAME} psql -U ${PG_USER} -d ${PG_DATABASE}

create-views:
	@cat ${CORE_VIEWS} ${OP_VIEW} ${POP_VIEW} | docker exec -i ${PG_CONTAINER_NAME} psql -U ${PG_USER} -d ${PG_DATABASE}

insert-data:
	@cat ${CORE_DATA} ${OP_DATA} ${POP_DATA} | docker exec -i ${PG_CONTAINER_NAME} psql -U ${PG_USER} -d ${PG_DATABASE}
