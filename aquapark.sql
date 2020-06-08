/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`aquapark` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `aquapark`;

/*Table structure for table `package` */

DROP TABLE IF EXISTS `package`;

CREATE TABLE `package` (
  `pkg_id` int(11) NOT NULL AUTO_INCREMENT,
  `pkg_name` varchar(255) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `price` decimal(16,4) DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_date` date DEFAULT NULL,
  PRIMARY KEY (`pkg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `package` */

insert  into `package`(`pkg_id`,`pkg_name`,`count`,`price`,`active`,`created_by`,`created_date`,`modified_by`,`modified_date`) values (1,'Adult',1,'6.0000',1,3,'2019-09-03',3,'2020-06-06'),(2,'Children',1,'3.0000',1,3,'2019-09-03',3,'2020-06-06'),(3,'Pkg of 6',6,'3000.0000',0,3,'2019-09-03',3,'2019-09-03'),(4,'Female',1,'5.0000',1,3,'2019-09-03',3,'2020-06-06'),(5,'Females',1,'500.0000',0,3,'2019-09-03',NULL,NULL),(6,'Pkg of 10',10,'8.0000',1,1,'2019-09-05',3,'2020-06-06'),(7,'pkg of 4',4,'2000.0000',0,3,'2019-09-08',3,'2019-09-08'),(8,'Pkg of 20',20,'15.0000',1,3,'2019-09-09',3,'2020-06-06'),(9,'Pkg of 3',3,'1500.0000',0,3,'2019-10-25',NULL,NULL);

/*Table structure for table `ticket` */

DROP TABLE IF EXISTS `ticket`;

CREATE TABLE `ticket` (
  `ticket_id` int(11) NOT NULL AUTO_INCREMENT,
  `barcode` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `total` decimal(16,2) DEFAULT NULL,
  `paid` decimal(16,2) DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_date` date DEFAULT NULL,
  PRIMARY KEY (`ticket_id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=latin1;

/*Data for the table `ticket` */

insert  into `ticket`(`ticket_id`,`barcode`,`contact`,`date`,`total`,`paid`,`active`,`created_by`,`created_date`,`modified_by`,`modified_date`) values (31,'VZE-299','','2019-09-04','2100.00','2000.00',1,3,'2019-09-04',NULL,NULL),(32,'LUN-650','03313297233','2019-09-04','23900.00','25000.00',1,3,'2019-09-04',NULL,NULL),(40,'GSB-804','0331','2019-09-05','2100.00','2500.00',1,3,'2019-09-05',NULL,NULL),(41,'ACT-677','03313297233','2019-09-06','1600.00','3000.00',1,3,'2019-09-06',NULL,NULL),(44,'ZMP-430','','2019-09-08','1600.00','0.00',1,3,'2019-09-08',NULL,NULL),(45,'KQL-995','03313297233','2019-09-08','7800.00','7000.00',1,3,'2019-09-08',NULL,NULL),(47,'RAU-904','','2019-09-08','600.00','0.00',1,3,'2019-09-08',NULL,NULL),(49,'JEA-257','0331','2019-09-08','600.00','0.00',1,3,'2019-09-08',NULL,NULL),(51,'UBI-886','','2019-09-09','1200.00','1500.00',1,3,'2019-09-09',NULL,NULL),(52,'XNV-764','','2019-09-09','2400.00','0.00',1,3,'2019-09-09',NULL,NULL),(53,'PRB-428','03313297233','2019-09-09','10000.00','10000.00',1,3,'2019-09-09',NULL,NULL),(55,'NNL-893','','2019-10-25','6000.00','7000.00',1,3,'2019-10-25',NULL,NULL),(56,'SFL-400','','2019-10-26','8000.00','10000.00',1,3,'2019-10-26',NULL,NULL),(57,'LMC-533','03061107918','2019-10-26','1800.00','2000.00',1,3,'2019-10-26',NULL,NULL),(58,'LSY-961','03061107918','2019-10-26','1900.00','0.00',1,3,'2019-10-26',NULL,NULL),(59,'CPA-902','','2019-12-23','9900.00','1000.00',1,22,'2019-12-23',NULL,NULL),(60,'OYU-704','','2020-06-06','2400.00','5000.00',1,3,'2020-06-06',NULL,NULL),(61,'ZDS-228','','2020-06-06','1200.00','0.00',1,3,'2020-06-06',NULL,NULL);

/*Table structure for table `ticketdetails` */

DROP TABLE IF EXISTS `ticketdetails`;

CREATE TABLE `ticketdetails` (
  `ticketdetails_id` int(11) NOT NULL AUTO_INCREMENT,
  `pkg_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `ticket_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ticketdetails_id`),
  KEY `FK_ticketdetails` (`pkg_id`),
  KEY `FK_ticketdetails1` (`ticket_id`),
  CONSTRAINT `FK_ticketdetails` FOREIGN KEY (`pkg_id`) REFERENCES `package` (`pkg_id`),
  CONSTRAINT `FK_ticketdetails1` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`ticket_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=latin1;

/*Data for the table `ticketdetails` */

insert  into `ticketdetails`(`ticketdetails_id`,`pkg_id`,`quantity`,`ticket_id`) values (47,1,19,31),(48,2,23,31),(49,4,13,32),(52,1,16,32),(66,2,16,32),(73,2,14,40),(74,2,9,41),(76,4,2,41),(80,7,4,44),(81,1,5,45),(82,2,10,45),(83,4,6,45),(86,1,3,47),(89,1,3,49),(91,1,4,51),(92,1,4,52),(93,8,1,53),(95,9,4,55),(96,3,1,32),(97,6,1,56),(98,9,1,56),(99,4,5,56),(100,1,3,57),(101,4,2,58),(102,2,1,58),(103,1,1,58),(104,1,5,59),(105,2,8,59),(106,4,9,59),(107,1,4,60),(108,1,2,61);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `user_type` enum('Customer','Employee','Admin') DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_date` date DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`user_id`,`full_name`,`user_name`,`password`,`dob`,`contact`,`user_type`,`active`,`created_by`,`created_date`,`modified_by`,`modified_date`) values (1,'Ivancho Ivanchev','ivan','3737','1997-12-12','03313297233','Admin',1,1,'2019-07-19',5,'2019-07-20'),(2,'aad','aad','123','1999-05-06','03061107918','Employee',1,1,'2019-07-19',3,'2019-07-20'),(3,'Alina','alina12','12','2007-09-12','03332972663','Employee',1,2,'2019-07-19',6,'2019-07-20'),(5,'Don Kihot','donkeyhot','sancheto','2013-09-08','03313297233','Employee',1,1,'2019-07-20',3,'2019-07-22'),(6,'Mihail Mishev','misheto','123','2008-05-20','03388263946','Admin',1,5,'2019-07-20',1,'2019-07-20'),(7,'Usam','usam','2011','1987-01-01','03334858685','Employee',1,6,'2019-07-20',3,'2019-09-09'),(9,'Neshto Si','aii','ai','1987-01-02','03337586021','Customer',0,3,'2019-07-21',1,'2019-09-09'),(10,'Safi','safi','sa1','1996-12-07','0331283848','Customer',0,3,'2019-07-21',NULL,NULL),(18,'Petur Nenkov','face12','1234','2008-12-09','03317696826','Customer',1,3,'2019-07-19',3,'2019-07-21'),(19,'naich','Naich','naich','1987-01-01','03313297233','Admin',1,3,'2019-09-09',NULL,NULL),(20,'Vasilka','vaseto','obichamzahar','2019-09-09','03333498123','Employee',1,3,'2019-09-09',NULL,NULL),(21,'Balaban Barabanov','waqar','waqar','2003-06-13','03321766363','Admin',1,3,'2019-09-09',NULL,NULL),(22,'Stoyo Stoychev','az','123','2019-12-23','0222','Admin',0,3,'2019-12-23',NULL,NULL),(23,'Aquapark','aqua','park','2020-06-06','0223421120','Customer',1,3,'2020-06-06',3,'2020-06-06'),(24,'qwer','poi','poi','1987-01-01','0232423423','Customer',1,3,'2020-06-06',NULL,NULL);

/*Table structure for table `user1` */

DROP TABLE IF EXISTS `user1`;

/*!50001 DROP VIEW IF EXISTS `user1` */;
/*!50001 DROP TABLE IF EXISTS `user1` */;

/*!50001 CREATE TABLE  `user1`(
 `id` int(11) ,
 `full_name` varchar(255) ,
 `user_name` varchar(255) ,
 `dob` varchar(10) ,
 `contact` varchar(255) ,
 `user_type` enum('Customer','Employee','Admin') ,
 `create_by` varchar(255) ,
 `created_on` varchar(10) ,
 `modified_by` int(11) ,
 `modified_on` varchar(10) 
)*/;

/*View structure for view user1 */

/*!50001 DROP TABLE IF EXISTS `user1` */;
/*!50001 DROP VIEW IF EXISTS `user1` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `user1` AS (select `f`.`user_id` AS `id`,`f`.`full_name` AS `full_name`,`f`.`user_name` AS `user_name`,date_format(`f`.`dob`,'%d-%m-%Y') AS `dob`,`f`.`contact` AS `contact`,`f`.`user_type` AS `user_type`,`g`.`full_name` AS `create_by`,date_format(`f`.`created_date`,'%d-%m-%Y') AS `created_on`,`f`.`modified_by` AS `modified_by`,date_format(`f`.`modified_date`,'%d-%m-%Y') AS `modified_on` from (`user` `f` join `user` `g`) where ((`f`.`created_by` = `g`.`user_id`) and (`f`.`active` = 1))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
