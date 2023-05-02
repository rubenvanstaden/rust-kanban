# Wait for postgres to initialize properly.
take-nap:
	sleep 3

# Must have DB running & DATABASE_URL env var for this command to work
run-migrations:
	diesel migration run

db-up:
	docker run --rm \
		--name kanban-postgres \
		--tmpfs=/pgtmpfs \
		--env PGDATA=/pgtmpfs \
		--env POSTGRES_HOST_AUTH_METHOD=trust \
		--publish 5432:5432 \
		--detach postgres:13

start-dev: db-up take-nap run-migrations

db-down:
	docker stop kanban-postgres
