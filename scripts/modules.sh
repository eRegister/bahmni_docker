#!/bin/bash

docker cp /development_emr/openmrs-module-appointments-release/appointments-1.1-SNAPSHOT.omod bahmni_docker_emr-service_1:/opt/openmrs/modules
docker cp /development_emr/openmrs-module-bahmnicore-release/bahmnicore-omod-0.92-SNAPSHOT.omod bahmni_docker_emr-service_1:/opt/openmrs/modules
docker cp /development_emr/openmrs-module-registrationcore-release/registrationcore-1.9.0-SNAPSHOT.omod bahmni_docker_emr-service_1:/opt/openmrs/modules
docker cp /development_emr/openmrs-module-xdssender-release/xds-sender-1.0.2.omod bahmni_docker_emr-service_1:/opt/openmrs/modules

docker exec -it bahmni_docker_emr-service_1 chmod +x /opt/openmrs/modules/appointments-1.1-SNAPSHOT.omod
docker exec -it bahmni_docker_emr-service_1 chmod +x /opt/openmrs/modules/bahmnicore-omod-0.92-SNAPSHOT.omod
docker exec -it bahmni_docker_emr-service_1 chmod +x /opt/openmrs/modules/registrationcore-1.9.0-SNAPSHOT.omod
docker exec -it bahmni_docker_emr-service_1 chmod +x /opt/openmrs/modules/xds-sender-1.0.2.omod


