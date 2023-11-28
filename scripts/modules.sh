#!/bin/bash

docker cp /development_emr/openmrs-module-appointments-release/appointments-1.1-SNAPSHOT.omod bahmni_docker_emr-service_1:/opt/openmrs/modules
docker cp /development_emr/openmrs-module-bahmnicore-release/bahmnicore-omod-0.92-SNAPSHOT.omod bahmni_docker_emr-service_1:/opt/openmrs/modules
docker cp /development_emr/openmrs-module-registrationcore-release/registrationcore-1.9.0-SNAPSHOT.omod bahmni_docker_emr-service_1:/opt/openmrs/modules
docker cp /development_emr/openmrs-module-xdssender-release/xds-sender-1.0.2.omod bahmni_docker_emr-service_1:/opt/openmrs/modules
docker cp /development_emr/openmrs-module-outgoingmessageexception-release/outgoing-message-exceptions-1.0.0.omod bahmni_docker_emr-service_1:/opt/openmrs/modules
docker cp /development_emr/openmrs-module-dhisconnector-release/dhisconnector-1.5.5-SNAPSHOT.omod bahmni_docker_emr-service_1:/opt/openmrs/modules
docker cp /development_emr/openmrs-module-labonfhir-release/labonfhir-1.3.1-SNAPSHOT.omod bahmni_docker_emr-service_1:/opt/openmrs/modules
docker cp /development_emr/openmrs-module-fhir2-release/fhir2-1.9.0-SNAPSHOT.omod bahmni_docker_emr-service_1:/opt/openmrs/modules
docker cp /development_emr/openmrs-module-fhir2-release/fhir2-1.9.0-SNAPSHOT.omod bahmni_docker_emr-service_1:/opt/openmrs/modules
docker cp /development_emr/openmrs-module-labonfhir-release/labonfhir-1.3.1-SNAPSHOT.omod bahmni_docker_emr-service_1:/opt/openmrs/modules
