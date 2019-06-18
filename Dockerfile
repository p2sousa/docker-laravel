FROM php:7.3.6-fpm-alpine3.9

MAINTAINER Pablo Sousa <pablosousa.ads@gmail.com>

RUN apk add bash mysql-client
RUN docker-php-ext-install pdo pdo_mysql

WORKDIR /var/www
RUN rm -rf /var/www/html

COPY ./.docker/php/php.ini /usr/local/etc/php/conf.d/

RUN curl -sS https://getcomposer.org/installer | php -- \
  --install-dir=/usr/local/bin --filename=composer

RUN ln -s public html

# COPY . /var/www

EXPOSE 9000

ENTRYPOINT ["php-fpm"]