.PHONY: build run kill enter push pull

workfile:=bluedoncentos68
DLPATH:=/mnt/dShare/openwrtDir/dl
#VPATH:=/work/
VPATH:=/mnt/dShare/bluedon

ifneq ($(VPATH),)
VPATH?=$(VPATH)
else
VPATH?=$(PWD)
endif


build:
#	wget http://docker-image-jiang.oss-cn-hangzhou.aliyuncs.com/beegoone.tar.gz
	sudo docker build -t $(workfile):1.0 .

run: kill
	sudo docker run -it -d --name $(workfile) -v $(VPATH):/mnt -v $(DLPATH):/root/dl -p 16181:8080 -p 17002:22 $(workfile):1.0


runa: kill
	sudo docker run -it -d --name $(workfile) -v $(PWD):/data -p 8080:8080 $(workfile):1.0
kill:
	-sudo docker kill $(workfile)
	-sudo docker rm $(workfile)

enter:
	sudo docker exec -it $(workfile) sh -c "export TERM=xterm && bash"

# git commands for quick chaining of make commands
push:
	sudo git push --all
	sudo git push --tags

pull:
	sudo git pull

save:
	sudo docker save $(workfile):1.0 > $(workfile).tar

load:
	sudo docker load < $(workfile).tar
	
scp: save
	sudo scp -P 12345 $(workfile).tar jiang@qq.sinzuo.com:/shareDir9091/dockerImages/

file:=$(workfile).tar
gopath:=go-vs-code-bin.rar
images:
        ifneq ($(file), $(wildcard $(file)))
	wget http://qq.sinzuo.com:9091/dockerImages/$(file)
	docker load <   $(file)
        endif


path:
        ifneq ($(gopath), $(wildcard $(gopath)))
	  wget http://jybconfig.oss-cn-shenzhen.aliyuncs.com/go-vs-code-bin.rar
        endif
