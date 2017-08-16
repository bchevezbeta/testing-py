# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.5.56)
# Database: cows
# Generation Time: 2017-08-16 17:31:29 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table auth_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table auth_group_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table auth_permission
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
	(1,'Can add log entry',1,'add_logentry'),
	(2,'Can change log entry',1,'change_logentry'),
	(3,'Can delete log entry',1,'delete_logentry'),
	(4,'Can add group',2,'add_group'),
	(5,'Can change group',2,'change_group'),
	(6,'Can delete group',2,'delete_group'),
	(7,'Can add permission',3,'add_permission'),
	(8,'Can change permission',3,'change_permission'),
	(9,'Can delete permission',3,'delete_permission'),
	(10,'Can add user',4,'add_user'),
	(11,'Can change user',4,'change_user'),
	(12,'Can delete user',4,'delete_user'),
	(13,'Can add content type',5,'add_contenttype'),
	(14,'Can change content type',5,'change_contenttype'),
	(15,'Can delete content type',5,'delete_contenttype'),
	(16,'Can add session',6,'add_session'),
	(17,'Can change session',6,'change_session'),
	(18,'Can delete session',6,'delete_session'),
	(19,'Can add name plate',7,'add_nameplate'),
	(20,'Can change name plate',7,'change_nameplate'),
	(21,'Can delete name plate',7,'delete_nameplate'),
	(22,'Can add car make',8,'add_carmake'),
	(23,'Can change car make',8,'change_carmake'),
	(24,'Can delete car make',8,'delete_carmake'),
	(25,'Can add car model',9,'add_carmodel'),
	(26,'Can change car model',9,'change_carmodel'),
	(27,'Can delete car model',9,'delete_carmodel');

/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table auth_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`)
VALUES
	(1,'pbkdf2_sha256$36000$LLkOPoAoku7D$jmz/Zs17QW7ZDjqR6GSXtZgD9cYByT84zzyJEtx3bWE=','2017-08-15 21:01:01',1,'admin','','','bchevez@hugeinc.com',1,1,'2017-08-07 18:12:00'),
	(2,'pbkdf2_sha256$36000$e5ZR3aM9IUP8$e7oPX3Y/BXBD7kUuJ6LLJZn+0Sd4O7rLKWuDHbrr/xE=','2017-08-09 20:26:23',0,'tbresnen','Tessa','Bresnen','tbresnen@hugeinc.com',1,1,'2017-08-07 18:36:40'),
	(5,'pbkdf2_sha256$36000$lGTtSgJMHAT5$akTlPk9J+2qyz1+4tHXbgIWPLlLW8L3lCWL0WeqerTk=','2017-08-15 20:09:50',0,'bchevez','Bernardo','Chevez','bchevez@hugeinc.com',0,1,'2017-08-15 20:09:14');

/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table auth_user_groups
# ------------------------------------------------------------

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



# Dump of table auth_user_user_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;

INSERT INTO `auth_user_user_permissions` (`id`, `user_id`, `permission_id`)
VALUES
	(66,1,1),
	(67,1,2),
	(68,1,3),
	(69,1,4),
	(70,1,5),
	(71,1,6),
	(72,1,7),
	(73,1,8),
	(74,1,9),
	(75,1,10),
	(76,1,11),
	(77,1,12),
	(78,1,13),
	(79,1,14),
	(80,1,15),
	(81,1,16),
	(82,1,17),
	(83,1,18),
	(84,1,19),
	(85,1,20),
	(86,1,21),
	(87,1,22),
	(88,1,23),
	(89,1,24),
	(90,1,25),
	(91,1,26),
	(92,1,27),
	(4,2,1),
	(5,2,2),
	(6,2,3),
	(7,2,4),
	(8,2,5),
	(9,2,6),
	(25,2,10),
	(16,2,13),
	(17,2,14),
	(18,2,15),
	(19,2,16),
	(20,2,17),
	(21,2,18),
	(22,2,19),
	(23,2,20),
	(24,2,21),
	(46,5,1),
	(47,5,2),
	(48,5,3),
	(49,5,4),
	(50,5,5),
	(51,5,6),
	(52,5,7),
	(53,5,8),
	(54,5,9),
	(55,5,10),
	(56,5,11),
	(57,5,12),
	(58,5,13),
	(59,5,14),
	(60,5,15),
	(61,5,16),
	(62,5,17),
	(63,5,18),
	(64,5,20),
	(65,5,21);

/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cowsform_carmake
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cowsform_carmake`;

