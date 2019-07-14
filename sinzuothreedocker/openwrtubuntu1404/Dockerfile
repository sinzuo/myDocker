FROM ubuntu:14.04
MAINTAINER jiang_yi_bo@sinzuo.com

RUN apt-get update \
	&& useradd -d /home/tozedsoft -m -s /bin/bash tozedsoft \
        && usermod -a -G sudo tozedsoft \
        && echo tozedsoft:123456 | chpasswd \
 	&& apt-get install -y openssh-server make gcc g++ wget python gawk xz-utils zlib1g-dev git libsdl1.2-dev libssl-dev libncurses5-dev unzip subversion zip \
  &&rm -rf /var/lib/apt/lists/* 
  
RUN mkdir -p /var/run/sshd
RUN ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
ADD ./id_rsa root/.ssh/
ADD ./id_rsa.pub root/.ssh/

ENV FORCE_UNSAFE_CONFIGURE 1
CMD ["/usr/sbin/sshd","-D"]
