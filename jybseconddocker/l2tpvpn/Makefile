
VPN_IPSEC_PSK:=jiangyibo1234567890
VPN_USER_CREDENTIAL_LIST:=[{"login":"user1","password":"test1"},{"login":"user2","password":"test2"}]
VPN_NETWORK_INTERFACE:=eth0

run:
	docker run \
    --name l2tp-ipsec-vpn-server \
    --env-file ./vpn.env \
    -p 500:500/udp \
    -p 4500:4500/udp \
    -v /lib/modules:/lib/modules:ro \
    -d --privileged \
    fcojean/l2tp-ipsec-vpn-server

kill:
	-sudo docker kill l2tp-ipsec-vpn-server
	-sudo docker rm l2tp-ipsec-vpn-server

