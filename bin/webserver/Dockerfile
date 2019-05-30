FROM php:7.1.20-apache

RUN apt-get -y update --fix-missing
RUN apt-get upgrade -y

# Install tools & libraries
RUN apt-get -y install apt-utils nano dialog \
    build-essential curl libcurl3 libcurl3-dev zip

# Install important libraries
RUN apt-get -y install --fix-missing apt-utils build-essential curl libcurl3 libcurl3-dev zip \
    libmcrypt-dev libsqlite3-dev libsqlite3-0 mysql-client zlib1g-dev \
    libicu-dev libfreetype6-dev libjpeg62-turbo-dev libpng-dev

# Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# PHP Extensions
RUN pecl install \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install mysqli 

# curl y json ya vienen en la imagen de php
#RUN docker-php-ext-install curl && docker-php-ext-install json 

RUN docker-php-ext-install zip

RUN docker-php-ext-install -j$(nproc) intl \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd 


#RUN docker-php-ext-install mbstring \
#    && docker-php-ext-install mcrypt \
#    && docker-php-ext-install tokenizer 

# Enable apache modules
RUN a2enmod rewrite headers

COPY ./www /var/www/html/reservaespacios
COPY ./config/php/php.ini /usr/local/etc/php/php.ini

RUN chown -R www-data /var/www/html/reservaespacios/config /var/www/html/reservaespacios/plugins 

ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
