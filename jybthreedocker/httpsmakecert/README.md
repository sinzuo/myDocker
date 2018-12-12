
hub.docker.com/r/linuxserver/letsencrypt

github.com/linuxserver/docker-letsencrypt

docker run -d \
--cap-add=NET_ADMIN \
--name=letsencrypt \
-v /opt/letsencrypt2:/config \
-e PGID=1002 -e PUID=1001  \
-e URL=my.com \
-e SUBDOMAINS=www \
-e VALIDATION=dns \
-e DNSPLUGIN=cloudflare \
-p 80:80 -p 443:443 \
-e TZ=Asia/Shanghai \
linuxserver/letsencrypt




http 服务器需要有 文件夹 .well-known / acme-challenge
配置 这个 才能生成
server {
        listen 80;

        server_name weburl.com; 
        root /var/www/html;

        location ~ /.well-known {
                allow all;
        }

        location ~ /\.well-known/acme-challenge/ {
            allow all;
            root /var/www/html;
            try_files $uri =404;
            break;
        }
}
