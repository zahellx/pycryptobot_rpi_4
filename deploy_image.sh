#!/bin/bash
docker login -user angelxwars -p ariesabril12
docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t angelxwars/pycryptobot_zahell:latest --push .



docker build -t angelxwars/pycryptobot_zahell:latest .
docker login -user angelxwars -p ariesabril12
docker push angelxwars/pycryptobot_zahell:latest