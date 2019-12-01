#!/bin/bash

# Build container
sudo docker build -t utopia --no-cache .

# Bring workers up and follow logs
sudo docker-compose down
sudo docker-compose up -d
sudo docker-compose logs -f
