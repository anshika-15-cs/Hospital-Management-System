-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: hospital_management
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int DEFAULT NULL,
  `doctor_id` int DEFAULT NULL,
  `appointment_date` date DEFAULT NULL,
  `reason` varchar(100) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `patient_id` (`patient_id`),
  KEY `doctor_id` (`doctor_id`),
  CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`),
  CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
INSERT INTO `appointments` VALUES (1,1,101,'2025-09-01','Tooth Pain','Completed'),(2,2,102,'2025-09-02','Eye Checkup','Completed'),(3,3,103,'2025-09-03','Pregnancy Care','Pending'),(4,4,104,'2025-09-04','Ear Pain','Completed'),(5,5,105,'2025-09-05','Cough','Completed'),(6,6,106,'2025-09-06','Accident Injury','Pending'),(7,7,107,'2025-09-07','Child Fever','Completed'),(8,8,108,'2025-09-08','Skin Rash','Completed'),(9,9,109,'2025-09-09','Headache','Pending'),(10,10,110,'2025-09-10','Chest Pain','Completed');
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctors` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  `Specialization` varchar(50) DEFAULT NULL,
  `Phone` char(10) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Experience` int DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors`
--

LOCK TABLES `doctors` WRITE;
/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
INSERT INTO `doctors` VALUES (101,'Ravi','Dentist','9876543211','ravi.dentist@example.com',8),(102,'Amit','Eye','9876543221','amit.eye@example.com',10),(103,'Sunil','Gyno','9876543232','sunil.gyno@example.com',12),(104,'Vijay','ENT','9876543244','vijay.ent@example.com',9),(105,'Neha','Physician','9876543245','neha.physician@example.com',7),(106,'Kiran','Orthopedic','9876543526','kiran.ortho@example.com',11),(107,'Suman','Child','9876543267','suman.child@example.com',5),(108,'Anil','Skin','9876543287','anil.skin@example.com',6),(109,'Pooja','Neuro','9876543289','pooja.neuro@example.com',14),(110,'Raj','Cardio','9876543320','raj.cardio@example.com',15),(111,'Shreya','Cardio','9898765742','drshreyasingh123@gmail.com',8),(112,'RADHIKA','SURGEON','9876574823','drradha234@gmail.com',8);
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `phone` bigint DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (1,'Arun',9876500001,'Male','1990-05-15','Lucknow, UP'),(2,'Shivansh',9876500002,'Female','1995-08-20','Kanpur, UP'),(3,'Rakesh',9876789085,'Male','1988-03-10','Jaipur, Rajasthan'),(4,'Sita',9564356788,'Female','2000-07-22','Delhi'),(5,'Vikas',9876500005,'Male','1992-11-02','Varanasi, UP'),(6,'Rani',9876500006,'Female','1985-09-25','Jodhpur, Rajasthan'),(7,'Manoj',9876500007,'Male','1998-01-17','Noida, UP'),(8,'Seema',9876500008,'Female','1993-12-12','Udaipur, Rajasthan'),(9,'Ajay',9876500009,'Male','1987-04-30','Delhi'),(10,'Kavita',9876500010,'Female','1999-06-05','Agra, UP'),(11,'Rahul',9876500011,'Male','1991-02-21','Alwar, Rajasthan'),(12,'Priti',9876500012,'Female','1996-10-19','Ghaziabad, UP'),(13,'Deepak',9876500013,'Male','1994-09-08','Bikaner, Rajasthan'),(14,'Anita',9876500014,'Female','2001-11-30','Delhi'),(15,'Karan',9876500015,'Male','1997-07-14','Lucknow, UP'),(16,'Shalu',9876500016,'Female','1989-08-09','Ajmer, Rajasthan'),(17,'Mohit',9876500017,'Male','1990-03-19','Meerut, UP'),(18,'Jyoti',9876500018,'Female','1992-12-03','Delhi'),(19,'Suresh',9876500019,'Male','1986-05-27','Kota, Rajasthan'),(20,'Geeta',9876500020,'Female','1998-09-11','Varanasi, UP'),(21,'Aarush',9872345621,'M','2001-02-03','Lucknow,UP');
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-30 18:09:46
