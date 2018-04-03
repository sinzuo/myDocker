FROM jyb-ubuntu-tools:16.04
#MAINTAINER jiang_yi_bo "admin@sinzuo.com"
#CMD ["sh", "-c", "/etc/init.d/tftpd-hpa start&& testServer"]
#CMD ["/etc/init.d/tftpd-hpa","start"]
#ENTRYPOINT ["/etc/init.d/tftpd-hpa","start"]

RUN sed -i "s/PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config
RUN apt-get update&&apt-get install -y vim git
RUN echo "root:root" | chpasswd 
