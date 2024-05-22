NGINX_IMG=nginx
DOCKER_COMPOSE=docker compose -f ./srcs/docker-compose.yml

all: down up
	${DOCKER_COMPOSE} exec term /bin/ash

up:
	${DOCKER_COMPOSE} up --build -d 

run:
	${DOCKER_COMPOSE} run --build nginx

ps:
	${DOCKER_COMPOSE} ps

down:
	${DOCKER_COMPOSE} down
