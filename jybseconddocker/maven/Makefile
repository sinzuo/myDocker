.PHONY: build run kill enter push pull
#MAINTAINER jiang_yi_bo <admin@sinzuo.com>
#VPATH 设置 make run 默认映射当前目录 或者 make run VPATH=/home/jiang
#   sudo docker run -d -it --restart=always --name myantdesign -v /home/jiang:/mnt -p 9091:8000 jyb-antdesign:1.0 /bin/sh
#   sudo docker run -d --rm --name business -e "PUBLICHOST=localhost" -e "ADDED_FLAGS=-d -d" -v /home/jiang:/mnt -p 9091:80 business:1.0

ifneq ($(VPATH),)
VPATH?=$(VPATH)
else
VPATH?=$(PWD)
endif

ifneq ($(VNAME),)
NAME?=$(VNAME)
else
NAME?=sinzuo-maven
endif

build:
#	sudo docker build --rm -t sinzuo-maven:1.0 .
	git clone https://github.com/wolfboys/opencron.git
run:
	sudo docker run -d -it --name $(NAME) -v $(VPATH):/usr/src/mymaven -w /usr/src/mymaven -p 9093:8000 maven:3.3-jdk-8 mvn clean install

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
