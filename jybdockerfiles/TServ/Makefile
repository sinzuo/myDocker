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

build:
#	git clone git://github.com/sinzuo/TServ
	sudo docker build --rm -t sinzuo-tserv:1.0 .

run:
	sudo docker run -it -d  --name tserv -v $(VPATH):/mnt -p 9195:8000 sinzuo-tserv:1.0

kill:
	-sudo docker kill tserv
	-sudo docker rm tserv

enter:
	sudo docker exec -it ftpd_server sh -c "export TERM=xterm && bash"

# git commands for quick chaining of make commands
push:
	git push --all
	git push --tags

pull:
	git pull
