FROM ubuntu:16.04
MAINTAINER jiang_yi_bo@sinzuo.com
RUN apt-get update && apt-get install -y wget
RUN wget https://github.com/zhaojh329/rttys/files/2471995/rttys-linux-amd64.tar.gz 
RUN tar -zxvf rttys-linux-amd64.tar.gz
RUN mv /rttys-linux-amd64/* /usr/bin/
RUN useradd --create-home --no-log-init --shell /bin/bash sinzuo
RUN echo 'sinzuo:sinzuo' | chpasswd
#USER sinzuo
#WORKDIR /home/sinzuo
CMD ["sh", "-c", "rttys"]
