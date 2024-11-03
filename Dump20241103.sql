CREATE DATABASE  IF NOT EXISTS `sims` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sims`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: sims
-- ------------------------------------------------------
-- Server version	9.0.1

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
-- Temporary view structure for view `attendance_eligibility`
--

DROP TABLE IF EXISTS `attendance_eligibility`;
/*!50001 DROP VIEW IF EXISTS `attendance_eligibility`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `attendance_eligibility` AS SELECT 
 1 AS `Stu_reg_num`,
 1 AS `Full_Name`,
 1 AS `eligibility`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `compnetwork_ict1253_marks`
--

DROP TABLE IF EXISTS `compnetwork_ict1253_marks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compnetwork_ict1253_marks` (
  `student_id` varchar(15) NOT NULL,
  `CouId` varchar(10) NOT NULL,
  `quiz_1` int DEFAULT '0',
  `quiz_2` int DEFAULT '0',
  `quiz_3` int DEFAULT '0',
  `inclass_assignment` int DEFAULT '0',
  `finl_quiz_marks` decimal(5,2) GENERATED ALWAYS AS ((((((`quiz_1` + `quiz_2`) + `quiz_3`) - least(`quiz_1`,`quiz_2`,`quiz_3`)) / 2) * 0.10)) STORED,
  `mid_practicl` int DEFAULT '0',
  `Finl_CA_marks` decimal(5,2) GENERATED ALWAYS AS ((((`inclass_assignment` * 0.10) + `finl_quiz_marks`) + (`mid_practicl` * 0.10))) STORED,
  `end_theory` int DEFAULT '0',
  `end_practicl` int DEFAULT '0',
  `Finl_marks` decimal(5,2) GENERATED ALWAYS AS ((`Finl_CA_marks` + ((`end_theory` + `end_practicl`) * 0.70))) STORED,
  PRIMARY KEY (`student_id`,`CouId`),
  KEY `CouId` (`CouId`),
  CONSTRAINT `compnetwork_ict1253_marks_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`),
  CONSTRAINT `compnetwork_ict1253_marks_ibfk_2` FOREIGN KEY (`CouId`) REFERENCES `course` (`CouId`),
  CONSTRAINT `compnetwork_ict1253_marks_ibfk_3` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compnetwork_ict1253_marks`
--

