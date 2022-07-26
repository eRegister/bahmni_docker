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
-- Table structure for table `reporting_age_group`
--

DROP TABLE IF EXISTS `reporting_age_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reporting_age_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `report_group_name` varchar(255) NOT NULL,
  `min_years` int(11) NOT NULL DEFAULT '0',
  `min_days` int(11) NOT NULL DEFAULT '0',
  `max_years` int(11) NOT NULL DEFAULT '0',
  `max_days` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporting_age_group`
--

LOCK TABLES `reporting_age_group` WRITE;
/*!40000 ALTER TABLE `reporting_age_group` DISABLE KEYS */;
INSERT INTO `reporting_age_group` VALUES (1,'All','All Ages',0,0,200,0,0),(2,'Under 1yr','HIV_ages',0,0,1,-1,1),(3,'1-4yrs','HIV_ages',1,0,5,-1,2),(4,'5-14yrs','HIV_ages',5,0,15,-1,3),(5,'15-19yrs','HIV_ages',15,0,20,-1,4),(6,'20-24yrs','HIV_ages',20,0,25,-1,5),(7,'25-49yrs','HIV_ages',25,0,50,-1,6),(8,'50+yrs','HIV_ages',50,0,999,0,7),(9,'Under 1yr','Modified_Ages',0,0,1,-1,1),(10,'1-4yrs','Modified_Ages',1,0,5,-1,2),(11,'5-9yrs','Modified_Ages',5,0,10,-1,3),(12,'10-14yrs','Modified_Ages',10,0,15,-1,4),(13,'15-19yrs','Modified_Ages',15,0,20,-1,5),(14,'20-24yrs','Modified_Ages',20,0,25,-1,6),(15,'25-29yrs','Modified_Ages',25,0,30,-1,7),(16,'30-34yrs','Modified_Ages',30,0,35,-1,8),(17,'35-39yrs','Modified_Ages',35,0,40,-1,9),(18,'40-44yrs','Modified_Ages',40,0,45,-1,10),(19,'45-49yrs','Modified_Ages',45,0,50,-1,11),(20,'50-54yrs','Modified_Ages',50,0,55,-1,12),(21,'55-59yrs','Modified_Ages',55,0,60,-1,14),(22,'60-64yrs','Modified_Ages',60,0,65,-1,15),(23,'65+yrs','Modified_Ages',65,0,999,0,16);
/*!40000 ALTER TABLE `reporting_age_group` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-22 20:08:13
