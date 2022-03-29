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
-- Table structure for table `awards`
--

DROP TABLE IF EXISTS `awards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `awards` (
  `InkdropAwardID` int NOT NULL AUTO_INCREMENT COMMENT 'Members gain inkdrops as rewards for positive actions, such as making recommendations that lead to another member purchasing and/or rating a book highly.',
  `NumberOfInkdrops` int NOT NULL DEFAULT '1',
  `AwardBasedOnTable` int NOT NULL,
  `AwardBasedOnTableKey` int NOT NULL,
  `MemberID` int NOT NULL,
  `IsRevoked` tinyint(1) NOT NULL DEFAULT '0',
  `InkdropsAwarded` varchar(400) NOT NULL COMMENT 'Max ten Inkdrops per Award. This column used as a note of the InkdropText for all Inkdrops included in the Award',
  PRIMARY KEY (`InkdropAwardID`),
  KEY `Awardee_idx` (`MemberID`),
  CONSTRAINT `Awardee` FOREIGN KEY (`MemberID`) REFERENCES `members` (`MemberID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `awards`
--

LOCK TABLES `awards` WRITE;
/*!40000 ALTER TABLE `awards` DISABLE KEYS */;
/*!40000 ALTER TABLE `awards` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_authors`
--

LOCK TABLES `book_authors` WRITE;
/*!40000 ALTER TABLE `book_authors` DISABLE KEYS */;
INSERT INTO `book_authors` VALUES (1,1,1,0),(2,2,1,0),(3,3,1,0),(4,4,1,0),(5,5,1,0),(6,6,1,0),(7,7,1,0),(8,8,2,0),(9,9,2,0),(10,10,2,0),(11,11,2,0),(12,12,2,0),(13,13,2,0),(14,14,2,0),(15,15,2,0),(16,16,2,0),(17,17,2,0),(18,18,2,0),(19,19,2,0),(20,20,2,0),(21,21,2,0),(22,22,2,0),(23,23,2,0),(24,24,2,0),(25,25,2,0),(26,26,2,0),(27,27,2,0),(28,28,2,0),(29,29,2,0),(30,30,2,0),(31,31,2,0),(32,32,2,0),(33,33,2,0),(49,34,3,0),(50,35,3,0),(51,36,3,0),(52,37,3,0),(53,38,3,0),(54,39,3,0),(55,40,3,0),(56,41,3,0),(57,42,3,0),(58,43,3,0),(59,44,3,0),(60,45,3,0),(61,46,3,0),(62,47,3,0),(63,48,3,0),(64,49,4,0),(65,50,4,0),(66,51,4,0),(67,52,4,0),(68,53,4,0),(69,53,11,0),(70,53,12,0),(71,54,11,0),(72,55,11,0),(73,56,12,0),(74,57,5,0),(75,58,5,0),(76,59,5,0),(77,60,5,0),(78,61,5,0),(79,62,6,0),(80,63,6,0),(81,64,6,0),(82,65,6,0),(83,66,6,0),(84,67,6,0),(85,68,6,0),(86,69,6,0),(87,70,6,0),(88,71,6,0),(89,72,6,0),(90,73,6,0),(91,74,6,0),(92,75,6,0),(93,76,6,0),(94,77,6,0),(95,78,6,0),(96,79,6,0),(97,80,6,0),(98,81,6,0),(99,82,6,0),(100,83,6,0),(101,84,6,0),(102,85,6,0),(103,86,6,0),(104,87,6,0),(105,88,6,0),(106,89,6,0),(107,90,6,0),(108,91,6,0),(109,92,7,0),(110,93,7,0),(111,94,7,0),(112,95,8,0),(113,96,8,0),(114,97,8,0),(115,98,8,0),(116,99,8,0);
/*!40000 ALTER TABLE `book_authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_purchases`
--

DROP TABLE IF EXISTS `book_purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_purchases` (
  `Book_PurchaseID` int NOT NULL AUTO_INCREMENT,
  `BookID` int NOT NULL,
  `MemberID` int NOT NULL,
  `Purchase_MethodID` int NOT NULL,
  PRIMARY KEY (`Book_PurchaseID`),
  KEY `BookPurchased_idx` (`BookID`),
  KEY `PurchasedBy_idx` (`MemberID`),
  KEY `PurchaseMethod_idx` (`Purchase_MethodID`),
  CONSTRAINT `BookPurchased` FOREIGN KEY (`BookID`) REFERENCES `books` (`BookID`),
  CONSTRAINT `PurchasedBy` FOREIGN KEY (`MemberID`) REFERENCES `members` (`MemberID`),
  CONSTRAINT `PurchaseMethod` FOREIGN KEY (`Purchase_MethodID`) REFERENCES `purchase_methods` (`MethodID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_purchases`
--

LOCK TABLES `book_purchases` WRITE;
/*!40000 ALTER TABLE `book_purchases` DISABLE KEYS */;
/*!40000 ALTER TABLE `book_purchases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_ratings`
--

DROP TABLE IF EXISTS `book_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_ratings` (
  `Book_RatingID` int NOT NULL AUTO_INCREMENT,
  `BookID` int NOT NULL,
  `MemberID` int NOT NULL,
  `Rating` tinyint NOT NULL,
  `IsRemoved` tinyint(1) NOT NULL,
  PRIMARY KEY (`Book_RatingID`),
  KEY `BookRated_idx` (`BookID`),
  KEY `RatedByMember_idx` (`MemberID`),
  CONSTRAINT `BookRated` FOREIGN KEY (`BookID`) REFERENCES `books` (`BookID`),
  CONSTRAINT `RatedByMember` FOREIGN KEY (`MemberID`) REFERENCES `members` (`MemberID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_ratings`
--

LOCK TABLES `book_ratings` WRITE;
/*!40000 ALTER TABLE `book_ratings` DISABLE KEYS */;
/*!40000 ALTER TABLE `book_ratings` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'Sense and Sensibility',NULL,NULL,'1811-01-01 00:00:00','2022-03-26 20:14:06',0),(2,'Pride and Prejudice',NULL,NULL,'1813-01-01 00:00:00','2022-03-26 20:18:01',0),(3,'Mansfield Park',NULL,NULL,'1814-01-01 00:00:00','2022-03-26 20:20:59',0),(4,'Emma',NULL,NULL,'1815-01-01 00:00:00','2022-03-26 20:20:59',0),(5,'Northanger Abbey',NULL,NULL,'1818-01-01 00:00:00','2022-03-26 20:20:59',0),(6,'Persuasion',NULL,NULL,'1818-01-01 00:00:00','2022-03-26 20:20:59',0),(7,'Lady Susan',NULL,NULL,'1871-01-01 00:00:00','2022-03-26 20:20:59',0),(8,'Much Ado About Nothing',NULL,NULL,'1623-01-01 00:00:00','2022-03-26 20:29:43',0),(9,'The Tempest',NULL,NULL,'1623-01-01 00:00:00','2022-03-26 20:29:43',0),(10,'The Two Gentlemen of Verona',NULL,NULL,'1623-01-01 00:00:00','2022-03-26 20:29:43',0),(11,'The Merry Wives of Windsor',NULL,NULL,'1623-01-01 00:00:00','2022-03-26 20:33:48',0),(12,'Measure for Measure',NULL,NULL,'1623-01-01 00:00:00','2022-03-26 20:35:05',0),(13,'The Comedy of Errors',NULL,NULL,'1623-01-01 00:00:00','2022-03-26 20:35:05',0),(14,'Love\'s Labour\'s Lost',NULL,NULL,'1623-01-01 00:00:00','2022-03-26 20:38:13',0),(15,'A Midsummer Night\'s Dream',NULL,NULL,'1623-01-01 00:00:00','2022-03-26 20:38:13',0),(16,'The Merchant of Venice',NULL,NULL,'1623-01-01 00:00:00','2022-03-26 20:38:13',0),(17,'As You Like It',NULL,NULL,'1623-01-01 00:00:00','2022-03-26 20:38:13',0),(18,'The Taming of the Shrew',NULL,NULL,'1623-01-01 00:00:00','2022-03-26 20:38:13',0),(19,'All\'s Well That Ends Well',NULL,NULL,'1623-01-01 00:00:00','2022-03-26 20:38:13',0),(20,'Twelfth Night',NULL,NULL,'1623-01-01 00:00:00','2022-03-26 20:38:13',0),(21,'The Winter\'s Tale',NULL,NULL,'1623-01-01 00:00:00','2022-03-26 20:38:13',0),(22,'Troilus and Cressida',NULL,NULL,'1623-01-01 00:00:00','2022-03-26 20:44:17',0),(23,'Coriolanus',NULL,NULL,'1623-01-01 00:00:00','2022-03-26 20:44:17',0),(24,'Titus Andronicus',NULL,NULL,'1623-01-01 00:00:00','2022-03-26 20:44:17',0),(25,'Romeo and Juliet',NULL,NULL,'1623-01-01 00:00:00','2022-03-26 20:44:17',0),(26,'Timon of Athens',NULL,NULL,'1623-01-01 00:00:00','2022-03-26 20:44:17',0),(27,'Julius Caesar',NULL,NULL,'1623-01-01 00:00:00','2022-03-26 20:44:17',0),(28,'Macbeth',NULL,NULL,'1623-01-01 00:00:00','2022-03-26 20:44:17',0),(29,'Hamlet',NULL,NULL,'1623-01-01 00:00:00','2022-03-26 20:44:17',0),(30,'King Lear',NULL,NULL,'1623-01-01 00:00:00','2022-03-26 20:44:17',0),(31,'Othello',NULL,NULL,'1623-01-01 00:00:00','2022-03-26 20:44:17',0),(32,'Antony and Cleopatra',NULL,NULL,'1623-01-01 00:00:00','2022-03-26 20:44:17',0),(33,'Cymbeline',NULL,NULL,'1623-01-01 00:00:00','2022-03-26 20:44:17',0),(34,'Captain Paul',NULL,NULL,'1838-01-01 00:00:00','2022-03-27 10:59:52',0),(35,'The Corsican Brothers',NULL,NULL,'1844-01-01 00:00:00','2022-03-27 10:59:52',0),(36,'Titus Andronicus',NULL,NULL,'1623-01-01 00:00:00','2022-03-27 10:59:52',0),(37,'The Black Tulip',NULL,NULL,'1850-01-01 00:00:00','2022-03-27 10:59:52',0),(38,'The Wolf Leader',NULL,NULL,'1857-01-01 00:00:00','2022-03-27 10:59:52',0),(39,'The Count of Monte Cristo',NULL,NULL,'1844-01-01 00:00:00','2022-03-27 10:59:52',0),(40,'The Conspirators',NULL,NULL,'1843-01-01 00:00:00','2022-03-27 10:59:52',0),(41,'The Regent\'s Daughter',NULL,NULL,'1845-01-01 00:00:00','2022-03-27 10:59:52',0),(42,'The Three Musketeers',NULL,NULL,'1844-01-01 00:00:00','2022-03-27 10:59:52',0),(43,'Twenty Years After',NULL,NULL,'1845-01-01 00:00:00','2022-03-27 10:59:52',0),(44,'Ten Years Later',NULL,NULL,'1847-01-01 00:00:00','2022-03-27 10:59:52',0),(45,'The War of Women',NULL,NULL,'1845-01-01 00:00:00','2022-03-27 10:59:52',0),(46,'Marguerite de Valois',NULL,NULL,'1845-01-01 00:00:00','2022-03-27 10:59:52',0),(47,'Chicot the Jester',NULL,NULL,'1846-01-01 00:00:00','2022-03-27 10:59:52',0),(48,'Ascanio',NULL,NULL,'1843-01-01 00:00:00','2022-03-27 10:59:52',0),(49,'Jane Eyre',NULL,NULL,'1847-01-01 00:00:00','2022-03-27 11:20:39',0),(50,'Shirley',NULL,NULL,'1849-01-01 00:00:00','2022-03-27 11:20:39',0),(51,'Villette',NULL,NULL,'1853-01-01 00:00:00','2022-03-27 11:20:39',0),(52,'The Professor',NULL,NULL,'1857-01-01 00:00:00','2022-03-27 11:20:39',0),(53,'Poems by Currer, Ellis, and Acton Bell',NULL,NULL,'1846-01-01 00:00:00','2022-03-27 11:20:39',0),(54,'Agnes Grey',NULL,NULL,'1847-12-01 00:00:00','2022-03-27 22:37:05',0),(55,'The Tenant of Wildfell Hall',NULL,NULL,'1848-06-23 00:00:00','2022-03-27 22:37:05',0),(56,'Wuthering Heights',NULL,NULL,'1847-12-01 00:00:00','2022-03-27 22:42:42',0),(57,'Frankenstein; Or the Modern Prometheus',NULL,NULL,'1818-01-01 00:00:00','2022-03-27 22:52:04',0),(58,'The Last Man',NULL,NULL,'1826-01-01 00:00:00','2022-03-27 22:52:04',0),(59,'Mathilda',NULL,NULL,'1819-01-01 00:00:00','2022-03-27 22:52:04',0),(60,'Falkner','A Novel',NULL,'1837-01-01 00:00:00','2022-03-27 22:52:04',0),(61,'The Heir of Mondolfo',NULL,NULL,NULL,'2022-03-27 22:52:04',0),(62,'Little Women',NULL,NULL,'1868-01-01 00:00:00','2022-03-27 23:31:04',0),(63,'Little Men','Life at Plumfield with Jo\'s Boys',NULL,'1871-01-01 00:00:00','2022-03-27 23:31:04',0),(64,'An Old Fashioned Girl',NULL,NULL,'1870-01-01 00:00:00','2022-03-27 23:31:04',0),(65,'Jo\'s Boys','And How They Turned Out',NULL,'1886-01-01 00:00:00','2022-03-27 23:31:04',0),(66,'Behind a Mask','Or a Woman\'s Power',NULL,'1866-01-01 00:00:00','2022-03-27 23:31:04',0),(67,'Rose in Bloom','A Sequel to Eight Cousins',NULL,'1876-01-01 00:00:00','2022-03-27 23:31:04',0),(68,'Eight Cousins','Or, the Aunt Hill',NULL,'1875-01-01 00:00:00','2022-03-27 23:31:04',0),(69,'Jack and Jill','A Village Story',NULL,'1880-01-01 00:00:00','2022-03-27 23:31:04',0),(70,'Flower Fables',NULL,NULL,'1849-01-01 00:00:00','2022-03-27 23:31:04',0),(71,'Hospital Sketches',NULL,NULL,'1863-01-01 00:00:00','2022-03-27 23:31:04',0),(72,'Lulu\'s Library',NULL,NULL,'1886-01-01 00:00:00','2022-03-27 23:31:04',0),(73,'A Garland for Girls',NULL,NULL,'1888-01-01 00:00:00','2022-03-27 23:31:04',0),(74,'Under the Lilacs',NULL,NULL,'1878-01-01 00:00:00','2022-03-27 23:31:04',0),(75,'Aunt Jo\'s Scrap Bag, Volume 1',NULL,NULL,'1872-01-01 00:00:00','2022-03-27 23:31:04',0),(76,'Aunt Jo\'s Scrap Bag, Volume 2',NULL,NULL,'1873-01-01 00:00:00','2022-03-27 23:31:04',0),(77,'Spinning Wheel Stories',NULL,NULL,'1884-01-01 00:00:00','2022-03-27 23:31:04',0),(78,'Pauline\'s Passion and Punishment',NULL,NULL,'1863-01-01 00:00:00','2022-03-27 23:31:04',0),(79,'Moods',NULL,NULL,'1865-01-01 00:00:00','2022-03-27 23:31:04',0),(80,'Aunt Jo\'s Scrap Bag, Volume 3',NULL,NULL,'1874-01-01 00:00:00','2022-03-27 23:31:04',0),(81,'Aunt Jo\'s Scrap Bag, Volume 4',NULL,NULL,'1875-01-01 00:00:00','2022-03-27 23:31:04',0),(82,'Aunt Jo\'s Scrap Bag, Volume 5',NULL,NULL,'1876-01-01 00:00:00','2022-03-27 23:31:04',0),(83,'Aunt Jo\'s Scrap Bag, Volume 6',NULL,NULL,'1882-01-01 00:00:00','2022-03-27 23:31:04',0),(84,'The Mysterious Key and What It Opened',NULL,NULL,'1867-01-01 00:00:00','2022-03-27 23:31:04',0),(85,'The Candy Country',NULL,NULL,'1885-01-01 00:00:00','2022-03-27 23:31:04',0),(86,'A Modern Mephistopheles, and a Whisper in the Dark',NULL,NULL,'1877-01-01 00:00:00','2022-03-27 23:31:04',0),(87,'Silver Pitchers, and Independence','A Centennial Love Story',NULL,'1876-01-01 00:00:00','2022-03-27 23:31:04',0),(88,'May Flowers',NULL,NULL,'1887-01-01 00:00:00','2022-03-27 23:31:04',0),(89,'Mountain-Laurel and Maidenhair',NULL,NULL,'1887-01-01 00:00:00','2022-03-27 23:31:04',0),(90,'On Picket Duty, and Other Tales',NULL,NULL,'1864-01-01 00:00:00','2022-03-27 23:31:04',0),(91,'Work','A Story of Experience',NULL,'1873-01-01 00:00:00','2022-03-27 23:31:04',0),(92,'This Side of Paradise',NULL,NULL,'1920-01-01 00:00:00','2022-03-29 01:17:06',0),(93,'The Beautiful and Damned',NULL,NULL,'1922-01-01 00:00:00','2022-03-29 01:17:06',0),(94,'The Great Gatsby',NULL,NULL,'1925-01-01 00:00:00','2022-03-29 01:17:06',0),(95,'The Fall of the House of Usher',NULL,NULL,'1839-01-01 00:00:00','2022-03-29 01:28:00',0),(96,'The Masque of the Red Death',NULL,NULL,'1842-01-01 00:00:00','2022-03-29 01:28:00',0),(97,'The Cask of Amontillado',NULL,NULL,'1846-11-01 00:00:00','2022-03-29 01:28:00',0),(98,'The Raven',NULL,NULL,'1845-01-01 00:00:00','2022-03-29 01:28:00',0),(99,'The Narrative of Arthur Gordon Pym of Nantucket',NULL,NULL,'1838-01-01 00:00:00','2022-03-29 01:28:00',0);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inkdrops`
--

DROP TABLE IF EXISTS `inkdrops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inkdrops` (
  `InkdropID` binary(16) DEFAULT NULL,
  `InkdropText` varchar(36) GENERATED ALWAYS AS (insert(insert(insert(insert(hex(`InkdropID`),9,0,_utf8mb4'-'),14,0,_utf8mb4'-'),19,0,_utf8mb4'-'),24,0,_utf8mb4'-')) VIRTUAL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inkdrops`
--

LOCK TABLES `inkdrops` WRITE;
/*!40000 ALTER TABLE `inkdrops` DISABLE KEYS */;
/*!40000 ALTER TABLE `inkdrops` ENABLE KEYS */;
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
-- Table structure for table `pens`
--

