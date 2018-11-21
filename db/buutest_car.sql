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
-- Table structure for table `car`
--

DROP TABLE IF EXISTS `car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `car` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `daXoa` bit(1) NOT NULL,
  `ngaySua` datetime DEFAULT NULL,
  `ngayTao` datetime DEFAULT NULL,
  `trangThai` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `carUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cost` double NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newTab` bit(1) NOT NULL,
  `publishBeginTime` datetime DEFAULT NULL,
  `publishEndTime` datetime DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `viewCount` bigint(20) NOT NULL,
  `nguoiSua_id` bigint(20) DEFAULT NULL,
  `nguoiTao_id` bigint(20) DEFAULT NULL,
  `nameImage` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `soLuong` bigint(20) NOT NULL,
  `phuong_id` bigint(20) DEFAULT NULL,
  `quan_id` bigint(20) DEFAULT NULL,
  `thanhPho_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKgl44b8irj9yqtfnclfvlt8g4a` (`nguoiSua_id`),
  KEY `FK2mwyppmntr7a0fsktxm1c4h2` (`nguoiTao_id`),
  KEY `FKbeaekmpib391eusfolsdr74mb` (`phuong_id`),
  KEY `FKg4sm1nvr5pdru7lby302jqkq7` (`quan_id`),
  KEY `FKmfeq2c5lwvhbfavgixxwpq11j` (`thanhPho_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car`
--

LOCK TABLES `car` WRITE;
/*!40000 ALTER TABLE `car` DISABLE KEYS */;
INSERT INTO `car` VALUES (6,_binary '\0','2018-11-13 11:35:08','2018-11-12 13:11:07','ap_dung','/hdndfiles/car/barca_1542003024987.jpg',5000000,'Hoàng Bửu name','Hoàng Bửu name',_binary '','2018-11-12 13:11:00','2018-11-13 13:11:00','CX-2',0,1,1,'barca_1542003024987.jpg',80,49,7,1),(7,_binary '','2018-11-13 09:45:53','2018-11-12 16:59:57','da_xoa','/hdndfiles/car/cung-ngam-buc-anh-co-do-phan-giai-lon-nhat-the-gioi_1542016790971.jpg',22,'Hoàng Bửu Name','Hoàng Bửu Name',_binary '','2018-11-12 16:59:00','2018-11-13 16:59:00','CX-5',0,1,1,'cung-ngam-buc-anh-co-do-phan-giai-lon-nhat-the-gioi_1542016790971.jpg',22,744,738,160),(8,_binary '\0','2018-11-13 09:45:25','2018-11-13 08:38:30','khong_ap_dung','/hdndfiles/car/cung-ngam-buc-anh-co-do-phan-giai-lon-nhat-the-gioi_1542073104647.jpg',123,'ngô thị thanh','Ngô thị thanh',_binary '','2018-11-13 08:38:00','2018-11-14 08:38:00','CX-6',0,1,1,'cung-ngam-buc-anh-co-do-phan-giai-lon-nhat-the-gioi_1542073104647.jpg',23,1169,1157,1122),(9,_binary '\0','2018-11-13 14:26:43','2018-11-13 11:23:54','ap_dung','/hdndfiles/car/cung-ngam-buc-anh-co-do-phan-giai-lon-nhat-the-gioi_1542083011443.jpg',123,'Trần Khanh','Trần Khanh',_binary '\0','2018-11-13 11:22:00','2018-11-16 11:22:00','CX-1',0,1,1,'cung-ngam-buc-anh-co-do-phan-giai-lon-nhat-the-gioi_1542083011443.jpg',12,49,7,1),(10,_binary '\0','2018-11-13 11:37:25','2018-11-13 11:37:25','ap_dung','/hdndfiles/car/cung-ngam-buc-anh-co-do-phan-giai-lon-nhat-the-gioi_1542083833060.jpg',123,'123123123','123',_binary '\0','2018-11-13 11:37:00','2018-11-14 11:37:00','CX-3',0,1,1,'cung-ngam-buc-anh-co-do-phan-giai-lon-nhat-the-gioi_1542083833060.jpg',17,42,6,1);
/*!40000 ALTER TABLE `car` ENABLE KEYS */;
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
