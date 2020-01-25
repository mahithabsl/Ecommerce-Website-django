/*
SQLyog Professional v12.4.3 (64 bit)
MySQL - 5.6.39-log : Database - eweb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`eweb` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `eweb`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can add permission',2,'add_permission'),
(5,'Can change permission',2,'change_permission'),
(6,'Can delete permission',2,'delete_permission'),
(7,'Can add group',3,'add_group'),
(8,'Can change group',3,'change_group'),
(9,'Can delete group',3,'delete_group'),
(10,'Can add user',4,'add_user'),
(11,'Can change user',4,'change_user'),
(12,'Can delete user',4,'delete_user'),
(13,'Can add content type',5,'add_contenttype'),
(14,'Can change content type',5,'change_contenttype'),
(15,'Can delete content type',5,'delete_contenttype'),
(16,'Can add session',6,'add_session'),
(17,'Can change session',6,'change_session'),
(18,'Can delete session',6,'delete_session'),
(19,'Can add ref_ invoice_ status_ codes',7,'add_ref_invoice_status_codes'),
(20,'Can change ref_ invoice_ status_ codes',7,'change_ref_invoice_status_codes'),
(21,'Can delete ref_ invoice_ status_ codes',7,'delete_ref_invoice_status_codes'),
(22,'Can add ref_ order_ status_ codes',8,'add_ref_order_status_codes'),
(23,'Can change ref_ order_ status_ codes',8,'change_ref_order_status_codes'),
(24,'Can delete ref_ order_ status_ codes',8,'delete_ref_order_status_codes'),
(25,'Can add ref_ product_ types',9,'add_ref_product_types'),
(26,'Can change ref_ product_ types',9,'change_ref_product_types'),
(27,'Can delete ref_ product_ types',9,'delete_ref_product_types'),
(28,'Can add ref_ payment_ method',10,'add_ref_payment_method'),
(29,'Can change ref_ payment_ method',10,'change_ref_payment_method'),
(30,'Can delete ref_ payment_ method',10,'delete_ref_payment_method'),
(31,'Can add customer_ payment_method',11,'add_customer_payment_method'),
(32,'Can change customer_ payment_method',11,'change_customer_payment_method'),
(33,'Can delete customer_ payment_method',11,'delete_customer_payment_method'),
(34,'Can add customers',12,'add_customers'),
(35,'Can change customers',12,'change_customers'),
(36,'Can delete customers',12,'delete_customers'),
(37,'Can add orders',13,'add_orders'),
(38,'Can change orders',13,'change_orders'),
(39,'Can delete orders',13,'delete_orders'),
(40,'Can add invoices',14,'add_invoices'),
(41,'Can change invoices',14,'change_invoices'),
(42,'Can delete invoices',14,'delete_invoices'),
(43,'Can add payments',15,'add_payments'),
(44,'Can change payments',15,'change_payments'),
(45,'Can delete payments',15,'delete_payments'),
(46,'Can add shipments',16,'add_shipments'),
(47,'Can change shipments',16,'change_shipments'),
(48,'Can delete shipments',16,'delete_shipments'),
(49,'Can add products',17,'add_products'),
(50,'Can change products',17,'change_products'),
(51,'Can delete products',17,'delete_products'),
(52,'Can add ref_ order_ item_ status_ codes',18,'add_ref_order_item_status_codes'),
(53,'Can change ref_ order_ item_ status_ codes',18,'change_ref_order_item_status_codes'),
(54,'Can delete ref_ order_ item_ status_ codes',18,'delete_ref_order_item_status_codes'),
(55,'Can add order_ items',19,'add_order_items'),
(56,'Can change order_ items',19,'change_order_items'),
(57,'Can delete order_ items',19,'delete_order_items'),
(58,'Can add shipment_ items',20,'add_shipment_items'),
(59,'Can change shipment_ items',20,'change_shipment_items'),
(60,'Can delete shipment_ items',20,'delete_shipment_items');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `auth_user` */

