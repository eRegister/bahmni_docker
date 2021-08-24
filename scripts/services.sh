#!/bin/bash
# Proper header for a Bash script.
 
 #Initialize git in all the persistant docker volumes and link the local repo with remote repo
 
 cd /development_emr/bahmni_config092/
 sudo git init
 sudo git remote add origin https://github.com/eRegister/bahmni_config092.git

 cd /development_emr/openmrs-module-bahmnicore-release/
 sudo git init
 sudo git remote add origin https://github.com/eRegister/openmrs-module-bahmnicore-release.git
 
 cd /development_emr/openmrs-module-registrationcore-release/
 sudo git init
 sudo git remote add origin https://github.com/eRegister/openmrs-module-registrationcore-release.git
 
 cd /development_emr/openmrs-module-xdssender-release/
 sudo git init
 sudo git remote add origin https://github.com/eRegister/openmrs-module-xdssender-release.git
 
 cd /development_emr/bahmniapps_release/
 sudo git init
 sudo git remote add origin https://github.com/eRegister/bahmniapps_release.git
 
 cd /development_emr/openmrs-module-appointments-release/
 git git init
 sudo git remote add origin https://github.com/eRegister/openmrs-module-appointments-release.git
 
 cd /development_emr/dhisconnector_mappings/
 sudo git init
 sudo git remote add origin https://github.com/eRegister/dhisconnector_mappings.git 
 
 cd /development_emr/openmrs_reporting_release/
 sudo git init
 sudo git remote add origin https://github.com/eRegister/openmrs_reporting_release.git
 
 cd /development_emr/eregister_concepts_release/
 sudo git init
 sudo git remote add origin https://github.com/eRegister/eregister_concepts_release.git
 
 sudo mkdir /development_emr/openmrs-module-outgoingmessageexception-release/
 cd /development_emr/openmrs-module-outgoingmessageexception-release/
 sudo git init
 sudo git remote add origin https://github.com/eRegister/openmrs-module-outgoingmessageexceptions-release.git
 
