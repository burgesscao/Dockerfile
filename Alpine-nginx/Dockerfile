FROM alpine

MAINTAINER  BurgessC

ADD nginx-1.14.0.tar.gz .

RUN apk add tzdata
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN apk del tzdata

RUN apk update 
RUN apk add geoip geoip-dev pcre gcc libxslt gd openssl-dev pcre-dev zlib-dev build-base linux-headers libxslt-dev gd-dev libstdc++ libgcc patch logrotate supervisor inotify-tools

RUN addgroup www  
Run adduser -G www -D -s /sbin/nologin www 

WORKDIR nginx-1.14.0 
RUN ./configure --prefix=/work/nginx --user=www --group=www --conf-path=/work/nginx/conf/nginx.conf --http-log-path=/work/nginx/logs/access.log --error-log-path=/work/nginx/logs/error.log --pid-path=/work/nginx/run/nginx.pid --lock-path=/work/nginx/run/nginx.lock --with-http_ssl_module --with-http_stub_status_module --with-http_degradation_module --with-http_gzip_static_module --with-http_flv_module --with-pcre

RUN make && make install

RUN chown -R www:www /work/

WORKDIR /
ADD run.sh /work/nginx/run.sh
RUN chmod 755 /work/nginx/run.sh

RUN rm -rf /nginx-1.14.0
RUN rm -rf /var/cache/apk/*
RUN rm -rf /work

EXPOSE 80
EXPOSE 443

CMD ["/work/nginx/run.sh"]