insert  into `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) values 
(1,'pbkdf2_sha256$100000$oNbmzNmSyUzu$xXaynYKRO5cHG8ieikEmk2g4hjNHQ5Y1hGUnvLuhXcM=','2018-04-19 18:57:52.550861',1,'dell','','','',1,1,'2018-04-09 13:24:37.371956');

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

/*Data for the table `django_admin_log` */

insert  into `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) values 
(1,'2018-04-09 14:28:44.465843','1','Ref_Product_Types object (1)',1,'[{\"added\": {}}]',9,1),
(2,'2018-04-09 14:29:29.067203','2','Ref_Product_Types object (2)',1,'[{\"added\": {}}]',9,1),
(3,'2018-04-09 14:30:02.943181','3','Ref_Product_Types object (3)',1,'[{\"added\": {}}]',9,1),
(4,'2018-04-09 14:30:24.650508','4','Ref_Product_Types object (4)',1,'[{\"added\": {}}]',9,1),
(5,'2018-04-09 14:30:33.448568','5','Ref_Product_Types object (5)',1,'[{\"added\": {}}]',9,1),
(6,'2018-04-09 14:30:52.032101','6','Ref_Product_Types object (6)',1,'[{\"added\": {}}]',9,1),
(7,'2018-04-09 14:31:11.013386','7','Ref_Product_Types object (7)',1,'[{\"added\": {}}]',9,1),
(8,'2018-04-09 14:31:27.920938','8','Ref_Product_Types object (8)',1,'[{\"added\": {}}]',9,1),
(9,'2018-04-09 14:32:19.808744','9','Ref_Product_Types object (9)',1,'[{\"added\": {}}]',9,1),
(10,'2018-04-09 14:32:44.271002','10','Ref_Product_Types object (10)',1,'[{\"added\": {}}]',9,1),
(11,'2018-04-09 14:33:03.091535','11','Ref_Product_Types object (11)',1,'[{\"added\": {}}]',9,1),
(12,'2018-04-09 14:33:39.695601','12','Ref_Product_Types object (12)',1,'[{\"added\": {}}]',9,1),
(13,'2018-04-09 14:34:08.651443','13','Ref_Product_Types object (13)',1,'[{\"added\": {}}]',9,1),
(14,'2018-04-09 14:35:26.373464','12','Ref_Product_Types object (12)',2,'[{\"changed\": {\"fields\": [\"product_type_description\"]}}]',9,1),
(15,'2018-04-09 15:31:41.270036','1','Products object (1)',1,'[{\"added\": {}}]',17,1),
(16,'2018-04-09 19:21:07.715353','2','Redmi 5',1,'[{\"added\": {}}]',17,1),
(17,'2018-04-09 19:26:58.467498','3','OnePlus 5T',1,'[{\"added\": {}}]',17,1),
(18,'2018-04-09 19:30:39.891134','4','Moto G5S Plus',1,'[{\"added\": {}}]',17,1),
(19,'2018-04-09 19:34:29.716209','5','Honor 7X',1,'[{\"added\": {}}]',17,1),
(20,'2018-04-09 19:41:15.078725','6','FAUSTO Men\'s Leather',1,'[{\"added\": {}}]',17,1),
(21,'2018-04-09 19:45:57.449007','7','Escaro Men\'s Formal',1,'[{\"added\": {}}]',17,1),
(22,'2018-04-10 07:32:52.083659','8','Asian shoes Wonder',1,'[{\"added\": {}}]',17,1),
(23,'2018-04-10 07:45:11.492453','9','Sparx Men\'s Mesh',1,'[{\"added\": {}}]',17,1),
(24,'2018-04-10 07:56:31.050830','10','Titan Analog Black',1,'[{\"added\": {}}]',17,1),
(25,'2018-04-10 07:57:46.443342','10','Titan Analog Black',2,'[]',17,1),
(26,'2018-04-10 08:10:32.566517','11','Citizen Sport Eco',1,'[{\"added\": {}}]',17,1),
(27,'2018-04-10 08:14:47.967334','12','titan karishma',1,'[{\"added\": {}}]',17,1),
(28,'2018-04-10 08:18:44.833353','13','formal full sleeves',1,'[{\"added\": {}}]',17,1),
(29,'2018-04-10 08:21:53.741263','14','premium  cotton',1,'[{\"added\": {}}]',17,1),
(30,'2018-04-10 08:25:01.474048','15','womens kurti',1,'[{\"added\": {}}]',17,1),
(31,'2018-04-10 08:28:26.312868','16','lehenga',1,'[{\"added\": {}}]',17,1),
(32,'2018-04-10 08:32:54.099158','17','paty wear',1,'[{\"added\": {}}]',17,1),
(33,'2018-04-10 08:35:33.146405','18','kurta',1,'[{\"added\": {}}]',17,1);

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(6,'sessions','session'),
(12,'webapp','customers'),
(11,'webapp','customer_payment_method'),
(14,'webapp','invoices'),
(13,'webapp','orders'),
(19,'webapp','order_items'),
(15,'webapp','payments'),
(17,'webapp','products'),
(7,'webapp','ref_invoice_status_codes'),
(18,'webapp','ref_order_item_status_codes'),
(8,'webapp','ref_order_status_codes'),
(10,'webapp','ref_payment_method'),
(9,'webapp','ref_product_types'),
(16,'webapp','shipments'),
(20,'webapp','shipment_items');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'contenttypes','0001_initial','2018-04-07 08:03:38.581182'),
(2,'auth','0001_initial','2018-04-07 08:03:39.023295'),
(3,'admin','0001_initial','2018-04-07 08:03:39.135746'),
(4,'admin','0002_logentry_remove_auto_add','2018-04-07 08:03:39.159464'),
(5,'contenttypes','0002_remove_content_type_name','2018-04-07 08:03:39.243218'),
(6,'auth','0002_alter_permission_name_max_length','2018-04-07 08:03:39.258343'),
(7,'auth','0003_alter_user_email_max_length','2018-04-07 08:03:39.284219'),
(8,'auth','0004_alter_user_username_opts','2018-04-07 08:03:39.303135'),
(9,'auth','0005_alter_user_last_login_null','2018-04-07 08:03:39.348665'),
(10,'auth','0006_require_contenttypes_0002','2018-04-07 08:03:39.353539'),
(11,'auth','0007_alter_validators_add_error_messages','2018-04-07 08:03:39.374407'),
(12,'auth','0008_alter_user_username_max_length','2018-04-07 08:03:39.456890'),
(13,'auth','0009_alter_user_last_name_max_length','2018-04-07 08:03:39.486431'),
(14,'sessions','0001_initial','2018-04-07 08:03:39.525918'),
(15,'webapp','0001_initial','2018-04-07 08:04:03.926556'),
(16,'webapp','0002_orders','2018-04-07 08:05:35.255483'),
(17,'webapp','0003_invoices','2018-04-07 08:06:10.246619'),
(18,'webapp','0004_payments','2018-04-07 08:06:36.492381'),
(19,'webapp','0005_shipments','2018-04-07 08:07:02.565788'),
(20,'webapp','0006_products','2018-04-07 08:07:31.407772'),
(21,'webapp','0007_ref_order_item_status_codes','2018-04-07 08:08:02.620957'),
(22,'webapp','0008_order_items','2018-04-07 08:08:25.324082'),
(23,'webapp','0009_shipment_items','2018-04-07 08:08:50.834740'),
(24,'webapp','0010_auto_20180408_0952','2018-04-08 09:52:21.976258'),
(25,'webapp','0011_auto_20180409_1529','2018-04-09 15:29:08.937905');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values 
('009t3omftx0t04ijupx7y5ouqy37kfmv','ZDYxNzBhNDdiZTg1YTUxNzg0MDJmMTA1ZGVhZmJjMTExOWEzYzJiYzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhOGVjMmI1MmM3NjUyMjg0YWY2ZmM2NDAwNzU4ZDRiOTMxMDVhYTQxIn0=','2018-05-03 18:57:52.562889'),
('emhdise1ws9tuf4h4abgpbl6av2paxmo','MGIxZDM3OGZkZTE4MGUxNjlhZWRlZTZlNmI5YTBmNTMwNjcxMDlmMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImE4ZWMyYjUyYzc2NTIyODRhZjZmYzY0MDA3NThkNGI5MzEwNWFhNDEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-04-24 10:58:11.793659'),
('gnaw0kzvs5hthc7kdwsm698xxhbwccm7','YWQ5OTZjYmJiODE2MGUwMzljNjRjNjRiMjZmNDk4ZTRlNTczZDlhYzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiYThlYzJiNTJjNzY1MjI4NGFmNmZjNjQwMDc1OGQ0YjkzMTA1YWE0MSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2018-04-23 19:18:12.379119'),
('p0vi2ihd1u08v8g1j026wdd98lqqu351','ZmIwYmVjNDQ0NGRmNTcyN2QwNjQ2YTJlYjc4M2Y1MmI5MTJlYzgyYTp7Il9hdXRoX3VzZXJfaGFzaCI6ImE4ZWMyYjUyYzc2NTIyODRhZjZmYzY0MDA3NThkNGI5MzEwNWFhNDEiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2018-04-23 13:25:12.423077');

