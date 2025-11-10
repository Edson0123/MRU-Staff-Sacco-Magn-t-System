CREATE DATABASE  IF NOT EXISTS `university_sacco` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `university_sacco`;
-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: university_sacco
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `transaction_id` int NOT NULL AUTO_INCREMENT,
  `staff_id` int NOT NULL,
  `transaction_type` enum('deposit','withdrawal','loan_approval','loan_repayment','interest_payment','donation') NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `description` text,
  `transaction_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `approved_by` int DEFAULT NULL,
  `status` enum('pending','approved','rejected','completed') DEFAULT 'pending',
  `receipt_number` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`transaction_id`),
  UNIQUE KEY `receipt_number` (`receipt_number`),
  KEY `staff_id` (`staff_id`),
  KEY `approved_by` (`approved_by`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`approved_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,2,'deposit',50000.00,'Monthly savings contribution','2025-11-03 18:49:59',NULL,'completed',NULL),(2,3,'deposit',75000.00,'Monthly savings contribution','2025-11-03 18:49:59',NULL,'completed',NULL),(3,4,'deposit',40000.00,'Monthly savings contribution','2025-11-03 18:49:59',NULL,'completed',NULL),(4,5,'deposit',100000.00,'Savings deposit','2025-11-03 19:40:50',NULL,'completed',NULL),(5,5,'loan_approval',50000.00,'Loan approved','2025-11-05 13:24:08',1,'completed',NULL),(6,5,'loan_repayment',55000.00,'Loan repayment','2025-11-05 13:30:39',NULL,'completed',NULL),(7,5,'withdrawal',50000.00,'Withdrawal approved','2025-11-05 13:34:11',1,'completed',NULL),(8,5,'withdrawal',5000.00,'Withdrawal approved','2025-11-05 13:34:18',1,'completed',NULL),(9,5,'withdrawal',10000.00,'Withdrawal approved','2025-11-05 13:52:41',1,'completed',NULL),(10,6,'loan_approval',30000.00,'Loan approved','2025-11-05 15:43:24',1,'completed',NULL),(11,6,'deposit',100000.00,'Savings deposit','2025-11-05 15:45:11',NULL,'completed',NULL),(12,7,'deposit',1000000.00,'Savings deposit','2025-11-06 07:02:39',NULL,'completed',NULL),(13,7,'loan_approval',10000.00,'Loan approved','2025-11-06 07:05:42',1,'completed',NULL),(14,7,'withdrawal',1000.00,'Withdrawal approved','2025-11-06 07:06:57',1,'completed',NULL),(15,6,'deposit',300000.00,'Savings deposit','2025-11-06 08:19:19',NULL,'completed',NULL),(16,6,'loan_approval',100000.00,'Loan approved','2025-11-06 08:22:24',1,'completed',NULL),(17,6,'withdrawal',30000.00,'Withdrawal approved','2025-11-06 08:22:32',1,'completed',NULL);
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-10 16:31:26
