#!/bin/bash

# Removing old sym links
sudo rm bahmni_config
sudo rm obscalculator
sudo rm encounterModifier
sudo rm elisFeedInterceptor
sudo rm ordertemplates
sudo rm patientMatchingAlgorithm

# Creating new sysm link from bahmni config release

sudo ln -s /development/bahmni_config_release/ /opt/openmrs/bahmni_config

sudo ln -s /development/bahmni_config_release/openmrs/obscalculator/ /opt/openmrs/obscalculator

sudo ln -s /development/bahmni_config_release/openmrs/encounterModifier/ /opt/openmrs/encounterModifier

sudo ln -s /development/bahmni_config_release/openmrs/elisFeedInterceptor/ /opt/openmrs/elisFeedInterceptor
sudo ln -s /development/bahmni_config_release/openmrs/ordertemplates/ /opt/openmrs/ordertemplates
sudo ln -s /development/bahmni_config_release/openmrs/patientMatchingAlgorithm/ /opt/openmrs/patientMatchingAlgorithm
