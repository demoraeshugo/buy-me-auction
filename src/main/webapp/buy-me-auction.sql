-- MySQL dump 10.13  Distrib 8.0.21, for macos10.15 (x86_64)
--
-- Host: localhost    Database: buy-me-auction
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `Accounts`
--

DROP TABLE IF EXISTS `Accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Accounts` (
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `dob` datetime NOT NULL,
  `street` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `zipCode` varchar(45) NOT NULL,
  `country` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Accounts`
--

LOCK TABLES `Accounts` WRITE;
/*!40000 ALTER TABLE `Accounts` DISABLE KEYS */;
INSERT INTO `Accounts` VALUES ('Admin','Staff','adminUser','passwordAdmin','init_num@scarletmail.rutgers.edu','1990-07-19 00:00:00','123 Way Ave','New Brunswick','08854','USA','NJ');
/*!40000 ALTER TABLE `Accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Auctions`
--

DROP TABLE IF EXISTS `Auctions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Auctions` (
  `auction_id` int NOT NULL,
  `init_price` varchar(45) NOT NULL,
  `min_price` varchar(45) NOT NULL,
  `long_description` varchar(300) NOT NULL,
  `short_description` varchar(45) NOT NULL,
  `bid_increment` int NOT NULL,
  `start_datetime` datetime NOT NULL,
  `end_datetime` datetime NOT NULL,
  `curr_bid` int NOT NULL,
  PRIMARY KEY (`auction_id`),
  UNIQUE KEY `auction_id_UNIQUE` (`auction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Auctions`
--

LOCK TABLES `Auctions` WRITE;
/*!40000 ALTER TABLE `Auctions` DISABLE KEYS */;
/*!40000 ALTER TABLE `Auctions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Bids`
--

DROP TABLE IF EXISTS `Bids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Bids` (
  `bid_id` int NOT NULL,
  `auction_id` int NOT NULL,
  `userName` varchar(45) NOT NULL,
  `amount` int NOT NULL,
  `max_amount` varchar(45) NOT NULL,
  `increment` int NOT NULL,
  PRIMARY KEY (`bid_id`),
  UNIQUE KEY `bid_id_UNIQUE` (`bid_id`),
  KEY `auction_id_idx` (`auction_id`),
  KEY `user_id_idx` (`userName`),
  CONSTRAINT `auction_id` FOREIGN KEY (`auction_id`) REFERENCES `Auctions` (`auction_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`userName`) REFERENCES `Accounts` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bids`
--

LOCK TABLES `Bids` WRITE;
/*!40000 ALTER TABLE `Bids` DISABLE KEYS */;
/*!40000 ALTER TABLE `Bids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Category`
--

DROP TABLE IF EXISTS `Category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Category` (
  `cat_id` int NOT NULL,
  `cat_name` varchar(45) NOT NULL,
  `cat_desc` varchar(45) NOT NULL,
  PRIMARY KEY (`cat_id`),
  UNIQUE KEY `cat_id_UNIQUE` (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Category`
--

