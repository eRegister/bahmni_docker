#!/bin/bash

docker exec -i openmrseregister /usr/bin/mysql -u root --password=password openmrs < /development/eregister_concepts_release/omrs_concept_dictionary.sql 
