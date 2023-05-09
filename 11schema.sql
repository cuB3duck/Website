CREATE DATABASE  IF NOT EXISTS `auctionsite` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `auctionsite`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: auctionsite
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `email` varchar(50) DEFAULT NULL,
  `accountId` int NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `role` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`accountId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES ('MatzaAdmin@buyme.com',0,'Admin','admin1','Matza','admin'),('starfish91@yahoo.com',1,'cookie9','b3ket','John Doe','user'),('comet357@yahoo.com',2,'star3r$','bar!cU','Jane Doe','user'),('jassingh@yahoo.com',3,'Wart!ans','sp8','Jaswinder Singh','user'),('rooster34@yahoo.com',4,'mans','hea3s','Teddy Stewart','user'),('blyes193@gmail.com',5,'bears33','animals','Bobbi Blue','user'),('starl134ight@yahoo.com',6,'user','pass','Joe Johnson','rep'),('aryaman2355@gmail.com',7,'aryaman','aryaman','Aryaman','user'),('aryaman2355@gmail.com',8,'aryaman','aryaman','aryaman','user'),('aryaman4455@gmail.com',9,'ditsu','ditsu','ditsu','user'),('aryaman2355@gmail.com',10,'shrey','shrey','shrey','user'),('snow123@buyme.com',12,'snow123','apples','Snow White','rep'),('joeso@buyme.com',13,'boospril','march10','Joe Schmo','rep');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrator`
--

