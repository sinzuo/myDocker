FROM znly/protoc
MAINTAINER jiang_yi_bo@sinzuo.com

RUN apk add --no-cache openssh-server 

  
RUN mkdir -p /var/run/sshd
RUN ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
ADD ./id_rsa root/.ssh/
ADD ./id_rsa.pub root/.ssh/

ENV FORCE_UNSAFE_CONFIGURE 1
ENTRYPOINT ["base64"]
