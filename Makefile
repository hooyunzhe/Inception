SRCS			= srcs
COMPOSE_FILE	= docker-compose.yml
MDB_VOLUME_DIR	= $(HOME)/data/mariadb
WP_VOLUME_DIR	= $(HOME)/data/wordpress

DOCKER			= docker
COMPOSE			= docker-compose
MKDIR			= mkdir -p

COMPOSE_FLAGS	= -f
UP_FLAGS		= -d --build
DOWN_FLAGS		= --rmi all --remove-orphans

all: volumes
	$(COMPOSE) $(COMPOSE_FLAGS) $(SRCS)/$(COMPOSE_FILE) up $(UP_FLAGS)

volumes:
	$(MKDIR) $(MDB_VOLUME_DIR) $(WP_VOLUME_DIR)

show:
	$(COMPOSE) $(COMPOSE_FLAGS) $(SRCS)/$(COMPOSE_FILE) ps

images:
	$(DOCKER) images

clean:
	$(COMPOSE) $(COMPOSE_FLAGS) $(SRCS)/$(COMPOSE_FILE) down $(DOWN_FLAGS)

fclean:	clean
	$(DOCKER) system prune -f
	$(DOCKER) volume prune -f
	rm -rf $(HOME)/data/mariadb/*
	rm -rf $(HOME)/data/wordpress/*

re:	fclean all

.PHONY:	all show clean fclean