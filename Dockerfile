FROM php:7.3.6-fpm

MAINTAINER Pablo Sousa <pablosousa.ads@gmail.com>

# ImageMagick
RUN apt-get update && apt-get install -y libmagickwand-6.q16-dev --no-install-recommends \
  && ln -s /usr/lib/x86_64-linux-gnu/ImageMagick-6.8.9/bin-Q16/MagickWand-config /usr/bin \
  && pecl install imagick \
  && echo "extension=imagick.so" > /usr/local/etc/php/conf.d/ext-imagick.ini

# PHP & Utils
RUN apt-get update && apt-get install -y --no-install-recommends \
  vim \
  git \
  unzip \
  cron \
  libcurl3-dev \
  zlib1g-dev \
  libicu-dev \
  libzip-dev \
  && apt-get clean; rm -rf /var/lib/apt/lists/* \
  && docker-php-ext-install curl intl json mbstring pdo pdo_mysql opcache zip fileinfo\
  && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
  && docker-php-ext-install gd

RUN pecl install apcu-5.1.17 \
    && docker-php-ext-enable apcu

ARG UID=1000

# Set timezone to America/Sao_Paulo
RUN rm /etc/localtime \
  && ln -s /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime

# Copy .ini config file
COPY ./.docker/php/php.ini /usr/local/etc/php/conf.d/

# Create a user
RUN useradd --uid ${UID:-1000} --no-user-group -g www-data \
    --create-home --shell /bin/false appuser

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- \
  --install-dir=/usr/local/bin --filename=composer

# Environments
ENV HOME=/home/appuser
ENV APP=$HOME/laravel
ENV COMPOSER_ALLOW_SUPERUSER=1
WORKDIR $APP

# Copy application folder and set up its permissions
COPY . $APP/

# RUN cp .env.example .env
# ENV DB_HOST=db
# ENV DB_DATABASE=$MYSQL_DATABASE
# ENV DB_USERNAME=$MYSQL_USER
# ENV DB_PASSWORD=$MYSQL_ROOT_PASSWORD

USER root

# Update ownership of home folder with the correct user and group
RUN chown -R appuser:www-data $HOME/*

RUN chown -R appuser:www-data $APP/* \
  && chmod -R 775 $APP/public

# RUN composer install

USER appuser
VOLUME $APP

ENTRYPOINT ["php-fpm"]
