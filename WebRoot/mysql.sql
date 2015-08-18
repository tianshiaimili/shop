-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.40-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--tb_user
-- Create schema db_database24
--

CREATE DATABASE IF NOT EXISTS db_database24;
USE db_database24;

--
-- Definition of table `tb_customer`
--

DROP TABLE IF EXISTS `tb_customer`;
CREATE TABLE `tb_customer` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(50) NOT NULL,
  `password` VARCHAR(50) NOT NULL,
  `realname` VARCHAR(20) DEFAULT NULL,
  `address` VARCHAR(200) DEFAULT NULL,
  `email` VARCHAR(50) DEFAULT NULL,
  `mobile` VARCHAR(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_customer`
--

/*!40000 ALTER TABLE `tb_customer` DISABLE KEYS */;
INSERT INTO `tb_customer` (`id`,`username`,`password`,`realname`,`address`,`email`,`mobile`) VALUES 
 (1,'mrsoft','mrsoft',NULL,'����ʡ�����ж�����xxx��xxxС��xxx��','mrsoft@mrsoft.com','139xxxx8888');
/*!40000 ALTER TABLE `tb_customer` ENABLE KEYS */;


--
-- Definition of table `tb_order`
--

DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order` (
  `orderId` VARCHAR(30) NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `address` VARCHAR(200) NOT NULL,
  `mobile` VARCHAR(11) NOT NULL,
  `totalPrice` FLOAT DEFAULT NULL,
  `createTime` DATETIME DEFAULT NULL,
  `paymentWay` VARCHAR(15) DEFAULT NULL,
  `orderState` VARCHAR(10) DEFAULT NULL,
  `customerId` INT(11) DEFAULT NULL,
  PRIMARY KEY (`orderId`),
  KEY `FKFA98EE3DD0EDC05E` (`customerId`),
  CONSTRAINT `FKFA98EE3DD0EDC05E` FOREIGN KEY (`customerId`) REFERENCES `tb_customer` (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_order`
--

/*!40000 ALTER TABLE `tb_order` DISABLE KEYS */;
INSERT INTO `tb_order` (`orderId`,`name`,`address`,`mobile`,`totalPrice`,`createTime`,`paymentWay`,`orderState`,`customerId`) VALUES 
 ('201004201352400389678','mrsoft','����ʡ�����ж�����xxx��xxxС��xxx��','139xxxx8888',120,'2010-04-20 13:52:40','POSTOFFICE_PAY','DELIVERED',1),
 ('201004220944580771720','mrsoft','����ʡ�����ж�����xxx��xxxС��xxx��','139xxxx8888',120,'2010-04-22 09:44:58','POSTOFFICE_PAY','DELIVERED',1),
 ('201004220957520484473','mrsoft','����ʡ�����ж�����xxx��xxxС��xxx��','139xxxx8888',0,'2010-04-22 09:57:52','POSTOFFICE_PAY','DELIVERED',1);
/*!40000 ALTER TABLE `tb_order` ENABLE KEYS */;


--
-- Definition of table `tb_orderitem`
--

DROP TABLE IF EXISTS `tb_orderitem`;
CREATE TABLE `tb_orderitem` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `productId` INT(11) NOT NULL,
  `productName` VARCHAR(200) NOT NULL,
  `productPrice` FLOAT NOT NULL,
  `amount` INT(11) DEFAULT NULL,
  `orderId` VARCHAR(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKBF076F042FE3E9B` (`orderId`),
  CONSTRAINT `FKBF076F042FE3E9B` FOREIGN KEY (`orderId`) REFERENCES `tb_order` (`orderId`)
) ENGINE=INNODB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_orderitem`
--

/*!40000 ALTER TABLE `tb_orderitem` DISABLE KEYS */;
INSERT INTO `tb_orderitem` (`id`,`productId`,`productName`,`productPrice`,`amount`,`orderId`) VALUES 
 (1,1,'Java ��̴ʵ�',120,1,NULL),
 (2,1,'Java ��̴ʵ�',120,1,NULL);
/*!40000 ALTER TABLE `tb_orderitem` ENABLE KEYS */;


--
-- Definition of table `tb_productcategory`
--

DROP TABLE IF EXISTS `tb_productcategory`;
CREATE TABLE `tb_productcategory` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `level` INT(11) DEFAULT NULL,
  `pid` INT(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKB405573CFB37BC9D` (`pid`),
  CONSTRAINT `FKB405573CFB37BC9D` FOREIGN KEY (`pid`) REFERENCES `tb_productcategory` (`id`)
) ENGINE=INNODB AUTO_INCREMENT=350 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_productcategory`
--

/*!40000 ALTER TABLE `tb_productcategory` DISABLE KEYS */;
INSERT INTO `tb_productcategory` (`id`,`name`,`level`,`pid`) VALUES 
 (1,'��װ',1,NULL),
 (2,'Ʒ����װ',2,1),
 (3,'����',3,2),
 (4,'��Ь',3,2),
 (5,'�п�',3,2),
 (6,'����',3,2),
 (7,'ŮЬ',2,1),
 (8,'����',3,7),
 (9,'�߰�',3,7),
 (10,'��Ь',3,7),
 (11,'��Ь',3,7),
 (12,'����',3,7),
 (13,'����',2,1),
 (14,'˯��',3,13),
 (15,'���ڿ�',3,13),
 (16,'����',3,13),
 (17,'��',3,13),
 (18,'�ڿ�',3,13),
 (19,'�˶���',2,1),
 (20,'�п�',3,19),
 (21,'����',3,19),
 (22,'��',3,19),
 (23,'����',3,19),
 (24,'T��',3,19),
 (25,'ͯװ',2,1),
 (26,'Ь',3,25),
 (27,'��',3,25),
 (28,'��װ',3,25),
 (29,'T��',3,25),
 (30,'�и�װ',3,25),
 (31,'����ȹ',2,1),
 (32,'��',3,31),
 (33,'��ȹ',3,31),
 (34,'ѩ��ȹ',3,31),
 (35,'��˿ȹ',3,31),
 (36,'�˶�Ь',2,1),
 (37,'Nike',3,36),
 (38,'����',3,36),
 (39,'Adidas',3,36),
 (40,'����',3,36),
 (41,'������װ',2,1),
 (42,'ţ��',3,41),
 (43,'T��',3,41),
 (44,'�п�',3,41),
 (45,'����',3,41),
 (46,'Ůװ',2,1),
 (47,'��֯��',3,46),
 (48,'T��',3,46),
 (49,'������',3,46),
 (50,'����',3,46),
 (51,'����',1,NULL),
 (52,'�۾�',2,51),
 (53,'�̾�',3,52),
 (54,'�۾���',3,52),
 (55,'̫����',3,52),
 (56,'Zippo',3,52),
 (57,'�ֱ�',2,51),
 (58,'����',3,57),
 (59,'Casio',3,57),
 (60,'ŷ����',3,57),
 (61,'����',3,57),
 (62,'�������',2,51),
 (63,'Ƥ��',3,62),
 (64,'����',3,62),
 (65,'ñ��',3,62),
 (66,'Χ��',3,62),
 (67,'��Ʒ',2,51),
 (68,'��ָ',3,67),
 (69,'����',3,67),
 (70,'����',3,67),
 (71,'����',3,67),
 (72,'����',3,67),
 (73,'�鱦',2,51),
 (74,'���',3,73),
 (75,'����',3,73),
 (76,'ǧ���',3,73),
 (77,'ʩ����',3,73),
 (78,'��Ů���',2,51),
 (79,'�а�',3,78),
 (80,'���',3,78),
 (81,'����',3,78),
 (82,'Ǯ��',3,78),
 (83,'�Ҿ�',1,NULL),
 (84,'���ó���',2,83),
 (85,'����',3,84),
 (86,'ɡ',3,84),
 (87,'��Ʒ',3,84),
 (88,'�ӱ�',3,84),
 (89,'����',2,83),
 (90,'����',3,89),
 (91,'ʮ����',3,89),
 (92,'��Ƭǽ',3,89),
 (93,'��̺',3,89),
 (94,'�ҷ�',2,83),
 (95,'�ļ���',3,94),
 (96,'����',3,94),
 (97,'����',3,94),
 (98,'��˿��',3,94),
 (99,'�ջ�',2,83),
 (100,'ϴ��',3,99),
 (101,'��޹',3,99),
 (102,'��ԡ',3,99),
 (103,'������',3,99),
 (104,'�Ҿ�',2,83),
 (105,'��',3,104),
 (106,'����',3,104),
 (107,'�輸',3,104),
 (108,'ɳ��',3,104),
 (109,'�˼�',3,104),
 (110,'����',2,83),
 (111,'���',3,110),
 (112,'��������',3,110),
 (113,'�;�',3,110),
 (114,'����',3,110),
 (115,'��',3,110),
 (116,'װ�꽨��',2,83),
 (117,'����',3,116),
 (118,'ԡ��',3,116),
 (119,'��ԡ',3,116),
 (120,'�ذ�',3,116),
 (121,'���',2,83),
 (122,'ɹ��',3,121),
 (123,'�ϰ�',3,121),
 (124,'��ˢ',3,121),
 (125,'������',3,121),
 (126,'ĸӤ',1,NULL),
 (127,'�̷�',2,126),
 (128,'��ʳ',3,127),
 (129,'Ӫ��',3,127),
 (130,'���豣��',3,127),
 (131,'����',2,126),
 (132,'�Ҿ�',3,131),
 (133,'����',3,131),
 (134,'���',3,131),
 (135,'�Ƴ�',3,131),
 (136,'��',3,131),
 (137,'��Ʒ',2,126),
 (138,'ʪ��',3,137),
 (139,'ι��',3,137),
 (140,'ϴ��',3,137),
 (141,'˯��',3,137),
 (142,'��Ƭ',3,137),
 (143,'ʳƷ',1,NULL),
 (144,'����',2,143),
 (145,'����',3,144),
 (146,'������',3,144),
 (147,'����',3,144),
 (148,'����',3,144),
 (149,'��ʳ',2,143),
 (150,'ţ���',3,149),
 (151,'����',3,149),
 (152,'����',3,149),
 (153,'�ɿ���',3,149),
 (154,'����',2,143),
 (155,'ˮ��',3,154),
 (156,'˽����',3,154),
 (157,'��ʳ',3,154),
 (158,'�ɻ�',3,154),
 (159,'����',1,NULL),
 (160,'����',2,159),
 (161,'����',3,160),
 (162,'��Ĥ',3,160),
 (163,'����',3,160),
 (164,'ˬ��ˮ',3,160),
 (165,'��ױ',2,159),
 (166,'�۱�',3,165),
 (167,'����',3,165),
 (168,'�۵�',3,165),
 (169,'��Ӱ',3,165),
 (170,'��ˮ',3,165),
 (171,'����',2,159),
 (172,'���ݼ�',3,171),
 (173,'ţ��',3,171),
 (174,'����',3,171),
 (175,'�۲ݼ�',3,171),
 (176,'����',1,NULL),
 (177,'���',2,176),
 (178,'����ͷ',3,177),
 (179,'3G����',3,177),
 (180,'USB',3,177),
 (181,'����',3,177),
 (182,'��ҵ�',2,176),
 (183,'�յ�',3,182),
 (184,'Һ��',3,182),
 (185,'���̻�',3,182),
 (186,'����',3,182),
 (187,'�칫',2,176),
 (188,'�ǵ�',3,187),
 (189,'ͶӰ',3,187),
 (190,'��ӡ',3,187),
 (191,'ī��',3,187),
 (192,'�ֻ�',2,176),
 (193,'����',3,192),
 (194,'����',3,192),
 (195,'Nokia',3,192),
 (196,'Dopod',3,192),
 (197,'����',2,176),
 (198,'����',3,197),
 (199,'Ӳ��',3,197),
 (200,'�ܱ�',3,197),
 (201,'LCD',3,197),
 (202,'����',3,197),
 (203,'С�ҵ�',2,176),
 (204,'����',3,203),
 (205,'ե֭',3,203),
 (206,'����',3,203),
 (207,'��ʪ',3,203),
 (208,'�ʼǱ�',2,176),
 (209,'ƻ��',3,208),
 (210,'����',3,208),
 (211,'������',3,208),
 (212,'IBM',3,208),
 (213,'���',2,176),
 (214,'��ʿ',3,213),
 (215,'����',3,213),
 (216,'�����',3,213),
 (217,'����',3,213),
 (218,'�����ֻ�',2,176),
 (219,'����',3,218),
 (220,'˫��˫��',3,218),
 (221,'����',3,218),
 (222,'���˻���',2,176),
 (223,'��Ħ',3,222),
 (224,'���뵶',3,222),
 (225,'��ԡ��',3,222),
 (226,'����',2,176),
 (227,'U��',3,226),
 (228,'�ƶ�Ӳ��',3,226),
 (229,'�ڴ濨',3,226),
 (230,'PSP',3,226),
 (231,'MP4',2,176),
 (232,'����',3,231),
 (233,'iPod',3,231),
 (234,'��ŵ',3,231),
 (235,'��ħ',3,231),
 (236,'����',1,NULL),
 (237,'����',2,236),
 (238,'��',3,237),
 (239,'��ʳ',3,237),
 (240,'����',3,237),
 (241,'è��',3,237),
 (242,'����',3,237),
 (243,'����',2,236),
 (244,'̥��',3,243),
 (245,'����',3,243),
 (246,'��Ӱ',3,243),
 (247,'��Ƭ',3,243),
 (248,'����',3,243),
 (249,'�鼮',2,236),
 (250,'����',3,249),
 (251,'����',3,249),
 (252,'С˵',3,249),
 (253,'����',3,249),
 (254,'����',3,249),
 (255,'�ľ�',2,236),
 (256,'���',3,255),
 (257,'�պ�',3,255),
 (258,'����',3,255),
 (259,'̨��',3,255),
 (260,'��',3,255),
 (261,'�ղ�',2,236),
 (262,'��Ʒ',3,261),
 (263,'�����',3,261),
 (264,'������',3,261),
 (265,'Ǯ��',3,261),
 (266,'����',2,236),
 (267,'����',3,266),
 (268,'GPS',3,266),
 (269,'����',3,266),
 (270,'����',3,266),
 (271,'����',3,266),
 (272,'�˶�',2,236),
 (273,'����',3,272),
 (274,'��Ӿ',3,272),
 (275,'�٤',3,272),
 (276,'��',3,272),
 (277,'��е',3,272),
 (278,'���',2,236),
 (279,'������',3,278),
 (280,'ë��',3,278),
 (281,'ģ��',3,278),
 (282,'����',3,278),
 (283,'����',2,236),
 (284,'����',3,283),
 (285,'��ɽЬ',3,283),
 (286,'����',3,283),
 (287,'�����',3,283),
 (288,'����',1,NULL),
 (289,'��Ʊ',2,288),
 (290,'��ɫ��ջ',3,289),
 (291,'�Ƶ�',3,289),
 (292,'����',3,289),
 (293,'��Ʊ',3,289),
 (294,'IP��',2,288),
 (295,'����绰',3,294),
 (296,'skype',3,294),
 (297,'�ֻ�����',3,294),
 (298,'��ֵ��',2,288),
 (299,'����',3,298),
 (300,'��ͨ',3,298),
 (301,'�ƶ�',3,298),
 (302,'����',2,288),
 (303,'����֮��',3,302),
 (304,'�ʵ�',3,302),
 (305,'DNF',3,302),
 (306,'����2',3,302),
 (307,'�㿨',2,288),
 (308,'����',3,307),
 (309,'QQ',3,307),
 (310,'ħ��',3,307),
 (311,'��������',3,307),
 (312,'��Ʊ',2,288),
 (313,'����͸',3,312),
 (314,'����',3,312),
 (315,'���',3,312),
 (316,'˫ɫ��',3,312),
 (317,'����',1,NULL),
 (318,'�Ժ�����',2,317),
 (319,'ͬ�ǻ',3,318),
 (320,'ʡǮ',3,318),
 (321,'����',3,318),
 (322,'��ķ',2,317),
 (323,'���',3,322),
 (324,'װ��',3,322),
 (325,'��ѵ��',3,322),
 (326,'�й�',3,322),
 (327,'�������',2,317),
 (328,'����װ��',3,327),
 (329,'����',3,327),
 (330,'���',3,327),
 (331,'����',2,317),
 (332,'�ⷿ',3,331),
 (333,'����',3,331),
 (334,'����',3,331),
 (335,'���ַ�',3,331),
 (336,'����վ',2,317),
 (337,'����',3,336),
 (338,'����',3,336),
 (339,'Ʒ�����',3,336),
 (340,'�ۿ�ȯ',2,317),
 (341,'���п�',3,340),
 (342,'����ȯ',3,340),
 (343,'��ӰƱ',3,340),
 (344,'����',2,317),
 (345,'��Ӱ',3,344),
 (346,'����',3,344),
 (347,'�ʻ�',3,344),
 (348,'����',3,344),
 (349,'԰��',3,344);
/*!40000 ALTER TABLE `tb_productcategory` ENABLE KEYS */;


--
-- Definition of table `tb_productinfo`
--

DROP TABLE IF EXISTS `tb_productinfo`;
CREATE TABLE `tb_productinfo` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `description` TEXT,
  `createTime` DATETIME DEFAULT NULL,
  `baseprice` FLOAT DEFAULT NULL,
  `marketprice` FLOAT DEFAULT NULL,
  `sellprice` FLOAT DEFAULT NULL,
  `sexrequest` VARCHAR(5) DEFAULT NULL,
  `commend` BIT(1) DEFAULT NULL,
  `clickcount` INT(11) DEFAULT NULL,
  `sellCount` INT(11) DEFAULT NULL,
  `categoryId` INT(11) DEFAULT NULL,
  `uploadFile` INT(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uploadFile` (`uploadFile`),
  KEY `FK28A6CDEC487D8DAB` (`categoryId`),
  KEY `FK28A6CDEC3E1DFEF5` (`uploadFile`),
  CONSTRAINT `FK28A6CDEC3E1DFEF5` FOREIGN KEY (`uploadFile`) REFERENCES `tb_uploadfile` (`id`),
  CONSTRAINT `FK28A6CDEC487D8DAB` FOREIGN KEY (`categoryId`) REFERENCES `tb_productcategory` (`id`)
) ENGINE=INNODB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_productinfo`
--

/*!40000 ALTER TABLE `tb_productinfo` DISABLE KEYS */;
INSERT INTO `tb_productinfo` (`id`,`name`,`description`,`createTime`,`baseprice`,`marketprice`,`sellprice`,`sexrequest`,`commend`,`clickcount`,`sellCount`,`categoryId`,`uploadFile`) VALUES 
 (1,'Java ��̴ʵ�','JAVA��̴ʵ�  ȫ�ܰ� u       ��ѧ�߿������ţ�����ģʽ����\r\n\r\nJava������ż���ѧϰ��ѵ����29�Σ���Ȥѧϰģʽ�����ò�������ȫ�̼���֧�֡�\r\n\r\nu       ��Ƶ���ã���Ƶ���ģ���19Сʱ����ѧϰ¼��18Сʱ��Ŀ����¼��  \r\n\r\nu       ����ʵ����ʵ�����ģ���408������ʵ��\r\n\r\nu       ʵ����Ŀ����Ŀ���ģ���10��ʵ����Ŀ\r\n\r\n','2010-04-20 13:40:25',98,150,120,'BOY',0x01,17369,2,330,1),
 (2,'C# ��̴ʵ�','C#��̴ʵ�  ȫ�ܰ� u       ��ѧ�߿������ţ�\r\n\r\nC#������ż���ѧϰ��ѵ����28�Σ���Ȥѧϰģʽ�����ò�������ȫ�̼���֧�֡�\r\n\r\nu       ��Ƶ���ã���Ƶ���ģ���14Сʱ����ѧϰ¼��16Сʱ��Ŀ����¼��\r\n\r\nu       ����ʵ����ʵ�����ģ���134������ʵ����C#���򿪷������ο�\r\n\r\nu       ʵ����Ŀ����Ŀ���ģ���10����ҵ��Ŀ\r\n\r\n','2010-04-20 13:42:26',98,150,120,'BOY',0x01,12239,0,330,2),
 (3,'.NET��̴ʵ�','ASP.NET��̴ʵ�  ��ҵ�� u       ��ѧ�߿������ţ�\r\n\r\nAsp.net��̼�������ѧϰ��ѵ����20�Σ���Ȥѧϰģʽ�����ò�������ȫ�̼���֧��\r\n\r\nAsp.net��̼�����չѧϰר��ѵ����20�Σ�ʵ��ѧϰģʽ�����ò�������ȫ�̼���֧�֣�������\r\n\r\nAsp.net��̼���ר��ѵ����12�Σ�ר�⿪��ģʽ�����ò�������ȫ�̼���֧�֣�������\r\n\r\nu       ��Ƶ���ã���Ƶ���ģ���73Сʱ¼������ѧϰ������ģ�顢��������Ŀ��\r\n\r\nu       ��������ȫ�⣺Asp.net���ļ����ο���Asp.net���ݿ⿪���ο��������̡��ӻ�������Ŀʵս��\r\n\r\nȫ���ٲ��ֲᡢ�����̱�׼�̳�\r\n\r\nu       ����ʵ��Ӧ�ã����򿪷�������1��+2����������473������ʵ����      ������126������\r\n\r\nu       ϵͳ����������128��ϵͳ��������\r\n\r\nu           ʵ����Ŀ��34����Ŀ��27������ģ��\r\n\r\n','2010-04-20 14:05:07',98,150,120,'BOY',0x01,1247,0,330,3),
 (4,'VB ��̴ʵ�','Visual Basic ��̴ʵ�  ��ҵ�� u       �������ݿ⣺������Ŀ���ṩ�������ݿ�ʵ�ַ�����SQL   Access \r\nu       ��ѧ�߿������ţ�\r\n\r\nVisual Basic��̼�������ѧϰ��ѵ����25�Σ���Ȥѧϰģʽ�����ò�������ȫ�̼���֧��\r\n\r\nVisual Basic��̼�����չѧϰר��ѵ����20�Σ�ʵ��ѧϰģʽ�����ò�������ȫ�̼���֧�֣�������\r\n\r\nVisual Basic��̼���ר��ѵ����12�Σ�ר�⿪��ģʽ�����ò�������ȫ�̼���֧�֣�������\r\n\r\nu        ��Ƶ���ã���Ƶ���ģ���110.5Сʱ¼�񣨴�����ѧϰ������������š�����Ӧ��ʵս������ȫ�̡���Ŀ������������У�\r\n\r\nu        ��������ȫ�⣺Visual Basic���������ο���Visual Basic��俪���ο����ؼ������ο�������������Ųο���������ƽ��ײο������ݿ⿪���ο������ݿ⿪��ʵ���ο���Ӧ�ÿ����ο������򿪷�ʵս�ο������Ŀ����ο���VB2005���Ųο�\r\n\r\nu       ����ʵ��Ӧ�ã�827������ʵ��+104���ؼ�����+1266�����鼼��\r\n\r\nu       ϵͳ����������305��ϵͳ��������\r\n\r\n','2010-04-20 14:02:33',98,150,120,'BOY',0x01,12366,0,330,4),
 (5,'VC++��̴ʵ�','Visual c++��̴ʵ�  ��ҵ�� u       ��ѧ�߿������ţ�\r\n\r\nVisual C++��̼�������ѧϰ��ѵ����24�Σ���Ȥѧϰģʽ�����ò�������ȫ�̼���֧��\r\n\r\nVisual C++��̼�����չѧϰר��ѵ����20�Σ�ʵ��ѧϰģʽ�����ò�������ȫ�̼���֧�֣�������\r\n\r\nVisual C++��̼���ר��ѵ����12�Σ�ר�⿪��ģʽ�����ò�������ȫ�̼���֧�֣�������\r\n\r\nu       �����Ƶ���ã�****Сʱ\r\n\r\nu       ��������ȫ�⣺Visual C++����ٳ�ָ�ϣ�һ����Visual C++���ļ����ο�\r\n\r\nVisual C++����ٳ�ָ�ϣ������� Visual C++���򿪷�����\r\n\r\n','2010-04-20 14:04:41',98,150,120,'BOY',0x01,4563,0,330,5);
/*!40000 ALTER TABLE `tb_productinfo` ENABLE KEYS */;


--
-- Definition of table `tb_uploadfile`
--

DROP TABLE IF EXISTS `tb_uploadfile`;
CREATE TABLE `tb_uploadfile` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `path` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_uploadfile`
--

/*!40000 ALTER TABLE `tb_uploadfile` DISABLE KEYS */;
INSERT INTO `tb_uploadfile` (`id`,`path`) VALUES 
 (1,'201004201340260341.jpg'),
 (2,'201004201342270110.jpg'),
 (3,'201004201359330922.jpg'),
 (4,'201004201400560420.jpg'),
 (5,'201004201401400092.jpg');
/*!40000 ALTER TABLE `tb_uploadfile` ENABLE KEYS */;


--
-- Definition of table `tb_user`
--

DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(50) NOT NULL,
  `password` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_user`
--

/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
INSERT INTO `tb_user` (`id`,`username`,`password`) VALUES 
 (1,'admin','admin');
/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
