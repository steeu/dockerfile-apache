# ubuntu version
FROM ubuntu:14.04

# install libs
RUN  apt-get update

# install apache
RUN  apt-get install apache2
# enable apache modules
RUN  a2enmod proxy proxy_http headers rewrite ssl
# set environment variables
ENV  APACHE_RUN_USER www-data
ENV  APACHE_RUN_GROUP www-data
ENV  APACHE_LOG_DIR /var/log/apache2

# install nano editor
RUN  apt-get install nano -y

# proxy.local
COPY sites-available/proxy.local.conf /etc/apache2/sites-available/proxy.local.conf
RUN  a2ensite proxy.local.conf

# ssl.local
COPY sites-available/ssl.local.conf /etc/apache2/sites-available/ssl.local.conf
RUN  a2ensite ssl.local.conf

# start apache
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
