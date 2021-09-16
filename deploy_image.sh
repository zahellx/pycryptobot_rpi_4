#!/bin/bash
docker login -user angelxwars -p ariesabril12
docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t angelxwars/pycryptobot_zahell:latest --push .



docker build -t angelxwars/pycryptobot_zahell:latest .
docker login -user angelxwars -p ariesabril12
docker push angelxwars/pycryptobot_zahell:latest


# Pasos para desplegar este proyecto en la raspberrypi:
#1
scp -r /d/Proyectos/Programacion/pycryptobot zahell@192.168.1.69:/home/zahell/project
#2 Dentro de la maquina:
cp ./pycryptobot_rpi_4/Dockerfile ./Dockerfile
cp ./pycryptobot_rpi_4/requirements.txt ./requirements.txt
docker-compose up -d  --build --force-recreate