#!/bin/bash
# Proper header for a Bash script.

 sudo cp gitpullbahmniconfig.service /etc/systemd/system/
 sudo cp gitpull_bahmniconfig.sh /development_emr/bahmni_config092/
 sudo chmod  +x /development_emr/bahmni_config092/gitpull_bahmniconfig.sh
 sudo chmod 664 /etc/systemd/system/gitpullbahmniconfig.service
 
 sudo cp gitpull_bahmniapps.service /etc/systemd/system/
 sudo cp gitpull_bahmniapps.sh /development_emr/bahmniapps_release/
 sudo chmod  +x /development_emr/bahmniapps_release/gitpull_bahmniapps.sh
 sudo chmod 664 /etc/systemd/system/gitpull_bahmniapps.service
 
 sudo cp gitpullbahmnicore.service /etc/systemd/system/
 sudo cp gitpull_bahmnicore.sh /development_emr/openmrs-module-bahmnicore-release/
 sudo chmod  +x /development_emr/openmrs-module-bahmnicore-release/gitpull_bahmnicore.sh
 sudo chmod 664 /etc/systemd/system/
 
 sudo cp gitpullregistrationcore.service /etc/systemd/system/
 sudo cp gitpull_registrationcore.sh /development_emr/openmrs-module-registrationcore-release/
 sudo chmod  +x /development_emr/openmrs-module-registrationcore-release/gitpull_registrationcore.sh
 sudo chmod 664 /etc/systemd/system/gitpullregistrationcore.service
 
 sudo cp gitpullxdssender.service /etc/systemd/system/
 sudo cp gitpull_xdssender.sh /development_emr/openmrs-module-xdssender-release/
 sudo chmod  +x /development_emr/openmrs-module-xdssender-release/gitpull_xdssender.sh
 sudo chmod 664 /etc/systemd/system/gitpullxdssender.service
 
 sudo cp modules.service /etc/systemd/system/
 sudo cp modules.sh /usr/local/bin
 sudo chmod  +x /usr/local/bin/modules.sh
 sudo chmod 664 /etc/systemd/system/modules.service
 
 sudo systemctl daemon-reload
 sudo systemctl enable gitpullbahmniconfig.service
 sudo systemctl enable gitpull_bahmniapps.service
 sudo systemctl enable gitpullbahmnicore.service
 sudo systemctl enable gitpullregistrationcore.service
 sudo systemctl enable gitpullxdssender.service
 sudo systemctl enable modules.service

 sudo systemctl start gitpullbahmniconfig.service
 sudo systemctl start gitpull_bahmniapps.service
 sudo systemctl start gitpullbahmnicore.service
 sudo systemctl start gitpullregistrationcore.service
 sudo systemctl start gitpullxdssender.service
 #sudo systemctl start modules.service


