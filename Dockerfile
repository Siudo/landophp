FROM devwithlando/php:8.1-apache-4

# Install dependencies we need
RUN pecl install xlswriter \
  && pecl install openswoole \
  && docker-php-ext-enable xlswriter \
  && docker-php-ext-enable openswoole

RUN mkdir -p /var/installation-files/openssl3
RUN apt-get update && apt-get install -y \
    perl \
    curl \
    build-essential \
    tar


COPY ./start.sh /var/installation-files
RUN chmod +x /var/installation-files/start.sh
RUN /var/installation-files/start.sh