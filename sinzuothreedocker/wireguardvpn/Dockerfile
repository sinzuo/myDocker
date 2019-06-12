FROM ubuntu:18.10

MAINTAINER jiang_yi_bo@sinzuo.com
RUN apt update -y && \
    apt install -y software-properties-common iptables curl iproute2 ifupdown iputils-ping net-tools && \
    add-apt-repository --yes ppa:wireguard/wireguard && \
    apt install -y wireguard-dkms wireguard-tools

COPY run.sh /root/
COPY  wg0.conf.example   /etc/wireguard/wg0.conf
RUN chmod +x /root/run.sh
ENTRYPOINT ["/root/run.sh"]
CMD []