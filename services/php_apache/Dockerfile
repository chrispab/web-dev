FROM php:5.6.40-apache

RUN a2enmod headers

RUN a2enmod rewrite

RUN a2enmod ssl
#resolves issue on build when repo changes source location
RUN sed -i -e 's/deb.debian.org/archive.debian.org/g' \
    -e 's|security.debian.org|archive.debian.org/|g' \
    -e '/stretch-updates/d' /etc/apt/sources.list

RUN apt-get update && apt-get install -y git unzip zip

#ENV TZ = Europe/London

WORKDIR /var/www

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/
RUN install-php-extensions gd pdo_mysql bcmath zip intl opcache mysqli
RUN docker-php-ext-install mbstring
RUN install-php-extensions xdebug
RUN docker-php-ext-enable xdebug

# RUN echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/xdebug.ini \
#     && echo "xdebug.remote_autostart=off" >> /usr/local/etc/php/conf.d/xdebug.ini

# zend_extension=/usr/lib64/php/modules/xdebug.so
# xdebug.default_enable = 1
# xdebug.remote_enable = 1
# xdebug.remote_autostart = 1
# ;xdebug.remote_host = '172.16.2.71'
# xdebug.remote_connect_back = 1
# xdebug.remote_port = 9001
RUN echo "xdebug.default_enable=1" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_enable=1" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_autostart=1" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_connect_back=1" >> /usr/local/etc/php/conf.d/xdebug.ini


COPY --from=composer:2.0 /usr/bin/composer /usr/local/bin/composer
