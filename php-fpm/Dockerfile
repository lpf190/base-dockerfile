FROM php-fpm:7.2-alpine3.8

ENV EXT_DEPS zlib-dev libmemcached-dev cyrus-sasl-dev gcc g++ make libc-dev git
ENV COMPOSER_VERSION 1.7.2
WORKDIR /var/www/html
RUN set -xe \
    && apk add --no-cache libmemcached-libs zlib \
    && apk add --no-cache \
        --virtual .memcached-deps \
        $EXT_DEPS \
    && git clone -b php7 https://github.com/php-memcached-dev/php-memcached /usr/src/php/ext/memcached \
    && docker-php-ext-configure /usr/src/php/ext/memcached \
        --disable-memcached-sasl \
    && docker-php-ext-install /usr/src/php/ext/memcached \
    && rm -rf /usr/src/php/ext/memcached \
    && apk del .memcached-deps \
  \
    && wget -O /var/www/html/redis.tar.gz https://github.com/phpredis/phpredis/archive/4.1.1.tar.gz \
    && tar xzf redis.tar.gz \
    && rm redis.tar.gz \
    && mkdir -p /usr/src/php/ext \
    && mv phpredis-4.1.1 /usr/src/php/ext/redis \
    && docker-php-ext-install redis \
    && rm -rf /usr/src/php/ext/redis \
  \
    && docker-php-ext-install pdo_mysql \
  \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version=${COMPOSER_VERSION} \
    && composer create-project laravel/lumen --prefer-dist /var/www/html/test 5.5.* \
    && rm -rf /var/cache/apk/*
EXPOSE 9000
ENTRYPOINT ["docker-php-entrypoint"]
CMD ["php-fpm"]