CREATE TABLE `cowsform_carmake` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `value` varchar(200) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `carModel_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cowsform_carmake_carModel_id_1f09495b_fk_cowsform_carmodel_id` (`carModel_id`),
  CONSTRAINT `cowsform_carmake_carModel_id_1f09495b_fk_cowsform_carmodel_id` FOREIGN KEY (`carModel_id`) REFERENCES `cowsform_carmodel` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `cowsform_carmake` WRITE;
/*!40000 ALTER TABLE `cowsform_carmake` DISABLE KEYS */;

INSERT INTO `cowsform_carmake` (`id`, `name`, `value`, `active`, `carModel_id`)
VALUES
	(1,'200','200',1,1),
	(2,'300','300',1,1),
	(3,'Town and Country','Town and Country',1,1),
	(4,'Pacifica','Pacifica',1,1),
	(5,'Challenger','Challenger',1,2),
	(6,'Charger','Charger',1,2),
	(7,'Dart','Dart',1,2),
	(8,'Durango','Durango',1,2),
	(9,'Grand Caravan','Grand Caravan',1,2),
	(10,'Journey','Journey',1,2),
	(11,'Cherokee','Cherokee',1,3),
	(12,'Compass','Compass',1,3),
	(13,'Grand Cherokee','Grand Cherokee',1,3),
	(14,'Patriot','Patriot',1,3),
	(15,'Renegade','Renegade',1,3),
	(16,'Wrangler','Wrangler',1,3),
	(17,'Wrangler Unlimited','Wrangler Unlimited',1,3),
	(18,'1500','1500',1,4),
	(19,'2500','2500',1,4),
	(20,'3500','3500',1,4),
	(21,'CV','CV',1,4),
	(22,'4500/5500','4500/5500',1,4),
	(23,'PROMASTER','PROMASTER',1,4),
	(24,'Promaster CITY','Promaster CITY',1,4),
	(25,'500','500',1,5),
	(26,'500e','500e',1,5),
	(27,'500L','500L',1,5),
	(28,'500X','500X',1,5),
	(29,'Spider 124','Spider 124',1,5);

/*!40000 ALTER TABLE `cowsform_carmake` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cowsform_carmodel
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cowsform_carmodel`;

CREATE TABLE `cowsform_carmodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `value` varchar(200) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `cowsform_carmodel` WRITE;
/*!40000 ALTER TABLE `cowsform_carmodel` DISABLE KEYS */;

INSERT INTO `cowsform_carmodel` (`id`, `name`, `value`, `active`)
VALUES
	(1,'CHRYSLER','CHRYSLER',1),
	(2,'DODGE','DODGE',1),
	(3,'JEEP','JEEP',1),
	(4,'RAM','RAM',1),
	(5,'FIAT','FIAT',1);

/*!40000 ALTER TABLE `cowsform_carmodel` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cowsform_nameplate
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cowsform_nameplate`;

CREATE TABLE `cowsform_nameplate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pub_date` datetime NOT NULL,
  `subject_name` varchar(200) NOT NULL,
  `business_center` varchar(4) NOT NULL,
  `states` longtext NOT NULL,
  `zip_codes` longtext NOT NULL,
  `dma` longtext NOT NULL,
  `car_model` varchar(100) NOT NULL,
  `car_make` varchar(100) NOT NULL,
  `car_trim` varchar(200) NOT NULL,
  `car_year` varchar(4) NOT NULL,
  `co_program_id` varchar(200) NOT NULL,
  `co_customer_cash` varchar(200) NOT NULL,
  `co_bc_bonus_cash` varchar(200) NOT NULL,
  `co_auto_show_bonus_cash` varchar(200) NOT NULL,
  `fo_program_id` varchar(200) NOT NULL,
  `fo_apr_and_term` varchar(200) NOT NULL,
  `fo_bc_bonus_cash` varchar(200) NOT NULL,
  `fo_auto_show_bonus_cash` varchar(200) NOT NULL,
  `ccfo_program_id` varchar(200) NOT NULL,
  `ccfo_customer_cash` varchar(200) NOT NULL,
  `ccfo_cc_bc_bonus_cash` varchar(200) NOT NULL,
  `ccfo_apr_and_term` varchar(200) NOT NULL,
  `ccfo_aat_bc_bonus_cash` varchar(200) NOT NULL,
  `lo_program_id` varchar(200) NOT NULL,
  `lo_lease_payment` varchar(200) NOT NULL,
  `lo_term` varchar(200) NOT NULL,
  `lo_due_at_signing` varchar(200) NOT NULL,
  `tca_program_id` varchar(200) NOT NULL,
  `total_cash_allowance` varchar(200) NOT NULL,
  `tv_program_id` varchar(200) NOT NULL,
  `total_values` varchar(200) NOT NULL,
  `month` varchar(100) NOT NULL,
  `box_size` varchar(200) NOT NULL,
  `wheel_base` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cowsform_nameplate_subject_name_d5d86a66_uniq` (`subject_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `cowsform_nameplate` WRITE;
/*!40000 ALTER TABLE `cowsform_nameplate` DISABLE KEYS */;

