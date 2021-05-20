#!/bin/bash
docker exec -i openmrseregister /usr/bin/mysql -u root --password=password openmrs < /development/openmrs_reporting_release/Serialized_Object.sql

