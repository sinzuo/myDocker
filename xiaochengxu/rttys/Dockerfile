 #设置基础镜像,如果本地没有该镜像，会从Docker.io服务器pull镜像
FROM node
#MAINTAINER jiang_yi_bo "admin@sinzuo.com"
#CMD ["sh", "-c", "/etc/init.d/tftpd-hpa start&& testServer"]
#CMD ["/etc/init.d/tftpd-hpa","start"]
#ENTRYPOINT ["/etc/init.d/tftpd-hpa","start"]



#RUN npm install --registry=https://registry.npm.taobao.org

RUN apt-get update&&apt-get install -y openssh-server git
WORKDIR /data
RUN git clone https://github.com/sinzuo/rttys
RUN cd /mnt/data/html/&&npm install&&npm run build

#暴露container的端口
EXPOSE 8080
RUN mkdir -p /var/run/sshd
#运行命令
CMD ["/usr/sbin/sshd", "-D"]
