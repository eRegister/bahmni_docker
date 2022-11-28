#!/bin/bash

docker exec -i bahmni_docker_emr-service_1 /usr/bin/mysqldump -u root --password=P@ssw0rd openmrs > /home/openmrs/backups/Backup_$(date +%d_%m_%Y).sql

sudo tar -czvf /home/openmrs/backups/Backup_"$(date +"%d_%m_%Y")".tar.gz -P /home/openmrs/backups/Backup_"$(date +"%d_%m_%Y")".sql

sudo /usr/bin/rclone copy /home/openmrs/backups/Backup_"$(date +"%d_%m_%Y")".tar.gz onedrive:"North eRegister Backups"/"Berea Backups"/"Pilot HC"/"$(date +"%Y")"/"$(date +"%B")"

