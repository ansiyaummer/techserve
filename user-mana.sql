-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 28, 2020 at 12:01 PM
-- Server version: 10.3.20-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `user-mana`
--

-- --------------------------------------------------------

--
-- Table structure for table `accessories`
--

DROP TABLE IF EXISTS `accessories`;
CREATE TABLE IF NOT EXISTS `accessories` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accessories`
--

INSERT INTO `accessories` (`id`, `name`, `price`, `status`, `created_at`, `updated_at`) VALUES
(8, 'Carborator', '65', 1, '2020-05-14 15:16:04', '2020-05-14 15:16:04'),
(9, 'dffsdf', '55', 1, '2020-06-02 13:17:14', '2020-06-02 13:17:14');

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

DROP TABLE IF EXISTS `attendances`;
CREATE TABLE IF NOT EXISTS `attendances` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `punch_in` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `punch_out` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `day` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `month` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `punch` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attendances`
--

INSERT INTO `attendances` (`id`, `date`, `photo`, `status`, `created_at`, `updated_at`, `user_id`, `punch_in`, `punch_out`, `day`, `month`, `year`, `punch`) VALUES
(14, '2020-04-17', NULL, 1, '2020-04-16 20:16:22', '2020-04-16 20:16:22', '1', '01:46:22', '0', '17', '04', '2020', 'in'),
(13, '2020-04-17', NULL, 1, '2020-04-16 20:00:28', '2020-04-16 20:00:28', '1', '01:30:28', '0', '17', '04', '2020', 'in'),
(12, '2020-04-17', NULL, 1, '2020-04-16 19:45:54', '2020-04-16 19:45:54', '1', '01:15:54', '0', '17', '04', '2020', 'out');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(17, 'Electronics', 1, '2020-04-11 19:01:48', '2020-04-11 19:06:08');

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

DROP TABLE IF EXISTS `chats`;
CREATE TABLE IF NOT EXISTS `chats` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `to` int(10) UNSIGNED NOT NULL,
  `from` int(10) UNSIGNED NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chats`
--

INSERT INTO `chats` (`id`, `to`, `from`, `message`, `read`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 'ffrfr', 0, '2020-04-13 13:33:55', '2020-04-13 13:33:55'),
(2, 30, 33, 'gcv', 0, '2020-04-29 19:16:27', '2020-04-29 19:16:27'),
(5, 23, 33, '[][]p]p[]p[', 0, '2020-05-29 11:32:45', '2020-05-29 11:32:45'),
(6, 23, 33, 'l;l;\';\'', 0, '2020-05-29 11:32:49', '2020-05-29 11:32:49'),
(7, 29, 33, 'test', 0, '2020-05-30 06:12:07', '2020-05-30 06:12:07'),
(8, 27, 33, 'test', 0, '2020-05-30 06:12:13', '2020-05-30 06:12:13'),
(9, 30, 33, 'rtytrrtyr', 0, '2020-06-17 12:02:48', '2020-06-17 12:02:48'),
(10, 30, 33, 'ertretert', 0, '2020-06-17 12:02:51', '2020-06-17 12:02:51'),
(11, 26, 33, 'ertertert', 0, '2020-06-17 12:02:58', '2020-06-17 12:02:58'),
(12, 28, 33, 'ertertert', 0, '2020-06-17 12:03:02', '2020-06-17 12:03:02'),
(13, 25, 33, 'erterter', 0, '2020-06-17 12:03:06', '2020-06-17 12:03:06'),
(14, 27, 33, 'erter', 0, '2020-06-17 12:03:11', '2020-06-17 12:03:11'),
(15, 22, 33, 'erterteertr', 0, '2020-06-17 12:03:17', '2020-06-17 12:03:17');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
CREATE TABLE IF NOT EXISTS `cities` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `state_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `state_id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Cochin', 1, NULL, NULL),
(2, 1, 'Trivandrum', 1, NULL, NULL),
(3, 2, 'Chennai', 1, NULL, NULL),
(4, 2, 'Madurai', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `equipment`
--

DROP TABLE IF EXISTS `equipment`;
CREATE TABLE IF NOT EXISTS `equipment` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `equipment`
--

INSERT INTO `equipment` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'multi meter', 1, NULL, '2020-04-13 13:09:24'),
(4, 'spanner', 1, '2020-04-13 13:12:49', '2020-04-13 13:12:49'),
(5, 'Screw driver', 1, '2020-04-13 13:12:57', '2020-05-14 15:15:00');

-- --------------------------------------------------------

--
-- Table structure for table `equipment_statuses`
--

DROP TABLE IF EXISTS `equipment_statuses`;
CREATE TABLE IF NOT EXISTS `equipment_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `equipment_id` int(11) NOT NULL,
  `avl_qty` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

