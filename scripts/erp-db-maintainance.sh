#!/bin/bash

user=odoo;
db=odoo;

docker exec -i bahmni_docker_erp-service_1 psql -h localhost -p 5432 -d $db -c "delete from markers" $user
