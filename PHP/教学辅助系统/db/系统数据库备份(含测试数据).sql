CREATE DATABASE  IF NOT EXISTS `school` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `school`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: school
-- ------------------------------------------------------
-- Server version	5.5.41

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `anumber` int(11) NOT NULL,
  `name` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL,
  PRIMARY KEY (`name`,`anumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (123456,'超级管理员','123456');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bbs_que`
--

DROP TABLE IF EXISTS `bbs_que`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bbs_que` (
  `que_id` int(11) NOT NULL AUTO_INCREMENT,
  `que_kind` varchar(15) DEFAULT '默认',
  `que_title` varchar(60) NOT NULL,
  `que_content` varchar(500) NOT NULL,
  `who_ask` varchar(45) NOT NULL,
  `ask_time` datetime NOT NULL,
  `view_times` int(11) DEFAULT '0',
  `rep_times` int(11) DEFAULT '0',
  `last_rep_who` varchar(45) NOT NULL,
  `last_rep_time` datetime NOT NULL,
  `que_which_course` varchar(45) NOT NULL,
  `user_dept` varchar(45) NOT NULL,
  PRIMARY KEY (`que_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bbs_que`
--

LOCK TABLES `bbs_que` WRITE;
/*!40000 ALTER TABLE `bbs_que` DISABLE KEYS */;
/*!40000 ALTER TABLE `bbs_que` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bbs_rep`
--

DROP TABLE IF EXISTS `bbs_rep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bbs_rep` (
  `rep_id` int(11) NOT NULL AUTO_INCREMENT,
  `que_id` int(11) NOT NULL,
  `rep_content` varchar(500) NOT NULL,
  `who_rep` varchar(45) NOT NULL,
  `user_dept` varchar(15) NOT NULL,
  `rep_time` varchar(45) NOT NULL,
  `max_rep_time` int(11) NOT NULL DEFAULT '2',
  `other` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`rep_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bbs_rep`
--

LOCK TABLES `bbs_rep` WRITE;
/*!40000 ALTER TABLE `bbs_rep` DISABLE KEYS */;
/*!40000 ALTER TABLE `bbs_rep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classes` (
  `class_id` varchar(20) NOT NULL,
  `class_name` varchar(45) NOT NULL,
  `dept_id` varchar(45) NOT NULL,
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES ('20111801','信息计算111801班','101'),('20111802','信息计算111802班','101'),('20111807','应用化学1301班','103'),('20121803','信息计算121802班','101'),('20121804','光信息121802班','102'),('20131803','光信息131802班','102'),('20131805','信息计算131801班','101'),('20141805','应用数学1402班','101'),('20141808','高分子化学1303班','103');
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `c_id` varchar(18) NOT NULL,
  `c_name` varchar(45) NOT NULL,
  `which_term` varchar(45) NOT NULL,
  `class` varchar(45) NOT NULL,
  `who_teach` varchar(45) NOT NULL,
  `c_state` varchar(100) NOT NULL,
  `c_sid` int(11) NOT NULL DEFAULT '1',
  `c_plan` int(11) NOT NULL DEFAULT '0',
  `class_id` varchar(45) NOT NULL,
  `dept_id` varchar(20) NOT NULL,
  `course_intr` varchar(1000) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES ('20111101','数据分析','1','信息计算111801班','43009','../../tools/images/open.png',1,0,'20111801','101',NULL,21,'李老师'),('20111102','数据结构','2','信息计算111801班','43004','../../tools/images/open.png',1,0,'20111801','101',NULL,22,'陈老师'),('20111103','数学分析','1','信息计算111802班','43000','../../tools/images/open.png',1,0,'20111802','101',NULL,23,'杨老师'),('20111104','高等代数','2','信息计算111802班','43000','../../tools/images/open.png',1,0,'20111802','101',NULL,24,'杨老师'),('20111105','运筹学','2','信息计算111801班','43011','../../tools/images/open.png',1,0,'20111801','101',NULL,25,'董老师'),('20111106','数据库','1','信息计算111801班','43010','../../tools/images/open.png',1,0,'20111801','101',NULL,26,'金老师'),('20111110','数据库应用系统设计','1','信息计算111801班','43010','../../tools/images/open.png',1,0,'20111801','101',NULL,27,'金老师'),('20111111','软件工程','1','信息计算111801班','43010','../../tools/images/open.png',1,0,'20111801','101',NULL,28,'金老师'),('20111110','数据库应用系统设计','1','信息计算111802班','43010','../../tools/images/open.png',1,0,'20111802','101',NULL,29,'金老师'),('20111112','mysql应用','1','信息计算111802班','43010','../../tools/images/open.png',1,0,'20111802','101',NULL,30,'金老师');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experiment`
--

DROP TABLE IF EXISTS `experiment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `experiment` (
  `course_id` varchar(20) NOT NULL,
  `pace_id` varchar(45) NOT NULL,
  `pace_name` varchar(250) NOT NULL,
  `start_time` varchar(45) NOT NULL,
  `end_time` varchar(45) NOT NULL,
  `detial` varchar(1000) NOT NULL,
  PRIMARY KEY (`course_id`,`pace_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiment`
--

LOCK TABLES `experiment` WRITE;
/*!40000 ALTER TABLE `experiment` DISABLE KEYS */;
INSERT INTO `experiment` VALUES ('20111106','E1433559116','数据库应用系统设计与实现','2015-06-01','2015-07-01','设计并实现一个小型数据库应用系统。'),('20111106','E1433559190','设计要求1','2015-06-01','2015-07-01','测试要求');
/*!40000 ALTER TABLE `experiment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_list`
--

DROP TABLE IF EXISTS `file_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `true_name` varchar(1000) NOT NULL,
  `new_name` varchar(45) NOT NULL,
  `up_time` date NOT NULL,
  `who_share` varchar(20) NOT NULL,
  `course_id` varchar(20) NOT NULL,
  `ins` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_list`
--

LOCK TABLES `file_list` WRITE;
/*!40000 ALTER TABLE `file_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL,
  `detial` varchar(350) NOT NULL,
  `times` datetime NOT NULL,
  `idf` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report` (
  `pace_id` varchar(20) NOT NULL,
  `s_number` varchar(20) NOT NULL,
  `s_name` varchar(15) NOT NULL,
  `s_class` varchar(25) NOT NULL,
  `course_id` varchar(45) NOT NULL,
  `exp_report_title` varchar(45) NOT NULL,
  `exp_report_content` varchar(1000) NOT NULL,
  `exp_report_up_time` datetime NOT NULL,
  `report_true_name` varchar(150) NOT NULL,
  `report_new_name` varchar(15) NOT NULL,
  `marking` varchar(10) NOT NULL DEFAULT '未批阅',
  `mark` varchar(45) DEFAULT NULL,
  `other` varchar(100) DEFAULT NULL,
  `idf` int(11) DEFAULT '0',
  PRIMARY KEY (`pace_id`,`s_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
INSERT INTO `report` VALUES ('E1433559116','201118030221','徐同学','信息计算111801班','20111106','11111111111111111111','111111111111111111111111111111111111111111111111111111111111111111','2015-06-17 11:20:05','毕业设计程序','R1434511205.rar','未批阅',NULL,NULL,0);
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `snumber` varchar(15) CHARACTER SET utf8 NOT NULL,
  `sname` varchar(15) CHARACTER SET utf8 NOT NULL,
  `password` varchar(15) CHARACTER SET utf8 NOT NULL,
  `ssex` varchar(10) CHARACTER SET utf8 NOT NULL,
  `sclass` varchar(20) CHARACTER SET utf8 NOT NULL,
  `class_id` varchar(20) CHARACTER SET utf8 NOT NULL,
  `sdept` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`snumber`),
  UNIQUE KEY `sunmber_UNIQUE` (`snumber`)
) ENGINE=InnoDB DEFAULT CHARSET=ucs2;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('123456','admin','123456','男','信息计算111802班','20111802','101'),('201118020221','徐同学','123456','男','信息计算111802班','20111802','101'),('201118030207','张同学','123456','男','信息计算111802班','20111802','101'),('201118030210','徐同学','123456','男','信息计算111801班','20111801','101'),('201118030213','李同学','123456','男','光信息131802班','20131803','102'),('201118030214','赵同学','123456','男','信息计算121802班','20121803','101'),('201118030217','杨同学','123456','男','信息计算111802班','20111802','101'),('201118030218','朱同学','123456','男','信息计算111802班','20111802','101'),('201118030219','汪同学','123456','女','信息计算111802班','20111802','101'),('201118030220','钱同学','123456','男','光信息131802班','20131803','102'),('201118030221','徐同学','123456','男','信息计算111801班','20111801','101'),('201118030222','陈同学','123456','男','信息计算111802班','20111802','101'),('201118030224','习同学','123456','男','信息计算121802班','20121803','101'),('201118030226','宋同学','123456','男','信息计算111801班','20111801','101'),('201118030227','谢同学','123456','男','信息计算111801班','20111801','101'),('201118030228','庞同学','123456','女','信息计算111801班','20111801','101'),('201118030230','展同学','123456','男','光信息111801班','20111803','102'),('201218030216','公孙同学','123456','男','光信息121802班','20121804','102'),('201418030219','诸葛同学','123456','男','光信息121802班','20121804','102'),('201518030217','黄同学','123456','男','应用化学1301班','20111807','103'),('201718030217','司马同学','123456','女','高分子化学1303班','20141808','103'),('201718030218','项同学','123456','男','高分子化学','20141808','103');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher` (
  `tnumber` varchar(15) NOT NULL,
  `tname` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL,
  `tsex` varchar(15) NOT NULL,
  `tdept` varchar(20) NOT NULL,
  `dept_name` varchar(25) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES ('43009','李老师','123456','男','101','数学系',1),('43008','张老师','123456','女','103','化学系',3),('40332','王老师','123456','男','102','物理系',4),('43003','汪老师','123456','女','103','化学系',5),('43004','陈老师','123456','男','101','数学系',6),('43000','杨老师','123456','男','101','数学系',7),('43010','金老师','123456','女','101','数学系',8),('43011','董老师','123456','男','101','数学系',9),('43012','何老师','123456','男','101','数学系',12),('43001','韩老师','123456','男','101','数学系',13);
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-06-24 12:34:03
