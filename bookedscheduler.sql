-- MySQL dump 10.16  Distrib 10.1.37-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: bookedscheduler
-- ------------------------------------------------------
-- Server version	10.1.37-MariaDB-0+deb9u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accessories`
--

DROP TABLE IF EXISTS `accessories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accessories` (
  `accessory_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `accessory_name` varchar(85) NOT NULL,
  `accessory_quantity` smallint(5) unsigned DEFAULT NULL,
  `legacyid` char(16) DEFAULT NULL,
  PRIMARY KEY (`accessory_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accessories`
--

LOCK TABLES `accessories` WRITE;
/*!40000 ALTER TABLE `accessories` DISABLE KEYS */;
INSERT INTO `accessories` VALUES (2,'Piano',1,NULL),(5,'Megafonía Portátil MEG-2',1,NULL),(6,'Pantalla portátil 50',2,NULL),(8,'Proyector de diapositivas',1,NULL),(9,'Proyector VGA/Vídeo',4,NULL),(10,'Retroproyector de trasparencias',1,NULL),(16,'Calculadora',5,NULL);
/*!40000 ALTER TABLE `accessories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_activation`
--

DROP TABLE IF EXISTS `account_activation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_activation` (
  `account_activation_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL,
  `activation_code` varchar(30) NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`account_activation_id`),
  UNIQUE KEY `activation_code_2` (`activation_code`),
  KEY `activation_code` (`activation_code`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `account_activation_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_activation`
--

LOCK TABLES `account_activation` WRITE;
/*!40000 ALTER TABLE `account_activation` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_activation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcement_groups`
--

DROP TABLE IF EXISTS `announcement_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcement_groups` (
  `announcementid` mediumint(8) unsigned NOT NULL,
  `group_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`announcementid`,`group_id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `announcement_groups_ibfk_1` FOREIGN KEY (`announcementid`) REFERENCES `announcements` (`announcementid`) ON DELETE CASCADE,
  CONSTRAINT `announcement_groups_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcement_groups`
--

LOCK TABLES `announcement_groups` WRITE;
/*!40000 ALTER TABLE `announcement_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcement_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcement_resources`
--

DROP TABLE IF EXISTS `announcement_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcement_resources` (
  `announcementid` mediumint(8) unsigned NOT NULL,
  `resource_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`announcementid`,`resource_id`),
  KEY `resource_id` (`resource_id`),
  CONSTRAINT `announcement_resources_ibfk_1` FOREIGN KEY (`announcementid`) REFERENCES `announcements` (`announcementid`) ON DELETE CASCADE,
  CONSTRAINT `announcement_resources_ibfk_2` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`resource_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcement_resources`
--

LOCK TABLES `announcement_resources` WRITE;
/*!40000 ALTER TABLE `announcement_resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcement_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcements` (
  `announcementid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `announcement_text` text NOT NULL,
  `priority` mediumint(8) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `display_page` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`announcementid`),
  KEY `start_date` (`start_date`),
  KEY `end_date` (`end_date`),
  KEY `display_page` (`display_page`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blackout_instances`
--

DROP TABLE IF EXISTS `blackout_instances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blackout_instances` (
  `blackout_instance_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `blackout_series_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`blackout_instance_id`),
  KEY `start_date` (`start_date`),
  KEY `end_date` (`end_date`),
  KEY `blackout_series_id` (`blackout_series_id`),
  CONSTRAINT `blackout_instances_ibfk_1` FOREIGN KEY (`blackout_series_id`) REFERENCES `blackout_series` (`blackout_series_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blackout_instances`
--

LOCK TABLES `blackout_instances` WRITE;
/*!40000 ALTER TABLE `blackout_instances` DISABLE KEYS */;
/*!40000 ALTER TABLE `blackout_instances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blackout_series`
--

DROP TABLE IF EXISTS `blackout_series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blackout_series` (
  `blackout_series_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date_created` datetime NOT NULL,
  `last_modified` datetime DEFAULT NULL,
  `title` varchar(85) NOT NULL,
  `description` text,
  `owner_id` mediumint(8) unsigned NOT NULL,
  `legacyid` char(16) DEFAULT NULL,
  `repeat_type` varchar(10) DEFAULT NULL,
  `repeat_options` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`blackout_series_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blackout_series`
--

LOCK TABLES `blackout_series` WRITE;
/*!40000 ALTER TABLE `blackout_series` DISABLE KEYS */;
/*!40000 ALTER TABLE `blackout_series` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blackout_series_resources`
--

DROP TABLE IF EXISTS `blackout_series_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blackout_series_resources` (
  `blackout_series_id` int(10) unsigned NOT NULL,
  `resource_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`blackout_series_id`,`resource_id`),
  KEY `resource_id` (`resource_id`),
  CONSTRAINT `blackout_series_resources_ibfk_1` FOREIGN KEY (`blackout_series_id`) REFERENCES `blackout_series` (`blackout_series_id`) ON DELETE CASCADE,
  CONSTRAINT `blackout_series_resources_ibfk_2` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`resource_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blackout_series_resources`
--

LOCK TABLES `blackout_series_resources` WRITE;
/*!40000 ALTER TABLE `blackout_series_resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `blackout_series_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_log`
--

DROP TABLE IF EXISTS `credit_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credit_log` (
  `credit_log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL,
  `original_credit_count` decimal(7,2) DEFAULT NULL,
  `credit_count` decimal(7,2) DEFAULT NULL,
  `credit_note` varchar(1000) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`credit_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_log`
--

LOCK TABLES `credit_log` WRITE;
/*!40000 ALTER TABLE `credit_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `credit_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_attribute_entities`
--

DROP TABLE IF EXISTS `custom_attribute_entities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_attribute_entities` (
  `custom_attribute_id` mediumint(8) unsigned NOT NULL,
  `entity_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`custom_attribute_id`,`entity_id`),
  CONSTRAINT `custom_attribute_entities_ibfk_1` FOREIGN KEY (`custom_attribute_id`) REFERENCES `custom_attributes` (`custom_attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_attribute_entities`
--

LOCK TABLES `custom_attribute_entities` WRITE;
/*!40000 ALTER TABLE `custom_attribute_entities` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_attribute_entities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_attribute_values`
--

DROP TABLE IF EXISTS `custom_attribute_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_attribute_values` (
  `custom_attribute_value_id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `custom_attribute_id` mediumint(8) unsigned NOT NULL,
  `attribute_value` text NOT NULL,
  `entity_id` mediumint(8) unsigned NOT NULL,
  `attribute_category` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY (`custom_attribute_value_id`),
  KEY `custom_attribute_id` (`custom_attribute_id`),
  KEY `entity_id` (`entity_id`),
  KEY `attribute_category` (`attribute_category`)
) ENGINE=InnoDB AUTO_INCREMENT=254 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_attribute_values`
--

LOCK TABLES `custom_attribute_values` WRITE;
/*!40000 ALTER TABLE `custom_attribute_values` DISABLE KEYS */;
INSERT INTO `custom_attribute_values` VALUES (27,5,'Docencia',62,1),(29,5,'Reunion',63,1),(31,5,'Exámenes',64,1),(33,5,'Docencia',47,1),(35,5,'Reunion',65,1),(37,5,'Docencia',66,1),(39,5,'Docencia',67,1),(41,5,'Docencia',68,1),(42,7,'No',68,1),(44,5,'Jornadas',69,1),(45,7,'Si',69,1),(47,5,'Docencia',70,1),(48,7,'No',70,1),(50,5,'Docencia',61,1),(51,7,'Si',61,1),(53,5,'Reunion',71,1),(54,7,'No',71,1),(56,5,'Reunion',72,1),(57,7,'Si',72,1),(58,8,'Si',72,1),(59,5,'Docencia',73,1),(60,7,'No',73,1),(61,8,'Si',73,1),(62,5,'Docencia',74,1),(63,7,'No',74,1),(64,8,'No',74,1),(65,5,'Docencia',75,1),(66,7,'No',75,1),(67,8,'No',75,1),(68,5,'Jornadas',76,1),(69,7,'No',76,1),(70,8,'No',76,1),(71,5,'Reunion',77,1),(72,7,'No',77,1),(73,8,'Si',77,1),(74,5,'Docencia',78,1),(75,7,'No',78,1),(76,8,'No',78,1),(77,5,'Docencia',79,1),(78,7,'No',79,1),(79,8,'No',79,1),(80,5,'Jornadas',80,1),(81,7,'No',80,1),(82,8,'No',80,1),(83,5,'Docencia',81,1),(84,7,'No',81,1),(85,8,'No',81,1),(86,5,'Docencia',82,1),(87,7,'No',82,1),(88,8,'No',82,1),(89,5,'Docencia',83,1),(90,7,'No',83,1),(91,8,'No',83,1),(92,5,'Docencia',84,1),(93,7,'No',84,1),(94,8,'No',84,1),(95,5,'Docencia',85,1),(96,7,'No',85,1),(97,8,'No',85,1),(98,5,'Docencia',86,1),(99,7,'No',86,1),(100,8,'No',86,1),(101,5,'Docencia',87,1),(102,7,'No',87,1),(103,8,'No',87,1),(104,5,'Docencia',88,1),(105,7,'No',88,1),(106,8,'No',88,1),(107,5,'Docencia',89,1),(108,7,'No',89,1),(109,8,'No',89,1),(110,5,'Docencia',90,1),(111,7,'No',90,1),(112,8,'No',90,1),(113,5,'Docencia',91,1),(114,7,'No',91,1),(115,8,'No',91,1),(116,5,'Docencia',92,1),(117,7,'No',92,1),(118,8,'No',92,1),(119,5,'Reunion',93,1),(120,7,'Si',93,1),(121,8,'Si',93,1),(122,5,'Reunion',94,1),(123,7,'Si',94,1),(124,8,'Si',94,1),(125,5,'Docencia',95,1),(126,7,'No',95,1),(127,8,'No',95,1),(128,5,'Docencia',96,1),(129,7,'No',96,1),(130,8,'No',96,1),(131,5,'Docencia',97,1),(132,7,'No',97,1),(133,8,'No',97,1),(134,5,'Docencia',98,1),(135,7,'No',98,1),(136,8,'No',98,1),(137,5,'Jornadas',99,1),(138,7,'Si',99,1),(139,8,'Si',99,1),(140,5,'Reunion',100,1),(141,7,'Si',100,1),(142,8,'Si',100,1),(143,5,'Docencia',101,1),(144,7,'No',101,1),(145,8,'No',101,1),(146,5,'Docencia',102,1),(147,7,'No',102,1),(148,8,'No',102,1),(149,5,'Docencia',103,1),(150,7,'No',103,1),(151,8,'No',103,1),(152,5,'Docencia',104,1),(153,7,'No',104,1),(154,8,'No',104,1),(155,5,'Exámenes',105,1),(156,7,'No',105,1),(157,8,'Si',105,1),(158,5,'Docencia',106,1),(159,7,'No',106,1),(160,8,'No',106,1),(161,5,'Docencia',107,1),(162,7,'No',107,1),(163,8,'No',107,1),(164,5,'Docencia',108,1),(165,7,'No',108,1),(166,8,'No',108,1),(167,5,'Docencia',109,1),(168,7,'No',109,1),(169,8,'No',109,1),(170,5,'Docencia',110,1),(171,7,'No',110,1),(172,8,'No',110,1),(173,5,'Docencia',111,1),(174,7,'No',111,1),(175,8,'No',111,1),(176,5,'Docencia',112,1),(177,7,'No',112,1),(178,8,'No',112,1),(179,5,'Docencia',113,1),(180,7,'No',113,1),(181,8,'No',113,1),(182,5,'Docencia',114,1),(183,7,'No',114,1),(184,8,'No',114,1),(185,5,'Docencia',115,1),(186,7,'No',115,1),(187,8,'No',115,1),(188,5,'Docencia',116,1),(189,7,'No',116,1),(190,8,'No',116,1),(191,5,'Docencia',117,1),(192,7,'No',117,1),(193,8,'No',117,1),(194,5,'Docencia',118,1),(195,7,'No',118,1),(196,8,'No',118,1),(197,5,'Docencia',119,1),(198,7,'No',119,1),(199,8,'No',119,1),(200,5,'Docencia',120,1),(201,7,'No',120,1),(202,8,'No',120,1),(203,5,'Docencia',121,1),(204,7,'No',121,1),(205,8,'No',121,1),(206,5,'Docencia',122,1),(207,7,'No',122,1),(208,8,'No',122,1),(209,5,'Docencia',123,1),(210,7,'No',123,1),(211,8,'No',123,1),(212,5,'Docencia',124,1),(213,7,'No',124,1),(214,8,'No',124,1),(215,5,'Docencia',125,1),(216,7,'No',125,1),(217,8,'No',125,1),(218,5,'Docencia',126,1),(219,7,'No',126,1),(220,8,'No',126,1),(221,5,'Reunion',127,1),(222,7,'No',127,1),(223,8,'Si',127,1),(224,5,'Reunion',128,1),(225,7,'No',128,1),(226,8,'Si',128,1),(227,5,'Reunion',129,1),(228,7,'No',129,1),(229,8,'No',129,1),(230,5,'Reunion',130,1),(231,7,'Si',130,1),(232,8,'Si',130,1),(233,5,'Exámenes',131,1),(234,7,'No',131,1),(235,8,'No',131,1),(236,5,'Docencia',132,1),(237,7,'Si',132,1),(238,8,'Si',132,1),(239,5,'Docencia',133,1),(240,7,'No',133,1),(241,8,'No',133,1),(242,5,'Jornadas',134,1),(243,7,'Si',134,1),(244,8,'No',134,1),(245,5,'Docencia',135,1),(246,7,'No',135,1),(247,8,'No',135,1),(248,5,'Exámenes',136,1),(249,7,'No',136,1),(250,8,'No',136,1),(251,5,'Reunion',137,1),(252,7,'No',137,1),(253,8,'Si',137,1);
/*!40000 ALTER TABLE `custom_attribute_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_attributes`
--

DROP TABLE IF EXISTS `custom_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_attributes` (
  `custom_attribute_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `display_label` varchar(50) NOT NULL,
  `display_type` tinyint(2) unsigned NOT NULL,
  `attribute_category` tinyint(2) unsigned NOT NULL,
  `validation_regex` varchar(50) DEFAULT NULL,
  `is_required` tinyint(1) unsigned NOT NULL,
  `possible_values` text,
  `sort_order` tinyint(2) unsigned DEFAULT NULL,
  `admin_only` tinyint(1) unsigned DEFAULT NULL,
  `secondary_category` tinyint(2) unsigned DEFAULT NULL,
  `secondary_entity_ids` varchar(2000) DEFAULT NULL,
  `is_private` tinyint(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`custom_attribute_id`),
  KEY `attribute_category` (`attribute_category`),
  KEY `display_label` (`display_label`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_attributes`
--

LOCK TABLES `custom_attributes` WRITE;
/*!40000 ALTER TABLE `custom_attributes` DISABLE KEYS */;
INSERT INTO `custom_attributes` VALUES (5,'Uso de la reserva',3,1,'',1,'Docencia,Exámenes,Reunion,Jornadas',0,0,NULL,'',0),(7,'¿Adjuntas documento?',3,1,'',1,'No,Si',0,0,NULL,'',0),(8,'¿Necesita Material Extra?',3,1,'',1,'No,Si',0,0,NULL,'',0),(9,'¿Necesita Material Extra?',3,4,'',1,'No,Si',0,0,NULL,'',0);
/*!40000 ALTER TABLE `custom_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_time_blocks`
--

DROP TABLE IF EXISTS `custom_time_blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_time_blocks` (
  `custom_time_block_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `layout_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`custom_time_block_id`),
  KEY `layout_id` (`layout_id`),
  CONSTRAINT `custom_time_blocks_ibfk_1` FOREIGN KEY (`layout_id`) REFERENCES `layouts` (`layout_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_time_blocks`
--

LOCK TABLES `custom_time_blocks` WRITE;
/*!40000 ALTER TABLE `custom_time_blocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_time_blocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbversion`
--

DROP TABLE IF EXISTS `dbversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbversion` (
  `version_number` double unsigned NOT NULL DEFAULT '0',
  `version_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbversion`
--

LOCK TABLES `dbversion` WRITE;
/*!40000 ALTER TABLE `dbversion` DISABLE KEYS */;
INSERT INTO `dbversion` VALUES (2.1,'2019-03-18 12:39:32'),(2.2,'2019-03-18 12:39:32'),(2.3,'2019-03-18 12:39:32'),(2.4,'2019-03-18 12:39:32'),(2.5,'2019-03-18 12:39:32'),(2.6,'2019-03-18 12:39:32'),(2.7,'2019-03-18 12:39:32');
/*!40000 ALTER TABLE `dbversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_resource_permissions`
--

DROP TABLE IF EXISTS `group_resource_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_resource_permissions` (
  `group_id` smallint(5) unsigned NOT NULL,
  `resource_id` smallint(5) unsigned NOT NULL,
  `permission_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`group_id`,`resource_id`),
  KEY `group_id` (`group_id`),
  KEY `resource_id` (`resource_id`),
  KEY `group_id_2` (`group_id`),
  KEY `resource_id_2` (`resource_id`),
  CONSTRAINT `group_resource_permissions_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `group_resource_permissions_ibfk_2` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`resource_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_resource_permissions`
--

LOCK TABLES `group_resource_permissions` WRITE;
/*!40000 ALTER TABLE `group_resource_permissions` DISABLE KEYS */;
INSERT INTO `group_resource_permissions` VALUES (7,1,0),(7,2,0),(7,3,0),(7,4,0),(7,5,0),(7,6,0),(7,7,0),(7,8,0),(7,9,0),(7,11,0),(7,12,0),(7,13,0),(7,15,0),(7,16,0),(7,17,0),(7,18,0),(7,19,0),(7,20,0),(7,21,0),(7,22,0),(7,23,0),(7,24,0),(7,25,0),(7,26,0),(7,27,0),(7,28,0),(7,29,0),(7,30,0),(7,31,0),(7,32,0),(7,33,0),(7,34,0),(7,35,0),(7,36,0),(7,37,0),(7,38,0),(7,39,0),(7,40,0),(7,41,0),(7,42,0),(7,43,0),(7,44,0),(7,45,0),(7,46,0),(7,47,0),(7,48,0),(7,49,0),(7,50,0),(7,51,0),(7,52,0),(7,53,0),(7,54,0),(7,55,0),(7,56,0),(8,1,0),(8,2,0),(8,3,0),(8,4,0),(8,5,0),(8,6,0),(8,7,0),(8,8,0),(8,9,0),(8,11,0),(8,12,0),(8,13,0),(8,15,0),(8,16,0),(8,17,0),(8,18,0),(8,19,0),(8,20,0),(8,21,0),(8,22,0),(8,23,0),(8,24,0),(8,25,0),(8,26,0),(8,27,0),(8,28,0),(8,29,0),(8,30,0),(8,31,0),(8,32,0),(8,33,0),(8,34,0),(8,35,0),(8,36,0),(8,37,0),(8,38,0),(8,39,0),(8,40,0),(8,41,0),(8,42,0),(8,43,0),(8,44,0),(8,45,0),(8,46,0),(8,47,0),(8,48,0),(8,49,0),(8,50,0),(8,51,0),(8,52,0),(8,53,0),(8,54,0),(8,55,0),(8,56,0),(10,1,0),(10,2,0),(10,3,0),(10,4,0),(10,5,0),(10,6,0),(10,7,0),(10,8,0),(10,9,0),(10,11,0),(10,12,0),(10,13,0),(10,15,0),(10,16,0),(10,17,0),(10,18,0),(10,19,0),(10,20,0),(10,21,0),(10,22,0),(10,23,0),(10,24,0),(10,25,0),(10,26,0),(10,27,0),(10,28,0),(10,29,0),(10,30,0),(10,31,0),(10,32,0),(10,33,0),(10,34,0),(10,35,0),(10,36,0),(10,37,0),(10,38,0),(10,39,0),(10,40,0),(10,41,0),(10,42,0),(10,43,0),(10,44,0),(10,45,0),(10,46,0),(10,47,0),(10,48,0),(10,49,0),(10,50,0),(10,51,0),(10,52,0),(10,53,0),(10,54,0),(10,55,0),(10,56,0),(11,1,1),(11,2,1),(11,3,1),(11,4,1),(11,5,1),(11,6,1),(11,7,1),(11,8,1),(11,9,1),(11,11,1),(11,12,1),(11,13,1),(11,15,1),(11,16,1),(11,17,1),(11,18,1),(11,19,1),(11,20,1),(11,21,1),(11,22,1),(11,23,1),(11,24,1),(11,25,1),(11,26,1),(11,27,1),(11,28,1),(11,29,1),(11,30,1),(11,31,1),(11,32,1),(11,33,1),(11,34,1),(11,35,1),(11,36,1),(11,37,1),(11,38,1),(11,39,1),(11,40,1),(11,41,1),(11,42,1),(11,43,1),(11,44,1),(11,45,1),(11,46,1),(11,47,1),(11,48,1),(11,49,1),(11,50,1),(11,51,1),(11,52,1),(11,53,1),(11,54,1),(11,55,1),(11,56,1),(12,1,0),(12,2,0),(12,3,0),(12,4,0),(12,5,0),(12,6,0),(12,7,0),(12,8,0),(12,9,0),(12,11,0),(12,12,0),(12,13,0),(12,15,0),(12,16,0),(12,17,0),(12,18,0),(12,19,0),(12,20,0),(12,21,0),(12,22,0),(12,23,0),(12,24,0),(12,25,0),(12,26,0),(12,27,0),(12,28,0),(12,29,0),(12,30,0),(12,31,0),(12,32,0),(12,33,0),(12,34,0),(12,35,0),(12,36,0),(12,37,0),(12,38,0),(12,39,0),(12,40,0),(12,41,0),(12,42,0),(12,43,0),(12,44,0),(12,45,0),(12,46,0),(12,47,0),(12,48,0),(12,49,0),(12,50,0),(12,51,0),(12,52,0),(12,53,0),(12,54,0),(12,55,0),(12,56,0);
/*!40000 ALTER TABLE `group_resource_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_roles`
--

DROP TABLE IF EXISTS `group_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_roles` (
  `group_id` smallint(8) unsigned NOT NULL,
  `role_id` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`role_id`),
  KEY `group_id` (`group_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `group_roles_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `group_roles_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_roles`
--

LOCK TABLES `group_roles` WRITE;
/*!40000 ALTER TABLE `group_roles` DISABLE KEYS */;
INSERT INTO `group_roles` VALUES (7,1),(7,3),(7,4),(8,1),(8,2),(8,3),(8,4),(11,3),(11,4),(12,1),(12,3),(12,4);
/*!40000 ALTER TABLE `group_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `group_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(85) NOT NULL,
  `admin_group_id` smallint(5) unsigned DEFAULT NULL,
  `legacyid` char(16) DEFAULT NULL,
  `isdefault` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`group_id`),
  KEY `admin_group_id` (`admin_group_id`),
  KEY `isdefault` (`isdefault`),
  CONSTRAINT `groups_ibfk_1` FOREIGN KEY (`admin_group_id`) REFERENCES `groups` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (7,'Admin-Reservas',7,NULL,0),(8,'Admin-Sistema',NULL,NULL,0),(10,'Usuarios',7,NULL,1),(11,'Conserjeria',7,NULL,0),(12,'Aula HP',8,NULL,0);
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `layouts`
--

DROP TABLE IF EXISTS `layouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `layouts` (
  `layout_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `timezone` varchar(50) NOT NULL,
  `layout_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`layout_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `layouts`
--

LOCK TABLES `layouts` WRITE;
/*!40000 ALTER TABLE `layouts` DISABLE KEYS */;
INSERT INTO `layouts` VALUES (15,'Europe/Madrid',0),(16,'Europe/Madrid',0),(17,'Europe/Madrid',0),(18,'Europe/Madrid',0),(19,'Europe/Madrid',0),(20,'Europe/Madrid',0);
/*!40000 ALTER TABLE `layouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_configuration`
--

DROP TABLE IF EXISTS `payment_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_configuration` (
  `payment_configuration_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `credit_cost` decimal(7,2) unsigned NOT NULL,
  `credit_currency` varchar(10) NOT NULL,
  PRIMARY KEY (`payment_configuration_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_configuration`
--

LOCK TABLES `payment_configuration` WRITE;
/*!40000 ALTER TABLE `payment_configuration` DISABLE KEYS */;
INSERT INTO `payment_configuration` VALUES (1,0.00,'USD');
/*!40000 ALTER TABLE `payment_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_gateway_settings`
--

DROP TABLE IF EXISTS `payment_gateway_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_gateway_settings` (
  `gateway_type` varchar(255) NOT NULL,
  `setting_name` varchar(255) NOT NULL,
  `setting_value` varchar(1000) NOT NULL,
  PRIMARY KEY (`gateway_type`,`setting_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_gateway_settings`
--

LOCK TABLES `payment_gateway_settings` WRITE;
/*!40000 ALTER TABLE `payment_gateway_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_gateway_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_transaction_log`
--

DROP TABLE IF EXISTS `payment_transaction_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_transaction_log` (
  `payment_transaction_log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL,
  `status` varchar(255) NOT NULL,
  `invoice_number` varchar(50) DEFAULT NULL,
  `transaction_id` varchar(50) NOT NULL,
  `subtotal_amount` decimal(7,2) NOT NULL,
  `tax_amount` decimal(7,2) NOT NULL,
  `total_amount` decimal(7,2) NOT NULL,
  `transaction_fee` decimal(7,2) DEFAULT NULL,
  `currency` varchar(3) NOT NULL,
  `transaction_href` varchar(500) DEFAULT NULL,
  `refund_href` varchar(500) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `gateway_name` varchar(100) NOT NULL,
  `gateway_date_created` varchar(25) NOT NULL,
  `payment_response` text,
  PRIMARY KEY (`payment_transaction_log_id`),
  KEY `user_id` (`user_id`),
  KEY `invoice_number` (`invoice_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_transaction_log`
--

LOCK TABLES `payment_transaction_log` WRITE;
/*!40000 ALTER TABLE `payment_transaction_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_transaction_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peak_times`
--

DROP TABLE IF EXISTS `peak_times`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `peak_times` (
  `peak_times_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `schedule_id` smallint(5) unsigned NOT NULL,
  `all_day` tinyint(1) unsigned NOT NULL,
  `start_time` varchar(10) DEFAULT NULL,
  `end_time` varchar(10) DEFAULT NULL,
  `every_day` tinyint(1) unsigned NOT NULL,
  `peak_days` varchar(13) DEFAULT NULL,
  `all_year` tinyint(1) unsigned NOT NULL,
  `begin_month` tinyint(1) unsigned NOT NULL,
  `begin_day` tinyint(1) unsigned NOT NULL,
  `end_month` tinyint(1) unsigned NOT NULL,
  `end_day` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`peak_times_id`),
  KEY `schedule_id` (`schedule_id`),
  CONSTRAINT `peak_times_ibfk_1` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`schedule_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peak_times`
--

LOCK TABLES `peak_times` WRITE;
/*!40000 ALTER TABLE `peak_times` DISABLE KEYS */;
/*!40000 ALTER TABLE `peak_times` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quotas`
--

DROP TABLE IF EXISTS `quotas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quotas` (
  `quota_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `quota_limit` decimal(7,2) unsigned NOT NULL,
  `unit` varchar(25) NOT NULL,
  `duration` varchar(25) NOT NULL,
  `resource_id` smallint(5) unsigned DEFAULT NULL,
  `group_id` smallint(5) unsigned DEFAULT NULL,
  `schedule_id` smallint(5) unsigned DEFAULT NULL,
  `enforced_days` varchar(15) DEFAULT NULL,
  `enforced_time_start` time DEFAULT NULL,
  `enforced_time_end` time DEFAULT NULL,
  `scope` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`quota_id`),
  KEY `resource_id` (`resource_id`),
  KEY `group_id` (`group_id`),
  KEY `schedule_id` (`schedule_id`),
  CONSTRAINT `quotas_ibfk_1` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`resource_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `quotas_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `quotas_ibfk_3` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`schedule_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quotas`
--

LOCK TABLES `quotas` WRITE;
/*!40000 ALTER TABLE `quotas` DISABLE KEYS */;
INSERT INTO `quotas` VALUES (5,0.00,'hours','day',NULL,10,NULL,NULL,NULL,NULL,'IncludeCompleted');
/*!40000 ALTER TABLE `quotas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refund_transaction_log`
--

DROP TABLE IF EXISTS `refund_transaction_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refund_transaction_log` (
  `refund_transaction_log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `payment_transaction_log_id` int(10) unsigned NOT NULL,
  `status` varchar(255) NOT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  `total_refund_amount` decimal(7,2) NOT NULL,
  `payment_refund_amount` decimal(7,2) DEFAULT NULL,
  `fee_refund_amount` decimal(7,2) DEFAULT NULL,
  `transaction_href` varchar(500) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `gateway_date_created` varchar(25) NOT NULL,
  `refund_response` text,
  PRIMARY KEY (`refund_transaction_log_id`),
  KEY `payment_transaction_log_id` (`payment_transaction_log_id`),
  CONSTRAINT `refund_transaction_log_ibfk_1` FOREIGN KEY (`payment_transaction_log_id`) REFERENCES `payment_transaction_log` (`payment_transaction_log_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refund_transaction_log`
--

LOCK TABLES `refund_transaction_log` WRITE;
/*!40000 ALTER TABLE `refund_transaction_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `refund_transaction_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reminders`
--

DROP TABLE IF EXISTS `reminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reminders` (
  `reminder_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL,
  `address` text NOT NULL,
  `message` text NOT NULL,
  `sendtime` datetime NOT NULL,
  `refnumber` text NOT NULL,
  PRIMARY KEY (`reminder_id`),
  KEY `reminders_user_id` (`user_id`),
  CONSTRAINT `reminders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reminders`
--

LOCK TABLES `reminders` WRITE;
/*!40000 ALTER TABLE `reminders` DISABLE KEYS */;
/*!40000 ALTER TABLE `reminders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_accessories`
--

DROP TABLE IF EXISTS `reservation_accessories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation_accessories` (
  `series_id` int(10) unsigned NOT NULL,
  `accessory_id` smallint(5) unsigned NOT NULL,
  `quantity` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`series_id`,`accessory_id`),
  KEY `accessory_id` (`accessory_id`),
  KEY `series_id` (`series_id`),
  CONSTRAINT `reservation_accessories_ibfk_1` FOREIGN KEY (`accessory_id`) REFERENCES `accessories` (`accessory_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reservation_accessories_ibfk_2` FOREIGN KEY (`series_id`) REFERENCES `reservation_series` (`series_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_accessories`
--

LOCK TABLES `reservation_accessories` WRITE;
/*!40000 ALTER TABLE `reservation_accessories` DISABLE KEYS */;
INSERT INTO `reservation_accessories` VALUES (72,16,2),(73,5,1),(77,5,1),(94,10,1),(99,2,1),(99,5,1),(100,2,1),(100,10,1),(115,16,2),(127,10,1),(137,5,1);
/*!40000 ALTER TABLE `reservation_accessories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_color_rules`
--

DROP TABLE IF EXISTS `reservation_color_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation_color_rules` (
  `reservation_color_rule_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `custom_attribute_id` mediumint(8) unsigned NOT NULL,
  `attribute_type` smallint(5) unsigned DEFAULT NULL,
  `required_value` text,
  `comparison_type` smallint(5) unsigned DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`reservation_color_rule_id`),
  KEY `custom_attribute_id` (`custom_attribute_id`),
  CONSTRAINT `reservation_color_rules_ibfk_1` FOREIGN KEY (`custom_attribute_id`) REFERENCES `custom_attributes` (`custom_attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_color_rules`
--

LOCK TABLES `reservation_color_rules` WRITE;
/*!40000 ALTER TABLE `reservation_color_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation_color_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_files`
--

DROP TABLE IF EXISTS `reservation_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation_files` (
  `file_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `series_id` int(10) unsigned NOT NULL,
  `file_name` varchar(250) NOT NULL,
  `file_type` varchar(75) DEFAULT NULL,
  `file_size` varchar(45) NOT NULL,
  `file_extension` varchar(10) NOT NULL,
  PRIMARY KEY (`file_id`),
  KEY `series_id` (`series_id`),
  CONSTRAINT `reservation_files_ibfk_1` FOREIGN KEY (`series_id`) REFERENCES `reservation_series` (`series_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_files`
--

LOCK TABLES `reservation_files` WRITE;
/*!40000 ALTER TABLE `reservation_files` DISABLE KEYS */;
INSERT INTO `reservation_files` VALUES (1,62,'LOGO_ESCUELA.png','image/png','209658','png'),(2,65,'LOGO_ESCUELA.png','image/png','209658','png'),(3,66,'Formulario Aula HP.pdf','application/pdf','8424','pdf'),(4,67,'Formulario Aula HP.pdf','application/pdf','8424','pdf'),(5,69,'1 NoSQL.pdf','application/pdf','1476865','pdf'),(6,61,'BOCM-20190328-4.pdf','application/pdf','215365','pdf'),(7,77,'reservations.csv','text/csv','118','csv'),(8,92,'instrucciones-parking.pdf','application/pdf','111226','pdf'),(9,92,'ayuda(1).pdf','application/pdf','281467','pdf'),(10,93,'instrucciones-parking.pdf','application/pdf','111226','pdf'),(11,99,'instrucciones-parking.pdf','application/pdf','111226','pdf'),(12,100,'instrucciones-parking.pdf','application/pdf','111226','pdf'),(13,101,'Formulario Aula HP.pdf','application/pdf','8424','pdf'),(14,130,'instrucciones-parking(1).pdf','application/pdf','111226','pdf'),(15,132,'instrucciones-parking(1).pdf','application/pdf','111226','pdf'),(16,134,'instrucciones-parking(1).pdf','application/pdf','111226','pdf');
/*!40000 ALTER TABLE `reservation_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_guests`
--

DROP TABLE IF EXISTS `reservation_guests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation_guests` (
  `reservation_instance_id` int(10) unsigned NOT NULL,
  `email` varchar(255) NOT NULL,
  `reservation_user_level` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY (`reservation_instance_id`,`email`),
  KEY `reservation_guests_reservation_instance_id` (`reservation_instance_id`),
  KEY `reservation_guests_email_address` (`email`),
  KEY `reservation_guests_reservation_user_level` (`reservation_user_level`),
  CONSTRAINT `reservation_guests_ibfk_1` FOREIGN KEY (`reservation_instance_id`) REFERENCES `reservation_instances` (`reservation_instance_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_guests`
--

LOCK TABLES `reservation_guests` WRITE;
/*!40000 ALTER TABLE `reservation_guests` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation_guests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_instances`
--

DROP TABLE IF EXISTS `reservation_instances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation_instances` (
  `reservation_instance_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `reference_number` varchar(50) NOT NULL,
  `series_id` int(10) unsigned NOT NULL,
  `checkin_date` datetime DEFAULT NULL,
  `checkout_date` datetime DEFAULT NULL,
  `previous_end_date` datetime DEFAULT NULL,
  `credit_count` decimal(7,2) unsigned DEFAULT NULL,
  PRIMARY KEY (`reservation_instance_id`),
  KEY `start_date` (`start_date`),
  KEY `end_date` (`end_date`),
  KEY `reference_number` (`reference_number`),
  KEY `series_id` (`series_id`),
  KEY `checkin_date` (`checkin_date`),
  CONSTRAINT `reservations_series` FOREIGN KEY (`series_id`) REFERENCES `reservation_series` (`series_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_instances`
--

LOCK TABLES `reservation_instances` WRITE;
/*!40000 ALTER TABLE `reservation_instances` DISABLE KEYS */;
INSERT INTO `reservation_instances` VALUES (1,'2019-03-19 14:30:00','2019-03-19 17:00:00','5c90ab6f5c0cf522051881',1,NULL,NULL,NULL,NULL),(4,'2019-03-19 14:00:00','2019-03-19 17:00:00','5c90ca06a86a2384646074',4,NULL,NULL,NULL,NULL),(9,'2019-03-19 19:30:00','2019-03-19 21:30:00','5c90d186a0bf8388546103',9,NULL,NULL,NULL,NULL),(10,'2019-03-19 20:30:00','2019-03-19 21:00:00','5c90d19179183029385539',10,NULL,NULL,NULL,NULL),(12,'2019-03-19 15:30:00','2019-03-19 18:00:00','5c90d2268048a928671900',12,NULL,NULL,NULL,NULL),(15,'2019-03-20 17:00:00','2019-03-20 20:00:00','5c90d595a83b4244921784',15,NULL,NULL,NULL,NULL),(26,'2019-03-20 13:00:00','2019-03-20 14:00:00','5c90dc0464128755405305',26,NULL,NULL,NULL,NULL),(28,'2019-03-19 15:00:00','2019-03-19 16:00:00','5c90de10ba330387250486',28,NULL,NULL,NULL,NULL),(29,'2019-03-20 14:00:00','2019-03-20 19:30:00','5c914ee0f27c7077541289',29,NULL,NULL,NULL,NULL),(30,'2019-03-22 13:30:00','2019-03-22 15:30:00','5c91e73291a0d646862727',30,NULL,NULL,NULL,NULL),(31,'2019-03-20 14:00:00','2019-03-20 15:30:00','5c920a0ac5609347592609',31,NULL,NULL,NULL,NULL),(32,'2019-03-21 15:00:00','2019-03-21 19:00:00','5c920dfc5c4cc110091505',32,NULL,NULL,NULL,NULL),(33,'2019-03-20 08:00:00','2019-03-20 12:00:00','5c92675c2d4a0288427619',33,NULL,NULL,NULL,0.00),(34,'2019-03-20 17:00:00','2019-03-20 18:00:00','5c9267e543770383259290',34,NULL,NULL,NULL,NULL),(35,'2019-03-24 12:00:00','2019-03-24 13:00:00','5c97535dc149f934347606',35,NULL,NULL,NULL,NULL),(36,'2019-03-24 12:00:00','2019-03-24 13:00:00','5c9753d78a874654681898',36,NULL,NULL,NULL,NULL),(37,'2019-03-24 11:00:00','2019-03-24 12:00:00','5c97b93406bf2189480699',37,NULL,NULL,NULL,0.00),(38,'2019-03-25 09:00:00','2019-03-25 12:00:00','5c97b9d144d5b793231377',38,NULL,NULL,NULL,NULL),(39,'2019-03-25 13:00:00','2019-03-25 14:00:00','5c97bb2777828440945601',39,NULL,NULL,NULL,NULL),(40,'2019-03-25 14:00:00','2019-03-25 15:00:00','5c97bbd0dadb0920200946',40,NULL,NULL,NULL,NULL),(41,'2019-03-25 13:00:00','2019-03-25 14:00:00','5c97bbe85e2f1704958440',41,NULL,NULL,NULL,NULL),(42,'2019-03-25 13:00:00','2019-03-25 14:00:00','5c97bc9e96050931580518',42,NULL,NULL,NULL,NULL),(43,'2019-03-25 15:00:00','2019-03-25 16:00:00','5c97bd4bca30b498514982',43,NULL,NULL,NULL,NULL),(44,'2019-03-25 09:00:00','2019-03-25 10:00:00','5c988b233087c966862033',44,NULL,NULL,NULL,NULL),(45,'2019-03-25 14:00:00','2019-03-25 19:00:00','5c988b2fde7c1685334209',45,NULL,NULL,NULL,NULL),(46,'2019-03-25 09:00:00','2019-03-25 12:00:00','5c988b3f248a1034965500',46,NULL,NULL,NULL,NULL),(47,'2019-03-25 15:00:00','2019-03-25 18:00:00','5c988b622194a698305825',47,NULL,NULL,NULL,NULL),(48,'2019-03-25 08:00:00','2019-03-25 10:00:00','5c988b8e5fb43179530176',48,NULL,NULL,NULL,NULL),(49,'2019-03-25 10:00:00','2019-03-25 11:00:00','5c988bad10052669420167',49,NULL,NULL,NULL,NULL),(51,'2019-03-25 08:00:00','2019-03-25 14:00:00','5c988c10aa1be990781153',51,NULL,NULL,NULL,NULL),(52,'2019-03-26 10:00:00','2019-03-26 12:00:00','5c989b482af05123365188',52,NULL,NULL,NULL,NULL),(53,'2019-03-25 12:00:00','2019-03-25 13:00:00','5c989be627452331662055',53,NULL,NULL,NULL,NULL),(54,'2019-03-25 10:00:00','2019-03-25 14:00:00','5c989cfe795e5937889241',54,NULL,NULL,NULL,NULL),(55,'2019-03-26 08:00:00','2019-03-26 17:00:00','5c98a2ef603e8092421484',55,NULL,NULL,NULL,NULL),(56,'2019-03-25 11:00:00','2019-03-25 12:00:00','5c98ac998af64166462799',56,NULL,NULL,NULL,NULL),(57,'2019-02-25 07:00:00','2019-02-25 08:00:00','5c98ae440813b892533262',57,NULL,NULL,NULL,0.00),(58,'2019-03-04 07:00:00','2019-03-04 08:00:00','5c98ae4408263702292692',57,NULL,NULL,NULL,0.00),(59,'2019-03-25 12:00:00','2019-03-25 13:00:00','5c98aecd22f00712643944',58,NULL,NULL,NULL,NULL),(60,'2019-03-25 11:00:00','2019-03-25 12:00:00','5c98aed7af7ad757972838',59,NULL,NULL,NULL,NULL),(61,'2019-03-26 07:00:00','2019-03-26 08:00:00','5c98af73865dc511981568',60,NULL,NULL,NULL,NULL),(62,'2019-03-27 14:00:00','2019-03-27 14:00:00','5c98afd07b6dc797690112',61,NULL,NULL,'2019-05-14 14:00:00',0.00),(63,'2019-04-03 13:00:00','2019-04-03 14:00:00','5c98afd07b7fe057483564',61,NULL,NULL,'2019-05-21 14:00:00',NULL),(64,'2019-03-26 10:00:00','2019-03-26 11:00:00','5c98b2b5e208c985069694',62,NULL,NULL,NULL,NULL),(65,'2019-03-25 13:00:00','2019-03-25 14:00:00','5c98b5dfdbe71610968294',63,NULL,NULL,NULL,NULL),(66,'2019-03-26 12:00:00','2019-03-26 13:00:00','5c98b60d01779572872166',64,NULL,NULL,NULL,NULL),(67,'2019-03-27 09:00:00','2019-03-27 10:00:00','5c9b443b209b9133180647',65,NULL,NULL,NULL,NULL),(68,'2019-03-27 09:00:00','2019-03-27 10:00:00','5c9b452275fe0968004841',66,NULL,NULL,NULL,NULL),(69,'2019-03-27 11:00:00','2019-03-27 12:00:00','5c9b45a9ca3a7328625406',67,NULL,NULL,NULL,NULL),(70,'2019-03-28 12:00:00','2019-03-28 13:00:00','5c9bbc6fbd7a0864454048',68,NULL,NULL,NULL,NULL),(71,'2019-03-28 09:00:00','2019-03-28 15:00:00','5c9c898222a5d046092183',69,NULL,NULL,NULL,NULL),(72,'2019-03-28 09:30:00','2019-03-28 13:00:00','5c9c8b61d3821351874029',70,NULL,NULL,'2019-03-28 12:30:00',NULL),(73,'2019-04-01 08:00:00','2019-04-01 10:30:00','5ca1d291842fa709304179',71,NULL,NULL,NULL,NULL),(74,'2019-04-10 07:30:00','2019-04-10 08:00:00','5cad955f45cff626081962',72,NULL,NULL,NULL,NULL),(75,'2019-04-10 07:30:00','2019-04-10 08:00:00','5cad9ad4ece84263597033',73,NULL,NULL,NULL,NULL),(76,'2019-04-10 07:30:00','2019-04-10 08:00:00','5cad9d0854454875164208',74,NULL,NULL,NULL,NULL),(77,'2019-04-10 08:00:00','2019-04-10 08:30:00','5cad9e1b889ad510494907',75,NULL,NULL,NULL,NULL),(78,'2019-04-09 14:00:00','2019-04-09 17:00:00','5cadb928dc1e2310994560',76,NULL,NULL,NULL,0.00),(79,'2019-04-16 14:00:00','2019-04-16 17:00:00','5cadb928dd7a8283576723',76,NULL,NULL,NULL,NULL),(80,'2019-04-23 14:00:00','2019-04-23 17:00:00','5cadb928dd7b7759329869',76,NULL,NULL,NULL,NULL),(81,'2019-04-30 14:00:00','2019-04-30 17:00:00','5cadb928dd7bc491139746',76,NULL,NULL,NULL,NULL),(82,'2019-05-07 14:00:00','2019-05-07 17:00:00','5cadb928dd7c0362410809',76,NULL,NULL,NULL,NULL),(83,'2019-05-14 14:00:00','2019-05-14 17:00:00','5cadb928dd7c5936053242',76,NULL,NULL,NULL,NULL),(84,'2019-05-21 14:00:00','2019-05-21 17:00:00','5cadb928dd7cb335808028',76,NULL,NULL,NULL,NULL),(85,'2019-05-28 14:00:00','2019-05-28 17:00:00','5cadb928dd7d0741381610',76,NULL,NULL,NULL,NULL),(86,'2019-06-04 14:00:00','2019-06-04 17:00:00','5cadb928dd7d4596207603',76,NULL,NULL,NULL,NULL),(87,'2019-06-11 14:00:00','2019-06-11 17:00:00','5cadb928dd7d9523137958',76,NULL,NULL,NULL,NULL),(88,'2019-06-18 14:00:00','2019-06-18 17:00:00','5cadb928dd7dd601163165',76,NULL,NULL,NULL,NULL),(89,'2019-06-25 14:00:00','2019-06-25 17:00:00','5cadb928dd7e1004166784',76,NULL,NULL,NULL,NULL),(90,'2019-07-02 14:00:00','2019-07-02 17:00:00','5cadb928dd7e5637604531',76,NULL,NULL,NULL,NULL),(91,'2019-07-09 14:00:00','2019-07-09 17:00:00','5cadb928dd7eb149986762',76,NULL,NULL,NULL,NULL),(92,'2019-07-16 14:00:00','2019-07-16 17:00:00','5cadb928dd7f1658006445',76,NULL,NULL,NULL,NULL),(93,'2019-07-23 14:00:00','2019-07-23 17:00:00','5cadb928dd7f5810911516',76,NULL,NULL,NULL,NULL),(94,'2019-07-30 14:00:00','2019-07-30 17:00:00','5cadb928dd7f9294369052',76,NULL,NULL,NULL,NULL),(95,'2019-08-06 14:00:00','2019-08-06 17:00:00','5cadb928dd7fd816213629',76,NULL,NULL,NULL,NULL),(96,'2019-08-13 14:00:00','2019-08-13 17:00:00','5cadb928dd801044732852',76,NULL,NULL,NULL,NULL),(97,'2019-08-20 14:00:00','2019-08-20 17:00:00','5cadb928dd805712314390',76,NULL,NULL,NULL,NULL),(98,'2019-08-27 14:00:00','2019-08-27 17:00:00','5cadb928dd809475345139',76,NULL,NULL,NULL,NULL),(99,'2019-09-03 14:00:00','2019-09-03 17:00:00','5cadb928dd80f911685736',76,NULL,NULL,NULL,NULL),(100,'2019-09-10 14:00:00','2019-09-10 17:00:00','5cadb928dd815280374912',76,NULL,NULL,NULL,NULL),(101,'2019-09-17 14:00:00','2019-09-17 17:00:00','5cadb928dd819114776623',76,NULL,NULL,NULL,NULL),(102,'2019-09-24 14:00:00','2019-09-24 17:00:00','5cadb928dd81e248237022',76,NULL,NULL,NULL,NULL),(103,'2019-10-01 14:00:00','2019-10-01 17:00:00','5cadb928dd822768982727',76,NULL,NULL,NULL,NULL),(104,'2019-10-08 14:00:00','2019-10-08 17:00:00','5cadb928dd826025301081',76,NULL,NULL,NULL,NULL),(105,'2019-10-15 14:00:00','2019-10-15 17:00:00','5cadb928dd82a109993317',76,NULL,NULL,NULL,NULL),(106,'2019-10-22 14:00:00','2019-10-22 17:00:00','5cadb928dd82e021596298',76,NULL,NULL,NULL,NULL),(107,'2019-10-29 15:00:00','2019-10-29 18:00:00','5cadb928dd833114881975',76,NULL,NULL,NULL,NULL),(108,'2019-11-05 15:00:00','2019-11-05 18:00:00','5cadb928dd83a265640816',76,NULL,NULL,NULL,NULL),(109,'2019-11-12 15:00:00','2019-11-12 18:00:00','5cadb928dd83e946325610',76,NULL,NULL,NULL,NULL),(110,'2019-11-19 15:00:00','2019-11-19 18:00:00','5cadb928dd842293618293',76,NULL,NULL,NULL,NULL),(111,'2019-11-26 15:00:00','2019-11-26 18:00:00','5cadb928dd847523764674',76,NULL,NULL,NULL,NULL),(112,'2019-12-03 15:00:00','2019-12-03 18:00:00','5cadb928dd84a620401886',76,NULL,NULL,NULL,NULL),(113,'2019-12-10 15:00:00','2019-12-10 18:00:00','5cadb928dd84e452143603',76,NULL,NULL,NULL,NULL),(114,'2019-12-17 15:00:00','2019-12-17 18:00:00','5cadb928dd852754956807',76,NULL,NULL,NULL,NULL),(115,'2019-12-24 15:00:00','2019-12-24 18:00:00','5cadb928dd857778144869',76,NULL,NULL,NULL,NULL),(116,'2019-12-31 15:00:00','2019-12-31 18:00:00','5cadb928dd85e137879202',76,NULL,NULL,NULL,NULL),(117,'2020-01-07 15:00:00','2020-01-07 18:00:00','5cadb928dd862677473210',76,NULL,NULL,NULL,NULL),(118,'2020-01-14 15:00:00','2020-01-14 18:00:00','5cadb928dd866066677550',76,NULL,NULL,NULL,NULL),(119,'2020-01-21 15:00:00','2020-01-21 18:00:00','5cadb928dd86b409025818',76,NULL,NULL,NULL,NULL),(120,'2020-01-28 15:00:00','2020-01-28 18:00:00','5cadb928dd86f142179109',76,NULL,NULL,NULL,NULL),(121,'2020-02-04 15:00:00','2020-02-04 18:00:00','5cadb928dd873762687363',76,NULL,NULL,NULL,NULL),(122,'2020-02-11 15:00:00','2020-02-11 18:00:00','5cadb928dd877750499350',76,NULL,NULL,NULL,NULL),(123,'2020-02-18 15:00:00','2020-02-18 18:00:00','5cadb928dd87c974011280',76,NULL,NULL,NULL,NULL),(124,'2020-02-25 15:00:00','2020-02-25 18:00:00','5cadb928dd882066035672',76,NULL,NULL,NULL,NULL),(125,'2020-03-03 15:00:00','2020-03-03 18:00:00','5cadb928dd886730615750',76,NULL,NULL,NULL,NULL),(126,'2020-03-10 15:00:00','2020-03-10 18:00:00','5cadb928dd88a204396492',76,NULL,NULL,NULL,NULL),(127,'2020-03-17 15:00:00','2020-03-17 18:00:00','5cadb928dd88e460578655',76,NULL,NULL,NULL,NULL),(128,'2020-03-24 15:00:00','2020-03-24 18:00:00','5cadb928dd892830068291',76,NULL,NULL,NULL,NULL),(129,'2020-03-31 14:00:00','2020-03-31 17:00:00','5cadb928dd896118935407',76,NULL,NULL,NULL,NULL),(130,'2020-04-07 14:00:00','2020-04-07 17:00:00','5cadb928dd89b905920813',76,NULL,NULL,NULL,NULL),(131,'2020-04-14 14:00:00','2020-04-14 17:00:00','5cadb928dd8a0828492773',76,NULL,NULL,NULL,NULL),(132,'2020-04-21 14:00:00','2020-04-21 17:00:00','5cadb928dd8a6182063273',76,NULL,NULL,NULL,NULL),(133,'2020-04-28 14:00:00','2020-04-28 17:00:00','5cadb928dd8ab672470619',76,NULL,NULL,NULL,NULL),(134,'2020-05-05 14:00:00','2020-05-05 17:00:00','5cadb928dd8af524559196',76,NULL,NULL,NULL,NULL),(135,'2020-05-12 14:00:00','2020-05-12 17:00:00','5cadb928dd8b3084548996',76,NULL,NULL,NULL,NULL),(136,'2020-05-19 14:00:00','2020-05-19 17:00:00','5cadb928dd8b7559581175',76,NULL,NULL,NULL,NULL),(137,'2020-05-26 14:00:00','2020-05-26 17:00:00','5cadb928dd8bb808511631',76,NULL,NULL,NULL,NULL),(138,'2020-06-02 14:00:00','2020-06-02 17:00:00','5cadb928dd8bf517445613',76,NULL,NULL,NULL,NULL),(139,'2020-06-09 14:00:00','2020-06-09 17:00:00','5cadb928dd8c4304378750',76,NULL,NULL,NULL,NULL),(140,'2019-04-10 10:30:00','2019-04-10 11:00:00','5cadbf71e9afc804374637',77,NULL,NULL,NULL,NULL),(141,'2019-10-17 08:00:00','2019-10-17 13:30:00','5cadc63f5f4db998551103',78,NULL,NULL,NULL,NULL),(142,'2019-04-10 12:00:00','2019-04-10 17:00:00','5cadc67be7e07104205227',79,NULL,NULL,NULL,NULL),(143,'2019-04-12 10:30:00','2019-04-12 11:00:00','5cb03dd6d128c375934654',80,NULL,NULL,NULL,NULL),(144,'2019-04-12 12:00:00','2019-04-12 12:30:00','5cb056b0bf007745381660',81,NULL,NULL,NULL,NULL),(145,'2019-04-12 14:00:00','2019-04-12 14:30:00','5cb05f8c1fb0a904651146',82,NULL,NULL,NULL,NULL),(146,'2019-04-23 12:30:00','2019-04-23 13:00:00','5cbefabd3c1c6008919976',83,NULL,NULL,NULL,NULL),(147,'2019-04-23 13:30:00','2019-04-23 14:00:00','5cbefbc1b43a3200411912',84,NULL,NULL,NULL,NULL),(148,'2019-04-23 14:00:00','2019-04-23 14:30:00','5cbefd1199a50698886478',85,NULL,NULL,NULL,NULL),(149,'2019-04-23 14:30:00','2019-04-23 15:00:00','5cbf0003aa8c1299437898',86,NULL,NULL,NULL,NULL),(150,'2019-04-23 15:30:00','2019-04-23 16:00:00','5cbf00daa36fd027976022',87,NULL,NULL,NULL,NULL),(151,'2019-04-23 15:30:00','2019-04-23 16:00:00','5cbf01cda0428949490154',88,NULL,NULL,NULL,NULL),(152,'2019-04-23 17:00:00','2019-04-23 17:30:00','5cbf01fc97e7c708539145',89,NULL,NULL,NULL,NULL),(153,'2019-04-23 17:00:00','2019-04-23 17:30:00','5cbf032c2cc7a896240136',90,NULL,NULL,NULL,NULL),(154,'2019-04-23 17:00:00','2019-04-23 17:30:00','5cbf03e35549b722180482',91,NULL,NULL,NULL,NULL),(155,'2019-04-23 17:00:00','2019-04-23 17:30:00','5cbf0a90b6ee2220545248',92,NULL,NULL,NULL,NULL),(156,'2019-04-23 18:00:00','2019-04-23 18:30:00','5cbf0b0b7a4f3305467773',93,NULL,NULL,NULL,NULL),(157,'2019-04-23 18:00:00','2019-04-23 18:30:00','5cbf0d988dade942939246',94,NULL,NULL,NULL,NULL),(158,'2019-04-23 15:30:00','2019-04-23 16:00:00','5cbf3cc1758d9404927126',95,NULL,NULL,NULL,0.00),(159,'2019-04-23 18:00:00','2019-04-23 18:30:00','5cbf42fd2a7ad628149938',96,NULL,NULL,NULL,NULL),(160,'2019-04-23 18:00:00','2019-04-23 18:30:00','5cbf452ddbec6553639810',97,NULL,NULL,NULL,NULL),(161,'2019-04-23 18:00:00','2019-04-23 18:30:00','5cbf4607b1fb2284387182',98,NULL,NULL,NULL,NULL),(162,'2019-04-23 18:00:00','2019-04-23 18:30:00','5cbf464d5e70f958905786',99,NULL,NULL,NULL,NULL),(163,'2019-04-24 10:30:00','2019-04-24 11:00:00','5cbf478025157040001813',100,NULL,NULL,NULL,NULL),(164,'2019-04-24 13:30:00','2019-04-24 14:00:00','5cbf485b7d78d373337670',101,NULL,NULL,NULL,NULL),(165,'2019-04-24 13:30:00','2019-04-24 14:00:00','5cbf4973a23a8656730561',102,NULL,NULL,NULL,NULL),(166,'2019-04-24 14:30:00','2019-04-24 15:00:00','5cbf4ae340710018930720',103,NULL,NULL,NULL,NULL),(167,'2019-04-24 09:30:00','2019-04-24 12:30:00','5cbf4ffc8e8c1284286634',104,NULL,NULL,NULL,NULL),(168,'2019-04-24 14:30:00','2019-04-24 15:00:00','5cc00a58d2db2002958097',105,NULL,NULL,NULL,NULL),(169,'2019-04-24 15:30:00','2019-04-24 16:00:00','5cc00b6e99a0f433669192',106,NULL,NULL,NULL,NULL),(170,'2019-04-24 14:30:00','2019-04-24 15:00:00','5cc00b9c04311654372217',107,NULL,NULL,NULL,NULL),(171,'2019-04-24 15:00:00','2019-04-24 15:30:00','5cc00c4762c6c452500816',108,NULL,NULL,NULL,NULL),(172,'2019-04-24 16:00:00','2019-04-24 16:30:00','5cc023d443741237382133',109,NULL,NULL,NULL,NULL),(173,'2019-04-24 14:30:00','2019-04-24 15:00:00','5cc0595cee535965351598',110,NULL,NULL,NULL,NULL),(174,'2019-04-24 15:30:00','2019-04-24 16:00:00','5cc05a5f1d405510708364',111,NULL,NULL,NULL,NULL),(175,'2019-04-24 17:30:00','2019-04-24 18:00:00','5cc05a75e4b7c376320472',112,NULL,NULL,NULL,NULL),(176,'2019-04-25 13:30:00','2019-04-25 14:00:00','5cc05b88c5f2e477117569',113,NULL,NULL,NULL,NULL),(177,'2019-04-24 17:00:00','2019-04-24 17:30:00','5cc05e0bd2cee941485272',114,NULL,NULL,NULL,NULL),(178,'2019-04-24 16:30:00','2019-04-24 17:00:00','5cc0665829640276625010',115,NULL,NULL,NULL,NULL),(179,'2019-04-24 17:00:00','2019-04-24 17:30:00','5cc0666a7e3c6218156619',116,NULL,NULL,NULL,NULL),(180,'2019-04-24 17:00:00','2019-04-24 17:30:00','5cc067085d4a8194620057',117,NULL,NULL,NULL,NULL),(181,'2019-04-24 18:00:00','2019-04-24 18:30:00','5cc07d8c280bb090169186',118,NULL,NULL,NULL,NULL),(182,'2019-04-24 18:00:00','2019-04-24 18:30:00','5cc07db9ab501864268292',119,NULL,NULL,NULL,NULL),(183,'2019-04-24 17:00:00','2019-04-24 17:30:00','5cc07eb73297b038180996',120,NULL,NULL,NULL,NULL),(184,'2019-04-24 17:30:00','2019-04-24 18:00:00','5cc07ed0a4b7c409090370',121,NULL,NULL,NULL,NULL),(185,'2019-04-24 16:30:00','2019-04-24 17:00:00','5cc07f6c09f8d984585125',122,NULL,NULL,NULL,NULL),(186,'2019-04-25 14:30:00','2019-04-25 16:30:00','5cc1acf02bb81073968243',123,NULL,NULL,NULL,NULL),(187,'2019-04-26 07:30:00','2019-04-26 08:00:00','5cc1ad2112e10663399214',124,NULL,NULL,NULL,NULL),(188,'2019-04-26 07:00:00','2019-04-26 07:30:00','5cc1ad361ffa7020883520',125,NULL,NULL,NULL,NULL),(189,'2019-04-27 12:30:00','2019-04-27 13:00:00','5cc42ebfdbabd825270771',126,NULL,NULL,NULL,NULL),(190,'2019-04-29 08:00:00','2019-04-29 08:30:00','5cc46247aca4e208889041',127,NULL,NULL,NULL,NULL),(191,'2019-04-30 11:30:00','2019-04-30 12:00:00','5cc76f46aed9e351949753',128,NULL,NULL,NULL,NULL),(192,'2019-05-13 06:00:00','2019-05-13 06:30:00','5cd316b41c9f2687203969',129,NULL,NULL,NULL,NULL),(193,'2019-05-10 11:30:00','2019-05-10 12:00:00','5cd524ca57644984308356',130,NULL,NULL,NULL,NULL),(194,'2019-05-12 07:00:00','2019-05-12 13:00:00','5cd52929a36e5931991668',131,NULL,NULL,NULL,NULL),(195,'2019-05-10 12:00:00','2019-05-10 13:00:00','5cd531a857b28861904478',132,NULL,NULL,NULL,NULL),(196,'2019-05-10 09:00:00','2019-05-10 17:00:00','5cd532e13b02f456384887',133,NULL,NULL,NULL,NULL),(197,'2019-05-10 12:00:00','2019-05-10 12:30:00','5cd5376441b90233776356',134,NULL,NULL,NULL,NULL),(198,'2019-05-26 06:00:00','2019-08-25 13:30:00','5cd53af6a6009225619133',135,NULL,NULL,NULL,NULL),(199,'2019-05-10 09:00:00','2019-05-10 14:00:00','5cd53ccd985f3190698085',136,NULL,NULL,NULL,NULL),(200,'2019-05-13 06:00:00','2019-05-13 11:30:00','5cd5603c981bb882356719',137,NULL,NULL,NULL,NULL),(201,'2019-05-14 06:00:00','2019-05-14 11:30:00','5cd5603c9831a628159837',137,NULL,NULL,NULL,NULL),(202,'2019-05-15 06:00:00','2019-05-15 11:30:00','5cd5603c98321729851793',137,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `reservation_instances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_reminders`
--

DROP TABLE IF EXISTS `reservation_reminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation_reminders` (
  `reminder_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `series_id` int(10) unsigned NOT NULL,
  `minutes_prior` int(10) unsigned NOT NULL,
  `reminder_type` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY (`reminder_id`),
  KEY `series_id` (`series_id`),
  KEY `reminder_type` (`reminder_type`),
  CONSTRAINT `reservation_reminders_ibfk_1` FOREIGN KEY (`series_id`) REFERENCES `reservation_series` (`series_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_reminders`
--

LOCK TABLES `reservation_reminders` WRITE;
/*!40000 ALTER TABLE `reservation_reminders` DISABLE KEYS */;
INSERT INTO `reservation_reminders` VALUES (1,57,15,0),(2,60,15,0),(3,61,15,0),(4,72,25,0),(5,73,2,0),(6,75,15,0),(7,77,15,0),(8,128,15,0);
/*!40000 ALTER TABLE `reservation_reminders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_resources`
--

DROP TABLE IF EXISTS `reservation_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation_resources` (
  `series_id` int(10) unsigned NOT NULL,
  `resource_id` smallint(5) unsigned NOT NULL,
  `resource_level_id` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY (`series_id`,`resource_id`),
  KEY `resource_id` (`resource_id`),
  KEY `series_id` (`series_id`),
  CONSTRAINT `reservation_resources_ibfk_1` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`resource_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reservation_resources_ibfk_2` FOREIGN KEY (`series_id`) REFERENCES `reservation_series` (`series_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_resources`
--

LOCK TABLES `reservation_resources` WRITE;
/*!40000 ALTER TABLE `reservation_resources` DISABLE KEYS */;
INSERT INTO `reservation_resources` VALUES (1,32,1),(4,30,1),(9,30,1),(10,28,1),(12,34,1),(15,29,1),(26,24,1),(28,27,1),(29,48,1),(30,25,1),(31,24,1),(32,39,1),(32,40,2),(32,41,2),(32,42,2),(32,43,2),(32,44,2),(33,39,1),(33,40,2),(33,41,2),(33,42,2),(33,43,2),(33,44,2),(33,45,2),(33,46,2),(33,47,2),(34,24,1),(35,30,1),(36,25,1),(37,28,1),(38,24,1),(38,25,2),(38,27,2),(38,28,2),(39,25,1),(40,27,1),(41,29,1),(42,27,1),(43,29,1),(44,32,1),(45,32,1),(46,30,1),(47,26,1),(48,4,1),(49,4,1),(51,39,1),(51,40,2),(51,41,2),(51,42,2),(51,43,2),(51,44,2),(51,45,2),(51,46,2),(51,47,2),(52,24,1),(53,34,1),(54,39,1),(54,40,2),(54,41,2),(54,42,2),(54,43,2),(54,44,2),(55,33,1),(56,26,1),(57,25,1),(58,32,1),(59,32,1),(60,25,1),(61,25,1),(62,27,1),(63,30,1),(64,27,1),(65,27,1),(66,32,1),(67,29,1),(68,27,1),(69,27,1),(70,29,1),(71,27,1),(72,30,1),(73,29,1),(74,32,1),(75,29,1),(76,21,1),(77,31,1),(78,29,1),(79,32,1),(80,28,1),(81,33,1),(82,29,1),(83,31,1),(84,30,1),(85,33,1),(86,30,1),(87,30,1),(88,27,1),(89,27,1),(90,25,1),(91,29,1),(92,31,1),(93,29,1),(94,31,1),(95,33,1),(96,33,1),(97,25,1),(98,34,1),(99,27,1),(100,27,1),(101,29,1),(102,26,1),(103,26,1),(104,29,1),(105,28,1),(106,27,1),(107,30,1),(108,31,1),(109,31,1),(110,25,1),(111,33,1),(112,29,1),(113,26,1),(114,25,1),(115,29,1),(116,31,1),(117,32,1),(118,30,1),(119,33,1),(120,25,1),(121,26,1),(122,25,1),(123,32,1),(124,26,1),(125,26,1),(126,29,1),(127,35,1),(128,28,1),(129,29,1),(130,28,1),(131,39,1),(131,40,2),(131,41,2),(131,42,2),(131,43,2),(131,44,2),(131,45,2),(131,46,2),(131,47,2),(131,48,2),(131,57,2),(132,24,1),(133,39,1),(133,40,2),(133,41,2),(133,42,2),(133,43,2),(134,29,1),(135,1,1),(135,2,2),(135,3,2),(135,4,2),(135,5,2),(135,6,2),(135,7,2),(135,8,2),(135,9,2),(135,11,2),(135,12,2),(135,13,2),(135,15,2),(135,16,2),(135,17,2),(135,18,2),(135,19,2),(135,20,2),(136,1,1),(136,2,2),(136,3,2),(136,12,2),(137,11,1);
/*!40000 ALTER TABLE `reservation_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_series`
--

DROP TABLE IF EXISTS `reservation_series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation_series` (
  `series_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date_created` datetime NOT NULL,
  `last_modified` datetime DEFAULT NULL,
  `title` varchar(300) DEFAULT NULL,
  `description` text,
  `allow_participation` tinyint(1) unsigned NOT NULL,
  `allow_anon_participation` tinyint(1) unsigned NOT NULL,
  `type_id` tinyint(2) unsigned NOT NULL,
  `status_id` tinyint(2) unsigned NOT NULL,
  `repeat_type` varchar(10) DEFAULT NULL,
  `repeat_options` varchar(255) DEFAULT NULL,
  `owner_id` mediumint(8) unsigned NOT NULL,
  `legacyid` char(16) DEFAULT NULL,
  `last_action_by` mediumint(8) unsigned DEFAULT NULL,
  `terms_date_accepted` datetime DEFAULT NULL,
  PRIMARY KEY (`series_id`),
  KEY `type_id` (`type_id`),
  KEY `status_id` (`status_id`),
  KEY `reservations_owner` (`owner_id`),
  CONSTRAINT `reservations_owner` FOREIGN KEY (`owner_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `reservations_status` FOREIGN KEY (`status_id`) REFERENCES `reservation_statuses` (`status_id`) ON UPDATE CASCADE,
  CONSTRAINT `reservations_type` FOREIGN KEY (`type_id`) REFERENCES `reservation_types` (`type_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_series`
--

LOCK TABLES `reservation_series` WRITE;
/*!40000 ALTER TABLE `reservation_series` DISABLE KEYS */;
INSERT INTO `reservation_series` VALUES (1,'2019-03-19 08:42:23',NULL,'test','test',0,0,1,1,'none','',1,NULL,1,NULL),(4,'2019-03-19 10:52:54','2019-03-19 10:54:30','test 3','test 3',0,0,1,1,'none','',3,NULL,1,NULL),(9,'2019-03-19 11:24:54',NULL,'jsjsjs','isisiss',0,0,1,1,'none','',3,NULL,3,NULL),(10,'2019-03-19 11:25:05',NULL,'Hdhhd','Gdgdgdg',0,0,1,1,'none','',1,NULL,1,NULL),(12,'2019-03-19 11:27:34',NULL,'jsjsjsjs','jsjsjsjsjs',0,0,1,1,'none','',3,NULL,3,NULL),(15,'2019-03-19 11:42:13',NULL,'jshshshs','nsnsnssn',0,0,1,1,'none','',3,NULL,3,NULL),(26,'2019-03-19 12:09:40',NULL,'asas','asadas',0,0,1,1,'none','',3,NULL,3,NULL),(28,'2019-03-19 12:18:24','2019-03-19 12:19:29','efwe','wf',0,0,1,1,'none','',4,NULL,3,NULL),(29,'2019-03-19 20:19:45','2019-03-19 20:20:17','test','test',0,0,1,1,'none','',4,NULL,1,NULL),(30,'2019-03-20 07:09:38','2019-03-20 07:10:06','da','da',1,0,1,1,'none','',1,NULL,NULL,NULL),(31,'2019-03-20 09:38:18','2019-03-20 09:41:42','reunion de tercero','coordinacion',0,0,1,1,'none','',4,NULL,3,NULL),(32,'2019-03-20 09:55:08','2019-03-20 09:56:00','examen tinf','tinf',0,0,1,1,'none','',3,NULL,3,NULL),(33,'2019-03-20 16:16:28',NULL,'Examen Tinf','tinf',0,0,1,1,'none','',1,NULL,1,NULL),(34,'2019-03-20 16:18:45','2019-03-20 16:23:36','tets','test',0,0,1,2,'none','',8,NULL,1,NULL),(35,'2019-03-24 09:52:29','2019-03-24 09:59:24','test','test',0,0,1,1,'none','',4,NULL,3,NULL),(36,'2019-03-24 09:54:31',NULL,'test','test',0,0,1,1,'none','',3,NULL,3,NULL),(37,'2019-03-24 17:07:00',NULL,'test','',0,0,1,1,'none','',1,NULL,1,NULL),(38,'2019-03-24 17:09:37',NULL,'','',0,0,1,1,'none','',3,NULL,3,NULL),(39,'2019-03-24 17:15:19','2019-03-24 17:16:51','test','test',0,0,1,1,'none','',4,NULL,3,NULL),(40,'2019-03-24 17:18:08',NULL,'test','test',0,0,1,1,'none','',3,NULL,3,NULL),(41,'2019-03-24 17:18:32',NULL,'test','test',0,0,1,1,'none','',3,NULL,3,NULL),(42,'2019-03-24 17:21:34','2019-03-24 17:22:11','test','test',0,0,1,1,'none','',4,NULL,3,NULL),(43,'2019-03-24 17:24:27','2019-03-24 17:24:45','test','',0,0,1,1,'none','',4,NULL,3,NULL),(44,'2019-03-25 08:02:43',NULL,'reserva 01','',0,0,1,1,'none','',1,NULL,1,NULL),(45,'2019-03-25 08:02:55','2019-03-25 11:09:22','reserva 02','',0,0,1,2,'none','',1,NULL,1,NULL),(46,'2019-03-25 08:03:11',NULL,'reserva 03','',0,0,1,1,'none','',1,NULL,1,NULL),(47,'2019-03-25 08:03:46','2019-03-25 11:08:57','Reserva aulas ihjvsdjilfbvuisdfbvase','',0,0,1,1,'none','',1,NULL,1,NULL),(48,'2019-03-25 08:04:30',NULL,'Clase de Algebra','',0,0,1,1,'none','',1,NULL,1,NULL),(49,'2019-03-25 08:05:01',NULL,'Clase de Fisica 1','',0,0,1,1,'none','',1,NULL,1,NULL),(51,'2019-03-25 08:06:40','2019-03-25 08:07:03','','',0,0,1,2,'none','',1,NULL,1,NULL),(52,'2019-03-25 09:11:36','2019-03-25 09:13:18','Reunion de dirección','',0,0,1,1,'none','',4,NULL,3,NULL),(53,'2019-03-25 09:14:14','2019-03-25 09:14:40','Reunion','',0,0,1,2,'none','',4,NULL,3,NULL),(54,'2019-03-25 09:18:54',NULL,'Examen Tinf','',0,0,1,1,'none','',3,NULL,3,NULL),(55,'2019-03-25 09:44:15','2019-03-25 09:44:56','Satelec','',0,0,1,1,'none','',4,NULL,3,NULL),(56,'2019-03-25 10:25:29',NULL,'','',0,0,1,1,'none','',6,NULL,6,NULL),(57,'2019-03-25 10:32:36',NULL,'Curso de la Policía','Curso de la policía',1,0,1,1,'weekly','interval=1|termination=2019-03-04 23:00:00|days=1',9,NULL,9,NULL),(58,'2019-03-25 10:34:53',NULL,'','',0,0,1,1,'none','',1,NULL,1,NULL),(59,'2019-03-25 10:35:03',NULL,'test','',0,0,1,1,'none','',1,NULL,1,NULL),(60,'2019-03-25 10:37:39',NULL,'Prueba aula hp','eso',0,0,1,1,'none','',9,NULL,9,NULL),(61,'2019-03-25 10:39:12','2019-03-29 07:44:21','Reserva varios días aula hp','probando',0,0,1,1,'none','',9,NULL,9,NULL),(62,'2019-03-25 10:51:33',NULL,'test','',0,0,1,1,'none','',1,NULL,1,NULL),(63,'2019-03-25 11:05:03',NULL,'','',0,0,1,1,'none','',1,NULL,1,NULL),(64,'2019-03-25 11:05:49','2019-03-25 11:08:01','prueba','',0,0,1,1,'none','',4,NULL,1,NULL),(65,'2019-03-27 09:36:59',NULL,'','',0,0,1,1,'none','',1,NULL,1,NULL),(66,'2019-03-27 09:40:50',NULL,'Reserva con Documento','prueba',0,0,1,1,'none','',1,NULL,1,NULL),(67,'2019-03-27 09:43:05','2019-03-27 09:43:48','prueba de documento para adjuntar','prueba',0,0,1,1,'none','',4,NULL,1,NULL),(68,'2019-03-27 18:09:51','2019-03-27 18:10:47','prueba imagen notificacion mail','prueba imagen notificacion mail',0,0,1,2,'none','',4,NULL,1,NULL),(69,'2019-03-28 08:44:50','2019-03-28 08:45:29','Conferencia','',0,0,1,1,'none','',5,NULL,1,NULL),(70,'2019-03-28 08:52:49','2019-03-28 08:53:33','otra conferencia','',0,0,1,1,'none','',5,NULL,1,NULL),(71,'2019-04-01 08:57:53',NULL,'reunion','',0,0,1,1,'none','',5,NULL,5,NULL),(72,'2019-04-10 07:03:59','2019-04-10 09:11:41','prueba plantilla','',0,0,1,2,'none','',4,NULL,1,NULL),(73,'2019-04-10 07:27:17','2019-04-10 09:11:09','prueba plantilla mail','',0,0,1,2,'none','',4,NULL,1,NULL),(74,'2019-04-10 07:36:40','2019-04-10 09:11:30','','',0,0,1,2,'none','',1,NULL,1,NULL),(75,'2019-04-10 07:41:15','2019-04-10 09:11:20','prueba plantilla mail','',0,0,1,2,'none','',4,NULL,1,NULL),(76,'2019-04-10 09:36:41',NULL,'Seminarios de formación','Seminarios de formación - Programa de Doctorado del SSR',0,0,1,1,'weekly','interval=1|termination=2020-06-10 22:00:00|days=2',1,NULL,1,NULL),(77,'2019-04-10 10:03:30','2019-04-10 10:04:22','prueba plantilla mail','',0,0,1,1,'none','',4,NULL,1,NULL),(78,'2019-04-10 10:32:31',NULL,'','',0,0,1,1,'none','',5,NULL,5,NULL),(79,'2019-04-10 10:33:32','2019-04-11 10:23:49','prueba a reservar','',0,0,1,1,'none','',4,NULL,6,NULL),(80,'2019-04-12 07:27:18','2019-04-12 07:37:13','descripcio mensaje','',0,0,1,1,'none','',4,NULL,1,NULL),(81,'2019-04-12 09:13:20','2019-04-12 09:36:28','prueba label','',0,0,1,1,'none','',4,NULL,1,NULL),(82,'2019-04-12 09:51:08',NULL,'prueba','',0,0,1,1,'none','',1,NULL,1,NULL),(83,'2019-04-23 11:45:01','2019-04-23 11:53:50','prueba aprobacion','',0,0,1,1,'none','',4,NULL,6,NULL),(84,'2019-04-23 11:49:21','2019-04-23 11:53:57','prueba template','',0,0,1,1,'none','',4,NULL,6,NULL),(85,'2019-04-23 11:54:57',NULL,'prueba template','',0,0,1,1,'none','',1,NULL,1,NULL),(86,'2019-04-23 12:07:31','2019-04-23 12:07:57','prueba mensaje aprobado','',0,0,1,1,'none','',4,NULL,1,NULL),(87,'2019-04-23 12:11:06','2019-04-23 12:16:43','prueba no reservar','test',0,0,1,1,'none','',4,NULL,1,NULL),(88,'2019-04-23 12:15:09','2019-04-23 12:16:47','prueba 3','',0,0,1,1,'none','',4,NULL,1,NULL),(89,'2019-04-23 12:15:56','2019-04-23 12:16:52','prueba 44','',0,0,1,1,'none','',4,NULL,1,NULL),(90,'2019-04-23 12:21:00','2019-04-23 16:26:08','prueba 34','',0,0,1,1,'none','',4,NULL,1,NULL),(91,'2019-04-23 12:24:03','2019-04-23 16:26:12','aprobad','',0,0,1,1,'none','',4,NULL,1,NULL),(92,'2019-04-23 12:52:32','2019-04-23 16:26:15','prueba formulario final','',0,0,1,1,'none','',4,NULL,1,NULL),(93,'2019-04-23 12:54:35','2019-04-23 16:26:19','mail recepcion','',0,0,1,1,'none','',4,NULL,1,NULL),(94,'2019-04-23 13:05:28','2019-04-23 16:26:22','Prueba Reserva','Prueba formulario reserva',0,0,1,1,'none','',4,NULL,1,NULL),(95,'2019-04-23 16:26:41',NULL,'prueba admin','',0,0,1,1,'none','',1,NULL,1,NULL),(96,'2019-04-23 16:53:17','2019-04-23 17:08:15','prueba mail','',0,0,1,1,'none','',4,NULL,1,NULL),(97,'2019-04-23 17:02:37','2019-04-23 17:08:20','prueba email','',0,0,1,1,'none','',4,NULL,1,NULL),(98,'2019-04-23 17:06:15','2019-04-23 17:09:57','probando admin email','',0,0,1,1,'none','',4,NULL,1,NULL),(99,'2019-04-23 17:07:25','2019-04-23 17:11:38','prueba plantilla mail','',0,0,1,1,'none','',4,NULL,1,NULL),(100,'2019-04-23 17:12:32','2019-04-23 17:24:40','prueba plantilla mail','',0,0,1,1,'none','',4,NULL,1,NULL),(101,'2019-04-23 17:16:11','2019-04-24 13:16:23','prueba logo email','',0,0,1,1,'none','',4,NULL,1,NULL),(102,'2019-04-23 17:20:51','2019-04-23 17:27:35','prueba logo email','',0,0,1,1,'none','',4,NULL,1,NULL),(103,'2019-04-23 17:26:59','2019-04-23 17:27:39','prueba plantilla logo','',0,0,1,1,'none','',4,NULL,1,NULL),(104,'2019-04-23 17:48:44','2019-04-24 07:08:09','prueba','',0,0,1,1,'none','',5,NULL,1,NULL),(105,'2019-04-24 07:03:52','2019-04-24 07:13:29','prueba mensaje pop-up','',0,0,1,1,'none','',4,NULL,1,NULL),(106,'2019-04-24 07:08:30',NULL,'prueba 2','',0,0,1,1,'none','',1,NULL,1,NULL),(107,'2019-04-24 07:09:16','2019-04-24 07:13:33','prueba 22','',0,0,1,1,'none','',4,NULL,1,NULL),(108,'2019-04-24 07:12:07','2019-04-24 07:13:38','prueba 33','',0,0,1,1,'none','',4,NULL,1,NULL),(109,'2019-04-24 08:52:36','2019-04-24 12:37:06','prueba55','',0,0,1,1,'none','',4,NULL,1,NULL),(110,'2019-04-24 12:41:01','2019-04-24 12:49:09','prueba 55','',0,0,1,1,'none','',4,NULL,1,NULL),(111,'2019-04-24 12:45:19','2019-04-24 12:49:13','prueba 333','',0,0,1,1,'none','',4,NULL,1,NULL),(112,'2019-04-24 12:45:41',NULL,'prueba 66','',0,0,1,1,'none','',1,NULL,1,NULL),(113,'2019-04-24 12:50:16','2019-04-24 13:03:31','prueba 44','',0,0,1,1,'none','',4,NULL,1,NULL),(114,'2019-04-24 13:00:59','2019-04-24 13:42:14','prueba cambio imagen mail','',0,0,1,2,'none','',4,NULL,4,NULL),(115,'2019-04-24 13:36:24','2019-04-29 21:42:31','prueba 444','',0,0,1,1,'none','',4,NULL,3,NULL),(116,'2019-04-24 13:36:42','2019-04-24 13:40:11','prueba ee','',0,0,1,2,'none','',4,NULL,4,NULL),(117,'2019-04-24 13:39:20',NULL,'hshs','',0,0,1,3,'none','',4,NULL,4,NULL),(118,'2019-04-24 15:15:24',NULL,'prueba 33','',0,0,1,1,'none','',1,NULL,1,NULL),(119,'2019-04-24 15:16:09',NULL,'sososos','',0,0,1,3,'none','',4,NULL,4,NULL),(120,'2019-04-24 15:20:23',NULL,'rjeuvbdivdi','',0,0,1,3,'none','',4,NULL,4,NULL),(121,'2019-04-24 15:20:48',NULL,'progiif','',0,0,1,3,'none','',4,NULL,4,NULL),(122,'2019-04-24 15:23:24',NULL,'vdvdv','',0,0,1,3,'none','',4,NULL,4,NULL),(123,'2019-04-25 12:49:52',NULL,'prueba','',0,0,1,3,'none','',5,NULL,5,NULL),(124,'2019-04-25 12:50:41','2019-05-10 08:12:10','otra prueba','',0,0,1,1,'none','',5,NULL,11,NULL),(125,'2019-04-25 12:51:02','2019-04-25 12:51:39','otra cosa','',0,0,1,2,'none','',5,NULL,5,NULL),(126,'2019-04-27 10:28:15','2019-05-10 08:12:22','prueba solicitud actualizacion 2','',0,0,1,1,'none','',4,NULL,11,NULL),(127,'2019-04-27 14:08:07','2019-04-27 14:09:24','Prueba en casa','',0,0,1,1,'none','',4,NULL,3,NULL),(128,'2019-04-29 21:40:22',NULL,'Prueba','',0,0,1,3,'none','',4,NULL,4,NULL),(129,'2019-05-08 17:49:40','2019-05-10 08:21:36','Prueba','',0,0,1,2,'none','',4,NULL,11,NULL),(130,'2019-05-10 07:14:18','2019-05-10 08:20:51','Prueba Demo','Prueba',0,0,1,2,'none','',4,NULL,11,NULL),(131,'2019-05-10 07:32:57',NULL,'prueba de reserva de examenes','',0,0,1,1,'none','',11,NULL,11,NULL),(132,'2019-05-10 08:09:12','2019-05-10 08:43:25','Prueba demo 222','',0,0,1,1,'none','',4,NULL,6,NULL),(133,'2019-05-10 08:14:25',NULL,'prueba','',0,0,1,1,'none','',11,NULL,11,NULL),(134,'2019-05-10 08:33:40','2019-05-10 08:35:14','PRUEBA RESERVA','',0,0,1,1,'none','',4,NULL,6,NULL),(135,'2019-05-10 08:48:54','2019-05-10 08:57:53','pruebas','',0,0,1,1,'none','',11,NULL,11,NULL),(136,'2019-05-10 08:56:45',NULL,'','',0,0,1,1,'none','',6,NULL,6,NULL),(137,'2019-05-10 11:27:56',NULL,'Reunión subdirectores','Reunión subdirectores etsit',0,0,1,1,'daily','interval=1|termination=2019-05-14 22:00:00',6,NULL,6,NULL);
/*!40000 ALTER TABLE `reservation_series` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_statuses`
--

DROP TABLE IF EXISTS `reservation_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation_statuses` (
  `status_id` tinyint(2) unsigned NOT NULL,
  `label` varchar(85) NOT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_statuses`
--

LOCK TABLES `reservation_statuses` WRITE;
/*!40000 ALTER TABLE `reservation_statuses` DISABLE KEYS */;
INSERT INTO `reservation_statuses` VALUES (1,'Created'),(2,'Deleted'),(3,'Pending');
/*!40000 ALTER TABLE `reservation_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_types`
--

DROP TABLE IF EXISTS `reservation_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation_types` (
  `type_id` tinyint(2) unsigned NOT NULL,
  `label` varchar(85) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_types`
--

LOCK TABLES `reservation_types` WRITE;
/*!40000 ALTER TABLE `reservation_types` DISABLE KEYS */;
INSERT INTO `reservation_types` VALUES (1,'Reservation'),(2,'Blackout');
/*!40000 ALTER TABLE `reservation_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_users`
--

DROP TABLE IF EXISTS `reservation_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation_users` (
  `reservation_instance_id` int(10) unsigned NOT NULL,
  `user_id` mediumint(8) unsigned NOT NULL,
  `reservation_user_level` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY (`reservation_instance_id`,`user_id`),
  KEY `reservation_instance_id` (`reservation_instance_id`),
  KEY `user_id` (`user_id`),
  KEY `reservation_user_level` (`reservation_user_level`),
  CONSTRAINT `reservation_users_ibfk_1` FOREIGN KEY (`reservation_instance_id`) REFERENCES `reservation_instances` (`reservation_instance_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reservation_users_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_users`
--

LOCK TABLES `reservation_users` WRITE;
/*!40000 ALTER TABLE `reservation_users` DISABLE KEYS */;
INSERT INTO `reservation_users` VALUES (1,1,1),(4,3,1),(9,3,1),(10,1,1),(12,3,1),(15,3,1),(26,3,1),(28,4,1),(29,4,1),(30,1,1),(31,4,1),(32,3,1),(33,1,1),(34,8,1),(35,4,1),(36,3,1),(37,1,1),(38,3,1),(39,4,1),(40,3,1),(41,3,1),(42,4,1),(43,4,1),(44,1,1),(45,1,1),(46,1,1),(47,1,1),(48,1,1),(49,1,1),(51,1,1),(52,4,1),(53,4,1),(54,3,1),(55,4,1),(56,6,1),(57,9,1),(58,9,1),(59,1,1),(60,1,1),(61,9,1),(62,9,1),(63,9,1),(64,1,1),(65,1,1),(66,4,1),(67,1,1),(68,1,1),(69,4,1),(70,4,1),(71,5,1),(72,5,1),(73,5,1),(74,4,1),(75,4,1),(76,1,1),(77,4,1),(78,1,1),(79,1,1),(80,1,1),(81,1,1),(82,1,1),(83,1,1),(84,1,1),(85,1,1),(86,1,1),(87,1,1),(88,1,1),(89,1,1),(90,1,1),(91,1,1),(92,1,1),(93,1,1),(94,1,1),(95,1,1),(96,1,1),(97,1,1),(98,1,1),(99,1,1),(100,1,1),(101,1,1),(102,1,1),(103,1,1),(104,1,1),(105,1,1),(106,1,1),(107,1,1),(108,1,1),(109,1,1),(110,1,1),(111,1,1),(112,1,1),(113,1,1),(114,1,1),(115,1,1),(116,1,1),(117,1,1),(118,1,1),(119,1,1),(120,1,1),(121,1,1),(122,1,1),(123,1,1),(124,1,1),(125,1,1),(126,1,1),(127,1,1),(128,1,1),(129,1,1),(130,1,1),(131,1,1),(132,1,1),(133,1,1),(134,1,1),(135,1,1),(136,1,1),(137,1,1),(138,1,1),(139,1,1),(140,4,1),(141,5,1),(142,4,1),(143,4,1),(144,4,1),(145,1,1),(146,4,1),(147,4,1),(148,1,1),(149,4,1),(150,4,1),(151,4,1),(152,4,1),(153,4,1),(154,4,1),(155,4,1),(156,4,1),(157,4,1),(158,1,1),(159,4,1),(160,4,1),(161,4,1),(162,4,1),(163,4,1),(164,4,1),(165,4,1),(166,4,1),(167,5,1),(168,4,1),(169,1,1),(170,4,1),(171,4,1),(172,4,1),(173,4,1),(174,4,1),(175,1,1),(176,4,1),(177,4,1),(178,4,1),(179,4,1),(180,4,1),(181,1,1),(182,4,1),(183,4,1),(184,4,1),(185,4,1),(186,5,1),(187,5,1),(188,5,1),(189,4,1),(190,4,1),(191,4,1),(192,4,1),(193,4,1),(194,11,1),(195,4,1),(196,11,1),(197,4,1),(198,11,1),(199,6,1),(200,6,1),(201,6,1),(202,6,1),(30,4,2),(199,4,2),(200,7,2),(200,11,2),(201,7,2),(201,11,2),(202,7,2),(202,11,2),(30,3,3);
/*!40000 ALTER TABLE `reservation_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_waitlist_requests`
--

DROP TABLE IF EXISTS `reservation_waitlist_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation_waitlist_requests` (
  `reservation_waitlist_request_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL,
  `resource_id` smallint(5) unsigned NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  PRIMARY KEY (`reservation_waitlist_request_id`),
  KEY `user_id` (`user_id`),
  KEY `resource_id` (`resource_id`),
  CONSTRAINT `reservation_waitlist_requests_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `reservation_waitlist_requests_ibfk_2` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`resource_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_waitlist_requests`
--

LOCK TABLES `reservation_waitlist_requests` WRITE;
/*!40000 ALTER TABLE `reservation_waitlist_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation_waitlist_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_accessories`
--

DROP TABLE IF EXISTS `resource_accessories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_accessories` (
  `resource_accessory_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `resource_id` smallint(5) unsigned NOT NULL,
  `accessory_id` smallint(5) unsigned NOT NULL,
  `minimum_quantity` smallint(6) DEFAULT NULL,
  `maximum_quantity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`resource_accessory_id`),
  KEY `resource_id` (`resource_id`),
  KEY `accessory_id` (`accessory_id`),
  CONSTRAINT `resource_accessories_ibfk_1` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`resource_id`) ON DELETE CASCADE,
  CONSTRAINT `resource_accessories_ibfk_2` FOREIGN KEY (`accessory_id`) REFERENCES `accessories` (`accessory_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_accessories`
--

LOCK TABLES `resource_accessories` WRITE;
/*!40000 ALTER TABLE `resource_accessories` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_accessories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_group_assignment`
--

DROP TABLE IF EXISTS `resource_group_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_group_assignment` (
  `resource_group_id` mediumint(8) unsigned NOT NULL,
  `resource_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`resource_group_id`,`resource_id`),
  KEY `resource_group_assignment_resource_id` (`resource_id`),
  KEY `resource_group_assignment_resource_group_id` (`resource_group_id`),
  CONSTRAINT `resource_group_assignment_ibfk_1` FOREIGN KEY (`resource_group_id`) REFERENCES `resource_groups` (`resource_group_id`) ON DELETE CASCADE,
  CONSTRAINT `resource_group_assignment_ibfk_2` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`resource_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_group_assignment`
--

LOCK TABLES `resource_group_assignment` WRITE;
/*!40000 ALTER TABLE `resource_group_assignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_group_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_groups`
--

DROP TABLE IF EXISTS `resource_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_groups` (
  `resource_group_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `resource_group_name` varchar(75) DEFAULT NULL,
  `parent_id` mediumint(8) unsigned DEFAULT NULL,
  `public_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`resource_group_id`),
  KEY `resource_groups_parent_id` (`parent_id`),
  CONSTRAINT `resource_groups_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `resource_groups` (`resource_group_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_groups`
--

LOCK TABLES `resource_groups` WRITE;
/*!40000 ALTER TABLE `resource_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_images`
--

DROP TABLE IF EXISTS `resource_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_images` (
  `resource_image_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `resource_id` smallint(5) unsigned NOT NULL,
  `image_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`resource_image_id`),
  KEY `resource_id` (`resource_id`),
  CONSTRAINT `resource_images_ibfk_1` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`resource_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_images`
--

LOCK TABLES `resource_images` WRITE;
/*!40000 ALTER TABLE `resource_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_status_reasons`
--

DROP TABLE IF EXISTS `resource_status_reasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_status_reasons` (
  `resource_status_reason_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `status_id` tinyint(3) unsigned NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`resource_status_reason_id`),
  KEY `status_id` (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_status_reasons`
--

LOCK TABLES `resource_status_reasons` WRITE;
/*!40000 ALTER TABLE `resource_status_reasons` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_status_reasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_type_assignment`
--

DROP TABLE IF EXISTS `resource_type_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_type_assignment` (
  `resource_id` smallint(5) unsigned NOT NULL,
  `resource_type_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`resource_id`,`resource_type_id`),
  KEY `resource_type_id` (`resource_type_id`),
  CONSTRAINT `resource_type_assignment_ibfk_1` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`resource_id`) ON DELETE CASCADE,
  CONSTRAINT `resource_type_assignment_ibfk_2` FOREIGN KEY (`resource_type_id`) REFERENCES `resource_types` (`resource_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_type_assignment`
--

LOCK TABLES `resource_type_assignment` WRITE;
/*!40000 ALTER TABLE `resource_type_assignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_type_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_types`
--

DROP TABLE IF EXISTS `resource_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_types` (
  `resource_type_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `resource_type_name` varchar(75) DEFAULT NULL,
  `resource_type_description` text,
  PRIMARY KEY (`resource_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_types`
--

LOCK TABLES `resource_types` WRITE;
/*!40000 ALTER TABLE `resource_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resources`
--

DROP TABLE IF EXISTS `resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resources` (
  `resource_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(85) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `contact_info` varchar(255) DEFAULT NULL,
  `description` text,
  `notes` text,
  `min_duration` int(11) DEFAULT NULL,
  `min_increment` int(11) DEFAULT NULL,
  `max_duration` int(11) DEFAULT NULL,
  `unit_cost` decimal(7,2) DEFAULT NULL,
  `autoassign` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `requires_approval` tinyint(1) unsigned NOT NULL,
  `allow_multiday_reservations` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `max_participants` mediumint(8) unsigned DEFAULT NULL,
  `min_notice_time_add` int(11) DEFAULT NULL,
  `max_notice_time` int(11) DEFAULT NULL,
  `image_name` varchar(50) DEFAULT NULL,
  `schedule_id` smallint(5) unsigned NOT NULL,
  `legacyid` char(16) DEFAULT NULL,
  `admin_group_id` smallint(5) unsigned DEFAULT NULL,
  `public_id` varchar(20) DEFAULT NULL,
  `allow_calendar_subscription` tinyint(1) NOT NULL DEFAULT '0',
  `sort_order` smallint(5) unsigned DEFAULT NULL,
  `resource_type_id` mediumint(8) unsigned DEFAULT NULL,
  `status_id` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `resource_status_reason_id` smallint(5) unsigned DEFAULT NULL,
  `buffer_time` int(10) unsigned DEFAULT NULL,
  `enable_check_in` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `auto_release_minutes` smallint(5) unsigned DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  `allow_display` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `credit_count` decimal(7,2) unsigned DEFAULT NULL,
  `peak_credit_count` decimal(7,2) unsigned DEFAULT NULL,
  `min_notice_time_update` int(11) DEFAULT NULL,
  `min_notice_time_delete` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`resource_id`),
  UNIQUE KEY `public_id` (`public_id`),
  KEY `schedule_id` (`schedule_id`),
  KEY `admin_group_id` (`admin_group_id`),
  KEY `resource_type_id` (`resource_type_id`),
  KEY `resource_status_reason_id` (`resource_status_reason_id`),
  KEY `auto_release_minutes` (`auto_release_minutes`),
  CONSTRAINT `admin_group_id` FOREIGN KEY (`admin_group_id`) REFERENCES `groups` (`group_id`) ON DELETE SET NULL,
  CONSTRAINT `resources_ibfk_1` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`schedule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `resources_ibfk_2` FOREIGN KEY (`resource_type_id`) REFERENCES `resource_types` (`resource_type_id`) ON DELETE SET NULL,
  CONSTRAINT `resources_ibfk_3` FOREIGN KEY (`resource_status_reason_id`) REFERENCES `resource_status_reasons` (`resource_status_reason_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resources`
--

LOCK TABLES `resources` WRITE;
/*!40000 ALTER TABLE `resources` DISABLE KEYS */;
INSERT INTO `resources` VALUES (1,'A-112',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,27,NULL,NULL,NULL,4,NULL,7,NULL,0,0,NULL,1,NULL,NULL,0,NULL,'',0,0.00,0.00,NULL,NULL,'2019-03-19 07:44:01','2019-03-29 08:59:29'),(2,'A-120',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,78,NULL,NULL,NULL,4,NULL,7,NULL,0,0,NULL,1,NULL,NULL,0,NULL,'',0,0.00,0.00,NULL,NULL,'2019-03-19 07:44:47','2019-03-29 08:59:49'),(3,'A-122',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,86,NULL,NULL,NULL,4,NULL,7,NULL,0,0,NULL,1,NULL,NULL,0,NULL,'',0,0.00,0.00,NULL,NULL,'2019-03-19 07:45:04','2019-03-29 09:00:12'),(4,'A-123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,78,NULL,NULL,NULL,4,NULL,7,NULL,0,0,NULL,1,NULL,NULL,0,NULL,'',0,0.00,0.00,NULL,NULL,'2019-03-19 07:45:20','2019-03-29 09:00:31'),(5,'A-125',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,70,NULL,NULL,NULL,4,NULL,7,NULL,0,0,NULL,1,NULL,NULL,0,NULL,'',0,0.00,0.00,NULL,NULL,'2019-03-19 07:45:35','2019-03-29 09:00:39'),(6,'A-127.1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,NULL,NULL,NULL,NULL,4,NULL,7,NULL,0,0,NULL,1,NULL,NULL,0,NULL,'',0,0.00,0.00,NULL,NULL,'2019-03-19 07:45:53','2019-03-24 10:09:58'),(7,'A-128',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,119,NULL,NULL,NULL,4,NULL,7,NULL,0,0,NULL,1,NULL,NULL,0,NULL,'',0,0.00,0.00,NULL,NULL,'2019-03-19 07:46:13','2019-03-29 09:00:53'),(8,'A-129',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,9,NULL,NULL,NULL,4,NULL,7,NULL,0,0,NULL,1,NULL,NULL,0,NULL,'',0,0.00,0.00,NULL,NULL,'2019-03-19 07:46:26','2019-03-29 09:01:07'),(9,'A-130',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,11,NULL,NULL,NULL,4,NULL,7,NULL,0,0,NULL,1,NULL,NULL,0,NULL,'',0,0.00,0.00,NULL,NULL,'2019-03-19 07:46:50','2019-03-29 09:01:46'),(11,'A-131',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,11,NULL,NULL,NULL,4,NULL,7,NULL,0,0,NULL,1,NULL,NULL,0,NULL,'',0,0.00,0.00,NULL,NULL,'2019-03-19 07:47:57','2019-03-29 09:01:55'),(12,'A-133',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,75,NULL,NULL,NULL,4,NULL,7,NULL,0,0,NULL,1,NULL,NULL,0,NULL,'',0,0.00,0.00,NULL,NULL,'2019-03-19 07:48:08','2019-03-29 09:02:16'),(13,'A-134',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,75,NULL,NULL,NULL,4,NULL,7,NULL,0,0,NULL,1,NULL,NULL,0,NULL,'',0,0.00,0.00,NULL,NULL,'2019-03-19 07:48:18','2019-03-29 09:02:28'),(15,'A-135',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,75,NULL,NULL,NULL,4,NULL,7,NULL,0,0,NULL,1,NULL,NULL,0,NULL,'',0,0.00,0.00,NULL,NULL,'2019-03-19 07:49:22','2019-03-29 09:02:48'),(16,'A-136',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,132,NULL,NULL,NULL,4,NULL,7,NULL,0,0,NULL,1,NULL,NULL,0,NULL,'',0,0.00,0.00,NULL,NULL,'2019-03-19 07:49:30','2019-03-29 09:03:07'),(17,'A-137',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,75,NULL,NULL,NULL,4,NULL,7,NULL,0,0,NULL,1,NULL,NULL,0,NULL,'',0,0.00,0.00,NULL,NULL,'2019-03-19 07:49:44','2019-03-29 09:03:17'),(18,'A-138',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,75,NULL,NULL,NULL,4,NULL,7,NULL,0,0,NULL,1,NULL,NULL,0,NULL,'',0,0.00,0.00,NULL,NULL,'2019-03-19 07:49:51','2019-03-29 09:03:32'),(19,'A-139',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,75,NULL,NULL,NULL,4,NULL,7,NULL,0,0,NULL,1,NULL,NULL,0,NULL,'',0,0.00,0.00,NULL,NULL,'2019-03-19 07:49:58','2019-03-29 09:03:43'),(20,'A-140',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,75,NULL,NULL,NULL,4,NULL,7,NULL,0,0,NULL,1,NULL,NULL,0,NULL,'',0,0.00,0.00,NULL,NULL,'2019-03-19 07:50:10','2019-03-29 09:04:00'),(21,'A-141',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,48,NULL,NULL,NULL,4,NULL,7,NULL,0,0,NULL,1,NULL,NULL,0,NULL,'',0,0.00,0.00,NULL,NULL,'2019-03-19 07:50:20','2019-03-29 09:04:09'),(22,'SG A-128.1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,80,NULL,NULL,NULL,4,NULL,7,NULL,0,0,NULL,1,NULL,NULL,0,NULL,'',0,0.00,0.00,NULL,NULL,'2019-03-19 07:50:46','2019-03-29 09:11:11'),(23,'SJ A-128.2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,77,NULL,NULL,NULL,4,NULL,7,NULL,0,0,NULL,1,NULL,NULL,0,NULL,'',0,0.00,0.00,NULL,NULL,'2019-03-19 07:50:55','2019-03-29 09:11:23'),(24,'A-036',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,NULL,NULL,NULL,NULL,3,NULL,7,'3bacefb14d13879b5281',1,0,NULL,1,NULL,NULL,0,NULL,'',0,0.00,0.00,NULL,NULL,'2019-03-19 07:51:57','2019-04-03 11:01:10'),(25,'Aula HP A-037',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,57,NULL,NULL,NULL,3,NULL,11,NULL,0,0,NULL,1,NULL,NULL,0,NULL,'',0,0.00,0.00,NULL,NULL,'2019-03-19 07:52:11','2019-03-29 08:57:45'),(26,'A-102L1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,20,NULL,NULL,NULL,3,NULL,7,NULL,0,0,NULL,1,NULL,NULL,0,NULL,'',0,0.00,0.00,NULL,NULL,'2019-03-19 07:52:26','2019-03-29 08:58:13'),(27,'A-102L2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,20,NULL,NULL,NULL,3,NULL,7,NULL,0,0,NULL,1,NULL,NULL,0,NULL,'',0,0.00,0.00,NULL,NULL,'2019-03-19 07:52:38','2019-03-29 08:58:30'),(28,'A-102L3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,20,NULL,NULL,NULL,3,NULL,7,NULL,0,0,NULL,1,NULL,NULL,0,NULL,'',0,0.00,0.00,NULL,NULL,'2019-03-19 07:52:52','2019-03-29 08:58:42'),(29,'A-102L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,63,NULL,NULL,NULL,3,NULL,7,NULL,0,0,NULL,1,NULL,NULL,0,NULL,'',0,0.00,0.00,NULL,NULL,'2019-03-19 07:53:23','2019-03-29 08:58:57'),(30,'A-102L5',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,98,NULL,NULL,NULL,3,NULL,7,NULL,0,0,NULL,1,NULL,NULL,0,NULL,'',0,0.00,0.00,NULL,NULL,'2019-03-19 07:53:36','2019-03-29 08:59:09'),(31,'A-AMG',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,156,NULL,NULL,NULL,3,NULL,7,NULL,0,0,NULL,1,NULL,NULL,0,NULL,'',0,0.00,0.00,NULL,NULL,'2019-03-19 07:54:21','2019-03-29 09:05:52'),(32,'A-HAL.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,NULL,NULL,NULL,NULL,3,NULL,7,NULL,0,0,NULL,1,NULL,NULL,0,NULL,'',0,0.00,0.00,NULL,NULL,'2019-03-19 07:54:32','2019-03-24 10:09:58'),(33,'A-HAL.01',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,NULL,NULL,NULL,NULL,3,NULL,7,NULL,0,0,NULL,1,NULL,NULL,0,NULL,'',0,0.00,0.00,NULL,NULL,'2019-03-19 07:54:47','2019-03-24 10:09:58'),(34,'SAA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,270,NULL,NULL,NULL,3,NULL,7,NULL,0,0,NULL,1,NULL,NULL,0,NULL,'',0,0.00,0.00,NULL,NULL,'2019-03-19 07:54:59','2019-03-29 09:10:39'),(35,'A-202',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,57,NULL,NULL,NULL,5,NULL,7,NULL,0,0,NULL,1,NULL,NULL,0,NULL,'',0,0.00,0.00,NULL,NULL,'2019-03-19 07:56:26','2019-03-29 09:04:27'),(36,'A-204',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,64,NULL,NULL,NULL,5,NULL,12,NULL,0,0,NULL,1,NULL,NULL,0,NULL,'',0,0.00,0.00,NULL,NULL,'2019-03-19 07:56:37','2019-03-29 09:04:55'),(37,'A-206',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,68,NULL,NULL,NULL,5,NULL,7,NULL,0,0,NULL,1,NULL,NULL,0,NULL,'',0,0.00,0.00,NULL,NULL,'2019-03-19 07:56:48','2019-03-29 09:05:20'),(38,'A-301',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,120,NULL,NULL,NULL,5,NULL,7,NULL,0,0,NULL,1,NULL,NULL,0,NULL,'',0,0.00,0.00,NULL,NULL,'2019-03-19 07:57:01','2019-03-29 09:05:40'),(39,'B-01',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,116,NULL,NULL,NULL,6,NULL,7,NULL,0,0,NULL,1,NULL,NULL,0,NULL,'',0,0.00,0.00,NULL,NULL,'2019-03-19 07:58:23','2019-03-29 09:06:08'),(40,'B-02',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,116,NULL,NULL,NULL,6,NULL,7,NULL,0,0,NULL,1,NULL,NULL,0,NULL,'',0,0.00,0.00,NULL,NULL,'2019-03-19 07:59:08','2019-03-29 09:06:23'),(41,'B-03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,116,NULL,NULL,NULL,6,NULL,7,NULL,0,0,NULL,1,NULL,NULL,0,NULL,'',0,0.00,0.00,NULL,NULL,'2019-03-19 07:59:18','2019-03-29 09:06:30'),(42,'B-04',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,116,NULL,NULL,NULL,6,NULL,7,NULL,0,0,NULL,1,NULL,NULL,0,NULL,'',0,0.00,0.00,NULL,NULL,'2019-03-19 07:59:27','2019-03-29 09:06:40'),(43,'B-05',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,110,NULL,NULL,NULL,6,NULL,7,NULL,0,0,NULL,1,NULL,NULL,0,NULL,'',0,0.00,0.00,NULL,NULL,'2019-03-19 07:59:34','2019-03-29 09:06:53'),(44,'B-06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,55,NULL,NULL,NULL,6,NULL,7,NULL,0,0,NULL,1,NULL,NULL,0,NULL,'',0,0.00,0.00,NULL,NULL,'2019-03-19 07:59:42','2019-03-29 09:07:09'),(45,'B-07',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,55,NULL,NULL,NULL,6,NULL,7,NULL,0,0,NULL,1,NULL,NULL,0,NULL,'',0,0.00,0.00,NULL,NULL,'2019-03-19 07:59:53','2019-03-29 09:07:13'),(46,'B-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,55,NULL,NULL,NULL,6,NULL,7,NULL,0,0,NULL,1,NULL,NULL,0,NULL,'',0,0.00,0.00,NULL,NULL,'2019-03-19 08:00:03','2019-03-29 09:07:18'),(47,'B-10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,104,NULL,NULL,NULL,6,NULL,7,NULL,0,0,NULL,1,NULL,NULL,0,NULL,'',0,0.00,0.00,NULL,NULL,'2019-03-19 08:00:12','2019-03-29 09:08:41'),(48,'B-11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,30,NULL,NULL,NULL,6,NULL,7,NULL,0,0,NULL,1,NULL,NULL,0,NULL,'',0,0.00,0.00,NULL,NULL,'2019-03-19 08:00:23','2019-03-29 09:08:50'),(49,'B-221',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,32,NULL,NULL,NULL,6,NULL,7,NULL,0,0,NULL,1,NULL,NULL,0,NULL,'',0,0.00,0.00,NULL,NULL,'2019-03-19 08:00:35','2019-03-29 09:09:07'),(50,'B-223',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,36,NULL,NULL,NULL,6,NULL,7,NULL,0,0,NULL,1,NULL,NULL,0,NULL,'',0,0.00,0.00,NULL,NULL,'2019-03-19 08:00:46','2019-03-29 09:09:26'),(51,'C-Antesala',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,NULL,NULL,NULL,NULL,8,NULL,7,NULL,0,0,NULL,1,NULL,NULL,0,NULL,'',0,0.00,0.00,NULL,NULL,'2019-03-19 08:01:57','2019-03-24 10:09:58'),(52,'Piano',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,NULL,NULL,NULL,NULL,8,NULL,7,NULL,0,0,NULL,1,NULL,NULL,0,NULL,'',0,0.00,0.00,NULL,NULL,'2019-03-19 08:02:05','2019-03-24 10:09:58'),(53,'SAC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,192,NULL,NULL,NULL,8,NULL,7,NULL,0,0,NULL,1,NULL,NULL,0,NULL,'',0,0.00,0.00,NULL,NULL,'2019-03-19 08:02:20','2019-03-29 09:10:56'),(54,'SPC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,75,NULL,NULL,NULL,8,NULL,7,NULL,0,0,NULL,1,NULL,NULL,0,NULL,'',0,0.00,0.00,NULL,NULL,'2019-03-19 08:02:28','2019-03-29 09:11:37'),(55,'Vestíbulo C',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,NULL,NULL,NULL,NULL,8,NULL,7,NULL,0,0,NULL,1,NULL,NULL,0,NULL,'',0,0.00,0.00,NULL,NULL,'2019-03-19 08:02:45','2019-03-24 10:09:59'),(56,'D-214',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,NULL,NULL,NULL,NULL,7,NULL,7,NULL,0,0,NULL,1,NULL,NULL,0,NULL,'',0,0.00,0.00,NULL,NULL,'2019-03-19 08:03:37','2019-03-24 10:09:58'),(57,'B-09',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,55,NULL,NULL,NULL,6,NULL,7,NULL,0,0,NULL,1,NULL,NULL,0,NULL,'',0,0.00,0.00,NULL,NULL,'2019-03-29 09:07:52','2019-03-29 09:08:10'),(58,'B-222',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,32,NULL,NULL,NULL,6,NULL,7,NULL,0,0,NULL,1,NULL,NULL,0,NULL,'',0,0.00,0.00,NULL,NULL,'2019-03-29 09:09:46','2019-03-29 09:10:00'),(59,'HALL MITAD 1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,NULL,NULL,NULL,NULL,3,NULL,7,NULL,0,0,NULL,1,NULL,NULL,0,NULL,'',0,0.00,0.00,NULL,NULL,'2019-05-10 08:40:59','2019-05-11 17:57:38');
/*!40000 ALTER TABLE `resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `role_id` tinyint(2) unsigned NOT NULL,
  `name` varchar(85) DEFAULT NULL,
  `role_level` tinyint(2) unsigned DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Group Admin',1),(2,'Application Admin',2),(3,'Resource Admin',3),(4,'Schedule Admin',4);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saved_reports`
--

DROP TABLE IF EXISTS `saved_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `saved_reports` (
  `saved_report_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `report_name` varchar(50) DEFAULT NULL,
  `user_id` mediumint(8) unsigned NOT NULL,
  `date_created` datetime NOT NULL,
  `report_details` varchar(500) NOT NULL,
  PRIMARY KEY (`saved_report_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `saved_reports_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saved_reports`
--

LOCK TABLES `saved_reports` WRITE;
/*!40000 ALTER TABLE `saved_reports` DISABLE KEYS */;
INSERT INTO `saved_reports` VALUES (1,'prueba demo',11,'2019-05-10 07:22:05','usage=RESOURCES;selection=LIST;groupby=NONE;range=ALL_TIME;range_start=0001-01-01 00:00:00;range_end=9999-01-01 00:00:00;resourceid=;scheduleid=;userid=;groupid=;accessoryid=;participantid=;deleted=;resourceTypeId=');
/*!40000 ALTER TABLE `saved_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedules`
--

DROP TABLE IF EXISTS `schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedules` (
  `schedule_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(85) NOT NULL,
  `isdefault` tinyint(1) unsigned NOT NULL,
  `weekdaystart` tinyint(2) unsigned NOT NULL,
  `daysvisible` tinyint(2) unsigned NOT NULL DEFAULT '7',
  `layout_id` mediumint(8) unsigned NOT NULL,
  `legacyid` char(16) DEFAULT NULL,
  `public_id` varchar(20) DEFAULT NULL,
  `allow_calendar_subscription` tinyint(1) NOT NULL DEFAULT '0',
  `admin_group_id` smallint(5) unsigned DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `allow_concurrent_bookings` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `default_layout` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`schedule_id`),
  UNIQUE KEY `public_id` (`public_id`),
  KEY `layout_id` (`layout_id`),
  KEY `schedules_groups_admin_group_id` (`admin_group_id`),
  CONSTRAINT `schedules_groups_admin_group_id` FOREIGN KEY (`admin_group_id`) REFERENCES `groups` (`group_id`) ON DELETE SET NULL,
  CONSTRAINT `schedules_ibfk_1` FOREIGN KEY (`layout_id`) REFERENCES `layouts` (`layout_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedules`
--

LOCK TABLES `schedules` WRITE;
/*!40000 ALTER TABLE `schedules` DISABLE KEYS */;
INSERT INTO `schedules` VALUES (3,'Edificio A Planta 0',1,100,7,16,NULL,NULL,0,11,NULL,NULL,0,0),(4,'Edficio A Planta 1',0,100,7,15,NULL,NULL,0,11,NULL,NULL,0,0),(5,'Edificio A Planta 2 y 3',0,100,7,17,NULL,NULL,0,11,NULL,NULL,0,0),(6,'Edificio B',0,100,7,18,NULL,NULL,0,11,NULL,NULL,0,0),(7,'Edificio D',0,100,7,19,NULL,NULL,0,11,NULL,NULL,0,0),(8,'Recursos Extra',0,100,7,20,NULL,NULL,0,11,NULL,NULL,0,0);
/*!40000 ALTER TABLE `schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terms_of_service`
--

DROP TABLE IF EXISTS `terms_of_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `terms_of_service` (
  `terms_of_service_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `terms_text` text,
  `terms_url` varchar(255) DEFAULT NULL,
  `terms_file` varchar(50) DEFAULT NULL,
  `applicability` varchar(50) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`terms_of_service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terms_of_service`
--

LOCK TABLES `terms_of_service` WRITE;
/*!40000 ALTER TABLE `terms_of_service` DISABLE KEYS */;
/*!40000 ALTER TABLE `terms_of_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_blocks`
--

DROP TABLE IF EXISTS `time_blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_blocks` (
  `block_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(85) DEFAULT NULL,
  `end_label` varchar(85) DEFAULT NULL,
  `availability_code` tinyint(2) unsigned NOT NULL,
  `layout_id` mediumint(8) unsigned NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `day_of_week` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`block_id`),
  KEY `layout_id` (`layout_id`),
  CONSTRAINT `time_blocks_ibfk_1` FOREIGN KEY (`layout_id`) REFERENCES `layouts` (`layout_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=331 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_blocks`
--

LOCK TABLES `time_blocks` WRITE;
/*!40000 ALTER TABLE `time_blocks` DISABLE KEYS */;
INSERT INTO `time_blocks` VALUES (163,NULL,NULL,2,15,'00:00:00','08:00:00',NULL),(164,NULL,NULL,1,15,'08:00:00','08:30:00',NULL),(165,NULL,NULL,1,15,'08:30:00','09:00:00',NULL),(166,NULL,NULL,1,15,'09:00:00','09:30:00',NULL),(167,NULL,NULL,1,15,'09:30:00','10:00:00',NULL),(168,NULL,NULL,1,15,'10:00:00','10:30:00',NULL),(169,NULL,NULL,1,15,'10:30:00','11:00:00',NULL),(170,NULL,NULL,1,15,'11:00:00','11:30:00',NULL),(171,NULL,NULL,1,15,'11:30:00','12:00:00',NULL),(172,NULL,NULL,1,15,'12:00:00','12:30:00',NULL),(173,NULL,NULL,1,15,'12:30:00','13:00:00',NULL),(174,NULL,NULL,1,15,'13:00:00','13:30:00',NULL),(175,NULL,NULL,1,15,'13:30:00','14:00:00',NULL),(176,NULL,NULL,1,15,'14:00:00','14:30:00',NULL),(177,NULL,NULL,1,15,'14:30:00','15:00:00',NULL),(178,NULL,NULL,1,15,'15:00:00','15:30:00',NULL),(179,NULL,NULL,1,15,'15:30:00','16:00:00',NULL),(180,NULL,NULL,1,15,'16:00:00','16:30:00',NULL),(181,NULL,NULL,1,15,'16:30:00','17:00:00',NULL),(182,NULL,NULL,1,15,'17:00:00','17:30:00',NULL),(183,NULL,NULL,1,15,'17:30:00','18:00:00',NULL),(184,NULL,NULL,1,15,'18:00:00','18:30:00',NULL),(185,NULL,NULL,1,15,'18:30:00','19:00:00',NULL),(186,NULL,NULL,1,15,'19:00:00','19:30:00',NULL),(187,NULL,NULL,1,15,'19:30:00','20:00:00',NULL),(188,NULL,NULL,1,15,'20:00:00','20:30:00',NULL),(189,NULL,NULL,1,15,'20:30:00','21:00:00',NULL),(190,NULL,NULL,2,15,'21:00:00','00:00:00',NULL),(191,NULL,NULL,2,16,'00:00:00','08:00:00',NULL),(192,NULL,NULL,1,16,'08:00:00','08:30:00',NULL),(193,NULL,NULL,1,16,'08:30:00','09:00:00',NULL),(194,NULL,NULL,1,16,'09:00:00','09:30:00',NULL),(195,NULL,NULL,1,16,'09:30:00','10:00:00',NULL),(196,NULL,NULL,1,16,'10:00:00','10:30:00',NULL),(197,NULL,NULL,1,16,'10:30:00','11:00:00',NULL),(198,NULL,NULL,1,16,'11:00:00','11:30:00',NULL),(199,NULL,NULL,1,16,'11:30:00','12:00:00',NULL),(200,NULL,NULL,1,16,'12:00:00','12:30:00',NULL),(201,NULL,NULL,1,16,'12:30:00','13:00:00',NULL),(202,NULL,NULL,1,16,'13:00:00','13:30:00',NULL),(203,NULL,NULL,1,16,'13:30:00','14:00:00',NULL),(204,NULL,NULL,1,16,'14:00:00','14:30:00',NULL),(205,NULL,NULL,1,16,'14:30:00','15:00:00',NULL),(206,NULL,NULL,1,16,'15:00:00','15:30:00',NULL),(207,NULL,NULL,1,16,'15:30:00','16:00:00',NULL),(208,NULL,NULL,1,16,'16:00:00','16:30:00',NULL),(209,NULL,NULL,1,16,'16:30:00','17:00:00',NULL),(210,NULL,NULL,1,16,'17:00:00','17:30:00',NULL),(211,NULL,NULL,1,16,'17:30:00','18:00:00',NULL),(212,NULL,NULL,1,16,'18:00:00','18:30:00',NULL),(213,NULL,NULL,1,16,'18:30:00','19:00:00',NULL),(214,NULL,NULL,1,16,'19:00:00','19:30:00',NULL),(215,NULL,NULL,1,16,'19:30:00','20:00:00',NULL),(216,NULL,NULL,1,16,'20:00:00','20:30:00',NULL),(217,NULL,NULL,1,16,'20:30:00','21:00:00',NULL),(218,NULL,NULL,2,16,'21:00:00','00:00:00',NULL),(219,NULL,NULL,2,17,'00:00:00','08:00:00',NULL),(220,NULL,NULL,1,17,'08:00:00','08:30:00',NULL),(221,NULL,NULL,1,17,'08:30:00','09:00:00',NULL),(222,NULL,NULL,1,17,'09:00:00','09:30:00',NULL),(223,NULL,NULL,1,17,'09:30:00','10:00:00',NULL),(224,NULL,NULL,1,17,'10:00:00','10:30:00',NULL),(225,NULL,NULL,1,17,'10:30:00','11:00:00',NULL),(226,NULL,NULL,1,17,'11:00:00','11:30:00',NULL),(227,NULL,NULL,1,17,'11:30:00','12:00:00',NULL),(228,NULL,NULL,1,17,'12:00:00','12:30:00',NULL),(229,NULL,NULL,1,17,'12:30:00','13:00:00',NULL),(230,NULL,NULL,1,17,'13:00:00','13:30:00',NULL),(231,NULL,NULL,1,17,'13:30:00','14:00:00',NULL),(232,NULL,NULL,1,17,'14:00:00','14:30:00',NULL),(233,NULL,NULL,1,17,'14:30:00','15:00:00',NULL),(234,NULL,NULL,1,17,'15:00:00','15:30:00',NULL),(235,NULL,NULL,1,17,'15:30:00','16:00:00',NULL),(236,NULL,NULL,1,17,'16:00:00','16:30:00',NULL),(237,NULL,NULL,1,17,'16:30:00','17:00:00',NULL),(238,NULL,NULL,1,17,'17:00:00','17:30:00',NULL),(239,NULL,NULL,1,17,'17:30:00','18:00:00',NULL),(240,NULL,NULL,1,17,'18:00:00','18:30:00',NULL),(241,NULL,NULL,1,17,'18:30:00','19:00:00',NULL),(242,NULL,NULL,1,17,'19:00:00','19:30:00',NULL),(243,NULL,NULL,1,17,'19:30:00','20:00:00',NULL),(244,NULL,NULL,1,17,'20:00:00','20:30:00',NULL),(245,NULL,NULL,1,17,'20:30:00','21:00:00',NULL),(246,NULL,NULL,2,17,'21:00:00','00:00:00',NULL),(247,NULL,NULL,2,18,'00:00:00','08:00:00',NULL),(248,NULL,NULL,1,18,'08:00:00','08:30:00',NULL),(249,NULL,NULL,1,18,'08:30:00','09:00:00',NULL),(250,NULL,NULL,1,18,'09:00:00','09:30:00',NULL),(251,NULL,NULL,1,18,'09:30:00','10:00:00',NULL),(252,NULL,NULL,1,18,'10:00:00','10:30:00',NULL),(253,NULL,NULL,1,18,'10:30:00','11:00:00',NULL),(254,NULL,NULL,1,18,'11:00:00','11:30:00',NULL),(255,NULL,NULL,1,18,'11:30:00','12:00:00',NULL),(256,NULL,NULL,1,18,'12:00:00','12:30:00',NULL),(257,NULL,NULL,1,18,'12:30:00','13:00:00',NULL),(258,NULL,NULL,1,18,'13:00:00','13:30:00',NULL),(259,NULL,NULL,1,18,'13:30:00','14:00:00',NULL),(260,NULL,NULL,1,18,'14:00:00','14:30:00',NULL),(261,NULL,NULL,1,18,'14:30:00','15:00:00',NULL),(262,NULL,NULL,1,18,'15:00:00','15:30:00',NULL),(263,NULL,NULL,1,18,'15:30:00','16:00:00',NULL),(264,NULL,NULL,1,18,'16:00:00','16:30:00',NULL),(265,NULL,NULL,1,18,'16:30:00','17:00:00',NULL),(266,NULL,NULL,1,18,'17:00:00','17:30:00',NULL),(267,NULL,NULL,1,18,'17:30:00','18:00:00',NULL),(268,NULL,NULL,1,18,'18:00:00','18:30:00',NULL),(269,NULL,NULL,1,18,'18:30:00','19:00:00',NULL),(270,NULL,NULL,1,18,'19:00:00','19:30:00',NULL),(271,NULL,NULL,1,18,'19:30:00','20:00:00',NULL),(272,NULL,NULL,1,18,'20:00:00','20:30:00',NULL),(273,NULL,NULL,1,18,'20:30:00','21:00:00',NULL),(274,NULL,NULL,2,18,'21:00:00','00:00:00',NULL),(275,NULL,NULL,2,19,'00:00:00','08:00:00',NULL),(276,NULL,NULL,1,19,'08:00:00','08:30:00',NULL),(277,NULL,NULL,1,19,'08:30:00','09:00:00',NULL),(278,NULL,NULL,1,19,'09:00:00','09:30:00',NULL),(279,NULL,NULL,1,19,'09:30:00','10:00:00',NULL),(280,NULL,NULL,1,19,'10:00:00','10:30:00',NULL),(281,NULL,NULL,1,19,'10:30:00','11:00:00',NULL),(282,NULL,NULL,1,19,'11:00:00','11:30:00',NULL),(283,NULL,NULL,1,19,'11:30:00','12:00:00',NULL),(284,NULL,NULL,1,19,'12:00:00','12:30:00',NULL),(285,NULL,NULL,1,19,'12:30:00','13:00:00',NULL),(286,NULL,NULL,1,19,'13:00:00','13:30:00',NULL),(287,NULL,NULL,1,19,'13:30:00','14:00:00',NULL),(288,NULL,NULL,1,19,'14:00:00','14:30:00',NULL),(289,NULL,NULL,1,19,'14:30:00','15:00:00',NULL),(290,NULL,NULL,1,19,'15:00:00','15:30:00',NULL),(291,NULL,NULL,1,19,'15:30:00','16:00:00',NULL),(292,NULL,NULL,1,19,'16:00:00','16:30:00',NULL),(293,NULL,NULL,1,19,'16:30:00','17:00:00',NULL),(294,NULL,NULL,1,19,'17:00:00','17:30:00',NULL),(295,NULL,NULL,1,19,'17:30:00','18:00:00',NULL),(296,NULL,NULL,1,19,'18:00:00','18:30:00',NULL),(297,NULL,NULL,1,19,'18:30:00','19:00:00',NULL),(298,NULL,NULL,1,19,'19:00:00','19:30:00',NULL),(299,NULL,NULL,1,19,'19:30:00','20:00:00',NULL),(300,NULL,NULL,1,19,'20:00:00','20:30:00',NULL),(301,NULL,NULL,1,19,'20:30:00','21:00:00',NULL),(302,NULL,NULL,2,19,'21:00:00','00:00:00',NULL),(303,NULL,NULL,2,20,'00:00:00','08:00:00',NULL),(304,NULL,NULL,1,20,'08:00:00','08:30:00',NULL),(305,NULL,NULL,1,20,'08:30:00','09:00:00',NULL),(306,NULL,NULL,1,20,'09:00:00','09:30:00',NULL),(307,NULL,NULL,1,20,'09:30:00','10:00:00',NULL),(308,NULL,NULL,1,20,'10:00:00','10:30:00',NULL),(309,NULL,NULL,1,20,'10:30:00','11:00:00',NULL),(310,NULL,NULL,1,20,'11:00:00','11:30:00',NULL),(311,NULL,NULL,1,20,'11:30:00','12:00:00',NULL),(312,NULL,NULL,1,20,'12:00:00','12:30:00',NULL),(313,NULL,NULL,1,20,'12:30:00','13:00:00',NULL),(314,NULL,NULL,1,20,'13:00:00','13:30:00',NULL),(315,NULL,NULL,1,20,'13:30:00','14:00:00',NULL),(316,NULL,NULL,1,20,'14:00:00','14:30:00',NULL),(317,NULL,NULL,1,20,'14:30:00','15:00:00',NULL),(318,NULL,NULL,1,20,'15:00:00','15:30:00',NULL),(319,NULL,NULL,1,20,'15:30:00','16:00:00',NULL),(320,NULL,NULL,1,20,'16:00:00','16:30:00',NULL),(321,NULL,NULL,1,20,'16:30:00','17:00:00',NULL),(322,NULL,NULL,1,20,'17:00:00','17:30:00',NULL),(323,NULL,NULL,1,20,'17:30:00','18:00:00',NULL),(324,NULL,NULL,1,20,'18:00:00','18:30:00',NULL),(325,NULL,NULL,1,20,'18:30:00','19:00:00',NULL),(326,NULL,NULL,1,20,'19:00:00','19:30:00',NULL),(327,NULL,NULL,1,20,'19:30:00','20:00:00',NULL),(328,NULL,NULL,1,20,'20:00:00','20:30:00',NULL),(329,NULL,NULL,1,20,'20:30:00','21:00:00',NULL),(330,NULL,NULL,2,20,'21:00:00','00:00:00',NULL);
/*!40000 ALTER TABLE `time_blocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_email_preferences`
--

DROP TABLE IF EXISTS `user_email_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_email_preferences` (
  `user_id` mediumint(8) unsigned NOT NULL,
  `event_category` varchar(45) NOT NULL,
  `event_type` varchar(45) NOT NULL,
  PRIMARY KEY (`user_id`,`event_category`,`event_type`),
  CONSTRAINT `user_email_preferences_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_email_preferences`
--

LOCK TABLES `user_email_preferences` WRITE;
/*!40000 ALTER TABLE `user_email_preferences` DISABLE KEYS */;
INSERT INTO `user_email_preferences` VALUES (4,'reservation','approved'),(4,'reservation','created'),(4,'reservation','deleted'),(4,'reservation','series_ending'),(4,'reservation','updated'),(5,'reservation','approved'),(5,'reservation','created'),(5,'reservation','deleted'),(5,'reservation','series_ending'),(5,'reservation','updated'),(6,'reservation','approved'),(6,'reservation','created'),(6,'reservation','deleted'),(6,'reservation','series_ending'),(6,'reservation','updated'),(7,'reservation','approved'),(7,'reservation','created'),(7,'reservation','deleted'),(7,'reservation','series_ending'),(7,'reservation','updated'),(8,'reservation','approved'),(8,'reservation','created'),(8,'reservation','deleted'),(8,'reservation','series_ending'),(8,'reservation','updated'),(9,'reservation','approved'),(9,'reservation','created'),(9,'reservation','deleted'),(9,'reservation','series_ending'),(9,'reservation','updated'),(10,'reservation','approved'),(10,'reservation','created'),(10,'reservation','deleted'),(10,'reservation','series_ending'),(10,'reservation','updated'),(11,'reservation','approved'),(11,'reservation','created'),(11,'reservation','deleted'),(11,'reservation','series_ending'),(11,'reservation','updated');
/*!40000 ALTER TABLE `user_email_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_groups`
--

DROP TABLE IF EXISTS `user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_groups` (
  `user_id` mediumint(8) unsigned NOT NULL,
  `group_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`user_id`),
  KEY `user_id` (`user_id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `user_groups_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_groups_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_groups`
--

LOCK TABLES `user_groups` WRITE;
/*!40000 ALTER TABLE `user_groups` DISABLE KEYS */;
INSERT INTO `user_groups` VALUES (3,7),(6,7),(11,7),(1,8),(1,10),(3,10),(4,10),(5,10),(6,10),(7,10),(8,10),(9,10),(10,10),(11,10);
/*!40000 ALTER TABLE `user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_preferences`
--

DROP TABLE IF EXISTS `user_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_preferences` (
  `user_preferences_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `value` text,
  PRIMARY KEY (`user_preferences_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_preferences_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_preferences`
--

LOCK TABLES `user_preferences` WRITE;
/*!40000 ALTER TABLE `user_preferences` DISABLE KEYS */;
INSERT INTO `user_preferences` VALUES (1,1,'CalendarFilter','||'),(2,3,'CalendarFilter','||'),(4,3,'FilterStartDateDelta','-7'),(5,3,'FilterEndDateDelta','7'),(6,3,'FilterUserId',''),(7,3,'FilterUserName',''),(8,3,'FilterScheduleId','0'),(9,3,'FilterResourceId','0'),(10,3,'FilterReservationStatusId','3'),(11,3,'FilterReferenceNumber',NULL),(12,3,'FilterResourceStatusId',''),(13,3,'FilterResourceReasonId',''),(14,3,'FilterCustomAttributes','a:0:{}'),(15,3,'FilterTitle',''),(16,3,'FilterDescription',''),(17,3,'FilterMissedCheckin','0'),(18,3,'FilterMissedCheckout','0'),(19,4,'CalendarFilter','||'),(20,1,'FilterStartDateDelta','-7'),(21,1,'FilterEndDateDelta','6'),(22,1,'FilterUserId',''),(23,1,'FilterUserName',''),(24,1,'FilterScheduleId','3'),(25,1,'FilterResourceId','0'),(26,1,'FilterReservationStatusId','3'),(27,1,'FilterReferenceNumber',NULL),(28,1,'FilterResourceStatusId',''),(29,1,'FilterResourceReasonId',''),(30,1,'FilterCustomAttributes','a:2:{i:5;s:0:\"\";i:3;s:0:\"\";}'),(31,1,'FilterTitle',''),(32,1,'FilterDescription',''),(33,1,'FilterMissedCheckin','0'),(34,1,'FilterMissedCheckout','0'),(35,6,'CalendarFilter','||'),(36,9,'CalendarFilter','25|3|'),(37,9,'FilterStartDateDelta','-7'),(38,9,'FilterEndDateDelta','2'),(39,9,'FilterUserId',''),(40,9,'FilterUserName',''),(41,9,'FilterScheduleId','0'),(42,9,'FilterResourceId','0'),(43,9,'FilterReservationStatusId','0'),(44,9,'FilterReferenceNumber',NULL),(45,9,'FilterResourceStatusId',''),(46,9,'FilterResourceReasonId',''),(47,9,'FilterCustomAttributes','a:0:{}'),(48,9,'FilterTitle',''),(49,9,'FilterDescription',''),(50,9,'FilterMissedCheckin','0'),(51,9,'FilterMissedCheckout','0'),(52,11,'CalendarFilter','43|6|'),(53,11,'FilterStartDateDelta','-14'),(54,11,'FilterEndDateDelta','14'),(55,11,'FilterUserId',''),(56,11,'FilterUserName',''),(57,11,'FilterScheduleId','0'),(58,11,'FilterResourceId','0'),(59,11,'FilterReservationStatusId','3'),(60,11,'FilterReferenceNumber',NULL),(61,11,'FilterResourceStatusId',''),(62,11,'FilterResourceReasonId',''),(63,11,'FilterCustomAttributes','a:3:{i:5;s:0:\"\";i:7;s:0:\"\";i:8;s:0:\"\";}'),(64,11,'FilterTitle',''),(65,11,'FilterDescription',''),(66,11,'FilterMissedCheckin','0'),(67,11,'FilterMissedCheckout','0'),(68,6,'FilterStartDateDelta','-7'),(69,6,'FilterEndDateDelta','7'),(70,6,'FilterUserId',''),(71,6,'FilterUserName',''),(72,6,'FilterScheduleId','0'),(73,6,'FilterResourceId','0'),(74,6,'FilterReservationStatusId','3'),(75,6,'FilterReferenceNumber',NULL),(76,6,'FilterResourceStatusId',''),(77,6,'FilterResourceReasonId',''),(78,6,'FilterCustomAttributes','a:3:{i:5;s:0:\"\";i:7;s:0:\"\";i:8;s:0:\"\";}'),(79,6,'FilterTitle',''),(80,6,'FilterDescription',''),(81,6,'FilterMissedCheckin','0'),(82,6,'FilterMissedCheckout','0');
/*!40000 ALTER TABLE `user_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_resource_permissions`
--

DROP TABLE IF EXISTS `user_resource_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_resource_permissions` (
  `user_id` mediumint(8) unsigned NOT NULL,
  `resource_id` smallint(5) unsigned NOT NULL,
  `permission_id` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `permission_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`resource_id`),
  KEY `user_id` (`user_id`),
  KEY `resource_id` (`resource_id`),
  KEY `user_id_2` (`user_id`),
  KEY `resource_id_2` (`resource_id`),
  CONSTRAINT `user_resource_permissions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_resource_permissions_ibfk_2` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`resource_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_resource_permissions`
--

LOCK TABLES `user_resource_permissions` WRITE;
/*!40000 ALTER TABLE `user_resource_permissions` DISABLE KEYS */;
INSERT INTO `user_resource_permissions` VALUES (1,47,1,0);
/*!40000 ALTER TABLE `user_resource_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_session`
--

DROP TABLE IF EXISTS `user_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_session` (
  `user_session_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL,
  `last_modified` datetime NOT NULL,
  `session_token` varchar(50) NOT NULL,
  `user_session_value` text NOT NULL,
  PRIMARY KEY (`user_session_id`),
  KEY `user_session_user_id` (`user_id`),
  KEY `user_session_session_token` (`session_token`),
  CONSTRAINT `user_session_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_session`
--

LOCK TABLES `user_session` WRITE;
/*!40000 ALTER TABLE `user_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_statuses`
--

DROP TABLE IF EXISTS `user_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_statuses` (
  `status_id` tinyint(2) unsigned NOT NULL,
  `description` varchar(85) DEFAULT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_statuses`
--

LOCK TABLES `user_statuses` WRITE;
/*!40000 ALTER TABLE `user_statuses` DISABLE KEYS */;
INSERT INTO `user_statuses` VALUES (1,'Active'),(2,'Awaiting'),(3,'Inactive');
/*!40000 ALTER TABLE `user_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `fname` varchar(85) DEFAULT NULL,
  `lname` varchar(85) DEFAULT NULL,
  `username` varchar(85) DEFAULT NULL,
  `email` varchar(85) NOT NULL,
  `password` varchar(85) NOT NULL,
  `salt` varchar(85) NOT NULL,
  `organization` varchar(85) DEFAULT NULL,
  `position` varchar(85) DEFAULT NULL,
  `phone` varchar(85) DEFAULT NULL,
  `timezone` varchar(85) NOT NULL,
  `language` varchar(10) NOT NULL,
  `homepageid` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `date_created` datetime NOT NULL,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lastlogin` datetime DEFAULT NULL,
  `status_id` tinyint(2) unsigned NOT NULL,
  `legacyid` char(16) DEFAULT NULL,
  `legacypassword` varchar(32) DEFAULT NULL,
  `public_id` varchar(20) DEFAULT NULL,
  `allow_calendar_subscription` tinyint(1) NOT NULL DEFAULT '0',
  `default_schedule_id` smallint(5) unsigned DEFAULT NULL,
  `credit_count` decimal(7,2) DEFAULT '0.00',
  `terms_date_accepted` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `public_id` (`public_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `user_statuses` (`status_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'David','Higuera Ferrez','admin','david.higuera.ferrez@alumnos.upm.es','6e10c359d03a30a81a585edddd3cf286ec8245ec','58300aa4','','','','Europe/Zurich','es',2,'2019-03-19 07:30:05','2019-05-13 10:36:46','2019-05-13 12:36:46',1,NULL,NULL,'da5dd1a4e8911798e15f',0,NULL,0.00,NULL),(3,'David','me','admin-reservas','david.higuera.ferrez@me.com','532437499a37f405b6348f11df55adfcfdc0de0d','11ee5ff7','','','','Europe/Paris','es',2,'2019-03-19 10:52:31','2019-05-10 07:57:56','2019-05-10 09:57:56',1,NULL,NULL,'7a7f5f1375091c11b97a',0,NULL,0.00,NULL),(4,'david','higuera','user01','david.higuera.ferrez@gmail.com','6d74a7e784121066d34ec3c8a71a37303aa5b731','697c7f2c','','','','Europe/Paris','es',2,'2019-03-19 12:18:08','2019-05-11 15:56:33','2019-05-11 17:56:33',1,NULL,NULL,'b3721fe2d8a2909c6d0a',0,NULL,0.00,NULL),(5,'Gabriel','Huecas','Gabriel','gabrielhuecas@gmail.com','5a962c1c746603d26468e6b9dc9a1098d2888122','1a6b6445','','','','Europe/Paris','es',2,'2019-03-20 10:05:38','2019-04-25 10:49:20','2019-04-25 12:49:20',1,NULL,NULL,'b028f9c003eb545844d9',0,NULL,0.00,NULL),(6,'Julia','Guzmán','Julia Guzmán G.','julia.guzman.galvez@upm.es','37e17a08d32226a29989f7780069a8ad570145bb','0c811fb3','ETSIT','Medios Audiovisuales-Gestor de eventos','','Europe/Madrid','es',2,'2019-03-20 12:26:16','2019-05-10 09:26:02','2019-05-10 11:26:02',1,NULL,NULL,'35fe78c6f7c7392b404a',0,NULL,0.00,NULL),(7,'Guest','Guest','david.higuera.ferrez@hotmail.com','david.higuera.ferrez@hotmail.com','1b0101c68393c5aeeda5bf098e4f06388c7c2a3f','3b895882',NULL,NULL,NULL,'Europe/Paris','es',2,'2019-03-20 16:07:29','2019-03-20 16:22:02','2019-03-20 16:07:31',1,NULL,NULL,'c254a51b5667bb071ae5',0,NULL,0.00,NULL),(8,'Guest','Guest','david.higuera.ferrez@test.com','david.higuera.ferrez@test.com','055a8d4a10b0b8339d0f58d0dad2ae44fdff1c49','4e62c077',NULL,NULL,NULL,'Europe/Paris','es',2,'2019-03-20 16:18:33','2019-03-20 16:22:02','2019-03-20 16:18:35',1,NULL,NULL,'403f73823925e6ed5e25',0,NULL,0.00,NULL),(9,'Basilio','Fernandez','basi','basilio.fernandez@upm.es','1c4f508e328b0006f8b24cf14a18bb1e33f4b84c','2ff6e170','','','','Europe/Paris','es',2,'2019-03-25 10:28:41','2019-04-02 07:03:22','2019-04-02 09:03:22',1,NULL,NULL,'2816cedcafd4bbcca18b',0,NULL,0.00,NULL),(10,'Basilio','Fernandez','Basi01','basitron@gmail.com','64ebecedbcc7bba8c7e7dc2a5aac5c4a3b5562d5','7db00ec0','','','','Europe/Paris','es',2,'2019-03-29 09:14:35','2019-05-10 07:08:29',NULL,1,NULL,NULL,NULL,0,NULL,0.00,NULL),(11,'Irene','Gabaldón','Irene Gabaldón','ilerena@etsit.upm.es','478ad9b37a2464a28dad973e193ead39cc1e097d','119281cc','SUBDIRECCION','','71906','Europe/Paris','es',2,'2019-05-10 06:59:24','2019-05-10 08:02:07','2019-05-10 10:02:07',1,NULL,NULL,'8e3b828483018754131d',0,NULL,0.00,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-13 14:53:52
