#!/bin/bash
docker exec -i openmrseregister /usr/bin/mysql -u root --password=P@ssw0rd openmrs < /development_emr/openmrs_reporting_release/Serialized_Object.sql

