#!/bin/bash
user=root
password=mypassword
db=openmrs
container=bahmni_docker_emr-service_1
concept_backup=omrs_concept_dictionary.sql

# pull the latest file
git fetch --all
git pull origin master

# restore it into MySQL

docker exec -it $container mysql -u$user -p$password < $concept_backup