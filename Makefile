init:
	docker-compose build
	docker-compose run --rm api rails db:create
	docker-compose down
run:
	docker-compose up
