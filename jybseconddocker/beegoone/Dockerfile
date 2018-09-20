# install beego
# version 1.0  
  
FROM jyb-ubuntu:16.04
MAINTAINER jyb "jiang_yi_bo@gmail.com"  
 
ENV GOPATH /data/gocode
ENV PATH $GOPATH/bin:$PATH
RUN mkdir -p /data
ADD ./gocode /data/
ADD ./hello.go /data/gocode/hello.go

#export GOPATH=/data/gocode
#export PATH=$GOPATH/bin:$PATH  
RUN apt-get update &&\
 apt-get install golang vim git supervisor -y && \
 go get github.com/astaxie/beego && \
 go get github.com/beego/bee
 
 
RUN go build -o /data/gocode/hello /data/gocode/hello.go
RUN chmod 755 /data/gocode/hello
 
WORKDIR /data/gocode
EXPOSE 22 8080  
 
CMD ["/data/gocode/hello"]
