-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 21, 2022 at 12:00 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nutimedb`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `class_id` bigint(20) UNSIGNED NOT NULL,
  `teacher_id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `attendence_date` date NOT NULL,
  `attendence_status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attendances`
--

INSERT INTO `attendances` (`id`, `class_id`, `teacher_id`, `student_id`, `attendence_date`, `attendence_status`, `created_at`, `updated_at`) VALUES
(1, 2, 2, 4, '2022-06-16', 1, '2022-06-16 04:37:30', '2022-06-16 04:37:30'),
(2, 2, 2, 5, '2022-06-16', 0, '2022-06-16 04:37:30', '2022-06-16 04:37:30'),
(3, 1, 2, 1, '2022-06-16', 1, '2022-06-16 04:37:42', '2022-06-16 04:37:42'),
(4, 1, 2, 2, '2022-06-16', 1, '2022-06-16 04:37:42', '2022-06-16 04:37:42'),
(5, 1, 2, 3, '2022-06-16', 1, '2022-06-16 04:37:42', '2022-06-16 04:37:42');

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `teacher_id` bigint(20) UNSIGNED NOT NULL,
  `class_numeric` bigint(20) UNSIGNED NOT NULL,
  `class_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `grades`
--

INSERT INTO `grades` (`id`, `teacher_id`, `class_numeric`, `class_name`, `class_description`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 'BSIS191A', 'An Information Systems class.', NULL, '2022-06-16 04:30:37'),
(2, 2, 2, 'BSCS191A', 'A Computer Science class.', '2022-06-16 04:16:00', '2022-06-16 04:30:34');

-- --------------------------------------------------------

--
-- Table structure for table `grade_subject`
--

CREATE TABLE `grade_subject` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `grade_id` bigint(20) UNSIGNED NOT NULL,
  `subject_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `grade_subject`
--

INSERT INTO `grade_subject` (`id`, `grade_id`, `subject_id`, `created_at`, `updated_at`) VALUES
(3, 2, 2, NULL, NULL),
(4, 1, 2, NULL, NULL);

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
(3, '2019_05_14_114748_create_permission_tables', 1),
(4, '2019_05_15_180937_create_students_table', 1),
(5, '2019_05_15_181154_create_parents_table', 1),
(6, '2019_05_15_181254_create_teachers_table', 1),
(7, '2019_05_15_181552_create_grades_table', 1),
(8, '2019_05_16_174745_create_subjects_table', 1),
(9, '2019_05_16_175620_create_grade_subject_table', 1),
(10, '2019_05_17_133226_create_attendances_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\User', 1),
(2, 'App\\User', 9),
(3, 'App\\User', 3),
(4, 'App\\User', 4),
(4, 'App\\User', 5),
(4, 'App\\User', 6),
(4, 'App\\User', 7),
(4, 'App\\User', 8);

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
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'web', '2022-06-15 20:56:41', '2022-06-15 20:56:41'),
(2, 'Teacher', 'web', '2022-06-15 20:56:41', '2022-06-15 20:56:41'),
(3, 'Parent', 'web', '2022-06-15 20:56:41', '2022-06-15 20:56:41'),
(4, 'Student', 'web', '2022-06-15 20:56:41', '2022-06-15 20:56:41');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED NOT NULL,
  `class_id` bigint(20) UNSIGNED NOT NULL,
  `roll_number` bigint(20) UNSIGNED NOT NULL,
  `gender` enum('male','female','other') COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateofbirth` date NOT NULL,
  `current_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permanent_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `user_id`, `parent_id`, `class_id`, `roll_number`, `gender`, `phone`, `dateofbirth`, `current_address`, `permanent_address`, `created_at`, `updated_at`) VALUES
