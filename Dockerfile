FROM alpine:latest
MAINTAINER Ryan_Newman <15244909057.ww@gmail.com>

# use china souce
ADD ./apk/repositories /etc/apk/repositories
ADD ./static /var/www/static

# update software

RUN apk update
RUN apk upgrade

# install nginx

RUN apk add nginx

# install rtmp plugin

RUN apk add nginx-mod-rtmp

# install supervisor

RUN apk add supervisor

# copy configure file

## nginx conf
ADD ./nginx/nginx.conf /etc/nginx/nginx.conf

## supervisor conf
ADD ./supervisor/supervisord.conf /etc/supervisor/supervisord.conf
ADD ./supervisor/conf.d/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# install ffmpeg and aac plugin

RUN apk add ffmpeg faac

# create needs folder and permission

RUN mkdir -p /var/live/hls
RUN mkdir -p /var/log/supervisor
RUN mkdir -p /run/nginx

# run container

EXPOSE 80 1935

CMD ["/usr/bin/supervisord","-c","/etc/supervisor/supervisord.conf"]
