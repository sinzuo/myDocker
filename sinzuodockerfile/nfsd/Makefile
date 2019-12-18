.PHONY: build run kill enter push pull

workfile:=nfs
DLPATH:=/mnt/dShare/openwrtDir/dl
#VPATH:=/work/
VPATH:=/home

ifneq ($(VPATH),)
VPATH?=$(VPATH)
else
VPATH?=$(PWD)
endif


build:
#	wget http://docker-image-jiang.oss-cn-hangzhou.aliyuncs.com/beegoone.tar.gz
	sudo docker build -t $(workfile):1.0 .

run: kill
	docker run --name $(workfile) -d --privileged --restart=always \
	-v $(VPATH):/nfs \
	-e NFS_EXPORT_DIR_1=/nfs \
	-e NFS_EXPORT_DOMAIN_1=\* \
	-e NFS_EXPORT_OPTIONS_1=rw,insecure,no_subtree_check,no_root_squash,fsid=1 \
	-p 111:111 -p 111:111/udp \
	-p 2049:2049 -p 2049:2049/udp \
	-p 32765:32765 -p 32765:32765/udp \
	-p 32766:32766 -p 32766:32766/udp \
	-p 32767:32767 -p 32767:32767/udp \
	fuzzle/docker-nfs-server

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
