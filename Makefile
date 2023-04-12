SRCS			= srcs
COMPOSE_FILE	= docker-compose.yml

DOCKER			= docker
COMPOSE			= docker-compose

MKDIR			= mkdir -p

MDB_VOLUME_DIR	= /Users/hyun-zhe/data/mariadb
WP_VOLUME_DIR	= /Users/hyun-zhe/data/wordpress

COMPOSE_FLAGS	= -f
UP_FLAGS		= -d --build
# UP_FLAGS		= --build
DOWN_FLAGS		= --rmi all --remove-orphans

all:	volumes
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

.PHONY:	all show clean fclean