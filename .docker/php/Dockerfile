FROM php:7.3.6-fpm-alpine3.9

MAINTAINER Pablo Sousa <pablosousa.ads@gmail.com>

RUN apk add bash mysql-client
RUN docker-php-ext-install pdo pdo_mysql

WORKDIR /var/www

RUN rm -rf /var/www/html

#RUN rm /etc/localtime \
#  && ln -s /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime

COPY ./php.ini /usr/local/etc/php/conf.d/

RUN curl -sS https://getcomposer.org/installer | php -- \
  --install-dir=/usr/local/bin --filename=composer

RUN ln -s public html

EXPOSE 9000

#COPY ./wait-for.sh /tmp/init_database.sh
#RUN chmod 0777 /tmp/init_database.sh
#ENTRYPOINT ["/tmp/init_database.sh", "php-fpm"]
ENTRYPOINT ["php-fpm"]
