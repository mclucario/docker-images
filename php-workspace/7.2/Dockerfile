FROM php:7.2.4-cli
MAINTAINER leon.gruenewald@kreativrudel.de

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
chmod +x /opt/nvm/nvm.sh; \
/opt/nvm/nvm.sh;

COPY ./php-workspace/initws.sh /tmp/initws.sh
RUN ["chmod", "+x", "/tmp/initws.sh"]
ENTRYPOINT [ "/tmp/initws.sh" ]