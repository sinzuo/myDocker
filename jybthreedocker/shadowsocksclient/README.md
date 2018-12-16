###Ubuntu 命令行配置 shadowsocks 代理

此docker 使用说mg ， 先进入docker,然后执行 /root/run.sh  就可以启动 代理了

###制作此docker 的操作方法

使用 shadowsock + polipo 为 ubuntu 配置命令行代理。
安装软件包

默认使用 Ubuntu 软件包。

sudo apt install shadowsocks polipo

然后创建 shadowsocks.json 配置文件：

{
  "server": "{your-server}",
  "server_port": 40002,
  "local_port": 1080,
  "password": "{your-password}",
  "timeout": 600,
  "method": "aes-256-cfb"
}

运行 shadowsocks:

sslocal -c /path/to/shadowsocks.json&!

修改 polipo 配置文件:/etc/polipo/config

logSyslog = true
logFile = /var/log/polipo/polipo.log

allowedPorts = 1-65535
tunnelAllowedPorts = 1-65535

proxyAddress = "0.0.0.0"
socksParentProxy = "127.0.0.1:1080"
socksProxyType = socks5
chunkHighMark = 50331648
objectHighMark = 16384
serverMaxSlots = 64
serverSlots = 16
serverSlots1 = 32

这个配置文件应该允许了 https 代理模式。

修改完成之后，重启 polipo 服务

service polipo restart

polipo 默认使用 8123 端口，所以可以使用以下命令在命令行开启代理：

export http_proxy="http://127.0.0.1:8123"
export https_proxy="https://127.0.0.1:8123"

之后为了保证 shadowsocks 开机运行，可以修改 /etc/rc.local 文件，加入命令：

sslocal -c /path/to/shadowsocks.json&!

