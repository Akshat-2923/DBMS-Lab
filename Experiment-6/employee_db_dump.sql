-- MySQL dump 10.13  Distrib 26.7.0, for Win64 (x86_64)
--
-- Host: localhost    Database: dbms_lab
-- ------------------------------------------------------
-- Server version	26.7.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `dept_id` int NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(100) NOT NULL,
  `location` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`dept_id`),
  UNIQUE KEY `dept_name` (`dept_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'HR','Bangalore'),(2,'Engineering','Bangalore'),(3,'Marketing','Hyderabad'),(4,'Sales','Delhi'),(5,'Finance','Delhi');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `emp_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `salary` decimal(10,2) NOT NULL,
  `dept_id` int DEFAULT NULL,
  `manager_id` int DEFAULT NULL,
  `hire_date` date NOT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `dept_id` (`dept_id`),
  KEY `manager_id` (`manager_id`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`) ON DELETE SET NULL,
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`manager_id`) REFERENCES `employee` (`emp_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Priya','Singh',100250.00,2,NULL,'2020-01-01'),(2,'Shaurya','Mishra',117807.00,2,NULL,'2020-01-01'),(3,'Shaurya','Verma',99843.00,3,NULL,'2020-01-01'),(4,'Kian','Roy',119236.00,4,NULL,'2020-01-01'),(5,'Rishi','Mishra',107203.00,5,NULL,'2020-01-01'),(6,'Darsh','Roy',62576.00,2,2,'2023-04-01'),(7,'Darsh','Sharma',58005.00,2,2,'2022-01-10'),(8,'Krishna','Reddy',49607.00,4,4,'2022-02-12'),(9,'Priya','Verma',52478.00,4,4,'2022-06-21'),(10,'Neha','Das',73708.00,1,1,'2022-02-22'),(11,'Rudra','Choudhury',69730.00,4,4,'2022-04-05'),(12,'Ishaan','Singh',51839.00,5,5,'2023-07-14'),(13,'Priya','Verma',41394.00,5,5,'2023-02-13'),(14,'Kian','Gupta',41066.00,2,2,'2023-11-26'),(15,'Aisha','Patel',46537.00,4,4,'2021-04-12'),(16,'Rishi','Agarwal',87602.00,5,5,'2022-02-04'),(17,'Darsh','Verma',79139.00,4,4,'2022-11-02'),(18,'Krishna','Das',57647.00,2,2,'2022-05-01'),(19,'Vivaan','Das',74105.00,5,5,'2022-04-19'),(20,'Aditya','Das',63489.00,2,2,'2021-10-14'),(21,'Reyansh','Kumar',47399.00,4,4,'2023-05-13'),(22,'Ishaan','Rao',60365.00,1,1,'2023-05-08'),(23,'Rishi','Joshi',58487.00,1,1,'2021-09-13'),(24,'Neha','Jain',67614.00,3,3,'2023-04-04'),(25,'Vivaan','Singh',57031.00,3,3,'2023-08-18'),(26,'Rudra','Gupta',81753.00,5,5,'2021-10-04'),(27,'Ananya','Choudhury',71412.00,2,2,'2023-08-20'),(28,'Atharv','Choudhury',64622.00,1,1,'2021-10-01'),(29,'Kabir','Patel',56725.00,1,1,'2023-01-08'),(30,'Rishi','Choudhury',88193.00,4,4,'2021-09-20');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 */ /*!50003 TRIGGER `before_employee_insert` BEFORE INSERT ON `employee` FOR EACH ROW BEGIN
    IF NEW.salary < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Salary cannot be negative';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 */ /*!50003 TRIGGER `before_employee_update` BEFORE UPDATE ON `employee` FOR EACH ROW BEGIN
    IF NEW.salary < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Salary cannot be negative';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 */ /*!50003 TRIGGER `after_employee_update` AFTER UPDATE ON `employee` FOR EACH ROW BEGIN
    IF OLD.salary != NEW.salary OR OLD.dept_id != NEW.dept_id THEN
        INSERT INTO EmployeeAudit (emp_id, old_salary, new_salary, old_dept_id, new_dept_id, action_type)
        VALUES (NEW.emp_id, OLD.salary, NEW.salary, OLD.dept_id, NEW.dept_id, 'UPDATE');
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `employeeaudit`
--

DROP TABLE IF EXISTS `employeeaudit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employeeaudit` (
  `audit_id` int NOT NULL AUTO_INCREMENT,
  `emp_id` int NOT NULL,
  `old_salary` decimal(10,2) DEFAULT NULL,
  `new_salary` decimal(10,2) DEFAULT NULL,
  `old_dept_id` int DEFAULT NULL,
  `new_dept_id` int DEFAULT NULL,
  `action_type` varchar(20) NOT NULL,
  `action_timestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`audit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeeaudit`
--

LOCK TABLES `employeeaudit` WRITE;
/*!40000 ALTER TABLE `employeeaudit` DISABLE KEYS */;
INSERT INTO `employeeaudit` VALUES (1,1,100250.00,100250.00,1,2,'UPDATE','2026-10-09 01:40:32'),(2,3,94843.00,99843.00,3,3,'UPDATE','2026-10-09 01:40:32');
/*!40000 ALTER TABLE `employeeaudit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeeproject`
--

DROP TABLE IF EXISTS `employeeproject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employeeproject` (
  `emp_id` int NOT NULL,
  `project_id` int NOT NULL,
  `hours_worked` int DEFAULT '0',
  PRIMARY KEY (`emp_id`,`project_id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `employeeproject_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`) ON DELETE CASCADE,
  CONSTRAINT `employeeproject_ibfk_2` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeeproject`
--

LOCK TABLES `employeeproject` WRITE;
/*!40000 ALTER TABLE `employeeproject` DISABLE KEYS */;
INSERT INTO `employeeproject` VALUES (1,6,69),(2,2,12),(2,4,10),(3,1,93),(4,7,100),(4,8,88),(5,7,23),(6,3,95),(6,7,56),(7,2,95),(8,2,30),(8,4,20),(9,1,99),(9,6,47),(10,4,96),(10,6,24),(10,7,17),(11,3,56),(11,5,96),(11,6,48),(12,3,39),(12,7,95),(13,1,98),(13,6,59),(14,1,55),(14,3,56),(14,4,68),(15,3,34),(15,6,12),(15,8,90),(16,4,85),(16,5,79),(16,6,45),(17,3,69),(17,7,66),(18,4,62),(18,6,42),(19,8,43),(20,4,21),(20,7,68),(21,4,57),(21,5,92),(21,6,94),(22,3,49),(22,6,36),(23,2,16),(23,8,30),(24,2,31),(25,4,18),(25,6,33),(26,2,93),(27,7,62),(28,2,74),(29,1,10),(29,5,95),(29,6,40),(30,3,22),(30,4,78);
/*!40000 ALTER TABLE `employeeproject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `project_id` int NOT NULL AUTO_INCREMENT,
  `project_name` varchar(100) NOT NULL,
  `budget` decimal(12,2) DEFAULT NULL,
  `dept_id` int DEFAULT NULL,
  PRIMARY KEY (`project_id`),
  UNIQUE KEY `project_name` (`project_name`),
  KEY `dept_id` (`dept_id`),
  CONSTRAINT `project_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1,'Alpha',90166.00,5),(2,'Beta',485238.00,4),(3,'Gamma',421407.00,2),(4,'Delta',450373.00,3),(5,'Epsilon',441720.00,1),(6,'Zeta',451288.00,4),(7,'Eta',442624.00,3),(8,'Theta',171858.00,2);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `deptsalarysummary`
--

DROP TABLE IF EXISTS `deptsalarysummary`;
/*!50001 DROP VIEW IF EXISTS `deptsalarysummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `deptsalarysummary` AS SELECT 
 1 AS `dept_id`,
 1 AS `dept_name`,
 1 AS `total_employees`,
 1 AS `total_salary`,
 1 AS `average_salary`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `employeehierarchy`
--

DROP TABLE IF EXISTS `employeehierarchy`;
/*!50001 DROP VIEW IF EXISTS `employeehierarchy`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `employeehierarchy` AS SELECT 
 1 AS `emp_id`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `manager_id`,
 1 AS `manager_first_name`,
 1 AS `manager_last_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `deptsalarysummary`
--

/*!50001 DROP VIEW IF EXISTS `deptsalarysummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY DEFINER */
/*!50001 VIEW `deptsalarysummary` AS select `d`.`dept_id` AS `dept_id`,`d`.`dept_name` AS `dept_name`,count(`e`.`emp_id`) AS `total_employees`,sum(`e`.`salary`) AS `total_salary`,avg(`e`.`salary`) AS `average_salary` from (`department` `d` left join `employee` `e` on((`d`.`dept_id` = `e`.`dept_id`))) group by `d`.`dept_id`,`d`.`dept_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `employeehierarchy`
--

/*!50001 DROP VIEW IF EXISTS `employeehierarchy`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY DEFINER */
/*!50001 VIEW `employeehierarchy` AS select `e1`.`emp_id` AS `emp_id`,`e1`.`first_name` AS `first_name`,`e1`.`last_name` AS `last_name`,`e2`.`emp_id` AS `manager_id`,`e2`.`first_name` AS `manager_first_name`,`e2`.`last_name` AS `manager_last_name` from (`employee` `e1` left join `employee` `e2` on((`e1`.`manager_id` = `e2`.`emp_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping routines for database 'dbms_lab'
--
/*!50003 DROP PROCEDURE IF EXISTS `transfer_employee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `transfer_employee`(IN p_emp_id INT, IN p_new_dept_id INT)
BEGIN
    DECLARE emp_exists INT DEFAULT 0;
    DECLARE dept_exists INT DEFAULT 0;
    DECLARE current_dept INT;
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    SELECT COUNT(*) INTO emp_exists FROM Employee WHERE emp_id = p_emp_id;
    IF emp_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid Employee ID';
    END IF;

    SELECT COUNT(*) INTO dept_exists FROM Department WHERE dept_id = p_new_dept_id;
    IF dept_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid Department ID';
    END IF;

    SELECT dept_id INTO current_dept FROM Employee WHERE emp_id = p_emp_id;
    IF current_dept = p_new_dept_id THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Employee is already in the specified department';
    END IF;

    UPDATE Employee
    SET dept_id = p_new_dept_id
    WHERE emp_id = p_emp_id;

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-09  1:44:24

