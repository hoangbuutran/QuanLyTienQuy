-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: buutest
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `vaitro_quyens`
--

DROP TABLE IF EXISTS `vaitro_quyens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `vaitro_quyens` (
  `vaitro_id` bigint(20) NOT NULL,
  `quyens` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `FKqldf0fggg0f8sc37im018c5ti` (`vaitro_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vaitro_quyens`
--

LOCK TABLES `vaitro_quyens` WRITE;
/*!40000 ALTER TABLE `vaitro_quyens` DISABLE KEYS */;
INSERT INTO `vaitro_quyens` VALUES (1,'donvihanhchinh:sua'),(1,'donvihanhchinh:them'),(1,'donvihanhchinh:xem'),(1,'nguoidung:sua'),(1,'donvi:lietke'),(1,'nguoidung:xem'),(1,'donvihanhchinh:lietke'),(1,'nguoidung:them'),(1,'donvi:xoa'),(1,'vaitro:xem'),(1,'vaitro:sua'),(1,'nguoidung:xoa'),(1,'donvi:them'),(1,'donvi:sua'),(1,'nguoidung:lietke'),(1,'vaitro:them'),(1,'vaitro:xoa'),(1,'donvi:xem'),(1,'vaitro:lietke'),(1,'quantrihethong:lietke'),(1,'donvihanhchinh:xoa'),(2,'baiviet:xem'),(2,'baiviet:sua'),(2,'baiviet:lietke'),(2,'baiviet:them'),(2,'baiviet:xuatban'),(2,'baiviet:xoa'),(3,'baiviet:xem'),(3,'baiviet:sua'),(3,'baiviet:lietke'),(3,'baiviet:them'),(3,'baiviet:xoa'),(6,'car:them'),(6,'car'),(6,'car:xoa'),(6,'car:sua'),(6,'car:lietke'),(6,'car:xem'),(6,'phieuchi:xem'),(6,'phieuchi:lietke'),(6,'thongke'),(6,'thutien:lietke'),(6,'thongke:xem'),(6,'thongke:lietke'),(6,'thutien:xem');
/*!40000 ALTER TABLE `vaitro_quyens` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-21 16:07:27
