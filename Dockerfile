FROM ubuntu:18.04

RUN apt update -y && \
    apt install -y tzdata && \
    ln -sf /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
RUN apt install -y apache2 \
    cron \
    curl \
    git \
    htop \
    imagemagick \
    iputils-ping \
    libapache2-mod-php7.2 \
    libcurl4 \
    libmcrypt-dev \
    libreadline-dev \
    mysql-client \
    php-pear \
    php-intl \
    php-imagick \
    php7.2 \
    php7.2-cli \
    php7.2-curl \
    php7.2-dev \
    php7.2-gd \
    php7.2-mbstring \
    php7.2-mysql \
    php7.2-xml \
    php7.2-zip \
    unzip \
    vim
RUN curl -sS https://getcomposer.org/installer -o composer-setup.php && \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer
RUN pecl install mcrypt-1.0.1 && \
    echo extension=/usr/lib/php/20170718/mcrypt.so > /etc/php/7.2/cli/conf.d/20-mcrypt.ini && \
    echo extension=/usr/lib/php/20170718/mcrypt.so > /etc/php/7.2/apache2/conf.d/20-mcrypt.ini
RUN sed -i "s/memory_limit = 128M/memory_limit = 1024M/" /etc/php/7.2/apache2/php.ini
WORKDIR /var/www/html/
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

