/*
SQLyog Ultimate v11.26 (32 bit)
MySQL - 5.5.50 : Database - jdbc
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`jdbc` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `jdbc`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `password` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `phone` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `roleid` varchar(20) DEFAULT NULL,
  `createtime` varchar(30) DEFAULT NULL,
  `status` varchar(2) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

/*Data for the table `admin` */

insert  into `admin`(`id`,`username`,`password`,`phone`,`email`,`roleid`,`createtime`,`status`) values (1,'liuyarao','liu134392','15227751927','1343926437@qq.com','1','2019-07-27 15:40:59','1'),(2,'qwe123456','qwe123456','15630668986','1343926437@qq.com','1','2019-07-27 15:40:59','0'),(3,'1234567','12345678932','12345678932','12345678932@qq.com','2','2019-07-27 15:40:59','0'),(4,'122123','12345678965','12345678965','1313153@qq.com','1','2019-07-27 15:40:59','0'),(5,'133834384','12345678965','12345678932','123@qq.com','2','2019-07-25 20:27:35','0'),(6,'1343926437','liu134392','15227751927','1343926437@qq.com','1','2019-07-25 20:30:39','0'),(7,'shixiaoguo','1234567932','12345678932','1234567932@qq.com','2','2019-07-26 14:28:01','0'),(8,'liuchaoya','15131948372','15131948372','liuchaoya@qq.con','2','2019-07-27 10:34:07','0'),(9,'zhaofengcai','15131948372','15131948372','zhaofengcai@qq.com','1','2019-07-27 10:34:38','0'),(10,'liuaiguo','18703294565','18703294565','liuaiguo@qq.com','1','2019-07-27 10:35:07','0'),(11,'liuhaoran','12345678932','12345678932','liuhaoran@1qq.com','2','2019-07-27 15:39:11','0'),(12,'wangsahnqiu','12345678965','12345678965','wangsahnqiu@qq.com','2','2019-07-27 15:40:59','1'),(26,'jiayin','12345678964','12345678964','jiayin@qq.com','1','2019-07-27 16:14:20','1'),(28,'qwertyu','13439264379','13439264379','qwerty@qq.com','2','2019-07-27 16:16:41','1'),(30,'zxcvbnm','12374859635','12374859635','zxcvbnm@qq.com','3','2019-07-29','0');

/*Table structure for table `article` */

DROP TABLE IF EXISTS `article`;

CREATE TABLE `article` (
  `art_id` int(11) NOT NULL AUTO_INCREMENT,
  `art_name` varchar(20) DEFAULT NULL,
  `cate_id` varchar(20) DEFAULT NULL,
  `author_id` varchar(20) NOT NULL,
  `art_body` varchar(8000) DEFAULT NULL,
  `updatetime` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`art_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `article` */

insert  into `article`(`art_id`,`art_name`,`cate_id`,`author_id`,`art_body`,`updatetime`) values (1,'demo','1','1','xcxcxcxcxcxczxcxzcxzcxzcxzcsdsdsdsdsdsdsdsdsdscscsczcszczc','2019-07-27'),(2,'asd','2','1','asdasdasdasdsafasdasdasdsdadsa','2019-08-07');

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `cateName` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `category` */

insert  into `category`(`id`,`cateName`) values (1,'JAVA'),(2,'Android'),(3,'Linux'),(4,'Python');

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` varchar(20) NOT NULL,
  `roleName` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `role` */

insert  into `role`(`id`,`roleId`,`roleName`) values (4,'1','超级管理员'),(5,'2','编辑人员'),(6,'3','宣传人员');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
