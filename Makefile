NGINX_IMG=nginx
DOCKER_COMPOSE=docker compose -f ./srcs/docker-compose.yml

all: down up
	${DOCKER_COMPOSE} exec wordpress /bin/ash

up:
	${DOCKER_COMPOSE} up --build -d 

run:
	${DOCKER_COMPOSE} run --build nginx

ps:
	${DOCKER_COMPOSE} ps

down:
	${DOCKER_COMPOSE} down

# Testing
alpine:
	docker run -it --rm -p 8080:80 alpine:3.18 /bin/ash 

