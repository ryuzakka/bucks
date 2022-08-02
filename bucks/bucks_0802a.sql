-- MySQL dump 10.19  Distrib 10.3.35-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: bucks
-- ------------------------------------------------------
-- Server version	10.3.35-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` int(11) DEFAULT 0,
  `userid` varchar(20) DEFAULT NULL,
  `prod_code` char(100) DEFAULT NULL,
  `prod_unit` char(100) DEFAULT NULL,
  `total_unit` int(11) DEFAULT NULL,
  `total_cost` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `writeday` date DEFAULT NULL,
  `prod_size` char(100) DEFAULT NULL,
  `prod_cost` char(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,0,'hong','아이스 카페 아메리카노','1',1,4500,NULL,'2022-08-02','2','4500');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(20) DEFAULT NULL,
  `pwd` varchar(20) DEFAULT NULL,
  `username` varchar(40) DEFAULT NULL,
  `nickname` char(10) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `phone` char(13) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `star` int(11) DEFAULT 0,
  `level` int(11) DEFAULT 0,
  `state` int(11) DEFAULT 0,
  `writeday` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userid` (`userid`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'admin','123','관리자',NULL,NULL,NULL,NULL,0,0,0,'2022-08-01'),(2,'starbucks','123','스타벅스','스타벅스','2022-01-01','01012341234','starbucks@starbucks.com',0,0,0,'2022-08-01'),(3,'star','123','스타','스타','2022-08-01','01011112222','@',0,0,0,'2022-08-01'),(4,'hong','123','홍길동','홍길동','1892-01-01','010','@',0,0,0,'2022-08-01'),(5,'spider','123','피터파커','스파이더맨','2000-12-30','10319948111','',0,0,0,'2022-08-01');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cate1` char(2) DEFAULT NULL,
  `cate2` char(2) DEFAULT NULL,
  `code` char(8) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `writeday` date DEFAULT NULL,
  `state` int(11) DEFAULT 1,
  `img` char(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'01','01','01010111','카페 아메리카노',1,1,4000,'2022-08-02',1,NULL),(2,'01','01','01010112','카페 아메리카노',1,2,4500,'2022-08-02',1,NULL),(4,'01','01','01010113','카페 아메리카노',1,3,5000,'2022-08-02',1,NULL),(5,'01','01','01010114','카페 아메리카노',1,4,5500,'2022-08-02',1,NULL),(6,'01','01','01010122','아이스 카페 아메리카노',2,2,4500,'2022-08-02',1,NULL),(7,'01','01','01010123','아이스 카페 아메리카노',2,3,5000,'2022-08-02',1,NULL),(8,'01','01','01010124','아이스 카페 아메리카노',2,4,5500,'2022-08-02',1,NULL),(9,'01','01','01010211','카페 라떼',1,1,4500,'2022-08-02',1,NULL),(10,'01','01','01010212','카페 라떼',1,2,5000,'2022-08-02',1,NULL),(11,'01','01','01010213','카페 라떼',1,3,5500,'2022-08-02',1,NULL),(12,'01','01','01010214','카페 라떼',1,4,6000,'2022-08-02',1,NULL),(13,'01','01','01010222','아이스 카페 라떼',2,2,5000,'2022-08-02',1,NULL),(14,'01','01','01010223','아이스 카페 라떼',2,3,5500,'2022-08-02',1,NULL),(15,'01','01','01010224','아이스 카페 라떼',2,4,6000,'2022-08-02',1,NULL),(16,'01','01','01010311','카페 모카',1,1,5000,'2022-08-02',1,NULL),(17,'01','01','01010312','카페 모카',1,2,5500,'2022-08-02',1,NULL),(18,'01','01','01010313','카페 모카',1,3,6000,'2022-08-02',1,NULL),(19,'01','01','01010314','카페 모카',1,4,6500,'2022-08-02',1,NULL),(20,'01','01','01010322','아이스 카페 모카',2,2,5500,'2022-08-02',1,NULL),(21,'01','01','01010323','아이스 카페 모카',2,3,6000,'2022-08-02',1,NULL),(22,'01','01','01010324','아이스 카페 모카',2,4,6500,'2022-08-02',1,NULL),(23,'01','02','01020122','콜드 브루',2,2,4900,'2022-08-02',1,NULL),(24,'01','02','01020123','콜드 브루',2,3,5400,'2022-08-02',1,NULL),(25,'01','02','01020124','콜드 브루',2,4,5900,'2022-08-02',1,NULL),(26,'01','03','01030122','에스프레소 프라푸치노',2,2,5500,'2022-08-02',1,NULL),(27,'01','03','01030123','에스프레소 프라푸치노',2,3,6000,'2022-08-02',1,NULL),(28,'01','03','01030124','에스프레소 프라푸치노',2,4,6500,'2022-08-02',1,NULL),(29,'01','04','01040122','딸기 딜라이트 요거트 블렌디드',2,2,6300,'2022-08-02',1,NULL),(30,'01','04','01040123','딸기 딜라이트 요거트 블렌디드',2,3,6800,'2022-08-02',1,NULL),(31,'01','04','01040124','딸기 딜라이트 요거트 블렌디드',2,4,7300,'2022-08-02',1,NULL),(32,'01','05','01050122','쿨 라임 피지오',2,2,5900,'2022-08-02',1,NULL),(33,'01','05','01050123','쿨 라임 피지오',2,3,6400,'2022-08-02',1,NULL),(34,'01','05','01050124','쿨 라임 피지오',2,4,6900,'2022-08-02',1,NULL),(35,'01','06','01060112','얼 그레이 티',1,2,4500,'2022-08-02',1,NULL),(36,'01','06','01060114','얼 그레이 티',1,4,5500,'2022-08-02',1,NULL),(37,'01','06','01060122','아이스 얼 그레이 티',2,2,4500,'2022-08-02',1,NULL),(38,'01','06','01060124','아이스 얼 그레이 티',2,4,5500,'2022-08-02',1,NULL),(39,'01','06','01060211','자몽 허니 블랙 티',1,1,5200,'2022-08-02',1,NULL),(40,'01','06','01060212','자몽 허니 블랙 티',1,2,5700,'2022-08-02',1,NULL),(41,'01','06','01060213','자몽 허니 블랙 티',1,3,6200,'2022-08-02',1,NULL),(42,'01','06','01060214','자몽 허니 블랙 티',1,4,6700,'2022-08-02',1,NULL),(43,'01','06','01060222','아이스 자몽 허니 블랙 티',2,2,5700,'2022-08-02',1,NULL),(44,'01','06','01060223','아이스 자몽 허니 블랙 티',2,3,6200,'2022-08-02',1,NULL),(45,'01','06','01060224','아이스 자몽 허니 블랙 티',2,4,6700,'2022-08-02',1,NULL);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_cate`
