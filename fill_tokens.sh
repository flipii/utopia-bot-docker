#!/bin/bash

cp docker-compose.yaml.template docker-compose.yaml

worker_number=1

while true; do
    echo "Enter token (q to exit): "
    read token

    if [[ "$token" == 'q' ]]; then
        break
    fi

    cat >> docker-compose.yaml <<- EOF
  utopia$worker_number:
    image: utopia:latest
    environment:
      - WORKER_NUMBER=$worker_number
      - TOKEN=$token
EOF
    
    ((worker_number++))
done
