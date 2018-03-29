.PHONY: build run kill enter push pull
#MAINTAINER jiang_yi_bo <admin@sinzuo.com>
#VPATH 设置 make run 默认映射当前目录 或者 make run VPATH=/home/jiang
#   sudo docker run -d -it --restart=always --name myantdesign -v /home/jiang:/mnt -p 9091:8000 jyb-antdesign:1.0 /bin/sh
#   sudo docker run -d --name business -e "PUBLICHOST=localhost" -e "ADDED_FLAGS=-d -d" -v /home/jiang:/mnt -p 9091:80 business:1.0

ifneq ($(VPATH),)
VPATH?=$(VPATH)
else
VPATH?=$(PWD)
endif

ifneq ($(VNAME),)
NAME?=$(VNAME)
else
NAME?=sinzuo-redis
endif

install:
	wget http://jybdata.oss-cn-shenzhen.aliyuncs.com/dockerImage.tar.gz
	docker load < qshell_13.0.tar.gz 
	docker load < mysql.tar.gz
#	docker load < apachephp.tar.gz
	docker load <  device.tar.gz
	docker load <  nopassredis.tar.gz         
	docker load <  mosquitto.tar.gz       
#	docker load <  mysql.tar.gz           
	docker load <  redis.tar.gz        
#	docker load <  mongodb.tar.gz           
	docker load <  tomcat-7.0.tar.gz         
	docker load <  mongo3.3.tar.gz

build:
	sudo docker build --rm -t jyb-ubuntu:16.04 .

run:
#	git clone https://github.com/zchuanzhao/jeesns
#	docker run -d -p 8080:8080 --name rzdb -v $(VPATH):/opt/tomcat/webapps  consol/tomcat-7.0
#	docker run --name jyb2-mysql --restart=always -p 4306:3306 -e MYSQL_ROOT_PASSWORD=jiangyibo -d daocloud.io/mysql:5.6
#	mysql -h 127.0.0.1 -uroot -p -P4306 jeesns < jeesns.sql
#	docker run --name jyb-mongo -p 5553:27017 -d mongo:3.3
	docker run -d --name $(NAME) -p 6379:6379 -v $(VPATH):/data/  nopassredis
kill:
	-sudo docker kill $(NAME)
	-sudo docker rm $(NAME)

enter:
	sudo docker exec -it $(NAME) sh -c "export TERM=xterm && bash"

# git commands for quick chaining of make commands
push:
	git push --all
	git push --tags

pull:
	git pull
