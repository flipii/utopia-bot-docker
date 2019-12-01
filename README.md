# Utopia Mining Bot for Docker

Collection of scripts and tools to deploy out Utopia mining bot threads.


## Requirements

```
sudo apt update
sudo apt install docker.io docker-compose
```

## Installation

```
git clone https://github.com/flipii/utopia-bot-docker.git
cd utopia-bot-docker
./fill_tokens.sh
```

Enter tokens for each bot and blank line to quit.
This will create worker blocks with your tokens in `docker-compose.yaml`.


## Getting Started

Build container with latest mining bot version and start all workers staggerring them 1 minute apart
```
./build_deploy.sh
```

Can re-run the above command to update mining bot versions.

To add workers to an existing deployment
```
./add_tokens.sh
sudo docker-compose up -d
```

## Useful commands

See all running containers in order
```
sudo docker ps --format '{{.Names}}' | sort -V
```

Get number of containers still running
```
sudo docker ps -qa | wc -l
```

Get number of containers already while booting up:
```
expr $( sudo docker-compose logs --tail 1 | wc -l ) - 1
```

Kill bottom 4 containers
```
NUM_TO_DELETE=4
sudo docker ps --format '{{.Names}}' | sort -V | tail -n $NUM_TO_DELETE | xargs sudo docker rm -f
```

Install swap memory
```
sudo dd if=/dev/zero of=/swapfile bs=1G count=16
sudo chmod 0600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
```
