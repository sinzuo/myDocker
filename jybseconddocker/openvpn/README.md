如果是本机第一次安装：

// 第一步
yum install docker
docker pull kylemanna/openvpn

OVPN_DATA="/root/ovpn-data"
// 下面的全局变量换成你的服务器的外网ip
IP="192.168.3.216"
mkdir ${OVPN_DATA}

// 第二步
docker run -v ${OVPN_DATA}:/etc/openvpn --rm kylemanna/openvpn ovpn_genconfig -u tcp://${IP}

// 第三步
docker run -v ${OVPN_DATA}:/etc/openvpn --rm -it kylemanna/openvpn ovpn_initpki

// ---------------------------------------------------------
Enter PEM pass phrase: 输入123456（你是看不见的）
Verifying - Enter PEM pass phrase: 输入123456（你是看不见的）
Common Name (eg: your user, host, or server name) [Easy-RSA CA]:回车一下
Enter pass phrase for /etc/openvpn/pki/private/ca.key:输入123456
// ---------------------------------------------------------

// 第五步
docker run -v ${OVPN_DATA}:/etc/openvpn --rm -it kylemanna/openvpn easyrsa build-client-full CLIENTNAME nopass

// ---------------------------------------------------------
Enter pass phrase for /etc/openvpn/pki/private/ca.key:输入123456
// ---------------------------------------------------------

// 第六步
docker run -v ${OVPN_DATA}:/etc/openvpn --rm kylemanna/openvpn ovpn_getclient CLIENTNAME > ${OVPN_DATA}/CLIENTNAME.ovpn

// 第七步
docker run --name openvpn -v ${OVPN_DATA}:/etc/openvpn -d -p 1194:1194 --privileged kylemanna/openvpn
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*
Generate a client certificate without a passphrase

  docker run -v $OVPN_DATA:/etc/openvpn --log-driver=none --rm -it kylemanna/openvpn easyrsa build-client-full CLIENTNAME nopass
Retrieve the client configuration with embedded certificates

  docker run -v $OVPN_DATA:/etc/openvpn --log-driver=none --rm kylemanna/openvpn ovpn_getclient CLIENTNAME > CLIENTNAME.ovpn
*/

如果  ${OVPN_DATA} 已经生成 就不用那么麻烦了  直接  执行下面的步骤就可以使用了

docker pull kylemanna/openvpn

docker run --name openvpn -v ${OVPN_DATA}:/etc/openvpn -d -p 1194:1194 --privileged kylemanna/openvpn

7. 查看 OpenVPN Client 列表
docker run --rm -it -v $OVPN_DATA:/etc/openvpn kylemanna/openvpn ovpn_listclients
1
8. 撤销 Client Certificates
docker run --rm -it -v $OVPN_DATA:/etc/openvpn kylemanna/openvpn easyrsa revoke hahaha
docker run --rm -it -v $OVPN_DATA:/etc/openvpn kylemanna/openvpn easyrsa gen-crl


route del -net 0.0.0.0/1 gw 192.168.255.9
route del -net 0.0.0.0/1 gw 192.168.255.9


sudo route add -net 192.168.255.0/24 dev tun0
sudo route del -net 0.0.0.0/1 dev tun0
sudo route del -net 128.0.0.0/1 dev tun0
openvpn --config /etc/openvpn/openvpn.conf --client-config-dir /etc/openvpn/ccd --crl-verify /etc/openvpn/crl.pem