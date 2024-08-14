-- MySQL dump 10.13  Distrib 5.7.30, for Linux (x86_64)
--
-- Host: localhost    Database: openmrs
-- ------------------------------------------------------
-- Server version	5.7.30

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
-- Table structure for table `person_attribute_type`
--

DROP TABLE IF EXISTS `person_attribute_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_attribute_type` (
  `person_attribute_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` text,
  `format` varchar(50) DEFAULT NULL,
  `foreign_key` int(11) DEFAULT NULL,
  `searchable` tinyint(1) NOT NULL DEFAULT '0',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `edit_privilege` varchar(255) DEFAULT NULL,
  `sort_weight` double DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`person_attribute_type_id`),
  UNIQUE KEY `person_attribute_type_uuid_index` (`uuid`),
  KEY `attribute_is_searchable` (`searchable`),
  KEY `name_of_attribute` (`name`),
  KEY `person_attribute_type_retired_status` (`retired`),
  KEY `attribute_type_changer` (`changed_by`),
  KEY `attribute_type_creator` (`creator`),
  KEY `user_who_retired_person_attribute_type` (`retired_by`),
  KEY `privilege_which_can_edit` (`edit_privilege`),
  CONSTRAINT `attribute_type_changer` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `attribute_type_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `privilege_which_can_edit` FOREIGN KEY (`edit_privilege`) REFERENCES `privilege` (`privilege`),
  CONSTRAINT `user_who_retired_person_attribute_type` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_attribute_type`
--

