NAME = inception
COMPOSE = docker compose -f ./srcs/docker-compose.yml

all:
	mkdir -p /home/lloginov/data/wordpress
	mkdir -p /home/lloginov/data/mariadb
	$(COMPOSE) up -d --build

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
	docker system prune -af

prune: fclean
	sudo rm -rf /home/lloginov/data/wordpress
	sudo rm -rf /home/lloginov/data/mariadb

re: fclean all

.PHONY: all up down start stop restart logs ps clean fclean re prune