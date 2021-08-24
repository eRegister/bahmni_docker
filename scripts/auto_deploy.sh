#!/bin/bash

 sudo systemctl restart gitpull_bahmniconfig.service
 sudo systemctl restart gitpull_bahmniapps.service
 sudo systemctl restart gitpull_bahmnicore.service
 sudo systemctl restart gitpull_registrationcore.service
 sudo systemctl restart gitpull_xdssender.service
 
 sudo systemctl restart gitpull_appointments.service
 sudo systemctl restart gitpull_mappings.service
 sudo systemctl restart gitpull_serializedobject.service
 sudo systemctl restart gitpull_concepts.service
 sudo systemctl restart gitpull_outgoingmessage.service
 sudo systemctl restart modules.service
 
 sudo bash /usr/local/bin/serialized_object.sh
 sudo bash /usr/local/bin/concepts_restore.sh