FROM jyb-ubuntu-tools:16.04
MAINTAINER jiang_yi_bo@sinzuo.com



RUN apt-get install -y shadowsocks polipo
ADD config.json /etc/shadowsocks/
ADD config /etc/polipo/
ADD profile /root/.profile
ADD run.sh /root/
#RUN . /root/run.sh




