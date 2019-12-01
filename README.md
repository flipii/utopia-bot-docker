# Utopia Mining Bot for Docker

Collection of scripts and tools to deploy out Utopia mining bot threads.


## Requirements

Need the following installed to run the scripts:
- docker.io
- `docker-compose` 


## Installation

```
git clone https://github.com/flipii/utopia-bot-docker.git
cd utopia-bot-docker
./fill_tokens.sh
```

Enter tokens for each bot and `q` to quit.
This will create worker blocks with your tokens in `docker-compose.yaml`.


## Getting Started

Build container with latest mining bot version and start all workers staggerring them 1 minute apart:
```
./build_deploy.sh
```

Can re-run the above command to update mining bot versions.


## Useful commands

See all running containers in order:
```
sudo docker ps --format '{{.Names}}' | sort -V
```

Get number of containers still running:
```
sudo docker ps -qa | wc -l
```

Get number of containers already while booting up:
```
expr $( sudo docker-compose logs --tail 1 | wc -l ) - 1
```

Install swap memory:
```
sudo dd if=/dev/zero of=/swapfile bs=1G count=16
chmod 0600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
```