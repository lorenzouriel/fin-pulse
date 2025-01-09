-- MySQL dump 10.13  Distrib 8.0.40, for Linux (x86_64)
--
-- Host: localhost    Database: stock
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `stock_data`
--

DROP TABLE IF EXISTS `stock_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `stock_id` int DEFAULT NULL,
  `date` date NOT NULL,
  `open_price` decimal(10,2) DEFAULT NULL,
  `close_price` decimal(10,2) DEFAULT NULL,
  `high_price` decimal(10,2) DEFAULT NULL,
  `low_price` decimal(10,2) DEFAULT NULL,
  `volume` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `stock_id` (`stock_id`),
  CONSTRAINT `stock_data_ibfk_1` FOREIGN KEY (`stock_id`) REFERENCES `stocks` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_data`
--

LOCK TABLES `stock_data` WRITE;
/*!40000 ALTER TABLE `stock_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_performance`
--

DROP TABLE IF EXISTS `stock_performance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_performance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `stock_id` int DEFAULT NULL,
  `date` date NOT NULL,
  `percent_change` decimal(5,2) DEFAULT NULL,
  `moving_avg` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `stock_id` (`stock_id`),
  CONSTRAINT `stock_performance_ibfk_1` FOREIGN KEY (`stock_id`) REFERENCES `stocks` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_performance`
--

LOCK TABLES `stock_performance` WRITE;
/*!40000 ALTER TABLE `stock_performance` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_performance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stocks`
--

DROP TABLE IF EXISTS `stocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stocks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ticker` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `sector` varchar(100) DEFAULT NULL,
  `industry` varchar(100) DEFAULT NULL,
  `currency` varchar(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stocks`
--

LOCK TABLES `stocks` WRITE;
/*!40000 ALTER TABLE `stocks` DISABLE KEYS */;
INSERT INTO `stocks` VALUES (1,'AAPL','Apple Inc.','Technology','Consumer Electronics','USD','2025-01-09 01:24:03'),(2,'MSFT','Microsoft Corp.','Technology','Software - Infrastructure','USD','2025-01-09 01:24:03'),(3,'GOOGL','Alphabet Inc.','Communication Services','Interactive Media & Services','USD','2025-01-09 01:24:03'),(4,'AMZN','Amazon.com Inc.','Consumer Discretionary','Internet & Direct Marketing Retail','USD','2025-01-09 01:24:03'),(5,'TSLA','Tesla Inc.','Consumer Discretionary','Automobile Manufacturers','USD','2025-01-09 01:24:03'),(6,'META','Meta Platforms Inc.','Communication Services','Interactive Media & Services','USD','2025-01-09 01:24:03'),(7,'NVDA','NVIDIA Corp.','Technology','Semiconductors','USD','2025-01-09 01:24:03'),(8,'BRK.B','Berkshire Hathaway Inc.','Financials','Insurance - Diversified','USD','2025-01-09 01:24:03'),(9,'JPM','JPMorgan Chase & Co.','Financials','Banks - Diversified','USD','2025-01-09 01:24:03'),(10,'V','Visa Inc.','Information Technology','Information Technology Services','USD','2025-01-09 01:24:03'),(11,'PETR4','Petrobras S.A.','Energy','Oil & Gas Exploration & Production','BRL','2025-01-09 01:24:56'),(12,'VALE3','Vale S.A.','Materials','Metal & Mining','BRL','2025-01-09 01:24:56'),(13,'ITUB4','Ita+� Unibanco Holding S.A.','Financials','Banks - Diversified','BRL','2025-01-09 01:24:56'),(14,'B3SA3','B3 S.A. - Brasil, Bolsa, Balc+�o','Financials','Capital Markets','BRL','2025-01-09 01:24:56'),(15,'AMER3','Americanas S.A.','Consumer Discretionary','Internet & Direct Marketing Retail','BRL','2025-01-09 01:24:56'),(16,'ABEV3','Ambev S.A.','Consumer Staples','Beverages - Brewers','BRL','2025-01-09 01:24:56'),(17,'GGBR4','Gerdau S.A.','Materials','Steel','BRL','2025-01-09 01:24:56'),(18,'MGLU3','Magazine Luiza S.A.','Consumer Discretionary','General Merchandise Stores','BRL','2025-01-09 01:24:56'),(19,'LREN3','Lojas Renner S.A.','Consumer Discretionary','Apparel Retail','BRL','2025-01-09 01:24:56'),(20,'EGIE3','Engie Brasil Energia S.A.','Utilities','Electric Utilities','BRL','2025-01-09 01:24:56');
/*!40000 ALTER TABLE `stocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_activity_logs`
--

DROP TABLE IF EXISTS `user_activity_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_activity_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `action` varchar(100) NOT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_activity_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_activity_logs`
--

LOCK TABLES `user_activity_logs` WRITE;
/*!40000 ALTER TABLE `user_activity_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_activity_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_selections`
--

DROP TABLE IF EXISTS `user_selections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_selections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `stock_id` int DEFAULT NULL,
  `selected_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `stock_id` (`stock_id`),
  CONSTRAINT `user_selections_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `user_selections_ibfk_2` FOREIGN KEY (`stock_id`) REFERENCES `stocks` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_selections`
--

LOCK TABLES `user_selections` WRITE;
/*!40000 ALTER TABLE `user_selections` DISABLE KEYS */;
INSERT INTO `user_selections` VALUES (1,1,1,'2025-01-09 01:30:35','2025-01-09 01:30:35'),(2,1,2,'2025-01-09 01:30:35','2025-01-09 01:30:35'),(3,1,3,'2025-01-09 01:30:35','2025-01-09 01:30:35'),(4,1,4,'2025-01-09 01:30:35','2025-01-09 01:30:35'),(5,1,5,'2025-01-09 01:30:35','2025-01-09 01:30:35'),(6,1,6,'2025-01-09 01:30:35','2025-01-09 01:30:35'),(7,1,7,'2025-01-09 01:30:35','2025-01-09 01:30:35'),(8,1,8,'2025-01-09 01:30:35','2025-01-09 01:30:35'),(9,1,9,'2025-01-09 01:30:35','2025-01-09 01:30:35'),(10,1,10,'2025-01-09 01:30:35','2025-01-09 01:30:35'),(11,2,11,'2025-01-09 01:30:40','2025-01-09 01:30:40'),(12,2,12,'2025-01-09 01:30:40','2025-01-09 01:30:40'),(13,2,13,'2025-01-09 01:30:40','2025-01-09 01:30:40'),(14,2,14,'2025-01-09 01:30:40','2025-01-09 01:30:40'),(15,2,15,'2025-01-09 01:30:40','2025-01-09 01:30:40'),(16,2,16,'2025-01-09 01:30:40','2025-01-09 01:30:40'),(17,2,17,'2025-01-09 01:30:40','2025-01-09 01:30:40'),(18,2,18,'2025-01-09 01:30:40','2025-01-09 01:30:40'),(19,2,19,'2025-01-09 01:30:40','2025-01-09 01:30:40'),(20,2,20,'2025-01-09 01:30:40','2025-01-09 01:30:40');
/*!40000 ALTER TABLE `user_selections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `access_key` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Lorenzo Uriel','lorenzouriel394@gmail.com','lorenzouriel','2025-01-09 01:28:31'),(2,'Data Ape','dataape9@gmail.com','dataape9','2025-01-09 01:28:31');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watchlists`
--

DROP TABLE IF EXISTS `watchlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `watchlists` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `watchlists_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watchlists`
--

LOCK TABLES `watchlists` WRITE;
/*!40000 ALTER TABLE `watchlists` DISABLE KEYS */;
/*!40000 ALTER TABLE `watchlists` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-09  1:35:08