DROP TABLE IF EXISTS `administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrator` (
  `adminId` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `role` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator`
--

LOCK TABLES `administrator` WRITE;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` VALUES ('0','Admin','admin1','Matza','MatzaAdmin@buyme.com','admin');
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auction`
--

DROP TABLE IF EXISTS `auction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auction` (
  `auctionid` int NOT NULL,
  `expiration` datetime DEFAULT NULL,
  `seller_id` int DEFAULT NULL,
  `winner` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`auctionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auction`
--

LOCK TABLES `auction` WRITE;
/*!40000 ALTER TABLE `auction` DISABLE KEYS */;
INSERT INTO `auction` VALUES (1,'2022-12-17 15:45:21',1,'Wart!ans'),(2,'2022-11-30 15:45:21',1,NULL),(3,'2022-12-30 23:14:00',1,NULL),(4,'2022-12-20 17:30:00',5,NULL),(5,'2022-10-10 14:30:00',8,NULL),(6,'2023-01-10 13:00:00',8,NULL),(7,'2023-01-10 13:00:00',8,NULL),(8,'2023-01-10 13:00:00',9,NULL),(9,'2022-10-10 14:30:00',8,NULL),(10,'2023-10-10 14:30:00',8,NULL),(11,'2022-10-10 14:30:00',8,NULL),(12,'2022-10-10 14:30:00',8,NULL);
/*!40000 ALTER TABLE `auction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bid`
--

DROP TABLE IF EXISTS `bid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bid` (
  `userId` int NOT NULL,
  `auctionid` int NOT NULL,
  `bid_limit` decimal(8,2) DEFAULT NULL,
  `amount` decimal(8,2) DEFAULT NULL,
  `increment` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`userId`,`auctionid`),
  KEY `auctionid` (`auctionid`),
  CONSTRAINT `bid_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `buyer` (`userId`),
  CONSTRAINT `bid_ibfk_2` FOREIGN KEY (`auctionid`) REFERENCES `auction` (`auctionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bid`
--

LOCK TABLES `bid` WRITE;
/*!40000 ALTER TABLE `bid` DISABLE KEYS */;
INSERT INTO `bid` VALUES (2,1,17.35,16.35,1.00),(3,1,18.20,19.14,1.00);
/*!40000 ALTER TABLE `bid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buyer`
--

DROP TABLE IF EXISTS `buyer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buyer` (
  `userId` int NOT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buyer`
--

LOCK TABLES `buyer` WRITE;
/*!40000 ALTER TABLE `buyer` DISABLE KEYS */;
INSERT INTO `buyer` VALUES (1),(2),(3),(4);
/*!40000 ALTER TABLE `buyer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `qId` int NOT NULL,
  `userid` int DEFAULT NULL,
  `cId` int DEFAULT NULL,
  `question` varchar(200) DEFAULT NULL,
  `answer` varchar(200) DEFAULT NULL,
  `keyword` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`qId`),
  KEY `userid` (`userid`),
  KEY `cId` (`cId`),
  CONSTRAINT `contact_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `end_users` (`userid`),
  CONSTRAINT `contact_ibfk_2` FOREIGN KEY (`cId`) REFERENCES `customer_rep` (`cId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` VALUES (0,2,6,'How is a winner declared?','The buyer must bid higher than all buyers and the hidden price.','auction'),(1,1,12,'Can I decide not to purchase an item I won?','No. When you bid you make a contact to buy the item.','auction'),(2,4,12,'What if no buyer bids higher than the hidden price?','The auction will close with no winner.','auction'),(3,3,6,'What if an item arrives damaged?','You will recieve a refund.','item');
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_rep`
--

DROP TABLE IF EXISTS `customer_rep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_rep` (
  `cId` int NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `role` varchar(5) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`cId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_rep`
--

LOCK TABLES `customer_rep` WRITE;
/*!40000 ALTER TABLE `customer_rep` DISABLE KEYS */;
INSERT INTO `customer_rep` VALUES (6,'starl134ight@yahoo.com','Joe Johnson','user','rep','pass'),(12,'snow123@buyme.com','Snow White','snow123','rep','apples'),(13,'joeso@buyme.com','Joe Schmo','boospril','rep','march10');
/*!40000 ALTER TABLE `customer_rep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `end_users`
--

DROP TABLE IF EXISTS `end_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `end_users` (
  `userid` int NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `brand` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `end_users`
--

LOCK TABLES `end_users` WRITE;
/*!40000 ALTER TABLE `end_users` DISABLE KEYS */;
INSERT INTO `end_users` VALUES (1,'Watch','Fossil'),(2,NULL,NULL),(3,NULL,NULL),(4,NULL,NULL),(5,NULL,NULL),(6,NULL,NULL),(7,NULL,NULL),(8,NULL,NULL),(9,NULL,NULL),(10,NULL,NULL),(11,NULL,NULL),(12,NULL,NULL),(13,NULL,NULL),(14,NULL,NULL);
/*!40000 ALTER TABLE `end_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `has`
--

DROP TABLE IF EXISTS `has`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `has` (
  `itemId` int NOT NULL,
  `auctionId` int NOT NULL,
  PRIMARY KEY (`itemId`,`auctionId`),
  KEY `auctionId` (`auctionId`),
  CONSTRAINT `has_ibfk_1` FOREIGN KEY (`itemId`) REFERENCES `item` (`itemId`),
  CONSTRAINT `has_ibfk_2` FOREIGN KEY (`auctionId`) REFERENCES `auction` (`auctionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `has`
--

LOCK TABLES `has` WRITE;
/*!40000 ALTER TABLE `has` DISABLE KEYS */;
INSERT INTO `has` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(12,12);
/*!40000 ALTER TABLE `has` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `type` varchar(20) DEFAULT NULL,
  `itemId` int NOT NULL,
  `size` varchar(10) DEFAULT NULL,
  `color` varchar(15) DEFAULT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `base_price` decimal(18,2) DEFAULT NULL,
  `category` varchar(20) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`itemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES ('sweater',1,'S','red','The Children Place',10.35,'girl',1),('hoodie',2,'XL','red','Nike',45.50,'men',1),('cardigan',3,'M','white','American Eagle Outfitters',34.96,'women',1),('pants',4,'8','green','Old Navy',14.98,'girl',1),('Socks',5,'L','black','nike',10.00,'girl',1),('Hoodie ',6,'M','Black','H&M',19.99,'boy',1),('Hoodie ',7,'M','white','H&M',19.99,'girl',1),('Hoodie ',8,'M','Black','H&M',19.99,'boy',1),('socks',9,'L','black','nike',10.00,'girl',1),('Watch',10,'M','Brown','Fossil',20.00,'men',1),('socks',12,'L','black','nike',10.00,'girl',2);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `userId` int NOT NULL,
  `auctionId` int NOT NULL,
  `min_price` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`userId`,`auctionId`),
  KEY `auctionId` (`auctionId`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `seller` (`userId`),
  CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`auctionId`) REFERENCES `auction` (`auctionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,1,15.36),(1,2,47.21),(1,3,36.30),(5,4,17.36),(8,5,9.00),(8,6,14.99),(8,7,14.99),(8,9,9.00),(8,10,18.00),(8,12,9.00),(9,8,14.99);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report` (
  `item_earnings` decimal(18,2) DEFAULT NULL,
  `total_earnings` decimal(18,2) DEFAULT NULL,
  `best_sell_items` varchar(20) DEFAULT NULL,
  `item_type_earnings` decimal(18,2) DEFAULT NULL,
  `itemId` int NOT NULL,
  `adminId` varchar(20) NOT NULL,
  PRIMARY KEY (`itemId`,`adminId`),
  KEY `adminId` (`adminId`),
  CONSTRAINT `report_ibfk_1` FOREIGN KEY (`itemId`) REFERENCES `item` (`itemId`),
  CONSTRAINT `report_ibfk_2` FOREIGN KEY (`adminId`) REFERENCES `administrator` (`adminId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller`
--

DROP TABLE IF EXISTS `seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seller` (
  `userId` int NOT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller`
--

LOCK TABLES `seller` WRITE;
/*!40000 ALTER TABLE `seller` DISABLE KEYS */;
INSERT INTO `seller` VALUES (1),(3),(5),(8),(9);
/*!40000 ALTER TABLE `seller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uses`
--

DROP TABLE IF EXISTS `uses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uses` (
  `accountId` int NOT NULL,
  `userId` int NOT NULL,
  PRIMARY KEY (`accountId`,`userId`),
  KEY `userId` (`userId`),
  CONSTRAINT `uses_ibfk_1` FOREIGN KEY (`accountId`) REFERENCES `account` (`accountId`),
  CONSTRAINT `uses_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `end_users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uses`
--

LOCK TABLES `uses` WRITE;
/*!40000 ALTER TABLE `uses` DISABLE KEYS */;
INSERT INTO `uses` VALUES (1,1),(2,2),(3,3),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(12,12),(13,13);
/*!40000 ALTER TABLE `uses` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-23 19:00:33
