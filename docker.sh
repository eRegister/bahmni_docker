#!/usr/bin/env bash
export container_name=bahmni_container_v90
export https_port=443
export http_port=80
export erp_port=8069
export debug_port=8000
docker build --rm -t bahmni/bahmni_image0718 --build-arg container_name=${container_name} .
docker run -e container_name=${container_name} -it -d -p ${https_port}:443 -p ${http_port}:80 -p ${erp_port}:8069 -p ${debug_port}:8000 --privileged --name $container_name -v /Users/mac/Documents/Spane/dev:/development -v $container_name:/volume bahmni/bahmni_image0718 /bin/bash