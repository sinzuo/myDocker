FROM jyb-ubuntu:16.04
#MAINTAINER jiang_yi_bo "admin@sinzuo.com"
#CMD ["sh", "-c", "/etc/init.d/tftpd-hpa start&& testServer"]
#CMD ["/etc/init.d/tftpd-hpa","start"]
#ENTRYPOINT ["/etc/init.d/tftpd-hpa","start"]


RUN apt-get update&& apt-get install -y mysql-client libmysqlclient-dev vim
ADD mysqlexe.sh /root/
