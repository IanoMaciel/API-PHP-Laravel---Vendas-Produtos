FROM php:8.1-fpm-alpine

WORKDIR /var/www/html

RUN apk add --no-cache --update linux-headers \
        autoconf \
        gcc \
        g++ \
        make \
        icu-dev \
        libzip-dev \
        zlib-dev \
        libpng-dev \
        libjpeg-turbo-dev \
        freetype-dev && \
    docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install -j$(nproc) \
        bcmath \
        gd \
        intl \
        pdo_mysql \
        zip && \
    pecl install xdebug && \
    docker-php-ext-enable xdebug && \
    rm -rf /tmp/pear

COPY . .

RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN composer install --prefer-dist --no-ansi --no-interaction --no-progress --no-scripts

RUN php artisan key:generate

CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]
