#!/usr/bin/env bash

# Install Apache server
echo -e "\e[42;33mInstalling Apache\e[0m"
apt-get update
apt-get install -y apache2
rm -rf /var/www
ln -fs /vagrant /var/www

# Copy Vhost definitions to apache2 directory
echo -e "\e[42;33mCopying Vhosts\e[0m"
if [ -d /vagrant/bootstrap/vhosts ]
then
	cp -r /vagrant/bootstrap/vhosts/* /etc/apache2/sites-available/
else
	echo -e "\e[41;93mVhosts source folder does not exist\e[0m"
fi

echo -e "\e[42;33mEnabling Vhosts\e[0m"
VHOST_FILES=/vagrant/bootstrap/vhosts/*
for file in $VHOST_FILES
do
	FILENAME=$(basename "$file")
	echo -e "\e[42;33m" $FILENAME "\e[0m"
	ln -s /etc/apache2/sites-available/$FILENAME /etc/apache2/sites-enabled/$FILENAME
done;

echo -e "\e[42;33mEnable mod rewrite\e[0m"
a2enmod rewrite

echo -e "\e[42;33mStarting httpd service\e[0m"
service apache2 start

echo -e "\e[42;33mApache installed\e[0m"