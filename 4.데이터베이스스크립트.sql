-- MySQL dump 10.13  Distrib 5.7.18, for Win64 (x86_64)
--
-- Host: localhost    Database: sm
-- ------------------------------------------------------
-- Server version	5.7.18-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `content` mediumtext NOT NULL,
  `art_u_id` int(11) NOT NULL,
  `post_date` date NOT NULL,
  `art_f_id` int(11) DEFAULT NULL,
  `art_b_id` int(11) NOT NULL,
  `condition` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `art_u_fk_idx` (`art_u_id`),
  KEY `art_f_fk_idx` (`art_f_id`),
  KEY `art_b_fk_idx` (`art_b_id`),
  CONSTRAINT `art_b_fk` FOREIGN KEY (`art_b_id`) REFERENCES `board` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `art_f_fk` FOREIGN KEY (`art_f_id`) REFERENCES `file` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `art_u_fk` FOREIGN KEY (`art_u_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (1,'공지사항1','공지사항1',3,'2017-11-28',266,1,0),(2,'질문1','질문1',3,'2017-11-28',267,3,0),(3,'보고서1','보고서1',3,'2017-11-28',268,5,0),(4,'질문2','질문2',15,'2017-12-18',NULL,3,0),(5,'질문3','질문3\r\n',15,'2017-12-18',NULL,3,0),(6,'질문4','질문4',2,'2017-12-18',NULL,3,0),(15,'질문5','질문5',5,'2017-12-18',NULL,3,0),(16,'질문6','질문6',6,'2017-12-18',NULL,3,0),(17,'질문7','질문7',7,'2017-12-18',NULL,3,0),(18,'질문8','질문8',8,'2017-12-18',NULL,3,0),(19,'질문9','질문9',9,'2017-12-18',NULL,3,0),(20,'질문10','질문10',10,'2017-12-18',NULL,3,0),(21,'질문11','질문11',11,'2017-12-18',NULL,3,0),(22,'질문12','질문12',12,'2017-12-19',NULL,3,0),(23,'질문13','질문13',13,'2017-12-16',NULL,3,0),(24,'질문14','질문14',14,'2017-12-18',NULL,3,0),(25,'질문15','질문15',15,'2017-12-18',NULL,3,0),(26,'질문16','질문16',16,'2017-12-18',NULL,3,0),(27,'질문17','질문17',2,'2017-12-18',NULL,3,0),(28,'멘토신청기간입니다','멘토신청기간 내일',13,'2017-12-18',NULL,1,0),(29,'멘토신청 내일','멘토신청하세요',13,'2017-12-18',NULL,1,0),(30,'질문있어요','안드로이드 공부는 어떻게 하나요?',15,'2017-12-18',308,3,0);
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `board` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `b_name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (1,'공지사항'),(2,'학습자료게시판'),(3,'질문게시판'),(4,'컨퍼런스홍보게시판'),(5,'보고서');
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_content` mediumtext NOT NULL,
  `c_post_date` date NOT NULL,
  `com_u_id` int(11) NOT NULL,
  `com_a_id` int(11) NOT NULL,
  `com_condition` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `com_u_fk_idx` (`com_u_id`),
  KEY `com_a_fk_idx` (`com_a_id`),
  CONSTRAINT `com_a_fk` FOREIGN KEY (`com_a_id`) REFERENCES `article` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `com_u_fk` FOREIGN KEY (`com_u_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (18,'궁금해요!!','2017-12-18',15,30,1),(19,'네!!','2017-12-21',16,28,0);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dep_professor`
--

DROP TABLE IF EXISTS `dep_professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dep_professor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dep_id` int(11) NOT NULL,
  `pro_u_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dep_fk_idx` (`dep_id`),
  KEY `pro_u_fk_idx` (`pro_u_id`),
  CONSTRAINT `dep_fk` FOREIGN KEY (`dep_id`) REFERENCES `department` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pro_u_fk` FOREIGN KEY (`pro_u_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dep_professor`
--

LOCK TABLES `dep_professor` WRITE;
/*!40000 ALTER TABLE `dep_professor` DISABLE KEYS */;
/*!40000 ALTER TABLE `dep_professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `d_name` varchar(20) NOT NULL,
  `d_office` varchar(20) NOT NULL,
  `d_office_tel` varchar(50) NOT NULL,
  `staff_u_id` int(11) DEFAULT NULL,
  `condition` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `staff_u_fk_idx` (`staff_u_id`),
  KEY `dep_name_idx` (`d_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'소프트웨어공학과','6202','0211111111',10,0),(2,'컴퓨터공학과','6201','0211111112',3,0),(3,'정보통신공학과','6404','0211111113',13,0),(4,'글로컬IT학과','6206','0211111114',9,0),(5,'미소속','0000','0000',14,0);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file`
--

DROP TABLE IF EXISTS `file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=315 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file`
--

LOCK TABLES `file` WRITE;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
INSERT INTO `file` VALUES (201,'img/upload/1511613004754_디비.txt'),(202,'img/upload/1511613004761_디비.txt'),(203,'img/upload/1511613170672_디비.txt'),(204,'img/upload/1511613170690_디비.txt'),(205,'img/upload/1511613961730_디비.txt'),(206,'img/upload/1511613961740_디비.txt'),(207,'img/upload/1511621387003_'),(208,'img/upload/1511621387014_'),(209,'img/upload/1511621741031_'),(210,'img/upload/1511621741039_'),(211,'img/upload/1511621937924_'),(212,'img/upload/1511621937941_'),(213,'img/upload/1511621959998_'),(214,'img/upload/1511621960007_'),(215,'img/upload/1511622279945_'),(216,'img/upload/1511622279963_'),(217,'img/upload/1511622357241_'),(218,'img/upload/1511622357262_'),(219,'img/upload/1511622774480_'),(220,'img/upload/1511622774490_'),(221,'img/upload/1511622807348_'),(222,'img/upload/1511622807358_'),(223,'img/upload/1511624533828_디비.txt'),(224,'img/upload/1511624533837_디비.txt'),(225,'img/upload/1511624586810_camera.gif'),(226,'img/upload/1511624675559_contact.txt'),(227,'img/upload/1511697635150_'),(228,'img/upload/1511697635161_'),(229,'img/upload/1511697776251_camera.gif'),(230,'img/upload/1511697776263_contact.txt'),(231,'img/upload/1511698312658_'),(232,'img/upload/1511698312664_'),(233,'img/upload/1511698347410_디비회의.txt'),(234,'img/upload/1511698347423_디비회의.txt'),(235,'img/upload/1511698374136_'),(236,'img/upload/1511698374145_'),(237,'img/upload/1511698672460_'),(238,'img/upload/1511698672466_'),(239,'img/upload/1511698884494_'),(240,'img/upload/1511698884512_'),(241,'img/upload/1511698923213_디비회의.txt'),(242,'img/upload/1511698923225_디비회의.txt'),(243,'img/upload/1511699327960_디비회의.txt'),(244,'img/upload/1511699328004_디비회의.txt'),(245,'img/upload/1511699434316_디비회의.txt'),(246,'img/upload/1511699434359_디비회의.txt'),(247,'img/upload/1511699513140_디비회의.txt'),(248,'img/upload/1511699513164_디비회의.txt'),(249,'img/upload/1511759031827_디비회의.txt'),(250,'img/upload/1511759031851_디비회의.txt'),(251,'img/upload/1511759207443_디비회의.txt'),(252,'img/upload/1511759207473_디비회의.txt'),(253,'img/upload/1511761401418_camera.png'),(254,'img/upload/1511761401430_file.png'),(255,'img/upload/1511761401435_디비회의.txt'),(256,'img/upload/1511763947079_camera.png'),(257,'img/upload/1511763947103_camera.png'),(258,'img/upload/1511765076572_camera.png'),(259,'img/upload/1511765076581_디비플젝.txt'),(260,'img/upload/1511765737650_camera.png'),(261,'img/upload/1511765737659_contact.txt'),(262,'img/upload/1511772260471_디비회의.txt'),(263,'img/upload/1511790277455_camera.png'),(264,'img/upload/1511790277483_sm사업 데이터베이스 테이블.pptx'),(265,'img/upload/1511790277498_디비회의.txt'),(266,'img/upload/1511829601794_camera.png'),(267,'img/upload/1511829757611_camera.png'),(268,'img/upload/1511829769039_camera.png'),(269,'img/upload/1511830029085_camera.png'),(270,'img/upload/1511830029091_contact.txt'),(271,'img/upload/1511830029098_contact.txt'),(272,'img/upload/1511830517530_camera.png'),(273,'img/upload/1511830517546_camera.png'),(274,'img/upload/1511830517551_디비플젝.txt'),(275,'img/upload/1511831297390_camera.png'),(276,'img/upload/1511831297402_디비플젝.txt'),(277,'img/upload/1511831297408_디비플젝.txt'),(278,'img/upload/1511831353858_camera.png'),(279,'img/upload/1511831353867_디비회의.txt'),(280,'img/upload/1511831388167_camera.png'),(281,'img/upload/1511831388188_디비플젝.txt'),(282,'img/upload/1511832578279_camera.png'),(283,'img/upload/1511832578287_디비회의.txt'),(284,'img/upload/1511833305617_camera.png'),(285,'img/upload/1511833305632_디비플젝.txt'),(286,'img/upload/1511833409777_camera.gif'),(287,'img/upload/1511834670543_file.png'),(288,'img/upload/1511834670552_디비회의.txt'),(289,'img/upload/1511834670559_디비회의.txt'),(290,'img/upload/1513591390029_다운로드.png'),(291,'img/upload/1513591390106_다운로드.png'),(292,'img/upload/1513591390135_messagelist.txt'),(293,'img/upload/1513592059518_1200px-Ruby_logo.png'),(294,'img/upload/1513592059664_1200px-Ruby_logo.png'),(295,'img/upload/1513592059685_1200px-Ruby_logo.png'),(296,'img/upload/1513592152303_kotlin_800x320.png'),(297,'img/upload/1513592152321_kotlin_800x320.png'),(298,'img/upload/1513592152337_kotlin_800x320.png'),(299,'img/upload/1513592210797_Java_programming_language_logo.svg.png'),(300,'img/upload/1513592210817_Java_programming_language_logo.svg.png'),(301,'img/upload/1513592210836_Java_programming_language_logo.svg.png'),(302,'img/upload/1513592277283_다운로드 (1).png'),(303,'img/upload/1513592277303_다운로드 (1).png'),(304,'img/upload/1513592277319_다운로드 (1).png'),(305,'img/upload/1513592401661_swift-og.png'),(306,'img/upload/1513592401683_1200px-Ruby_logo.png'),(307,'img/upload/1513592401704_2017년도 취업클리닉주간 행사 참여소감문.hwp'),(308,'img/upload/1513592525664_다운로드.png'),(309,'img/upload/1513853516729_다운로드.png'),(310,'img/upload/1513853516747_2017년도 취업클리닉주간 행사 참여소감문.hwp'),(311,'img/upload/1513857678548_1200px-Ruby_logo.png'),(312,'img/upload/1513857678595_1200px-Ruby_logo.png'),(313,'img/upload/1513857723680_1200px-Ruby_logo.png'),(314,'img/upload/1513857723705_1200px-Ruby_logo.png');
/*!40000 ALTER TABLE `file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `introduce`
--

DROP TABLE IF EXISTS `introduce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `introduce` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` mediumtext NOT NULL,
  `title` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `introduce`
--

LOCK TABLES `introduce` WRITE;
/*!40000 ALTER TABLE `introduce` DISABLE KEYS */;
INSERT INTO `introduce` VALUES (1,'사업소개','사업소개'),(2,'학교소개','학교소개'),(3,'학과소개','학과소개'),(4,'수업 소개','수업 소개');
/*!40000 ALTER TABLE `introduce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mentor_apply`
--

DROP TABLE IF EXISTS `mentor_apply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mentor_apply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(200) NOT NULL,
  `year` int(11) NOT NULL,
  `mentor_u_id` int(11) NOT NULL,
  `group_name` varchar(200) NOT NULL,
  `study_purpose` mediumtext NOT NULL,
  `study_content` mediumtext NOT NULL,
  `study_method` mediumtext NOT NULL,
  `apply_f_time_id` int(11) NOT NULL,
  `grade` varchar(5) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  `open_date` date DEFAULT NULL,
  `apply_f_intro_fk` int(11) NOT NULL,
  `apply_f_doc_fk` int(11) NOT NULL,
  `m_condition` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mentor_u_fk_idx` (`mentor_u_id`),
  KEY `apply_f_fk_idx` (`apply_f_time_id`),
  KEY `apply_f_intro_fk_idx` (`apply_f_intro_fk`),
  KEY `apply_f_doc_fk_idx` (`apply_f_doc_fk`),
  CONSTRAINT `apply_f_doc_fk` FOREIGN KEY (`apply_f_doc_fk`) REFERENCES `file` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `apply_f_intro_fk` FOREIGN KEY (`apply_f_intro_fk`) REFERENCES `file` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `apply_f_time_fk` FOREIGN KEY (`apply_f_time_id`) REFERENCES `file` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `mentor_u_fk` FOREIGN KEY (`mentor_u_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mentor_apply`
--

LOCK TABLES `mentor_apply` WRITE;
/*!40000 ALTER TABLE `mentor_apply` DISABLE KEYS */;
INSERT INTO `mentor_apply` VALUES (5,'안드로이드',3,2,'안드로이드','안드로이드 스터디','안드로이드','프로젝트',291,'A+',4,'2017-12-21',290,292,0),(6,'루비',2,4,'루비','루비루','루비루','루비루',294,'A+',3,'2017-12-21',293,295,0),(7,'코틀린',3,5,'코틀린','코틀린','코틀린','코틀린',297,'A+',4,NULL,296,298,0),(8,'자바',4,6,'자바','자바','자바','자바',300,'B+',5,NULL,299,301,0),(9,'스프링',4,7,'스프링','스프링','스프링','스프링',303,'A+',5,NULL,302,304,0),(10,'swift',4,15,'swift','swift','swift','swift',306,'A+',5,NULL,305,307,0);
/*!40000 ALTER TABLE `mentor_apply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(50) NOT NULL,
  `place` varchar(50) NOT NULL,
  `day` varchar(20) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `study_content` mediumtext NOT NULL,
  `create_date` date NOT NULL,
  `rep_f_photo_id` int(11) NOT NULL,
  `rep_u_id` int(11) NOT NULL,
  `rep_team_id` int(11) DEFAULT NULL,
  `rep_f_study_id` int(11) NOT NULL,
  `rep_condition` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `rep_f_fk_idx` (`rep_f_photo_id`),
  KEY `rep_u_fk_idx` (`rep_u_id`),
  KEY `rep_g_fk_idx` (`rep_team_id`),
  KEY `rep_f_study_fk_idx` (`rep_f_study_id`),
  CONSTRAINT `rep_f_photo_fk` FOREIGN KEY (`rep_f_photo_id`) REFERENCES `file` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `rep_f_study_fk` FOREIGN KEY (`rep_f_study_id`) REFERENCES `file` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `rep_team_fk` FOREIGN KEY (`rep_team_id`) REFERENCES `team` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `rep_u_fk` FOREIGN KEY (`rep_u_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
INSERT INTO `report` VALUES (5,'안드로이드','6202','월요일','19:51:00','21:51:00','액티비티 생성','2017-12-21',309,2,NULL,310,0),(6,'루비','6202','화요일','09:00:00','11:00:00','루비 기초','2017-12-21',311,4,NULL,312,0),(7,'루비2','6405','토요일','10:01:00','11:01:00','루비 기초2','2017-12-21',313,4,NULL,314,0);
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting`
--

DROP TABLE IF EXISTS `setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mentor_start_date` date NOT NULL,
  `mentor_expire_date` date NOT NULL,
  `mentee_start_date` date NOT NULL,
  `mentee_expire_date` date NOT NULL,
  `study_count` int(11) NOT NULL DEFAULT '15',
  `max_mentor` int(11) NOT NULL DEFAULT '20',
  `max_mentee` int(11) NOT NULL DEFAULT '5',
  `min_mentee` int(11) NOT NULL DEFAULT '3',
  `report_deadline` int(11) NOT NULL,
  `sm_start_date` date NOT NULL,
  `sm_expire_date` date NOT NULL,
  `survey` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting`
--

LOCK TABLES `setting` WRITE;
/*!40000 ALTER TABLE `setting` DISABLE KEYS */;
INSERT INTO `setting` VALUES (8,'2017-12-18','2017-12-18','2017-12-20','2017-12-20',15,25,6,3,5,'2017-12-21','2017-12-21',NULL);
/*!40000 ALTER TABLE `setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'학생'),(2,'교수'),(3,'직원');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_m_apply_id` int(11) NOT NULL,
  `group_mentee_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group_m_apply_fk_idx` (`group_m_apply_id`),
  KEY `group_mentee_fk_idx` (`group_mentee_id`),
  CONSTRAINT `group_m_apply_fk` FOREIGN KEY (`group_m_apply_id`) REFERENCES `mentor_apply` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `group_mentee_fk` FOREIGN KEY (`group_mentee_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (16,5,2),(18,6,4),(19,7,5),(20,8,6),(21,9,7),(22,10,15),(30,5,11),(31,5,12),(32,6,8),(33,6,19),(34,5,16);
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timetable`
--

DROP TABLE IF EXISTS `timetable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timetable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `time_apply_id` int(11) NOT NULL,
  `time_user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `time_apply_fk_idx` (`time_apply_id`),
  KEY `time_user_id_fk_idx` (`time_user_id`),
  CONSTRAINT `time_apply_fk` FOREIGN KEY (`time_apply_id`) REFERENCES `mentor_apply` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timetable`
--

LOCK TABLES `timetable` WRITE;
/*!40000 ALTER TABLE `timetable` DISABLE KEYS */;
INSERT INTO `timetable` VALUES (1,1,1,5,2),(2,2,1,5,2),(3,3,1,5,2),(4,3,1,5,11),(5,3,2,5,11),(6,3,3,5,11),(7,3,1,5,16),(8,3,3,5,16),(9,4,1,5,16),(10,4,2,5,16),(11,4,3,5,16),(12,5,3,5,16);
/*!40000 ALTER TABLE `timetable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) NOT NULL,
  `pw` varchar(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `office` varchar(20) DEFAULT NULL,
  `office_tel` varchar(50) DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `major_id` int(11) NOT NULL,
  `minor_id` int(11) DEFAULT NULL,
  `double_id` int(11) DEFAULT NULL,
  `condition` int(11) NOT NULL DEFAULT '0',
  `status_id` int(11) NOT NULL,
  `auth_date` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  UNIQUE KEY `phone_UNIQUE` (`phone`),
  KEY `major_fk_idx` (`major_id`),
  KEY `minor_fk_idx` (`minor_id`),
  KEY `double_fk_idx` (`double_id`),
  KEY `user_name_idx` (`name`),
  KEY `pos_id_fk_idx` (`status_id`),
  CONSTRAINT `double_fk` FOREIGN KEY (`double_id`) REFERENCES `department` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `major_fk` FOREIGN KEY (`major_id`) REFERENCES `department` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `minor_fk` FOREIGN KEY (`minor_id`) REFERENCES `department` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `status_id_fk` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (2,'1','6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b','홍길동','1','1','','',3,1,NULL,NULL,0,1,'2017-11-28'),(3,'201232013','67cfe2fe6fe31ffde97e25bf496736b4b73cc41a7b26cea54e6dec6f6723f80','관리자','201232013','201232013','','',2,2,NULL,NULL,0,3,'2017-11-28'),(4,'2','d4735e3a265e16eee03f59718b9b5d319c7d8b6c51f90da3a666eec13ab35','김이번','2','2','','',3,1,NULL,NULL,0,1,'2017-11-28'),(5,'3','4e7408562bedb8b60ce5c1decfe3ad16b72230967de01f64b7e4729b49fce','박삼번','3','3','','',3,1,NULL,NULL,0,1,'2017-11-28'),(6,'4','4b227777d4dd1fc61c6f884f48641d2b4d121d3fd328cb08b5531fcacdabf8a','유사번','4','4','','',3,1,NULL,NULL,0,1,'2017-11-28'),(7,'5','ef2d127de37b942baad06145e54bc619a1f22327b2ebbcfbec78f5564afe39d','마오번','5','5','','',3,1,NULL,NULL,0,1,'2017-11-28'),(8,'6','e7f6c011776e8db7cd33b54174fd76f7d216b612387a5ffcfb81e6f0919683','이육번','6','6','','',1,1,NULL,NULL,0,1,'2017-11-28'),(9,'7','792699be42c8a8e46fbbb451726517e86b22c56a189f7625a6da4981b2451','임꺽정','7','7','','',2,4,NULL,NULL,0,1,'2017-11-28'),(10,'201532028','7b3ab2e787c1f823d5967c2066e2d1a522eaebcb37a0d1c6f3a6c5666497ee4','이혜민','zzz0484@naver.com','01074441260','','',2,1,NULL,NULL,0,3,'2017-11-28'),(11,'8','2c624232cdd221771294dfbb31aca0adf6ac8b66b696d9ef06fdefb64a3','정팔번','8','8','','',4,1,NULL,NULL,0,1,'2017-11-28'),(12,'9','19581e27de7ced0ff1ce5b2047e7a567c76b1cbaebabe5ef3f7c317bb5b7','한구번','9','9','','',4,1,NULL,NULL,0,1,'2017-11-28'),(13,'1111','ffe1abd1a8215353c233d6e09613e95eec4253832a761af28ff37ac5a15c','김관리자','1111@gmail.com','01012345678','','',2,3,NULL,NULL,0,3,'2017-12-18'),(14,'2222','edee29f882543b956620b26dee0e7e950399b1c4222f5de5e06425b4c995e9','김직원','2222@naver.com','01022222222','','',2,5,NULL,NULL,0,3,'2017-12-18'),(15,'3333','318aee3fed8c9d4d35a7fc1fa776fb31303833aa2de885354ddf3d44d8fb69','박학생','3333@naver.com','0112345678','','',3,1,NULL,NULL,0,1,'2017-12-18'),(16,'4444','79f06f8fde333461739f22090a23cb2a79f6d714bee10de4b4af249294619','이학생','4444@naver.com','01044444444','','',4,2,NULL,NULL,0,1,'2017-12-18'),(19,'201432013','e02f366ff06926c0dd2e1a84e7530e66af22fdec91aefeda2e843bc59ebc2','남하영','cccc@naver.com','01011111112',NULL,NULL,1,1,NULL,NULL,0,1,'2017-12-18');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-19 22:52:59
