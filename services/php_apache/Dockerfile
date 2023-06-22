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
RUN install-php-extensions gd pdo_mysql bcmath zip intl opcache mysqli xdebug
RUN docker-php-ext-install mbstring

COPY --from=composer:2.0 /usr/bin/composer /usr/local/bin/composer
