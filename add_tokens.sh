#!/bin/bash

tail -n 20 docker-compose.yaml

echo "Enter worker number to start at:"
read worker_number

echo "Enter config number to start at:"
read worker_config_number

while true; do
    echo "Enter token (blank to exit): "
    read token

    if [ -z "$token" ]; then
        break
    fi

    cat >> docker-compose.yaml <<- EOF
  utopia$worker_number:
    image: utopia:latest
    environment:
      - WORKER_NUMBER=$worker_config_number
      - TOKEN=$token
EOF
    
    ((worker_config_number++))
    ((worker_number++))
done
