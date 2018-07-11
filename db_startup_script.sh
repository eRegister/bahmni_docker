#!/bin/bash
set -e
container_name=$container_name
if [ -f /etc/my.cnf ]; then
    sudo mkdir -p /volume/mysql && sudo chown -R mysql:mysql /volume/mysql
    sudo sed -i "s|datadir=/var/lib/mysql|datadir=/volume/mysql|g" /etc/my.cnf
    sudo service mysqld restart
else
   echo "File /etc/my.cnf does not exist."
fi

if [ -n "$(ls -A /volume/mysql)" ]; then
    echo "Directory exists and Already mysql sync completed"
else
    sudo rsync -avr -o -g /var/lib/mysql /volume
    sudo service mysqld restart
fi

if [ -d /home/bahmni ]; then
   sudo bahmni -ilocal stop
   sudo rsync -avr -o -g /home/bahmni /volume
   sudo rm -rf /home/bahmni
   ln -s /volume/bahmni /home/bahmni && chown -h bahmni:bahmni /home/bahmni
   sudo bahmni -ilocal start
else
   echo "Directory /home/bahmni does not exists."
fi
