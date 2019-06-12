软链接地址   /mnt/dShare/openwrtDir/dl/
看到LEAN大大开源的LEDE项目，https://www.right.com.cn/forum/thread-252647-1-1.html

非常佩服哇； 手痒弄个docker镜像，旨在快速一键编译。像我这样的小白或者懒人就不用怎么纠缠搭建编译环境的事情了。

已经放到docker hub并构建镜像成功； https://hub.docker.com/r/timiil/coolsnowwolf-lede-builder/
简单讲讲如何使用：

1， 安装docker环境 
2， 拉取镜像:  docker pull timiil/coolsnowwolf-lede-builder
3,   运行容器:  docker run -it -v /home/lede_output:/lede/bin timiil/coolsnowwolf-lede-builder
4, 在容器内运行：  


编译方法
export FORCE_UNSAFE_CONFIGURE=1
cd /mnt/openwrtlede 
ln -s /root/dl dl

./scripts/feeds update -a
./scripts/feeds install -a

make menuconfig

。。。

nohup make -j1 V=99 &

内核配置文件
make kernel_menuconfig

 target/linux/ramips/mt7628/config-3.18 
 make target/linux/compile V=99 编译内核