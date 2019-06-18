FROM nginx:1.17-alpine

MAINTAINER Pablo Sousa <pablosousa.ads@gmail.com>

ARG UID=1000
ARG GID=1000

RUN apk update && apk add bash

RUN rm /etc/nginx/conf.d/default.conf

COPY ./app.conf /etc/nginx/conf.d

#CMD ["nginx"]
