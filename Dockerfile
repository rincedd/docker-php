FROM php:5.5-fpm
MAINTAINER Gerd Zschaler <gzschaler@googlemail.com>

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y --no-install-recommends \
    libbz2-dev libicu-dev libxml2-dev build-essential zlib1g-dev

RUN docker-php-ext-install bz2 ctype dom hash iconv intl json mbstring posix session tokenizer xml zip

RUN apt-get purge -y build-essential

CMD ["php-fpm"]
