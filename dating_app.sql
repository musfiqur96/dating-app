-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 10, 2021 at 10:59 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.3.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dating_app`
--

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
-- Table structure for table `like_dislike`
--

CREATE TABLE `like_dislike` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_from` int(11) NOT NULL,
  `user_to` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '1= like, 2= dislike',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `like_dislike`
--

INSERT INTO `like_dislike` (`id`, `user_from`, `user_to`, `status`, `created_at`, `updated_at`) VALUES
(1, 8, 7, 1, '2021-12-08 21:27:11', '2021-12-08 23:08:23'),
(4, 8, 9, 1, '2021-12-08 23:52:04', '2021-12-09 00:00:50'),
(5, 8, 10, 2, '2021-12-08 23:58:17', '2021-12-09 00:10:14'),
(6, 8, 11, 2, '2021-12-09 00:10:17', '2021-12-09 00:10:21'),
(7, 7, 8, 1, '2021-12-09 00:12:38', '2021-12-10 03:42:28');

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
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(8, '2021_12_09_080940_create_user_info_models_table', 2),
(9, '2021_12_09_131608_create_like_dislikes_models_table', 3);

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
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(7, 'MD. MUSFIQUR RAHMAN SHEIKH', 'imonsk96@gmail.com', NULL, '$2y$10$fYkceapqkCLL6I3fiXYTY.3Gk7oIKTrSNdr2sqByUOstmeMPpcc8W', NULL, '2021-12-09 02:40:33', '2021-12-09 02:40:33'),
(8, 'MUSFIQUR RAHMAN', 'imonsk96@gmail.coma', NULL, '$2y$10$KQ7LbooHuZ11O96toaQmB.0aaSqsN9QXvQUeolUDbUpGVO0WIciK2', NULL, '2021-12-09 02:53:27', '2021-12-09 02:53:27'),
(9, 'MUSFIQUR', 'imonsk96@gmail.comm', NULL, '$2y$10$knWY5UqWcV.hAnobTKMm0e.PgLagJchQsaDPdrUFWVlQ6K3jx./gu', NULL, '2021-12-09 02:55:02', '2021-12-09 02:55:02'),
(10, 'MUSFIQUR sheikh', 'imonsk96@gmail.commsd', NULL, '$2y$10$f3gkt3ywFSkWby2f8VtLp.PGTyIlsrvv.galgroNNoQo2nXznYtEK', NULL, '2021-12-09 03:30:11', '2021-12-09 03:30:11'),
(11, 'imon', 'imonsk96@gssmail.com', NULL, '$2y$10$9/D95OI2QZQqdP2cmrmZru7UVCbFB06iSPrqywaIGpw/H6korDOBO', NULL, '2021-12-09 04:28:02', '2021-12-09 04:28:02'),
(12, 'SHEIKH MD. MUSFIQUR RAHMAN', 'imonsk96@gmail.coms', NULL, '$2y$10$ujwUixxaCGzALDBVkV/oluv0/1Zj44EcnD4AQYybK/4Qaawbs/ese', NULL, '2021-12-09 05:59:03', '2021-12-09 05:59:03'),
(14, 'Test', 'imonsk96@gmail.comaaaaa', NULL, '$2y$10$d6MFhE9iyXR4hMOHJBZUHOlGuWVegvZ4A7FDA.bBCyxi2QBis.bxy', NULL, '2021-12-09 07:04:42', '2021-12-09 07:04:42');

-- --------------------------------------------------------

--
-- Table structure for table `user_infos`
--

CREATE TABLE `user_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `dob` date NOT NULL,
  `gender` char(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_pic` char(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` char(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` char(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` char(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0 = inactive,1= active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_infos`
--

INSERT INTO `user_infos` (`id`, `user_id`, `dob`, `gender`, `profile_pic`, `ip_address`, `latitude`, `longitude`, `status`, `created_at`, `updated_at`) VALUES
(1, 7, '2021-09-15', 'male', '1639039233qVblZq0.jpg', '103.253.163.218', '23.7004', '90.4287', 1, '2021-12-09 02:40:33', NULL),
(2, 8, '2021-09-28', 'male', '1639040007c1Rzj7M.jpg', '103.253.163.218', '23.7004', '90.4287', 1, '2021-12-09 02:53:27', NULL),
(3, 9, '2021-08-26', 'male', '1639040102FmCkmgC.jpg', '103.253.163.218', '23.7004', '90.4287', 1, '2021-12-09 02:55:02', NULL),
(4, 10, '2019-08-15', 'male', '1639042211AutY52S.jpg', '103.253.163.218', '23.7004', '90.4287', 1, '2021-12-09 03:30:11', NULL),
(5, 11, '2021-12-20', 'male', '16390456838gwJ6sM.jpg', '103.83.235.135', '23.7272', '90.4093', 1, '2021-12-09 04:28:03', NULL),
(6, 12, '1998-04-15', 'male', 'images/profile-pic/1639051143c3YycYf.jpg', '103.83.235.135', '23.7272', '90.4093', 1, '2021-12-09 05:59:03', NULL),
(7, 14, '2018-01-30', 'male', 'images/profile-pic/1639055082s4awhUC.jpg', '103.83.235.135', '23.7272', '90.4093', 1, '2021-12-08 19:04:42', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `like_dislike`
--
ALTER TABLE `like_dislike`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_infos`
--
ALTER TABLE `user_infos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `like_dislike`
--
ALTER TABLE `like_dislike`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `user_infos`
--
ALTER TABLE `user_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