DROP TABLE IF EXISTS `expenses`;
CREATE TABLE IF NOT EXISTS `expenses` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `expense_type` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `expense_type`, `name`, `status`, `created_at`, `updated_at`, `photo`, `user_id`, `price`) VALUES
(1, 1, 'Miss Teagan Von PhD', 1, '2020-04-15 12:24:54', '2020-04-15 12:24:54', 'https://lorempixel.com/200/200/?76298', '6', '229'),
(2, 1, 'Prof. Soledad Kozey DVM', 1, '2020-04-15 12:24:54', '2020-04-15 12:24:54', 'https://lorempixel.com/200/200/?70504', '13', '177'),
(3, 1, 'Ruth Rosenbaum Sr.', 1, '2020-04-15 12:24:54', '2020-04-15 12:24:54', 'https://lorempixel.com/200/200/?90257', '30', '270'),
(4, 2, 'Heloise Reilly', 1, '2020-04-15 12:24:54', '2020-04-15 12:24:54', 'https://lorempixel.com/200/200/?35060', '15', '276'),
(5, 2, 'Prof. Emanuel Zboncak', 1, '2020-04-15 12:24:54', '2020-04-15 12:24:54', 'https://lorempixel.com/200/200/?34588', '15', '128'),
(7, 3, 'Josiah Dare', 1, '2020-04-15 12:24:54', '2020-04-15 12:24:54', 'https://lorempixel.com/200/200/?96339', '2', '109'),
(8, 3, 'Prof. Carmela Graham', 1, '2020-04-15 12:24:54', '2020-04-15 12:24:54', 'https://lorempixel.com/200/200/?31725', '26', '152'),
(9, 3, 'Miss Birdie Kihn III', 1, '2020-04-15 12:24:54', '2020-04-15 12:24:54', 'https://lorempixel.com/200/200/?23363', '11', '119'),
(10, 2, 'Jazmyn Franecki', 1, '2020-04-15 12:24:54', '2020-04-15 12:24:54', 'https://lorempixel.com/200/200/?30150', '1', '146'),
(11, 1, 'Effie Mueller', 1, '2020-04-15 12:24:54', '2020-04-15 12:24:54', 'https://lorempixel.com/200/200/?73291', '24', '215'),
(12, 2, 'Sedrick Hahn', 1, '2020-04-15 12:24:54', '2020-04-15 12:24:54', 'https://lorempixel.com/200/200/?18735', '10', '151'),
(13, 3, 'Myriam Lockman', 1, '2020-04-15 12:24:54', '2020-04-15 12:24:54', 'https://lorempixel.com/200/200/?21983', '14', '246'),
(15, 2, 'Vaughn Graham', 1, '2020-04-15 12:24:54', '2020-04-15 12:24:54', 'https://lorempixel.com/200/200/?51770', '9', '273'),
(17, 2, 'Jana Waelchi', 1, '2020-04-15 12:24:54', '2020-04-15 12:24:54', 'https://lorempixel.com/200/200/?97363', '8', '232'),
(18, 3, 'Mrs. Alycia Gutkowski', 1, '2020-04-15 12:24:54', '2020-04-15 12:24:54', 'https://lorempixel.com/200/200/?56693', '7', '196'),
(19, 3, 'Maximilian Christiansen', 1, '2020-04-15 12:24:54', '2020-04-15 12:24:54', 'https://lorempixel.com/200/200/?25669', '5', '269'),
(20, 2, 'Kitty Price', 1, '2020-04-15 12:24:54', '2020-04-15 12:24:54', 'https://lorempixel.com/200/200/?78333', '28', '204'),
(21, 1, 'Mr. Rhett Kling', 1, '2020-04-15 12:24:54', '2020-04-15 12:24:54', 'https://lorempixel.com/200/200/?98686', '12', '132'),
(23, 3, 'Lexus Gislason Sr.', 1, '2020-04-15 12:24:54', '2020-04-15 12:24:54', 'https://lorempixel.com/200/200/?96181', '29', '151'),
(24, 1, 'Miss Ressie McClure', 1, '2020-04-15 12:24:54', '2020-04-15 12:24:54', 'https://lorempixel.com/200/200/?69228', '8', '215'),
(25, 1, 'Franco Wintheiser Sr.', 1, '2020-04-15 12:24:54', '2020-04-15 12:24:54', 'https://lorempixel.com/200/200/?94814', '1', '227'),
(26, 1, 'Dr. Aurore Reynolds', 1, '2020-04-15 12:24:54', '2020-04-15 12:24:54', 'https://lorempixel.com/200/200/?46000', '13', '279'),
(27, 3, 'Freda Howell', 1, '2020-04-15 12:24:54', '2020-04-15 12:24:54', 'https://lorempixel.com/200/200/?64603', '27', '205'),
(28, 3, 'Hunter Hill', 1, '2020-04-15 12:24:54', '2020-04-15 12:24:54', 'https://lorempixel.com/200/200/?97396', '16', '296'),
(29, 3, 'Jaylan Feest', 1, '2020-04-15 12:24:54', '2020-04-15 12:24:54', 'https://lorempixel.com/200/200/?83059', '29', '107'),
(30, 3, 'Patsy Johnson', 1, '2020-04-15 12:24:54', '2020-04-15 12:24:54', 'https://lorempixel.com/200/200/?78630', '13', '236');

-- --------------------------------------------------------

--
-- Table structure for table `expense_types`
--

