FROM centos:6.8
MAINTAINER jiang_yi_bo@sinzuo.com

RUN yum install -y openssh-server make gcc gcc-c++ openssl-devel wget python gawk xz-utils zlib1g-dev git libsdl1.2-dev libncurses5-dev unzip subversion \
        zip libcurl-devel java-1.7.0-openjdk java-1.7.0-openjdk-devel.x86_64 vim

  
RUN mkdir -p /var/run/sshd
RUN ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
ADD ./id_rsa root/.ssh/
ADD ./id_rsa.pub root/.ssh/

ENV FORCE_UNSAFE_CONFIGURE 1
CMD ["/usr/sbin/sshd","-D"]
