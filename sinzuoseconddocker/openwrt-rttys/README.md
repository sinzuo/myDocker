sudo ./rttys -h
Usage of rttys:
  -cert string
        certFile Path
  -key string
        keyFile Path
  -port int
        http service port (default 5912)


client
rtty -I '112233445566' -h '192.168.3.216' -p 5912 -a -v -s -d 'My Device Description'
用户名 sinzuo 密码 sinzuo

ubuntu 安装
使用
wget -qO- https://raw.githubusercontent.com/zhaojh329/rtty/master/tools/install.sh | sudo bash
sudo rtty -I 'My-device-ID' -h 192.168.255.1 -p 5912 -a -v  -d 'My Device Description'