#Pull from the remote eRegister repo's and creates services for automated deployement 

 sudo cp gitpull_bahmniconfig.service /etc/systemd/system/
 sudo cp gitpull_bahmniconfig.sh /development_emr/bahmni_config092/
 sudo chmod  +x /development_emr/bahmni_config092/gitpull_bahmniconfig.sh
 sudo chmod 664 /etc/systemd/system/gitpull_bahmniconfig.service
 
 sudo cp gitpull_bahmniapps.service /etc/systemd/system/
 sudo cp gitpull_bahmniapps.sh /development_emr/bahmniapps_release/
 sudo chmod  +x /development_emr/bahmniapps_release/gitpull_bahmniapps.sh
 sudo chmod 664 /etc/systemd/system/gitpull_bahmniapps.service
 
 sudo cp gitpull_bahmnicore.service /etc/systemd/system/
 sudo cp gitpull_bahmnicore.sh /development_emr/openmrs-module-bahmnicore-release/
 sudo chmod  +x /development_emr/openmrs-module-bahmnicore-release/gitpull_bahmnicore.sh
 sudo chmod 664 /etc/systemd/system/gitpull_bahmnicore.service
 
 sudo cp gitpull_registrationcore.service /etc/systemd/system/
 sudo cp gitpull_registrationcore.sh /development_emr/openmrs-module-registrationcore-release/
 sudo chmod  +x /development_emr/openmrs-module-registrationcore-release/gitpull_registrationcore.sh
 sudo chmod 664 /etc/systemd/system/gitpull_registrationcore.service
 
 sudo cp gitpull_xdssender.service /etc/systemd/system/
 sudo cp gitpull_xdssender.sh /development_emr/openmrs-module-xdssender-release/
 sudo chmod  +x /development_emr/openmrs-module-xdssender-release/gitpull_xdssender.sh
 sudo chmod 664 /etc/systemd/system/gitpull_xdssender.service
 
 sudo cp gitpull_appointments.service /etc/systemd/system/
 sudo cp gitpull_appointments.sh /development_emr/openmrs-module-appointments-release/
 sudo chmod  +x /development_emr/openmrs-module-appointments-release/gitpull_appointments.sh
 sudo chmod 664 /etc/systemd/system/gitpull_appointments.service
 
 sudo cp gitpull_mappings.service /etc/systemd/system/
 sudo cp gitpull_mappings.sh /development_emr/dhisconnector_mappings/
 sudo chmodod +x /development_emr/dhisconnector_mappings/gitpull_mappings.sh
 sudo chmod 664 /etc/systemd/system/gitpull_mappings.service
 
 sudo cp gitpull_serializedobject.service /etc/systemd/system/
 sudo cp gitpull_serializedobject.sh /development_emr/openmrs_reporting_release/
 sudo chmod +x /development_emr/openmrs_reporting_release/gitpull_serializedobject.sh
 sudo chmod 664 /etc/systemd/system/gitpull_serializedobject.service
 
 sudo cp gitpull_concepts.service /etc/systemd/system/
 sudo cp gitpull_concepts.sh /development_emr/eregister_concepts_release/
 sudo chmod +x /development_emr/eregister_concepts_release/gitpull_concepts.sh
 sudo chmod 664 /etc/systemd/system/gitpull_concepts.service
 
 sudo cp gitpull_outgoingmessage.service /etc/systemd/system/
 sudo cp gitpull_outgoingmessage.sh /development_emr/openmrs-module-outgoingmessageexception-release/
 sudo chmod +x /development_emr/openmrs-module-outgoingmessageexception-release/gitpull_outgoingmessage.sh
 sudo chmod 664 /etc/systemd/system/gitpull_outgoingmessage.service
 
 
 #Copy omod files to container OpenMRS operating modules (opt/OpenMRS/modules)
 
 sudo cp modules.service /etc/systemd/system/
 sudo cp modules.sh /usr/local/bin
 sudo chmod  +x /usr/local/bin/modules.sh
 sudo chmod 664 /etc/systemd/system/modules.service
 
 #Copy bacnkups scripts to  user binaries directory (/usr/local/bin)
 
 sudo cp serilizedobject.sh /usr/local/bin/
 sudo cp concepts_restore.sh /usr/local/bin/
 sudo chmod +x /usr/local/bin/serilizedobject.sh
 sudo chmod +x /usr/local/bin/concepts_restore.sh
 
 #Loading system daemon and enabling services
 
 sudo systemctl daemon-reload
 sudo systemctl enable gitpull_bahmniconfig.service
 sudo systemctl enable gitpull_bahmniapps.service
 sudo systemctl enable gitpull_bahmnicore.service
 sudo systemctl enable gitpull_registrationcore.service
 sudo systemctl enable gitpull_xdssender.service
 sudo systemctl enable modules.service
 sudo systemctl enable gitpull_appointments.service
 sudo systemctl enable gitpull_mappings.service
 sudo systemctl enable gitpull_serializedobject.service
 sudo systemctl enable gitpull_concepts.service
 sudo systemctl enable gitpull_outgoingmessage.service
 
 #Starting services

 sudo systemctl start gitpull_bahmniconfig.service
 sudo systemctl start gitpull_bahmniapps.service
 sudo systemctl start gitpull_bahmnicore.service
 sudo systemctl start gitpull_registrationcore.service
 sudo systemctl start gitpull_xdssender.service
 sudo systemctl start modules.service
 sudo systemctl start gitpull_appointments.service
 sudo systemctl start gitpull_mappings.service
 sudo systemctl start gitpull_serializedobject.service
 sudo systemctl start gitpull_concepts.service
 sudo systemctl start gitpull_outgoingmessage.service

 
 #All files from git should be available in all the persistant volumes



