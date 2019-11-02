/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.5.24-log : Database - book_manage
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`book_manage` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;

USE `book_manage`;

/*Table structure for table `administrator` */

DROP TABLE IF EXISTS `administrator`;

CREATE TABLE `administrator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `sex` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `administrator` */

insert  into `administrator`(`id`,`username`,`password`,`name`,`sex`,`phone`) values (1,'admin','123456','刘义鹏','男','1274728');

/*Table structure for table `book` */

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
  `book_id` int(11) NOT NULL,
  `book_name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `book_type` int(11) DEFAULT NULL,
  `editor` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `publishing_house` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '出版单位',
  `price` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `book_num` int(11) DEFAULT NULL,
  `shujia_id` int(11) DEFAULT NULL COMMENT '书架编号',
  `ruku_date` date DEFAULT NULL COMMENT '入库日期',
  PRIMARY KEY (`book_id`),
  KEY `book_type` (`book_type`),
  CONSTRAINT `book_ibfk_2` FOREIGN KEY (`book_type`) REFERENCES `booktype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `book` */

insert  into `book`(`book_id`,`book_name`,`book_type`,`editor`,`publishing_house`,`price`,`book_num`,`shujia_id`,`ruku_date`) values (2020,'1111',3,'sad','新华','60',1,3,'2019-06-14'),(65438,'lalal',2,'klsjfk','中华','66',2,2,'2019-06-16');

/*Table structure for table `booktype` */

DROP TABLE IF EXISTS `booktype`;

CREATE TABLE `booktype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `booktype` */

insert  into `booktype`(`id`,`type`) values (1,'自然类'),(2,'教育类'),(3,'科技类'),(4,'农业类');

/*Table structure for table `jieyue` */

DROP TABLE IF EXISTS `jieyue`;

CREATE TABLE `jieyue` (
  `book_id` int(11) NOT NULL,
  `borrow_id` int(11) DEFAULT NULL,
  `reader_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '读者姓名',
  `book_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '操作职工姓名',
  `borrow_date` date DEFAULT NULL COMMENT '借阅日期',
  `yinghuan_date` date DEFAULT NULL COMMENT '应还日期',
  `return_date` date DEFAULT NULL COMMENT '归还日期',
  PRIMARY KEY (`book_id`),
  KEY `borrow_id` (`borrow_id`),
  CONSTRAINT `jieyue_ibfk_1` FOREIGN KEY (`borrow_id`) REFERENCES `reader` (`borrow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `jieyue` */

insert  into `jieyue`(`book_id`,`borrow_id`,`reader_name`,`book_name`,`borrow_date`,`yinghuan_date`,`return_date`) values (65438,101,' lyp','lalal','2019-06-22','2019-07-22','2019-06-22');

/*Table structure for table `reader` */

DROP TABLE IF EXISTS `reader`;

CREATE TABLE `reader` (
  `borrow_id` int(11) NOT NULL,
  `reader_name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `sex` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `college` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '读者类型',
  `certificate_type` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `certificate_id` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `certificate_date` datetime DEFAULT NULL COMMENT '办证日期',
  `borrow_book_num` int(11) DEFAULT NULL COMMENT '借书册数',
  `max_book_num` int(11) DEFAULT NULL COMMENT '最大借书数量',
  `yuqi_state` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '是否有逾期',
  PRIMARY KEY (`borrow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `reader` */

insert  into `reader`(`borrow_id`,`reader_name`,`sex`,`college`,`type`,`certificate_type`,`certificate_id`,`phone`,`certificate_date`,`borrow_book_num`,`max_book_num`,`yuqi_state`) values (101,' lyp','男','人文院','学生','身份证','4566313','878112','2019-06-09 00:00:00',2,100,'未逾期'),(1001,'hangjia','男','yishu','学生','身份证','1781983','17777','2019-06-16 00:00:00',0,100,'未逾期'),(1002,'刘义鹏','男','人文院','学生','身份证','1232321323213','122131','2019-06-22 00:00:00',0,100,'未逾期'),(2467,'凯文','女','河北农业大学','老师','身份证','13752519970016','1512273033','2019-06-22 11:05:21',0,NULL,NULL),(3810,'刘毅鹏','男','河北农业大学','学生','身份证','212','49129482','2019-06-29 22:02:16',0,100,'未逾期');

/*Table structure for table `worker` */

DROP TABLE IF EXISTS `worker`;

CREATE TABLE `worker` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `sex` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `worker` */

insert  into `worker`(`id`,`name`,`sex`,`phone`,`password`) values (333,'zz','1','1222','fw3336666'),(804,'aalliu','1','2324146','fetlghfy6'),(1852,'smallsea','1','1571319','123456'),(71827,'dd','0','3435232','1233532552'),(102005,'李轩','1','15713195603','1666'),(2342871,'zs','0','35456323','gdg4443');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
