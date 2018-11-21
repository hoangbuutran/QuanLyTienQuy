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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `daXoa` bit(1) NOT NULL,
  `ngaySua` datetime DEFAULT NULL,
  `ngayTao` datetime DEFAULT NULL,
  `trangThai` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cungcaprss` tinyint(1) DEFAULT '1',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `soThuTu` int(11) NOT NULL,
  `visible` tinyint(1) DEFAULT '1',
  `nguoiSua_id` bigint(20) DEFAULT NULL,
  `nguoiTao_id` bigint(20) DEFAULT NULL,
  `language_id` bigint(20) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX46ccwnsi9409t36lurvtyljak` (`name`),
  KEY `IDX4vh71cwgrww1l5i897ldvq1vl` (`alias`),
  KEY `IDX8sim297j58j8k7n72nqlviwgx` (`soThuTu`),
  KEY `FK39ra8u3pm34irq98nhlwoa2nm` (`nguoiSua_id`),
  KEY `FKaxbkuig924h3gqr84nvk33au0` (`nguoiTao_id`),
  KEY `FKdck02abua98662khe1if6rn3u` (`language_id`),
  KEY `FK2y94svpmqttx80mshyny85wqr` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,_binary '\0','2018-11-05 16:57:25','2018-11-05 16:57:25','ap_dung','chude1',0,'Chủ đề 1','Chủ đề 1',0,0,1,1,NULL,NULL),(2,_binary '\0','2018-11-05 16:57:39','2018-11-05 16:57:39','ap_dung','chude2',0,'Chủ đề 2\n','Chủ đề 2',0,0,1,1,NULL,NULL),(3,_binary '\0','2018-11-05 16:58:13','2018-11-05 16:58:13','ap_dung','chude3',0,'Chủ đề 3','Chủ đề 3',0,0,1,1,NULL,NULL),(4,_binary '\0','2018-11-05 16:59:04','2018-11-05 16:59:04','ap_dung','chude11',0,'Chủ đề 1.1','Chủ đề 1.1',0,0,1,1,NULL,1),(5,_binary '\0','2018-11-05 16:59:25','2018-11-05 16:59:25','ap_dung','chude111',0,'Chủ đề 1.1.1','Chủ đề 1.1.1',0,0,1,1,NULL,4),(6,_binary '\0','2018-11-08 11:22:57','2018-11-08 11:21:39','da_xoa','hfhfhfhffff1111',0,'hfhfhfhffff     1.1.1.1','hfhfhfhffff 1.1.1.1',1,0,1,1,NULL,5),(7,_binary '\0','2018-11-08 11:22:51','2018-11-08 11:22:06','da_xoa','hfhfhfhffff1111hfhfhfhffff1111',0,'hfhfhfhffff     1.1.1.1hfhfhfhffff     1.1.1.1','hfhfhfhffff 1.1.1.1hfhfhfhffff 1.1.1.1',1,0,1,1,NULL,6);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-21 16:07:24
