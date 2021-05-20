#!/bin/sh
facility="TestingHiels"
now="$(date +'%d_%m_%Y_%H_%M_%S')"
filename="odoo_db_backup_$now".gz
backupfolder="$HOME/databaseBackups"
fullpathbackupfile="$backupfolder/$filename"
logfile="$backupfolder/"backup_log_"$(date +'%Y_%m')".txt
echo "pg_dump started at $(date +'%d-%m-%Y %H:%M:%S')" >> "$logfile"
pg_dump -U odoo odoo | gzip > "$fullpathbackupfile"
echo "pg_dump finished at $(date +'%d-%m-%Y %H:%M:%S')" >> "$logfile"
chown postgres "$fullpathbackupfile"
chown postgres "$logfile"
echo "file permission changed" >> "$logfile"
find "$backupfolder" -name dhis_db_backup_228_* -mtime +10 -exec rm {} \;
echo "old files deleted" >> "$logfile"
echo "operation finished at $(date +'%d-%m-%Y %H:%M:%S')" >> "$logfile"
echo "*****************" >> "$logfile"
exit 0
