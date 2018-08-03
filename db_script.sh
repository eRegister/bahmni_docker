#!/bin/bash
set -e
container_name=$container_name
if [ -f /etc/my.cnf ]; then
    sudo mkdir -p /${container_name}/mysql && sudo chown -R mysql:mysql /${container_name}/mysql
    sudo sed -i "s|datadir=/var/lib/mysql|datadir=/${container_name}/mysql|g" /etc/my.cnf
    sudo service mysqld restart
else
   echo "File /etc/my.cnf does not exist."
fi

if [ -n "$(ls -A /${container_name}/mysql)" ]; then
    echo "Directory exists and Already mysql sync completed"
else
    sudo rsync -avr -o -g /var/lib/mysql /${container_name}
    sudo service mysqld restart
fi