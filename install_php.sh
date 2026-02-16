#!/usr/bin/env bash
set -e

PHP_VERSION="8.4.18"

wget https://www.php.net/distributions/php-${PHP_VERSION}.tar.xz
tar -xf php-${PHP_VERSION}.tar.xz
cd php-${PHP_VERSION}

./configure \
  --prefix=/opt/php-8.4.18 \
  --with-mysqli=mysqlnd \
  --with-pdo-mysql=mysqlnd \
  --with-sqlite3 \
  --enable-mbstring \
  --with-curl \
  --with-openssl \
  --enable-opcache \
  --enable-cli \
  --with-zip \
  --enable-bcmath \
  --enable-pcntl \
  --with-zlib \
  --enable-fpm \
  --with-fpm-systemd \
  --with-fpm-user=www-data \
  --with-fpm-group=www-data \
  --enable-gd \
  --with-freetype \
  --with-jpeg \
  --with-webp \
  --enable-exif \
  --with-pear \
  --enable-intl

make -j$(nproc)
make test -j$(nproc)
sudo make install

cd ..
rm -rf php-${PHP_VERSION}*

echo 'export PATH=/opt/php-8.4.18/bin:$PATH' >> ~/.bashrc
