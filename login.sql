-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 06, 2023 at 11:02 AM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `login`
--
CREATE DATABASE IF NOT EXISTS `login` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `login`;

-- --------------------------------------------------------

--
-- Table structure for table `adminapp_videos`
--

DROP TABLE IF EXISTS `adminapp_videos`;
CREATE TABLE IF NOT EXISTS `adminapp_videos` (
  `index` int NOT NULL AUTO_INCREMENT,
  `Title` varchar(250) NOT NULL,
  `Url` varchar(250) NOT NULL,
  `Emotions` varchar(250) NOT NULL,
  `date_time` datetime(6) NOT NULL,
  PRIMARY KEY (`index`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `adminapp_videos`
--

INSERT INTO `adminapp_videos` (`index`, `Title`, `Url`, `Emotions`, `date_time`) VALUES
(2, 'Sa', 'https://www.youtube.com/watch?v=ojKEc3J113g&ab_channel=MaaPaataMeeNota', 'Sad', '2023-03-06 07:57:10.521771'),
(4, 'fear', 'https://www.youtube.com/watch?v=4H178Fc957I&ab_channel=AdityaCinemalu', 'Fear', '2023-03-03 11:56:49.071654');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add user', 7, 'add_user'),
(26, 'Can change user', 7, 'change_user'),
(27, 'Can delete user', 7, 'delete_user'),
(28, 'Can view user', 7, 'view_user'),
(29, 'Can add feedback', 8, 'add_feedback'),
(30, 'Can change feedback', 8, 'change_feedback'),
(31, 'Can delete feedback', 8, 'delete_feedback'),
(32, 'Can view feedback', 8, 'view_feedback'),
(33, 'Can add products', 9, 'add_products'),
(34, 'Can change products', 9, 'change_products'),
(35, 'Can delete products', 9, 'delete_products'),
(36, 'Can view products', 9, 'view_products'),
(37, 'Can add user', 10, 'add_user'),
(38, 'Can change user', 10, 'change_user'),
(39, 'Can delete user', 10, 'delete_user'),
(40, 'Can view user', 10, 'view_user'),
(41, 'Can add feedback', 11, 'add_feedback'),
(42, 'Can change feedback', 11, 'change_feedback'),
(43, 'Can delete feedback', 11, 'delete_feedback'),
(44, 'Can view feedback', 11, 'view_feedback'),
(45, 'Can add videos', 12, 'add_videos'),
(46, 'Can change videos', 12, 'change_videos'),
(47, 'Can delete videos', 12, 'delete_videos'),
(48, 'Can view videos', 12, 'view_videos'),
(49, 'Can add contact', 13, 'add_contact'),
(50, 'Can change contact', 13, 'change_contact'),
(51, 'Can delete contact', 13, 'delete_contact'),
(52, 'Can view contact', 13, 'view_contact');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'userapp', 'user'),
(8, 'userapp', 'feedback'),
(9, 'userapp', 'products'),
(10, 'mainapp', 'user'),
(11, 'mainapp', 'feedback'),
(12, 'adminapp', 'videos'),
(13, 'mainapp', 'contact');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-02-14 06:59:44.013170'),
(2, 'auth', '0001_initial', '2023-02-14 06:59:44.409168'),
(3, 'admin', '0001_initial', '2023-02-14 06:59:44.520174'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-02-14 06:59:44.543172'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-02-14 06:59:44.551174'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-02-14 06:59:44.609170'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-02-14 06:59:44.637171'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-02-14 06:59:44.668171'),
(9, 'auth', '0004_alter_user_username_opts', '2023-02-14 06:59:44.674169'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-02-14 06:59:44.704188'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-02-14 06:59:44.706169'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-02-14 06:59:44.713174'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-02-14 06:59:44.748171'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-02-14 06:59:44.776174'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-02-14 06:59:44.810169'),
(16, 'auth', '0011_update_proxy_permissions', '2023-02-14 06:59:44.816169'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-02-14 06:59:44.845176'),
(18, 'sessions', '0001_initial', '2023-02-14 06:59:44.882173'),
(19, 'userapp', '0001_initial', '2023-02-17 07:17:54.743267'),
(20, 'userapp', '0002_remove_user_image_user_age_user_city_user_img_and_more', '2023-02-17 07:37:16.396795'),
(21, 'userapp', '0003_rename_fullname_user_firstname', '2023-02-17 07:37:46.751450'),
(22, 'userapp', '0004_alter_user_firstname', '2023-02-17 07:43:24.669785'),
(23, 'userapp', '0005_alter_user_phonenumber', '2023-02-17 08:16:31.864314'),
(24, 'userapp', '0006_user_date', '2023-02-17 12:09:42.353627'),
(25, 'userapp', '0007_user_cpassword_user_password', '2023-02-20 08:30:02.247526'),
(26, 'userapp', '0008_feedback', '2023-02-23 05:58:07.402306'),
(27, 'userapp', '0009_feedback_reviewer', '2023-02-23 06:02:10.966502'),
(28, 'userapp', '0010_feedback_sentiment', '2023-02-23 06:31:50.197439'),
(29, 'userapp', '0011_products', '2023-02-28 07:04:44.638335'),
(30, 'userapp', '0012_alter_products_table', '2023-02-28 07:07:02.997492'),
(31, 'userapp', '0013_alter_feedback_table', '2023-02-28 07:07:54.355597'),
(32, 'mainapp', '0001_initial', '2023-02-28 09:10:57.291670'),
(33, 'mainapp', '0002_alter_user_phone', '2023-02-28 09:25:52.866797'),
(34, 'mainapp', '0003_feedback', '2023-02-28 11:38:18.473034'),
(35, 'adminapp', '0001_initial', '2023-03-01 11:53:55.266111'),
(36, 'mainapp', '0004_user_status', '2023-03-03 06:51:22.901182'),
(37, 'mainapp', '0005_contact', '2023-03-06 06:11:50.742675');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('h3tnoh25yjax264k719n15ltfw3b4e1p', 'eyJ1c2VyX2lkIjoyfQ:1pZ6hu:cGa3tVANVdXrE2Rz5epMfKckpZ1wGqyE3Gn8Itr2Qus', '2023-03-20 09:00:34.579820');

-- --------------------------------------------------------

--
-- Table structure for table `feedback_details`
--

DROP TABLE IF EXISTS `feedback_details`;
CREATE TABLE IF NOT EXISTS `feedback_details` (
  `Feedback_id` int NOT NULL AUTO_INCREMENT,
  `rating` varchar(100) DEFAULT NULL,
  `review` varchar(225) DEFAULT NULL,
  `datetime` datetime(6) NOT NULL,
  `reviewer_id` int DEFAULT NULL,
  `sentiment` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Feedback_id`),
  KEY `userapp_feedback_reviewer_id_0e359e17` (`reviewer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `feedback_details`
--

INSERT INTO `feedback_details` (`Feedback_id`, `rating`, `review`, `datetime`, `reviewer_id`, `sentiment`) VALUES
(1, '4', 'Hi this is goutham your organizatioon is very great it gives scope to get knowledge of coding', '2023-02-23 06:47:25.395602', 11, 'very positive'),
(23, NULL, '', '2023-03-03 06:03:25.280792', 11, 'positive'),
(22, NULL, '', '2023-03-03 06:03:10.090719', 11, 'positive'),
(20, NULL, '', '2023-03-03 05:58:10.534232', 11, 'positive'),
(21, NULL, '', '2023-03-03 05:58:31.187898', 11, 'positive');

-- --------------------------------------------------------

--
-- Table structure for table `mainapp_contact`
--

DROP TABLE IF EXISTS `mainapp_contact`;
CREATE TABLE IF NOT EXISTS `mainapp_contact` (
  `contact_id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(2500) DEFAULT NULL,
  `lastname` varchar(250) DEFAULT NULL,
  `Phonenumber` varchar(255) DEFAULT NULL,
  `Email_Id` varchar(250) DEFAULT NULL,
  `country` varchar(250) DEFAULT NULL,
  `subject` longtext,
  PRIMARY KEY (`contact_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `mainapp_contact`
--

INSERT INTO `mainapp_contact` (`contact_id`, `firstname`, `lastname`, `Phonenumber`, `Email_Id`, `country`, `subject`) VALUES
(2, 'Goutham', 'Kumar', '9440549705', 'gouthambunny123@gmail.com', 'India', 'hi');

-- --------------------------------------------------------

--
-- Table structure for table `mainapp_feedback`
--

DROP TABLE IF EXISTS `mainapp_feedback`;
CREATE TABLE IF NOT EXISTS `mainapp_feedback` (
  `Feedback_id` int NOT NULL AUTO_INCREMENT,
  `rating` varchar(100) DEFAULT NULL,
  `review` varchar(225) DEFAULT NULL,
  `sentiment` varchar(100) DEFAULT NULL,
  `datetime` datetime(6) NOT NULL,
  `reviewer_id` int DEFAULT NULL,
  PRIMARY KEY (`Feedback_id`),
  KEY `mainapp_feedback_reviewer_id_1b0aad28` (`reviewer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `mainapp_feedback`
--

INSERT INTO `mainapp_feedback` (`Feedback_id`, `rating`, `review`, `sentiment`, `datetime`, `reviewer_id`) VALUES
(1, '5', 'this is goutham', 'positive', '2023-02-28 11:59:32.676028', 2),
(2, '4', 'hi this is Goutham this project is very nice.', 'positive', '2023-03-01 05:42:31.548649', 2),
(3, '3', 'very positive', 'very positive', '2023-03-01 09:11:41.367308', 2),
(4, '1', 'very Negative', 'negative', '2023-03-01 09:38:01.080443', 2),
(5, '2', 'negative negative negative negative negative negative negative negative negative', 'negative', '2023-03-01 09:38:59.593346', 2),
(7, '3', '', 'positive', '2023-03-02 10:49:14.005994', 2),
(8, '3', '', 'negative', '2023-03-02 10:54:12.941864', 2),
(9, NULL, 'neutral', 'negative', '2023-03-02 10:54:46.597654', 2),
(10, NULL, '', 'very positive', '2023-03-02 10:56:04.265856', 2),
(11, NULL, '', 'neutral', '2023-03-02 11:01:05.210411', 2),
(12, '4', 'hlo', 'neutral', '2023-03-02 12:14:00.680754', 2),
(13, '4', 'this project is very nice and using this project helps me find out the exact information what I am lookin for', 'very positive', '2023-03-02 12:17:16.577337', 2),
(42, '3', '', 'neutral', '2023-03-03 06:20:56.402318', 2),
(61, '1', 'negative negative', 'very negative', '2023-03-03 11:58:54.536323', 2),
(59, '4', 'hi this project is very very nice and very useful', 'very positive', '2023-03-03 06:48:31.889449', 2),
(53, NULL, 'sfbkfs', 'neutral', '2023-03-03 06:26:06.256300', 2),
(54, NULL, 'sfs', 'neutral', '2023-03-03 06:26:14.832816', 2),
(55, NULL, 'sffs', 'neutral', '2023-03-03 06:26:19.955051', 2),
(56, '4', 'hi this is', 'neutral', '2023-03-03 06:27:25.185727', 2),
(57, '4', 'hi', 'neutral', '2023-03-03 06:28:08.158741', 2),
(58, '4', 'the project is good', 'positive', '2023-03-03 06:29:44.853353', 2);

-- --------------------------------------------------------

--
-- Table structure for table `mainapp_user`
--

DROP TABLE IF EXISTS `mainapp_user`;
CREATE TABLE IF NOT EXISTS `mainapp_user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `img` varchar(100) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `mainapp_user`
--

INSERT INTO `mainapp_user` (`user_id`, `email`, `fname`, `lname`, `phone`, `city`, `password`, `img`, `status`) VALUES
(2, 'gouthambunny123@gmail.com', 'Goutham', 'Bairoju', '9440549705', 'NALGONDA', 'goutham123', 'Images/user/gou_heFtlj6.jpg', 'accepted'),
(10, 'ggg@gmail.com', 'Goutham', 'Bairoju', '9440549705', 'NALGONDA', 'goutham', 'Images/user/harsha_HzybJEy.jpg', 'pending'),
(6, 'pranavj@gmail.com', 'pranav', 'kumar', '7993080118', 'HYDERABAD', 'pranav', 'Images/user/pranav.jpeg', 'accepted'),
(11, 'bg@gmail.com', 'bunny', 'jain', '7981973580', 'Warangal', 'goutha', 'Images/user/bunny.jpg', 'pending'),
(9, 'pragathipanda@gmail.com', 'Pragathi', 'Pandala', '8127549597', 'KALVAKURTHY', 'pragathi', 'Images/user/pragathi.jpg', 'accepted'),
(12, 'bgg@gmail.com', 'goutam', 'nair', '7896542315', 'Delhi', '852741963', 'Images/user/nair.jpg', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `product_details`
--

DROP TABLE IF EXISTS `product_details`;
CREATE TABLE IF NOT EXISTS `product_details` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_image` varchar(100) NOT NULL,
  `product_title` varchar(500) NOT NULL,
  `product_desc` longtext NOT NULL,
  `product_categorey` varchar(500) NOT NULL,
  `product_price` int NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `product_details`
--

INSERT INTO `product_details` (`product_id`, `product_image`, `product_title`, `product_desc`, `product_categorey`, `product_price`) VALUES
(1, 'product_image/Python-development.jpg', 'Python Development', 'Python is often used as a support language for software developers, for build control and management, testing, and in many other ways. SCons for build control. Buildbot and Apache Gump for automated continuous compilation and testing.', 'Home Appliances', 2000),
(2, 'product_image/cooker.jpg', 'Cooker', 'A cooker is a large metal device for cooking food using gas or electricity. A cooker usually consists of a grill, an oven, and some gas or electric rings.', 'Home Appliances', 2500),
(3, 'product_image/ac_SIK9BKm.jfif', 'Air conditioner', 'Definition: Alternating Current (AC) is a type of electrical current, in which the direction of the flow of electrons switches back and forth at regular intervals or cycles. Current flowing in power lines and normal household electricity that comes from a wall outlet is alternating current.', 'Home Appliances', 20000),
(4, 'product_image/car.jpg', 'R C Car', 'Radio-controlled cars (or RC cars for short) are miniature model cars, vans, buses, trucks or buggies that can be controlled from a distance using a specialized transmitter or remote.', '', 5000),
(5, 'product_image/panda.jpg', 'Panda', 'Stuffed toys are distinguishable from other toys mainly by their softness, flexibility, and resemblance to animals or fictional characters. Stuffed toys most commonly take the form of animals, especially bears (in the case of teddy bears), mammalian pets such as cats and dogs, and highly recognizable animals such as zebras, tigers, pandas, lizards, and elephants. Many fictional animal-like characters from movies, TV shows, books, or other entertainment forms often appear in stuffed toy versions, as do both real and fictional humans if the individual or character is famous enough. These toys are filled with soft plush material.\r\n\r\nStuffed toys come in an array of different sizes, with the smallest being thumb-sized and the largest being larger than a house.[1][2] However, the largest somewhat commonly produced stuffed animals are not much bigger than a person.[citation needed] Most stuffed animals are designed to be an appropriate size for easy handling. They also come in a wide variety of colors, cloth surfaces, fur textures, and humanizing embellishments.\r\n\r\nStuffed toys are commonly sold in stores worldwide. Vendors are often abundant at tourist attractions, airports, carnivals, fairs, downtown parks, and general public meeting places of almost any nature, especially if there are children present.', 'Toys', 1500),
(6, 'product_image/washing_machine.jfif', 'Washing Machine', 'Laundering by hand involves soaking, beating, scrubbing, and rinsing dirty textiles. Before indoor plumbing, individuals also had to carry all the water used for washing, boiling, and rinsing the laundry from a pump, well, or spring. Water for the laundry would be hand carried, heated on a fire for washing, then poured into the tub. That made the warm soapy water precious; it would be reused, first to wash the least soiled clothing, then to wash progressively dirtier laundry.\r\n\r\nRemoval of soap and water from the clothing after washing was a separate process. First, soap would be rinsed out with clear water. After rinsing, the soaking wet clothing would be formed into a roll and twisted by hand to extract water. The entire process often occupied an entire day of hard work, plus drying and ironing.\r\n\r\nNearly five billion of the world\'s population of seven billion as of 2010 still hand-wash their clothes.', 'Electronics', 18000),
(7, 'product_image/bat.jfif', 'Cricket Bat', 'A cricket bat is a specialised piece of equipment used by batters in the sport of cricket to hit the ball, typically consisting of a cane handle attached to a flat-fronted willow-wood blade. It may also be used by a batter who is making ground to avoid a run out, by holding the bat and touching the ground with it. The length of the bat may be no more than 38 inches (96.5 cm) and the width no more than 4.25 inches (10.8 cm). Its use is first mentioned in 1624. Since 1979, a law change has provided that cricket bats can only be made from wood.', 'Toys', 1299);

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

DROP TABLE IF EXISTS `user_details`;
CREATE TABLE IF NOT EXISTS `user_details` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `fname` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `age` int DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `img` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `phonenumber` varchar(100) DEFAULT NULL,
  `profession` varchar(100) DEFAULT NULL,
  `date` datetime(6) DEFAULT NULL,
  `cpassword` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`user_id`, `fname`, `email`, `age`, `city`, `img`, `lastname`, `phonenumber`, `profession`, `date`, `cpassword`, `password`) VALUES
(1, 'Goutham', 'gouthambunny123@gmail.com', 20, 'NALGONDA', 'Images/user/gou.jpg', 'Kumar', '2147483647', 'Student', '2023-02-17 12:09:42.292632', NULL, NULL),
(7, 'goutham', 'gouthambunny123@gmail.com', 11, 'NALGONDA', 'Images/user/gou_Qjotvrx.jpg', 'Kumar', '09440549705', 'Student', '2023-02-17 12:11:29.825662', NULL, NULL),
(11, 'Goutham', 'gouthambunny123@gmail.com', 11, 'NALGONDA', 'Images/user/gou_qDFh3M4.jpg', 'Kumar', '9440549705', 'Student', '2023-02-20 08:33:01.460483', '123456789', '123456789');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
