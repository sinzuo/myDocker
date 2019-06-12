FROM jyb-ubuntu-tools:16.04
MAINTAINER jiang_yi_bo@sinzuo.com
RUN apt-get update&&apt-get install -y git &&   rm -rf /var/lib/apt/lists/* 
RUN git clone https://github.com/certbot/certbot 

#打开 certbot
RUN cd /certbot

#最关键的一步
#RUN ./certbot-auto certonly --standalone --email admin@sinzuo.com -d www.sinzuo.com -d sinzuo.com