LOCK TABLES `Category` WRITE;
/*!40000 ALTER TABLE `Category` DISABLE KEYS */;
/*!40000 ALTER TABLE `Category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Item_Options`
--

DROP TABLE IF EXISTS `Item_Options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Item_Options` (
  `item_option_id` int NOT NULL,
  `item_option_name` varchar(45) NOT NULL,
  `item_option_desc` varchar(300) NOT NULL,
  PRIMARY KEY (`item_option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Item_Options`
--

LOCK TABLES `Item_Options` WRITE;
/*!40000 ALTER TABLE `Item_Options` DISABLE KEYS */;
/*!40000 ALTER TABLE `Item_Options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Items`
--

DROP TABLE IF EXISTS `Items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Items` (
  `item_id` int NOT NULL,
  `desc` varchar(45) NOT NULL,
  PRIMARY KEY (`item_id`),
  UNIQUE KEY `item_id_UNIQUE` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Items`
--

LOCK TABLES `Items` WRITE;
/*!40000 ALTER TABLE `Items` DISABLE KEYS */;
/*!40000 ALTER TABLE `Items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Items_In_Auctions`
--

DROP TABLE IF EXISTS `Items_In_Auctions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Items_In_Auctions` (
  `ref_auction_id` int NOT NULL,
  `ref_item_id` int NOT NULL,
  PRIMARY KEY (`ref_auction_id`),
  KEY `item_id_idx` (`ref_item_id`),
  CONSTRAINT `ref_auction_id` FOREIGN KEY (`ref_auction_id`) REFERENCES `Auctions` (`auction_id`),
  CONSTRAINT `ref_item_id` FOREIGN KEY (`ref_item_id`) REFERENCES `Items` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Items_In_Auctions`
--

LOCK TABLES `Items_In_Auctions` WRITE;
/*!40000 ALTER TABLE `Items_In_Auctions` DISABLE KEYS */;
/*!40000 ALTER TABLE `Items_In_Auctions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Items_In_sub_cat`
--

DROP TABLE IF EXISTS `Items_In_sub_cat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Items_In_sub_cat` (
  `item_in_sub_cat_id` int NOT NULL,
  `ref_sub_cat_id` varchar(45) NOT NULL,
  PRIMARY KEY (`item_in_sub_cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Items_In_sub_cat`
--

LOCK TABLES `Items_In_sub_cat` WRITE;
/*!40000 ALTER TABLE `Items_In_sub_cat` DISABLE KEYS */;
/*!40000 ALTER TABLE `Items_In_sub_cat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sub_Cat_Options`
--

DROP TABLE IF EXISTS `Sub_Cat_Options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sub_Cat_Options` (
  `ref_item_option_id` int NOT NULL,
  `ref_sub_cat_idx` int NOT NULL,
  PRIMARY KEY (`ref_item_option_id`,`ref_sub_cat_idx`),
  KEY `ref_sub_cat_id_idx` (`ref_sub_cat_idx`),
  CONSTRAINT `ref_item_option_id` FOREIGN KEY (`ref_item_option_id`) REFERENCES `Item_Options` (`item_option_id`),
  CONSTRAINT `ref_sub_cat_idx` FOREIGN KEY (`ref_sub_cat_idx`) REFERENCES `Sub_Category` (`sub_cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sub_Cat_Options`
--

LOCK TABLES `Sub_Cat_Options` WRITE;
/*!40000 ALTER TABLE `Sub_Cat_Options` DISABLE KEYS */;
/*!40000 ALTER TABLE `Sub_Cat_Options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sub_Cat_To_Cat`
--

DROP TABLE IF EXISTS `Sub_Cat_To_Cat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sub_Cat_To_Cat` (
  `ref_sub_cat_id` int NOT NULL,
  `ref_cat_id` int NOT NULL,
  PRIMARY KEY (`ref_sub_cat_id`,`ref_cat_id`),
  KEY `ref_cat_id_idx` (`ref_cat_id`),
  CONSTRAINT `ref_cat_id` FOREIGN KEY (`ref_cat_id`) REFERENCES `Category` (`cat_id`),
  CONSTRAINT `ref_sub_cat_id` FOREIGN KEY (`ref_sub_cat_id`) REFERENCES `Sub_Category` (`sub_cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sub_Cat_To_Cat`
--

LOCK TABLES `Sub_Cat_To_Cat` WRITE;
/*!40000 ALTER TABLE `Sub_Cat_To_Cat` DISABLE KEYS */;
/*!40000 ALTER TABLE `Sub_Cat_To_Cat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sub_Category`
--

DROP TABLE IF EXISTS `Sub_Category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sub_Category` (
  `sub_cat_id` int NOT NULL,
  `sub_cat_name` varchar(45) NOT NULL,
  `sub_cat_desc` varchar(45) NOT NULL,
  PRIMARY KEY (`sub_cat_id`),
  UNIQUE KEY `sub_cat_id_UNIQUE` (`sub_cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sub_Category`
--

LOCK TABLES `Sub_Category` WRITE;
/*!40000 ALTER TABLE `Sub_Category` DISABLE KEYS */;
/*!40000 ALTER TABLE `Sub_Category` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-14 10:10:03
