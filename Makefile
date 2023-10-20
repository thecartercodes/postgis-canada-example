build:
	bash scripts/bootstrap.sh

db-shell:
	psql -h localhost -p 1255 -U tm41m -d tm41m