#####################
# Configurations
#####################
# backup the original config folder
sudo mv -b /var/www/bahmni_config /var/www/bahmni_config-original
# Link your config folder
sudo ln -s /development/bahmni_config /var/www/bahmni_config
# Make bahmni user the owner for this new link
sudo chown -h bahmni:bahmni /var/www/bahmni_config 

#####################
# Reports
#####################
# backup the original reports folder
#sudo mv -b /opt/bahmni-reports /opt/bahmni-reports-original
# Link your reports folder
#sudo ln -s /development/bahmni-reports /opt/bahmni-reports
# Make bahmni user the owner for this new link
#sudo chown -h bahmni:bahmni /opt/bahmni-reports 


#####################
# Development
#####################
# Rename the original folder for backup
sudo mv /var/www/bahmniapps /var/www/bahmniapps-original
# Linking EMR UI folders
sudo ln -s /development/openmrs-module-bahmniapps/ui/app /var/www/bahmniapps
# Make the user bahmni owner of this new link
sudo chown -h bahmni:bahmni /var/www/bahmniapps