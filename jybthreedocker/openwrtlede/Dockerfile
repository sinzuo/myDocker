FROM openwrtbuild:1.0
MAINTAINER jiang_yi_bo@sinzuo.com

ENV FORCE_UNSAFE_CONFIGURE 1
RUN \
  git clone git@192.168.3.242/gitServer/openwrtlede && \
  cd openwrtlede && \
  ./scripts/feeds update -a && \
  ./scripts/feeds install -a


WORKDIR /openwrtlede