FROM php:5.5-fpm
MAINTAINER Gerd Zschaler <gzschaler@googlemail.com>

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y --no-install-recommends \
    libbz2-dev libicu-dev libxml2-dev build-essential zlib1g-dev

# provide memcache extension
RUN curl -LsS http://pecl.php.net/get/memcache-2.2.7.tgz -o memcache.tgz \
    && tar xzf memcache.tgz && mv memcache-2.2.7 /usr/src/php/ext/memcache

RUN docker-php-ext-install bz2 intl mbstring zip memcache

# install xcache
RUN curl -LsS http://xcache.lighttpd.net/pub/Releases/3.2.0/xcache-3.2.0.tar.gz -o xcache-3.2.0.tar.gz \
    && tar xzf xcache-3.2.0.tar.gz && cd xcache* \
    && phpize && ./configure --enable-xcache && make && make install && cd .. && rm -rf xcache*

RUN apt-get purge -y libbz2-dev libicu-dev libxml2-dev build-essential zlib1g-dev

ADD php.ini /usr/local/etc/php/php.ini

VOLUME ["/var/www/html"]

CMD ["php-fpm"]