--

DROP TABLE IF EXISTS `menu_cate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cate1` char(2) DEFAULT NULL,
  `cate2` char(2) DEFAULT NULL,
  `catename` varchar(100) DEFAULT NULL,
  `writeday` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_cate`
--

LOCK TABLES `menu_cate` WRITE;
/*!40000 ALTER TABLE `menu_cate` DISABLE KEYS */;
INSERT INTO `menu_cate` VALUES (1,'01','01','에스프레소','2022-08-02'),(2,'01','02','콜드브루','2022-08-02'),(3,'01','03','프라푸치노','2022-08-02'),(4,'01','04','블렌디드','2022-08-02'),(5,'01','05','피지오','2022-08-02'),(6,'01','06','티(티바나)','2022-08-02');
/*!40000 ALTER TABLE `menu_cate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `storename` char(20) DEFAULT NULL,
  `storeimg` char(50) DEFAULT NULL,
  `zip` char(6) DEFAULT NULL,
  `addr1` varchar(200) DEFAULT NULL,
  `addr2` varchar(200) DEFAULT NULL,
  `lat` char(20) DEFAULT NULL,
  `lng` char(20) DEFAULT NULL,
  `writeday` date DEFAULT NULL,
  `state` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store`
--

LOCK TABLES `store` WRITE;
/*!40000 ALTER TABLE `store` DISABLE KEYS */;
INSERT INTO `store` VALUES (1,'마두역점',NULL,'10414','경기 고양시 일산동구 중앙로 1191','굿모닝 법조타운1 1층',NULL,NULL,'2022-08-02',0);
/*!40000 ALTER TABLE `store` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-02 17:55:49
