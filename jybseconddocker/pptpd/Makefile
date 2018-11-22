.PHONY: build run kill enter push pull

build:
#	wget http://docker-image-jiang.oss-cn-hangzhou.aliyuncs.com/beegoone.tar.gz
	sudo docker build -t pptpd:1.0 .

run: kill
#	sudo docker run -it -d --name pptpd -v $(PWD):/mnt -p 1723:1723 pptpd:1.0
	sudo docker run --name pptpd --privileged -d -p 1723:1723 -v /etc/ppp/chap-secrets:/etc/ppp/chap-secrets:ro pptpd:1.0

runa: kill
	sudo docker run -it -d --name pptpd -v $(PWD):/data -p 1723:1723 pptpd:1.0
kill:
	-sudo docker kill pptpd
	-sudo docker rm pptpd

enter:
	sudo docker exec -it pptpd sh -c "export TERM=xterm && bash"

# git commands for quick chaining of make commands
push:
	git push --all
	git push --tags

pull:
	git pull

file:=pptpd.tar.gz
gopath:=go-vs-code-bin.rar
images:
        ifneq ($(file), $(wildcard $(file)))
	wget http://docker-image-jiang.oss-cn-hangzhou.aliyuncs.com/pptpd.tar.gz
	docker load <   pptpd.tar.gz
        endif


path:
        ifneq ($(gopath), $(wildcard $(gopath)))
	  wget http://jybconfig.oss-cn-shenzhen.aliyuncs.com/go-vs-code-bin.rar
        endif
