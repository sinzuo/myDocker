FROM jyb-ubuntu-tools:16.04


RUN \
        apt-get update && \
        apt-get install -y mariadb-server mariadb-common && \
        apt-get install -y php && \
        apt-get install -y nginx php-cli php-dev php-common php-curl php-fpm php-gd php-imagick php-json php-mcrypt php-mysql php-readline php-redis php-memcache php-memcached

RUN curl -sS https://getcomposer.org/installer | php

# 配置nginx
RUN mv /composer.phar /root/
Copy ./default /etc/nginx/sites-available/default

# 添加启动脚本
ADD ./start.sh /bin/start.sh
RUN chmod 777 /bin/start.sh


#RUN . start.sh

# Expose ports.
EXPOSE 3306
EXPOSE 80
