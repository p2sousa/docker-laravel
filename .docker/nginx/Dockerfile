FROM nginx:1.17-alpine

MAINTAINER Pablo Sousa <pablosousa.ads@gmail.com>

ARG UID=1000
ARG GID=1000

RUN addgroup -g ${GID:-1000} -S www-data \
 && adduser -u ${UID:-1000} -D -S -G www-data www-data

COPY app.conf /etc/nginx/
COPY app.conf /etc/nginx/sites-available/app.conf

RUN mkdir /etc/nginx/sites-enabled/ \
  && ln -s /etc/nginx/sites-available/app.conf /etc/nginx/sites-enabled/app \
  && rm -f /etc/nginx/conf.d/default.conf \
  && mkdir /etc/nginx/ssl

RUN chmod -R 0600 /etc/nginx/ssl/

EXPOSE 80

CMD ["nginx"]