INSERT INTO `cowsform_nameplate` (`id`, `pub_date`, `subject_name`, `business_center`, `states`, `zip_codes`, `dma`, `car_model`, `car_make`, `car_trim`, `car_year`, `co_program_id`, `co_customer_cash`, `co_bc_bonus_cash`, `co_auto_show_bonus_cash`, `fo_program_id`, `fo_apr_and_term`, `fo_bc_bonus_cash`, `fo_auto_show_bonus_cash`, `ccfo_program_id`, `ccfo_customer_cash`, `ccfo_cc_bc_bonus_cash`, `ccfo_apr_and_term`, `ccfo_aat_bc_bonus_cash`, `lo_program_id`, `lo_lease_payment`, `lo_term`, `lo_due_at_signing`, `tca_program_id`, `total_cash_allowance`, `tv_program_id`, `total_values`, `month`, `box_size`, `wheel_base`)
VALUES
	(1,'2017-08-07 18:11:05','Test','NEBC','[]','[u\'1001\', u\'1002\', u\'1003\', u\'1004\', u\'1005\', u\'1007\', u\'1008\', u\'1009\', u\'1010\', u\'1011\', u\'1012\', u\'1013\', u\'1014\', u\'1020\', u\'1021\', u\'1022\', u\'1026\', u\'1027\', u\'1028\', u\'1029\', u\'1030\', u\'1031\', u\'1032\', u\'1033\', u\'1034\', u\'1035\', u\'1036\', u\'1037\', u\'1038\', u\'1039\', u\'1040\', u\'1041\', u\'1050\', u\'1053\', u\'1054\', u\'1056\', u\'1057\', u\'1059\', u\'1060\', u\'1061\', u\'1062\', u\'1063\', u\'1066\', u\'1068\', u\'1069\', u\'1070\', u\'1071\', u\'1072\', u\'1073\', u\'1074\', u\'1075\', u\'1077\', u\'1079\', u\'1080\', u\'1081\', u\'1082\', u\'1083\', u\'1084\', u\'1085\', u\'1086\', u\'1088\', u\'1089\', u\'1090\', u\'1092\', u\'1093\', u\'1094\', u\'1095\', u\'1096\', u\'1097\', u\'1098\', u\'1101\', u\'1102\', u\'1103\', u\'1104\', u\'1105\', u\'1106\', u\'1107\', u\'1108\', u\'1109\', u\'1111\', u\'1115\', u\'1116\', u\'1118\', u\'1119\', u\'1128\', u\'1129\', u\'1138\', u\'1139\', u\'1144\', u\'1151\', u\'1152\', u\'1199\', u\'1201\', u\'1202\', u\'1203\', u\'1220\', u\'1222\', u\'1223\', u\'1224\', u\'1225\', u\'1226\', u\'1227\', u\'1229\', u\'1230\', u\'1235\', u\'1236\', u\'1237\', u\'1238\', u\'1240\', u\'1242\', u\'1243\', u\'1244\', u\'1245\', u\'1247\', u\'1252\', u\'1253\', u\'1254\', u\'1255\', u\'1256\', u\'1257\', u\'1258\', u\'1259\', u\'1260\', u\'1262\', u\'1263\', u\'1264\', u\'1266\', u\'1267\', u\'1270\', u\'1301\', u\'1302\', u\'1330\', u\'1331\', u\'1337\', u\'1338\', u\'1339\', u\'1340\', u\'1341\', u\'1342\', u\'1343\', u\'1344\', u\'1346\', u\'1347\', u\'1349\', u\'1350\', u\'1351\', u\'1354\', u\'1355\', u\'1360\', u\'1364\', u\'1366\', u\'1367\', u\'1368\', u\'1370\', u\'1373\', u\'1375\', u\'1376\', u\'1378\', u\'1379\', u\'1380\', u\'1420\', u\'1430\', u\'1431\', u\'1432\', u\'1434\', u\'1436\', u\'1438\', u\'1440\', u\'1441\', u\'1450\', u\'1451\', u\'1452\', u\'1453\', u\'1460\', u\'1462\', u\'1463\', u\'1464\', u\'1467\', u\'1468\', u\'1469\', u\'1470\', u\'1471\', u\'1472\', u\'1473\', u\'1474\', u\'1475\', u\'1501\', u\'1503\', u\'1504\', u\'1505\', u\'1506\', u\'1507\', u\'1508\', u\'1509\', u\'1510\', u\'1515\', u\'1516\', u\'1518\', u\'1519\', u\'1520\', u\'1521\', u\'1522\', u\'1523\', u\'1524\', u\'1525\', u\'1526\', u\'1527\', u\'1529\', u\'1531\', u\'1532\', u\'1534\', u\'1535\', u\'1536\', u\'1537\', u\'1538\', u\'1540\', u\'1541\', u\'1542\', u\'1543\', u\'1545\', u\'1546\', u\'1550\', u\'1560\', u\'1561\', u\'1562\', u\'1564\', u\'1566\', u\'1568\', u\'1569\', u\'1570\', u\'1571\', u\'1581\', u\'1583\', u\'1585\', u\'1586\', u\'1588\', u\'1590\', u\'1601\', u\'1602\', u\'1603\', u\'1604\', u\'1605\', u\'1606\', u\'1607\', u\'1608\', u\'1609\', u\'1610\', u\'1611\', u\'1612\', u\'1613\', u\'1614\', u\'1615\', u\'1653\', u\'1655\', u\'1701\', u\'1702\', u\'1703\', u\'1704\', u\'1705\', u\'1718\', u\'1719\', u\'1720\', u\'1721\', u\'1730\', u\'1731\', u\'1740\', u\'1741\', u\'1742\', u\'1745\', u\'1746\', u\'1747\', u\'1748\', u\'1749\', u\'1752\', u\'1754\', u\'1756\', u\'1757\', u\'1760\', u\'1770\', u\'1772\', u\'1773\', u\'1775\', u\'1776\', u\'1778\', u\'1784\', u\'1801\', u\'1803\', u\'1805\', u\'1810\', u\'1812\', u\'1813\', u\'1815\', u\'1821\', u\'1822\', u\'1824\', u\'1826\', u\'1827\', u\'1830\', u\'1831\', u\'1832\', u\'1833\', u\'1834\', u\'1835\', u\'1840\', u\'1841\', u\'1842\', u\'1843\', u\'1844\', u\'1845\', u\'1850\', u\'1851\', u\'1852\', u\'1853\', u\'1854\', u\'1860\', u\'1862\', u\'1863\', u\'1864\', u\'1865\', u\'1866\', u\'1867\', u\'1876\', u\'1879\', u\'1880\', u\'1885\', u\'1886\', u\'1887\', u\'1888\', u\'1889\', u\'1890\', u\'1899\', u\'1901\', u\'1902\', u\'1903\', u\'1904\', u\'1905\', u\'1906\', u\'1907\', u\'1908\', u\'1910\', u\'1913\', u\'1915\', u\'1921\', u\'1922\', u\'1923\', u\'1929\', u\'1930\', u\'1931\', u\'1936\', u\'1937\', u\'1938\', u\'1940\', u\'1944\', u\'1945\', u\'1949\', u\'1950\', u\'1951\', u\'1952\', u\'1960\', u\'1961\', u\'1965\', u\'1966\', u\'1969\', u\'1970\', u\'1971\', u\'1982\', u\'1983\', u\'1984\', u\'1985\']','[]','JEEP','Renegade','Wood','2017','','','','','','','','','','','','','','12345','$300','30yr','$2000','','','','','JANUARY','',''),
	(2,'2017-08-07 18:40:10','Test 2','WBC','[]','[]','[u\'Amarillo\', u\'Boise\', u\'Eugene\', u\'Salt Lake City\', u\'Spokane\', u\'Twin Falls\']','RAM','PROMASTER','','2018','123456','$5000','$7500','$6000','','','','','','','','','','','','','','','','','','JANUARY','',''),
	(3,'2017-08-07 18:43:08','Test 3','CBC','[]','[]','[]','-------','-------','','','','','','','','','','','','','','','','','','','','','','','','JANUARY','',''),
	(4,'2017-08-07 18:44:15','Test 4','CBC','[u\'California\', u\'Hawaii\']','[]','[]','FIAT','Spider 124','','2019','','','','','','','','','','','','','','','','','','','','12345','$7500','JANUARY','',''),
	(5,'2017-08-07 19:34:59','Test 5','DBC','[]','[]','[]','-------','-------','','','','','','','','','','','','','','','','','','','','','','','','JANUARY','',''),
	(6,'2017-08-07 19:41:15','Test 6','MABC','[]','[]','[]','-------','-------','','','','','','','','','','','','','','','','','','','','','','','','JANUARY','',''),
	(7,'2017-08-07 19:42:44','Test 7','MWBC','[]','[]','[]','-------','-------','','','','','','','','','','','','','','','','','','','','','','','','JANUARY','',''),
	(8,'2017-08-07 19:46:19','Test 8','MABC','[]','[]','[]','DODGE','Charger','','','','','','','','','','','','','','','','','','','','','','','','JANUARY','',''),
	(9,'2017-08-08 20:36:20','Test 9','NEBC','[u\'Massachusetts\', u\'New Hampshire\', u\'New Jersey\', u\'New York\']','[]','[]','DODGE','Durango','','2018','','','','','','','','','','','','','','12345','$300','30yr','$2000','','','','','JANUARY','',''),
	(10,'2017-08-08 20:54:15','Test 10','SEBC','[]','[]','[u\'Augusta-Aiken\', u\'Birmingham (Ann and Tusc)\', u\'Charleston, SC\', u\'Charlotte\', u\'Chattanooga\', u\'Columbia, SC\', u\'Columbus-Tupelo-W Pnt-Hstn\', u\'Columbus, GA (Opelika, AL)\', u\'Dothan\', u\'Ft. Myers-Naples\', u\'Gainesville\', u\'Greensboro-H.Point-W.Salem\', u\'Greenville-N.Bern-Washngtn\']','RAM','4500/5500','','2018','','','','','','','','','','','','','','12345','$300','30yr','$2000','','','','','JANUARY','',''),
	(11,'2017-08-08 20:57:31','Test 11','SWBC','[]','[]','[u\'Alexandria, LA\', u\'Amarillo\', u\'Austin\', u\'Baton Rouge\', u\'Beaumont-Port Arthur\']','DODGE','Charger','','2018','','','','','','','','','','','','','','','','','','','','','','JANUARY','',''),
	(12,'2017-08-08 21:02:38','Test 12','MABC','[]','[u\'8001\', u\'8002\', u\'8003\', u\'8004\', u\'8007\']','[]','JEEP','Grand Cherokee','','2018','','','','','','','','','','','','','','','','','','','','','','JANUARY','',''),
	(13,'2017-08-08 21:05:28','Test 13','GLBC','[u\'Indiana\', u\'Kentucky\', u\'Michigan\', u\'Ohio\']','[]','[]','CHRYSLER','300','','2018','','','','','','','','','','','','','','','','','','','','','','JANUARY','',''),
	(14,'2017-08-08 21:06:38','Test 14','DBC','[]','[u\'50401\', u\'50402\', u\'50423\', u\'50424\', u\'50426\', u\'50428\', u\'50430\', u\'50432\', u\'50433\', u\'50434\']','[]','FIAT','Spider 124','','2018','','','','','','','','','','','','','','','','','','','','','','JANUARY','',''),
	(15,'2017-08-08 21:08:43','Test 15','CBC','[u\'California\', u\'Hawaii\']','[]','[]','CHRYSLER','Pacifica','','2018','','','','','','','','','','','','','','','','','','','','','','JANUARY','',''),
	(16,'2017-08-08 21:14:51','Test 16','MWBC','[u\'Kentucky\', u\'Missouri\', u\'Tennessee\']','[]','[]','DODGE','Dart','','2018','','','','','','','','','','','','','','','','','','','','','','JANUARY','',''),
	(18,'2017-08-08 21:36:12','Test 17','SEBC','[u\'North Carolina\', u\'South Carolina\', u\'Tennessee\']','[]','[]','CHRYSLER','Town and Country','','2018','','','','','','','','','','','','','','','','','','','','','','JANUARY','',''),
	(19,'2017-08-08 21:44:11','Test 18','SWBC','[u\'Mississippi\', u\'Oklahoma\', u\'Tennessee\']','[]','[]','CHRYSLER','Town and Country','','2018','','','','','','','','','','','','','','12345','$300','30yr','$2000','','','','','JANUARY','',''),
	(20,'2017-08-15 17:37:59','glbc-april-jeep-patriot-2017-08-15-17:37','GLBC','[u\'Kentucky\', u\'Michigan\']','[]','[]','JEEP','Patriot','','2018','','','','','','','','','','','','','','','','','','','','','','APRIL','',''),
	(22,'2017-08-15 17:40:52','glbc-april-jeep-patriot-2017-08-15-17:40','GLBC','[u\'Kentucky\', u\'Michigan\']','[]','[]','JEEP','Patriot','','2018','','','','','','','','','','','','','','','','','','','','','','APRIL','',''),
	(23,'2017-08-15 18:38:15','nebc-april-jeep-grand_cherokee-2017-08-15-18:38','NEBC','[u\'Maine\', u\'Massachusetts\', u\'New Hampshire\']','[]','[]','JEEP','Grand Cherokee','','2018','','','','','','','','','','','','','','','','','','','','','','APRIL','',''),
	(24,'2017-08-15 19:04:16','nebc-september-dodge-dart-2017-08-15-19:04','NEBC','[u\'Massachusetts\', u\'New Hampshire\', u\'New Jersey\', u\'New York\']','[]','[]','DODGE','Dart','','2018','','','','','','','','','','','','','','12345','$300','30yr','$2000','','','','','SEPTEMBER','',''),
	(32,'2017-08-15 19:33:05','mabc-april-jeep-cherokee-2017-08-15-19:33','MABC','[u\'District of Columbia\', u\'Maryland\', u\'New Jersey\', u\'Pennsylvania\']','[]','[]','JEEP','Cherokee','','2018','','','','','','','','','','','','','','','','','','','','','','APRIL','','');

