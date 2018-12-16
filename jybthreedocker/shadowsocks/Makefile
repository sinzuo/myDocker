.PHONY: build run kill enter push pull

workfile:=shadowsocks

ifneq ($(VPATH),)
VPATH?=$(VPATH)
else
VPATH?=$(PWD)
endif


build:
#	wget http://docker-image-jiang.oss-cn-hangzhou.aliyuncs.com/beegoone.tar.gz
	sudo docker build -t $(workfile):1.0 .

server: kill
	docker run -dt --name ssserver -p 6443:6443 -p 6500:6500/udp mritd/shadowsocks -m "ss-server" -s \
	 "-s 0.0.0.0 -p 6443 -m chacha20 -k test123 --fast-open" -x -e "kcpserver" -k "-t 127.0.0.1:6443 -l :6500 -mode fast2"
#	sudo docker run -it -d --name $(workfile) -v $(VPATH):/mnt -p 8080:8080 $(workfile):1.0

client: kill
	docker run -dt --name ssclient -p 1080:1080 mritd/shadowsocks -m "ss-local" -s \
	 "-s 127.0.0.1 -p 6500 -b 0.0.0.0 -l 1080 -m chacha20 -k test123 --fast-open" -x -e "kcpclient" -k "-r SSSERVER_IP:6500 -l :6500 -mode fast2"

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