LOCK TABLES `compnetwork_ict1253_marks` WRITE;
/*!40000 ALTER TABLE `compnetwork_ict1253_marks` DISABLE KEYS */;
INSERT INTO `compnetwork_ict1253_marks` (`student_id`, `CouId`, `quiz_1`, `quiz_2`, `quiz_3`, `inclass_assignment`, `mid_practicl`, `end_theory`, `end_practicl`) VALUES ('TG1055','ICT1253',90,95,58,54,50,90,94),('TG1310','ICT1253',90,95,98,85,75,75,80),('TG1343','ICT1253',80,85,86,72,84,46,45),('TG1350','ICT1253',95,54,25,82,76,65,65),('TG1380','ICT1253',88,75,84,90,45,65,55),('TG1388','ICT1253',75,88,65,65,80,55,75),('TG1410','ICT1253',55,64,62,84,45,94,78),('TG1453','ICT1253',97,90,75,88,88,94,84),('TG1476','ICT1253',84,90,95,90,55,60,72),('TG1583','ICT1253',79,75,88,79,80,78,95),('TG1587','ICT1253',87,85,95,75,55,50,80),('TG1594','ICT1253',95,86,80,64,62,48,65);
/*!40000 ALTER TABLE `compnetwork_ict1253_marks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `computer_archi_ict1242_marks`
--

DROP TABLE IF EXISTS `computer_archi_ict1242_marks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `computer_archi_ict1242_marks` (
  `student_id` varchar(15) NOT NULL,
  `CouId` varchar(10) NOT NULL,
  `quiz_1` int DEFAULT '0',
  `quiz_2` int DEFAULT '0',
  `quiz_3` int DEFAULT '0',
  `inclass_assignment` int DEFAULT '0',
  `finl_quiz_marks` decimal(5,2) GENERATED ALWAYS AS ((((((`quiz_1` + `quiz_2`) + `quiz_3`) - least(`quiz_1`,`quiz_2`,`quiz_3`)) / 2) * 0.10)) STORED,
  `mid_exam` int DEFAULT '0',
  `Finl_CA_marks` decimal(5,2) GENERATED ALWAYS AS ((((`mid_exam` * 0.20) + `finl_quiz_marks`) + (`inclass_assignment` * 0.10))) STORED,
  `end_theory` int DEFAULT '0',
  `Finl_marks` decimal(5,2) GENERATED ALWAYS AS ((`Finl_CA_marks` + (`end_theory` * 0.60))) STORED,
  PRIMARY KEY (`student_id`,`CouId`),
  KEY `CouId` (`CouId`),
  CONSTRAINT `computer_archi_ict1242_marks_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`),
  CONSTRAINT `computer_archi_ict1242_marks_ibfk_2` FOREIGN KEY (`CouId`) REFERENCES `course` (`CouId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `computer_archi_ict1242_marks`
--

LOCK TABLES `computer_archi_ict1242_marks` WRITE;
/*!40000 ALTER TABLE `computer_archi_ict1242_marks` DISABLE KEYS */;
INSERT INTO `computer_archi_ict1242_marks` (`student_id`, `CouId`, `quiz_1`, `quiz_2`, `quiz_3`, `inclass_assignment`, `mid_exam`, `end_theory`) VALUES ('TG1025','ICT1242',65,40,38,77,40,74),('TG1055','ICT1242',40,33,85,80,50,45),('TG1087','ICT1242',72,84,20,78,76,60),('TG1310','ICT1242',80,77,69,95,55,65),('TG1343','ICT1242',66,75,65,85,45,50),('TG1350','ICT1242',92,50,68,77,35,94),('TG1380','ICT1242',60,51,48,80,94,55),('TG1388','ICT1242',64,55,25,75,75,50),('TG1410','ICT1242',55,50,72,100,49,82),('TG1453','ICT1242',75,30,14,80,70,45),('TG1476','ICT1242',50,55,84,82,65,45),('TG1583','ICT1242',35,89,76,100,41,69),('TG1587','ICT1242',90,65,88,94,85,80),('TG1594','ICT1242',44,85,94,68,88,76);
/*!40000 ALTER TABLE `computer_archi_ict1242_marks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `CouId` varchar(10) NOT NULL,
  `CouName` varchar(50) DEFAULT NULL,
  `CouCredit` int DEFAULT NULL,
  `Course_time` int DEFAULT NULL,
  `CourType` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`CouId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES ('ENG1222','English II',2,15,'Theory'),('ICT1212','Database Management Systems',2,15,'Theory'),('ICT1222','Database Management Systems Practicum',2,15,'Practical'),('ICT1233','Server-Side Web Development',3,30,'Both'),('ICT1242','Computer Architecture',2,15,'Theory'),('ICT1253','Computer Networks',3,30,'Both'),('TCS1212','Fundamentals of Management',2,15,'Theory'),('TMS1223','Discrete Mathematics',3,15,'Theory');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbms_practical_ict1222_marks`
--

DROP TABLE IF EXISTS `dbms_practical_ict1222_marks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbms_practical_ict1222_marks` (
  `student_id` varchar(15) NOT NULL,
  `CouId` varchar(10) NOT NULL,
  `quiz_1` int DEFAULT '0',
  `quiz_2` int DEFAULT '0',
  `quiz_3` int DEFAULT '0',
  `finl_quiz_marks` decimal(5,2) GENERATED ALWAYS AS ((((((`quiz_1` + `quiz_2`) + `quiz_3`) - least(`quiz_1`,`quiz_2`,`quiz_3`)) / 2) * 0.10)) STORED,
  `mid_practicl` int DEFAULT '0',
  `grp_project` decimal(5,2) DEFAULT '0.00',
  `Finl_CA_marks` decimal(5,2) GENERATED ALWAYS AS (((`mid_practicl` * 0.20) + (`grp_project` * 0.10))) STORED,
  `end_practicl` int DEFAULT '0',
  `Finl_marks` decimal(5,2) GENERATED ALWAYS AS ((`Finl_CA_marks` + (`end_practicl` * 0.70))) STORED,
  PRIMARY KEY (`student_id`,`CouId`),
  KEY `CouId` (`CouId`),
  CONSTRAINT `dbms_practical_ict1222_marks_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`),
  CONSTRAINT `dbms_practical_ict1222_marks_ibfk_2` FOREIGN KEY (`CouId`) REFERENCES `course` (`CouId`),
  CONSTRAINT `dbms_practical_ict1222_marks_ibfk_3` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbms_practical_ict1222_marks`
--

LOCK TABLES `dbms_practical_ict1222_marks` WRITE;
/*!40000 ALTER TABLE `dbms_practical_ict1222_marks` DISABLE KEYS */;
INSERT INTO `dbms_practical_ict1222_marks` (`student_id`, `CouId`, `quiz_1`, `quiz_2`, `quiz_3`, `mid_practicl`, `grp_project`, `end_practicl`) VALUES ('TG1310','ICT1222',0,0,0,88,75.00,65),('TG1343','ICT1222',0,0,0,65,78.00,63),('TG1350','ICT1222',0,0,0,80,84.00,86),('TG1380','ICT1222',0,0,0,75,74.00,68),('TG1388','ICT1222',0,0,0,80,87.00,48),('TG1410','ICT1222',0,0,0,75,80.00,85),('TG1453','ICT1222',0,0,0,75,65.00,50),('TG1476','ICT1222',0,0,0,87,50.00,80),('TG1583','ICT1222',0,0,0,70,70.00,80),('TG1587','ICT1222',0,0,0,78,64.00,55),('TG1594','ICT1222',0,0,0,85,90.00,90);
/*!40000 ALTER TABLE `dbms_practical_ict1222_marks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbms_theory_ict1212_marks`
--

DROP TABLE IF EXISTS `dbms_theory_ict1212_marks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbms_theory_ict1212_marks` (
  `student_id` varchar(15) NOT NULL,
  `CouId` varchar(10) NOT NULL,
  `quiz_1` int DEFAULT '0',
  `quiz_2` int DEFAULT '0',
  `quiz_3` int DEFAULT '0',
  `inclass_assignment` int DEFAULT '0',
  `finl_quiz_marks` decimal(5,2) GENERATED ALWAYS AS ((((((`quiz_1` + `quiz_2`) + `quiz_3`) - least(`quiz_1`,`quiz_2`,`quiz_3`)) / 2) * 0.10)) STORED,
  `mid_theory` int DEFAULT '0',
  `Finl_CA_marks` decimal(5,2) GENERATED ALWAYS AS (((`mid_theory` * 0.20) + `finl_quiz_marks`)) STORED,
  `end_theory` int DEFAULT '0',
  `Finl_marks` decimal(5,2) GENERATED ALWAYS AS ((`Finl_CA_marks` + (`end_theory` * 0.70))) STORED,
  PRIMARY KEY (`student_id`,`CouId`),
  KEY `CouId` (`CouId`),
  CONSTRAINT `dbms_theory_ict1212_marks_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`),
  CONSTRAINT `dbms_theory_ict1212_marks_ibfk_2` FOREIGN KEY (`CouId`) REFERENCES `course` (`CouId`),
  CONSTRAINT `dbms_theory_ict1212_marks_ibfk_3` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbms_theory_ict1212_marks`
--

LOCK TABLES `dbms_theory_ict1212_marks` WRITE;
/*!40000 ALTER TABLE `dbms_theory_ict1212_marks` DISABLE KEYS */;
INSERT INTO `dbms_theory_ict1212_marks` (`student_id`, `CouId`, `quiz_1`, `quiz_2`, `quiz_3`, `inclass_assignment`, `mid_theory`, `end_theory`) VALUES ('TG1310','ICT1212',45,75,85,0,55,75),('TG1343','ICT1212',90,85,94,0,84,79),('TG1350','ICT1212',75,88,64,0,82,75),('TG1380','ICT1212',78,85,90,0,94,84),('TG1388','ICT1212',80,24,55,0,65,71),('TG1410','ICT1212',90,78,88,0,75,85),('TG1453','ICT1212',45,64,35,0,57,64),('TG1476','ICT1212',88,95,87,0,85,88),('TG1583','ICT1212',88,98,100,0,87,85),('TG1587','ICT1212',88,87,80,0,84,60),('TG1594','ICT1212',95,96,90,0,88,80);
/*!40000 ALTER TABLE `dbms_theory_ict1212_marks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discrete_maths_tms1233_marks`
--

DROP TABLE IF EXISTS `discrete_maths_tms1233_marks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discrete_maths_tms1233_marks` (
  `student_id` varchar(15) NOT NULL,
  `CouId` varchar(10) NOT NULL,
  `quiz_1` int DEFAULT '0',
  `quiz_2` int DEFAULT '0',
  `quiz_3` int DEFAULT '0',
  `tut_assesment` int DEFAULT '0',
  `finl_quiz_marks` decimal(5,2) GENERATED ALWAYS AS ((((((`quiz_1` + `quiz_2`) + `quiz_3`) - least(`quiz_1`,`quiz_2`,`quiz_3`)) / 2) * 0.10)) STORED,
  `mid_exam` int DEFAULT '0',
  `Finl_CA_marks` decimal(5,2) GENERATED ALWAYS AS ((((`mid_exam` * 0.25) + `finl_quiz_marks`) + (`tut_assesment` * 0.05))) STORED,
  `end_exam` int DEFAULT '0',
  `Finl_marks` decimal(5,2) GENERATED ALWAYS AS ((`Finl_CA_marks` + (`end_exam` * 0.60))) STORED,
  PRIMARY KEY (`student_id`,`CouId`),
  KEY `CouId` (`CouId`),
  CONSTRAINT `discrete_maths_tms1233_marks_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`),
  CONSTRAINT `discrete_maths_tms1233_marks_ibfk_2` FOREIGN KEY (`CouId`) REFERENCES `course` (`CouId`),
  CONSTRAINT `discrete_maths_tms1233_marks_ibfk_3` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discrete_maths_tms1233_marks`
--

LOCK TABLES `discrete_maths_tms1233_marks` WRITE;
/*!40000 ALTER TABLE `discrete_maths_tms1233_marks` DISABLE KEYS */;
INSERT INTO `discrete_maths_tms1233_marks` (`student_id`, `CouId`, `quiz_1`, `quiz_2`, `quiz_3`, `tut_assesment`, `mid_exam`, `end_exam`) VALUES ('TG1310','ICT1233',75,88,94,75,75,80),('TG1343','ICT1233',95,90,94,85,75,70),('TG1350','ICT1233',90,97,25,35,65,45),('TG1380','ICT1233',75,84,75,41,95,45),('TG1388','ICT1233',75,85,100,65,76,80),('TG1410','ICT1233',96,78,84,64,45,65),('TG1453','ICT1233',80,85,85,65,77,75),('TG1476','ICT1233',45,45,84,63,51,50),('TG1583','ICT1233',98,95,90,44,64,84),('TG1587','ICT1233',88,85,90,67,84,75),('TG1594','ICT1233',87,99,92,70,58,45);
/*!40000 ALTER TABLE `discrete_maths_tms1233_marks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `english_eng1222_marks`
--

DROP TABLE IF EXISTS `english_eng1222_marks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `english_eng1222_marks` (
  `student_id` varchar(15) NOT NULL,
  `CouId` varchar(10) NOT NULL,
  `quiz_1` int DEFAULT '0',
  `quiz_2` int DEFAULT '0',
  `quiz_3` int DEFAULT '0',
  `finl_quiz_marks` decimal(5,2) GENERATED ALWAYS AS ((((((`quiz_1` + `quiz_2`) + `quiz_3`) - least(`quiz_1`,`quiz_2`,`quiz_3`)) / 2) * 0.20)) STORED,
  `mid_exam` int DEFAULT '0',
  `Finl_CA_marks` decimal(5,2) GENERATED ALWAYS AS (((`mid_exam` * 0.20) + `finl_quiz_marks`)) STORED,
  `end_exam` int DEFAULT '0',
  `Finl_marks` decimal(5,2) GENERATED ALWAYS AS ((`Finl_CA_marks` + (`end_exam` * 0.60))) STORED,
  PRIMARY KEY (`student_id`,`CouId`),
  KEY `CouId` (`CouId`),
  CONSTRAINT `english_eng1222_marks_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`),
  CONSTRAINT `english_eng1222_marks_ibfk_2` FOREIGN KEY (`CouId`) REFERENCES `course` (`CouId`),
  CONSTRAINT `english_eng1222_marks_ibfk_3` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `english_eng1222_marks`
--

LOCK TABLES `english_eng1222_marks` WRITE;
/*!40000 ALTER TABLE `english_eng1222_marks` DISABLE KEYS */;
INSERT INTO `english_eng1222_marks` (`student_id`, `CouId`, `quiz_1`, `quiz_2`, `quiz_3`, `mid_exam`, `end_exam`) VALUES ('TG1025','ENG1222',65,70,60,48,59),('TG1042','ENG1222',65,50,40,48,59),('TG1125','ENG1222',64,55,25,75,50),('TG1310','ENG1222',88,50,45,65,75),('TG1343','ENG1222',44,85,94,88,76),('TG1350','ENG1222',66,75,65,45,50),('TG1380','ENG1222',64,55,75,75,50),('TG1388','ENG1222',51,48,80,45,70),('TG1410','ENG1222',50,55,84,65,45),('TG1453','ENG1222',40,33,85,50,45),('TG1476','ENG1222',90,65,94,85,80),('TG1583','ENG1222',72,84,78,76,60),('TG1587','ENG1222',80,77,69,55,65),('TG1594','ENG1222',40,33,85,50,45);
/*!40000 ALTER TABLE `english_eng1222_marks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lecture`
--

DROP TABLE IF EXISTS `lecture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lecture` (
  `LecId` varchar(4) NOT NULL,
  `LecName` varchar(100) DEFAULT NULL,
  `LecEmail` varchar(50) DEFAULT NULL,
  `LecContact` varchar(15) DEFAULT NULL,
  `LecPosition` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`LecId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecture`
--

LOCK TABLES `lecture` WRITE;
/*!40000 ALTER TABLE `lecture` DISABLE KEYS */;
INSERT INTO `lecture` VALUES ('L001','Prof. P.K.S.C Jayasinghe','subash@ictec.ruh.ac.lk','0711234567','Senior Lecturer'),('L003','Ms. Rumeshika W. arachi','rumeshika@ictec.ruh.ac.lk','0711234567','Lecturer(Probationary)'),('L004','Ms. Malsha Prabuddhi','malsha@ictec.ruh.ac.lk','0711234567','Lecturer (Probationary)'),('L005','Ms. Chanduni Gamage','chanduni@ictec.ruh.ac.lk','0711234567','Lecturer (Probationary)'),('L006','Ms. E.H.M.P.M. Wijerathna','piyumi@ictec.ruh.ac.lk','0711234567','Lecturer (Probationary)'),('L007','Ms. R.D.N. Shakya','shakya@ictec.ruh.ac.lk','0711234567','Lecturer (Probationary)'),('L008','Ms. Akila Brahmana','akila@ictec.ruh.ac.lk','0711234567','Lecturer (Probationary)'),('L009','Mr. A.W.A.T. Dilhan','dilhan@ictec.ruh.ac.lk','0711234567','Lecturer (Probationary)'),('L010','Mr. Shashitha Lakal','shashithal@ictec.ruh.ac.lk','0711234567','Lecturer (Probationary)'),('L011','Dr. Thissa Karunarathna','thissa@btec.ruh.ac.lk','0711234567','Senior Lecturer'),('L012','Professor E.P.S. Chandana','epschandana@btec.ruh.ac.lk','0775909665','Deputy Vice Chancellor,University of Ruhuna'),('L013','Dr. K.M.W Rajawaththa','wathsala@btec.ruh.ac.lk','0711234567','Senior Lecturer'),('L014','Dr. Niranjan Kannangara','niranjan@btec.ruh.ac.lk','0711234567','Lecturer (Unconfirmed)'),('L015','Dr. K.G.S.Harshadewa Gunawardana','harshadewa@etec.ruh.ac.lk','0711234567','Senior Lecturer'),('L016','Ms.B.H.C. Sanjeewani Thilakarathna','sanjeewani@fot.ruh.ac.lk','0711234567','Lecturer (Probationary)'),('L017','Eng. Ms. J.W. Achini','achini@etec.ruh.ac.lk','0711234567','Lecturer (Probationary)'),('L018','Eng Mr. H.V.H.H.Senavirathna','Eng Mr. H.V.H.H.Senavirathna','0711234567','Lecturer (Probationary)'),('LOO2','Mr. P.H.P.N Laksiri','phpnlaksiri@ictec.ruh.ac.lk','0711234567','Lecturer');
/*!40000 ALTER TABLE `lecture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `management_tcs1212_marks`
--

DROP TABLE IF EXISTS `management_tcs1212_marks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `management_tcs1212_marks` (
  `student_id` varchar(15) NOT NULL,
  `CouId` varchar(10) NOT NULL,
  `quiz_1` int DEFAULT '0',
  `quiz_2` int DEFAULT '0',
  `quiz_3` int DEFAULT '0',
  `finl_quiz_marks` decimal(5,2) GENERATED ALWAYS AS ((((((`quiz_1` + `quiz_2`) + `quiz_3`) - least(`quiz_1`,`quiz_2`,`quiz_3`)) / 2) * 0.20)) STORED,
  `mid_exam` int DEFAULT '0',
  `Finl_CA_marks` decimal(5,2) GENERATED ALWAYS AS (((`mid_exam` * 0.20) + `finl_quiz_marks`)) STORED,
  `end_exam` int DEFAULT '0',
  `Finl_marks` decimal(5,2) GENERATED ALWAYS AS ((`Finl_CA_marks` + (`end_exam` * 0.60))) STORED,
  PRIMARY KEY (`student_id`,`CouId`),
  KEY `CouId` (`CouId`),
  CONSTRAINT `management_tcs1212_marks_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`),
  CONSTRAINT `management_tcs1212_marks_ibfk_2` FOREIGN KEY (`CouId`) REFERENCES `course` (`CouId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `management_tcs1212_marks`
--

LOCK TABLES `management_tcs1212_marks` WRITE;
/*!40000 ALTER TABLE `management_tcs1212_marks` DISABLE KEYS */;
INSERT INTO `management_tcs1212_marks` (`student_id`, `CouId`, `quiz_1`, `quiz_2`, `quiz_3`, `mid_exam`, `end_exam`) VALUES ('TG1042','TCS1212',45,45,63,50,50),('TG1087','TCS1212',65,50,40,48,59),('TG1245','TCS1212',44,85,68,88,76),('TG1310','TCS1212',50,45,25,56,45),('TG1343','TCS1212',75,88,94,75,75),('TG1350','TCS1212',40,33,80,50,45),('TG1380','TCS1212',64,55,75,75,50),('TG1388','TCS1212',90,25,35,65,40),('TG1410','TCS1212',35,89,76,41,69),('TG1453','TCS1212',75,75,41,45,55),('TG1476','TCS1212',45,40,84,60,75),('TG1583','TCS1212',66,75,65,45,50),('TG1587','TCS1212',80,77,95,55,65),('TG1594','TCS1212',54,35,65,56,64);
/*!40000 ALTER TABLE `management_tcs1212_marks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serverside_ict1233_marks`
--

DROP TABLE IF EXISTS `serverside_ict1233_marks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `serverside_ict1233_marks` (
  `student_id` varchar(15) NOT NULL,
  `CouId` varchar(10) NOT NULL,
  `quiz_1` int DEFAULT '0',
  `quiz_2` int DEFAULT '0',
  `quiz_3` int DEFAULT '0',
  `tut_assesment` int DEFAULT '0',
  `finl_quiz_marks` decimal(5,2) GENERATED ALWAYS AS ((((((`quiz_1` + `quiz_2`) + `quiz_3`) - least(`quiz_1`,`quiz_2`,`quiz_3`)) / 2) * 0.10)) STORED,
  `mid_exam` int DEFAULT '0',
  `grp_project` decimal(5,2) DEFAULT '0.00',
  `Finl_CA_marks` decimal(5,2) GENERATED ALWAYS AS (((((`mid_exam` * 0.10) + `finl_quiz_marks`) + (`grp_project` * 0.15)) + (`tut_assesment` * 0.05))) STORED,
  `end_theory` int DEFAULT '0',
  `end_practicl` int DEFAULT '0',
  `Finl_marks` decimal(5,2) GENERATED ALWAYS AS (((`Finl_CA_marks` + (`end_theory` * 0.40)) + (`end_practicl` * 0.20))) STORED,
  PRIMARY KEY (`student_id`,`CouId`),
  KEY `CouId` (`CouId`),
  CONSTRAINT `serverside_ict1233_marks_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`),
  CONSTRAINT `serverside_ict1233_marks_ibfk_2` FOREIGN KEY (`CouId`) REFERENCES `course` (`CouId`),
  CONSTRAINT `serverside_ict1233_marks_ibfk_3` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serverside_ict1233_marks`
--

LOCK TABLES `serverside_ict1233_marks` WRITE;
/*!40000 ALTER TABLE `serverside_ict1233_marks` DISABLE KEYS */;
INSERT INTO `serverside_ict1233_marks` (`student_id`, `CouId`, `quiz_1`, `quiz_2`, `quiz_3`, `tut_assesment`, `mid_exam`, `grp_project`, `end_theory`, `end_practicl`) VALUES 
('TG1310','ICT1233',75,88,94,75,75,80.00,75,65),('TG1343','ICT1233',95,90,94,85,75,70.00,80,65),
('TG1350','ICT1233',90,97,25,35,65,45.00,40,64),('TG1380','ICT1233',75,84,75,41,95,45.00,55,50),
('TG1388','ICT1233',75,85,100,65,76,80.00,85,90),('TG1410','ICT1233',96,78,84,64,45,65.00,94,78),
('TG1453','ICT1233',80,85,85,65,77,75.00,88,60),('TG1476','ICT1233',45,45,84,63,51,50.00,50,65),
('TG1583','ICT1233',98,95,90,44,64,84.00,84,45),('TG1587','ICT1233',88,85,90,67,84,75.00,65,75),
('TG1594','ICT1233',87,99,92,70,58,45.00,62,60);
/*!40000 ALTER TABLE `serverside_ict1233_marks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `student_id` varchar(10) NOT NULL,
  `fname` varchar(30) DEFAULT NULL,
  `lname` varchar(30) DEFAULT NULL,
  `NIC` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `mobile` int DEFAULT NULL,
  `batch` int DEFAULT NULL,
  `state_of_student` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('TG1025','Vishali','Sadunika','200064121487','vishalisadunika@gmail.com','female',706350258,2,'repeat'),
('TG1042','Nimesh','Prabathiya','200084780181','nime48sh@gmail.com','male',766581274,3,'repeat'),
('TG1055','Lakmini','Senarathna','200088995422','lakbslsenarathna@gmail.com','female',782165213,1,'repeat'),
('TG1087','Sasidu','Sashindra','200198249401','sa43sidu@gmail.com','male',754215291,2,'repeat'),
('TG1125','Anuhas','lakmal','200148958752','anuhaslakmal@gmail.com','male',781768712,2,'repeat'),
('TG1245','Yenul','Gayantha','200187006799','yenulgayantha@gmail.com','male',769873205,2,'repeat'),
('TG1310','Pasidu','Bhathiya','200225481258','pasidu20@gmail.com','male',712348658,1,'proper'),
('TG1343','Piumkia','Fernando','200255901801','psfdo22@gmail.com','female',711274511,1,'proper'),
('TG1350','Madawa','Jayaweera','200269549725','msjayaweera@gmail.com','male',770064130,1,'proper'),
('TG1380','Vihanga','Manusha','200265135988','vihangamanusha@gmail.com','male',773497292,1,'proper'),
('TG1388','Dedunu','Divynjali','200254001101','dedunu25@gmail.com','female',778445115,1,'proper'),
('TG1410','Lalithya ','Rasingolla','200279086233','la84rasin@gmail.com','female',767262742,1,'proper'),
('TG1453','Dulakshi','Madushani','200288590548','dula85kshi@gmail.com','female',762584629,1,'proper'),
('TG1476','Premakaran','Ashwar','200287341136','pema58ash@gmail.com','male',779711035,1,'proper'),
('TG1583','Kanishka','Gimhana','200280901481','kanishkagimhana@gmail.com','male',743031511,1,'proper'),
('TG1587','Vinul','Ranasinghe','200285471235','vinulranasinghe@gmail.com','male',754824135,1,'proper'),
('TG1594','Thenu','Botheju','200288051801','thenubotheju@gmail.com','female',785650948,1,'proper');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_attandance`
--

DROP TABLE IF EXISTS `student_attandance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_attandance` (
  `Course_Id` char(7) NOT NULL,
  `Stu_reg_num` char(10) NOT NULL,
  `Week_01` varchar(20) NOT NULL,
  `Week_02` varchar(20) NOT NULL,
  `Week_03` varchar(20) NOT NULL,
  `Week_04` varchar(20) NOT NULL,
  `Week_05` varchar(20) NOT NULL,
  `Week_06` varchar(20) NOT NULL,
  `Week_07` varchar(20) NOT NULL,
  `Week_08` varchar(20) NOT NULL,
  `Week_09` varchar(20) NOT NULL,
  `Week_10` varchar(20) NOT NULL,
  `Week_11` varchar(20) NOT NULL,
  `Week_12` varchar(20) NOT NULL,
  `Week_13` varchar(20) NOT NULL,
  `Week_14` varchar(20) NOT NULL,
  `Week_15` varchar(20) NOT NULL,
  `Percentage` decimal(5,2) GENERATED ALWAYS AS 
  ((((((((((((((((((case when (`Week_01` = _utf8mb4'AB') then 0 when (`Week_01` = _utf8mb4'MC') then 1 else cast(`Week_01` as signed) end) + 
  (case when (`Week_02` = _utf8mb4'AB') then 0 when (`Week_02` = _utf8mb4'MC') then 1 else cast(`Week_02` as signed) end)) + 
  (case when (`Week_03` = _utf8mb4'AB') then 0 when (`Week_03` = _utf8mb4'MC') then 1 else cast(`Week_03` as signed) end)) + 
  (case when (`Week_04` = _utf8mb4'AB') then 0 when (`Week_04` = _utf8mb4'MC') then 1 else cast(`Week_04` as signed) end)) + 
  (case when (`Week_05` = _utf8mb4'AB') then 0 when (`Week_05` = _utf8mb4'MC') then 1 else cast(`Week_05` as signed) end)) + 
  (case when (`Week_06` = _utf8mb4'AB') then 0 when (`Week_06` = _utf8mb4'MC') then 1 else cast(`Week_06` as signed) end)) + 
  (case when (`Week_07` = _utf8mb4'AB') then 0 when (`Week_07` = _utf8mb4'MC') then 1 else cast(`Week_07` as signed) end)) + 
  (case when (`Week_08` = _utf8mb4'AB') then 0 when (`Week_08` = _utf8mb4'MC') then 1 else cast(`Week_08` as signed) end)) + 
  (case when (`Week_09` = _utf8mb4'AB') then 0 when (`Week_09` = _utf8mb4'MC') then 1 else cast(`Week_09` as signed) end)) + 
  (case when (`Week_10` = _utf8mb4'AB') then 0 when (`Week_10` = _utf8mb4'MC') then 1 else cast(`Week_10` as signed) end)) + 
  (case when (`Week_11` = _utf8mb4'AB') then 0 when (`Week_11` = _utf8mb4'MC') then 1 else cast(`Week_11` as signed) end)) + 
  (case when (`Week_12` = _utf8mb4'AB') then 0 when (`Week_12` = _utf8mb4'MC') then 1 else cast(`Week_12` as signed) end)) + 
  (case when (`Week_13` = _utf8mb4'AB') then 0 when (`Week_13` = _utf8mb4'MC') then 1 else cast(`Week_13` as signed) end)) + 
  (case when (`Week_14` = _utf8mb4'AB') then 0 when (`Week_14` = _utf8mb4'MC') then 1 else cast(`Week_14` as signed) end)) + 
  (case when (`Week_15` = _utf8mb4'AB') then 0 when (`Week_15` = _utf8mb4'MC') then 1 else cast(`Week_15` as signed) end)) / 15) * 100)) STORED,
  KEY `Stu_reg_num` (`Stu_reg_num`),
  CONSTRAINT `student_attandance_ibfk_1` FOREIGN KEY (`Stu_reg_num`) REFERENCES `student` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_attandance`
--

LOCK TABLES `student_attandance` WRITE;
/*!40000 ALTER TABLE `student_attandance` DISABLE KEYS */;
INSERT INTO `student_attandance` (`Course_Id`, `Stu_reg_num`, `Week_01`, `Week_02`, `Week_03`, `Week_04`, `Week_05`, `Week_06`, `Week_07`, `Week_08`, `Week_09`, `Week_10`, `Week_11`, `Week_12`, `Week_13`, `Week_14`, `Week_15`) VALUES 
('TCS1212','TG1310','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),
('ENG1222','TG1310','1','1','1','AB','1','1','1','1','1','MC','1','AB','1','1','1'),
('ICT1212','TG1310','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),
('ICT1222','TG1310','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),
('ICT1233','TG1310','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),
('ICT1242','TG1310','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),
('ICT1253','TG1310','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),
('TMS1233','TG1310','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),
('ENG1222','TG1587','1','1','1','1','1','1','1','1','1','1','1','AB','1','1','1'),
('ICT1212','TG1587','1','1','1','1','1','1','1','1','1','1','1','AB','1','1','1'),
('ICT1222','TG1587','1','1','1','1','1','1','1','1','1','1','1','AB','1','1','1'),
('ICT1233','TG1587','1','1','1','1','AB','1','AB','1','1','1','1','AB','1','AB','1'),
('ICT1242','TG1587','1','1','1','1','1','1','1','1','1','1','1','AB','1','1','1'),
('ICT1253','TG1587','1','1','1','1','1','1','1','1','1','1','1','AB','1','1','1'),
('TCS1212','TG1587','1','1','1','1','1','1','1','1','1','1','1','AB','1','1','1'),
('TMS1233','TG1587','1','1','1','1','1','1','1','1','1','1','1','AB','1','1','1'),
('ENG1222','TG1343','1','1','1','1','1','1','1','1','AB','1','1','1','1','1','1'),
('ICT1212','TG1343','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),
('ICT1222','TG1343','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),
('ICT1233','TG1343','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),
('ICT1242','TG1343','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),
('ICT1253','TG1343','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),
('TCS1212','TG1343','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),
('TMS1233','TG1343','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),
('ENG1222','TG1388','1','AB','1','1','AB','1','AB','1','AB','1','1','AB','1','AB','1'),
('ICT1212','TG1388','1','MC','1','1','AB','1','1','1','AB','1','1','1','1','1','1'),
('ICT1222','TG1388','1','MC','1','1','1','1','1','1','AB','1','1','1','1','1','1'),
('ICT1233','TG1388','1','MC','1','1','1','1','1','1','AB','1','1','1','1','1','1'),
('ICT1242','TG1388','1','MC','1','1','1','1','1','1','AB','1','1','1','1','1','1'),
('ICT1253','TG1388','1','MC','1','1','1','1','1','1','AB','1','1','1','1','1','1'),
('TCS1212','TG1388','1','MC','1','1','1','1','AB','1','AB','1','1','AB','1','AB','1'),
('TMS1233','TG1388','1','MC','1','1','AB','1','AB','1','AB','1','AB','1','AB','1','1'),
('ENG1222','TG1453','1','1','1','1','1','1','1','1','1','1','1','1','AB','1','1'),
('ICT1212','TG1453','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),
('ICT1222','TG1453','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),
('ICT1233','TG1453','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),
('ICT1242','TG1453','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),
('ICT1253','TG1453','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),
('TCS1212','TG1453','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),
('TMS1233','TG1453','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),
('ENG1222','TG1410','1','1','1','1','1','1','1','1','1','1','1','1','AB','1','1'),
('ICT1212','TG1410','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),
('ICT1222','TG1410','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),
('ICT1233','TG1410','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),
('ICT1242','TG1410','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),
('ICT1253','TG1410','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),
('TCS1212','TG1410','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),
('TMS1233','TG1410','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),
('ENG1222','TG1476','1','1','MC','1','1','1','1','1','1','1','1','1','AB','1','1'),
('ICT1212','TG1476','1','1','MC','1','1','1','1','1','1','1','1','1','AB','1','1'),
('ICT1222','TG1476','1','1','MC','1','1','1','1','1','1','1','1','1','AB','1','1'),
('ICT1233','TG1476','1','1','MC','1','1','1','1','1','1','1','1','1','AB','1','1'),
('ICT1242','TG1476','1','1','MC','1','1','1','1','1','1','1','1','1','AB','1','1'),
('ICT1253','TG1476','1','1','MC','1','1','1','1','1','1','1','1','1','AB','1','1'),
('TCS1212','TG1476','1','1','MC','1','1','1','1','1','1','1','1','1','AB','1','1'),
('TMS1233','TG1476','1','1','MC','1','1','1','1','1','1','1','1','1','AB','1','1'),
('ENG1222','TG1594','1','1','AB','1','1','AB','1','AB','1','AB','1','1','AB','1','MC'),
('ICT1212','TG1594','1','1','1','1','1','1','1','1','1','AB','1','1','AB','1','MC'),
('ICT1222','TG1594','1','1','1','1','1','1','1','1','1','AB','1','1','AB','1','MC'),
('ICT1233','TG1594','1','1','AB','1','AB','AB','1','1','1','AB','1','1','AB','1','MC'),
('ICT1242','TG1594','1','1','1','1','1','1','1','1','1','AB','1','1','AB','1','MC'),
('ICT1253','TG1594','1','1','AB','1','AB','1','1','1','1','AB','1','1','AB','1','MC'),
('TCS1212','TG1594','1','1','1','1','1','1','1','1','1','AB','1','1','AB','1','MC'),
('TMS1233','TG1594','1','1','AB','1','AB','1','1','1','1','AB','1','1','AB','1','MC'),
('ENG1222','TG1583','1','1','1','1','1','1','1','1','1','1','1','1','AB','1','1'),
('ICT1212','TG1583','1','1','1','1','1','1','1','1','1','1','1','1','AB','1','1'),
('ICT1222','TG1583','1','1','1','1','1','1','1','1','1','1','1','1','AB','1','1'),
('ICT1233','TG1583','1','1','1','1','1','1','1','1','1','1','1','1','AB','1','1'),
('ICT1242','TG1583','1','1','1','1','1','1','1','1','1','1','1','1','AB','1','1'),
('ICT1253','TG1583','1','1','1','1','1','1','1','1','1','1','1','1','AB','1','1'),
('TCS1212','TG1583','1','1','1','1','1','1','1','1','1','1','1','1','AB','1','1'),
('TMS1233','TG1583','1','1','1','1','1','1','1','1','1','1','1','1','AB','1','1'),
('ENG1222','TG1380','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),
('ICT1212','TG1380','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),
('ICT1222','TG1380','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),
('ICT1233','TG1380','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),
('ICT1242','TG1380','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),
('ICT1253','TG1380','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),
('TCS1212','TG1380','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),
('TMS1233','TG1380','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),
('ENG1222','TG1350','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),
('ICT1212','TG1350','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),
('ICT1222','TG1350','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),
('ICT1233','TG1350','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),
('ICT1242','TG1350','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),
('ICT1253','TG1350','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),
('TCS1212','TG1350','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),
('TMS1233','TG1350','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1');
/*!40000 ALTER TABLE `student_attandance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_eligibility`
--

DROP TABLE IF EXISTS `student_eligibility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_eligibility` (
  `student_id` varchar(10) NOT NULL,
  `course_id` char(7) NOT NULL,
  `ca_marks` decimal(5,2) NOT NULL,
  `attendance_percentage` decimal(5,2) NOT NULL,
  `eligibility_status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`student_id`,`course_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `student_eligibility_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`),
  CONSTRAINT `student_eligibility_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`CouId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_eligibility`
--

LOCK TABLES `student_eligibility` WRITE;
/*!40000 ALTER TABLE `student_eligibility` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_eligibility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_grade`
--

DROP TABLE IF EXISTS `student_grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_grade` (
  `student_id` char(10) NOT NULL,
  `Course_id` char(7) NOT NULL,
  `Final_marks` decimal(5,2) NOT NULL,
  `grade` varchar(5) GENERATED ALWAYS AS ((case when (`Final_marks` < 0) then _cp850'MC' when (`Final_marks` >= 90) then _cp850'A+' when (`Final_marks` >= 85) then _cp850'A' when (`Final_marks` >= 80) then _cp850'A-' when (`Final_marks` >= 75) then _cp850'B+' when (`Final_marks` >= 70) then _cp850'B' when (`Final_marks` >= 65) then _cp850'B-' when (`Final_marks` >= 60) then _cp850'C+' when (`Final_marks` >= 55) then _cp850'C' when (`Final_marks` >= 50) then _cp850'C-' when (`Final_marks` >= 45) then _cp850'D' else _cp850'E' end)) VIRTUAL,
  `SGPA` decimal(3,2) GENERATED ALWAYS AS ((case when ((`grade` = _utf8mb4'A+') or (`grade` = _utf8mb4'A')) then 4.00 when (`grade` = _utf8mb4'A-') then 3.70 when (`grade` = _utf8mb4'B+') then 3.30 when (`grade` = _utf8mb4'B') then 3.00 when (`grade` = _utf8mb4'B-') then 2.70 when (`grade` = _utf8mb4'C+') then 2.30 when (`grade` = _utf8mb4'C') then 2.00 when (`grade` = _utf8mb4'C-') then 1.70 when (`grade` = _utf8mb4'D') then 1.00 when (`grade` = _utf8mb4'E') then 0.00 end)) VIRTUAL,
  KEY `student_id` (`student_id`),
  KEY `Course_id` (`Course_id`),
  CONSTRAINT `student_grade_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`),
  CONSTRAINT `student_grade_ibfk_2` FOREIGN KEY (`Course_id`) REFERENCES `course` (`CouId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_grade`
--

LOCK TABLES `student_grade` WRITE;
/*!40000 ALTER TABLE `student_grade` DISABLE KEYS */;
INSERT INTO `student_grade` (`student_id`, `Course_id`, `Final_marks`) VALUES 
('TG1310','ICT1212',71.50),('TG1343','ICT1212',81.30),('TG1350','ICT1212',77.05),
('TG1380','ICT1212',86.35),('TG1388','ICT1212',69.45),('TG1410','ICT1212',83.40),('TG1453','ICT1212',61.65),('TG1476','ICT1212',87.75),('TG1583','ICT1212',86.80),('TG1587','ICT1212',67.55),('TG1594','ICT1212',83.15),('TG1310','ICT1222',70.60),('TG1343','ICT1222',64.90),('TG1350','ICT1222',84.60),('TG1380','ICT1222',70.00),('TG1388','ICT1222',58.30),('TG1410','ICT1222',82.50),('TG1453','ICT1222',56.50),('TG1476','ICT1222',78.40),('TG1583','ICT1222',77.00),('TG1587','ICT1222',60.50),('TG1594','ICT1222',89.00),('TG1025','ICT1242',65.35),('TG1055','ICT1242',51.25),('TG1087','ICT1242',66.80),('TG1310','ICT1242',67.35),('TG1343','ICT1242',54.55),('TG1350','ICT1242',79.10),('TG1380','ICT1242',65.35),('TG1388','ICT1242',58.45),('TG1410','ICT1242',75.35),('TG1453','ICT1242',54.25),('TG1476','ICT1242',55.15),('TG1583','ICT1242',67.85),('TG1587','ICT1242',83.30),('TG1594','ICT1242',78.95),('TG1055','ICT1253',148.45),('TG1310','ICT1253',134.15),('TG1343','ICT1253',87.85),('TG1350','ICT1253',114.25),('TG1380','ICT1253',106.10),('TG1388','ICT1253',113.65),('TG1410','ICT1253',139.60),('TG1453','ICT1253',151.55),('TG1476','ICT1253',116.15),('TG1583','ICT1253',145.35),('TG1587','ICT1253',113.10),('TG1594','ICT1253',100.75),('TG1310','ICT1233',75.35),('TG1343','ICT1233',76.70),('TG1350','ICT1233',53.15),('TG1380','ICT1233',58.25),('TG1388','ICT1233',84.10),('TG1410','ICT1233',79.65),('TG1453','ICT1233',77.90),('TG1476','ICT1233',55.20),('TG1583','ICT1233',73.45),('TG1587','ICT1233',72.90),('TG1594','ICT1233',62.40),('TG1042','TCS1212',50.80),('TG1087','TCS1212',56.50),('TG1245','TCS1212',78.50),('TG1310','TCS1212',47.70),('TG1343','TCS1212',78.20),('TG1350','TCS1212',49.00),('TG1380','TCS1212',58.90),('TG1388','TCS1212',49.50),('TG1410','TCS1212',66.10),('TG1453','TCS1212',57.00),('TG1476','TCS1212',69.90),('TG1583','TCS1212',53.10),('TG1587','TCS1212',67.50),('TG1594','TCS1212',61.50),('TG1025','ENG1222',58.50),('TG1042','ENG1222',56.50),('TG1125','ENG1222',56.90),('TG1310','ENG1222',71.80),('TG1343','ENG1222',81.10),('TG1350','ENG1222',53.10),('TG1380','ENG1222',58.90),('TG1388','ENG1222',64.10),('TG1410','ENG1222',53.90),('TG1453','ENG1222',49.50),('TG1476','ENG1222',83.40),('TG1583','ENG1222',67.40),('TG1587','ENG1222',65.70),('TG1594','ENG1222',49.50);
/*!40000 ALTER TABLE `student_grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_performance`
--

DROP TABLE IF EXISTS `student_performance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_performance` (
  `student_id` varchar(12) NOT NULL,
  `semester_no` int NOT NULL,
  `Full_SGPA` decimal(3,2) DEFAULT NULL,
  `CGPA` decimal(3,2) DEFAULT NULL,
  `GPA` decimal(3,2) DEFAULT NULL,
  PRIMARY KEY (`student_id`,`semester_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_performance`
--

LOCK TABLES `student_performance` WRITE;
/*!40000 ALTER TABLE `student_performance` DISABLE KEYS */;
INSERT INTO `student_performance` VALUES ('TG1025',1,2.00,2.00,2.00),('TG1042',1,1.50,1.50,1.50),('TG1055',1,2.92,2.92,2.92),('TG1087',1,2.00,2.00,2.00),('TG1125',1,1.70,1.70,1.70),('TG1245',1,3.00,3.00,3.00),('TG1310',1,2.74,2.74,2.74),('TG1343',1,2.87,2.87,2.87),('TG1350',1,2.44,2.44,2.44),('TG1380',1,2.58,2.58,2.58),('TG1388',1,2.46,2.46,2.46),('TG1410',1,2.96,2.96,2.96),('TG1453',1,2.28,2.28,2.28),('TG1476',1,2.82,2.82,2.82),('TG1583',1,2.83,2.83,2.83),('TG1587',1,2.78,2.78,2.78),('TG1594',1,2.75,2.75,2.75);
/*!40000 ALTER TABLE `student_performance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` char(7) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_type` varchar(50) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('A001','Kusal Mendis','756bc47cb5215dc3329ca7e1f7be33a2dad68990bb94b76d90aa07f4e44a233a','Admin'),('D001','PROF. Mr. Subash jayasinghe','756bc47cb5215dc3329ca7e1f7be33a2dad68990bb94b76d90aa07f4e44a233a','Dean'),('H001','PROF. Mr. Subash jayasinghe','756bc47cb5215dc3329ca7e1f7be33a2dad68990bb94b76d90aa07f4e44a233a','HOD'),('TO001','Anjana Nirmal','756bc47cb5215dc3329ca7e1f7be33a2dad68990bb94b76d90aa07f4e44a233a','TechOfficer'),('TO002','Sapumal Bandara','756bc47cb5215dc3329ca7e1f7be33a2dad68990bb94b76d90aa07f4e44a233a','TechOfficer'),('TO003','Prakeerthan','756bc47cb5215dc3329ca7e1f7be33a2dad68990bb94b76d90aa07f4e44a233a','TechOfficer'),('TO004','Pemakaran','756bc47cb5215dc3329ca7e1f7be33a2dad68990bb94b76d90aa07f4e44a233a','TechOfficer'),('TO005','Akram','756bc47cb5215dc3329ca7e1f7be33a2dad68990bb94b76d90aa07f4e44a233a','TechOfficer');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `attendance_eligibility`
--

/*!50001 DROP VIEW IF EXISTS `attendance_eligibility`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `attendance_eligibility` AS select distinct `sa`.`Stu_reg_num` AS `Stu_reg_num`,concat(`s`.`fname`,' ',`s`.`lname`) AS `Full_Name`,(case when (`sa`.`Percentage` >= 80.00) then 'Eligible' else 'Not Eligible' end) AS `eligibility` from (`student_attandance` `sa` join `student` `s` on((`sa`.`Stu_reg_num` = `s`.`student_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-03 15:39:27
