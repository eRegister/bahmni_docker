
INSERT INTO `global_property` VALUES ('emrapi.sqlSearch.cervicalcancerscreening','select distinct\r\n          concat(pn.given_name,\' \', ifnull(pn.family_name,\'\')) as name,\r\n          pi.identifier as identifier,\r\n          concat(\"\",p.uuid) as uuid,\r\n          concat(\"\",v.uuid) as activeVisitUuid,\r\n          IF(va.value_reference = \"Admitted\", \"true\", \"false\") as hasBeenAdmitted\r\n        from visit v\r\n        join person_name pn on v.patient_id = pn.person_id and pn.voided = 0\r\n        join patient_identifier pi on v.patient_id = pi.patient_id\r\n        join patient_identifier_type pit on pi.identifier_type = pit.patient_identifier_type_id\r\n        join global_property gp on gp.property=\"bahmni.primaryIdentifierType\" and gp.property_value=pit.uuid\r\n        join person p on p.person_id = v.patient_id\r\n		join encounter en on en.visit_id = v.visit_id and en.voided=0\r\n        join location l on l.uuid = ${visit_location_uuid} and v.location_id = l.location_id\r\n        left outer join visit_attribute va on va.visit_id = v.visit_id and va.attribute_type_id = (\r\n          select visit_attribute_type_id from visit_attribute_type where name=\"Admission Status\"\r\n        ) and va.voided = 0\r\nwhere\r\nv.date_stopped is null and\r\nv.visit_type_id=21\r\norder by en.encounter_datetime asc',NULL,'358a9c16-0998-4c26-a686-f7722cfb1c65',NULL,NULL,NULL,NULL,NULL,NULL),('emrapi.sqlSearch.eac','select distinct\r\n          concat(pn.given_name,\' \', ifnull(pn.family_name,\'\')) as name,\r\n          pi.identifier as identifier,\r\n          concat(\"\",p.uuid) as uuid,\r\n          concat(\"\",v.uuid) as activeVisitUuid,\r\n          IF(va.value_reference = \"Admitted\", \"true\", \"false\") as hasBeenAdmitted\r\n        from visit v\r\n        join person_name pn on v.patient_id = pn.person_id and pn.voided = 0\r\n        join patient_identifier pi on v.patient_id = pi.patient_id\r\n        join patient_identifier_type pit on pi.identifier_type = pit.patient_identifier_type_id\r\n        join global_property gp on gp.property=\"bahmni.primaryIdentifierType\" and gp.property_value=pit.uuid\r\n        join person p on p.person_id = v.patient_id\r\n		join encounter en on en.visit_id = v.visit_id and en.voided=0\r\n        join location l on l.uuid = ${visit_location_uuid} and v.location_id = l.location_id\r\n        left outer join visit_attribute va on va.visit_id = v.visit_id and va.attribute_type_id = (\r\n          select visit_attribute_type_id from visit_attribute_type where name=\"Admission Status\"\r\n        ) and va.voided = 0\r\nwhere\r\nv.date_stopped is null and\r\nv.visit_type_id=23\r\norder by en.encounter_datetime asc',NULL,'53aee2f7-8bf9-461c-8589-bcdaa2cf95ff',NULL,NULL,NULL,NULL,NULL,NULL),('emrapi.sqlSearch.familyplanning','select distinct\r\n          concat(pn.given_name,\' \', ifnull(pn.family_name,\'\')) as name,\r\n          pi.identifier as identifier,\r\n          concat(\"\",p.uuid) as uuid,\r\n          concat(\"\",v.uuid) as activeVisitUuid,\r\n          IF(va.value_reference = \"Admitted\", \"true\", \"false\") as hasBeenAdmitted\r\n        from visit v\r\n        join person_name pn on v.patient_id = pn.person_id and pn.voided = 0\r\n        join patient_identifier pi on v.patient_id = pi.patient_id\r\n        join patient_identifier_type pit on pi.identifier_type = pit.patient_identifier_type_id\r\n        join global_property gp on gp.property=\"bahmni.primaryIdentifierType\" and gp.property_value=pit.uuid\r\n        join person p on p.person_id = v.patient_id\r\n		join encounter en on en.visit_id = v.visit_id and en.voided=0\r\n        join location l on l.uuid = ${visit_location_uuid} and v.location_id = l.location_id\r\n        left outer join visit_attribute va on va.visit_id = v.visit_id and va.attribute_type_id = (\r\n          select visit_attribute_type_id from visit_attribute_type where name=\"Admission Status\"\r\n        ) and va.voided = 0\r\nwhere\r\nv.date_stopped is null and\r\nv.visit_type_id=22\r\norder by en.encounter_datetime asc',NULL,'8526037e-1adc-4881-bb07-ecf94b95c1b5',NULL,NULL,NULL,NULL,NULL,NULL),('emrapi.sqlSearch.Under5','select distinct\r\n          concat(pn.given_name,\' \', ifnull(pn.family_name,\'\')) as name,\r\n          pi.identifier as identifier,\r\n          concat(\"\",p.uuid) as uuid,\r\n          concat(\"\",v.uuid) as activeVisitUuid,\r\n          IF(va.value_reference = \"Admitted\", \"true\", \"false\") as hasBeenAdmitted\r\n        from visit v\r\n        join person_name pn on v.patient_id = pn.person_id and pn.voided = 0\r\n        join patient_identifier pi on v.patient_id = pi.patient_id\r\n        join patient_identifier_type pit on pi.identifier_type = pit.patient_identifier_type_id\r\n        join global_property gp on gp.property=\"bahmni.primaryIdentifierType\" and gp.property_value=pit.uuid\r\n        join person p on p.person_id = v.patient_id\r\n		join encounter en on en.visit_id = v.visit_id and en.voided=0\r\n        join location l on l.uuid = ${visit_location_uuid} and v.location_id = l.location_id\r\n        left outer join visit_attribute va on va.visit_id = v.visit_id and va.attribute_type_id = (\r\n          select visit_attribute_type_id from visit_attribute_type where name=\"Admission Status\"\r\n        ) and va.voided = 0\r\nwhere\r\nv.date_stopped is null and\r\nv.visit_type_id=20\r\norder by en.encounter_datetime asc',NULL,'ed3814db-02a6-4d20-8d3c-7c83dc7495fd',NULL,NULL,NULL,NULL,NULL,NULL);
