
username:=admin
OVPN_DATA:=/root/ovpn-data
file:=/root/ovpn-data/openvpn.conf
IP:=qq.sinzuo.com


user:
	docker run -v ${OVPN_DATA}:/etc/openvpn --rm -it kylemanna/openvpn easyrsa build-client-full ${username} nopass
	docker run -v ${OVPN_DATA}:/etc/openvpn --rm kylemanna/openvpn ovpn_getclient ${username} > ${OVPN_DATA}/${username}.ovpn

run:
	docker run --name openvpn  --restart=always -v ${PWD}/ovpn-data:/etc/openvpn -d -p 1194:1194 --privileged kylemanna/openvpn

new:
	docker run --name openvpn  --restart=always -v ${OVPN_DATA}:/etc/openvpn -d -p 1194:1194 --privileged kylemanna/openvpn

build:
	sudo docker build --rm -t jyb-openvpn:1.0 .

create:
        ifneq ($(file), $(wildcard $(file)))
		mkdir ${OVPN_DATA}
		docker run -v ${OVPN_DATA}:/etc/openvpn --rm kylemanna/openvpn ovpn_genconfig -u tcp://${IP}
		docker run -v ${OVPN_DATA}:/etc/openvpn --rm -it kylemanna/openvpn ovpn_initpki
        endif
show:
	docker run --rm -it -v ${OVPN_DATA}:/etc/openvpn kylemanna/openvpn ovpn_listclients	

kill:
	-sudo docker kill openvpn
	-sudo docker rm openvpn

openvpn:=openvpn.tar.gz
images:
        ifneq ($(file), $(wildcard $(file)))
	wget http://docker-image-jiang.oss-cn-hangzhou.aliyuncs.com/openvpn.tar.gz
	docker load <   openvpn.tar.gz
        endif
