FROM jyb-ubuntu-tools:16.04
#MAINTAINER jiang_yi_bo "admin@sinzuo.com"
#CMD ["sh", "-c", "/etc/init.d/tftpd-hpa start&& testServer"]
#CMD ["/etc/init.d/tftpd-hpa","start"]
#ENTRYPOINT ["/etc/init.d/tftpd-hpa","start"]

RUN sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
RUN apt-get update&& apt-get install -y mysql-client libmysqlclient-dev gcc g++ make git

