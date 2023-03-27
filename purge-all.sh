#!/bin/bash

# docker ps -aq

# docker stop $(docker ps -aq)
docker rm $(docker ps -aq) 
docker-compose down --volumes
docker volume prune -f

docker network rm $(docker network ls) 

# docker image prune -a