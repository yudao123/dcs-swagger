FROM nginx:latest

EXPOSE 9623

RUN sed -i -s 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
RUN apt-get update && apt-get install -y vim apache2-utils

WORKDIR /data

COPY data /data
COPY swagger.conf /etc/nginx/conf.d/swagger.conf

RUN mkdir -p /data/doc
RUN chown -R nginx /data/doc
RUN [ -f /data/htpasswd ] || htpasswd -bc /data/htpasswd yinghua yudao123