DROP TABLE IF EXISTS `expense_types`;
CREATE TABLE IF NOT EXISTS `expense_types` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expense_types`
--

INSERT INTO `expense_types` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(3, 'Food', 1, '2020-04-13 11:41:08', '2020-04-13 11:56:56'),
(9, 'Extra', 1, '2020-05-29 05:42:33', '2020-05-29 05:42:33'),
(10, 'test', 1, '2020-06-19 07:52:22', '2020-06-19 07:52:22');

-- --------------------------------------------------------

--
-- Table structure for table `leaves`
--

DROP TABLE IF EXISTS `leaves`;
CREATE TABLE IF NOT EXISTS `leaves` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `leave_type` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL,
  `leave_date` date NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `leave_stage` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `leaves`
--

INSERT INTO `leaves` (`id`, `user_id`, `leave_type`, `leave_date`, `description`, `created_at`, `updated_at`, `leave_stage`, `status`) VALUES
(1, 7, '2', '2003-07-13', 'Imogene Schroeder Sr.', '2020-04-15 13:07:44', '2020-04-15 13:07:44', '2', 1),
(2, 22, '3', '2014-09-22', 'Liana Schultz', '2020-04-15 13:07:44', '2020-04-15 13:07:44', '1', 1),
(4, 14, '3', '2001-04-11', 'Prof. Garfield Lehner', '2020-04-15 13:07:44', '2020-04-15 13:07:44', '2', 1),
(8, 8, '1', '2014-07-14', 'Mr. Jaquan Emard', '2020-04-15 13:07:44', '2020-04-15 13:07:44', '3', 1),
(9, 14, '3', '2000-07-01', 'Mr. Marlon Turcotte PhD', '2020-04-15 13:07:44', '2020-04-15 13:07:44', '1', 1),
(11, 8, '2', '1993-11-07', 'Ms. Imelda Christiansen', '2020-04-15 13:07:44', '2020-04-15 13:07:44', '3', 1),
(15, 8, '2', '2003-08-03', 'Kenya Maggio', '2020-04-15 13:07:44', '2020-04-15 13:07:44', '2', 1),
(16, 14, '1', '2010-02-16', 'Itzel Kunde', '2020-04-15 13:07:44', '2020-04-15 13:07:44', '1', 1),
(17, 28, '2', '1992-11-23', 'Prof. Durward Hane Jr.', '2020-04-15 13:07:44', '2020-04-15 13:07:44', '3', 1),
(18, 7, '2', '2016-09-06', 'Liam Tremblay', '2020-04-15 13:07:44', '2020-04-15 13:07:44', '3', 1),
(20, 27, '3', '2020-03-21', 'Amari Murphy', '2020-04-15 13:07:44', '2020-04-15 13:07:44', '3', 1),
(21, 6, '3', '2017-12-09', 'Prof. Hollis Gerlach MD', '2020-04-15 13:07:44', '2020-04-15 13:07:44', '2', 1),
(22, 27, '3', '2007-03-30', 'Reanna Boyer', '2020-04-15 13:07:44', '2020-04-15 13:07:44', '1', 1),
(23, 21, '2', '2005-04-02', 'Aurore Labadie Sr.', '2020-04-15 13:07:44', '2020-04-15 13:07:44', '1', 1),
(25, 24, '3', '2012-04-28', 'Yvette Schaefer', '2020-04-15 13:07:44', '2020-04-15 13:07:44', '3', 1),
(26, 7, '3', '2002-08-18', 'Dr. Nikko Weissnat', '2020-04-15 13:07:44', '2020-04-15 13:07:44', '3', 1),
(27, 19, '2', '2000-03-02', 'Muriel Bauch', '2020-04-15 13:07:44', '2020-04-15 13:07:44', '1', 1),
(29, 23, '2', '1993-03-16', 'Haleigh Borer', '2020-04-15 13:07:44', '2020-04-15 13:07:44', '1', 1),
(30, 26, '3', '1994-09-26', 'Annamae Hudson', '2020-04-15 13:07:44', '2020-04-15 13:07:44', '2', 1);

-- --------------------------------------------------------

--
-- Table structure for table `leave_stages`
--

DROP TABLE IF EXISTS `leave_stages`;
CREATE TABLE IF NOT EXISTS `leave_stages` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `leave_stages`
--

INSERT INTO `leave_stages` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Pending', NULL, NULL),
(2, 'Approved', NULL, NULL),
(3, 'Rejected', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `leave_type`
--

DROP TABLE IF EXISTS `leave_type`;
CREATE TABLE IF NOT EXISTS `leave_type` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leave_types`
--

DROP TABLE IF EXISTS `leave_types`;
CREATE TABLE IF NOT EXISTS `leave_types` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `leave_types`
--

INSERT INTO `leave_types` (`id`, `name`, `created_at`, `updated_at`, `status`) VALUES
(1, 'Casual Leave', NULL, NULL, 1),
(2, 'Medical Leave', NULL, NULL, 1),
(3, 'Paid Leave', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2017_10_15_162634_create_students_table', 1),
(4, '2019_01_07_065404_create_permission_tables', 1),
(5, '2019_04_13_224419_create_chats_table', 1),
(6, '2019_04_19_210718_create_settings_table', 1),
(7, '2020_04_08_192319_create_attendances_table', 1),
(8, '2020_04_08_192537_create_categories_table', 1),
(9, '2020_04_08_192625_create_cities_table', 1),
(10, '2020_04_08_192705_create_equipment_statuses_table', 1),
(11, '2020_04_08_192733_create_equipment_table', 1),
(12, '2020_04_08_192756_create_expense_types_table', 1),
(13, '2020_04_08_192819_create_expenses_table', 1),
(14, '2020_04_08_192838_create_leaves_table', 1),
(15, '2020_04_08_192856_create_skills_table', 1),
(16, '2020_04_08_192928_create_states_table', 1),
(17, '2020_04_08_192956_create_sub_categories_table', 1),
(18, '2020_04_08_193024_create_technician_details_table', 1),
(19, '2020_04_08_193043_create_technicians_table', 1),
(20, '2020_04_08_193140_create_user_type_permissions_table', 1),
(21, '2020_04_08_193155_create_user_types_table', 1),
(22, '2020_04_08_193218_create_vendors_table', 1),
(24, '2020_04_13_185126_create_accessories_table', 2),
(25, '2020_04_15_111401_add_photo_column_to_expense', 3),
(26, '2020_04_15_123236_add_user_id_to_expense', 4),
(27, '2020_04_15_173206_add_price_to_expense', 5),
(28, '2020_04_15_180611_add_leave_stages', 6),
(30, '2020_04_15_191822_create_leave_types_table', 7),
(31, '2020_04_15_192339_create_leave_stages_table', 8),
(32, '2020_04_15_230936_add_hour_attendence', 9),
(33, '2020_04_15_191349_create_leave_type', 10),
(34, '2020_04_15_23093611_add_hour_attendence', 11),
(35, '2020_04_16_020727_add_user_id_to_attendance', 12),
(37, '2020_04_16_133714_remove_column_from_aattendence', 13),
(38, '2020_04_16_134430_create_attendance_outs_table', 13),
(39, '2020_04_16_140329_add_column_user_id_table_attendance_out', 14),
(40, '2020_04_16_152142_add_workhour_column_attendance_out', 15),
(41, '2020_04_16_214821_remove_attendence_out_tablle', 16),
(43, '2020_04_16_215104_add_column_attendances', 17),
(44, '2020_04_16_221102_delete_column_time_in_from_table_attendences', 18),
(45, '2020_04_22_103855_create_works_table', 19),
(46, '2020_04_22_105549_create_vendor_jobs_table', 20);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\User', 32),
(1, 'App\\User', 33),
(1, 'App\\User', 36),
(1, 'App\\User', 37),
(2, 'App\\User', 3),
(3, 'App\\User', 1),
(3, 'App\\User', 7),
(4, 'App\\User', 31);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'edit posts', 'web', '2020-04-11 20:56:39', '2020-04-11 20:56:39'),
(2, 'view-settings', 'web', '2020-04-14 08:34:41', '2020-04-14 08:34:41'),
(3, 'view-settings-menu', 'web', '2020-04-14 08:35:15', '2020-04-14 08:35:15'),
(4, 'view-chat-menu', 'web', '2020-04-14 08:35:47', '2020-04-14 08:35:47'),
(5, 'view-roles-permission-menu', 'web', '2020-04-14 08:36:18', '2020-04-14 08:36:18'),
(6, 'view-users-menu', 'web', '2020-04-14 08:36:39', '2020-04-14 08:36:39'),
(7, 'view-vendor-menu', 'web', '2020-04-14 08:37:06', '2020-04-14 08:37:06'),
(8, 'view-expense-menu', 'web', '2020-04-14 08:38:26', '2020-04-14 08:38:26'),
(9, 'view-leave-menu', 'web', '2020-04-14 08:39:25', '2020-04-14 08:39:25'),
(10, 'view-attendence-menu', 'web', '2020-04-14 08:40:18', '2020-04-14 08:40:18'),
(11, 'admin-settings', 'web', '2020-04-14 08:41:07', '2020-04-14 08:41:07');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'web', '2020-04-11 14:59:11', '2020-04-11 14:59:11'),
(2, 'Office', 'web', '2020-04-11 14:59:19', '2020-04-11 14:59:19'),
(3, 'Technician', 'web', '2020-04-11 14:59:27', '2020-04-11 14:59:27'),
(4, 'Vendor', 'web', '2020-04-11 14:59:35', '2020-04-11 14:59:35');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

