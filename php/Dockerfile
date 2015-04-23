FROM php:5.5-fpm
MAINTAINER Gerd Zschaler <gzschaler@googlemail.com>

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y --no-install-recommends \
    libbz2-dev libicu-dev libxml2-dev build-essential zlib1g-dev

RUN docker-php-ext-install bz2 intl mbstring zip

# install xcache
RUN curl -LsS http://xcache.lighttpd.net/pub/Releases/3.2.0/xcache-3.2.0.tar.gz -o xcache-3.2.0.tar.gz \
    && tar xzf xcache-3.2.0.tar.gz && cd xcache* \
    && phpize && ./configure --enable-xcache && make && make install && cd .. && rm -rf xcache*

RUN apt-get purge -y libbz2-dev libicu-dev libxml2-dev build-essential zlib1g-dev

ADD php.ini /usr/local/etc/php/php.ini

VOLUME ["/usr/share/nginx/html"]

CMD ["php-fpm"]
