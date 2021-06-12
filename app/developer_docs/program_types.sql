-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 11, 2021 at 12:34 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `earthface_todo`
--

-- --------------------------------------------------------

--
-- Table structure for table `program_types`
--

CREATE TABLE `program_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `program_types`
--

INSERT INTO `program_types` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'সদস্য বৈঠক', '2020-04-02 11:29:02', NULL),
(2, 'সদস্য স্টাডি সার্কেল', '2020-04-02 11:29:02', NULL),
(3, 'সাথী পাঠচক্র', '2020-04-02 11:29:02', NULL),
(4, 'শাখা সেক্রেটারিয়েট বৈঠক', '2020-04-02 11:29:02', NULL),
(5, 'নিয়মিত কন্টাক্ট', '2020-04-02 11:29:02', NULL),
(6, 'জনশক্তি যোগাযোগ', '2020-04-02 11:29:02', NULL),
(7, 'সদস্য শিক্ষাশিবির', '2020-04-02 11:29:02', NULL),
(8, 'সদস্য শিক্ষাবৈঠক', '2020-04-02 11:29:02', NULL),
(9, 'সাথী শিক্ষাশিবির', '2020-04-02 11:29:02', NULL),
(10, 'সাথী শিক্ষাবৈঠক', '2020-04-02 11:29:02', NULL),
(11, 'কর্মী শিক্ষাশিবির', '2020-04-02 11:29:02', NULL),
(12, 'কর্মী শিক্ষাবৈঠক', '2020-04-02 11:29:02', NULL),
(13, 'মেধাবী সংবর্ধনা', '2020-04-02 11:29:02', NULL),
(14, 'সদস্য সমাবেশ', '2020-04-02 11:29:02', NULL),
(15, 'সাথী সমাবেশ', '2020-04-02 11:29:02', NULL),
(16, 'কর্মী সমাবেশ', '2020-04-02 11:29:02', NULL),
(17, 'সেটআপ প্রোগ্রাম', '2020-04-02 11:29:02', NULL),
(18, 'দিবস পালন', '2020-04-02 11:29:02', NULL),
(19, 'বিশেষ সফর', '2020-04-02 11:29:02', NULL),
(20, 'ব্যক্তিগত ছুটি', '2020-04-02 11:29:02', NULL),
(21, 'অন্যান্য', '2020-04-02 11:29:02', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `program_types`
--
ALTER TABLE `program_types`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `program_types`
--
ALTER TABLE `program_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
