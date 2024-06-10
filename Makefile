NGINX_IMG=nginx
DOCKER_COMPOSE=docker compose -f ./srcs/docker-compose.yml

all: down up
	${DOCKER_COMPOSE} exec database /bin/ash

up: check_env
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

# Checks
check_env:
	@./srcs/tools/check_env.sh

# Testing
# Utils
env-example: 
	sed 's/=.*/=/' ./srcs/.env > ./srcs/.env-example

alpine:
	docker run -it --rm -p 8080:80 alpine:3.18 /bin/ash 

