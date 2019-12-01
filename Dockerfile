FROM ubuntu:18.04

RUN apt-get update --fix-missing
RUN apt-get install -y wget libslang2 libglib2.0-0

RUN wget https://update.u.is/downloads/linux/utopia-bot-latest.x86_64.tar.gz
RUN tar xvf utopia-bot*
#COPY utopia-bot-1.0.5389.el7.x86_64 /utopia-bot-1.0.5389.el7.x86_64

RUN mkdir /utopia
RUN mv /utopia-bot-1*/* /utopia/.
COPY start.sh start.sh

ENTRYPOINT ["./start.sh"]

