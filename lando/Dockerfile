FROM devwithlando/php:8.1-apache-4

# Install dependencies we need
RUN pecl install xlswriter \
  && pecl install openswoole \
  && docker-php-ext-enable xlswriter \
  && docker-php-ext-enable openswoole

RUN apt-get update && apt-get install -y \
    perl \
    curl \
    build-essential \
    tar \
    wget
RUN wget http://nz2.archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl-doc_3.0.2-0ubuntu1.13_all.deb
RUN dpkg -i libssl-doc_3.0.2-0ubuntu1.13_all.deb
# RUN rm -rf /usr/bin/openssl

# RUN cd /usr/local/src && curl --output openssl-3.tar.gz https://www.openssl.org/source/openssl-3.0.5.tar.gz && tar -xzvf openssl-3.tar.gz
# RUN cd /usr/local/src/openssl-3.0.5 && ./config && make && make install_sw && make install_fips && make install_ssldirs
# RUN ln -s /usr/local/bin/openssl /usr/bin/openssl \
#   && ln -s /usr/local/bin/openssl /usr/lib/openssl \
#   && ln -s /usr/local/lib64/libssl.so.3 /usr/lib/libssl.so.3 && ln -s /usr/local/lib64/libcrypto.so.3 /usr/lib/libcrypto.so.3 && ldconfig
# RUN export LD_LIBRARY_PATH=/usr/local/bin/openssl/lib64
# # RUN rm -rf /usr/local/src/openssl-3.0.5 \
#   && apt-get update -y \
#   && LDFLAGS=-Wl,-R/usr/local/ssl/lib \
#   && set ./configure --with-openssl

RUN ldconfig
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
