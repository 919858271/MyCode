-- MySQL dump 10.13  Distrib 5.5.41, for Win64 (x86)
--
-- Host: localhost    Database: school
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-06-05 18:31:50
