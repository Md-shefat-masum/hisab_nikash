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
-- Table structure for table `sec_lists`
--

CREATE TABLE `sec_lists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duty` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sec_lists`
--

INSERT INTO `sec_lists` (`id`, `name`, `duty`, `created_at`, `updated_at`) VALUES
(1, 'রাজিবুর রহমান', 'কেন্দ্রীয় দপ্তর সম্পাদক', '2021-02-20 06:34:18', NULL),
(2, 'মঞ্জুরুল ইসলাম ', 'কেন্দ্রীয় সাহিত্য সম্পাদক', '2021-02-20 06:34:18', NULL),
(3, 'হাবিবুর রহমান', 'কেন্দ্রীয় দাওয়াহ সম্পাদক', '2021-02-20 06:34:18', NULL),
(4, 'গোলাম রাব্বানী', 'কেন্দ্রীয় প্রচার সম্পাদক', '2021-02-20 06:34:18', NULL),
(5, 'ওবায়দুর রহমান', 'কেন্দ্রীয় মানবাধিকার বিষয়ক সম্পাদক ', '2021-02-20 06:34:18', NULL),
(6, 'আমিন উদ্দিন', 'কেন্দ্রীয় প্লানিং এ্যান্ড ডেভেলপমেন্ট ও ছাত্রআন্দোলন সম্পাদক ', '2021-02-20 06:34:18', NULL),
(7, 'আব্দুল্লাহ আল মাহমুদ ', 'কেন্দ্রীয় কলেজ কার্যক্রম সম্পাদক', '2021-02-20 06:34:18', NULL),
(8, 'জাহিদুল ইসলাম', 'কেন্দ্রীয় প্রকাশনা সম্পাদক', '2021-02-20 06:34:18', NULL),
(9, 'ইমরানুল হক', 'কেন্দ্রীয় মিডিয়া সম্পাদক', '2021-02-20 06:34:18', NULL),
(10, 'আবির হাসান', 'কেন্দ্রীয় তথ্যপ্রযুক্তি ও সোস্যাল মিডিয়া সম্পাদক', '2021-02-20 06:34:18', NULL),
(11, 'আব্দুল্লাহ আবিদ', 'কেন্দ্রীয় বিজ্ঞান সম্পাদক', '2021-02-20 06:34:18', NULL),
(12, 'হাফেজ নুরুজ্জামান', 'কেন্দ্রীয় এইচআরডি সম্পাদক', '2021-02-20 06:34:18', NULL),
(13, 'এনামুল হক', 'কেন্দ্রীয় অর্থ সম্পাদক', '2021-02-20 06:34:18', NULL),
(14, 'শাহরিয়ার ফয়সাল', 'কেন্দ্রীয় শিক্ষা ও মানবসম্পদ ব্যবস্থাপনা সম্পাদক', '2021-02-20 06:34:19', NULL),
(15, 'ফখরুল আলম সিফাত', 'কেন্দ্রীয় তথ্য ও স্পোর্টস সম্পাদক', '2021-02-20 06:34:19', NULL),
(16, 'হাফিজুর রহমান', 'কেন্দ্রীয় আইন ও ফাউন্ডেশন সম্পাদক', '2021-02-20 06:34:19', NULL),
(17, 'আবু নাহিদ', 'কেন্দ্রীয় ব্যবসায় শিক্ষা সম্পাদক', '2021-02-20 06:34:19', NULL),
(18, 'আহমেদ ইয়াসীন', 'কেন্দ্রীয় পরিবেশ ও সমাজসেবা সম্পাদক', '2021-02-20 06:34:19', NULL),
(19, 'মামুন হোসাইন', 'কেন্দ্রীয় শিল্প ও সংস্কৃতি সম্পাদক', '2021-02-20 06:34:19', NULL),
(20, 'মো. মোস্তাফিজুর রহমান', 'কেন্দ্রীয় স্কুল কার্যক্রম সম্পাদক', '2021-02-20 06:34:19', NULL),
(21, 'নাইমুর রহমান', 'কেন্দ্রীয় আন্তর্জাতিক সম্পাদক', '2021-02-20 06:34:19', NULL),
(22, 'মোহাম্মদ মনিরুল ইসলাম', 'কেন্দ্রীয় মাদরাসা কার্যক্রম সম্পাদক', '2021-02-20 06:34:19', NULL),
(23, 'জুবায়ের হোসাইন রাজন', 'কেন্দ্রীয় ছাত্রকল্যাণ সম্পাদক', '2021-02-20 06:34:19', NULL),
(24, 'সাবিত হাসান', 'কেন্দ্রীয় গবেষণা সম্পাদক', '2021-02-20 06:34:19', NULL),
(25, 'আশিকুর রহমান', 'কেন্দ্রীয় বিতর্ক সম্পাদক', '2021-02-20 06:34:19', NULL),
(26, 'আব্দুল্লাহ তাহসিন', 'কেন্দ্রীয় শিশুকল্যাণ সম্পাদক', '2021-02-20 06:34:19', NULL),
(27, 'আব্দুল মোতালেব মাসুদ', 'কেন্দ্রীয় পাঠাগার সম্পাদক', '2021-02-20 06:34:19', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sec_lists`
--
ALTER TABLE `sec_lists`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sec_lists`
--
ALTER TABLE `sec_lists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
