FROM php:alpine

RUN --mount=type=bind,from=mlocati/php-extension-installer,source=/usr/bin/install-php-extensions,target=/usr/local/bin/install-php-extensions \
      install-php-extensions ctype curl dom fileinfo filter hash mbstring openssl pcre pdo session tokenizer xml zip opcache pdo_pgsql pdo_mysql bcmath intl pcntl sockets xsl exif gd imagick && \
     apk del --no-cache ${PHPIZE_DEPS} ${BUILD_DEPENDS}

WORKDIR /app

ENV COMPOSER_ALLOW_SUPERUSER=1

COPY --from=composer /usr/bin/composer /usr/bin/composer
COPY --from=spiralscout/roadrunner /usr/bin/rr /usr/bin/rr