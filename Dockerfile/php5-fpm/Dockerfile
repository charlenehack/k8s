FROM php:5.6-fpm-alpine
LABEL maintainer="liucl <119215719@qq.com>"

COPY config/php.ini /usr/local/etc/php/php.ini
COPY config/www.conf /usr/local/etc/php-fpm.d/www.conf

RUN addgroup -S www && adduser -D -S -H -s /sbin/nologin -G www www && \
	apk add --no-cache build-base autoconf libpng-dev libjpeg-turbo-dev freetype-dev linux-headers libxml2-dev libxslt-dev gettext-dev libmcrypt-dev && \
	docker-php-ext-configure gd --with-png-dir --with-jpeg-dir --with-freetype-dir && \
	docker-php-ext-install gd xmlrpc bcmath gettext mysqli pdo_mysql pcntl shmop soap sockets sysvsem xsl opcache zip && \
	pecl install http://pecl.php.net/get/redis-4.3.0.tgz && \
	pecl install http://pecl.php.net/get/swoole-1.9.17.tgz && \ 
	pecl install redis mongodb swoole && docker-php-ext-enable redis mongodb swoole && \
	apk del build-base && rm -rf /tmp/* 
