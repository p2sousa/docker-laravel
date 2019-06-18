# start with the official Composer image and name it
FROM composer:1.5.1 AS composer

FROM php:7.3.6-fpm-alpine3.9

MAINTAINER Pablo Sousa <pablosousa.ads@gmail.com>

RUN apk add bash mysql-client
RUN docker-php-ext-install pdo pdo_mysql

RUN chown -R www-data:www-data /var/www

# Environments
ENV APP=/var/www

WORKDIR $APP

RUN rm -rf $APP/html

COPY ./.docker/php/php.ini /usr/local/etc/php/conf.d/

# copy the Composer PHAR from the Composer image into the PHP image
COPY --from=composer /usr/bin/composer /usr/bin/composer

# show that both Composer and PHP run as expected
RUN composer --version

RUN ln -s public html

COPY . $APP

#RUN composer install

ENTRYPOINT ["php-fpm"]
