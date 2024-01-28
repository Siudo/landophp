FROM php:8.1-fpm

# Arguments defined in docker-compose.yml

# Install system dependencies
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
    libxml2-dev \
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
RUN pecl install apcu \
    && pecl install imagick \
    && pecl install memcached \
    && pecl install redis-5.3.7 \
    && pecl install xdebug \
    && pecl install xlswriter \
    && pecl install openswoole \
    && docker-php-ext-enable apcu \
    && docker-php-ext-enable imagick \
    && docker-php-ext-enable memcached \
    && docker-php-ext-enable redis \
    && docker-php-ext-install bcmath \
    && docker-php-ext-install bz2 \
    && docker-php-ext-install calendar \
    && docker-php-ext-install exif \
    && docker-php-ext-install gettext \
    && docker-php-ext-install intl \
    && docker-php-ext-install ldap \
    && docker-php-ext-install mbstring \
    && docker-php-ext-install mysqli \
    && docker-php-ext-install opcache \
    && docker-php-ext-install pcntl \
    && docker-php-ext-install pdo \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install soap \
    && docker-php-ext-install zip \
    && docker-php-ext-enable xlswriter \
    && docker-php-ext-enable openswoole \
    && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php --install-dir=/usr/local/bin --filename=composer --version=2.2.12 \
    && php -r "unlink('composer-setup.php');" \
    && chsh -s /bin/bash www-data && mkdir -p /var/www/.composer && chown -R www-data:www-data /var/www \
    && apt-get -y clean \
    && apt-get -y autoclean \
    && apt-get -y autoremove \
    && rm -rf /var/lib/apt/lists/* && rm -rf && rm -rf /var/lib/cache/* && rm -rf /var/lib/log/* && rm -rf /tmp/*

# Get latest Composer
# RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Create system user to run Composer and Artisan Commands
# RUN useradd -G www-data,root -u $uid -d /home/$user $user
# RUN mkdir -p /home/$user/.composer && \
#     chown -R $user:$user /home/$user

# Set working directory
WORKDIR /var/www

# USER $user