/*Table structure for table `webapp_customer_payment_method` */

DROP TABLE IF EXISTS `webapp_customer_payment_method`;

CREATE TABLE `webapp_customer_payment_method` (
  `customer_payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `credit_card_number` varchar(16) NOT NULL,
  `payment_method_details` varchar(30) NOT NULL,
  `customer_id_id` int(11) NOT NULL,
  `payment_method_code_id` int(11) NOT NULL,
  PRIMARY KEY (`customer_payment_id`),
  KEY `webapp_customer_paym_customer_id_id_1ee9c4ca_fk_webapp_cu` (`customer_id_id`),
  KEY `webapp_customer_paym_payment_method_code__a96dd938_fk_webapp_re` (`payment_method_code_id`),
  CONSTRAINT `webapp_customer_paym_customer_id_id_1ee9c4ca_fk_webapp_cu` FOREIGN KEY (`customer_id_id`) REFERENCES `webapp_customers` (`customer_id`),
  CONSTRAINT `webapp_customer_paym_payment_method_code__a96dd938_fk_webapp_re` FOREIGN KEY (`payment_method_code_id`) REFERENCES `webapp_ref_payment_method` (`payment_method_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `webapp_customer_payment_method` */

/*Table structure for table `webapp_customers` */

DROP TABLE IF EXISTS `webapp_customers`;

CREATE TABLE `webapp_customers` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(15) NOT NULL,
  `middle_name` varchar(15) NOT NULL,
  `last_name` varchar(15) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `email_address` varchar(20) NOT NULL,
  `login_name` varchar(50) NOT NULL,
  `login_password` varchar(1000) NOT NULL,
  `phone_number` varchar(12) NOT NULL,
  `add_line1` varchar(100) NOT NULL,
  `add_line2` varchar(100) DEFAULT NULL,
  `add_line3` varchar(100) DEFAULT NULL,
  `pin_code` varchar(6) NOT NULL,
  `city` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL,
  `country` varchar(20) NOT NULL,
  PRIMARY KEY (`customer_id`,`login_name`),
  UNIQUE KEY `webapp_customers_login_name_c41045a4_uniq` (`login_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `webapp_customers` */

insert  into `webapp_customers`(`customer_id`,`first_name`,`middle_name`,`last_name`,`gender`,`email_address`,`login_name`,`login_password`,`phone_number`,`add_line1`,`add_line2`,`add_line3`,`pin_code`,`city`,`state`,`country`) values 
(1,'Mahi','sai',' lakshmi','female','mahi@gmail.com','mahi','bWFoaUAxMjM=','7618030342','falt no 605 shree niketan secter 21 plot no 05 kharghar','Khargher','Navi Mumbai','400709','NAVI MUMBAI','Maharastra','India'),
(3,'Tejaswi','sampat','Kharade','female','teju123@gmail.com','teju','tejaswi','7874878343','flat  667','nerul','navi mumbai','345232','Nerul','Maharastra','India'),
(5,'sai ','lakshmi','Mahitha','female','bslmahitha@gmail.com','mahitha','aG9uZXk5OTk=','9496724828','flat A301,Galaxy Orion apartments,Sector 35D','Kharghar','','410210','kharghar','Maharashtra','India');

/*Table structure for table `webapp_invoices` */

DROP TABLE IF EXISTS `webapp_invoices`;

CREATE TABLE `webapp_invoices` (
  `invoice_number` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_date` date NOT NULL,
  `invoice_details` varchar(20) NOT NULL,
  `invoice_status_code_id` int(11) NOT NULL,
  `order_id_id` int(11) NOT NULL,
  PRIMARY KEY (`invoice_number`),
  KEY `webapp_invoices_invoice_status_code__e45f50e5_fk_webapp_re` (`invoice_status_code_id`),
  KEY `webapp_invoices_order_id_id_d7278424_fk_webapp_orders_order_id` (`order_id_id`),
  CONSTRAINT `webapp_invoices_invoice_status_code__e45f50e5_fk_webapp_re` FOREIGN KEY (`invoice_status_code_id`) REFERENCES `webapp_ref_invoice_status_codes` (`invoice_status_code`),
  CONSTRAINT `webapp_invoices_order_id_id_d7278424_fk_webapp_orders_order_id` FOREIGN KEY (`order_id_id`) REFERENCES `webapp_orders` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `webapp_invoices` */

/*Table structure for table `webapp_order_items` */

DROP TABLE IF EXISTS `webapp_order_items`;

CREATE TABLE `webapp_order_items` (
  `order_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_item_quantity` int(11) NOT NULL,
  `order_item_price` double NOT NULL,
  `RMA_number` varchar(15) NOT NULL,
  `RMA_issued_by` varchar(20) NOT NULL,
  `RMA_issued_date` date NOT NULL,
  `other_order_item_details` varchar(20) NOT NULL,
  `order_id_id` int(11) NOT NULL,
  `order_item_status_code_id` int(11) NOT NULL,
  `product_id_id` int(11) NOT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `webapp_order_items_order_id_id_a6c1d15e_fk_webapp_or` (`order_id_id`),
  KEY `webapp_order_items_order_item_status_co_7bc0f3bd_fk_webapp_re` (`order_item_status_code_id`),
  KEY `webapp_order_items_product_id_id_681c0290_fk_webapp_pr` (`product_id_id`),
  CONSTRAINT `webapp_order_items_order_id_id_a6c1d15e_fk_webapp_or` FOREIGN KEY (`order_id_id`) REFERENCES `webapp_orders` (`order_id`),
  CONSTRAINT `webapp_order_items_order_item_status_co_7bc0f3bd_fk_webapp_re` FOREIGN KEY (`order_item_status_code_id`) REFERENCES `webapp_ref_order_item_status_codes` (`order_item_status_code`),
  CONSTRAINT `webapp_order_items_product_id_id_681c0290_fk_webapp_pr` FOREIGN KEY (`product_id_id`) REFERENCES `webapp_products` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `webapp_order_items` */

/*Table structure for table `webapp_orders` */

DROP TABLE IF EXISTS `webapp_orders`;

CREATE TABLE `webapp_orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `date_order_placed` date NOT NULL,
  `order_details` varchar(20) NOT NULL,
  `customer_id_id` int(11) NOT NULL,
  `order_status_code_id` int(11) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `webapp_orders_customer_id_id_a9224aa3_fk_webapp_cu` (`customer_id_id`),
  KEY `webapp_orders_order_status_code_id_ae25e212_fk_webapp_re` (`order_status_code_id`),
  CONSTRAINT `webapp_orders_customer_id_id_a9224aa3_fk_webapp_cu` FOREIGN KEY (`customer_id_id`) REFERENCES `webapp_customers` (`customer_id`),
  CONSTRAINT `webapp_orders_order_status_code_id_ae25e212_fk_webapp_re` FOREIGN KEY (`order_status_code_id`) REFERENCES `webapp_ref_order_status_codes` (`order_status_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `webapp_orders` */

/*Table structure for table `webapp_payments` */

DROP TABLE IF EXISTS `webapp_payments`;

CREATE TABLE `webapp_payments` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_date` date NOT NULL,
  `payment_amount` double NOT NULL,
  `invoice_number_id` int(11) NOT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `webapp_payments_invoice_number_id_89a1bd3f_fk_webapp_in` (`invoice_number_id`),
  CONSTRAINT `webapp_payments_invoice_number_id_89a1bd3f_fk_webapp_in` FOREIGN KEY (`invoice_number_id`) REFERENCES `webapp_invoices` (`invoice_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `webapp_payments` */

/*Table structure for table `webapp_products` */

DROP TABLE IF EXISTS `webapp_products`;

CREATE TABLE `webapp_products` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `return_merchandise_authorization` varchar(20) NOT NULL,
  `product_name` varchar(20) NOT NULL,
  `product_price` double NOT NULL,
  `product_color` varchar(15) NOT NULL,
  `product_size` varchar(10) NOT NULL,
  `product_description` varchar(50) NOT NULL,
  `other_product_details` varchar(255) NOT NULL,
  `product_type_code_id` int(11) NOT NULL,
  `product_img1` varchar(100) NOT NULL,
  `product_img2` varchar(100) NOT NULL,
  `product_img3` varchar(100) NOT NULL,
  `product_img4` varchar(100) NOT NULL,
  PRIMARY KEY (`product_id`),
  KEY `webapp_products_product_type_code_id_a925e793_fk_webapp_re` (`product_type_code_id`),
  CONSTRAINT `webapp_products_product_type_code_id_a925e793_fk_webapp_re` FOREIGN KEY (`product_type_code_id`) REFERENCES `webapp_ref_product_types` (`product_type_code`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

/*Data for the table `webapp_products` */

insert  into `webapp_products`(`product_id`,`return_merchandise_authorization`,`product_name`,`product_price`,`product_color`,`product_size`,`product_description`,`other_product_details`,`product_type_code_id`,`product_img1`,`product_img2`,`product_img3`,`product_img4`) values 
(1,'Redmi','Redmi 5',7999,'Black','14.4 cm','OS	Android RAM	2 GB Item Weight	159 g','Product Dimensions	15.2 x 0.8 x 7.3 cm Batteries:	1 Lithium ion batteries required. (included) Item model number	Test006 Wireless communication technologies	Bluetooth;WiFi Hotspot Connectivity technologies	Bluetooth v4.2 wireless technology; 802.11',1,'product_img/Redmi_5_black_.jpg','product_img/Redmi_5_black1_.jpg','product_img/Redmi_5_black2_.jpg','product_img/Redmi_5_black3_.jpg'),
(2,'Redmi','Redmi 5',7999,'Gold','14.4 cm','OS	Android RAM	2 GB Item Weight	159 g','Product Dimensions	15.2 x 0.8 x 7.3 cm Batteries:	1 Lithium ion batteries required. (included) Item model number	Test006 Wireless communication technologies	Bluetooth;WiFi Hotspot Connectivity technologies	Bluetooth v4.2 wireless technology; 802.11',1,'product_img/Redmi_5_gold_.jpg','product_img/Redmi_5_gold1_.jpg','product_img/Redmi_5_gold2_.jpg','product_img/Redmi_5_gold3_.jpg'),
(3,'OnePlus','OnePlus 5T',32999,'Black','15.6 cm','OS	Android RAM	6 GB Item Weight	163 g','OS	Android RAM	6 GB Item Weight	163 g Product Dimensions	15.6 x 0.7 x 7.5 cm Batteries:	1 Lithium ion batteries required. (included) Item model number	ONEPLUS A5010 Wireless communication technologies	Bluetooth, WiFi Hotspot Connectivity technologies',1,'product_img/OnePlus_5T_Black_6GB_.jpg','product_img/OnePlus_5T_Black_6GB_1.jpg','product_img/OnePlus_5T_Black_6GB_2.jpg','product_img/OnePlus_5T_Black_6GB_3.jpg'),
(4,'Motorola','Moto G5S Plus',14650,'Black','15.4 cm','OS	AndroidTM 7.1, Nougat RAM 4 GB Item Weight 168','OS	AndroidTM 7.1, Nougat RAM	4 GB Item Weight	168 g Product Dimensions	15.4 x 0.8 x 7.6 cm Batteries:	1 Lithium Polymer batteries required. (included) Item model number	XT 1804 Wireless communication technologies	Bluetooth, WiFi Hotspot Connectivity',1,'product_img/Moto_G5S_PlusBlack.jpg','product_img/Moto_G5S_PlusBlack1.jpg','product_img/Moto_G5S_PlusBlack2.jpg','product_img/Moto_G5S_PlusBlack3.jpg'),
(5,'Honor','Honor 7X',12999,'Blue','15.7 cm','OS	Android RAM	4 GB Item Weight	163 g','OS	Android RAM	4 GB Item Weight	163 g Product Dimensions	15.7 x 0.8 x 7.5 cm Batteries:	1 Lithium Polymer batteries required. (included) Item model number	BND-AL10 Wireless communication technologies	Bluetooth, WiFi Hotspot Connectivity technologies	GSM,',1,'product_img/Honor_7X.jpg','product_img/Honor_7X1.jpg','product_img/Honor_7X2.jpg','product_img/Honor_7X3.jpg'),
(6,'Fusto','FAUSTO Men\'s Leather',2999,'Brown','27 cm','Outer Material : Leather Inner Material : Leather','Outer Material : Leather Inner Material : Leather',2,'product_img/Fausto-tan_mens_boot.jpg','product_img/Fausto-tan_mens_boot1.jpg','product_img/Fausto-tan_mens_boot2.jpg','product_img/Fausto-tan_mens_boot3.jpg'),
(7,'Escaro','Escaro Men\'s Formal',1399,'Black','28 cm','Material:Synthetic, Lifestyle: Formal / Business.','Material:Synthetic, Lifestyle: Formal / Business.,Closure: Lace ,Care Instructions: Allow your pair of shoes to air on a regular basis',2,'product_img/Escaro_Mens_Formal.jpg','product_img/Escaro_Mens_Formal1.jpg','product_img/Escaro_Mens_Formal2.jpg','product_img/Escaro_Mens_Formal3.jpg'),
(8,'Asian shoes Wonder','Asian shoes Wonder',500,'Grey Firozi','27 cm','Material: Mesh Colour: Grey Firozi','Material: Mesh Colour: Grey Firozi LifeStyle: Sports Closer : Lace Up Specially designed for Indian Men\'s feet',2,'product_img/Asian_shoes_Wonder.jpg','product_img/Asian_shoes_Wonder1.jpg','product_img/Asian_shoes_Wonder2.jpg','product_img/Asian_shoes_Wonder3.jpg'),
(9,'Sparx','Sparx Men\'s Mesh',800,'Royal blue','27 cm','Material: Mesh Lifestyle: Casual Closure : Lace up','Care instructions: Allow your pair of shoes to air and de-odorize at regular basis;',2,'product_img/Sparx_Mens_Mesh_Loafer.jpg','product_img/Sparx_Mens_Mesh_Loafer1.jpg','product_img/Sparx_Mens_Mesh_Loafer2.jpg','product_img/Sparx_Mens_Mesh_Loafer3.jpg'),
(10,'Titan Analog Black','Titan Analog Black',2700,'Black','free','Dial Color: Black, Case Shape: Rectangular','Case Material: Brass Water Resistance Depth: 50 meters',4,'product_img/Titan_Analog_Black.jpg','product_img/Titan_Analog_Black1.jpg','product_img/Titan_Analog_Black2.jpg','product_img/Titan_Analog_Black3.jpg'),
(11,'Citizen','Citizen Sport Eco',14000,'Silver','45 mm','Band Colour	Other Band Material	Stainless Steel','Dial Colour	Other Display Type	Other Case Shape	round',4,'product_img/Citizen_Sport_Eco-Drive_Chronograph_.jpg','product_img/Citizen_Sport_Eco-Drive_Chronograph1.jpg','product_img/Citizen_Sport_Eco-Drive_Chronograph2.jpg','product_img/Citizen_Sport_Eco-Drive_Chronograph3.jpg'),
(12,'Titan','titan karishma',2500,'grey','40 mm','Dial Color: Black, Case Shape: Rectangular, Dial','Dial Color: Black, Case Shape: Rectangular, Dial Glass Material: Mineral Band Color: Silver, Band Material: Stainless Steel',4,'product_img/Titan_Karishma.jpg','product_img/Titan_Karishma1.jpg','product_img/Titan_Karishma2.jpg','product_img/Titan_Karishma3.jpg'),
(13,'VERSATYL','formal full sleeves',600,'white','42','Material - 100% Premium Cotton Shirt with subtle','Fit - Slim Fit, Lightweight and comfortable',10,'product_img/shirt.jpg','product_img/shirt1.jpg','product_img/shirt2.jpg','product_img/shirt3.jpg'),
(14,'Shade','premium  cotton',1000,'pink','40','100% Pure cotton, Fitting Type: Slim Fit.','Attractive Look::Smart & Trendy,Long sleeve plain color shirt',10,'product_img/pink.jpg','product_img/pink1.jpg','product_img/pink2.jpg','product_img/pink3.jpg'),
(15,'Dhruvi','womens kurti',800,'Red','36 inches','Fabric: Cotton || Pattern:Multi Designs || Sleeves','Machine Wash, Wash Separately in Cold water, Do not bleach, Dry in Shade, Medium Iron',11,'product_img/w1.jpg','product_img/w2.jpg','product_img/w3.jpg','product_img/w4.jpg'),
(16,'Magneitta','lehenga',2450,'pink','35 inches','Full Size Party Wear Lehenga with Unstiched Blouse','Dupatta 2x1.25 (meters) Choli 48x30 (Inches) (LxW) Fine quality fabrics used in the Lehenga Set',11,'product_img/le.jpg','product_img/le1.jpg','product_img/le2.jpg','product_img/le3.jpg'),
(17,'AJ dezines','paty wear',1400,'Blue','20 inches','Specially handcrafted clothing for the perfect loo','Fabric Details :- Cotton Blend Package Contents-Shirt Pant and Jacket',12,'product_img/ki.jpg','product_img/ki1.jpg','product_img/ki2.jpg','product_img/ki3.jpg'),
(18,'AJ dezines','kurta',1000,'Blue ,gold','20 inches','Fabric Details :- Cotton Blend Package Contents-Sh','Wearability- festive, party, ceremony, special occasion, wedding,',12,'product_img/kid.jpg','product_img/kid1.jpg','product_img/kid2.jpg','product_img/kid3.jpg');

/*Table structure for table `webapp_ref_invoice_status_codes` */

DROP TABLE IF EXISTS `webapp_ref_invoice_status_codes`;

CREATE TABLE `webapp_ref_invoice_status_codes` (
  `invoice_status_code` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_status_description` varchar(10) NOT NULL,
  PRIMARY KEY (`invoice_status_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `webapp_ref_invoice_status_codes` */

/*Table structure for table `webapp_ref_order_item_status_codes` */

DROP TABLE IF EXISTS `webapp_ref_order_item_status_codes`;

CREATE TABLE `webapp_ref_order_item_status_codes` (
  `order_item_status_code` int(11) NOT NULL AUTO_INCREMENT,
  `order_item_status_description` varchar(10) NOT NULL,
  PRIMARY KEY (`order_item_status_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `webapp_ref_order_item_status_codes` */

/*Table structure for table `webapp_ref_order_status_codes` */

DROP TABLE IF EXISTS `webapp_ref_order_status_codes`;

CREATE TABLE `webapp_ref_order_status_codes` (
  `order_status_code` int(11) NOT NULL AUTO_INCREMENT,
  `order_status_description` varchar(15) NOT NULL,
  PRIMARY KEY (`order_status_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `webapp_ref_order_status_codes` */

/*Table structure for table `webapp_ref_payment_method` */

DROP TABLE IF EXISTS `webapp_ref_payment_method`;

CREATE TABLE `webapp_ref_payment_method` (
  `payment_method_code` int(11) NOT NULL AUTO_INCREMENT,
  `payment_method_description` varchar(20) NOT NULL,
  PRIMARY KEY (`payment_method_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `webapp_ref_payment_method` */

/*Table structure for table `webapp_ref_product_types` */

DROP TABLE IF EXISTS `webapp_ref_product_types`;

CREATE TABLE `webapp_ref_product_types` (
  `product_type_code` int(11) NOT NULL AUTO_INCREMENT,
  `product_type_description` varchar(15) NOT NULL,
  PRIMARY KEY (`product_type_code`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Data for the table `webapp_ref_product_types` */

insert  into `webapp_ref_product_types`(`product_type_code`,`product_type_description`) values 
(1,'Mobile'),
(2,'Shoes'),
(3,'Accessories'),
(4,'Watches'),
(5,'Bags'),
(6,'Computers'),
(7,'Tablets'),
(8,'Applications'),
(9,'Games'),
(10,'Men Cloths'),
(11,'Women Clothes'),
(12,'Kid\'s Wear'),
(13,'Home Products');

/*Table structure for table `webapp_shipment_items` */

DROP TABLE IF EXISTS `webapp_shipment_items`;

CREATE TABLE `webapp_shipment_items` (
  `shipment_items_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_item_id_id` int(11) NOT NULL,
  `shipment_id_id` int(11) NOT NULL,
  PRIMARY KEY (`shipment_items_id`),
  KEY `webapp_shipment_item_order_item_id_id_b314299f_fk_webapp_or` (`order_item_id_id`),
  KEY `webapp_shipment_item_shipment_id_id_ebe397ee_fk_webapp_sh` (`shipment_id_id`),
  CONSTRAINT `webapp_shipment_item_order_item_id_id_b314299f_fk_webapp_or` FOREIGN KEY (`order_item_id_id`) REFERENCES `webapp_order_items` (`order_item_id`),
  CONSTRAINT `webapp_shipment_item_shipment_id_id_ebe397ee_fk_webapp_sh` FOREIGN KEY (`shipment_id_id`) REFERENCES `webapp_shipments` (`shipment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `webapp_shipment_items` */

/*Table structure for table `webapp_shipments` */

DROP TABLE IF EXISTS `webapp_shipments`;

CREATE TABLE `webapp_shipments` (
  `shipment_id` int(11) NOT NULL AUTO_INCREMENT,
  `shipment_tracking_number` varchar(15) NOT NULL,
  `shipment_date` date NOT NULL,
  `other_shipment_details` varchar(20) NOT NULL,
  `invoice_number_id` int(11) NOT NULL,
  `order_id_id` int(11) NOT NULL,
  PRIMARY KEY (`shipment_id`),
  KEY `webapp_shipments_invoice_number_id_0fde9110_fk_webapp_in` (`invoice_number_id`),
  KEY `webapp_shipments_order_id_id_03b427bb_fk_webapp_orders_order_id` (`order_id_id`),
  CONSTRAINT `webapp_shipments_invoice_number_id_0fde9110_fk_webapp_in` FOREIGN KEY (`invoice_number_id`) REFERENCES `webapp_invoices` (`invoice_number`),
  CONSTRAINT `webapp_shipments_order_id_id_03b427bb_fk_webapp_orders_order_id` FOREIGN KEY (`order_id_id`) REFERENCES `webapp_orders` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `webapp_shipments` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
