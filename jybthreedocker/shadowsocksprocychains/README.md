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

你可以从这里下载到源代码，编译后安装即可：

[plain] view plain copy
git clone https://github.com/rofl0r/proxychains-ng  
cd proxychains-ng  
./configure  
sudo make && make install  
ProxyChains 的配置文件位于 /etc/proxychains.conf ，打开后你需要在末尾添加你使用的代理。例如：

[plain] view plain copy
[ProxyList]  
# add proxy here ...  
# meanwile  
# defaults set to "tor"  
#socks4    127.0.0.1 9050  
  
# example  
socks5  127.0.0.1 8888  
确保你添加的代理能用。如果没有的话，你可以暂时在网上找一些免费的代理（不一定安全，你的流量可能被监听），比如说：hidemyass。

OK，基础的配置到这里就搞定了。除此之外，这个文件里还用一堆可选的配置供你调整，自己去看啦。

ProxyChains 的使用方式非常简单，直接在应用程序前加上 proxychains4 即可。例如：
proxychains4 git clone https://github.com/rofl0r/proxychains-ng
有没有明显感觉到 clone 的速度变快了很多。当然，除此之外你可以在任何你想通过代理的应用上使用：
# 在 Ubuntu 上更新软件包
sudo proxychains4 apt-get update

# 安装 npm 依赖(国内慢得一B啊)
proxychains4 npm install
