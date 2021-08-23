#!/usr/bin/env bash
export container_name=openmrseregister
# update bind_mount_src
export bind_mount_src=Users/mac/Documents/Spane/eregisterDev/host
export bind_mount_dest=development
export https_port=443
export http_port=86
export erp_port=8069
export debug_port=8000
export image_name=omrsregrepo/bahmni_docker_092:17112020

if sudo docker ps | grep ${container_name}; then
   sudo docker stop "${container_name}" | sudo xargs docker rm
else
  echo "Container not exists"
fi

if sudo docker ps | grep ${container_name}; then
   sudo docker ps -a | grep Exit | cut -d ' ' -f 1 | xargs sudo docker rm
else
  echo "Exit container not present"
fi

if sudo docker images | grep ${image_name}; then
   sudo docker rmi $(sudo docker images | grep ${images_name} | tr -s ' ' | cut -d ' ' -f 3)
else
  echo "Image doesn't exists"
fi

if ! sudo docker volume ls -q --filter name="${container_name}"| grep -q "${container_name}" ; then
        sudo docker volume create --name ${container_name}
else
        echo "Volume ${container_name} exists"
fi
docker build --rm -t $image_name --no-cache --build-arg container_name=${container_name} --build-arg bind_mount_dest=${bind_mount_dest} .
docker run -e container_name=${container_name} -e bind_mount_dest=${bind_mount_dest} -it -d -p ${https_port}:443 -p ${http_port}:80 -p ${erp_port}:8069 -p ${debug_port}:8000 --privileged --name $container_name -v /$bind_mount_src:/$bind_mount_dest -v /sys/fs/cgroup:/sys/fs/cgroup:ro -v $container_name:/$container_name $image_name  /usr/sbin/init /bin/bash
