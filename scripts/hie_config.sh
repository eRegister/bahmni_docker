#! /bin/bash

echo "Enter facility code:"
facility_code=""

while [[ $facility_code = "" ]]; do
   read facility_code
done

lowecase_facility_code=$(echo $facility_code | tr [:upper:] [:lower:])
first_letter=$(echo ${lowecase_facility_code:0:1} | tr [:lower:] [:upper:])

docker exec bahmni_docker_emr-service_1 sed -i "s/module.allow_web_admin=false/module.allow_web_admin=true/g" /etc/openmrs/openmrs-runtime.properties
username_config=$(docker exec bahmni_docker_emr-service_1 bash -c "cat  /etc/openmrs/openmrs-runtime.properties | grep registrationcore.mpi.username")

if [[ $username_config = "" ]]
then
docker exec bahmni_docker_emr-service_1 bash -c "echo 'registrationcore.mpi.username=pixclient_$lowecase_facility_code' >> /etc/openmrs/openmrs-runtime.properties"
fi

password_config=$(docker exec bahmni_docker_emr-service_1 bash -c "cat  /etc/openmrs/openmrs-runtime.properties | grep registrationcore.mpi.password")

if [[ $password_config = "" ]]
then
docker exec bahmni_docker_emr-service_1 bash -c "echo 'registrationcore.mpi.password=pixpdq${first_letter}@2019#Cli3nt' >> /etc/openmrs/openmrs-runtime.properties"
fi

docker exec bahmni_docker_emr-service_1 systemctl restart openmrs.service

