FROM php:8.2-cli

# Installa dipendenze di sistema
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    libsqlite3-dev \
    libxml2-dev \
    libonig-dev \
    nano \
    unzip \
    git
RUN docker-php-ext-install \
    curl \
    pdo_sqlite \
    mbstring \
    xml
RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

RUN rm -rf /var/lib/apt/lists/*

# Installa Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Configura Xdebug (step base)
RUN echo "xdebug.mode=debug" > /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.client_host=0.0.0.0" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.client_port=9003" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.start_with_request=yes" >> /usr/local/etc/php/conf.d/xdebug.ini

WORKDIR /app

CMD ["bash"]
