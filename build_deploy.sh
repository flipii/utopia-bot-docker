#!/bin/bash

# Build container
docker build -t utopia --no-cache .

# Bring workers up and follow logs
docker-compose down
docker-compose up -d
docker-compose logs -f
