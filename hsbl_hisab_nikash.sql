-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 08, 2021 at 11:26 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hsbl_hisab_nikash`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `user_id`, `country_id`, `city_id`, `name`, `address1`, `address2`, `country_name`, `city_name`, `zip_code`, `phone`, `mobile`, `comment`, `creator`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 4, 1, 1, 'mr. user', 'bosurhat, companigonj, noakhali, bangladesh', NULL, 'bangladesh', 'dhaka', '85412', '985632', '+880 198125632', 'good user', '1', 'active', 1, '2021-06-08 15:18:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `altitude` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `zip_code`, `country`, `city`, `latitude`, `longitude`, `altitude`, `creator`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(914, NULL, NULL, 'Bangladesh', 'Dhaka', '23.7230556', '90.4086075', '4', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(915, NULL, NULL, 'Bangladesh', 'Chittagong', '22.3330556', '91.8363876', '7', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(916, NULL, NULL, 'Bangladesh', 'Khulna', '22.8', '89.5500031', '9', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(917, NULL, NULL, 'Bangladesh', 'Rajshahi', '24.3666667', '88.5999985', '31', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(918, NULL, NULL, 'Bangladesh', 'Comilla', '23.4577778', '91.2044449', '12', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(919, NULL, NULL, 'Bangladesh', 'Tungi', '23.89', '90.4058304', '4', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(920, NULL, NULL, 'Bangladesh', 'Mymensingh', '24.75', '90.4000015', '17', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(921, NULL, NULL, 'Bangladesh', 'Rangpur', '25.75', '89.25', '36', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(922, NULL, NULL, 'Bangladesh', 'Narsingdi', '23.9208333', '90.7180557', '4', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(923, NULL, NULL, 'Bangladesh', 'Jessore', '23.1666667', '89.2166672', '15', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(924, NULL, NULL, 'Bangladesh', 'Sylhet', '24.8966667', '91.871666', '9', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(925, NULL, NULL, 'Bangladesh', 'Narayanganj', '23.6233333', '90.5011139', '4', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(926, NULL, NULL, 'Bangladesh', 'Dinajpur', '25.6333333', '88.6333313', '35', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(927, NULL, NULL, 'Bangladesh', 'Barisal', '22.7019444', '90.371109', '2', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(928, NULL, NULL, 'Bangladesh', 'Saidpur', '25.7776918', '88.8916931', '36', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(929, NULL, NULL, 'Bangladesh', 'Par Naogaon', '24.8', '88.9499969', '14', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(930, NULL, NULL, 'Bangladesh', 'Tangail', '24.25', '89.9166641', '13', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(931, NULL, NULL, 'Bangladesh', 'Jamalpur', '24.9166667', '89.9333344', '12', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(932, NULL, NULL, 'Bangladesh', 'Sirajganj', '24.45', '89.7166672', '13', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(933, NULL, NULL, 'Bangladesh', 'Nawabganj', '24.6', '88.2833328', '21', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(934, NULL, NULL, 'Bangladesh', 'Pabna', '24', '89.25', '8', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(935, NULL, NULL, 'Bangladesh', 'Kushtia', '23.9166667', '89.1166687', '26', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(936, NULL, NULL, 'Bangladesh', 'Satkhira', '22.7166667', '89.0999985', '14', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(937, NULL, NULL, 'Bangladesh', 'Faridpur', '23.6', '89.8333359', '11', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(938, NULL, NULL, 'Bangladesh', 'Sherpur', '25.0166667', '90.0166702', '14', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(939, NULL, NULL, 'Bangladesh', 'Bhairab Bazar', '24.0666667', '90.9666672', '16', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(940, NULL, NULL, 'Bangladesh', 'Shahzadpur', '24.1666667', '89.5999985', '17', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(941, NULL, NULL, 'Bangladesh', 'Bhola', '22.6833333', '90.6500015', '1', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(942, NULL, NULL, 'Bangladesh', 'Kishorganj', '24.4333333', '90.7666702', '10', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(943, NULL, NULL, 'Bangladesh', 'Habiganj', '24.3833333', '91.4166641', '6', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(944, NULL, NULL, 'Bangladesh', 'Madaripur', '23.1752778', '90.207222', '9999', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(945, NULL, NULL, 'Bangladesh', 'Feni', '23.0186111', '91.4100037', '5', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(946, NULL, NULL, 'Bangladesh', 'Laksham', '23.2472222', '91.1425018', '10', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(947, NULL, NULL, 'Bangladesh', 'Ishurdi', '24.1333333', '89.0833359', '30', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(948, NULL, NULL, 'Bangladesh', 'Sarishabari', '24.7333333', '89.8333359', '9', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(949, NULL, NULL, 'Bangladesh', 'Netrakona', '24.8833333', '90.7166672', '2', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(950, NULL, NULL, 'Bangladesh', 'Jaipur Hat', '25.1', '89.0166702', '29', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(951, NULL, NULL, 'Bangladesh', 'Thakurgaon', '26.0333333', '88.4666672', '37', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(952, NULL, NULL, 'Bangladesh', 'Palang', '23.2166667', '90.3499985', '5', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(953, NULL, NULL, 'Bangladesh', 'Lalmanir Hat', '25.9', '89.4499969', '32', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(954, NULL, NULL, 'Bangladesh', 'Raipur', '23.05', '90.7666702', '3', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(955, NULL, NULL, 'Bangladesh', 'Tungipara', '22.9', '89.9166641', '6', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(956, NULL, NULL, 'Bangladesh', 'Lakshmipur', '22.95', '90.8333359', '2', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(957, NULL, NULL, 'Bangladesh', 'Kaptaimukh', '22.4713889', '92.2322235', '18', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(958, NULL, NULL, 'Bangladesh', 'Moulvi Bazar', '24.4833333', '91.7833328', '13', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(959, NULL, NULL, 'Bangladesh', 'Ramganj', '23.1', '90.8499985', '3', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(960, NULL, NULL, 'Bangladesh', 'Narail', '23.1666667', '89.5', '14', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(961, NULL, NULL, 'Bangladesh', 'Pirojpur', '22.5666667', '89.9833298', '3', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(962, NULL, NULL, 'Bangladesh', 'Sandwip', '22.4677778', '91.4561081', '6', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(963, NULL, NULL, 'Bangladesh', 'Satkania', '22.0755556', '92.0513916', '6', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(964, NULL, NULL, 'Bangladesh', 'Patiya', '22.2947222', '91.9791641', '7', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(965, NULL, NULL, 'Bangladesh', 'Khagrachari', '23.1', '91.9666672', '48', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(966, NULL, NULL, 'Bangladesh', 'Chilmari', '25.55', '89.7166672', '18', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(967, NULL, NULL, 'Bangladesh', 'Nageswari', '25.9666667', '89.7166672', '40', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(968, NULL, NULL, 'Bangladesh', 'Panchagarh', '26.3333333', '88.5666656', '59', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(969, NULL, NULL, 'Bangladesh', 'Dakshin Char Fasson', '22.2166667', '90.7333298', '2', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(970, NULL, NULL, 'Bangladesh', 'Parbatipur', '25.65', '88.9166641', '30', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(971, NULL, NULL, 'Bangladesh', 'Barahanuddin', '22.5', '90.7166672', '2', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(972, NULL, NULL, 'Bangladesh', 'Kaliganj', '23.4166667', '89.1333313', '24', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(973, NULL, NULL, 'Bangladesh', 'Dohar', '23.5883333', '90.1469421', '4', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(974, NULL, NULL, 'Bangladesh', 'Hajiganj', '23.2511111', '90.859169', '4', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(975, NULL, NULL, 'Bangladesh', 'Abhaynagar', '23.0166667', '89.4666672', '16', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(976, NULL, NULL, 'Bangladesh', 'Lalmohan', '22.3166667', '90.7166672', '1', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(977, NULL, NULL, 'Bangladesh', 'Jhikergacha', '23.1166667', '89.1166687', '11', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(978, NULL, NULL, 'Bangladesh', 'Mirzapur', '24.1', '90.0999985', '16', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(979, NULL, NULL, 'Bangladesh', 'Sakhipur', '24.3', '90.1833344', '19', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(980, NULL, NULL, 'Bangladesh', 'Teknaf', '20.8666667', '92.3000031', '9999', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(981, NULL, NULL, 'Bangladesh', 'Gaurnadi', '22.9666667', '90.2333298', '2', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(982, NULL, NULL, 'Bangladesh', 'Kalia', '23.05', '89.6333313', '14', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(983, NULL, NULL, 'Bangladesh', 'Bera', '24.0833333', '89.6166687', '20', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(984, NULL, NULL, 'Bangladesh', 'Mehendiganj', '22.8166667', '90.5333328', '2', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(985, NULL, NULL, 'Bangladesh', 'Chhagalnaiya', '23.03', '91.5069427', '8', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(986, NULL, NULL, 'Bangladesh', 'Chhatak', '25.0333333', '91.6666641', '6', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(987, NULL, NULL, 'Bangladesh', 'Nalchiti', '22.6333333', '90.2833328', '2', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(988, NULL, NULL, 'Bangladesh', 'Bheramara', '24.0333333', '88.9666672', '8', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(989, NULL, NULL, 'Bangladesh', 'Phultala', '22.7', '89.5166702', '9', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(990, NULL, NULL, 'Bangladesh', 'Baniachang', '24.5166667', '91.3666687', '4', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(991, NULL, NULL, 'Bangladesh', 'Sarankhola', '22.3', '89.7833328', '1', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(992, NULL, NULL, 'Bangladesh', 'Shibganj', '24.6833333', '88.1666641', '17', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(993, NULL, NULL, 'Bangladesh', 'Pirganj', '25.8666667', '88.3666687', '35', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(994, NULL, NULL, 'Bangladesh', 'Bajitpur', '24.2166667', '90.9499969', '10', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(995, NULL, NULL, 'Bangladesh', 'Char Bhadrasan', '23.3166667', '90.2166672', '4', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(996, NULL, NULL, 'Bangladesh', 'Gafargaon', '24.4333333', '90.5666656', '13', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(997, NULL, NULL, 'Bangladesh', 'Fatikchari', '22.6883333', '91.7908325', '9', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(998, NULL, NULL, 'Bangladesh', 'Badarganj', '25.6666667', '89.0500031', '32', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(999, NULL, NULL, 'Bangladesh', 'Bandarban', '22.1980556', '92.2197189', '10', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(1000, NULL, NULL, 'Bangladesh', 'Nabinagar', '23.8916667', '90.9733353', '3', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(1001, NULL, NULL, 'Bangladesh', 'Morrelganj', '22.4666667', '89.8499985', '1', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(1002, NULL, NULL, 'Bangladesh', 'Kesabpur', '22.9166667', '89.2166672', '14', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(1003, NULL, NULL, 'Bangladesh', 'Bhandaria', '22.4833333', '90.0666656', '2', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(1004, NULL, NULL, 'Bangladesh', 'Mathbaria', '22.3', '89.9499969', '7', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(1005, NULL, NULL, 'Bangladesh', 'Raojan', '22.5383333', '91.9147186', '7', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(1006, NULL, NULL, 'Bangladesh', 'Manikchhari', '22.8625', '91.8450012', '42', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13'),
(1007, NULL, NULL, 'Bangladesh', 'Muktagacha', '24.7666667', '90.2333298', '23', NULL, NULL, 1, '2021-06-08 15:18:13', '2021-06-08 15:18:13');

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `tin` int(11) DEFAULT NULL,
  `creator` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `user_id`, `name`, `address1`, `address2`, `country_id`, `tin`, `creator`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 4, 'user', 'bosurhat, companigonj, noakhali, bangladesh', NULL, 1, 85412, '1', 'active', 1, '2021-06-08 15:18:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lat` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lng` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dial_code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_symbol` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `expense_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double NOT NULL,
  `file` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `employee_id`, `expense_type`, `date`, `amount`, `file`, `description`, `creator`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 4, 'deposit', '2021-06-10', 3434, 'uploads/voucher/Q6GNcWFL6VcVr3DcnFOgSYwwtAomPDAQxvuWQmfO.png', 'fsdfadsf', '2', '1560bfd616edf71', 1, '2021-06-08 16:52:59', '2021-06-08 20:41:58'),
(2, 4, 'expense', '2021-06-09', 300, 'uploads/voucher/9HOXRORBTo1KP56C41F5tSW9NzHrUhhCU3NovlCO.png', 'for tea and cofee', '4', '2560bfc52b10bf4', 1, '2021-06-08 19:29:46', '2021-06-08 19:29:47'),
(3, 4, 'expense', '2021-06-09', 300, 'uploads/voucher/LRV7l59XcOvK6NLMVJmmAeYAyR0x5kse9q6JskP2.png', 'for tea and cofee', '4', '3560bfc57ed7332', 1, '2021-06-08 19:31:10', '2021-06-08 19:31:10');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `name`, `creator`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'dummy_products/1.jpg', '1', NULL, 1, '2021-06-08 15:18:14', NULL),
(2, 'dummy_products/2.jpg', '1', NULL, 1, '2021-06-08 15:18:14', NULL),
(3, 'dummy_products/3.jpg', '1', NULL, 1, '2021-06-08 15:18:14', NULL),
(4, 'dummy_products/4.jpg', '1', NULL, 1, '2021-06-08 15:18:14', NULL),
(5, 'dummy_products/5.jpg', '1', NULL, 1, '2021-06-08 15:18:14', NULL),
(6, 'dummy_products/6.jpg', '1', NULL, 1, '2021-06-08 15:18:14', NULL),
(7, 'dummy_products/7.jpg', '1', NULL, 1, '2021-06-08 15:18:14', NULL),
(8, 'dummy_products/8.jpg', '1', NULL, 1, '2021-06-08 15:18:14', NULL),
(9, 'dummy_products/9.jpg', '1', NULL, 1, '2021-06-08 15:18:14', NULL),
(10, 'dummy_products/10.jpg', '1', NULL, 1, '2021-06-08 15:18:14', NULL),
(11, 'dummy_products/11.jpg', '1', NULL, 1, '2021-06-08 15:18:14', NULL),
(12, 'dummy_products/12.jpg', '1', NULL, 1, '2021-06-08 15:18:14', NULL),
(13, 'dummy_products/13.jpg', '1', NULL, 1, '2021-06-08 15:18:14', NULL),
(14, 'dummy_products/14.jpg', '1', NULL, 1, '2021-06-08 15:18:14', NULL),
(15, 'dummy_products/15.jpg', '1', NULL, 1, '2021-06-08 15:18:14', NULL),
(16, 'dummy_products/16.jpg', '1', NULL, 1, '2021-06-08 15:18:14', NULL),
(17, 'dummy_products/17.jpg', '1', NULL, 1, '2021-06-08 15:18:14', NULL),
(18, 'dummy_products/18.jpg', '1', NULL, 1, '2021-06-08 15:18:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_03_04_082108_create_user_roles_table', 1),
(5, '2021_03_10_064759_create_countries_table', 1),
(6, '2021_03_10_064949_create_companies_table', 1),
(7, '2021_03_10_065150_create_cities_table', 1),
(8, '2021_03_10_065241_create_addresses_table', 1),
(9, '2021_03_10_071228_create_images_table', 1),
(10, '2021_03_10_071531_create_statuses_table', 1),
(11, '2021_03_10_072835_create_notifications_table', 1),
(12, '2021_03_10_072953_create_settings_table', 1),
(13, '2021_06_08_211350_create_expenses_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `description`, `creator`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, 'new expense voucher added by\n            Mr. test user\n            amount: 300 \n\n            description: for tea and cofee \n\n        ', NULL, NULL, 1, '2021-06-08 19:29:47', '2021-06-08 19:29:47'),
(2, NULL, 'new expense voucher added by\n            Mr. test user\n            amount: 300 \n\n            description: for tea and cofee \n\n        ', NULL, NULL, 1, '2021-06-08 19:31:10', '2021-06-08 19:31:10'),
(3, NULL, 'new expense voucher added by\n            Mr. test user\n            amount: 500 \n\n            description: expense for it balu cement \n\n        ', NULL, NULL, 1, '2021-06-08 19:35:54', '2021-06-08 19:35:54'),
(4, NULL, 'new expense voucher added by\n            Mr. test user\n            amount: 200 \n\n            description: mosla pati \n\n        ', NULL, NULL, 1, '2021-06-08 19:48:06', '2021-06-08 19:48:06');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `logo1` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo2` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo3` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `watermark_logo` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `map` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `logo1`, `logo2`, `logo3`, `watermark_logo`, `address`, `city`, `zip_code`, `map`, `creator`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'logo1.png', 'logo1.png', 'logo1.png', 'logo1.png', 'sonirakhra, jatrabari, dhaka-1204, bangladesh', 'dhaka', '1204', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3653.066058198636!2d90.4320398653886!3d23.709334946259837!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755b9a7bb6d225b%3A0xa34a29dda3223421!2sPacific%20Diagnostic%20Center%20%26Consultation%20Center%2037%20%2CSohid%20Faruq%20Road%2CJatrabari%2CDhaka-1204!5e0!3m2!1sen!2sbd!4v1618053406462!5m2!1sen!2sbd\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\"></iframe>', '1', 'active', 1, '2021-06-08 15:18:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

CREATE TABLE `statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serial` int(11) DEFAULT NULL,
  `creator` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `statuses`
--

INSERT INTO `statuses` (`id`, `name`, `serial`, `creator`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'active', 1, '1', 'active', 1, '2021-06-08 15:18:14', NULL),
(2, 'pending', 2, '1', 'pending', 1, '2021-06-08 15:18:14', NULL),
(3, 'processing', 3, '1', 'processing', 1, '2021-06-08 15:18:14', NULL),
(4, 'shipping', 4, '1', 'shipping', 1, '2021-06-08 15:18:14', NULL),
(5, 'delivered', 5, '1', 'delivered', 1, '2021-06-08 15:18:14', NULL),
(6, 'canceled', 6, '1', 'canceled', 1, '2021-06-08 15:18:14', NULL),
(7, 'draft', 7, '1', 'draft', 1, '2021-06-08 15:18:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` int(11) NOT NULL DEFAULT 4,
  `telegram_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telegram_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sakha_name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_theme` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website_theme` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `telegram_id`, `telegram_name`, `first_name`, `last_name`, `username`, `sakha_name`, `photo`, `phone`, `email`, `address`, `admin_theme`, `website_theme`, `email_verified_at`, `password`, `creator`, `slug`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL, 'Mr.Super', 'Admin', 'super_admin', NULL, 'avatar.png', '+880 123654789', 'superadmin@gmail.com', NULL, 'theme2', 'light', NULL, '$2y$10$YyzGebP62cyw2ZaSP67N.eKSfwJJ7IKiJfdT7.vI7w3k6ZjkmZGPG', NULL, 'super_admin', 1, NULL, '2021-06-08 15:18:10', '2021-06-08 15:18:10'),
(2, 2, NULL, NULL, 'mr', 'hsblco', 'hsblco', NULL, 'avatar.png', '123456', 'admin@gmail.com', NULL, 'theme9', 'light', NULL, '$2y$10$GWln9n3huY5RPZBecECwR.B7UiCcVpfR23lb/MdggjdhyImTVg.Ka', NULL, 'admin', 1, NULL, '2021-06-08 15:18:10', '2021-06-08 18:27:12'),
(3, 3, NULL, NULL, 'Mr. test', 'modarator', 'modarator', NULL, 'avatar.png', '+880 123654789', 'modarator@gmail.com', NULL, 'theme8', 'light', NULL, '$2y$10$HYzLBNqcVA5JXXwEqTXpb.n2aUUu/KQZCuVF0HaVnXWuvcCvaZ5tS', NULL, 'modarator', 1, NULL, '2021-06-08 15:18:10', '2021-06-08 15:18:10'),
(4, 4, NULL, NULL, 'Mr.', 'abul kasem', 'user', NULL, 'avatar.png', '+880 123654789', 'user@gmail.com', NULL, NULL, NULL, NULL, '$2y$10$ri3GCoah0QmdQX8tfoosMenKnyp1PMfEZXQDs8s2znrwqLla8JrpK', NULL, 'user', 1, NULL, '2021-06-08 15:18:11', '2021-06-08 20:01:46'),
(5, 5, NULL, NULL, 'Mr. test', 'subscriber', 'subscriber', NULL, 'avatar.png', '+880 123654789', 'subscriber@gmail.com', NULL, NULL, NULL, NULL, '$2y$10$Vk9DH5AMh.yslrwunWje7ucvjyT6suS.4ZGjagFta9bpXwmyfTR7O', NULL, 'subscriber', 1, NULL, '2021-06-08 15:18:11', '2021-06-08 15:18:11'),
(6, 4, NULL, NULL, 'test user', 'last name', 'yes_no', NULL, NULL, NULL, 'user2@gmail.com', NULL, NULL, NULL, NULL, '$2y$10$YQSogKcT768.JtDlwjFoMONe7IvGf4fqtpJdm2ZGdTr1CjuSZJZXG', NULL, NULL, 0, NULL, '2021-06-08 20:58:26', '2021-06-08 21:18:16');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serial` int(11) DEFAULT NULL,
  `creator` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`id`, `name`, `serial`, `creator`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'super_admin', 1, NULL, 'super_admin', 1, '2021-06-08 15:18:11', '2021-06-08 15:18:11'),
(2, 'admin', 2, NULL, 'admin', 1, '2021-06-08 15:18:11', '2021-06-08 15:18:11'),
(3, 'modarator', 3, NULL, 'modarator', 1, '2021-06-08 15:18:11', '2021-06-08 15:18:11'),
(4, 'user', 4, NULL, 'user', 1, '2021-06-08 15:18:11', '2021-06-08 15:18:11'),
(5, 'subscriber', 5, NULL, 'subscriber', 1, '2021-06-08 15:18:11', '2021-06-08 15:18:11'),
(6, 'sakha', 6, NULL, 'sakha', 1, '2021-06-08 15:18:11', '2021-06-08 15:18:11'),
(7, 'guest', 7, NULL, 'guest', 1, '2021-06-08 15:18:11', '2021-06-08 15:18:11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1008;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `statuses`
--
ALTER TABLE `statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
