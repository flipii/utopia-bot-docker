# Utopia Mining Bot for Docker

Collection of scripts and tools to deploy out Utopia mining bot threads.


## Requirements

```
sudo apt update
sudo apt install -y docker.io docker-compose vim
sudo usermod -aG docker ${USER}
```

## Installation

```
git clone https://github.com/flipii/utopia-bot-docker.git
cd utopia-bot-docker
./fill_tokens.sh
```

Enter tokens for each bot and blank line to quit.
This will create mining thread worker blocks with your tokens in `docker-compose.yaml`.


## Getting Started

Build container with latest mining bot version and start all mining threads staggerring them 1 minute apart
```
./build_deploy.sh
```

Can re-run the above command to update mining bot versions.

To add mining threads to an existing deployment
```
./add_tokens.sh
docker-compose up -d
```

## Useful commands

See all running containers in order
```
docker ps --format '{{.Names}}' | sort -V
```

Get number of containers still running
```
docker ps -qa | wc -l
```

Get number of containers already while booting up:
```
expr $( docker-compose logs --tail 1 | wc -l ) - 1
```

Get container names without connections
```
docker-compose  logs --tail 1 | grep 0/0 | tail -n +2  | cut -f1 -d' '
```

Kill mining threads with no connections
```
docker-compose  logs --tail 1 | grep 0/0 | tail -n +2  | cut -f1 -d' ' | sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[mGK]//g" | xargs -I {} docker rm -f utopiabotdocker_{}
```

Kill bottom 4 mining threads
```
NUM_TO_DELETE=4
docker ps --format '{{.Names}}' | sort -V | tail -n $NUM_TO_DELETE | xargs docker rm -f
```

Install swap memory
```
SWAP_FILE_NAME=swapfile
sudo dd if=/dev/zero of=/$SWAP_FILE_NAME bs=1G count=16
sudo chmod 0600 /$SWAP_FILE_NAME
sudo mkswap /$SWAP_FILE_NAME
sudo swapon /$SWAP_FILE_NAME
```

Install nerdcommenter for vim
```
sudo apt install -y vim
mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
cd ~/.vim/bundle/
git clone https://github.com/scrooloose/nerdcommenter.git
cd -
cat >> ~/.vimrc <<- EOF
execute pathogen#infect()
syntax on
filetype plugin indent on
EOF
```


## Donations welcome :pray:
Crypton: 471B0056840BBA80
