NAME = inception

COMPOSE = docker compose -f ./srcs/docker-compose.yml

all: up
	mkdir -p /home/lloginov/data/wordpress
	mkdir -p /home/lloginov/data/mariadb

up:
	$(COMPOSE) up -d --build

down:
	$(COMPOSE) down

start:
	$(COMPOSE) start

stop:
	$(COMPOSE) stop

restart: down up

logs:
	$(COMPOSE) logs -f

ps:
	$(COMPOSE) ps

clean:
	$(COMPOSE) down -v

fclean: clean
# 	docker system prune -af

prune : clean 
	 docker system prune -af

re: fclean up

.PHONY: all up down start stop restart logs ps clean fclean re