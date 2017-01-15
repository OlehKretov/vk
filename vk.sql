-- MySQL dump 10.13  Distrib 5.5.50, for Win32 (x86)
--
-- Host: localhost    Database: vk
-- ------------------------------------------------------
-- Server version	5.5.50

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
-- Table structure for table `community`
--

DROP TABLE IF EXISTS `community`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `community` (
  `communityid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`communityid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `community`
--

LOCK TABLES `community` WRITE;
/*!40000 ALTER TABLE `community` DISABLE KEYS */;
INSERT INTO `community` VALUES (1,'Kinomaniya'),(2,'Sarkazm'),(3,'Korporatsia Zla'),(4,'Borshch'),(5,'Muzyka'),(6,'Live');
/*!40000 ALTER TABLE `community` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact` (
  `contactid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `surname` varchar(50) DEFAULT NULL,
  `gender` enum('man','female') DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `countryid` int(11) NOT NULL,
  `sityid` int(11) NOT NULL,
  PRIMARY KEY (`contactid`),
  KEY `fk_country_contact` (`countryid`),
  KEY `fk_sity_contact` (`sityid`),
  CONSTRAINT `fk_country_contact` FOREIGN KEY (`countryid`) REFERENCES `country` (`countryid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sity_contact` FOREIGN KEY (`sityid`) REFERENCES `sity` (`sityid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` VALUES (4,'Petr','Petrov','man','1983-07-11','0957384213','ppetr@gmail.com',1,2),(5,'Ivanna','Ivanova','female','1990-12-03','0993444816','iivanna@gmail.com',1,3),(6,'Svetlana','Sidorova','female','1984-10-24','0985964824','sidsvet@ya.ru',3,4),(7,'Vasiliy','Pupkin','man','1991-01-06','0996137373','pupvas@ya.ru',4,5);
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_community`
--

DROP TABLE IF EXISTS `contact_community`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_community` (
  `concomid` int(11) NOT NULL AUTO_INCREMENT,
  `contactid` int(11) NOT NULL,
  `communityid` int(11) NOT NULL,
  PRIMARY KEY (`concomid`),
  KEY `fk_contact_community` (`contactid`),
  KEY `fk_community_contact` (`communityid`),
  CONSTRAINT `fk_contact_community` FOREIGN KEY (`contactid`) REFERENCES `contact` (`contactid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_community_contact` FOREIGN KEY (`communityid`) REFERENCES `community` (`communityid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_community`
--

LOCK TABLES `contact_community` WRITE;
/*!40000 ALTER TABLE `contact_community` DISABLE KEYS */;
INSERT INTO `contact_community` VALUES (1,4,1),(2,4,2),(3,5,1),(4,5,3),(5,5,4),(6,6,4),(7,6,1),(8,6,5),(9,7,1),(10,7,6);
/*!40000 ALTER TABLE `contact_community` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `countryid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`countryid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'Ukraine'),(3,'Russia'),(4,'Canada');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `images` (
  `imagesid` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `contactid` int(11) NOT NULL,
  PRIMARY KEY (`imagesid`),
  KEY `fk_contact_images` (`contactid`),
  CONSTRAINT `fk_contact_images` FOREIGN KEY (`contactid`) REFERENCES `contact` (`contactid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (1,'https://vk.com/photo-6566_4099',4),(2,'https://vk.com/photo-6556_4469',4),(3,'https://vk.com/photo-12456_48459',4),(4,'https://vk.com/photo-12246_4129',5),(5,'https://vk.com/photo-8996_1125',5),(6,'https://vk.com/photo-2576_1525',6),(7,'https://vk.com/photo-1265_65174',6),(8,'https://vk.com/photo-5877_93624',6),(9,'https://vk.com/photo-2257_6547',7);
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sity`
--

DROP TABLE IF EXISTS `sity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sity` (
  `sityid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `countryid` int(11) NOT NULL,
  PRIMARY KEY (`sityid`),
  KEY `fk_country_sity` (`countryid`),
  CONSTRAINT `fk_country_sity` FOREIGN KEY (`countryid`) REFERENCES `country` (`countryid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sity`
--

LOCK TABLES `sity` WRITE;
/*!40000 ALTER TABLE `sity` DISABLE KEYS */;
INSERT INTO `sity` VALUES (2,'Kharkov',1),(3,'Kiev',1),(4,'Moscow',3),(5,'Toronto',4);
/*!40000 ALTER TABLE `sity` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-01-16  0:40:10
