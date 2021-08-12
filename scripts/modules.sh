#!/bin/bash

docker cp /development_emr/openmrs-module-appointments-release/appointments-1.0-SNAPSHOT.omod bahmni_docker_emr-service_1:/opt/openmrs/modules
docker cp /development_emr/openmrs-module-bahmnicore-release/bahmnicore-omod-0.92-SNAPSHOT.omod bahmni_docker_emr-service_1:/opt/openmrs/modules
docker cp /development_emr/openmrs-module-registrationcore-release/registrationcore-1.9.0-SNAPSHOT.omod bahmni_docker_emr-service_1:/opt/openmrs/modules
docker cp /development_emr/openmrs-module-xdssender-release/xds-sender-1.0.2.omod bahmni_docker_emr-service_1:/opt/openmrs/modules
