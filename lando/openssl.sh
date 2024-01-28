#!/bin/bash

#!/bin/sh
set -e

# prefer user supplied CFLAGS, but default to our PHP_CFLAGS
: ${CFLAGS:=$PHP_CFLAGS}
: ${CPPFLAGS:=$PHP_CPPFLAGS}
: ${LDFLAGS:=$PHP_LDFLAGS}
export CFLAGS CPPFLAGS LDFLAGS

srcExists=
if [ -d /usr/src/php ]; then
srcExists=1
fi
docker-php-source extract
if [ -z “$srcExists” ]; then
touch /usr/src/php/.docker-delete-me
fi

cd /usr/src/php/ext

pm=’unknown’
if [ -e /lib/apk/db/installed ]; then
pm=’apk’
fi

apkDel=
if [ “$pm” = ‘apk’ ]; then
if [ -n “$PHPIZE_DEPS” ]; then
if apk info –installed .phpize-deps-configure > /dev/null; then
apkDel=’.phpize-deps-configure’
elif ! apk info –installed .phpize-deps > /dev/null; then
apk add –no-cache –virtual .phpize-deps $PHPIZE_DEPS
apkDel=’.phpize-deps’
fi
fi
fi

popDir=”$PWD”
cd openssl
mv config0.m4 config.m4
[ -e Makefile ] || docker-php-ext-configure openssl
make
make install
find modules \
-maxdepth 1 \
-name ‘*.so’ \
-exec basename ‘{}’ ‘;’ \
| xargs -r docker-php-ext-enable
make clean
cd “$popDir”

if [ “$pm” = ‘apk’ ] && [ -n “$apkDel” ]; then
apk del $apkDel
fi

if [ -e /usr/src/php/.docker-delete-me ]; then
docker-php-source delete
fi