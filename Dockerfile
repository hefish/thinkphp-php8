FROM debian:bookworm-slim


RUN  sed -i "s/deb.debian.org/mirrors.ustc.edu.cn/" /etc/apt/sources.list.d/debian.sources && \
     apt update && apt upgrade -y && apt install -y nginx php-cli php-fpm php-mysql php-gd php-curl php-mbstring php-xml php-bcmath php-zip composer  && \
     rm -fr /var/cache/apt/* 

ADD  config/nginx.conf /etc/nginx/nginx.conf
ADD  config/php-fpm-www.conf /etc/php/8.2/fpm/pool.d/php-fpm-www.conf
ADD  config/php.ini  /etc/php/8.2/fpm/php.ini
ADD  entry-point.sh  /entry-point.sh

EXPOSE 8080

WORKDIR  /var/www/html

ENTRYPOINT ["/entry-point.sh"]


