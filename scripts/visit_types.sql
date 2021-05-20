-- MySQL dump 10.13  Distrib 5.6.40, for Linux (x86_64)
--
-- Host: localhost    Database: openmrs
-- ------------------------------------------------------
-- Server version	5.6.40-log

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
-- Table structure for table `visit_type`
--

DROP TABLE IF EXISTS `visit_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visit_type` (
  `visit_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`visit_type_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `visit_type_creator` (`creator`),
  KEY `visit_type_changed_by` (`changed_by`),
  KEY `visit_type_retired_by` (`retired_by`),
  CONSTRAINT `visit_type_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `visit_type_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `visit_type_retired_by` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visit_type`
--

LOCK TABLES `visit_type` WRITE;
/*!40000 ALTER TABLE `visit_type` DISABLE KEYS */;
INSERT INTO `visit_type` VALUES (3,'IPD','Visit for patients being admitted',1,'2014-09-18 14:19:53',4,'2018-01-15 14:07:25',1,4,'2018-01-15 14:07:25','No needed as yet for Lesotho customization','c228eab1-3f10-11e4-adec-0800271c1b75'),(4,'OPD','Visit for patients coming for OPD',1,'2014-09-18 14:19:53',4,'2018-03-04 08:52:57',1,4,'2018-03-04 08:52:57','General OPD is currently within scope for the initial Lesotho implementation. Will be activated when needed','c22a5000-3f10-11e4-adec-0800271c1b75'),(5,'Special OPD','Visit for patients coming for Dental, Spine, Skin etc',1,'2014-09-18 14:19:53',4,'2018-01-15 14:07:39',1,4,'2018-01-15 14:07:39','No needed as yet for Lesotho customization','c23d6c9d-3f10-11e4-adec-0800271c1b75'),(6,'EMERGENCY','Emergency patient visit',1,'2014-09-18 14:19:53',4,'2018-01-15 14:07:45',1,4,'2018-01-15 14:07:45','No needed as yet for Lesotho customization','c2402997-3f10-11e4-adec-0800271c1b75'),(7,'PHARMACY VISIT','Visit for syncing sale orders from pharmacy',1,'2014-09-18 00:00:00',4,'2018-03-04 08:54:29',1,4,'2018-03-04 08:54:29','Pharmacy visits will currently be targeting ART patients, specifically ARV drug pick up visits. The ARV regimen drug pick up visit type currently covers this use case','b9cb32c9-3f12-11e4-adec-0800271c1b75'),(8,'LAB VISIT','Visits for lab visit by patient when the tests are not ordered through OpenMRS',1,'2014-09-18 00:00:00',4,'2018-01-15 14:07:57',1,4,'2018-01-15 14:07:57','No needed as yet for Lesotho customization','bef32e14-3f12-11e4-adec-0800271c1b75'),(9,'New or Pre-ART','HIV Care intake visit',4,'2018-01-13 05:57:40',4,'2018-03-04 09:19:31',0,NULL,NULL,NULL,'ea86054a-c93b-49b5-ad7b-04388ad9fc88'),(10,'ARV Drug Pickup','For ARV drug pick up visits',4,'2018-01-15 14:08:58',4,'2018-03-04 09:18:08',0,NULL,NULL,NULL,'33e15d3c-54b7-4e8e-9527-b828c1cb24d0'),(11,'Sick or Presumptive TB','Sick or Presumptive TB',1,'2018-02-28 15:32:45',4,'2018-05-08 09:59:57',0,NULL,NULL,NULL,'ece8bbe3-d648-43f0-99bd-f629e882f321'),(12,'High Viral Load Result','Visit type for ART clients with high viral load. Workflow will be customized accordingly for clients with VL > 1000',4,'2018-03-04 08:58:56',4,'2018-03-04 09:19:48',0,NULL,NULL,NULL,'798b308d-b0f7-4be6-bd3c-c50061691698'),(13,'TB Case','TB Case',4,'2018-05-08 11:26:27',NULL,NULL,0,NULL,NULL,NULL,'f310bccd-dde6-4ef5-8cbb-446625db2bde'),(14,'Transfer In','Visit type for transfer ins',4,'2018-06-08 11:10:31',NULL,NULL,0,NULL,NULL,NULL,'e1427d12-cfcb-48e5-bbab-fe47d91a5c62'),(15,'HTS Only','Visit type to use when a patient is due for testing according to the standard decision criteria i.e. Status unknown OR Negative and 3 months visit OR New Bukana',4,'2019-05-21 09:20:30',NULL,NULL,0,NULL,NULL,NULL,'57159542-718d-439d-8d3a-1ba6586c08f0'),(16,'ANC','ANC visit',4,'2019-10-26 12:52:12',4,'2019-10-26 12:52:54',0,NULL,NULL,NULL,'d9ea62e0-0079-4151-85ce-8e7443bf2fe6'),(17,'PNC','PNC visit',4,'2019-10-26 12:52:25',4,'2019-10-26 12:52:49',0,NULL,NULL,NULL,'949e99d7-f6be-4689-b507-33728f565b8c'),(18,'HEI','HIE visit',4,'2019-10-26 12:52:39',NULL,NULL,0,NULL,NULL,NULL,'00279a7c-9b5a-4ef9-b15a-32cd814be84f');
/*!40000 ALTER TABLE `visit_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-11 15:54:53
