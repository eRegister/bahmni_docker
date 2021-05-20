#!/bin/sh
facility="TestingHiels"
today="$(date +'%d%m%Y')"
now="$(date +'%d_%m_%Y_%H_%M_%S')"
filename="odoo_db_backup_$now".gz
backupfolder="$HOME/databaseBackups"
[ ! -d $backupfolder ] && mkdir -p $backupfolder
fullpathbackupfile="$backupfolder/$filename"
logfile="$backupfolder/"backup_log_"$(date +'%Y_%m')".txt
echo "pg_dump started at $(date +'%d-%m-%Y %H:%M:%S')" >> "$logfile"
docker exec -it bahmni_docker_erp-service_1 pg_dump -U odoo odoo | gzip > "$fullpathbackupfile"
echo "creating today's container snapshot" >> "$logfile"
docker commit bahmni_docker_erp-service_1 omrsregrepo/bahmni_092_erp:$today
echo "done creating image >> "$logfile"
echo "operation finished at $(date +'%d-%m-%Y %H:%M:%S') >> "$logfile"
echo "*****************" >> "$logfile"
exit 0