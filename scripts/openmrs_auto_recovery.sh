#!/bin/bash


MYSQL_CONTAINER="bahmni_docker_emr-service_1"        
OPENMRS_CONTAINER="bahmni_docker_emr-service_1"    
MYSQL_USER="root"                     
MYSQL_PASSWORD="P@ssw0rd"                
MYSQL_DB="openmrs"                       


CRITICAL_MODULES=(
  "event.started"
  "htmlwidgets.started"
  "legacyui.started"
  "rulesengine.started"
  "serialization.xstream.started"
  "webservices.rest.started"
  "addresshierarchy.started"
)


RESTART_NEEDED=false


enable_modules() {
  for module in "${CRITICAL_MODULES[@]}"; do
    STATUS=$(docker exec "$MYSQL_CONTAINER" mysql -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" -D "$MYSQL_DB" -se "SELECT property_value FROM global_property WHERE property='$module';")
    
    if [ "$STATUS" = "false" ]; then
      echo "Enabling $module..."
      docker exec "$MYSQL_CONTAINER" mysql -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" -D "$MYSQL_DB" -e "UPDATE global_property SET property_value='true' WHERE property='$module';"
      RESTART_NEEDED=true
    fi
  done
}


restart_openmrs() {
  if [ "$RESTART_NEEDED" = true ]; then
    echo "Restarting OpenMRS container..."
  docker restart "$OPENMRS_CONTAINER"

   else
     echo "No modules needed to be re-enabled. Skipping OpenMRS restart." 
  fi   
}


enable_modules
restart_openmrs

echo "Module recovery process completed."
