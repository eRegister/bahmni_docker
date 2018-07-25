#!/bin/bash
set -e
if [ -f /etc/my.cnf ]; then
    sudo mkdir -p /$container_name/mysql && sudo chown -R mysql:mysql /$container_name/mysql
    sudo sed -i "s|datadir=/var/lib/mysql|datadir=/$container_name/mysql|g" /etc/my.cnf
    sudo service mysqld restart
else
   echo "File /etc/my.cnf does not exist."
fi

sudo service openmrs stop
sudo service bahmni-reports stop
sudo service mysqld stop
sudo rsync -avr -o -g /var/lib/mysql /$container_name
service mysqld start
service openmrs start
service bahmni-reports start

################
#Linking EMR UI#
################
# rename the original folder for backup
sudo mv /var/www/bahmniapps /var/www/bahmniapps-original
# Create a link to your UI 'app' folder
sudo ln -s /$bind_mount_dest/openmrs-module-bahmniapps/ui/app /var/www/bahmniapps
# Make the user bahmni owner of this new link
sudo chown -h bahmni:bahmni /var/www/bahmniapps
#############################################
#Linking Implementation Configuration Folder#
#############################################
# backup the original config folder
sudo mv -b /var/www/bahmni_config /var/www/bahmni_config-original
# Link your config folder (here we are linking the default-config folder)
sudo ln -s /$bind_mount_dest/bahmni_config /var/www/bahmni_config
# Make bahmni user the owner for this new link
sudo chown -h bahmni:bahmni /var/www/bahmni_config