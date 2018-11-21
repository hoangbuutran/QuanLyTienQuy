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
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `image` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `daXoa` bit(1) NOT NULL,
  `ngaySua` datetime DEFAULT NULL,
  `ngayTao` datetime DEFAULT NULL,
  `trangThai` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ckEditorPopup` bit(1) NOT NULL,
  `trangThaiSoan` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `articlesImage` bit(1) NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extension` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `height` int(11) NOT NULL,
  `imageUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `medium` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `money` double NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `publishStatus` bit(1) NOT NULL,
  `small` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `width` int(11) NOT NULL,
  `nguoiSua_id` bigint(20) DEFAULT NULL,
  `nguoiTao_id` bigint(20) DEFAULT NULL,
  `author_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX8fukkebyjda9nv7mke3glmeei` (`extension`),
  KEY `IDXa2f9bnh35urv6hmpwnqqdt2y3` (`imageUrl`),
  KEY `IDX2o7ijfxp9nv014xfgn93go7cd` (`name`),
  KEY `IDXh7fjsudcb339x2j6k298naeg` (`title`),
  KEY `IDXqumkbk0qeqsyshfyomi00lymh` (`width`),
  KEY `IDX2qb7pb34f5626l1gcqdj6keg4` (`height`),
  KEY `IDXqqm3oyoaq2hnsbxs9iaykshba` (`publishStatus`),
  KEY `IDXeharlatik4vvfvknw715cov50` (`articlesImage`),
  KEY `IDX2n59b1a4d0gujdk0e3hvgtlno` (`medium`),
  KEY `IDXkhdua8he6h6s6bugntabgsqu0` (`small`),
  KEY `IDX8a2mr76xu4ms0v6q9tls3bvir` (`money`),
  KEY `FKou77algsm9v32c5q7ix04jxgl` (`nguoiSua_id`),
  KEY `FK33foc3k9ct7i13wy28myg3f0g` (`nguoiTao_id`),
  KEY `FKf0qcsfaaa8hi2jtetp3dqgn5c` (`author_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (1,_binary '\0','2018-11-05 17:06:27','2018-11-05 17:06:27','ap_dung',_binary '\0','',_binary '','','',0,'/hdndfiles/image/screenshot1_1541412377931.png','/hdndfiles/image/m_screenshot1_1541412377931.png',0,'screenshot1_1541412377931.png',_binary '\0','/hdndfiles/image/s_screenshot1_1541412377931.png','',0,1,1,NULL),(2,_binary '\0','2018-11-09 08:18:35','2018-11-05 17:06:44','',_binary '\0','',_binary '','','',0,'/hdndfiles/image/screenshot1_1541412403845.png','/hdndfiles/image/m_screenshot1_1541412377931.png',0,'screenshot1_1541412403845.png',_binary '\0','/hdndfiles/image/s_screenshot1_1541412377931.png','',0,1,1,NULL),(3,_binary '\0','2018-11-05 17:06:49','2018-11-05 17:06:49','ap_dung',_binary '\0','',_binary '','','',0,'/hdndfiles/image/screenshot1_1541412409120.png','/hdndfiles/image/m_screenshot1_1541412377931.png',0,'screenshot1_1541412409120.png',_binary '\0','/hdndfiles/image/s_screenshot1_1541412377931.png','',0,1,1,NULL),(4,_binary '\0','2018-11-20 10:14:34','2018-11-06 16:12:38','',_binary '\0','',_binary '','','',0,'/hdndfiles/image/screenshot1_1541495557552.png','/hdndfiles/image/m_screenshot1_1541412377931.png',0,'screenshot1_1541495557552.png',_binary '\0','/hdndfiles/image/s_screenshot1_1541412377931.png','',0,1,1,NULL),(5,_binary '\0','2018-11-06 16:12:42','2018-11-06 16:12:42','',_binary '\0','',_binary '','','',0,'/hdndfiles/image/screenshot1_1541495562103.png','/hdndfiles/image/m_screenshot1_1541412377931.png',0,'screenshot1_1541495562103.png',_binary '\0','/hdndfiles/image/s_screenshot1_1541412377931.png','',0,1,1,NULL);
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-21 16:07:21