DROP TABLE IF EXISTS `skills`;
CREATE TABLE IF NOT EXISTS `skills` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `skills`
--

INSERT INTO `skills` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(7, 'Plumper', 1, '2020-04-11 18:02:37', '2020-04-11 19:13:46'),
(8, 'Technician', 1, '2020-04-11 18:21:33', '2020-04-11 19:13:33'),
(9, 'Ac Mechanics', 1, '2020-04-13 10:33:39', '2020-07-22 05:08:38');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
CREATE TABLE IF NOT EXISTS `states` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'kerala', 1, NULL, NULL),
(2, 'Thamilnadu', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
CREATE TABLE IF NOT EXISTS `students` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `full_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `father_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dob` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `students_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `user_id`, `full_name`, `email`, `father_name`, `address`, `dob`, `created_at`, `updated_at`) VALUES
(1, 1, 'nujoom', 'nujoom@gmail.com', 'nazar', 'sdsdfsdfsfsdds', '2020-04-11', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

DROP TABLE IF EXISTS `sub_categories`;
CREATE TABLE IF NOT EXISTS `sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `technicians`
--

DROP TABLE IF EXISTS `technicians`;
CREATE TABLE IF NOT EXISTS `technicians` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `phone1` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone2` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `technician_details`
--

DROP TABLE IF EXISTS `technician_details`;
CREATE TABLE IF NOT EXISTS `technician_details` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `technician_id` int(11) NOT NULL,
  `skill` int(11) NOT NULL,
  `status` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_picture` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `profile_picture`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Zoie Kunde', 'nujoom@gmail.com', '2020-04-11 10:58:57', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'default.png', 'dkXZikw8p1PNTf1nWkeleIe4kZd0at3wFFU5mLrjyPMjv55hUShLCvXbFv0u', '2020-04-11 10:58:57', '2020-04-11 10:58:57'),
(33, 'nujoom', 'dev@gmail.com', NULL, '$2y$10$lAMmULUR7edSCMBgUSrcDOlPhGeU641hKG8VhSbeVdkrPW6oCYgFa', 'nujoom-33.jpg', NULL, '2020-04-29 09:37:44', '2020-05-30 06:52:18'),
(7, 'Mr. Boyd Kreiger Sr.', 'tbogisich@example.org', '2020-04-11 10:58:57', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'default.png', NULL, '2020-04-11 10:58:57', '2020-04-11 10:58:57'),
(8, 'Oren Wolf IV', 'sasha99@example.com', '2020-04-11 10:58:57', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'default.png', NULL, '2020-04-11 10:58:57', '2020-04-11 10:58:57'),
(9, 'Gerardo Conroy', 'anahi.schuppe@example.org', '2020-04-11 10:58:57', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'default.png', NULL, '2020-04-11 10:58:57', '2020-04-11 10:58:57'),
(10, 'Suzanne West', 'maye.cormier@example.net', '2020-04-11 10:58:57', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'default.png', NULL, '2020-04-11 10:58:57', '2020-04-11 10:58:57'),
(12, 'Prof. Janessa McCullough', 'rocky.effertz@example.net', '2020-04-11 10:58:57', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'default.png', NULL, '2020-04-11 10:58:57', '2020-04-11 10:58:57'),
(13, 'Ms. Madaline Wintheiser', 'dax.kuhlman@example.org', '2020-04-11 10:58:57', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'default.png', NULL, '2020-04-11 10:58:57', '2020-04-11 10:58:57'),
(32, 'nujoom', 'admin@admin.com', NULL, '$2y$10$.ycdlJwn8dKllSio3oDuLOlTTgTb8xbvxdY5HzXIi2HCPdfiJpL2m', 'default.png', 'ig32UJg0qJx09h7d1rxNzlVgdowZcChKplNekCvHb8TwsIIBmIOw4QZfwvAn', '2020-04-13 21:06:17', '2020-04-13 21:06:17'),
(15, 'Travon Schoen', 'lebsack.lisette@example.org', '2020-04-11 10:58:57', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'default.png', NULL, '2020-04-11 10:58:57', '2020-04-11 10:58:57'),
(16, 'Mrs. Katheryn Carroll', 'pschultz@example.com', '2020-04-11 10:58:57', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'default.png', NULL, '2020-04-11 10:58:57', '2020-04-11 10:58:57'),
(17, 'Emily Wehner DVM', 'dare.emmalee@example.org', '2020-04-11 10:58:57', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'default.png', NULL, '2020-04-11 10:58:57', '2020-04-11 10:58:57'),
(18, 'Althea Hudson MD', 'kohler.albert@example.net', '2020-04-11 10:58:57', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'default.png', NULL, '2020-04-11 10:58:57', '2020-04-11 10:58:57'),
(19, 'Lila Fritsch DDS', 'heathcote.allie@example.org', '2020-04-11 10:58:57', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'default.png', NULL, '2020-04-11 10:58:57', '2020-04-11 10:58:57'),
(20, 'Mrs. Clarissa Schaefer IV', 'legros.sigmund@example.com', '2020-04-11 10:58:57', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'default.png', NULL, '2020-04-11 10:58:57', '2020-04-11 10:58:57'),
(21, 'Emery Glover', 'aron31@example.org', '2020-04-11 10:58:57', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'default.png', NULL, '2020-04-11 10:58:57', '2020-04-11 10:58:57'),
(22, 'Jefferey Langosh', 'dubuque.wallace@example.org', '2020-04-11 10:58:57', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'default.png', NULL, '2020-04-11 10:58:57', '2020-04-11 10:58:57'),
(23, 'Giovanny Rogahn', 'mswift@example.com', '2020-04-11 10:58:57', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'default.png', NULL, '2020-04-11 10:58:57', '2020-04-11 10:58:57'),
(24, 'Keely Brekke', 'hailee.gaylord@example.net', '2020-04-11 10:58:57', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'default.png', NULL, '2020-04-11 10:58:57', '2020-04-11 10:58:57'),
(25, 'Cicero Purdy', 'ukassulke@example.org', '2020-04-11 10:58:57', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'default.png', NULL, '2020-04-11 10:58:57', '2020-04-11 10:58:57'),
(26, 'Mrs. Camille Lehner Sr.', 'arely29@example.org', '2020-04-11 10:58:57', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'default.png', NULL, '2020-04-11 10:58:57', '2020-04-11 10:58:57'),
(27, 'Marquis Stoltenberg IV', 'aniyah53@example.net', '2020-04-11 10:58:57', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'default.png', NULL, '2020-04-11 10:58:57', '2020-04-11 10:58:57'),
(28, 'Marge Heathcote', 'alison83@example.com', '2020-04-11 10:58:57', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'default.png', NULL, '2020-04-11 10:58:57', '2020-04-11 10:58:57'),
(29, 'Autumn Rowe', 'jay.gerhold@example.org', '2020-04-11 10:58:57', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'default.png', NULL, '2020-04-11 10:58:57', '2020-04-11 10:58:57'),
(30, 'Beau Crist', 'mrunolfsdottir@example.com', '2020-04-11 10:58:57', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'default.png', NULL, '2020-04-11 10:58:57', '2020-04-11 10:58:57'),
(31, 'nujoom', 'misbah@gmail.com', NULL, '$2y$10$Y4u9nLbPIISyXT9lbCR05ugRjy7G/IPZl/dgf1PbNT0ACafGLXpYm', 'default.png', 'sqmJWydty2PpMFD8YRJz0WqbIzg2p1pHAjbqvshBuqHTsyKOwpMHv7KBli7p', '2020-04-11 17:45:42', '2020-04-14 08:43:22'),
(37, 'ansu', 'ansu@gmail.com', NULL, '$2y$10$pTnKqQI9diGDejWG49C2IeEPCDc7RjAND5FlO0dqOr8CZqGiBiJNS', 'ansu-37.jpg', 'BHVJTn4SxMaF9aejVeGui680SmccUAESz8gODBXjT1RWy8eVrjLl7jXHKqhn', '2020-07-22 04:46:27', '2020-07-23 07:07:40');

-- --------------------------------------------------------

--
-- Table structure for table `user_types`
--

DROP TABLE IF EXISTS `user_types`;
CREATE TABLE IF NOT EXISTS `user_types` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_type_permissions`
--

DROP TABLE IF EXISTS `user_type_permissions`;
CREATE TABLE IF NOT EXISTS `user_type_permissions` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_type` int(11) NOT NULL,
  `permission` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

DROP TABLE IF EXISTS `vendors`;
CREATE TABLE IF NOT EXISTS `vendors` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `person` varchar(180) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`id`, `name`, `person`, `street1`, `street2`, `city`, `zip`, `email1`, `email2`, `phone1`, `phone2`, `about`, `created_at`, `updated_at`, `status`, `state`) VALUES
(31, 'Mr. Agustin Blick', NULL, '6465 Tremblay Burg Apt. 314\nAdeletown, VT 62506', '12209 Jamir Knolls\nEloyhaven, NM 39254-5422', 'Port Ila', '16318-0722', 'nweissnat@example.com', 'oscar.morissette@example.org', '(971) 496-3485', '575-795-9466 x967', 'Fugit consequatur aut quia laborum. Omnis deleniti placeat id quae. Exercitationem sed animi quia.', '2020-06-02 12:30:29', '2020-06-02 12:30:29', 1, ''),
(32, 'Quentin Daniel', NULL, '54562 Arnaldo Courts\nJonesville, NJ 91559-3248', '5726 Orn Bypass Apt. 394\nBeahanport, NJ 36808', 'Port Derek', '59345-4959', 'sgrimes@example.org', 'isidro.friesen@example.com', '(698) 899-5683 x87743', '+1-240-932-9314', 'Perferendis sapiente soluta porro nostrum. Dolorem quia alias tempora dolor laboriosam explicabo. Id et quos quis voluptas nostrum. Reiciendis quia impedit aut qui rem.', '2020-06-02 12:30:29', '2020-06-02 12:30:29', 1, ''),
(33, 'Jose Schoen', NULL, '67928 Minnie Shores\nAlexandrinebury, OH 75992', '747 Ashlee Fork\nEast Krisview, PA 14380-3975', 'Port Marlon', '09585-9391', 'ichristiansen@example.org', 'moriah46@example.net', '775.795.6742 x90427', '587-481-0562', 'Sed neque dolor quia reprehenderit. Necessitatibus numquam similique ut.', '2020-06-02 12:30:29', '2020-06-02 12:30:29', 1, ''),
(34, 'Mrs. Anita McCullough', NULL, '992 Johnson Turnpike Apt. 967\nBrionnashire, NH 91352', '384 Torp Shores Apt. 869\nTorphyside, CA 63285-6405', 'Kozeyview', '25250', 'zwilkinson@example.net', 'odickens@example.com', '(250) 565-6748', '(323) 954-8696', 'Dolorum qui recusandae et omnis tenetur fuga voluptas. Quia nisi et veritatis culpa enim quod. Voluptatem ducimus molestias nisi qui natus sit deleniti accusantium. Debitis nobis labore ratione voluptatem impedit vitae harum.', '2020-06-02 12:30:29', '2020-06-02 12:30:29', 1, ''),
(35, 'Mr. Buster Langworth', NULL, '151 Stoltenberg Streets\nGradyhaven, MI 75018-6932', '263 Melyssa Pike\nWest Jaynemouth, MA 18608-2755', 'South Tiana', '86969-9156', 'tanner.bergstrom@example.net', 'serenity.rau@example.org', '957.266.5173 x25933', '236.637.5487', 'Facilis nulla nihil mollitia doloremque esse cumque facilis. Iusto alias omnis commodi id. Autem vel beatae voluptatum ut aut.', '2020-06-02 12:30:29', '2020-06-02 12:30:29', 1, ''),
(36, 'Prof. Dorthy Satterfield', NULL, '382 Stephan Track Apt. 258\nXandermouth, WV 09939-0535', '17336 Noble Heights Suite 878\nAndersonmouth, TX 47507-3398', 'North Kirsten', '56044-5237', 'jayme.schmitt@example.net', 'gbrekke@example.com', '+1-607-427-3218', '(656) 212-7076 x744', 'Cupiditate unde veniam sapiente eos accusantium explicabo. Aperiam autem qui voluptatem. Neque dolores aspernatur et sint.', '2020-06-02 12:30:29', '2020-06-02 12:30:29', 1, ''),
(37, 'Maureen Kuphal', NULL, '5671 McGlynn Union\nRatkeville, CA 62821-2389', '972 Treva Viaduct Suite 219\nCrawfordton, VT 37867-9922', 'East Rey', '72504', 'evie.greenfelder@example.com', 'ibeatty@example.net', '+1-392-481-8603', '581.413.2332', 'Quisquam enim aut ut officia ab. Aut eligendi eum sequi unde ducimus est qui. Rerum consectetur voluptatum distinctio temporibus asperiores.', '2020-06-02 12:30:29', '2020-06-02 12:30:29', 1, ''),
(39, 'Samanta Hahn', NULL, '6390 Witting Pines\nSonyaberg, VT 56341', '21253 Weldon Junction\nCarterport, VA 53269', 'Taniaport', '62378', 'tremblay.rita@example.org', 'cynthia.hane@example.net', '(403) 498-4856', '(775) 993-2315', 'Aperiam enim rerum laborum ut facilis cum. In temporibus iure qui eveniet beatae. Harum rerum vel ipsum repudiandae facilis. Numquam blanditiis incidunt qui sunt modi. Perspiciatis fugit omnis a.', '2020-06-02 12:30:29', '2020-06-02 12:30:29', 1, ''),
(40, 'Kristofer Mante', NULL, '10520 Harris Wall\nHerzogton, FL 51714-8438', '8919 Oswald Forks Suite 707\nNorth Earlinemouth, MS 90172-1403', 'Kuvalishaven', '95091', 'wyman.corine@example.com', 'elwin52@example.com', '226.649.3175 x01655', '832.226.7579', 'Voluptas fuga perferendis perferendis enim in sed. Qui id a et aut sed eligendi. Voluptatem vero veritatis quos provident tempore. Adipisci eligendi aut est alias.', '2020-06-02 12:30:29', '2020-06-02 12:30:29', 1, ''),
(41, 'Myah Heathcote', NULL, '26492 Purdy Roads Apt. 567\nWest Glendahaven, MT 77198', '286 Franecki Ferry Apt. 496\nSouth Domenickfort, SC 85977-2303', 'North Crystal', '80996', 'abigail06@example.com', 'waelchi.kraig@example.net', '(650) 524-8549 x50841', '+1-685-661-8601', 'Ut dolor aut consequuntur optio nihil. Quia et quibusdam omnis est. Voluptatum quo voluptatem recusandae iusto nihil quia non ipsum. Ad quibusdam quo et quisquam ut. Consectetur asperiores voluptatem saepe corporis.', '2020-06-02 12:30:29', '2020-06-02 12:30:29', 1, ''),
(42, 'Mrs. Helen Smith II', NULL, '5080 Hane Ville Suite 844\nOdellhaven, MI 76172-8947', '418 Kuhic Manors Apt. 612\nNorth Leonelville, OH 33411-2532', 'South Rosalynmouth', '71947-2214', 'kayli68@example.org', 'vern46@example.net', '1-806-251-4704', '905.393.5838', 'Voluptate voluptatem eos tempora aut aut. Corrupti qui est doloribus fugit. Molestiae id culpa placeat facilis id autem.', '2020-06-02 12:30:29', '2020-06-02 12:30:29', 1, ''),
(43, 'Prof. Petra Kub', NULL, '413 Spencer Ridge\nTanyaborough, RI 38755', '382 Evelyn Bypass\nDibbertview, MA 38775', 'North Marisol', '27866-5414', 'parisian.jonathan@example.org', 'asawayn@example.org', '371-212-4639 x16978', '+1 (385) 682-3721', 'Quia veritatis quo consequatur qui maiores. Et qui ut harum et et. Magnam minus dolor molestiae corporis. Assumenda vero est eius.', '2020-06-02 12:30:29', '2020-06-02 12:30:29', 1, ''),
(44, 'Isaias Grady Jr.', NULL, '258 Schumm Brooks Suite 661\nSchummburgh, AK 84484', '4873 Gavin Forest\nSchulistville, RI 67049', 'West Karen', '02923', 'emie26@example.com', 'fgreenfelder@example.com', '+1-209-462-9005', '328.429.5904', 'Accusantium facilis iure quibusdam ut. Fuga distinctio exercitationem corporis rerum. Est aliquid deleniti fugit hic magnam assumenda fugit. Sit totam est quia illo qui.', '2020-06-02 12:30:29', '2020-06-02 12:30:29', 1, ''),
(45, 'Jaclyn Flatley III', NULL, '66286 McGlynn Islands Apt. 595\nWest Nash, DC 76737', '30749 Halvorson Walks Suite 450\nVolkmanfurt, MA 11736-7936', 'Cochin', '24729-9513', 'wboehm@example.net', 'rcummings@example.com', '873-249-2976', '1-995-859-8165', 'Fuga iste aliquid facere dolorum qui. Voluptate eaque id autem eveniet. Voluptas ad quia quo cum aliquam.', '2020-06-02 12:30:29', '2020-07-22 12:54:33', 1, 'kerala'),
(46, 'Muhammad Blanda', NULL, '9242 Audrey Views\nRomaborough, MO 99862', '15932 Sporer Ports\nRickieborough, ND 57596-4923', 'East Aimeetown', '05655', 'erdman.kenya@example.org', 'langworth.angelica@example.org', '1-536-825-4722 x91152', '(970) 986-2305', 'Vel assumenda quo deleniti error placeat. Occaecati culpa et atque quod ut voluptatibus explicabo quia. Perspiciatis veniam distinctio necessitatibus. Ut dolor quasi qui aut dolor.', '2020-06-02 12:30:29', '2020-06-02 12:30:29', 1, ''),
(47, 'Helen Cummerata', NULL, '44165 Ephraim Orchard Apt. 526\nNorth Hayleyfurt, OR 81470-9079', '706 Annie Port Suite 004\nPort Nels, KS 19141-8318', 'East Margarete', '95687', 'mjones@example.net', 'lora.gusikowski@example.org', '+1-253-476-6751', '1-248-447-6425 x610', 'Nesciunt rem inventore velit mollitia vero fugit reiciendis. Corporis velit magni reiciendis ea velit impedit. Aut laudantium at expedita quis sint. Et at a eum explicabo qui.', '2020-06-02 12:30:29', '2020-06-02 12:30:29', 1, ''),
(49, 'Sherwood Sporer', NULL, '3594 Damaris Flat\nDickenston, OH 38567-4165', '644 Carlie Port Suite 430\nSouth Imaniland, DC 86506', 'Huelsview', '64243', 'webster04@example.net', 'kaleb.renner@example.com', '1-594-783-9835', '1-736-268-2049 x36104', 'Nobis molestiae facilis necessitatibus. Quis aut id debitis voluptatum ipsam vero sequi sit. Explicabo qui totam dolorum nesciunt.', '2020-06-02 12:30:29', '2020-06-02 12:30:29', 1, ''),
(50, 'Miss Katlyn Williamson', NULL, '46272 Swaniawski Streets\nHuelton, NM 27121-0533', '2539 Sauer Shoal Suite 390\nStammbury, MN 14048-1222', 'Port Elyseville', '67179-1323', 'carroll.nayeli@example.com', 'dheller@example.com', '+1.758.502.1127', '(260) 817-4405 x69821', 'Non dicta quia eos. Magnam non accusantium totam et et debitis porro. Deserunt ipsum magnam impedit ullam quidem.', '2020-06-02 12:30:29', '2020-06-02 12:30:29', 1, ''),
(51, 'Lurline Eichmann', NULL, '274 Renner Way Apt. 696\nLake Shaniashire, IN 32279-1143', '692 Turcotte Spur Apt. 203\nZboncakton, RI 22740', 'East Freda', '47239', 'pkutch@example.org', 'vincenzo.stracke@example.com', '379-242-9383', '1-882-414-7973 x3883', 'Quibusdam qui nihil sit rem. In quia molestias temporibus exercitationem voluptates assumenda. Adipisci cupiditate at tempora aliquam amet et quidem. Nulla atque praesentium quisquam dolore voluptatem sint voluptatem.', '2020-06-02 12:30:29', '2020-06-02 12:30:29', 1, ''),
(52, 'Lenny Johnson', NULL, '6866 Hintz Lodge Suite 404\nHillston, GA 39847', '4254 Moshe Meadow Apt. 320\nRempeltown, DC 72788-2797', 'New Geraldineburgh', '54220', 'cdickens@example.org', 'hickle.albertha@example.com', '(536) 714-7378', '330.976.2804', 'Iste non corporis est suscipit. Facilis quia at minus totam labore quia ab. Molestias asperiores fugiat voluptas vitae ab est sed. Nemo ipsam rerum ratione accusamus. Et itaque ut a.', '2020-06-02 12:30:29', '2020-06-02 12:30:29', 1, ''),
(53, 'Cletus Thompson', NULL, '2969 Santos Ramp\nWest Deonteside, LA 40968-4114', '71280 Stracke Harbor Apt. 671\nCollierland, WV 76819-1218', 'Port Stanleyborough', '50637', 'hhill@example.org', 'elna38@example.org', '1-709-517-7846', '1-785-721-4123 x3073', 'Dolor eius quam eaque error tempore sequi. Sit odit nihil omnis enim vero laboriosam accusantium. At sed assumenda perferendis. Sint possimus odio autem.', '2020-06-02 12:30:29', '2020-06-02 12:30:29', 1, ''),
(55, 'Tyra Ruecker V', NULL, '913 Lauriane Unions Suite 677\nPort Bradford, KS 49726-7357', '925 Mueller Orchard\nNew Otho, ND 24837', 'Cassinfort', '74626-2580', 'josue95@example.net', 'ikris@example.org', '+1-881-413-1853', '+1.303.759.7095', 'Sit accusantium et nam et. Ut neque sunt dolor aut aut maxime. Sint illum eos unde tempora eligendi eveniet minus.', '2020-06-02 12:30:29', '2020-06-02 12:30:29', 1, ''),
(56, 'Mr. Angel Hauck', NULL, '6875 Lavern Station\nSouth Ken, OK 25557', '1887 Altenwerth Parkways\nEast Moriah, ME 68658', 'Berylbury', '93756', 'gjaskolski@example.org', 'winona.maggio@example.net', '243-263-6624 x9754', '789.892.2592 x0076', 'Ea earum laborum nihil culpa voluptatum veritatis iste maiores. Ut neque quaerat omnis laudantium perferendis eum voluptas qui. Occaecati numquam voluptates quia eum. Sed alias omnis ut recusandae qui.', '2020-06-02 12:30:29', '2020-06-02 12:30:29', 1, ''),
(89, 'TECHSERVE', 'ANSU', '1', '2', 'Trivandrum', 'hello', 'ansu@gmail.com', 'ansu@gmail.com', '5689784512', '8956451247', 'goo', '2020-07-21 11:46:06', '2020-07-21 11:46:06', 1, 'kerala'),
(90, 'ravo', 'viveka', '1', '2', 'Cochin', 'helloo', 'viveka@gmail.com', 'viveka@gmail.com', '8945781542', '9545785214', 'hiii', '2020-07-21 11:48:18', '2020-07-21 11:48:18', 1, 'kerala'),
(60, 'Lambert Hilpert', NULL, '883 Laverne Ridge\nLynchfort, LA 24039-2734', '771 Jayne Mount\nCruzbury, OH 04149-3165', 'DuBuquehaven', '99657-7258', 'rkessler@example.net', 'stephan.pagac@example.org', '+14159696330', '849.842.9184 x63016', 'Eaque cupiditate possimus quam itaque. Dolorum ex veritatis et est ut et. Unde velit magnam facere omnis aliquid quia.', '2020-06-02 12:30:29', '2020-06-02 12:30:29', 1, ''),
(63, 'Techserve', NULL, 'V.Y.Manzil, h/no:13/145, Panayappilly, Kochin-682002', 'Panayappilyy Near By Malam Parambu Palli', 'Cochin', '682002', 'nujoom@gmail.com', 'nujoom1@gmail.com', '+919809036628', '+919809036628', 'Test', '2020-06-19 09:38:42', '2020-06-19 09:38:42', 1, 'kerala'),
(64, 'asasas', NULL, 'V.Y.Manzil, h/no:13/145, Panayappilly, Kochin-682002', 'Panayappilyy Near By Malam Parambu Palli', 'Cochin', '682002', 'nujoomva@gmail.com', 'nujoomva@gmail.com', '+91980903628', '+919809036628', 'asdaasas', '2020-06-19 09:49:33', '2020-07-23 06:40:43', 1, 'kerala'),
(81, 'sdfdsf', NULL, 'V.Y.Manzil, h/no:13/145, Panayappilly, Kochin-682002', 'Panayappilyy Near By Malam Parambu Palli', 'Cochin', '682002', 'sdfds@gmail.com', 'sdfsf@gmail.com', '+919809036628', '+9809036628', 'asdadsa', '2020-06-19 10:36:31', '2020-06-19 10:36:31', 1, 'kerala'),
(86, 'TechServe', 'Nujoom', 'V.Y.Manzil, h/no:13/145, Panayappilly, Kochin-682002', 'Panayappilyy Near By Malam Parambu Palli', 'Trivandrum', '682002', 'Nujoomnazar@gmail.com', 'text-xs-', '+919809036628', '+919809036628', 'Thus uis', '2020-06-19 10:52:03', '2020-06-19 10:52:03', 1, 'kerala'),
(92, 'revaccc', 'edwi', 'parijatham 1', '2', 'Chennai', 'hii', 'edwi@gmail.com', 'edwi@gmail.com', '7858962545', '9856251458', 'good', '2020-07-22 10:22:00', '2020-07-22 12:48:41', 1, 'Thamilnadu');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_jobs`
--

DROP TABLE IF EXISTS `vendor_jobs`;
CREATE TABLE IF NOT EXISTS `vendor_jobs` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contract_type` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `sub_category` int(11) NOT NULL,
  `address` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expected_time` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `problem` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `job_type` int(11) NOT NULL,
  `technician_id` int(11) NOT NULL,
  `priority` int(11) NOT NULL,
  `area` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `town` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `instruction` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `bill_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bill_date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reseller` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reseller_other` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `other_reseller` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(11) NOT NULL,
  `spec` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `serial_num` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `asistant_time` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `accessories` int(11) NOT NULL,
  `charges` int(11) NOT NULL,
  `convert_status` tinyint(4) NOT NULL DEFAULT 1,
  `created_by` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `works`
--

DROP TABLE IF EXISTS `works`;
CREATE TABLE IF NOT EXISTS `works` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contract_type` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `sub_category` int(11) NOT NULL,
  `address` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expected_time` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `problem` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `job_type` int(11) NOT NULL,
  `technician_id` int(11) NOT NULL,
  `priority` int(11) NOT NULL,
  `area` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `town` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `instruction` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `asistant_time` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vendor_job` int(11) NOT NULL,
  `accessories_amount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `charges` int(11) NOT NULL,
  `accessories_charge` int(11) NOT NULL,
  `technicnian_instruction` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `technician_charge` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `technician_amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
