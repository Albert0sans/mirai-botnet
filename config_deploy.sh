#!/bin/sh

# si hay problemas ejecutar:
#docker system prune -a --volumes
# Creación de imágenes y ejecución de contenedores base
docker-compose build
docker-compose up -d

sleep 5

# Aprovisionamiento de los containers

