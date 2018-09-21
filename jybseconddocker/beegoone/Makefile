.PHONY: build run kill enter push pull

build:
#	wget http://docker-image-jiang.oss-cn-hangzhou.aliyuncs.com/beegoone.tar.gz
	sudo docker build -t beegoone:1.0 .

run: kill
	sudo docker run -it -d --name beego -v $(PWD):/mnt -p 8080:8080 beegoone:1.0

kill:
	-sudo docker kill beego
	-sudo docker rm beego

enter:
	sudo docker exec -it ftpd_server sh -c "export TERM=xterm && bash"

# git commands for quick chaining of make commands
push:
	git push --all
	git push --tags

pull:
	git pull

file:=beegoone.tar.gz
images:
        ifneq ($(file), $(wildcard $(file)))
	wget http://docker-image-jiang.oss-cn-hangzhou.aliyuncs.com/beegoone.tar.gz
	docker load <   beegoone.tar.gz
        endif
