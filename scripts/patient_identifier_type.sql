-- MySQL dump 10.13  Distrib 5.6.40, for Linux (x86_64)
--
-- Host: localhost    Database: openmrs
-- ------------------------------------------------------
-- Server version	5.6.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `patient_identifier_type`
--

DROP TABLE IF EXISTS `patient_identifier_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_identifier_type` (
  `patient_identifier_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` text,
  `format` varchar(255) DEFAULT NULL,
  `check_digit` tinyint(1) NOT NULL DEFAULT '0',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `format_description` varchar(255) DEFAULT NULL,
  `validator` varchar(200) DEFAULT NULL,
  `location_behavior` varchar(50) DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `uniqueness_behavior` varchar(50) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`patient_identifier_type_id`),
  UNIQUE KEY `patient_identifier_type_uuid_index` (`uuid`),
  KEY `patient_identifier_type_retired_status` (`retired`),
  KEY `type_creator` (`creator`),
  KEY `user_who_retired_patient_identifier_type` (`retired_by`),
  KEY `patient_identifier_type_changed_by` (`changed_by`),
  CONSTRAINT `patient_identifier_type_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `type_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_patient_identifier_type` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_identifier_type`
--

LOCK TABLES `patient_identifier_type` WRITE;
/*!40000 ALTER TABLE `patient_identifier_type` DISABLE KEYS */;
INSERT INTO `patient_identifier_type` VALUES (1,'OpenMRS Identification Number','Unique number used in OpenMRS','',1,1,'2005-09-22 00:00:00',0,NULL,'org.openmrs.patient.impl.LuhnIdentifierValidator',NULL,0,NULL,NULL,NULL,'8d793bee-c2cc-11de-8d13-0010c6dffd0f',NULL,NULL,NULL),(2,'Old Identification Number','Number given out prior to the OpenMRS system (No check digit)','',0,1,'2005-09-22 00:00:00',0,NULL,NULL,NULL,0,NULL,NULL,NULL,'8d79403a-c2cc-11de-8d13-0010c6dffd0f',NULL,NULL,NULL),(3,'Patient Identifier','New patient identifier type created for use by the Bahmni Registration System',NULL,0,1,'2014-09-18 00:00:00',1,NULL,NULL,'NOT_USED',0,NULL,NULL,NULL,'81433852-3f10-11e4-adec-0800271c1b75',NULL,NULL,NULL),(4,'National ID','National ID','[0-9]{12,12}',0,4,'2016-11-10 12:03:26',0,'Should contain a 12 digit number',NULL,'NOT_USED',0,NULL,NULL,NULL,'0d2ac572-8de3-46c8-9976-1f78899c599f',NULL,'2018-04-14 20:59:24',4),(5,'HIV Program ID','Unique patient identifier for clients that are currently on ART','[A-Z]{1}[0-9]{2,2}[0-9]{4,8}\\/[0-9]{2,2}-[0-9]{2,2}',0,1,'2018-03-30 04:59:27',0,'Should a contain a unique number with a min. of 4 and max 8 digits and should be suffixed with /mm-yy representing the clients cohort i.e. /02-14',NULL,'NOT_USED',0,NULL,NULL,NULL,'5c1e8ae2-33c6-11e8-8236-0242ac110002',NULL,'2020-01-16 10:09:29',4),(6,'Biometric Fingerprint ID','Identifier type to be used for capturing patients\' fingerprint as an additional identifier',NULL,0,1,'2018-03-30 05:04:53',0,NULL,NULL,'NOT_USED',0,NULL,NULL,NULL,'1e494229-33c7-11e8-8236-0242ac110002',NULL,'2018-03-30 11:58:15',4),(7,'TB Program ID','Identifier type used for patient started on TB treatment','[A-Z]{1}[0-9]{4,4}[0-9]{4,6}\\/[0-9]{2,2}',0,1,'2018-03-30 05:05:44',0,'Prefix with facility code B1011 followed by a 4 digit number and suffixed by /yy where yy is the year',NULL,'NOT_USED',0,NULL,NULL,NULL,'3cdb2f37-33c7-11e8-8236-0242ac110002',NULL,'2018-05-22 15:48:48',4),(8,'ANC Program ID','Identifier type used for patients enrolled into the ANC program',NULL,0,1,'2018-03-30 05:27:59',0,NULL,NULL,'NOT_USED',0,NULL,NULL,NULL,'588f45f8-33ca-11e8-8236-0242ac110002',NULL,'2018-03-30 11:58:27',4),(9,'ECID','Specifies UUID of the identifier type that is used as the Global Identifier Domain (GID) in the MPI.                   It is generated by the MPI and is persisted in OpenMRS.',NULL,0,2,'2018-06-28 00:00:00',0,NULL,NULL,'NOT_USED',0,NULL,NULL,NULL,'a5d38e09-efcb-4d91-a526-50ce1ba5011a',NULL,'2020-01-16 10:14:06',4),(10,'PNC Program ID','Unique identifier for PNC clients',NULL,0,4,'2020-01-16 10:17:27',0,NULL,NULL,'NOT_USED',0,NULL,NULL,NULL,'07f2dc6b-ac44-410d-918d-7d7d685dcabc',NULL,NULL,NULL),(11,'File Number','Other numbers used to uniquely identify a patient',NULL,0,4,'2020-01-16 10:18:59',0,NULL,NULL,'NOT_USED',0,NULL,NULL,NULL,'d2084c23-edae-4b0f-98a2-cbcdb6708294',NULL,NULL,NULL);
/*!40000 ALTER TABLE `patient_identifier_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-20  6:43:59
