FROM ubuntu:16.04
MAINTAINER jiang_yi_bo@sinzuo.com

RUN apt-get update \
	&& useradd -d /home/tozedsoft -m -s /bin/bash tozedsoft \
        && usermod -a -G sudo tozedsoft \
        && echo tozedsoft:123456 | chpasswd \
 	&& apt-get install -y openssh-server make gcc g++ wget python gawk xz-utils zlib1g-dev git libsdl1.2-dev libssl-dev libncurses5-dev unzip subversion byacc zip \
  && apt-get install -y libsysfs-dev make unzip g++ libncurses5-dev bison flex exuberant-ctags sharutils mtd-utils zip  automake autoconf libtool cmake gettext squashfs-tools liblzo2-dev uuid-dev ccache zlib1g-dev bc gperf libssl-dev net-tools pkg-config default-jre libtool-bin m4\
  &&rm -rf /var/lib/apt/lists/* 
  
RUN mkdir -p /var/run/sshd
RUN ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
ADD ./id_rsa root/.ssh/
ADD ./id_rsa.pub root/.ssh/

ENV FORCE_UNSAFE_CONFIGURE 1
CMD ["/usr/sbin/sshd","-D"]
