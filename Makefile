.PHONY: init run down ps

init:
	docker-compose build
	docker-compose run --rm api rails db:create
	docker-compose down
run:
	docker-compose up

down:
	docker-compose down

ps:
	docker-compose ps


.PHONY: mock/*

mock/run: docs/api_blueprint.md
	docker-compose -f document-compose.yml up ${ARG}

mock/down:
	docker-compose -f document-compose.yml down

mock/ps:
	docker-compose -f document-compose.yml ps

mock/logs:
	docker-compose -f document-compose.yml logs ${ARG}

mock/clean:
	docker-compose -f document-compose.yml down -v --rmi all


.PHONY: all/*

all/down: down mock/down ;

all/ps: ps mock/ps ;

