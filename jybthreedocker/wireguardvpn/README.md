OpenWrt Wireguard配置备忘
服务端：

OS ： Ubuntu 18.04

sudo add-apt-repository ppa:wireguard/wireguard
sudo apt-get update
sudo apt-get install wireguard
umask 077
wg genkey | tee server_privatekey | wg pubkey > server_publickey //生成服务端密钥
wg genkey | tee client_privatekey | wg pubkey > client_publickey //生成客户端密钥
**# echo 1 > /proc/sys/net/ipv4/ip_forward**
vi /etc/wireguard/wg0.conf 创建配置文件

[Interface]
PrivateKey = <Private Key> //替换成刚才生成的服务器测私钥  cat server_private
Address = 10.0.0.1/24  //接口地址段
ListenPort = 51820  //监听端口
PostUp = iptables -A FORWARD -i wg0 -j ACCEPT; iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE; ip6tables -A FORWARD -i wg0 -j ACCEPT; ip6tables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
PostDown = iptables -D FORWARD -i wg0 -j ACCEPT; iptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE; ip6tables -D FORWARD -i wg0 -j ACCEPT; ip6tables -t nat -D POSTROUTING -o eth0 -j MASQUERADE
SaveConfig = true
$ sudo wg-quick up wg0 //启动wireguard
$ sudo wg set wg0 peer <Public Key> allowed-ips 10.0.0.3/24 //添加客户端公钥cat client_public和允许的IP地址段
OPENWRT 18.06.1

opkg update
opkg install wireguard luci-app-wireguard wireguard-tools kmod-wireguard luci-proto-wireguard
vi /etc/config/network 添加以下内容，也可以在luci界面添加


config wireguard_wg0             
    option public_key 'fpNkfNdNytEgc9tP7uGzYZ8cIPedi/TrkRBeRTifv3Q='
    option endpoint_host '192.168.3.242'                            
    option persistent_keepalive '25'                                
    option endpoint_port '51820'                                    
    option route_allowed_ips '1'                                    
    list allowed_ips '10.0.0.0/24'                                    
                                                                    
config interface 'wg0'                                              
    option proto 'wireguard'                                        
    option private_key 'cPeJqyurz/zmPxbnH6cNB7JNGah3WFJGYks08m5k53c='
    list addresses '10.0.0.3/24' 


$ sudo add-apt-repository ppa:wireguard/wireguard
$ sudo apt-get update
$ sudo apt-get install wireguard
$ umask 077
$ wg genkey | tee server_privatekey | wg pubkey > server_publickey //生成服务端密钥
$ wg genkey | tee client_privatekey | wg pubkey > client_publickey //生成客户端密钥
**# echo 1 > /proc/sys/net/ipv4/ip_forward**    


