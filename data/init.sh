#!/usr/bin/env bash

sudo -i
export DEBIAN_FRONTEND=noninteractive

echo "---------------------------------------- Updating ----------------------------------------"
apt-get update
apt-get -y upgrade
apt-get -y dist-upgrade

echo "---------------------------------------- Basic Tools ----------------------------------------"
apt-get -y install rcconf dialog rsync curl traceroute bash-completion nmap mtr-tiny

echo "---------------------------------------- Installing Apache2 ----------------------------------------"
apt-get -y install apache2
a2enmod actions headers rewrite cgi
a2enmod expires
a2dismod mpm_event
a2enmod mpm_prefork
a2enmod rewrite
a2enmod ssl
a2ensite default-ssl
cp /var/www/html/apache-conf.txt /etc/apache2/sites-enabled/000-default.conf

service apache2 restart

echo "---------------------------------------- Installing Database ----------------------------------------"
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
sudo apt-get -y install mysql-server
sudo apt-get -y install mysql-client


echo "---------------------------------------- Installing Language Platforms ----------------------------------------"
apt-get -y install php7.0 libapache2-mod-php7.0
apt-get -y install php7.0-mysql php7.0-curl php7.0-gd php7.0-intl php-pear php-imagick php7.0-imap php7.0-mcrypt php-memcache php7.0-pspell php7.0-recode php7.0-sqlite3 php7.0-tidy php7.0-xmlrpc php7.0-xsl php7.0-mbstring php-gettext
apt-get -y install php-apcu
apt-get -y install libapache2-mod-perl2
apt-get -y install libapache2-mod-passenger ruby-rmagick
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer

apt-get -y install build-essential autoconf libtool pkg-config python-opengl python-imaging python-pyrex python-pyside.qtopengl idle-python2.7 qt4-dev-tools qt4-designer libqtgui4 libqtcore4 libqt4-xml libqt4-test libqt4-script libqt4-network libqt4-dbus python-qt4 python-qt4-gl libgle3 python-dev python3-dev

apt-get -y install git


echo "---------------------------------------- Installing ArtWeb -----------------------------------"
cd /var/www/html/

if [ -d "/var/www/html/ArtWeb/" ]; then
	echo "----------------------------------- Updating the existing copy -----------------------------------"
	cd /var/www/html/ArtWeb/
	git pull origin
	php -r "readfile('https://getcomposer.org/installer');" | php
	php composer.phar update
fi

if [ ! -d "/var/www/html/ArtWeb/" ]; then
	echo "----------------------------------- Cloning new copy -----------------------------------"
	cd /var/www/html/
	git clone https://github.com/aazhbd/ArtWeb.git
	cd /var/www/html/ArtWeb/
	php -r "readfile('https://getcomposer.org/installer');" | php
	php composer.phar install
fi


if ! mysql -u root -e 'use dbname'; then
	echo "create database dbname;" | mysql -u root
	echo "----------------------------------- Database created -----------------------------------"
fi

service apache2 restart

cat /var/www/html/logo.txt
