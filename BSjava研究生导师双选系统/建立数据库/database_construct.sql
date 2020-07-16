-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: student_teacher
-- ------------------------------------------------------
-- Server version	8.0.16

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
-- Table structure for table `student_choose_info`
--

DROP TABLE IF EXISTS `student_choose_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `student_choose_info` (
  `studentid` varchar(45) NOT NULL,
  `studentname` varchar(45) NOT NULL,
  `firstchoose` varchar(45) DEFAULT NULL,
  `secondchoose` varchar(45) DEFAULT NULL,
  `thirdchoose` varchar(45) DEFAULT NULL,
  `is_teacher_choose` varchar(45) DEFAULT NULL,
  `is_teacher_choose_2` varchar(45) DEFAULT NULL,
  `is_teacher_choose_3` varchar(45) DEFAULT NULL,
  `major` varchar(45) NOT NULL,
  PRIMARY KEY (`studentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_choose_info`
--

LOCK TABLES `student_choose_info` WRITE;
/*!40000 ALTER TABLE `student_choose_info` DISABLE KEYS */;
INSERT INTO `student_choose_info` VALUES ('1','桑圣宇','张老师','李老师','王老师','导师选择：未选择','导师选择：未选择','导师选择：未选择','计算机'),('2','桑圣弘','张老师','李老师','王老师','导师选择：未选择','导师选择：未选择','导师选择：未选择','计算机'),('3','张三丰','李老师','王老师','马老师','导师选择：未选择','导师选择：未选择','导师选择：未选择','计算机'),('5','王小明','欧阳老师','周老师','赵老师','导师选择：未选择','导师选择：未选择','导师选择：未选择','电子');
/*!40000 ALTER TABLE `student_choose_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `student_choose_info_view`
--

DROP TABLE IF EXISTS `student_choose_info_view`;
/*!50001 DROP VIEW IF EXISTS `student_choose_info_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `student_choose_info_view` AS SELECT 
 1 AS `studentid`,
 1 AS `studentname`,
 1 AS `firstchoose`,
 1 AS `secondchoose`,
 1 AS `thirdchoose`,
 1 AS `is_teacher_choose`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `teacher_info`
--

DROP TABLE IF EXISTS `teacher_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `teacher_info` (
  `teacherid` varchar(45) NOT NULL,
  `teachername` varchar(45) DEFAULT NULL,
  `teacher_major` varchar(45) DEFAULT NULL,
  `college` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`teacherid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_info`
--

LOCK TABLES `teacher_info` WRITE;
/*!40000 ALTER TABLE `teacher_info` DISABLE KEYS */;
INSERT INTO `teacher_info` VALUES ('401','欧阳老师','电吉他弹奏','艺术'),('701','周老师','宏观经济学','经管'),('702','赵老师','微观经济学','经管'),('901','张老师','人工智能','计算机'),('902','李老师','软件测试','计算机'),('903','王老师','VLSI电路设计','计算机'),('904','马老师','大数据发掘','计算机');
/*!40000 ALTER TABLE `teacher_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `teacher_info_view`
--

DROP TABLE IF EXISTS `teacher_info_view`;
/*!50001 DROP VIEW IF EXISTS `teacher_info_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `teacher_info_view` AS SELECT 
 1 AS `teacherid`,
 1 AS `teachername`,
 1 AS `teacher_major`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `time_limit`
--

DROP TABLE IF EXISTS `time_limit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `time_limit` (
  `start_time` varchar(100) NOT NULL,
  `end_time` varchar(100) NOT NULL,
  PRIMARY KEY (`start_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_limit`
--

LOCK TABLES `time_limit` WRITE;
/*!40000 ALTER TABLE `time_limit` DISABLE KEYS */;
INSERT INTO `time_limit` VALUES ('2020-06-21T13:59:59','2020-06-23T23:59:59');
/*!40000 ALTER TABLE `time_limit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userinfo`
--

DROP TABLE IF EXISTS `userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `userinfo` (
  `username` varchar(45) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `usertype` varchar(45) DEFAULT NULL,
  `college` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userinfo`
--

LOCK TABLES `userinfo` WRITE;
/*!40000 ALTER TABLE `userinfo` DISABLE KEYS */;
INSERT INTO `userinfo` VALUES ('周老师','123','teacher','经管'),('张三丰','123456','student','计算机'),('张老师','123','teacher','计算机'),('李老师','123','teacher','计算机'),('桑圣宇','123456','student','计算机'),('桑圣弘','123456','student','计算机'),('欧阳老师','123','teacher','艺术'),('王小明','123456','student','电子'),('王老师','123','teacher','计算机'),('研究院管理员','admin','iadmin','研究院'),('经管管理员','admin','cadmin','经管'),('计算机管理员','admin','cadmin','计算机'),('赵老师','123','teacher','经管'),('马老师','123','teacher','计算机');
/*!40000 ALTER TABLE `userinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `userinfo_view`
--

DROP TABLE IF EXISTS `userinfo_view`;
/*!50001 DROP VIEW IF EXISTS `userinfo_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `userinfo_view` AS SELECT 
 1 AS `username`,
 1 AS `password`,
 1 AS `usertype`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `student_choose_info_view`
--

/*!50001 DROP VIEW IF EXISTS `student_choose_info_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `student_choose_info_view` AS select `student_choose_info`.`studentid` AS `studentid`,`student_choose_info`.`studentname` AS `studentname`,`student_choose_info`.`firstchoose` AS `firstchoose`,`student_choose_info`.`secondchoose` AS `secondchoose`,`student_choose_info`.`thirdchoose` AS `thirdchoose`,`student_choose_info`.`is_teacher_choose` AS `is_teacher_choose` from `student_choose_info` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `teacher_info_view`
--

/*!50001 DROP VIEW IF EXISTS `teacher_info_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `teacher_info_view` AS select `teacher_info`.`teacherid` AS `teacherid`,`teacher_info`.`teachername` AS `teachername`,`teacher_info`.`teacher_major` AS `teacher_major` from `teacher_info` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `userinfo_view`
--

/*!50001 DROP VIEW IF EXISTS `userinfo_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `userinfo_view` AS select `userinfo`.`username` AS `username`,`userinfo`.`password` AS `password`,`userinfo`.`usertype` AS `usertype` from `userinfo` */;
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

-- Dump completed on 2020-06-22 20:50:12
