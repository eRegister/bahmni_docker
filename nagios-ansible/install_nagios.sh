#! /bin/bash

cat << Message1
*********************************INSTALLING ANSIBLE**********************************
Message1

apt update
apt install software-properties-common
add-apt-repository --yes --update ppa:ansible/ansible
apt install ansible

cat << Message2
************************************EDITING FILES************************************
Message2

echo "Enter server name below:"
facility_name=""
while [[ $facility_name = "" ]]; do
   read facility_name
done

echo "Enter District name:"
district_name=""
while [[ $district_name = "" ]]; do
   read district_name
done

lowerCase_dist_name=$(echo $district_name | tr [:upper:] [:lower:])

echo "Information taken successfully.Now Adjusting files..."

sed -i "s/berea/${lowerCase_dist_name}/g" ../nagios-ansible/slack.cfg

sed -i "s/localhost/${facility_name}/g" ../nagios-ansible/localhost.cfg

echo "Files udjusted accordingly"

cat << Message3
************************************INSTALLING NAGIOS********************************
Message3

ansible-playbook ../nagios-ansible/main.yml --ask-become-pass
