FROM jyb-ubuntu-tools:16.04
MAINTAINER jiang_yi_bo@sinzuo.com



RUN apt-get install -y shadowsocks proxychains
ADD config.json /etc/shadowsocks/
ADD proxychains.conf /etc/proxychains.conf
ADD run.sh /root/
#RUN . /root/run.sh




