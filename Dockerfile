FROM composer as composer
FROM dunglas/frankenphp:alpine

COPY --from=composer /usr/bin/composer /usr/bin/composer

ENV SERVER_NAME=:80

RUN docker-php-ext-install opcache pcntl

RUN apk add --no-cache pcre-dev zlib-dev libmemcached-dev $PHPIZE_DEPS

RUN pecl install redis memcached
RUN docker-php-ext-enable redis memcached

RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"