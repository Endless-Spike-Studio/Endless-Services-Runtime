FROM composer as composer
FROM dunglas/frankenphp:alpine

COPY --from=composer /usr/bin/composer /usr/bin/composer

ENV SERVER_NAME=:80

RUN docker-php-ext-install opcache pcntl redis memcached

RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"