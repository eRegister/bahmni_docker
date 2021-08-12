#!/bin/bash
docker exec -i openmrseregister /usr/bin/mysql -u root --password=P@ssw0rd openmrs < /development/openmrs_reporting_release/Serialized_Object.sql

