FROM php:7.3-fpm
  
# 安装扩展
RUN groupadd -r www && useradd -r -M -g www www
RUN apt-get update -y && apt-get -y install gcc curl make autoconf libc-dev pkg-config libzip-dev
RUN apt-get -y install --no-install-recommends git libssl-dev libxslt-dev libmcrypt-dev librdkafka-dev libxml2-dev libpng++-dev libjpeg-dev libpng-dev libvpx-dev libfreetype6-dev \
        libmagick++-dev libmagickwand-dev zlib1g-dev libgd-dev libmagic-dev libpcre3-dev libreadline-dev libedit-dev libsqlite3-dev libmemcached-dev ffmpeg
RUN docker-php-ext-install zip bcmath bz2 ctype gettext json mbstring mysqli opcache pcntl pdo pdo_mysql pdo_sqlite phar posix readline session shmop soap sockets sysvmsg sysvsem && \
	export CFLAGS="-I/usr/src/php" && docker-php-ext-install xmlreader xmlwriter xml xmlrpc xsl && \
	pecl install imagick redis memcached mongodb swoole rdkafka && \
	docker-php-ext-enable imagick redis memcached mongodb swoole rdkafka && \
	docker-php-ext-configure gd --with-png-dir --with-jpeg-dir --with-freetype-dir && docker-php-ext-install gd

# 安装composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php composer-setup.php && php -r "unlink('composer-setup.php');" && mv composer.phar /usr/local/bin/composer && chmod +x /usr/local/bin/composer

# 添加配置
ADD config/php.ini /usr/local/etc/php/
ADD config/www.conf /usr/local/etc/php-fpm.d/

# 清理工作
RUN apt-get autoremove -y && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
