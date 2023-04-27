SRCS			= srcs
COMPOSE_FILE	= docker-compose.yml

DOCKER			= docker
COMPOSE			= docker-compose

COMPOSE_FLAGS	= -f
UP_FLAGS		= -d --build
DOWN_FLAGS		= --rmi all --remove-orphans

all:
	$(COMPOSE) $(COMPOSE_FLAGS) $(SRCS)/$(COMPOSE_FILE) up $(UP_FLAGS)

show:
	$(COMPOSE) $(COMPOSE_FLAGS) $(SRCS)/$(COMPOSE_FILE) ps

images:
	$(DOCKER) images

clean:
	$(COMPOSE) $(COMPOSE_FLAGS) $(SRCS)/$(COMPOSE_FILE) down $(DOWN_FLAGS)

fclean:	clean
	$(DOCKER) system prune -f
	$(DOCKER) volume rm srcs_database
	$(DOCKER) volume rm srcs_website
	rm -rf $(HOME)/data/mariadb/*
	rm -rf $(HOME)/data/wordpress/*

re:	fclean all

.PHONY:	all show clean fclean