LOCK TABLES `person_attribute_type` WRITE;
/*!40000 ALTER TABLE `person_attribute_type` DISABLE KEYS */;
INSERT INTO `person_attribute_type` VALUES (8,'givenNameLocal','Maiden Name','java.lang.String',NULL,1,1,'2014-09-18 14:18:06',4,'2018-04-09 16:20:03',0,NULL,NULL,NULL,NULL,6,'82325788-3f10-11e4-adec-0800271c1b75'),(9,'familyNameLocal','Maiden Surname','java.lang.String',NULL,1,1,'2014-09-18 14:18:06',4,'2018-04-09 16:21:06',0,NULL,NULL,NULL,NULL,6,'8233a58a-3f10-11e4-adec-0800271c1b75'),(10,'middleNameLocal','Middle Name Local','java.lang.String',NULL,1,1,'2014-09-18 14:18:06',4,'2018-04-14 16:02:17',0,NULL,NULL,NULL,NULL,6,'8234e7b0-3f10-11e4-adec-0800271c1b75'),(11,'caste','Caste','java.lang.String',NULL,1,1,'2014-09-18 00:00:00',4,'2018-01-15 12:23:20',1,4,'2018-01-15 12:23:20','Not Used in Lesotho',NULL,4,'c1f4239f-3f10-11e4-adec-0800271c1b75'),(12,'class','Class','org.openmrs.Concept',96,1,1,'2014-09-18 00:00:00',4,'2018-01-18 07:41:25',1,4,'2018-01-18 07:41:25','No needed as yet for Lesotho customization',NULL,5,'c1f455e7-3f10-11e4-adec-0800271c1b75'),(13,'education','Education Details','org.openmrs.Concept',102,1,1,'2014-09-18 00:00:00',4,'2018-01-18 07:41:31',1,4,'2018-01-18 07:41:31','No needed as yet for Lesotho customization',NULL,6,'c1f4a004-3f10-11e4-adec-0800271c1b75'),(14,'occupation','Occupation','org.openmrs.Concept',109,1,1,'2014-09-18 00:00:00',NULL,NULL,0,NULL,NULL,NULL,NULL,7,'c1f7d1f1-3f10-11e4-adec-0800271c1b75'),(15,'primaryContact','Secondary Contact','java.lang.String',NULL,1,1,'2014-09-18 00:00:00',4,'2018-04-09 06:36:35',0,NULL,NULL,NULL,NULL,8,'c1f7fd17-3f10-11e4-adec-0800271c1b75'),(16,'secondaryContact','Secondary Contact','java.lang.String',NULL,1,1,'2014-09-18 00:00:00',4,'2018-01-18 07:41:03',1,4,'2018-01-18 07:41:03','No needed as yet for Lesotho customization',NULL,9,'c1f825c9-3f10-11e4-adec-0800271c1b75'),(17,'primaryRelative','Treatment Supporter/Next of Kin','java.lang.String',NULL,1,1,'2014-09-18 00:00:00',4,'2018-05-08 10:55:30',0,NULL,NULL,NULL,NULL,4,'c1f84df3-3f10-11e4-adec-0800271c1b75'),(18,'secondaryIdentifier','Secondary Identifier','java.lang.String',NULL,1,1,'2014-09-18 00:00:00',4,'2018-01-18 07:42:24',1,4,'2018-01-18 07:42:24','No needed as yet for Lesotho customization',NULL,11,'c1f8880d-3f10-11e4-adec-0800271c1b75'),(19,'landHolding','Land Holding (in acres)','java.lang.Integer',NULL,1,4,'2015-02-25 14:27:11',4,'2018-01-15 12:23:09',1,4,'2018-01-15 12:23:09','Not Used in Lesotho',NULL,12,'3dfdc176-17fd-42b1-b5be-c7e25b78b602'),(20,'debt','debt (in Rs)','java.lang.String',NULL,1,4,'2015-02-25 14:27:32',4,'2018-01-15 12:23:00',1,4,'2018-01-15 12:23:00','Not Used in Lesotho',NULL,13,'fb3c00b1-81c8-40fe-89e8-6b3344688a13'),(21,'distanceFromCenter','Distance From Center (in km)','java.lang.Float',NULL,1,4,'2015-02-25 14:28:09',4,'2020-06-16 10:37:29',1,4,'2020-06-16 10:37:29','Not applicable in Lesotho',NULL,22,'d1314f0f-c2d9-4223-88d9-ec4d2827c9da'),(22,'isUrban','Urban','java.lang.Boolean',NULL,1,4,'2015-02-25 14:29:13',4,'2018-04-20 23:18:18',0,NULL,NULL,NULL,NULL,16,'9234695b-0f68-4970-aeb7-3b32d4a2b346'),(23,'cluster','cluster','org.openmrs.Concept',1173,1,4,'2015-02-25 14:30:14',4,'2018-04-20 23:18:07',1,4,'2018-01-15 12:22:51','Not Used in Lesotho',NULL,17,'35e98d04-3981-4257-a593-fadd81bfc109'),(24,'RationCard','Ration Card Type','org.openmrs.Concept',1174,1,4,'2015-02-25 14:30:50',4,'2020-06-16 10:38:27',1,4,'2018-01-15 12:22:45','Not Used in Lesotho',NULL,19,'6f32179b-c6b9-465e-a278-c15da2637630'),(25,'familyIncome','Family Income (per month in Rs)','org.openmrs.Concept',1175,1,4,'2015-02-25 14:31:57',4,'2020-06-16 10:38:07',1,4,'2018-01-15 12:22:38','Not Used in Lesotho',NULL,20,'a10fe690-1c44-4ba8-a244-8fe51f9e61f7'),(26,'telephoneNumber','Primary Contact','java.lang.Integer',NULL,1,4,'2018-03-27 16:53:12',4,'2020-06-16 10:38:27',0,NULL,NULL,NULL,NULL,6,'c66d5786-60f1-4cdf-8292-77e601c007cb'),(27,'saphoneNumber','SA Phone','java.lang.String',NULL,1,4,'2018-04-09 16:07:16',4,'2018-04-20 23:19:37',0,NULL,NULL,NULL,NULL,14,'3fd6fe43-28f7-4ca7-bec2-5dca470392c9'),(28,'isMarried','Marital Status','org.openmrs.Concept',2185,1,4,'2018-04-10 02:33:44',4,'2018-05-08 11:02:30',0,NULL,NULL,NULL,NULL,6,'b9b02c50-d41a-4ee6-a99e-9943daadc428'),(29,'extraAddressInfo','Extra Address Information','java.lang.String',NULL,1,4,'2018-04-15 07:51:08',4,'2020-06-16 10:33:47',0,NULL,NULL,NULL,NULL,23,'ea4d4d92-9bb9-4380-9d23-a0a4ab8b583e'),(30,'mothersMaidenSurname','Mother\'s Maiden Surname','java.lang.String',NULL,1,4,'2020-06-16 10:26:02',4,'2020-06-16 10:34:17',0,NULL,NULL,NULL,NULL,5,'c87e482a-f225-49c3-a66c-4c653f51605e'),(31,'birthPlace','Place of Birth','java.lang.String',NULL,1,4,'2020-06-16 10:55:13',NULL,NULL,0,NULL,NULL,NULL,NULL,6,'1fabcdca-ad51-4e8a-85f8-ff1e324833e7'),(32,'Age','Age','java.lang.Integer',NULL,0,4,'2021-09-21 10:25:29',NULL,NULL,0,NULL,NULL,NULL,NULL,24,'d72c8ef9-1daa-4361-9047-ae796e0e154d'),(33,'Sex','Sex','java.lang.Character',NULL,0,4,'2021-09-21 10:25:42',NULL,NULL,0,NULL,NULL,NULL,NULL,25,'01e9fdbb-6c1c-4e56-8a5e-4f8cc1a745e5'),(34,'Education Level',NULL,'org.openmrs.Concept',6283,0,4,'2024-08-14 13:29:27',NULL,NULL,0,NULL,NULL,NULL,NULL,26,'7fd4e210-7faa-4c74-9249-236f26a73b92');
/*!40000 ALTER TABLE `person_attribute_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-14 13:30:31
