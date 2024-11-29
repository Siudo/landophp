FROM devwithlando/php:8.4-fpm-4

RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    libbz2-dev \
    libc-client-dev \
    libfreetype6-dev \
    libicu-dev \
    libjpeg62-turbo-dev \
    libkrb5-dev \
    libldap2-dev \
    libmagickwand-dev \
    libmemcached-dev \
    libpng-dev \
    libzip-dev \
    libonig-dev \
    libpq-dev \
    libwebp-dev \
    libzip-dev \
    libonig-dev \
    pv \
    rsync \
    ssh \
    unzip \
    wget
RUN pecl install xlswriter \
    && pecl install openswoole \
    && docker-php-ext-enable xlswriter \
    && docker-php-ext-enable openswoole
