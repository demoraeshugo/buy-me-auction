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
  `auction_id` varchar(50) NOT NULL,
  `init_price` varchar(45) NOT NULL,
  `min_price` varchar(45) NOT NULL,
  `long_description` varchar(300) NOT NULL,
  `short_description` varchar(45) NOT NULL,
  `bid_increment` int NOT NULL,
  `start_datetime` datetime NOT NULL,
  `end_datetime` datetime NOT NULL,
  `curr_bid` int DEFAULT NULL,
  PRIMARY KEY (`auction_id`),
  UNIQUE KEY `auction_id_UNIQUE` (`auction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Auctions`
--

LOCK TABLES `Auctions` WRITE;
/*!40000 ALTER TABLE `Auctions` DISABLE KEYS */;
INSERT INTO `Auctions` VALUES ('0373f694-1c73-43a3-bb99-402be3d0b50e','500','800','PC','PC',20,'2021-08-14 19:32:15','2021-08-14 19:32:15',NULL),('075bfca6-f564-4868-9fb6-8aec356ce544','500','800','PC','PC',20,'2021-08-14 19:24:51','2021-08-14 19:24:51',NULL),('0ccc69aa-0a65-4d04-bcdf-ca5d4a76aee6','500','800','PC','PC',20,'2021-08-14 19:30:10','2021-08-14 19:30:10',NULL),('398eabf2-869f-4a22-bfc0-0813c0496f9d','100','800','Test','Test',30,'2021-08-14 20:08:26','2021-08-14 20:08:26',NULL),('4e875224-e9ae-4d35-a2c9-d06922ecd8ef','450','1000','Test 3','Test 3',50,'2021-08-14 20:23:34','2021-08-14 20:23:34',NULL),('82cd559a-237c-4550-9b12-6bbf1bdf3b77','500','800','PC','PC',20,'2021-08-14 19:26:02','2021-08-14 19:26:02',NULL),('85fad9a0-31e6-42b6-9e84-e50c522b4fd0','500','2000','PC','PC',50,'2021-08-14 20:13:39','2021-08-14 20:13:39',NULL),('911360a6-5b0d-4903-995f-4bc6f7d23e11','500','800','Macbook','Macbook',20,'2021-08-14 19:20:59','2021-08-14 19:20:59',NULL),('a5b52a97-9c20-42e6-9751-8b4fc80e833d','800','1500','Test 2','Test 2',30,'2021-08-14 20:20:40','2021-08-14 20:20:40',NULL),('c968e60a-881c-42b0-9712-5ca57bbd0faf','500','800','PC','PC',20,'2021-08-14 20:05:40','2021-08-14 20:05:40',NULL),('cc2767fe-34d2-4fb4-a166-f2c1871aeb43','200','500','Test','Test',10,'2021-08-14 20:15:23','2021-08-14 20:15:23',NULL);
/*!40000 ALTER TABLE `Auctions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Bids`
--

DROP TABLE IF EXISTS `Bids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Bids` (
  `bid_id` varchar(50) NOT NULL,
  `auction_id` varchar(50) NOT NULL,
  `userName` varchar(45) NOT NULL,
  `amount` int NOT NULL,
  `max_amount` varchar(45) NOT NULL,
  `increment` int NOT NULL,
  PRIMARY KEY (`bid_id`),
  UNIQUE KEY `bid_id_UNIQUE` (`bid_id`),
  KEY `userName_idx` (`userName`),
  CONSTRAINT `auction_id` FOREIGN KEY (`bid_id`) REFERENCES `Auctions` (`auction_id`),
  CONSTRAINT `userName` FOREIGN KEY (`userName`) REFERENCES `Accounts` (`username`)
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
INSERT INTO `Category` VALUES (1,'Computers','Desktops, Laptops, and All-In-Ones');
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
  `item_option_desc` varchar(300) NOT NULL DEFAULT 'Please provide a description for the current option',
  `item_option_value` varchar(300) NOT NULL DEFAULT 'Please specify the value for the current option',
  PRIMARY KEY (`item_option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Item_Options`
--

LOCK TABLES `Item_Options` WRITE;
/*!40000 ALTER TABLE `Item_Options` DISABLE KEYS */;
INSERT INTO `Item_Options` VALUES (1,'CPU','Please provide a description for the current option','Please specify the value for the current option'),(2,'RAM','Please provide a description for the current option','Please specify the value for the current option');
/*!40000 ALTER TABLE `Item_Options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Items`
--

DROP TABLE IF EXISTS `Items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Items` (
  `item_id` varchar(50) NOT NULL,
  `item_desc` varchar(45) NOT NULL,
  `item_name` varchar(45) NOT NULL,
  PRIMARY KEY (`item_id`),
  UNIQUE KEY `item_id_UNIQUE` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Items`
--

LOCK TABLES `Items` WRITE;
/*!40000 ALTER TABLE `Items` DISABLE KEYS */;
INSERT INTO `Items` VALUES ('0f8ee41d-ee9e-49e2-b62b-51c7fcd93fba','Macbook ','Macbook'),('20e39823-f359-4090-889e-4e2c20d30fba','PC','PC'),('2fa9762e-ba4f-45a3-9af5-7b744d700c13','PC','PC'),('546cec96-f911-4a41-ba56-dec7dcd64c75','PC','PC'),('54b4e110-9a1c-4855-91b6-ebc6898d57c3','PC','PC'),('5c23e4c6-b345-4a5a-b0dd-fc3f456b38b0','Test 3','Test 3'),('8f2c34cd-457f-4064-a82e-dd70622337c3','Macbook','Macbook'),('9063e88d-e4c3-4cea-8204-8f7ae05df3be','PC','PC'),('a3d8defb-f1ff-4729-b631-97119e1e84f1','Test 2','Test 2'),('b60de2ed-ebd5-4e54-80de-1e4b7ca54e58','Test','Test'),('be43e015-8c06-4b9e-8e27-2ca70cc93686','PC','PC'),('c000f269-b979-49a5-a1ab-f59db5f02ed2','Mac','Mac'),('fb5a3da1-5957-4cdf-a7e0-08253272c97f','Test','Test');
/*!40000 ALTER TABLE `Items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Items_In_Auctions`
--

DROP TABLE IF EXISTS `Items_In_Auctions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Items_In_Auctions` (
  `ref_auction_id` varchar(50) NOT NULL,
  `ref_item_in_auction_id` varchar(50) NOT NULL,
  PRIMARY KEY (`ref_auction_id`,`ref_item_in_auction_id`),
  KEY `ref_item_id_idx` (`ref_item_in_auction_id`),
  KEY `ref_item_in_auction_id_idx` (`ref_item_in_auction_id`),
  CONSTRAINT `ref_auction_id` FOREIGN KEY (`ref_auction_id`) REFERENCES `Auctions` (`auction_id`),
  CONSTRAINT `ref_item_in_auction_id` FOREIGN KEY (`ref_item_in_auction_id`) REFERENCES `Items` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Items_In_Auctions`
--

LOCK TABLES `Items_In_Auctions` WRITE;
/*!40000 ALTER TABLE `Items_In_Auctions` DISABLE KEYS */;
INSERT INTO `Items_In_Auctions` VALUES ('c968e60a-881c-42b0-9712-5ca57bbd0faf','20e39823-f359-4090-889e-4e2c20d30fba'),('0373f694-1c73-43a3-bb99-402be3d0b50e','2fa9762e-ba4f-45a3-9af5-7b744d700c13'),('85fad9a0-31e6-42b6-9e84-e50c522b4fd0','54b4e110-9a1c-4855-91b6-ebc6898d57c3'),('4e875224-e9ae-4d35-a2c9-d06922ecd8ef','5c23e4c6-b345-4a5a-b0dd-fc3f456b38b0'),('a5b52a97-9c20-42e6-9751-8b4fc80e833d','a3d8defb-f1ff-4729-b631-97119e1e84f1'),('cc2767fe-34d2-4fb4-a166-f2c1871aeb43','b60de2ed-ebd5-4e54-80de-1e4b7ca54e58'),('398eabf2-869f-4a22-bfc0-0813c0496f9d','fb5a3da1-5957-4cdf-a7e0-08253272c97f');
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
-- Table structure for table `Lists_Auction`
--

DROP TABLE IF EXISTS `Lists_Auction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Lists_Auction` (
  `listed_auction_username` varchar(45) NOT NULL,
  `listed_auction_auction_id` varchar(50) NOT NULL,
  PRIMARY KEY (`listed_auction_username`,`listed_auction_auction_id`),
  KEY `listed_auction_auction_id_idx` (`listed_auction_auction_id`),
  CONSTRAINT `listed_auction_auction_id` FOREIGN KEY (`listed_auction_auction_id`) REFERENCES `Auctions` (`auction_id`),
  CONSTRAINT `listed_auction_username` FOREIGN KEY (`listed_auction_username`) REFERENCES `Accounts` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Lists_Auction`
--

LOCK TABLES `Lists_Auction` WRITE;
/*!40000 ALTER TABLE `Lists_Auction` DISABLE KEYS */;
INSERT INTO `Lists_Auction` VALUES ('adminUser','4e875224-e9ae-4d35-a2c9-d06922ecd8ef'),('adminUser','a5b52a97-9c20-42e6-9751-8b4fc80e833d'),('adminUser','cc2767fe-34d2-4fb4-a166-f2c1871aeb43');
/*!40000 ALTER TABLE `Lists_Auction` ENABLE KEYS */;
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
INSERT INTO `Sub_Cat_To_Cat` VALUES (1,1);
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
  `sub_cat_desc` varchar(300) NOT NULL,
  PRIMARY KEY (`sub_cat_id`),
  UNIQUE KEY `sub_cat_id_UNIQUE` (`sub_cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sub_Category`
--

LOCK TABLES `Sub_Category` WRITE;
/*!40000 ALTER TABLE `Sub_Category` DISABLE KEYS */;
INSERT INTO `Sub_Category` VALUES (1,'Laptops','Portable Business, Personal, and Performance Machines');
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

-- Dump completed on 2021-08-14 23:28:30
