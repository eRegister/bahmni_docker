#!/bin/bash
docker exec -i bahmni_docker_emr-service_1 /usr/bin/mysql -u root --password=P@ssw0rd openmrs < /development_emr/openmrs_reporting_release/Serialized_Object.sql

