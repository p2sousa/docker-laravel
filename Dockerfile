FROM php:7.3.6-fpm-alpine3.9

MAINTAINER Pablo Sousa <pablosousa.ads@gmail.com>

# install extensions and aplications linux
RUN apk add --no-cache openssl bash mysql-client
RUN docker-php-ext-install pdo pdo_mysql

# install dockerizdr to controll dependencies containers
ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
  && tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
  && rm dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz


WORKDIR /var/www
RUN rm -rf /var/www/html

COPY ./.docker/php/php.ini /usr/local/etc/php/conf.d/

# install composer
RUN curl -sS https://getcomposer.org/installer | php -- \
  --install-dir=/usr/local/bin --filename=composer

RUN ln -s public html

# COPY . /var/www

EXPOSE 9000

ENTRYPOINT ["php-fpm"]