DROP TABLE IF EXISTS `pens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pens` (
  `PenID` binary(16) NOT NULL,
  `PenText` varchar(36) GENERATED ALWAYS AS (insert(insert(insert(insert(hex(`PenID`),9,0,_utf8mb4'-'),14,0,_utf8mb4'-'),19,0,_utf8mb4'-'),24,0,_utf8mb4'-')) VIRTUAL,
  `MemberID` int NOT NULL,
  `IsExpired` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Will expire 13 months from formation date',
  `InkDropsUsed` varchar(800) DEFAULT NULL COMMENT 'Used to note the InkdropTexts of the 20 Inkdrops used to form the Pen',
  PRIMARY KEY (`PenID`),
  KEY `PenHolder_idx` (`MemberID`),
  CONSTRAINT `PenHolder` FOREIGN KEY (`MemberID`) REFERENCES `members` (`MemberID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pens`
--

LOCK TABLES `pens` WRITE;
/*!40000 ALTER TABLE `pens` DISABLE KEYS */;
/*!40000 ALTER TABLE `pens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_methods`
--

DROP TABLE IF EXISTS `purchase_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase_methods` (
  `MethodID` int NOT NULL AUTO_INCREMENT,
  `MethodName` varchar(100) NOT NULL,
  `MethodDescription` varchar(400) DEFAULT NULL,
  `IsRetired` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`MethodID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_methods`
--

LOCK TABLES `purchase_methods` WRITE;
/*!40000 ALTER TABLE `purchase_methods` DISABLE KEYS */;
INSERT INTO `purchase_methods` VALUES (1,'PayPal',NULL,0),(2,'Stripe',NULL,0),(3,'BookGold',NULL,0);
/*!40000 ALTER TABLE `purchase_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `readalikes`
--

DROP TABLE IF EXISTS `readalikes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `readalikes` (
  `ReadalikeID` int NOT NULL AUTO_INCREMENT,
  `BookID` int NOT NULL,
  `AlikeBookID` int DEFAULT NULL,
  `AlikeBookTitleAuthor` varchar(400) NOT NULL,
  `MemberID` int NOT NULL,
  `IsRemoved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ReadalikeID`),
  KEY `Book_idx` (`BookID`),
  KEY `Member_idx` (`MemberID`),
  CONSTRAINT `BookBeingCompared` FOREIGN KEY (`BookID`) REFERENCES `books` (`BookID`),
  CONSTRAINT `MemberComparing` FOREIGN KEY (`MemberID`) REFERENCES `members` (`MemberID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `readalikes`
--

LOCK TABLES `readalikes` WRITE;
/*!40000 ALTER TABLE `readalikes` DISABLE KEYS */;
/*!40000 ALTER TABLE `readalikes` ENABLE KEYS */;
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

--
-- Table structure for table `table_ids`
--

DROP TABLE IF EXISTS `table_ids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_ids` (
  `TableID` int NOT NULL,
  `TableName` varchar(45) NOT NULL COMMENT 'Used to help track events, such as why Inkdrops are being awarded',
  PRIMARY KEY (`TableID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Used to keep track of which table events are based on, ie, inkdrops awarded based on request replies, purchases, etc.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_ids`
--

LOCK TABLES `table_ids` WRITE;
/*!40000 ALTER TABLE `table_ids` DISABLE KEYS */;
/*!40000 ALTER TABLE `table_ids` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-29  1:38:21