(1, 4, 1, 1, 1, 'female', '09123456789', '2022-06-16', 'Calamba City', 'Calamba City', '2022-06-15 20:56:41', '2022-06-16 04:18:38'),
(2, 5, 1, 1, 2, 'male', '09123456789', '2022-06-16', 'Calamba City', 'Calamba City', '2022-06-16 02:41:36', '2022-06-16 04:03:28'),
(3, 6, 1, 1, 3, 'male', '09123456789', '2022-06-16', 'San Pablo City', 'Calamba City', '2022-06-16 02:42:43', '2022-06-16 04:18:09'),
(4, 7, 1, 2, 4, 'male', '09123456789', '2022-06-16', 'Calamba City', 'Calamba City', '2022-06-16 04:15:10', '2022-06-16 04:17:29'),
(5, 8, 1, 2, 5, 'male', '09123456789', '2022-06-16', 'Calamba City', 'Calamba City', '2022-06-16 04:19:25', '2022-06-16 04:19:40');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_code` bigint(20) UNSIGNED NOT NULL,
  `teacher_id` bigint(20) UNSIGNED NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `name`, `slug`, `subject_code`, `teacher_id`, `description`, `created_at`, `updated_at`) VALUES
(2, 'CTAPDEVL', 'ctapdevl', 1, 2, 'APPLICATION DEVELOPMENT AND EMERGING TECHNOLOGY', '2022-06-16 04:36:30', '2022-06-16 04:36:30');

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `gender` enum('male','female','other') COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateofbirth` date NOT NULL,
  `current_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permanent_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `user_id`, `gender`, `phone`, `dateofbirth`, `current_address`, `permanent_address`, `created_at`, `updated_at`) VALUES
(2, 9, 'male', '09123456789', '2022-06-16', 'Baguio City', 'Baguio City', '2022-06-16 04:30:19', '2022-06-16 04:30:19');

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
  `profile_picture` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'avatar.png',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `profile_picture`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Main Administrator', 'admin@gmail.com', NULL, '$2y$10$0ZKB4WeiAvzY7XQCPtz55Obcgd1GtkIgxtJnAMpuot1L62H59jgNa', 'avatar.png', 'efrxrbVbDAFlUTrwSxwm9cm8lpzSkKrydBmFnti2NBMjBm0RprEsJBDjEYUp', '2022-06-15 20:56:41', '2022-06-16 04:25:20'),
(4, 'Maria Amil Mendoza', 'mamendoza@gmail.com', NULL, '$2y$10$6nmkQCsBHw1nHQ2MBIp45uk5WbXQVy0Y59rKJ4EwHFnxKkyo1CsWG', 'maria-amil-mendoza-4.jpg', NULL, '2022-06-15 20:56:41', '2022-06-16 04:45:07'),
(5, 'Christian Marlou Ocampo', 'cmocampo@gmail.com', NULL, '$2y$10$wT.IabLPUK.DbjQvDOG1G.GwW1p0E1aZw8tXAeyKVggK4HnZz4bR.', 'christian-marlou-ocampo-5.jpg', NULL, '2022-06-16 02:41:36', '2022-06-16 04:44:57'),
(6, 'Maui Miguel Katigbak', 'mmkatigbak@gmail.com', NULL, '$2y$10$ryol9wGfAl6re9N1GTEwPudhxsJlN4Bzl7/5xDI7oX151oAwf5YhW', 'maui-miguel-katigbak-6.jpg', NULL, '2022-06-16 02:42:43', '2022-06-16 04:47:56'),
(7, 'Bowwi Katigbak', 'bkatigbak@gmail.com', NULL, '$2y$10$ItJcqEyNSzl7Hwha6SxJ6elkbxjEQLJv7rF/0JkA1wchyUNu7ROry', 'bowwi-katigbak-7.jpg', NULL, '2022-06-16 04:15:10', '2022-06-16 04:44:40'),
(8, 'Mark John Magsino', 'mjmagsino@gmail.com', NULL, '$2y$10$i/6VqcEGywA5VlTdb17M7.AKt2DIjpsUgEcorXOYDmbY5YoTM4zBi', 'mark-john-magsino-8.jpg', NULL, '2022-06-16 04:19:25', '2022-06-16 04:44:23'),
(9, 'Joseph Domingo', 'jdomingo@gmail.com', NULL, '$2y$10$TZRypC/I54aYgBaY4QpJJ.Z4QySzvoJKzUdLLSfIIcH.LqTid.VYi', 'avatar.png', 'rBD8tffth5HvTRGzQtMw1B2dFxdoGKxP7hycvSlnSs2xQlLgMskVVKFqZG90', '2022-06-16 04:30:19', '2022-06-16 04:30:19');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `grade_subject`
--
ALTER TABLE `grade_subject`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `grades`
--
ALTER TABLE `grades`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `grade_subject`
--
ALTER TABLE `grade_subject`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
