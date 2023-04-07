SRCS			= srcs
COMPOSE_FILE	= docker-compose.yml

DOCKER			= docker
COMPOSE			= docker-compose

UP_FLAGS		= -d --build

all:
	$(COMPOSE) -f $(SRCS)/$(COMPOSE_FILE) up $(UP_FLAGS)

show:
	$(COMPOSE) -f $(SRCS)/$(COMPOSE_FILE) ps

images:
	$(DOCKER) images

clean:
	$(COMPOSE) -f $(SRCS)/$(COMPOSE_FILE) down

fclean:	clean
	$(DOCKER) system prune -f

.PHONY:	all show clean fclean