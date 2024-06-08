NGINX_IMG=nginx
DOCKER_COMPOSE=docker compose -f ./srcs/docker-compose.yml

all: down up
	${DOCKER_COMPOSE} exec wordpress /bin/ash

up:
	${DOCKER_COMPOSE} up --build -d 

exec-%:
	${DOCKER_COMPOSE} exec $* ash;

run:
	${DOCKER_COMPOSE} run --build nginx

ps:
	${DOCKER_COMPOSE} ps

down:
	${DOCKER_COMPOSE} down

logs:
	${DOCKER_COMPOSE} logs -f

fclean:
	${DOCKER_COMPOSE} down -v
# Testing
alpine:
	docker run -it --rm -p 8080:80 alpine:3.18 /bin/ash 