/*!40000 ALTER TABLE `cowsform_nameplate` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table django_admin_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`)
VALUES
	(1,'2017-08-07 18:36:41','2','tbresnen',1,'[{\"added\": {}}]',4,1),
	(2,'2017-08-07 18:38:33','2','tbresnen',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"email\", \"is_staff\"]}}]',4,1),
	(3,'2017-08-07 18:38:51','3','bchevez',1,'[{\"added\": {}}]',4,1),
	(4,'2017-08-07 18:39:10','3','bchevez',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"email\"]}}]',4,1),
	(5,'2017-08-07 18:42:01','2','Test 2',2,'[{\"changed\": {\"fields\": [\"co_bc_bonus_cash\"]}}]',7,1),
	(6,'2017-08-07 20:43:29','8','Test 8',2,'[{\"changed\": {\"fields\": [\"subject_name\", \"car_model\", \"car_make\"]}}]',7,1),
	(7,'2017-08-08 21:46:11','2','tbresnen',2,'[]',4,1),
	(8,'2017-08-08 21:47:40','2','tbresnen',2,'[]',4,1),
	(9,'2017-08-08 21:48:50','2','tbresnen',2,'[]',4,1),
	(10,'2017-08-08 21:49:54','2','tbresnen',2,'[]',4,1),
	(11,'2017-08-15 19:36:39','36','mabc-april-jeep-cherokee-2017-08-15-19:35',3,'',7,1),
	(12,'2017-08-15 19:36:39','35','mabc-april-jeep-cherokee-2017-08-15-19:34',3,'',7,1),
	(13,'2017-08-15 20:06:39','3','bchevez',3,'',4,1),
	(14,'2017-08-15 20:06:54','4','bchevez',1,'[{\"added\": {}}]',4,1),
	(15,'2017-08-15 20:07:54','4','bchevez',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"email\", \"last_login\"]}}]',4,1),
	(16,'2017-08-15 20:08:53','4','bchevez',3,'',4,1),
	(17,'2017-08-15 20:09:14','5','bchevez',1,'[{\"added\": {}}]',4,1),
	(18,'2017-08-15 20:09:51','5','bchevez',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"email\", \"last_login\"]}}]',4,1),
	(19,'2017-08-15 21:01:19','1','admin',2,'[]',4,1),
	(20,'2017-08-15 21:03:49','1','CHRYSLER',1,'[{\"added\": {}}]',9,1),
	(21,'2017-08-15 21:03:55','2','DODGE',1,'[{\"added\": {}}]',9,1),
	(22,'2017-08-15 21:04:01','3','JEEP',1,'[{\"added\": {}}]',9,1),
	(23,'2017-08-15 21:04:06','4','RAM',1,'[{\"added\": {}}]',9,1),
	(24,'2017-08-15 21:04:11','5','FIAT',1,'[{\"added\": {}}]',9,1),
	(25,'2017-08-15 21:07:24','1','200',1,'[{\"added\": {}}]',8,1),
	(26,'2017-08-15 21:07:36','2','300',1,'[{\"added\": {}}]',8,1),
	(27,'2017-08-15 21:07:59','3','Town and Country',1,'[{\"added\": {}}]',8,1),
	(28,'2017-08-15 21:08:09','4','Pacifica',1,'[{\"added\": {}}]',8,1),
	(29,'2017-08-15 21:08:17','5','Challenger',1,'[{\"added\": {}}]',8,1),
	(30,'2017-08-15 21:08:25','6','Charger',1,'[{\"added\": {}}]',8,1),
	(31,'2017-08-15 21:08:32','7','Dart',1,'[{\"added\": {}}]',8,1),
	(32,'2017-08-15 21:08:40','8','Durango',1,'[{\"added\": {}}]',8,1),
	(33,'2017-08-15 21:08:49','9','Grand Caravan',1,'[{\"added\": {}}]',8,1),
	(34,'2017-08-15 21:08:56','10','Journey',1,'[{\"added\": {}}]',8,1),
	(35,'2017-08-15 21:09:04','11','Cherokee',1,'[{\"added\": {}}]',8,1),
	(36,'2017-08-15 21:09:13','12','Compass',1,'[{\"added\": {}}]',8,1),
	(37,'2017-08-15 21:09:21','13','Grand Cherokee',1,'[{\"added\": {}}]',8,1),
	(38,'2017-08-15 21:09:28','14','Patriot',1,'[{\"added\": {}}]',8,1),
	(39,'2017-08-15 21:09:36','15','Renegade',1,'[{\"added\": {}}]',8,1),
	(40,'2017-08-15 21:09:43','16','Wrangler',1,'[{\"added\": {}}]',8,1),
	(41,'2017-08-15 21:09:51','17','Wrangler Unlimited',1,'[{\"added\": {}}]',8,1),
	(42,'2017-08-15 21:09:59','18','1500',1,'[{\"added\": {}}]',8,1),
	(43,'2017-08-15 21:10:06','19','2500',1,'[{\"added\": {}}]',8,1),
	(44,'2017-08-15 21:10:13','20','3500',1,'[{\"added\": {}}]',8,1),
	(45,'2017-08-15 21:10:20','21','CV',1,'[{\"added\": {}}]',8,1),
	(46,'2017-08-15 21:10:28','22','4500/5500',1,'[{\"added\": {}}]',8,1),
	(47,'2017-08-15 21:10:35','23','PROMASTER',1,'[{\"added\": {}}]',8,1),
	(48,'2017-08-15 21:10:44','24','Promaster CITY',1,'[{\"added\": {}}]',8,1),
	(49,'2017-08-15 21:10:51','25','500',1,'[{\"added\": {}}]',8,1),
	(50,'2017-08-15 21:10:58','26','500e',1,'[{\"added\": {}}]',8,1),
	(51,'2017-08-15 21:11:06','27','500L',1,'[{\"added\": {}}]',8,1),
	(52,'2017-08-15 21:11:13','28','500X',1,'[{\"added\": {}}]',8,1),
	(53,'2017-08-15 21:11:22','29','Spider 124',1,'[{\"added\": {}}]',8,1),
	(54,'2017-08-15 21:55:46','5','FIAT',2,'[{\"changed\": {\"fields\": [\"active\"]}}]',9,1),
	(55,'2017-08-15 22:01:50','5','FIAT',2,'[{\"changed\": {\"fields\": [\"active\"]}}]',9,1),
	(56,'2017-08-16 14:19:40','26','500e',2,'[{\"changed\": {\"fields\": [\"carModel\"]}}]',8,1),
	(57,'2017-08-16 14:19:46','28','500X',2,'[{\"changed\": {\"fields\": [\"carModel\"]}}]',8,1),
	(58,'2017-08-16 15:26:02','29','Spider 124',2,'[{\"changed\": {\"fields\": [\"active\"]}}]',8,1),
	(59,'2017-08-16 17:22:36','29','Spider 124',2,'[{\"changed\": {\"fields\": [\"active\"]}}]',8,1),
	(60,'2017-08-16 17:23:00','5','FIAT',2,'[{\"changed\": {\"fields\": [\"active\"]}}]',9,1),
	(61,'2017-08-16 17:23:34','5','FIAT',2,'[{\"changed\": {\"fields\": [\"active\"]}}]',9,1);

/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table django_content_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;

INSERT INTO `django_content_type` (`id`, `app_label`, `model`)
VALUES
	(1,'admin','logentry'),
	(2,'auth','group'),
	(3,'auth','permission'),
	(4,'auth','user'),
	(5,'contenttypes','contenttype'),
	(8,'cowsform','carmake'),
	(9,'cowsform','carmodel'),
	(7,'cowsform','nameplate'),
	(6,'sessions','session');

/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table django_migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`)
VALUES
	(1,'contenttypes','0001_initial','2017-08-07 18:09:39'),
	(2,'auth','0001_initial','2017-08-07 18:09:40'),
	(3,'admin','0001_initial','2017-08-07 18:09:40'),
	(4,'admin','0002_logentry_remove_auto_add','2017-08-07 18:09:40'),
	(5,'contenttypes','0002_remove_content_type_name','2017-08-07 18:09:40'),
	(6,'auth','0002_alter_permission_name_max_length','2017-08-07 18:09:40'),
	(7,'auth','0003_alter_user_email_max_length','2017-08-07 18:09:40'),
	(8,'auth','0004_alter_user_username_opts','2017-08-07 18:09:40'),
	(9,'auth','0005_alter_user_last_login_null','2017-08-07 18:09:40'),
	(10,'auth','0006_require_contenttypes_0002','2017-08-07 18:09:40'),
	(11,'auth','0007_alter_validators_add_error_messages','2017-08-07 18:09:40'),
	(12,'auth','0008_alter_user_username_max_length','2017-08-07 18:09:40'),
	(13,'cowsform','0001_initial','2017-08-07 18:09:40'),
	(14,'sessions','0001_initial','2017-08-07 18:09:40'),
	(15,'cowsform','0002_auto_20170808_2126','2017-08-08 21:27:00'),
	(16,'cowsform','0003_auto_20170808_2137','2017-08-08 21:37:13'),
	(17,'cowsform','0004_nameplate_month','2017-08-11 15:07:47'),
	(18,'cowsform','0005_auto_20170811_1508','2017-08-11 15:08:27'),
	(19,'cowsform','0006_auto_20170811_1740','2017-08-11 17:40:41'),
	(20,'cowsform','0007_auto_20170815_1902','2017-08-15 19:02:44'),
	(21,'cowsform','0008_auto_20170815_2058','2017-08-15 20:58:10');

/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table django_session
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`)
VALUES
	('bxwlvabs3pqnf08o9qteosewlouv3ktq','MGE5NDQzZTQyZTAxMzI1YjQwMmU1YmI3YzU4MWEzM2Q0ZjM3ZWI0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6ImM4YzEwYWJhMjNhNTAzYTcyYzliYWZmMGI2YzAyNDQyZjQ1YTZkZjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-08-22 01:00:18'),
	('htc974yekvw7pa94567txcidpk6qislm','MGE5NDQzZTQyZTAxMzI1YjQwMmU1YmI3YzU4MWEzM2Q0ZjM3ZWI0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6ImM4YzEwYWJhMjNhNTAzYTcyYzliYWZmMGI2YzAyNDQyZjQ1YTZkZjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-08-29 21:01:01'),
	('qdwn5irnu832tafaegdcdpisle0gqkbh','MGE5NDQzZTQyZTAxMzI1YjQwMmU1YmI3YzU4MWEzM2Q0ZjM3ZWI0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6ImM4YzEwYWJhMjNhNTAzYTcyYzliYWZmMGI2YzAyNDQyZjQ1YTZkZjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-08-22 01:30:18'),
	('wvrfjcuv398mngce7k68tjvwqxl00ec8','MGY4YzQ0MDMzMzdjY2ExY2M3ZWNlMGEzMjEzNTI5ZThkYjQyNTQxMDp7Il9hdXRoX3VzZXJfaGFzaCI6ImVkYzQ0Nzk3NmNlMGJiNGFjMWE1MjFjNjdiMjE3ZWI1NGU5MjhiMzgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2017-08-23 20:26:23');

/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
