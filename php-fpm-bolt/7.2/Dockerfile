FROM php:7.2.4-fpm
MAINTAINER leon.gruenewald@kreativrudel.de

RUN set -ex; \
    \
    apt-get update; \
    apt-get install -y \
        libjpeg-dev \
        libpng-dev \
        libssl-dev \
        libicu-dev \
        libfreetype6-dev \
        zlib1g-dev \
        libzip-dev \
        libxml2-dev \
    ; \
    rm -rf /var/lib/apt/lists/*; \
    mkdir -p /usr/include/freetype2/freetype; \
    \
    docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr --with-freetype-dir=/usr/include/freetype2/freetype; \
    docker-php-ext-install gd mysqli opcache; \
    \
    pecl install xdebug; \
    docker-php-ext-enable xdebug; \
    \
    docker-php-ext-install zip; \
    \
    docker-php-ext-install intl; \
    \
    docker-php-ext-install pdo_mysql; \
    \
    docker-php-ext-install exif; \
    \
    docker-php-ext-install posix; \
    \
    docker-php-ext-install xml;

EXPOSE 9000
