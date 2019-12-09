#!/bin/bash

# Bring workers up and follow logs
docker-compose down
docker-compose up -d
docker-compose logs -f
