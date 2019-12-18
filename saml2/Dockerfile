FROM php:7.4-apache-buster
RUN apt update && \
    apt -y install apt-transport-https \
                   git \
                   curl \
                   vim --no-install-recommends && \
    rm -r /var/lib/apt/lists/*

ARG SIMPLESAMLPHP_VERSION=1.18.3
ARG SIMPLESAMLPHP_URL=https://github.com/simplesamlphp/simplesamlphp/releases/download/v$SIMPLESAMLPHP_VERSION/simplesamlphp-$SIMPLESAMLPHP_VERSION.tar.gz
RUN curl -s -L -o /tmp/simplesamlphp.tar.gz $SIMPLESAMLPHP_URL && \
    tar xzf /tmp/simplesamlphp.tar.gz -C /tmp && \
    rm -f /tmp/simplesamlphp.tar.gz  && \
    mv /tmp/simplesamlphp-* /var/www/simplesamlphp && \
    touch /var/www/simplesamlphp/modules/exampleauth/enable
COPY config/simplesamlphp/config/ /var/www/simplesamlphp/config/
COPY config/simplesamlphp/metadata/ /var/www/simplesamlphp/metadata/
COPY config/simplesamlphp/cert/ /var/www/simplesamlphp/cert/

COPY config/apache2/ports.conf /etc/apache2/
COPY config/apache2/sites-available/ /etc/apache2/sites-available/
COPY config/apache2/cert/ /etc/ssl/cert/
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf && \
    a2enmod ssl && \
    a2dissite 000-default.conf default-ssl.conf && \
    a2ensite simplesamlphp.conf

# Set work dir
WORKDIR /var/www/simplesamlphp

# General setup
EXPOSE 8081
