FROM php:7.4-apache
RUN apt update -y && apt install -y zip zlib1g-dev libpng-dev libonig-dev libzip-dev libmagickwand-dev imagemagick
RUN docker-php-ext-install exif \
gd \
# mbstring \ libonig-devにmbstringが含まれるので不要
pdo_mysql \
mysqli \
opcache \
zip
RUN pecl install imagick && docker-php-ext-enable imagick
COPY --from=composer /usr/bin/composer /usr/bin/composer

ENV APACHE_DOCUMENT_ROOT=/var/www/html/wordpress

RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf && sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/conf-available/*.conf