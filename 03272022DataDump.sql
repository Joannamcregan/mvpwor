CREATE DATABASE  IF NOT EXISTS `mvp` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mvp`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: mvp
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authors` (
  `AuthorID` int NOT NULL AUTO_INCREMENT,
  `AuthorName` varchar(200) NOT NULL,
  `DOB` datetime DEFAULT NULL,
  `DOD` datetime DEFAULT NULL COMMENT 'Include date of death for authors whose works are in the public domain',
  `IsDeactivated` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`AuthorID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (1,'Jane Austen','1775-12-16 00:00:00','1817-07-18 00:00:00',0),(2,'William Shakespeare',NULL,'1616-04-23 00:00:00',0),(3,'Alexandre Dumas','1802-07-24 00:00:00','1870-12-05 00:00:00',0),(4,'Charlotte Bronte','1816-04-21 00:00:00','1855-03-31 00:00:00',0),(5,'Mary Wollstonecraft Shelley','1797-08-30 00:00:00','1851-02-01 00:00:00',0),(6,'Louisa May Alcott','1832-11-29 00:00:00','1888-03-06 00:00:00',0),(7,'F Scott Fitzgerald','1896-09-24 00:00:00','1940-12-21 00:00:00',0),(8,'Edgar Allan Poe','1809-01-19 00:00:00','1849-10-07 00:00:00',0),(9,'Lewis Carroll','1832-01-27 00:00:00','1898-01-14 00:00:00',0),(10,'Bram Stoker','1847-11-08 00:00:00','1912-04-20 00:00:00',0),(11,'Anne Bronte','1820-01-17 00:00:00','1849-05-28 00:00:00',0),(12,'Emily Bronte','1818-07-30 00:00:00','1848-12-19 00:00:00',0);
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_authors`
--

DROP TABLE IF EXISTS `book_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_authors` (
  `book_authorID` int NOT NULL AUTO_INCREMENT,
  `bookID` int NOT NULL,
  `authorID` int NOT NULL,
  `IsDelinked` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`book_authorID`),
  KEY `BookID_idx` (`bookID`),
  KEY `AuthorID_idx` (`authorID`),
  CONSTRAINT `AuthorID` FOREIGN KEY (`authorID`) REFERENCES `authors` (`AuthorID`),
  CONSTRAINT `BookID` FOREIGN KEY (`bookID`) REFERENCES `books` (`BookID`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_authors`
--

LOCK TABLES `book_authors` WRITE;
/*!40000 ALTER TABLE `book_authors` DISABLE KEYS */;
INSERT INTO `book_authors` VALUES (1,1,1,0),(2,2,1,0),(3,3,1,0),(4,4,1,0),(5,5,1,0),(6,6,1,0),(7,7,1,0),(8,8,2,0),(9,9,2,0),(10,10,2,0),(11,11,2,0),(12,12,2,0),(13,13,2,0),(14,14,2,0),(15,15,2,0),(16,16,2,0),(17,17,2,0),(18,18,2,0),(19,19,2,0),(20,20,2,0),(21,21,2,0),(22,22,2,0),(23,23,2,0),(24,24,2,0),(25,25,2,0),(26,26,2,0),(27,27,2,0),(28,28,2,0),(29,29,2,0),(30,30,2,0),(31,31,2,0),(32,32,2,0),(33,33,2,0),(49,34,3,0),(50,35,3,0),(51,36,3,0),(52,37,3,0),(53,38,3,0),(54,39,3,0),(55,40,3,0),(56,41,3,0),(57,42,3,0),(58,43,3,0),(59,44,3,0),(60,45,3,0),(61,46,3,0),(62,47,3,0),(63,48,3,0),(64,49,4,0),(65,50,4,0),(66,51,4,0),(67,52,4,0),(68,53,4,0),(69,53,11,0),(70,53,12,0);
/*!40000 ALTER TABLE `book_authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `BookID` int NOT NULL AUTO_INCREMENT,
  `BookTitle` varchar(300) NOT NULL,
  `BookSubtitle` varchar(300) DEFAULT NULL,
  `ISBN` varchar(30) DEFAULT NULL,
  `PublicationDate` datetime DEFAULT NULL,
  `DateAdded` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`BookID`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'Sense and Sensibility',NULL,NULL,'1811-01-01 00:00:00','2022-03-26 20:14:06',0),(2,'Pride and Prejudice',NULL,NULL,'1813-01-01 00:00:00','2022-03-26 20:18:01',0),(3,'Mansfield Park',NULL,NULL,'1814-01-01 00:00:00','2022-03-26 20:20:59',0),(4,'Emma',NULL,NULL,'1815-01-01 00:00:00','2022-03-26 20:20:59',0),(5,'Northanger Abbey',NULL,NULL,'1818-01-01 00:00:00','2022-03-26 20:20:59',0),(6,'Persuasion',NULL,NULL,'1818-01-01 00:00:00','2022-03-26 20:20:59',0),(7,'Lady Susan',NULL,NULL,'1871-01-01 00:00:00','2022-03-26 20:20:59',0),(8,'Much Ado About Nothing',NULL,NULL,'1623-01-01 00:00:00','2022-03-26 20:29:43',0),(9,'The Tempest',NULL,NULL,'1623-01-01 00:00:00','2022-03-26 20:29:43',0),(10,'The Two Gentlemen of Verona',NULL,NULL,'1623-01-01 00:00:00','2022-03-26 20:29:43',0),(11,'The Merry Wives of Windsor',NULL,NULL,'1623-01-01 00:00:00','2022-03-26 20:33:48',0),(12,'Measure for Measure',NULL,NULL,'1623-01-01 00:00:00','2022-03-26 20:35:05',0),(13,'The Comedy of Errors',NULL,NULL,'1623-01-01 00:00:00','2022-03-26 20:35:05',0),(14,'Love\'s Labour\'s Lost',NULL,NULL,'1623-01-01 00:00:00','2022-03-26 20:38:13',0),(15,'A Midsummer Night\'s Dream',NULL,NULL,'1623-01-01 00:00:00','2022-03-26 20:38:13',0),(16,'The Merchant of Venice',NULL,NULL,'1623-01-01 00:00:00','2022-03-26 20:38:13',0),(17,'As You Like It',NULL,NULL,'1623-01-01 00:00:00','2022-03-26 20:38:13',0),(18,'The Taming of the Shrew',NULL,NULL,'1623-01-01 00:00:00','2022-03-26 20:38:13',0),(19,'All\'s Well That Ends Well',NULL,NULL,'1623-01-01 00:00:00','2022-03-26 20:38:13',0),(20,'Twelfth Night',NULL,NULL,'1623-01-01 00:00:00','2022-03-26 20:38:13',0),(21,'The Winter\'s Tale',NULL,NULL,'1623-01-01 00:00:00','2022-03-26 20:38:13',0),(22,'Troilus and Cressida',NULL,NULL,'1623-01-01 00:00:00','2022-03-26 20:44:17',0),(23,'Coriolanus',NULL,NULL,'1623-01-01 00:00:00','2022-03-26 20:44:17',0),(24,'Titus Andronicus',NULL,NULL,'1623-01-01 00:00:00','2022-03-26 20:44:17',0),(25,'Romeo and Juliet',NULL,NULL,'1623-01-01 00:00:00','2022-03-26 20:44:17',0),(26,'Timon of Athens',NULL,NULL,'1623-01-01 00:00:00','2022-03-26 20:44:17',0),(27,'Julius Caesar',NULL,NULL,'1623-01-01 00:00:00','2022-03-26 20:44:17',0),(28,'Macbeth',NULL,NULL,'1623-01-01 00:00:00','2022-03-26 20:44:17',0),(29,'Hamlet',NULL,NULL,'1623-01-01 00:00:00','2022-03-26 20:44:17',0),(30,'King Lear',NULL,NULL,'1623-01-01 00:00:00','2022-03-26 20:44:17',0),(31,'Othello',NULL,NULL,'1623-01-01 00:00:00','2022-03-26 20:44:17',0),(32,'Antony and Cleopatra',NULL,NULL,'1623-01-01 00:00:00','2022-03-26 20:44:17',0),(33,'Cymbeline',NULL,NULL,'1623-01-01 00:00:00','2022-03-26 20:44:17',0),(34,'Captain Paul',NULL,NULL,'1838-01-01 00:00:00','2022-03-27 10:59:52',0),(35,'The Corsican Brothers',NULL,NULL,'1844-01-01 00:00:00','2022-03-27 10:59:52',0),(36,'Titus Andronicus',NULL,NULL,'1623-01-01 00:00:00','2022-03-27 10:59:52',0),(37,'The Black Tulip',NULL,NULL,'1850-01-01 00:00:00','2022-03-27 10:59:52',0),(38,'The Wolf Leader',NULL,NULL,'1857-01-01 00:00:00','2022-03-27 10:59:52',0),(39,'The Count of Monte Cristo',NULL,NULL,'1844-01-01 00:00:00','2022-03-27 10:59:52',0),(40,'The Conspirators',NULL,NULL,'1843-01-01 00:00:00','2022-03-27 10:59:52',0),(41,'The Regent\'s Daughter',NULL,NULL,'1845-01-01 00:00:00','2022-03-27 10:59:52',0),(42,'The Three Musketeers',NULL,NULL,'1844-01-01 00:00:00','2022-03-27 10:59:52',0),(43,'Twenty Years After',NULL,NULL,'1845-01-01 00:00:00','2022-03-27 10:59:52',0),(44,'Ten Years Later',NULL,NULL,'1847-01-01 00:00:00','2022-03-27 10:59:52',0),(45,'The War of Women',NULL,NULL,'1845-01-01 00:00:00','2022-03-27 10:59:52',0),(46,'Marguerite de Valois',NULL,NULL,'1845-01-01 00:00:00','2022-03-27 10:59:52',0),(47,'Chicot the Jester',NULL,NULL,'1846-01-01 00:00:00','2022-03-27 10:59:52',0),(48,'Ascanio',NULL,NULL,'1843-01-01 00:00:00','2022-03-27 10:59:52',0),(49,'Jane Eyre',NULL,NULL,'1847-01-01 00:00:00','2022-03-27 11:20:39',0),(50,'Shirley',NULL,NULL,'1849-01-01 00:00:00','2022-03-27 11:20:39',0),(51,'Villette',NULL,NULL,'1853-01-01 00:00:00','2022-03-27 11:20:39',0),(52,'The Professor',NULL,NULL,'1857-01-01 00:00:00','2022-03-27 11:20:39',0),(53,'Poems by Currer, Ellis, and Acton Bell',NULL,NULL,'1846-01-01 00:00:00','2022-03-27 11:20:39',0);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_requests`
--

DROP TABLE IF EXISTS `member_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_requests` (
  `Member_RequestID` int NOT NULL AUTO_INCREMENT,
  `MemberID` int NOT NULL,
  `RequestID` int NOT NULL,
  PRIMARY KEY (`Member_RequestID`),
  KEY `MemberID_idx` (`MemberID`),
  KEY `RequestID_idx` (`RequestID`),
  CONSTRAINT `MemberID` FOREIGN KEY (`MemberID`) REFERENCES `members` (`MemberID`),
  CONSTRAINT `RequestID` FOREIGN KEY (`RequestID`) REFERENCES `requests` (`RequestID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_requests`
--

LOCK TABLES `member_requests` WRITE;
/*!40000 ALTER TABLE `member_requests` DISABLE KEYS */;
INSERT INTO `member_requests` VALUES (1,1,1),(2,2,1),(3,2,2);
/*!40000 ALTER TABLE `member_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `MemberID` int NOT NULL AUTO_INCREMENT,
  `Username` varchar(100) NOT NULL,
  `EmailAddress` varchar(400) NOT NULL,
  `IsDeactivated` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`MemberID`),
  UNIQUE KEY `Username_UNIQUE` (`Username`),
  UNIQUE KEY `EmailAddress_UNIQUE` (`EmailAddress`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'JoannaCregan','joannamcregan@gmail.com',0),(2,'Jozie_Jewelz','joziejewelz@gmail.com',0);
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request_replies`
--

DROP TABLE IF EXISTS `request_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `request_replies` (
  `Request_ReplyID` int NOT NULL AUTO_INCREMENT,
  `RequestID` int NOT NULL,
  `BookID` int NOT NULL,
  `MemberID` int NOT NULL,
  `IsRemoved` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`Request_ReplyID`),
  KEY `BookID_idx` (`BookID`),
  KEY `MemberID_idx` (`MemberID`),
  KEY `RequestID_idx` (`RequestID`),
  CONSTRAINT `Book` FOREIGN KEY (`BookID`) REFERENCES `books` (`BookID`),
  CONSTRAINT `Member` FOREIGN KEY (`MemberID`) REFERENCES `members` (`MemberID`),
  CONSTRAINT `Request` FOREIGN KEY (`RequestID`) REFERENCES `requests` (`RequestID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_replies`
--

LOCK TABLES `request_replies` WRITE;
/*!40000 ALTER TABLE `request_replies` DISABLE KEYS */;
INSERT INTO `request_replies` VALUES (1,2,32,1,0),(2,2,31,1,0);
/*!40000 ALTER TABLE `request_replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requests`
--

DROP TABLE IF EXISTS `requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requests` (
  `RequestID` int NOT NULL AUTO_INCREMENT,
  `RequestText` varchar(200) NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`RequestID`),
  UNIQUE KEY `RequestText_UNIQUE` (`RequestText`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requests`
--

LOCK TABLES `requests` WRITE;
/*!40000 ALTER TABLE `requests` DISABLE KEYS */;
INSERT INTO `requests` VALUES (1,'Books like Pride and Prejudice by Jane Austen',0),(2,'Toxic Romance',0);
/*!40000 ALTER TABLE `requests` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-27 13:18:23
