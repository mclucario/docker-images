FROM php:7.2.4-cli
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

RUN set -ex; \
cd '/tmp'; \
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"; \
php composer-setup.php --install-dir=/bin --filename=composer; \
rm 'composer-setup.php';

RUN set -ex; \
export NVM_DIR="/opt/nvm"; \
mkdir /opt/nvm; \
chmod 777 /opt/nvm; \
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash; \
chmod 777 /opt/nvm;

COPY ./php-workspace/initws.sh /tmp/initws.sh
RUN ["chmod", "+x", "/tmp/initws.sh"]
ENTRYPOINT [ "/tmp/initws.sh" ]