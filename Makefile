init:
	docker-compose build
	docker-compose run --rm api rails db:create
	docker-compose down
up:
	docker-compose up