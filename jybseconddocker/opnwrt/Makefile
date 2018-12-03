.PHONY: build run kill enter push pull

workfile:=openwrt

build:
#	wget http://docker-image-jiang.oss-cn-hangzhou.aliyuncs.com/beegoone.tar.gz
	sudo docker build -t $(workfile):1.0 .

run: kill
	sudo docker run -it -d --name $(workfile) -v $(PWD):/mnt -p 8080:8080 $(workfile):1.0

runa: kill
	sudo docker run -it -d --name $(workfile) -v $(PWD):/data -p 8080:8080 $(workfile):1.0
kill:
	-sudo docker kill $(workfile)
	-sudo docker rm $(workfile)

enter:
	sudo docker exec -it $(workfile) sh -c "export TERM=xterm && bash"

# git commands for quick chaining of make commands
push:
	git push --all
	git push --tags

pull:
	git pull

save:
	git save $(workfile):1.0 > $(workfile).tar

load:
	git load < $(workfile).tar


file:=beegoone.tar.gz
gopath:=go-vs-code-bin.rar
images:
        ifneq ($(file), $(wildcard $(file)))
	wget http://docker-image-jiang.oss-cn-hangzhou.aliyuncs.com/beegoone.tar.gz
	docker load <   beegoone.tar.gz
        endif


path:
        ifneq ($(gopath), $(wildcard $(gopath)))
	  wget http://jybconfig.oss-cn-shenzhen.aliyuncs.com/go-vs-code-bin.rar
        endif
