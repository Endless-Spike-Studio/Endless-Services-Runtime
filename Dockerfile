FROM dunglas/frankenphp

ENV SERVER_NAME=:80

RUN docker-php-ext-install pcntl

RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"