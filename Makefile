build:
	docker compose -f docker-compose.yml up -d

db-shell:
	psql -h localhost -p 1255 -U tm41m -d tm41m