-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 05, 2023 at 04:32 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `demoffxy_feedmill`
--

-- --------------------------------------------------------

--
-- Table structure for table `advances`
--

CREATE TABLE `advances` (
  `id` bigint UNSIGNED NOT NULL,
  `created_by` int NOT NULL,
  `employee_id` int NOT NULL,
  `advance_month` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `advance_amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `advance_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `advances`
--

INSERT INTO `advances` (`id`, `created_by`, `employee_id`, `advance_month`, `advance_amount`, `advance_description`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 3, '2023-04', '1000', 'sss', 1, '2023-03-30 09:57:03', '2023-03-30 09:57:03');

-- --------------------------------------------------------

--
-- Table structure for table `allowances`
--

CREATE TABLE `allowances` (
  `id` bigint UNSIGNED NOT NULL,
  `created_by` int NOT NULL,
  `employee_id` int NOT NULL,
  `allowances_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `allowances_month` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `allowances_amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `allowances_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `type` tinyint NOT NULL COMMENT '1 = Employee, 2 = Labour',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `allowances`
--

INSERT INTO `allowances` (`id`, `created_by`, `employee_id`, `allowances_name`, `allowances_month`, `allowances_amount`, `allowances_description`, `status`, `type`, `created_at`, `updated_at`) VALUES
(1, 0, 1, 'sss', '2023-04', '200', 'ddd', 1, 1, '2023-03-30 09:53:14', '2023-03-30 09:53:14'),
(2, 1, 1, 'sss', '2023-03', '200', 'ddd', 1, 2, '2023-03-30 10:05:04', '2023-03-30 10:05:17'),
(3, 0, 5, 'Transport allowance', '2023-06', '2000', 'transport', 1, 1, '2023-05-06 09:47:46', '2023-05-06 09:47:46');

-- --------------------------------------------------------

--
-- Table structure for table `allowance_deductions`
--

CREATE TABLE `allowance_deductions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Alowance, 2=Deduction, 3=Others',
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `deletable` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=No, 2=Yes',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `allowance_deduction_manages`
--

CREATE TABLE `allowance_deduction_manages` (
  `id` bigint UNSIGNED NOT NULL,
  `allowance_deduction_id` bigint UNSIGNED NOT NULL,
  `employee_id` bigint UNSIGNED NOT NULL,
  `type` int DEFAULT NULL COMMENT '1=Alowance, 2=Deduction, 3=Others',
  `basic_salary` double NOT NULL,
  `percentage` int NOT NULL,
  `amount` double NOT NULL,
  `status` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive, 3=Cancel',
  `deletable` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=No, 2=Yes',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE `assets` (
  `id` bigint UNSIGNED NOT NULL,
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `asset_type_id` bigint UNSIGNED DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `warranty` double(8,2) DEFAULT NULL,
  `user` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cost` double NOT NULL,
  `asset_status` int DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `asset_types`
--

CREATE TABLE `asset_types` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` bigint UNSIGNED NOT NULL,
  `employee_id` bigint UNSIGNED NOT NULL,
  `date_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `am_pm` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_str` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_str_am_pm` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive, 3=Cancel',
  `deletable` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=No, 2=Yes',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendance_settings`
--

CREATE TABLE `attendance_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `shift` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `award_categories`
--

CREATE TABLE `award_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `created_by` int NOT NULL,
  `award_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `publication_status` tinyint NOT NULL,
  `deletion_status` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `a_s_ms`
--

CREATE TABLE `a_s_ms` (
  `id` bigint UNSIGNED NOT NULL,
  `warehouse_id` bigint UNSIGNED DEFAULT NULL,
  `district_id` bigint UNSIGNED DEFAULT NULL,
  `upazila_id` bigint UNSIGNED DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salary` varchar(260) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `a_s_ms`
--

INSERT INTO `a_s_ms` (`id`, `warehouse_id`, `district_id`, `upazila_id`, `avatar`, `name`, `username`, `email`, `phone`, `password`, `salary`, `status`, `created_by`, `modified_by`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 2, 2, 3, 'Mirpur-ASM-Abdul-Hannan-Photo-669814.jpg', 'Abdul Hannan', 'hannan', NULL, '+8801322270610', '$2y$10$6L4S0WOowxJIxHwRHU0dd.v3UktvtaeSz5w01ho.14lwLEfA4vE22', '10000', '1', 'Admin', 'Admin', NULL, '2022-11-30 12:26:46', '2022-11-30 15:02:00');

-- --------------------------------------------------------

--
-- Table structure for table `a_s_m_areas`
--

CREATE TABLE `a_s_m_areas` (
  `id` bigint UNSIGNED NOT NULL,
  `asm_id` bigint UNSIGNED NOT NULL,
  `area_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `a_s_m_areas`
--

INSERT INTO `a_s_m_areas` (`id`, `asm_id`, `area_id`, `created_at`, `updated_at`) VALUES
(1, 1, 4, '2022-11-30 12:26:46', '2022-11-30 12:26:46'),
(2, 1, 654, '2022-11-30 12:26:46', '2022-11-30 12:26:46');

-- --------------------------------------------------------

--
-- Table structure for table `a_s_m_monthly_targets`
--

CREATE TABLE `a_s_m_monthly_targets` (
  `id` bigint UNSIGNED NOT NULL,
  `mtcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `asm_id` bigint UNSIGNED NOT NULL,
  `target_value` double NOT NULL,
  `achieved_value` double DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `closing_date` date NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `a_s_m_monthly_targets`
--

INSERT INTO `a_s_m_monthly_targets` (`id`, `mtcode`, `asm_id`, `target_value`, `achieved_value`, `start_date`, `end_date`, `closing_date`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'ASMMT-2211301229002', 1, 40000, 71337, '2022-12-01', '2022-12-30', '0000-00-00', 'Admin', NULL, '2022-11-30 12:29:00', '2022-12-13 16:01:02'),
(2, 'ASMMT-2211301230122', 1, 3000000, NULL, '2022-11-01', '2022-11-30', '0000-00-00', 'Admin', NULL, '2022-11-30 12:30:12', '2022-11-30 12:30:12');

-- --------------------------------------------------------

--
-- Table structure for table `bags`
--

CREATE TABLE `bags` (
  `id` bigint UNSIGNED NOT NULL,
  `weight` double(8,2) NOT NULL,
  `unit_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=active,2=inactive',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `banks`
--

CREATE TABLE `banks` (
  `id` bigint UNSIGNED NOT NULL,
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouse_id` bigint UNSIGNED NOT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banks`
--

INSERT INTO `banks` (`id`, `bank_name`, `account_name`, `account_number`, `warehouse_id`, `status`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'Dutch Bangla', 'Nexus pay', '12365498521', 5, '1', 'Super Admin', NULL, '2023-05-29 09:41:48', '2023-05-29 09:41:48');

-- --------------------------------------------------------

--
-- Table structure for table `batches`
--

CREATE TABLE `batches` (
  `id` bigint UNSIGNED NOT NULL,
  `batch_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mill_id` int DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `total_material_cost` bigint DEFAULT NULL,
  `total_milling_cost` bigint DEFAULT NULL,
  `total_expense_cost` bigint DEFAULT NULL,
  `total_cost` bigint DEFAULT NULL,
  `per_unit_cost` bigint DEFAULT NULL,
  `status` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '3' COMMENT '1=Approved,2=Canceled,3=Pending',
  `batch_status` enum('1','2','3','4') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Pending, 2=Processing,3=Packaging,4=Finished',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `batch_expenses`
--

CREATE TABLE `batch_expenses` (
  `id` bigint UNSIGNED NOT NULL,
  `batch_id` bigint DEFAULT NULL,
  `expense_id` bigint DEFAULT NULL,
  `expense_cost` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `batch_materials`
--

CREATE TABLE `batch_materials` (
  `id` bigint UNSIGNED NOT NULL,
  `batch_id` bigint DEFAULT NULL,
  `warehouse_id` bigint DEFAULT NULL,
  `material_id` bigint DEFAULT NULL,
  `unit_id` bigint DEFAULT NULL,
  `quantity` bigint DEFAULT NULL,
  `total_price` bigint DEFAULT NULL,
  `milling` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `batch_products`
--

CREATE TABLE `batch_products` (
  `id` bigint UNSIGNED NOT NULL,
  `batch_id` bigint DEFAULT NULL,
  `warehouse_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  `quantity` bigint DEFAULT NULL,
  `material_id` bigint DEFAULT NULL,
  `pcs` bigint DEFAULT NULL,
  `product_status` enum('1','2') COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '1 = product,2 = byProduct',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bonuses`
--

CREATE TABLE `bonuses` (
  `id` bigint UNSIGNED NOT NULL,
  `created_by` int NOT NULL,
  `employee_id` int DEFAULT NULL,
  `bonus_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bonus_month` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bonus_percentage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bonus_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `type` tinyint NOT NULL COMMENT '1 = Employee, 2 = Labour',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bonuses`
--

INSERT INTO `bonuses` (`id`, `created_by`, `employee_id`, `bonus_name`, `bonus_month`, `bonus_percentage`, `bonus_description`, `status`, `type`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, 'Eid', '2023-04', '50', 'sss', 1, 2, '2023-03-30 10:00:42', '2023-03-30 10:00:42'),
(2, 1, NULL, 'Eid', '2023-11', '50', 'sss', 1, 2, '2023-03-30 10:03:37', '2023-03-30 10:03:56');

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Mirpur-1', '1', '2023-03-12 12:32:00', '2023-03-12 12:32:00'),
(2, 'Niknjja', '1', '2023-03-12 12:32:14', '2023-03-12 12:32:14');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('milon_food_cache_active_taxes', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:1:{i:0;O:8:\"stdClass\":8:{s:2:\"id\";i:1;s:4:\"name\";s:7:\"Vat 15%\";s:4:\"rate\";s:2:\"15\";s:6:\"status\";s:1:\"1\";s:10:\"created_by\";s:5:\"Admin\";s:11:\"modified_by\";N;s:10:\"created_at\";s:19:\"2022-12-01 20:18:04\";s:10:\"updated_at\";s:19:\"2022-12-01 20:18:04\";}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', 2001298341),
('milon_food_cache_material_categories', 'O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:6:{i:0;O:19:\"App\\Models\\Category\":39:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"categories\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:2:\"id\";i:16;s:4:\"name\";s:7:\"Enzymes\";s:4:\"type\";s:1:\"1\";s:6:\"status\";s:1:\"1\";s:10:\"created_by\";s:11:\"Super Admin\";s:11:\"modified_by\";N;s:10:\"created_at\";s:19:\"2023-05-18 00:57:36\";s:10:\"updated_at\";s:19:\"2023-05-18 00:57:36\";}s:11:\"\0*\0original\";a:8:{s:2:\"id\";i:16;s:4:\"name\";s:7:\"Enzymes\";s:4:\"type\";s:1:\"1\";s:6:\"status\";s:1:\"1\";s:10:\"created_by\";s:11:\"Super Admin\";s:11:\"modified_by\";N;s:10:\"created_at\";s:19:\"2023-05-18 00:57:36\";s:10:\"updated_at\";s:19:\"2023-05-18 00:57:36\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:8:\"\0*\0dates\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:5:{i:0;s:4:\"name\";i:1;s:4:\"type\";i:2;s:6:\"status\";i:3;s:10:\"created_by\";i:4;s:11:\"modified_by\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:8:\"\0*\0order\";a:1:{s:2:\"id\";s:4:\"desc\";}s:15:\"\0*\0column_order\";N;s:13:\"\0*\0orderValue\";N;s:11:\"\0*\0dirValue\";N;s:13:\"\0*\0startVlaue\";N;s:14:\"\0*\0lengthVlaue\";N;s:7:\"\0*\0type\";N;s:7:\"\0*\0name\";N;s:9:\"\0*\0status\";N;}i:1;O:19:\"App\\Models\\Category\":39:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"categories\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:2:\"id\";i:11;s:4:\"name\";s:14:\"Feed Additives\";s:4:\"type\";s:1:\"1\";s:6:\"status\";s:1:\"1\";s:10:\"created_by\";s:5:\"Tajul\";s:11:\"modified_by\";N;s:10:\"created_at\";s:19:\"2023-05-14 22:31:01\";s:10:\"updated_at\";s:19:\"2023-05-14 22:31:01\";}s:11:\"\0*\0original\";a:8:{s:2:\"id\";i:11;s:4:\"name\";s:14:\"Feed Additives\";s:4:\"type\";s:1:\"1\";s:6:\"status\";s:1:\"1\";s:10:\"created_by\";s:5:\"Tajul\";s:11:\"modified_by\";N;s:10:\"created_at\";s:19:\"2023-05-14 22:31:01\";s:10:\"updated_at\";s:19:\"2023-05-14 22:31:01\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:8:\"\0*\0dates\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:5:{i:0;s:4:\"name\";i:1;s:4:\"type\";i:2;s:6:\"status\";i:3;s:10:\"created_by\";i:4;s:11:\"modified_by\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:8:\"\0*\0order\";a:1:{s:2:\"id\";s:4:\"desc\";}s:15:\"\0*\0column_order\";N;s:13:\"\0*\0orderValue\";N;s:11:\"\0*\0dirValue\";N;s:13:\"\0*\0startVlaue\";N;s:14:\"\0*\0lengthVlaue\";N;s:7:\"\0*\0type\";N;s:7:\"\0*\0name\";N;s:9:\"\0*\0status\";N;}i:2;O:19:\"App\\Models\\Category\":39:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"categories\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:2:\"id\";i:12;s:4:\"name\";s:9:\"Liquid RM\";s:4:\"type\";s:1:\"1\";s:6:\"status\";s:1:\"1\";s:10:\"created_by\";s:5:\"Tajul\";s:11:\"modified_by\";N;s:10:\"created_at\";s:19:\"2023-05-14 22:32:35\";s:10:\"updated_at\";s:19:\"2023-05-14 22:32:35\";}s:11:\"\0*\0original\";a:8:{s:2:\"id\";i:12;s:4:\"name\";s:9:\"Liquid RM\";s:4:\"type\";s:1:\"1\";s:6:\"status\";s:1:\"1\";s:10:\"created_by\";s:5:\"Tajul\";s:11:\"modified_by\";N;s:10:\"created_at\";s:19:\"2023-05-14 22:32:35\";s:10:\"updated_at\";s:19:\"2023-05-14 22:32:35\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:8:\"\0*\0dates\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:5:{i:0;s:4:\"name\";i:1;s:4:\"type\";i:2;s:6:\"status\";i:3;s:10:\"created_by\";i:4;s:11:\"modified_by\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:8:\"\0*\0order\";a:1:{s:2:\"id\";s:4:\"desc\";}s:15:\"\0*\0column_order\";N;s:13:\"\0*\0orderValue\";N;s:11:\"\0*\0dirValue\";N;s:13:\"\0*\0startVlaue\";N;s:14:\"\0*\0lengthVlaue\";N;s:7:\"\0*\0type\";N;s:7:\"\0*\0name\";N;s:9:\"\0*\0status\";N;}i:3;O:19:\"App\\Models\\Category\":39:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"categories\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:2:\"id\";i:13;s:4:\"name\";s:8:\"Premixes\";s:4:\"type\";s:1:\"1\";s:6:\"status\";s:1:\"1\";s:10:\"created_by\";s:5:\"Tajul\";s:11:\"modified_by\";N;s:10:\"created_at\";s:19:\"2023-05-14 22:34:32\";s:10:\"updated_at\";s:19:\"2023-05-14 22:34:32\";}s:11:\"\0*\0original\";a:8:{s:2:\"id\";i:13;s:4:\"name\";s:8:\"Premixes\";s:4:\"type\";s:1:\"1\";s:6:\"status\";s:1:\"1\";s:10:\"created_by\";s:5:\"Tajul\";s:11:\"modified_by\";N;s:10:\"created_at\";s:19:\"2023-05-14 22:34:32\";s:10:\"updated_at\";s:19:\"2023-05-14 22:34:32\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:8:\"\0*\0dates\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:5:{i:0;s:4:\"name\";i:1;s:4:\"type\";i:2;s:6:\"status\";i:3;s:10:\"created_by\";i:4;s:11:\"modified_by\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:8:\"\0*\0order\";a:1:{s:2:\"id\";s:4:\"desc\";}s:15:\"\0*\0column_order\";N;s:13:\"\0*\0orderValue\";N;s:11:\"\0*\0dirValue\";N;s:13:\"\0*\0startVlaue\";N;s:14:\"\0*\0lengthVlaue\";N;s:7:\"\0*\0type\";N;s:7:\"\0*\0name\";N;s:9:\"\0*\0status\";N;}i:4;O:19:\"App\\Models\\Category\":39:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"categories\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:2:\"id\";i:17;s:4:\"name\";s:14:\"Return Feed RM\";s:4:\"type\";s:1:\"1\";s:6:\"status\";s:1:\"1\";s:10:\"created_by\";s:11:\"Super Admin\";s:11:\"modified_by\";N;s:10:\"created_at\";s:19:\"2023-05-18 01:00:59\";s:10:\"updated_at\";s:19:\"2023-05-18 01:00:59\";}s:11:\"\0*\0original\";a:8:{s:2:\"id\";i:17;s:4:\"name\";s:14:\"Return Feed RM\";s:4:\"type\";s:1:\"1\";s:6:\"status\";s:1:\"1\";s:10:\"created_by\";s:11:\"Super Admin\";s:11:\"modified_by\";N;s:10:\"created_at\";s:19:\"2023-05-18 01:00:59\";s:10:\"updated_at\";s:19:\"2023-05-18 01:00:59\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:8:\"\0*\0dates\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:5:{i:0;s:4:\"name\";i:1;s:4:\"type\";i:2;s:6:\"status\";i:3;s:10:\"created_by\";i:4;s:11:\"modified_by\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:8:\"\0*\0order\";a:1:{s:2:\"id\";s:4:\"desc\";}s:15:\"\0*\0column_order\";N;s:13:\"\0*\0orderValue\";N;s:11:\"\0*\0dirValue\";N;s:13:\"\0*\0startVlaue\";N;s:14:\"\0*\0lengthVlaue\";N;s:7:\"\0*\0type\";N;s:7:\"\0*\0name\";N;s:9:\"\0*\0status\";N;}i:5;O:19:\"App\\Models\\Category\":39:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"categories\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:2:\"id\";i:10;s:4:\"name\";s:2:\"RM\";s:4:\"type\";s:1:\"1\";s:6:\"status\";s:1:\"1\";s:10:\"created_by\";s:5:\"Tajul\";s:11:\"modified_by\";N;s:10:\"created_at\";s:19:\"2023-05-14 22:29:05\";s:10:\"updated_at\";s:19:\"2023-05-14 22:29:05\";}s:11:\"\0*\0original\";a:8:{s:2:\"id\";i:10;s:4:\"name\";s:2:\"RM\";s:4:\"type\";s:1:\"1\";s:6:\"status\";s:1:\"1\";s:10:\"created_by\";s:5:\"Tajul\";s:11:\"modified_by\";N;s:10:\"created_at\";s:19:\"2023-05-14 22:29:05\";s:10:\"updated_at\";s:19:\"2023-05-14 22:29:05\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:8:\"\0*\0dates\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:5:{i:0;s:4:\"name\";i:1;s:4:\"type\";i:2;s:6:\"status\";i:3;s:10:\"created_by\";i:4;s:11:\"modified_by\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:8:\"\0*\0order\";a:1:{s:2:\"id\";s:4:\"desc\";}s:15:\"\0*\0column_order\";N;s:13:\"\0*\0orderValue\";N;s:11:\"\0*\0dirValue\";N;s:13:\"\0*\0startVlaue\";N;s:14:\"\0*\0lengthVlaue\";N;s:7:\"\0*\0type\";N;s:7:\"\0*\0name\";N;s:9:\"\0*\0status\";N;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', 2001298487),
('milon_food_cache_product_categories', 'O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:2:{i:0;O:19:\"App\\Models\\Category\":39:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"categories\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:2:\"id\";i:14;s:4:\"name\";s:7:\"Broiler\";s:4:\"type\";s:1:\"2\";s:6:\"status\";s:1:\"1\";s:10:\"created_by\";s:5:\"Tajul\";s:11:\"modified_by\";N;s:10:\"created_at\";s:19:\"2023-05-14 22:54:11\";s:10:\"updated_at\";s:19:\"2023-05-14 22:54:11\";}s:11:\"\0*\0original\";a:8:{s:2:\"id\";i:14;s:4:\"name\";s:7:\"Broiler\";s:4:\"type\";s:1:\"2\";s:6:\"status\";s:1:\"1\";s:10:\"created_by\";s:5:\"Tajul\";s:11:\"modified_by\";N;s:10:\"created_at\";s:19:\"2023-05-14 22:54:11\";s:10:\"updated_at\";s:19:\"2023-05-14 22:54:11\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:8:\"\0*\0dates\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:5:{i:0;s:4:\"name\";i:1;s:4:\"type\";i:2;s:6:\"status\";i:3;s:10:\"created_by\";i:4;s:11:\"modified_by\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:8:\"\0*\0order\";a:1:{s:2:\"id\";s:4:\"desc\";}s:15:\"\0*\0column_order\";N;s:13:\"\0*\0orderValue\";N;s:11:\"\0*\0dirValue\";N;s:13:\"\0*\0startVlaue\";N;s:14:\"\0*\0lengthVlaue\";N;s:7:\"\0*\0type\";N;s:7:\"\0*\0name\";N;s:9:\"\0*\0status\";N;}i:1;O:19:\"App\\Models\\Category\":39:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"categories\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:2:\"id\";i:15;s:4:\"name\";s:7:\"Shonali\";s:4:\"type\";s:1:\"2\";s:6:\"status\";s:1:\"1\";s:10:\"created_by\";s:5:\"Tajul\";s:11:\"modified_by\";N;s:10:\"created_at\";s:19:\"2023-05-14 22:54:25\";s:10:\"updated_at\";s:19:\"2023-05-14 22:54:25\";}s:11:\"\0*\0original\";a:8:{s:2:\"id\";i:15;s:4:\"name\";s:7:\"Shonali\";s:4:\"type\";s:1:\"2\";s:6:\"status\";s:1:\"1\";s:10:\"created_by\";s:5:\"Tajul\";s:11:\"modified_by\";N;s:10:\"created_at\";s:19:\"2023-05-14 22:54:25\";s:10:\"updated_at\";s:19:\"2023-05-14 22:54:25\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:8:\"\0*\0dates\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:5:{i:0;s:4:\"name\";i:1;s:4:\"type\";i:2;s:6:\"status\";i:3;s:10:\"created_by\";i:4;s:11:\"modified_by\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:8:\"\0*\0order\";a:1:{s:2:\"id\";s:4:\"desc\";}s:15:\"\0*\0column_order\";N;s:13:\"\0*\0orderValue\";N;s:11:\"\0*\0dirValue\";N;s:13:\"\0*\0startVlaue\";N;s:14:\"\0*\0lengthVlaue\";N;s:7:\"\0*\0type\";N;s:7:\"\0*\0name\";N;s:9:\"\0*\0status\";N;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', 2001297919);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Material Category, 2=Product Category',
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `type`, `status`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(10, 'RM', '1', '1', 'Tajul', NULL, '2023-05-14 16:29:05', '2023-05-14 16:29:05'),
(11, 'Feed Additives', '1', '1', 'Tajul', NULL, '2023-05-14 16:31:01', '2023-05-14 16:31:01'),
(12, 'Liquid RM', '1', '1', 'Tajul', NULL, '2023-05-14 16:32:35', '2023-05-14 16:32:35'),
(13, 'Premixes', '1', '1', 'Tajul', NULL, '2023-05-14 16:34:32', '2023-05-14 16:34:32'),
(14, 'Broiler', '2', '1', 'Tajul', NULL, '2023-05-14 16:54:11', '2023-05-14 16:54:11'),
(15, 'Shonali', '2', '1', 'Tajul', NULL, '2023-05-14 16:54:25', '2023-05-14 16:54:25'),
(16, 'Enzymes', '1', '1', 'Super Admin', NULL, '2023-05-17 18:57:36', '2023-05-17 18:57:36'),
(17, 'Return Feed RM', '1', '1', 'Super Admin', NULL, '2023-05-17 19:00:59', '2023-05-17 19:00:59');

-- --------------------------------------------------------

--
-- Table structure for table `chart_of_accounts`
--

CREATE TABLE `chart_of_accounts` (
  `id` bigint UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` int NOT NULL DEFAULT '0',
  `type` enum('A','L','I','E') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'A=Asset, L=Liabilty, I=income, E=Expense',
  `transaction` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Yes, 2=No',
  `general_ledger` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Yes, 2=No',
  `customer_id` bigint UNSIGNED DEFAULT NULL,
  `supplier_id` bigint UNSIGNED DEFAULT NULL,
  `asm_id` bigint DEFAULT NULL,
  `salesmen_id` int DEFAULT NULL,
  `dealer_id` int DEFAULT NULL,
  `bank_id` int DEFAULT NULL,
  `mobile_bank_id` int DEFAULT NULL,
  `budget` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Yes, 2=No',
  `depreciation` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Yes, 2=No',
  `depreciation_rate` double NOT NULL DEFAULT '0',
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chart_of_accounts`
--

INSERT INTO `chart_of_accounts` (`id`, `code`, `name`, `parent_name`, `level`, `type`, `transaction`, `general_ledger`, `customer_id`, `supplier_id`, `asm_id`, `salesmen_id`, `dealer_id`, `bank_id`, `mobile_bank_id`, `budget`, `depreciation`, `depreciation_rate`, `status`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, '1', 'Assets', 'COA', 0, 'A', '2', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-02 23:14:59', '2021-04-02 23:14:59'),
(2, '2', 'Equity', 'COA', 0, 'L', '2', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-02 23:14:59', '2021-04-02 23:14:59'),
(3, '3', 'Income', 'COA', 0, 'I', '2', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-02 23:14:59', '2021-04-02 23:14:59'),
(4, '4', 'Expense', 'COA', 0, 'E', '2', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-02 23:14:59', '2021-04-02 23:14:59'),
(5, '5', 'Liabilities', 'COA', 0, 'L', '2', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-02 23:14:59', '2021-04-02 23:14:59'),
(6, '101', 'Non Current Asset', 'Assets', 1, 'A', '2', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-02 23:14:59', '2021-04-02 23:14:59'),
(7, '102', 'Current Asset', 'Assets', 1, 'A', '2', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-02 23:14:59', '2021-04-02 23:14:59'),
(8, '301', 'Product Sale', 'Income', 1, 'I', '1', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', 'Admin', '2021-04-02 23:14:59', '2022-01-02 16:28:52'),
(9, '302', 'Service Income', 'Income', 1, 'I', '1', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-02 23:14:59', '2021-04-02 23:14:59'),
(10, '401', 'Default Expense', 'Expense', 1, 'E', '1', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 0, '1', 'SuperAdmin', NULL, '2021-04-02 23:14:59', '2021-04-02 23:14:59'),
(11, '402', 'Material Purchase', 'Expense', 1, 'E', '2', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-02 23:14:59', '2021-04-02 23:14:59'),
(12, '403', 'Employee Salary', 'Expense', 1, 'E', '1', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-02 23:14:59', '2021-04-02 23:14:59'),
(13, '404', 'Machine Purchase', 'Expense', 1, 'E', '2', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-02 23:14:59', '2021-04-02 23:14:59'),
(14, '405', 'Maintenance Service', 'Expense', 1, 'E', '2', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-02 23:14:59', '2021-04-02 23:14:59'),
(15, '501', 'Non Current Liabilities', 'Liabilities', 1, 'L', '2', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-02 23:14:59', '2021-04-02 23:14:59'),
(16, '502', 'Current Liabilities', 'Liabilities', 1, 'L', '2', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-02 23:14:59', '2021-04-02 23:14:59'),
(17, '10101', 'Inventory', 'Non Current Asset', 2, 'A', '2', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-02 23:14:59', '2021-04-02 23:14:59'),
(18, '10201', 'Cash & Cash Equivalent', 'Current Asset', 2, 'A', '2', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-02 23:14:59', '2021-04-02 23:14:59'),
(19, '10202', 'Account Receivable', 'Current Asset', 2, 'A', '2', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-02 23:14:59', '2021-04-02 23:14:59'),
(20, '50201', 'Account Payable', 'Current Liabilities', 2, 'L', '2', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-02 23:14:59', '2021-04-02 23:14:59'),
(21, '50202', 'Employee Ledger', 'Current Liabilities', 2, 'L', '2', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-02 23:14:59', '2021-04-02 23:14:59'),
(22, '50203', 'Tax', 'Current Liabilities', 2, 'L', '2', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-02 23:14:59', '2021-04-02 23:14:59'),
(23, '1020101', 'Cash In Hand', 'Cash & Cash Equivalent', 3, 'A', '1', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-02 23:14:59', '2021-04-02 23:14:59'),
(24, '1020102', 'Cash At Bank', 'Cash & Cash Equivalent', 3, 'A', '2', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-02 23:14:59', '2021-04-02 23:14:59'),
(25, '1020103', 'Cash At Mobile Bank', 'Cash & Cash Equivalent', 3, 'A', '2', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-02 23:14:59', '2021-04-02 23:14:59'),
(26, '1020201', 'Customer Receivable', 'Account Receivable', 3, 'A', '2', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-02 23:14:59', '2021-04-02 23:14:59'),
(27, '1020202', 'Loan Receivable', 'Account Receivable', 3, 'A', '2', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-02 23:14:59', '2021-04-02 23:14:59'),
(40, '50101', 'Loans', 'Non Current Liabilities', 2, 'L', '2', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Super Admin', NULL, '2021-09-13 05:17:53', '2021-09-13 05:17:53'),
(41, '50204', 'Loans & Overdrafts', 'Current Liabilities', 2, 'L', '2', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Super Admin', NULL, '2021-09-13 05:18:27', '2021-09-13 05:18:27'),
(42, '5010101', 'Loan Payable Long Term', 'Loans', 3, 'L', '2', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Super Admin', NULL, '2021-09-13 05:19:20', '2021-09-13 05:19:20'),
(43, '5020401', 'Loan Payable Short Term', 'Loans & Overdrafts', 3, 'L', '2', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Super Admin', NULL, '2021-09-13 05:19:55', '2021-09-13 05:19:55'),
(249, '5020100001', '1-Mahbub Alom', 'Account Payable', 3, 'L', '1', '2', NULL, 1, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Admin', NULL, '2022-11-26 11:52:42', '2022-11-26 11:57:58'),
(250, '5020100002', '2-Rafiqul Islam Raton', 'Account Payable', 3, 'L', '1', '2', NULL, 2, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Admin', NULL, '2022-11-26 11:56:22', '2022-11-26 11:56:22'),
(251, '5020100003', '3-Jahanara Plastic', 'Account Payable', 3, 'L', '1', '2', NULL, 3, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Admin', NULL, '2022-11-26 11:57:13', '2022-11-26 11:57:13'),
(252, '5020100004', 'Abdul Hannan', 'Account Payable', 3, 'L', '1', '2', NULL, NULL, 1, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Admin', NULL, '2022-11-26 12:58:02', '2022-11-26 12:58:02'),
(253, '5020100005', 'Md. Ripon Hossain', 'Account Payable', 3, 'L', '1', '2', NULL, NULL, NULL, 1, NULL, NULL, NULL, '2', '2', 0, '1', 'Admin', NULL, '2022-11-26 13:00:22', '2022-11-26 13:00:22'),
(255, '102020100002', '2-Kamal Hossain', 'Customer Receivable', 4, 'A', '1', '2', 2, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Admin', NULL, '2022-11-26 13:07:26', '2022-11-26 13:07:26'),
(256, '4000001', '1-Electricity Bill', 'Expense', 1, 'E', '1', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 1, '1', 'Admin', NULL, '2022-11-26 16:15:45', '2022-11-26 16:15:45'),
(257, '4000002', '2-Net Bill', 'Expense', 1, 'E', '1', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 1, '1', 'Admin', NULL, '2022-11-26 16:15:54', '2022-11-26 16:15:54'),
(258, '4000003', '3-Teliphone Bill', 'Expense', 1, 'E', '1', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 1, '1', 'Admin', NULL, '2022-11-26 16:16:11', '2022-11-26 16:16:11'),
(259, '4000004', '4-Office Rent', 'Expense', 1, 'E', '1', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 1, '1', 'Admin', NULL, '2022-11-26 16:16:23', '2022-11-26 16:16:23'),
(260, '4000005', '5-Office Foods Cost', 'Expense', 1, 'E', '1', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 1, '1', 'Admin', NULL, '2022-11-26 16:17:04', '2022-11-26 16:17:04'),
(261, '10202030001', 'Mamun', 'Dealer Receivable', 4, 'A', '1', '2', NULL, NULL, NULL, NULL, 1, NULL, NULL, '2', '2', 0, '1', 'Super Admin', NULL, '2022-11-27 14:33:37', '2022-11-27 14:33:37'),
(262, '5020100006', '4-New Supplier', 'Account Payable', 3, 'L', '1', '2', NULL, 4, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Super Admin', NULL, '2022-11-27 17:38:52', '2022-11-27 17:38:52'),
(263, '5020100007', 'Abdul Hannan', 'Account Payable', 3, 'L', '1', '2', NULL, NULL, 1, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Admin', NULL, '2022-11-30 12:26:46', '2022-11-30 12:26:46'),
(264, '5020100008', 'Ruma Akter', 'Account Payable', 3, 'L', '1', '2', NULL, NULL, NULL, 1, NULL, NULL, NULL, '2', '2', 0, '1', 'Admin', NULL, '2022-11-30 12:36:05', '2022-11-30 12:36:05'),
(265, '5020100009', 'Alo Akter', 'Account Payable', 3, 'L', '1', '2', NULL, NULL, NULL, 2, NULL, NULL, NULL, '2', '2', 0, '1', 'Admin', NULL, '2022-11-30 12:39:58', '2022-11-30 12:39:58'),
(266, '5020100010', 'Ripon Hossain', 'Account Payable', 3, 'L', '1', '2', NULL, NULL, NULL, 3, NULL, NULL, NULL, '2', '2', 0, '1', 'Admin', NULL, '2022-11-30 12:42:15', '2022-11-30 12:42:15'),
(267, '102020100003', '1-Rasel islam', 'Customer Receivable', 4, 'A', '1', '2', 1, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Abdul Hannan', NULL, '2022-11-30 14:47:13', '2022-11-30 14:47:13'),
(268, '102020100004', '2-Samsul islam', 'Customer Receivable', 4, 'A', '1', '2', 2, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Abdul Hannan', NULL, '2022-11-30 14:56:26', '2022-11-30 14:56:26'),
(272, '102020100008', '6-নুর আলম', 'Customer Receivable', 4, 'A', '1', '2', 6, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Abdul Hannan', NULL, '2022-11-30 15:14:38', '2022-11-30 22:52:22'),
(273, '102020100009', '7-Prodib(মন্টু চন্দ্র দাস)', 'Customer Receivable', 4, 'A', '1', '2', 7, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Abdul Hannan', NULL, '2022-11-30 15:16:03', '2022-12-12 19:53:54'),
(274, '102020100010', '8-New shfiq(ফিরোজ খান)', 'Customer Receivable', 4, 'A', '1', '2', 8, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Abdul Hannan', NULL, '2022-11-30 15:18:12', '2022-12-12 19:54:14'),
(275, '102020100011', '9-Alamin(আলামিন)', 'Customer Receivable', 4, 'A', '1', '2', 9, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Abdul Hannan', NULL, '2022-11-30 15:19:54', '2022-12-12 19:54:33'),
(276, '102020100012', '10-Kamal - কামাল', 'Customer Receivable', 4, 'A', '1', '2', 10, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-11-30 20:33:10', '2022-12-06 13:40:28'),
(277, '102020100013', '11-Dalower Joshor(দেলোয়ার হোসেন)', 'Customer Receivable', 4, 'A', '1', '2', 11, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-11-30 21:02:20', '2022-12-12 19:54:57'),
(278, '102020100014', '12-Shodas(আজিজুল ইসলাম রিয়াজ)', 'Customer Receivable', 4, 'A', '1', '2', 12, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-11-30 21:06:47', '2022-12-12 19:55:14'),
(279, '102020100015', '13-Sotota(মিজানুর রহমান)', 'Customer Receivable', 4, 'A', '1', '2', 13, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-11-30 21:10:12', '2022-12-12 19:55:32'),
(280, '102020100016', '14-সবুজ ইসলাম', 'Customer Receivable', 4, 'A', '1', '2', 14, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-11-30 21:12:28', '2022-11-30 21:12:28'),
(281, '102020100017', '15-হোসেন', 'Customer Receivable', 4, 'A', '1', '2', 15, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-11-30 21:15:54', '2022-11-30 21:15:54'),
(282, '102020100018', '16-আলমগীর হোসেন', 'Customer Receivable', 4, 'A', '1', '2', 16, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-11-30 21:20:56', '2022-11-30 21:20:56'),
(283, '102020100019', '17-সীমান্ত', 'Customer Receivable', 4, 'A', '1', '2', 17, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-11-30 21:38:45', '2022-11-30 21:38:45'),
(284, '102020100020', '18-রনি হোসেন', 'Customer Receivable', 4, 'A', '1', '2', 18, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-11-30 21:42:15', '2022-11-30 21:42:15'),
(285, '102020100021', '19-ইমাম হোসেন', 'Customer Receivable', 4, 'A', '1', '2', 19, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-11-30 21:45:16', '2022-11-30 21:45:16'),
(286, '102020100022', '20-গোলাম মাওলা', 'Customer Receivable', 4, 'A', '1', '2', 20, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-11-30 21:49:20', '2022-11-30 21:49:20'),
(287, '102020100023', '21-Kamaler dokan(কামাল হোসেন)', 'Customer Receivable', 4, 'A', '1', '2', 21, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-11-30 22:04:53', '2022-12-10 13:27:18'),
(288, '102020100024', '22-Mijan(মিজান)', 'Customer Receivable', 4, 'A', '1', '2', 22, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-11-30 22:06:59', '2022-12-06 23:30:29'),
(289, '102020100025', '23-Anower(আনোয়ার ইসলাম)', 'Customer Receivable', 4, 'A', '1', '2', 23, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-11-30 22:09:37', '2022-12-06 23:29:43'),
(290, '102020100026', '24-আব্দুল করিম', 'Customer Receivable', 4, 'A', '1', '2', 24, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-11-30 22:11:18', '2022-11-30 22:11:18'),
(291, '102020100027', '25-জাবেদ', 'Customer Receivable', 4, 'A', '1', '2', 25, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-11-30 22:13:13', '2022-11-30 22:13:13'),
(292, '102020100028', '26-Shohal(সোহেল)', 'Customer Receivable', 4, 'A', '1', '2', 26, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-11-30 22:14:40', '2022-12-06 23:22:54'),
(293, '102020100029', '27-জাকির হোসেন', 'Customer Receivable', 4, 'A', '1', '2', 27, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-11-30 22:16:50', '2022-11-30 22:16:50'),
(294, '102020100030', '28-Rakib(রাকিব)', 'Customer Receivable', 4, 'A', '1', '2', 28, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-11-30 22:21:11', '2022-12-06 23:19:53'),
(295, '102020100031', '29-Chadpur(রিপন ইসলাম)', 'Customer Receivable', 4, 'A', '1', '2', 29, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-11-30 22:22:59', '2022-12-12 19:53:15'),
(296, '102020100032', '30-Rasel(রাসেল)', 'Customer Receivable', 4, 'A', '1', '2', 30, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-11-30 22:24:45', '2022-12-06 23:18:00'),
(297, '102020100033', '31-Asraful(আশরাফুল)', 'Customer Receivable', 4, 'A', '1', '2', 31, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-11-30 22:26:31', '2022-12-06 23:11:21'),
(298, '102020100034', '32-Matrivander(জয় দাস)', 'Customer Receivable', 4, 'A', '1', '2', 32, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-11-30 22:28:43', '2022-12-06 23:07:05'),
(299, '102020100035', '33-Imdadul(ইমদাদুল ইসলাম)', 'Customer Receivable', 4, 'A', '1', '2', 33, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-11-30 22:33:27', '2022-12-06 23:05:17'),
(300, '102020100036', '34-Rokon(রোকন)', 'Customer Receivable', 4, 'A', '1', '2', 34, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-11-30 22:35:02', '2022-12-06 23:03:48'),
(301, '102020100037', '35-Chadpur(জসিম)', 'Customer Receivable', 4, 'A', '1', '2', 35, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Admin', NULL, '2022-11-30 22:41:33', '2022-12-06 23:03:14'),
(302, '102020100038', '36-Jubayer(জুবায়ের)', 'Customer Receivable', 4, 'A', '1', '2', 36, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-11-30 22:48:46', '2022-12-06 23:02:20'),
(303, '102020100039', '37-Jamal(জামাল)', 'Customer Receivable', 4, 'A', '1', '2', 37, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-11-30 22:54:17', '2022-12-06 23:01:29'),
(304, '102020100040', '38-Shoykot(নবীন হোসেন)', 'Customer Receivable', 4, 'A', '1', '2', 38, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-11-30 22:55:57', '2022-12-06 23:00:50'),
(305, '102020100041', '39-Shakil(শাকিল আহমেদ)', 'Customer Receivable', 4, 'A', '1', '2', 39, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Abdul Hannan', NULL, '2022-12-01 17:17:47', '2022-12-06 18:46:23'),
(306, '102020100042', '40-হাফিজ ইসলাম', 'Customer Receivable', 4, 'A', '1', '2', 40, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Abdul Hannan', NULL, '2022-12-01 17:23:27', '2022-12-01 17:23:27'),
(307, '102020100043', '41-Imran(রোকুনোদ জামাল)', 'Customer Receivable', 4, 'A', '1', '2', 41, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Abdul Hannan', NULL, '2022-12-01 17:25:59', '2022-12-06 18:55:58'),
(308, '102020100044', '42-Brihottom Noakhali(আব্দুল্লাহ)', 'Customer Receivable', 4, 'A', '1', '2', 42, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Abdul Hannan', NULL, '2022-12-01 17:30:10', '2022-12-12 19:52:23'),
(309, '102020100045', '43-Hazrat shajalal(হযরত শাহজালাল', 'Customer Receivable', 4, 'A', '1', '2', 43, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Abdul Hannan', NULL, '2022-12-01 17:32:46', '2022-12-06 19:22:14'),
(310, '102020100046', '44-Harun(হারুন ইসলাম)', 'Customer Receivable', 4, 'A', '1', '2', 44, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Abdul Hannan', NULL, '2022-12-01 17:35:50', '2022-12-06 18:47:34'),
(311, '102020100047', '45-Mun mun (নাসির উদ্দীন)', 'Customer Receivable', 4, 'A', '1', '2', 45, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Abdul Hannan', NULL, '2022-12-01 17:38:23', '2022-12-06 18:53:09'),
(312, '102020100048', '46-Ali(খোকনুদ জামাল)', 'Customer Receivable', 4, 'A', '1', '2', 46, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Abdul Hannan', NULL, '2022-12-01 17:40:31', '2022-12-06 19:00:58'),
(313, '4000006', '1-Asset', 'Expense', 1, 'E', '1', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 1, '1', 'Admin', NULL, '2022-12-06 12:32:48', '2022-12-06 12:32:48'),
(314, '102020100049', '47-Fahim (ফাহিম)', 'Customer Receivable', 4, 'A', '1', '2', 47, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-06 13:49:09', '2022-12-06 13:49:09'),
(315, '102020100050', '48-Mohashin( মহাসিন )', 'Customer Receivable', 4, 'A', '1', '2', 48, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-06 17:51:29', '2022-12-06 17:51:29'),
(316, '102020100051', '49-Imdad(ইমদাদ)', 'Customer Receivable', 4, 'A', '1', '2', 49, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-06 17:54:40', '2022-12-06 17:54:40'),
(317, '102020100052', '50-Shojib( সজীব)', 'Customer Receivable', 4, 'A', '1', '2', 50, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-06 17:56:41', '2022-12-06 17:56:41'),
(318, '102020100053', '51-Bornoful( বনফুল )', 'Customer Receivable', 4, 'A', '1', '2', 51, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-06 17:59:14', '2022-12-06 17:59:14'),
(319, '102020100054', '52-Ma(মা )', 'Customer Receivable', 4, 'A', '1', '2', 52, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-06 18:00:36', '2022-12-06 18:00:36'),
(320, '102020100055', '53-Alomgir( আলমগীর )', 'Customer Receivable', 4, 'A', '1', '2', 53, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-06 18:03:07', '2022-12-06 18:03:07'),
(321, '102020100056', '54-Nuralom( নুর আলম )', 'Customer Receivable', 4, 'A', '1', '2', 54, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-06 18:04:49', '2022-12-06 18:04:49'),
(322, '102020100057', '55-Ruma 2(রুমা ২)', 'Customer Receivable', 4, 'A', '1', '2', 55, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-06 18:10:10', '2022-12-06 18:10:10'),
(323, '102020100058', '56-Ali(আলী )', 'Customer Receivable', 4, 'A', '1', '2', 56, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-06 18:18:56', '2022-12-06 18:18:56'),
(324, '102020100059', '57-Hazrat shajalal( হযরত শাহজালাল )', 'Customer Receivable', 4, 'A', '1', '2', 57, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-06 18:41:21', '2022-12-06 18:41:21'),
(325, '5020100011', '1-Rafiqul Islam Raton', 'Account Payable', 3, 'L', '1', '2', NULL, 1, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Admin', NULL, '2022-12-07 13:25:40', '2022-12-07 13:25:40'),
(326, '5020100012', '2-Sri Dev Dulal', 'Account Payable', 3, 'L', '1', '2', NULL, 2, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Admin', NULL, '2022-12-07 13:31:03', '2022-12-07 13:31:03'),
(327, '5020100013', '3-Md. Sumon (Lachcha)', 'Account Payable', 3, 'L', '1', '2', NULL, 3, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Admin', NULL, '2022-12-07 13:33:05', '2022-12-07 15:09:43'),
(328, '5020100014', '4-Md. Mamun', 'Account Payable', 3, 'L', '1', '2', NULL, 4, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Admin', NULL, '2022-12-07 13:39:05', '2022-12-07 13:39:05'),
(329, '5020100015', '5-Md. Mamun', 'Account Payable', 3, 'L', '1', '2', NULL, 5, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Admin', NULL, '2022-12-07 13:53:22', '2022-12-07 13:53:22'),
(330, '5020100016', '6-Md. Mamun (New)', 'Account Payable', 3, 'L', '1', '2', NULL, 6, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Admin', NULL, '2022-12-07 13:55:47', '2022-12-07 13:55:47'),
(331, '5020100017', '7-Md. Monir (Polycon)', 'Account Payable', 3, 'L', '1', '2', NULL, 7, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Admin', NULL, '2022-12-07 13:59:55', '2022-12-07 13:59:55'),
(332, '5020100018', '8-Md. Munna (Jahanara Plastic)', 'Account Payable', 3, 'L', '1', '2', NULL, 8, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Admin', NULL, '2022-12-07 14:03:24', '2022-12-07 14:03:24'),
(333, '5020100019', '9-Md. Nasir Khan (2L Container)', 'Account Payable', 3, 'L', '1', '2', NULL, 9, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Admin', NULL, '2022-12-07 14:11:09', '2022-12-07 14:11:09'),
(334, '5020100020', '10-Md. Mahbubur Rahman (PrintPlus)', 'Account Payable', 3, 'L', '1', '2', NULL, 10, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Admin', NULL, '2022-12-07 14:18:17', '2022-12-07 14:18:17'),
(335, '5020100021', '11-Mr. Faruk', 'Account Payable', 3, 'L', '1', '2', NULL, 11, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Admin', NULL, '2022-12-07 14:23:24', '2022-12-07 14:23:24'),
(336, '5020100022', '12-Md. Masum (Security Lock)', 'Account Payable', 3, 'L', '1', '2', NULL, 12, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Admin', NULL, '2022-12-07 14:26:30', '2022-12-07 14:26:30'),
(337, '5020100023', '13-Local Market', 'Account Payable', 3, 'L', '1', '2', NULL, 13, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Admin', NULL, '2022-12-07 14:28:05', '2022-12-07 14:28:05'),
(338, '5020100024', '14-Md. Babu', 'Account Payable', 3, 'L', '1', '2', NULL, 14, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Admin', NULL, '2022-12-07 14:31:57', '2022-12-07 14:31:57'),
(339, '5020100025', '15-Sri Dev Dulal', 'Account Payable', 3, 'L', '1', '2', NULL, 15, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Admin', NULL, '2022-12-07 14:54:24', '2022-12-07 14:54:24'),
(340, '4000007', '2-Product Received Cost (Labour Cost)', 'Expense', 1, 'E', '1', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 1, '1', 'Admin', NULL, '2022-12-07 16:32:45', '2022-12-07 16:32:45'),
(341, '4000008', '3-Inventory Transfer Cost', 'Expense', 1, 'E', '1', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 1, '1', 'Admin', NULL, '2022-12-07 16:33:18', '2022-12-07 16:33:47'),
(342, '102020100060', '58-Monir(মনির)', 'Customer Receivable', 4, 'A', '1', '2', 58, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-07 17:54:01', '2022-12-07 17:54:01'),
(343, '102020100061', '59-Kamrul(কামরুল )', 'Customer Receivable', 4, 'A', '1', '2', 59, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-07 18:49:21', '2022-12-07 18:49:21'),
(344, '102020100062', '60-Arafat(আরাফাত)', 'Customer Receivable', 4, 'A', '1', '2', 60, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-07 18:50:37', '2022-12-07 18:50:37'),
(345, '102020100063', '61-Three Stare(থ্রী ষ্টার)', 'Customer Receivable', 4, 'A', '1', '2', 61, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-07 18:53:52', '2022-12-07 18:53:52'),
(346, '102020100064', '62-Alamin(আলিমন)', 'Customer Receivable', 4, 'A', '1', '2', 62, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-07 18:57:35', '2022-12-07 18:57:35'),
(347, '102020100065', '63-Shulov(সুলভ)', 'Customer Receivable', 4, 'A', '1', '2', 63, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-07 19:01:40', '2022-12-07 19:01:40'),
(348, '102020100066', '64-Khokhon(খোকন)', 'Customer Receivable', 4, 'A', '1', '2', 64, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-07 19:03:40', '2022-12-07 19:03:40'),
(349, '102020100067', '65-Arif(আরিফ)', 'Customer Receivable', 4, 'A', '1', '2', 65, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-07 19:05:50', '2022-12-07 19:05:50'),
(350, '102020100068', '66-Ma(Kafrul মা )', 'Customer Receivable', 4, 'A', '1', '2', 66, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-07 19:07:53', '2022-12-13 15:59:50'),
(351, '102020100069', '67-Karanigonj(মনির)', 'Customer Receivable', 4, 'A', '1', '2', 67, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-07 19:10:31', '2022-12-07 19:10:31'),
(352, '102020100070', '68-Dalower(দালোয়ার)', 'Customer Receivable', 4, 'A', '1', '2', 68, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-07 19:12:48', '2022-12-07 19:12:48'),
(353, '102020100071', '69-Shofiq(শফিক)', 'Customer Receivable', 4, 'A', '1', '2', 69, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-07 19:18:49', '2022-12-07 19:18:49'),
(354, '102020100072', '70-Raja Badsha( রাজা বাদশা )', 'Customer Receivable', 4, 'A', '1', '2', 70, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-07 19:20:29', '2022-12-07 19:20:29'),
(355, '102020100073', '71-Iqbal( ইকবাল)', 'Customer Receivable', 4, 'A', '1', '2', 71, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-07 19:23:28', '2022-12-07 19:23:28'),
(356, '102020100074', '72-Nayeem( নাঈম )', 'Customer Receivable', 4, 'A', '1', '2', 72, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-07 19:24:43', '2022-12-07 19:24:43'),
(357, '102020100075', '73-Almodina( আল মদিনা )', 'Customer Receivable', 4, 'A', '1', '2', 73, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-07 19:26:31', '2022-12-07 19:26:31'),
(358, '102020100076', '74-Faymeli( ফ্যামিলি )', 'Customer Receivable', 4, 'A', '1', '2', 74, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-07 19:30:44', '2022-12-07 19:30:44'),
(359, '102020100077', '75-Bickumpur(anower)', 'Customer Receivable', 4, 'A', '1', '2', 75, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-07 19:32:31', '2022-12-07 19:32:31'),
(360, '102020100078', '76-Hakim( হাকিম )', 'Customer Receivable', 4, 'A', '1', '2', 76, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-07 19:33:46', '2022-12-07 19:33:46'),
(361, '102020100079', '77-Sattar( সাত্তার )', 'Customer Receivable', 4, 'A', '1', '2', 77, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-07 19:35:23', '2022-12-07 19:35:23'),
(362, '102020100080', '78-Anower(আনোয়ার ইসলাম)', 'Customer Receivable', 4, 'A', '1', '2', 78, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-07 19:36:35', '2022-12-07 19:36:35'),
(363, '102020100081', '79-Ajmir( আজমির)', 'Customer Receivable', 4, 'A', '1', '2', 79, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-08 20:34:52', '2022-12-08 20:34:52'),
(364, '102020100082', '80-Shahin(শাহীন)', 'Customer Receivable', 4, 'A', '1', '2', 80, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-08 20:37:16', '2022-12-08 20:37:16'),
(365, '102020100083', '81-Kazi(কাজী)', 'Customer Receivable', 4, 'A', '1', '2', 81, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-08 20:38:44', '2022-12-08 20:38:44'),
(366, '102020100084', '82-Islam(ইসলাম)', 'Customer Receivable', 4, 'A', '1', '2', 82, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-08 20:41:26', '2022-12-08 20:41:26'),
(367, '102020100085', '83-Adiba(আদিবা)', 'Customer Receivable', 4, 'A', '1', '2', 83, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-08 20:43:00', '2022-12-08 20:43:00'),
(368, '102020100086', '84-Siraj(সিরাজ)', 'Customer Receivable', 4, 'A', '1', '2', 84, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-08 20:44:28', '2022-12-08 20:44:28'),
(369, '102020100087', '85-রাতুল 2(রাতুল ২)', 'Customer Receivable', 4, 'A', '1', '2', 85, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-08 20:46:12', '2022-12-08 20:46:12'),
(370, '102020100088', '86-Ma(মা )', 'Customer Receivable', 4, 'A', '1', '2', 86, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-08 20:48:54', '2022-12-08 20:48:54'),
(371, '102020100089', '87-Sayed( সাঈদ)', 'Customer Receivable', 4, 'A', '1', '2', 87, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 12:47:35', '2022-12-10 12:47:35'),
(372, '102020100090', '88-Hazrat(হযরত)', 'Customer Receivable', 4, 'A', '1', '2', 88, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 12:49:35', '2022-12-10 12:49:35'),
(373, '102020100091', '89-Alauddin(আলাউদ্দিন)', 'Customer Receivable', 4, 'A', '1', '2', 89, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 12:51:53', '2022-12-10 12:51:53'),
(374, '102020100092', '90-Bismillha(বিসমিল্লাহ)', 'Customer Receivable', 4, 'A', '1', '2', 90, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 12:56:24', '2022-12-10 12:56:24'),
(375, '102020100093', '91-Ma moni( মা মনি)', 'Customer Receivable', 4, 'A', '1', '2', 91, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 12:57:51', '2022-12-10 12:57:51'),
(376, '102020100094', '92-Madina(মদিনা)', 'Customer Receivable', 4, 'A', '1', '2', 92, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 12:59:34', '2022-12-10 12:59:34'),
(377, '102020100095', '93-Tayem(তাইম)', 'Customer Receivable', 4, 'A', '1', '2', 93, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 13:02:24', '2022-12-10 13:02:24'),
(378, '102020100096', '94-Shawly(শিউলি)', 'Customer Receivable', 4, 'A', '1', '2', 94, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 13:05:23', '2022-12-10 13:05:23'),
(379, '102020100097', '95-Kumilla(কুমিল্লা)', 'Customer Receivable', 4, 'A', '1', '2', 95, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 13:07:06', '2022-12-10 13:07:06'),
(380, '102020100098', '96-Nishat(নিশাত)', 'Customer Receivable', 4, 'A', '1', '2', 96, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 13:09:48', '2022-12-10 13:09:48'),
(381, '102020100099', '97-Alvi(আলভী)', 'Customer Receivable', 4, 'A', '1', '2', 97, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 13:21:06', '2022-12-10 13:21:06'),
(382, '102020100100', '98-Alamin(আলিমন)', 'Customer Receivable', 4, 'A', '1', '2', 98, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 13:22:02', '2022-12-10 13:22:02'),
(383, '102020100101', '99-Shahanaj( শাহনাজ )', 'Customer Receivable', 4, 'A', '1', '2', 99, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 13:44:49', '2022-12-10 13:44:49'),
(384, '102020100102', '100-Mashud( মাসুদ)', 'Customer Receivable', 4, 'A', '1', '2', 100, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 13:46:00', '2022-12-10 13:46:00'),
(385, '102020100103', '101-Riphon( রিপন )', 'Customer Receivable', 4, 'A', '1', '2', 101, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 13:47:31', '2022-12-10 13:47:31'),
(386, '102020100104', '102-Bickrompur(বিক্রমপুর)', 'Customer Receivable', 4, 'A', '1', '2', 102, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 13:49:47', '2022-12-10 13:49:47'),
(387, '102020100105', '103-Almokka( আল মক্কা )', 'Customer Receivable', 4, 'A', '1', '2', 103, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 13:51:42', '2022-12-10 13:51:42'),
(388, '102020100106', '104-Rakib(রাকিব)', 'Customer Receivable', 4, 'A', '1', '2', 104, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 13:54:29', '2022-12-10 13:54:29'),
(389, '102020100107', '105-Shikder( সিকদার এন্টারপ্রাইজ )', 'Customer Receivable', 4, 'A', '1', '2', 105, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 13:56:14', '2022-12-10 13:56:14'),
(390, '102020100108', '106-Shahanaj( শাহনাজ )', 'Customer Receivable', 4, 'A', '1', '2', 106, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 13:57:36', '2022-12-10 13:57:36'),
(391, '102020100109', '107-Mijan(মিজান)', 'Customer Receivable', 4, 'A', '1', '2', 107, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 13:59:06', '2022-12-10 13:59:06'),
(392, '102020100110', '108-Samiya(সামিয়া)', 'Customer Receivable', 4, 'A', '1', '2', 108, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 14:00:29', '2022-12-10 14:00:29'),
(393, '102020100111', '109-Sultan(সুলতান)', 'Customer Receivable', 4, 'A', '1', '2', 109, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 14:01:56', '2022-12-10 14:01:56'),
(394, '102020100112', '110-Shohid(শহীদ)', 'Customer Receivable', 4, 'A', '1', '2', 110, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 14:03:23', '2022-12-10 14:03:23'),
(395, '102020100113', '111-Mayer Dowa shobji bitan(মায়ের দোয়া সবজি বিতান)', 'Customer Receivable', 4, 'A', '1', '2', 111, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 14:06:32', '2022-12-10 14:06:32'),
(396, '102020100114', '112-Mariya(মারিয়া)', 'Customer Receivable', 4, 'A', '1', '2', 112, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 14:08:45', '2022-12-10 14:08:45'),
(397, '102020100115', '113-Jorna(ঝরনা)', 'Customer Receivable', 4, 'A', '1', '2', 113, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 14:11:07', '2022-12-10 14:11:07'),
(398, '102020100116', '114-Siyam(সিয়াম)', 'Customer Receivable', 4, 'A', '1', '2', 114, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 14:12:27', '2022-12-10 14:12:27'),
(399, '102020100117', '115-Ahad(আহাদ )', 'Customer Receivable', 4, 'A', '1', '2', 115, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 14:13:41', '2022-12-10 14:13:41'),
(400, '102020100118', '116-Ma Baber Dowa( মা-বাবার দোয়া )', 'Customer Receivable', 4, 'A', '1', '2', 116, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 14:15:53', '2022-12-10 14:15:53'),
(401, '102020100119', '117-Jahid 2( জাহিদ ২ )', 'Customer Receivable', 4, 'A', '1', '2', 117, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 14:17:47', '2022-12-10 14:17:47'),
(402, '102020100120', '118-Allahordan( আল্লাহর দান )', 'Customer Receivable', 4, 'A', '1', '2', 118, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 14:19:35', '2022-12-10 14:19:35'),
(403, '102020100121', '119-Rahi Madicin Corner( রাহি মেডিসিন কর্নার )', 'Customer Receivable', 4, 'A', '1', '2', 119, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 14:22:46', '2022-12-10 14:22:46'),
(404, '102020100122', '120-Adori mariya T store( আদরি মারিয়া টি স্টোর )', 'Customer Receivable', 4, 'A', '1', '2', 120, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 14:25:14', '2022-12-10 14:25:14'),
(405, '102020100123', '121-Jahid 1(জাহিদ ১)', 'Customer Receivable', 4, 'A', '1', '2', 121, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 14:27:06', '2022-12-10 14:27:06'),
(406, '102020100124', '122-Samiha( সামিহা )', 'Customer Receivable', 4, 'A', '1', '2', 122, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 14:28:28', '2022-12-10 14:28:28'),
(407, '102020100125', '123-Mordan fashon( মর্ডান ফেশন )', 'Customer Receivable', 4, 'A', '1', '2', 123, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 14:30:50', '2022-12-10 14:30:50'),
(408, '102020100126', '124-Alamin(আলিমন)', 'Customer Receivable', 4, 'A', '1', '2', 124, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 14:31:51', '2022-12-10 14:31:51'),
(409, '102020100127', '125-Khokhon(খোকন)', 'Customer Receivable', 4, 'A', '1', '2', 125, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 14:36:42', '2022-12-10 14:36:42'),
(410, '102020100128', '126-Mashud( মাসুদ)', 'Customer Receivable', 4, 'A', '1', '2', 126, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 14:37:36', '2022-12-10 14:37:36'),
(411, '102020100129', '127-Anower(আনোয়ার ইসলাম)', 'Customer Receivable', 4, 'A', '1', '2', 127, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 14:44:39', '2022-12-10 14:44:39'),
(412, '102020100130', '128-Lokkhipur(লক্ষীপুর)', 'Customer Receivable', 4, 'A', '1', '2', 128, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 14:47:25', '2022-12-10 14:47:25'),
(413, '5020100026', 'Office Sale', 'Account Payable', 3, 'L', '1', '2', NULL, NULL, NULL, 4, NULL, NULL, NULL, '2', '2', 0, '1', 'Admin', NULL, '2022-12-12 13:57:12', '2022-12-12 13:57:12'),
(414, '102020100131', '129-Hasan(হাসান)', 'Customer Receivable', 4, 'A', '1', '2', 129, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 15:12:12', '2022-12-13 15:12:12'),
(415, '10202030002', 'Joyonto Kumar', 'Dealer Receivable', 4, 'A', '1', '2', NULL, NULL, NULL, NULL, 1, NULL, NULL, '2', '2', 0, '1', 'Super Admin', NULL, '2023-03-04 09:05:12', '2023-03-04 09:05:12'),
(416, '102020100132', '130-shuvo sarker', 'Customer Receivable', 4, 'A', '1', '2', 130, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Super Admin', NULL, '2023-03-04 11:40:15', '2023-03-04 11:40:15'),
(417, '102020100133', '131-James bond', 'Customer Receivable', 4, 'A', '1', '2', 131, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Super Admin', NULL, '2023-03-04 11:56:09', '2023-03-04 11:56:09'),
(418, '102020100134', '132-hadi', 'Customer Receivable', 4, 'A', '1', '2', 132, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Super Admin', NULL, '2023-03-04 11:59:56', '2023-03-04 11:59:56'),
(419, '102020100135', '133-Almas ahmed', 'Customer Receivable', 4, 'A', '1', '2', 133, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Super Admin', NULL, '2023-03-05 04:38:32', '2023-03-05 04:38:32'),
(420, '102010201', 'dutch bangla bank', 'Cash At Bank', 4, 'A', '1', '2', NULL, NULL, NULL, NULL, NULL, 1, NULL, '2', '2', 0, '1', 'Super Admin', 'Super Admin', '2023-03-05 11:05:14', '2023-03-05 11:06:25'),
(421, '102010202', 'city bank', 'Cash At Bank', 4, 'A', '1', '2', NULL, NULL, NULL, NULL, NULL, 2, NULL, '2', '2', 0, '1', 'Super Admin', 'Super Admin', '2023-03-05 11:05:28', '2023-03-05 11:06:45'),
(422, '102010203', 'Standard Chartered', 'Cash At Bank', 4, 'A', '1', '2', NULL, NULL, NULL, NULL, NULL, 3, NULL, '2', '2', 0, '1', 'Super Admin', NULL, '2023-03-05 11:07:07', '2023-03-05 11:07:07'),
(423, '102020100136', '134-Nur Customer 1', 'Customer Receivable', 4, 'A', '1', '2', 134, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Super Admin', NULL, '2023-03-20 05:06:32', '2023-03-20 05:06:32'),
(424, '102020100137', '135-Nur Customer 2', 'Customer Receivable', 4, 'A', '1', '2', 135, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Super Admin', NULL, '2023-03-20 05:07:52', '2023-03-20 05:07:52'),
(425, '5020100027', '1-Nur Alam', 'Account Payable', 3, 'L', '1', '2', NULL, 1, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Super Admin', NULL, '2023-03-20 07:45:31', '2023-03-20 07:45:31'),
(426, '5020100028', '2-Abdul hadi', 'Account Payable', 3, 'L', '1', '2', NULL, 2, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Super Admin', NULL, '2023-03-20 07:56:45', '2023-03-20 07:56:45'),
(427, '102020100138', '1-Olga Hansen', 'Customer Receivable', 4, 'A', '1', '2', 1, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Super Admin', NULL, '2023-03-20 10:27:49', '2023-03-20 10:27:49'),
(428, '10202030003', 'Panda dealer', 'Dealer Receivable', 4, 'A', '1', '2', NULL, NULL, NULL, NULL, 2, NULL, NULL, '2', '2', 0, '1', 'Super Admin', NULL, '2023-03-21 03:32:27', '2023-03-21 03:32:27'),
(429, '102010301', 'bkash', 'Cash At Mobile Bank', 4, 'A', '1', '2', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2', '2', 0, '1', 'Super Admin', NULL, '2023-03-21 03:43:12', '2023-03-21 03:43:12'),
(430, '10202030004', 'D-1', 'Dealer Receivable', 4, 'A', '1', '2', NULL, NULL, NULL, NULL, 3, NULL, NULL, '2', '2', 0, '1', 'Super Admin', NULL, '2023-03-22 11:43:53', '2023-03-22 11:43:53'),
(431, '10202030005', 'D-2', 'Dealer Receivable', 4, 'A', '1', '2', NULL, NULL, NULL, NULL, 4, NULL, NULL, '2', '2', 0, '1', 'Super Admin', NULL, '2023-03-22 11:45:27', '2023-03-22 11:45:27'),
(432, '102020100139', '2-customer-1', 'Customer Receivable', 4, 'A', '1', '2', 2, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Super Admin', NULL, '2023-03-31 09:55:54', '2023-03-31 09:55:54'),
(433, '40201', 'mat purchase', 'Material Purchase', 2, 'E', '2', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Super Admin', NULL, '2023-04-01 14:13:17', '2023-04-01 14:13:17'),
(434, '4000009', '4-process cost', 'Expense', 1, 'E', '1', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 1, '1', 'Super Admin', NULL, '2023-04-01 14:14:36', '2023-04-01 14:14:36'),
(435, '4000010', '5-bank interest', 'Expense', 1, 'E', '1', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 1, '1', 'Super Admin', NULL, '2023-04-01 14:14:50', '2023-04-01 14:14:50'),
(436, '4000011', '6-transportation', 'Expense', 1, 'E', '1', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 1, '1', 'Super Admin', NULL, '2023-04-01 14:15:08', '2023-04-01 14:15:08'),
(437, '102010302', 'Rocket', 'Cash At Mobile Bank', 4, 'A', '1', '2', NULL, NULL, NULL, NULL, NULL, NULL, 2, '2', '2', 0, '1', 'Super Admin', NULL, '2023-04-30 03:20:26', '2023-04-30 03:20:26'),
(438, '102010303', 'Nagad', 'Cash At Mobile Bank', 4, 'A', '1', '2', NULL, NULL, NULL, NULL, NULL, NULL, 3, '2', '2', 0, '1', 'Super Admin', NULL, '2023-04-30 03:20:46', '2023-04-30 03:20:46'),
(439, '102020100140', '3-Abubakar Siddik', 'Customer Receivable', 4, 'A', '1', '2', 3, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Super Admin', NULL, '2023-05-02 06:04:29', '2023-05-02 06:04:29'),
(440, '5020100029', '3-Omar Faruk', 'Account Payable', 3, 'L', '1', '2', NULL, 3, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Super Admin', NULL, '2023-05-02 06:06:14', '2023-05-02 06:06:14'),
(441, '10202030006', 'Md. Ali', 'Dealer Receivable', 4, 'A', '1', '2', NULL, NULL, NULL, NULL, 5, NULL, NULL, '2', '2', 0, '1', 'Super Admin', NULL, '2023-05-02 08:53:46', '2023-05-02 08:53:46'),
(442, '5020100030', '4-Nazrul Islam', 'Account Payable', 3, 'L', '1', '2', NULL, 4, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Super Admin', NULL, '2023-05-06 07:35:46', '2023-05-06 07:35:46'),
(443, '10202030007', 'Tuhin', 'Dealer Receivable', 4, 'A', '1', '2', NULL, NULL, NULL, NULL, 6, NULL, NULL, '2', '2', 0, '1', 'Super Admin', NULL, '2023-05-06 08:41:36', '2023-05-06 08:41:36'),
(444, '4000012', '7-Car Purchase', 'Expense', 1, 'E', '1', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 1, '1', 'Super Admin', NULL, '2023-05-06 09:05:42', '2023-05-06 09:05:42'),
(445, '5020100031', '1-reza', 'Account Payable', 3, 'L', '1', '2', NULL, 1, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Super Admin', NULL, '2023-05-14 16:49:35', '2023-05-14 16:49:35'),
(446, '4000013', '8-Electric bill', 'Expense', 1, 'E', '1', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 1, '1', 'Super Admin', NULL, '2023-05-21 09:31:26', '2023-05-21 09:31:26'),
(447, '4000014', '9-Paper bill', 'Expense', 1, 'E', '1', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 1, '1', 'Super Admin', NULL, '2023-05-21 09:31:37', '2023-05-21 09:31:37'),
(448, '102020100141', '1-James Bond', 'Customer Receivable', 4, 'A', '1', '2', 1, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Super Admin', NULL, '2023-05-23 11:34:25', '2023-05-23 11:34:25'),
(449, '10202030008', 'Rony', 'Dealer Receivable', 4, 'A', '1', '2', NULL, NULL, NULL, NULL, 1, NULL, NULL, '2', '2', 0, '1', 'Super Admin', NULL, '2023-05-27 06:20:35', '2023-05-27 06:20:35'),
(450, '102010204', 'Dutch Bangla', 'Cash At Bank', 4, 'A', '1', '2', NULL, NULL, NULL, NULL, NULL, 1, NULL, '2', '2', 0, '1', 'Super Admin', NULL, '2023-05-29 09:41:48', '2023-05-29 09:41:48'),
(451, '5020100032', '2-Justin', 'Account Payable', 3, 'L', '1', '2', NULL, 2, NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Super Admin', NULL, '2023-05-31 04:03:04', '2023-05-31 04:03:04');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shop_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `warehouse_id` int NOT NULL,
  `customer_group_id` bigint UNSIGNED NOT NULL,
  `district_id` bigint UNSIGNED NOT NULL,
  `upazila_id` bigint UNSIGNED NOT NULL,
  `area_id` bigint UNSIGNED NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `shop_name`, `mobile`, `email`, `avatar`, `warehouse_id`, `customer_group_id`, `district_id`, `upazila_id`, `area_id`, `address`, `status`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'James Bond', 'bond Shop', '01236325984', 'bond@b2gsoft.com', NULL, 5, 1, 2, 3, 4, 'house-44, road-8/A, Nikunjo-1, Khillket, Dhaka-1229', '1', 'Super Admin', 'Super Admin', '2023-05-23 11:34:25', '2023-05-27 11:13:35');

-- --------------------------------------------------------

--
-- Table structure for table `customer_groups`
--

CREATE TABLE `customer_groups` (
  `id` bigint UNSIGNED NOT NULL,
  `group_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `percentage` double(8,2) DEFAULT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=active,2=inactive',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_groups`
--

INSERT INTO `customer_groups` (`id`, `group_name`, `percentage`, `status`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'Regular', 0.00, '1', 'Super Admin', NULL, '2023-03-20 10:27:14', '2023-03-20 10:27:14'),
(2, 'VIP', 5.00, '1', 'Super Admin', NULL, '2023-05-23 11:33:21', '2023-05-23 11:33:21');

-- --------------------------------------------------------

--
-- Table structure for table `daily_attendances`
--

CREATE TABLE `daily_attendances` (
  `id` bigint UNSIGNED NOT NULL,
  `employee_id` int NOT NULL,
  `attend_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `user_type` tinyint NOT NULL COMMENT '1 = Employee, 2 = Labour',
  `approval_status` tinyint NOT NULL DEFAULT '0',
  `approve_remarks` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approved_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `daily_closings`
--

CREATE TABLE `daily_closings` (
  `id` bigint UNSIGNED NOT NULL,
  `warehouse_id` bigint UNSIGNED NOT NULL,
  `last_day_closing` double DEFAULT NULL,
  `cash_in` double DEFAULT NULL,
  `cash_out` double DEFAULT NULL,
  `balance` double DEFAULT NULL,
  `transfer` double DEFAULT NULL,
  `closing_amount` double DEFAULT NULL,
  `adjustment` double DEFAULT NULL,
  `date` date NOT NULL,
  `thousands` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `five_hundred` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `two_hundred` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hundred` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `fifty` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `twenty` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `ten` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `five` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `two` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `one` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `damages`
--

CREATE TABLE `damages` (
  `id` bigint UNSIGNED NOT NULL,
  `damage_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `memo_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouse_id` bigint UNSIGNED DEFAULT NULL,
  `customer_id` bigint UNSIGNED DEFAULT NULL,
  `total_price` double NOT NULL,
  `total_deduction` double DEFAULT NULL,
  `tax_rate` double DEFAULT NULL,
  `total_tax` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `deducted_sr_commission` bigint DEFAULT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci,
  `date` date NOT NULL,
  `damage_date` date NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `damage_products`
--

CREATE TABLE `damage_products` (
  `id` bigint UNSIGNED NOT NULL,
  `damage_id` bigint UNSIGNED NOT NULL,
  `memo_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `damage_qty` double NOT NULL,
  `unit_id` bigint UNSIGNED DEFAULT NULL,
  `product_rate` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dealers`
--

CREATE TABLE `dealers` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shop_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `warehouse_id` bigint UNSIGNED NOT NULL,
  `district_id` bigint UNSIGNED NOT NULL,
  `upazila_id` bigint UNSIGNED NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dealers`
--

INSERT INTO `dealers` (`id`, `name`, `shop_name`, `mobile`, `username`, `password`, `email`, `avatar`, `warehouse_id`, `district_id`, `upazila_id`, `address`, `status`, `created_by`, `modified_by`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Rony', 'abc', '01239872586', 'rony', '$2y$10$qpdsIyLCqpuZTIEFTzqsOuwqcZs6sFsJ7W8SBOk0ubluhqGTuPL4e', 'rony@feedmill.com', NULL, 5, 2, 3, 'er,werwe,werw', '1', 'Super Admin', NULL, NULL, '2023-05-27 06:20:35', '2023-05-27 06:20:35');

-- --------------------------------------------------------

--
-- Table structure for table `dealer_deliveries`
--

CREATE TABLE `dealer_deliveries` (
  `id` bigint UNSIGNED NOT NULL,
  `dealer_sale_id` bigint DEFAULT NULL,
  `dealer_id` bigint UNSIGNED DEFAULT NULL,
  `warehouse_id` bigint UNSIGNED DEFAULT NULL,
  `total_delivery_quantity` bigint DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `note` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dealer_deliveries`
--

INSERT INTO `dealer_deliveries` (`id`, `dealer_sale_id`, `dealer_id`, `warehouse_id`, `total_delivery_quantity`, `delivery_date`, `note`, `created_at`, `updated_at`) VALUES
(1, 2, 3, 1, 5, '2023-03-29', 'ssss', '2023-03-29 08:18:13', '2023-03-29 08:18:13'),
(2, 3, 4, 1, 8, '2023-03-29', NULL, '2023-03-29 08:47:52', '2023-03-29 08:47:52'),
(3, 2, 3, 1, 5, '2023-03-29', 'sss', '2023-03-29 09:18:15', '2023-03-29 09:18:15'),
(4, 3, 4, 1, 7, '2023-04-10', NULL, '2023-04-10 06:45:43', '2023-04-10 06:45:43'),
(5, 7, 1, 2, 1, '2023-04-27', NULL, '2023-04-27 04:20:06', '2023-04-27 04:20:06'),
(6, 8, 1, 1, 10, '2023-04-29', NULL, '2023-04-29 03:26:19', '2023-04-29 03:26:19'),
(7, 14, 6, 4, 10, '2023-05-06', 'fully delivered', '2023-05-06 08:45:23', '2023-05-06 08:45:23');

-- --------------------------------------------------------

--
-- Table structure for table `dealer_delivery_products`
--

CREATE TABLE `dealer_delivery_products` (
  `id` bigint UNSIGNED NOT NULL,
  `dealer_delivery_id` bigint UNSIGNED DEFAULT NULL,
  `product_id` bigint UNSIGNED DEFAULT NULL,
  `stock_qty` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivered_qty` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_qty` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dealer_products`
--

CREATE TABLE `dealer_products` (
  `id` bigint UNSIGNED NOT NULL,
  `dealer_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `commission_rate` double(8,2) NOT NULL,
  `commission_percentage` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dealer_products`
--

INSERT INTO `dealer_products` (`id`, `dealer_id`, `product_id`, `commission_rate`, `commission_percentage`, `created_at`, `updated_at`) VALUES
(1, 1, 8, 5.00, 5.00, '2023-05-27 06:20:35', '2023-05-27 06:20:35');

-- --------------------------------------------------------

--
-- Table structure for table `dealer_sales`
--

CREATE TABLE `dealer_sales` (
  `id` bigint UNSIGNED NOT NULL,
  `memo_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dealer_id` bigint UNSIGNED DEFAULT NULL,
  `sale_date` date NOT NULL,
  `document` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_qty` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_free_qty` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_delivery_quantity` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_tax` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_commission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_tax` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_tax_rate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_discount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_cost` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `labor_cost` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `previous_due` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `net_total` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grand_total` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `due_amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Paid,2=Partial,3=Due',
  `payment_method` enum('1','2','3') COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '1=Cash,2=Bank Deposit,3=Mobile',
  `reference_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_id` bigint UNSIGNED DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `status` enum('1','2','3') COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '1=Pending,2=Approved,3=Reject',
  `order_type` enum('1','2') COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '1 = office , 2 = dealer',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dealer_sales`
--

INSERT INTO `dealer_sales` (`id`, `memo_no`, `dealer_id`, `sale_date`, `document`, `item`, `total_qty`, `total_free_qty`, `total_delivery_quantity`, `total_tax`, `total_price`, `total_commission`, `order_tax`, `order_tax_rate`, `order_discount`, `shipping_cost`, `labor_cost`, `previous_due`, `net_total`, `paid_amount`, `grand_total`, `due_amount`, `payment_status`, `payment_method`, `reference_no`, `account_id`, `note`, `status`, `order_type`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'DINV-230527307', 1, '2023-05-27', NULL, '1', '2', '0', '0', '0.00', '190.00', '190.00', '0.00', '0', NULL, NULL, NULL, '0.00', '190.00', '0', '190.00', '190.00', '3', NULL, NULL, NULL, NULL, '3', '1', 'Super Admin', NULL, '2023-05-27 06:21:22', '2023-05-27 06:26:20'),
(2, 'DINV-230531309', 1, '2023-05-31', NULL, '1', '1', '0', '0', '0.00', '95.00', '95.00', '0.00', '0', NULL, '5', NULL, '0.00', '100.00', '100.00', '100.00', '0.00', '1', '1', NULL, 23, NULL, '1', '1', 'Super Admin', NULL, '2023-05-31 04:12:38', '2023-05-31 04:12:38'),
(3, 'DINV-230531760', 1, '2023-05-31', NULL, '1', '7', '0', '0', '0.00', '665.00', '0.00', '0.00', '0', '0.00', '10.00', '15.00', '0.00', '690.00', '0', '690.00', '690.00', '3', NULL, NULL, NULL, NULL, '1', '1', 'Saifur Rahman', 'Super Admin', '2023-05-31 05:00:02', '2023-05-31 06:07:24');

-- --------------------------------------------------------

--
-- Table structure for table `dealer_sale_products`
--

CREATE TABLE `dealer_sale_products` (
  `id` bigint UNSIGNED NOT NULL,
  `dealer_sale_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `qty` double NOT NULL,
  `free_qty` double NOT NULL,
  `delivered_qty` double NOT NULL,
  `sale_unit_id` bigint UNSIGNED DEFAULT NULL,
  `net_unit_price` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dealer_sale_products`
--

INSERT INTO `dealer_sale_products` (`id`, `dealer_sale_id`, `product_id`, `qty`, `free_qty`, `delivered_qty`, `sale_unit_id`, `net_unit_price`, `discount`, `tax_rate`, `tax`, `total`, `created_at`, `updated_at`) VALUES
(1, 1, 8, 2, 0, 0, 2, 95, 0, 0, 0, 190, NULL, NULL),
(2, 2, 8, 1, 0, 0, 2, 95, 0, 0, 0, 95, NULL, NULL),
(4, 3, 8, 7, 0, 0, 2, 95, 0, 0, 0, 665, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `deductions`
--

CREATE TABLE `deductions` (
  `id` bigint UNSIGNED NOT NULL,
  `created_by` int NOT NULL,
  `employee_id` int NOT NULL,
  `deduction_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deduction_month` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deduction_amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deduction_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `type` tinyint NOT NULL COMMENT '1 = Employee, 2 = Labour',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deductions`
--

INSERT INTO `deductions` (`id`, `created_by`, `employee_id`, `deduction_name`, `deduction_month`, `deduction_amount`, `deduction_description`, `status`, `type`, `created_at`, `updated_at`) VALUES
(1, 0, 2, 'ssssssss', '2023-04', '100', 'dddddddddddd', 1, 1, '2023-03-30 09:56:04', '2023-03-30 09:56:04'),
(2, 0, 1, 'ssssssss', '2023-04', '100', 'dddddddddddd', 1, 2, '2023-03-30 10:06:32', '2023-03-30 10:06:32');

-- --------------------------------------------------------

--
-- Table structure for table `deliveries`
--

CREATE TABLE `deliveries` (
  `id` bigint UNSIGNED NOT NULL,
  `sale_id` bigint UNSIGNED DEFAULT NULL,
  `salesmen_id` bigint UNSIGNED DEFAULT NULL,
  `customer_id` bigint UNSIGNED DEFAULT NULL,
  `warehouse_id` bigint UNSIGNED DEFAULT NULL,
  `total_delivery_quantity` bigint DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `note` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deliveries`
--

INSERT INTO `deliveries` (`id`, `sale_id`, `salesmen_id`, `customer_id`, `warehouse_id`, `total_delivery_quantity`, `delivery_date`, `note`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 1, 1, 5, '2023-03-27', 'ss', '2023-03-27 07:39:10', '2023-03-27 07:39:10'),
(2, 1, NULL, 1, 1, 5, '2023-03-27', NULL, '2023-03-27 07:40:22', '2023-03-27 07:40:22'),
(3, 2, NULL, 1, 2, 5, '2023-03-28', NULL, '2023-03-28 06:07:11', '2023-03-28 06:07:11'),
(4, 3, NULL, 1, 1, 6, '2023-03-29', NULL, '2023-03-29 08:39:54', '2023-03-29 08:39:54'),
(5, 3, NULL, 1, 1, 4, '2023-03-29', NULL, '2023-03-29 08:41:19', '2023-03-29 08:41:19'),
(6, 6, NULL, 1, 1, 3, '2023-03-31', NULL, '2023-03-31 10:00:51', '2023-03-31 10:00:51'),
(7, 6, NULL, 1, 1, 2, '2023-03-31', NULL, '2023-03-31 10:02:59', '2023-03-31 10:02:59'),
(8, 7, NULL, 1, 1, 3, '2023-04-02', NULL, '2023-04-02 10:05:57', '2023-04-02 10:05:57'),
(9, 18, NULL, 3, 4, 12, '2023-05-09', 'full delivered', '2023-05-09 09:04:54', '2023-05-09 09:04:54'),
(10, 23, NULL, 1, 5, 1, '2023-05-31', NULL, '2023-05-31 07:01:10', '2023-05-31 07:01:10');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_products`
--

CREATE TABLE `delivery_products` (
  `id` bigint UNSIGNED NOT NULL,
  `delivery_id` bigint UNSIGNED DEFAULT NULL,
  `product_id` bigint UNSIGNED DEFAULT NULL,
  `stock_qty` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivered_qty` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_qty` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery_products`
--

INSERT INTO `delivery_products` (`id`, `delivery_id`, `product_id`, `stock_qty`, `delivered_qty`, `delivery_qty`, `created_at`, `updated_at`) VALUES
(1, 10, 8, '6', '0', '1', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `depart_code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `deletable` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=No, 2=Yes',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `designations`
--

CREATE TABLE `designations` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `deletable` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=No, 2=Yes',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `designations`
--

INSERT INTO `designations` (`id`, `name`, `status`, `deletable`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'Engr', '1', '2', 'Super Admin', 'Super Admin', '2023-03-12 12:27:01', '2023-03-30 08:02:47'),
(2, 'HR', '1', '2', 'Super Admin', NULL, '2023-03-12 12:27:11', '2023-03-12 12:27:11');

-- --------------------------------------------------------

--
-- Table structure for table `divisions`
--

CREATE TABLE `divisions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department_id` bigint UNSIGNED NOT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `deletable` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=No, 2=Yes',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `drivers`
--

CREATE TABLE `drivers` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nid_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `licence_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int DEFAULT NULL,
  `employee_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `father_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mother_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `spouse_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `present_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permanent_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home_district` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `academic_qualification` text COLLATE utf8mb4_unicode_ci,
  `professional_qualification` text COLLATE utf8mb4_unicode_ci,
  `joining_date` date DEFAULT NULL,
  `experience` text COLLATE utf8mb4_unicode_ci,
  `reference` text COLLATE utf8mb4_unicode_ci,
  `id_name` tinyint DEFAULT NULL COMMENT '1 for NID, 2 Passport, 3 for Driving License',
  `id_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_no_one` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_no_two` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emergency_contact` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `web` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `marital_status` tinyint DEFAULT NULL COMMENT '1 for Married, Single, 3 for Divorced, 4 for Separated, 5 for Widowed',
  `branch_id` int DEFAULT NULL,
  `designation_id` int DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  `activation_status` tinyint NOT NULL DEFAULT '1' COMMENT '1 for Active, 2 for Inactive',
  `blood_group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1 for Active, 2 for Retired',
  `retired_date` date DEFAULT NULL,
  `deletion_status` tinyint NOT NULL DEFAULT '0',
  `joining_month` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `resume` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_leave_apps`
--

CREATE TABLE `employee_leave_apps` (
  `id` bigint UNSIGNED NOT NULL,
  `created_by` bigint NOT NULL,
  `leave_category` bigint NOT NULL,
  `employee_id` bigint NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `purpose` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1 = Active 2 = Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint UNSIGNED NOT NULL,
  `warehouse_id` bigint UNSIGNED NOT NULL,
  `expense_item_id` bigint UNSIGNED NOT NULL,
  `voucher_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double NOT NULL,
  `date` date NOT NULL,
  `payment_type` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Cash,2=Bank,3=Mobile',
  `account_id` bigint UNSIGNED NOT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `warehouse_id`, `expense_item_id`, `voucher_no`, `amount`, `date`, `payment_type`, `account_id`, `remarks`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 5, 8, 'EXP-20230524171714767', 2500, '2023-05-24', '1', 23, 'paid current bill may,20232', 'Super Admin', NULL, '2023-05-24 11:17:14', '2023-05-24 11:17:14'),
(2, 5, 9, 'EXP-20230524173403214', 6000, '2023-05-24', '2', 420, 'paid foe paper bill', 'Super Admin', NULL, '2023-05-24 11:34:03', '2023-05-24 11:34:03');

-- --------------------------------------------------------

--
-- Table structure for table `expense_items`
--

CREATE TABLE `expense_items` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expense_items`
--

INSERT INTO `expense_items` (`id`, `name`, `status`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'Asset', '1', 'Admin', NULL, '2022-12-06 12:32:48', '2022-12-06 12:32:48'),
(2, 'Product Received Cost (Labour Cost)', '1', 'Admin', 'Admin', '2022-12-07 16:32:45', '2022-12-07 16:33:54'),
(3, 'Inventory Transfer Cost', '1', 'Admin', 'Admin', '2022-12-07 16:33:18', '2022-12-07 16:33:47'),
(6, 'transportation', '1', 'Super Admin', NULL, '2023-04-01 14:15:08', '2023-04-01 14:15:08'),
(7, 'Car Purchase', '1', 'Super Admin', NULL, '2023-05-06 09:05:42', '2023-05-06 09:05:42'),
(8, 'Electric bill', '1', 'Super Admin', NULL, '2023-05-21 09:31:26', '2023-05-21 09:31:26'),
(9, 'Paper bill', '1', 'Super Admin', NULL, '2023-05-21 09:31:37', '2023-05-21 09:31:37');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

CREATE TABLE `holidays` (
  `id` bigint UNSIGNED NOT NULL,
  `created_by` int NOT NULL,
  `holiday_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `publication_status` tinyint NOT NULL,
  `deletion_status` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `increments`
--

CREATE TABLE `increments` (
  `id` bigint UNSIGNED NOT NULL,
  `employee_id` int NOT NULL,
  `created_by` int NOT NULL,
  `amount` double NOT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `incr_purpose` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `increments`
--

INSERT INTO `increments` (`id`, `employee_id`, `created_by`, `amount`, `date`, `incr_purpose`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 1000, '2023-04', 'ssss', '2023-03-30 09:58:40', '2023-03-30 09:58:40'),
(2, 5, 0, 5000, '2023-07', 'yearly increment', '2023-05-06 09:46:10', '2023-05-06 09:46:10');

-- --------------------------------------------------------

--
-- Table structure for table `labor_bills`
--

CREATE TABLE `labor_bills` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=active,2=inactive',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `labor_bill_rates`
--

CREATE TABLE `labor_bill_rates` (
  `id` bigint UNSIGNED NOT NULL,
  `labor_bill_id` bigint UNSIGNED NOT NULL,
  `unit_id` bigint UNSIGNED NOT NULL,
  `rate` double(8,2) NOT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=active,2=inactive',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `labours`
--

CREATE TABLE `labours` (
  `id` bigint UNSIGNED NOT NULL,
  `labour_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `present_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `joining_date` date DEFAULT NULL,
  `joining_month` date DEFAULT NULL,
  `id_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_no_one` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `emergency_contact` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `marital_status` tinyint DEFAULT NULL COMMENT '1 for Married, Single, 3 for Divorced, 4 for Separated, 5 for Widowed',
  `branch_id` int DEFAULT NULL,
  `blood_group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1 for Active, 2 for Retired',
  `retired_date` date DEFAULT NULL,
  `date` date NOT NULL,
  `created_by` int DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `resume` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `basic_salary` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `labours`
--

INSERT INTO `labours` (`id`, `labour_id`, `name`, `gender`, `present_address`, `joining_date`, `joining_month`, `id_number`, `contact_no_one`, `emergency_contact`, `date_of_birth`, `marital_status`, `branch_id`, `blood_group`, `status`, `retired_date`, `date`, `created_by`, `modified_by`, `resume`, `basic_salary`, `created_at`, `updated_at`) VALUES
(1, 'L-1', 'l-1', '1', 'webst malibugh, dhaka', '2023-03-01', '0000-00-00', '11111111111', '01303560087', '01622007650', '2023-03-30', 2, 1, 'O+', 1, NULL, '0000-00-00', 1, NULL, NULL, 20000, '2023-03-30 08:09:02', '2023-03-30 08:09:02'),
(2, 'L-2', 'l-2', '1', 'Mirpur-1, Dhaka-1216', '2023-03-01', '0000-00-00', '399', '01303560082', '01622007652', '2023-03-30', 2, 1, 'O+', 1, NULL, '0000-00-00', 1, NULL, NULL, 10000, '2023-03-30 08:09:52', '2023-03-30 08:09:52'),
(3, 'L-3', 'Abu Rahan', '1', 'Commodi placeat cil', '2023-03-01', '0000-00-00', '3992222', '01303560081', NULL, '2023-03-30', 2, 2, 'A+', 1, NULL, '0000-00-00', 1, NULL, NULL, 10000, '2023-03-30 08:10:36', '2023-03-30 08:10:36');

-- --------------------------------------------------------

--
-- Table structure for table `labour_advances`
--

CREATE TABLE `labour_advances` (
  `id` bigint UNSIGNED NOT NULL,
  `created_by` int NOT NULL,
  `labour_id` int NOT NULL,
  `advance_month` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `advance_amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `advance_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `labour_advances`
--

INSERT INTO `labour_advances` (`id`, `created_by`, `labour_id`, `advance_month`, `advance_amount`, `advance_description`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 1, '2023-04', '1000', 'sss', 1, '2023-03-30 10:07:13', '2023-03-30 10:07:13');

-- --------------------------------------------------------

--
-- Table structure for table `labour_leave_apps`
--

CREATE TABLE `labour_leave_apps` (
  `id` bigint UNSIGNED NOT NULL,
  `created_by` bigint NOT NULL,
  `leave_category` bigint NOT NULL,
  `labour_id` bigint NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `purpose` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1 = Active 2 = Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `labour_salary_payment`
--

CREATE TABLE `labour_salary_payment` (
  `id` bigint UNSIGNED NOT NULL,
  `labour_id` bigint NOT NULL,
  `created_by` bigint NOT NULL,
  `basic_salary` double NOT NULL DEFAULT '0',
  `total_working_days` double NOT NULL DEFAULT '0',
  `avg_overtime_hour` double NOT NULL DEFAULT '0',
  `overtime_amount` double NOT NULL DEFAULT '0',
  `total_allowance` double NOT NULL DEFAULT '0',
  `total_gross_salary` double NOT NULL DEFAULT '0',
  `avg_absence_hour` double NOT NULL DEFAULT '0',
  `absence_amount` double NOT NULL DEFAULT '0',
  `salary_advance` double NOT NULL DEFAULT '0',
  `other_deduction` double NOT NULL DEFAULT '0',
  `total_deduction` double NOT NULL DEFAULT '0',
  `payable_salary` double NOT NULL DEFAULT '0',
  `net_payable` double NOT NULL DEFAULT '0',
  `bonus` double NOT NULL DEFAULT '0',
  `payment_month` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_type` tinyint NOT NULL COMMENT '1 for cash payment, 2 for chaque payment & 3 for bank payment',
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `labour_salary_payment`
--

INSERT INTO `labour_salary_payment` (`id`, `labour_id`, `created_by`, `basic_salary`, `total_working_days`, `avg_overtime_hour`, `overtime_amount`, `total_allowance`, `total_gross_salary`, `avg_absence_hour`, `absence_amount`, `salary_advance`, `other_deduction`, `total_deduction`, `payable_salary`, `net_payable`, `bonus`, `payment_month`, `payment_type`, `note`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 20000, 0, 0, 0, 0, 20000, 0, 0, 0, 0, 0, 20000, 20000, 0, '2023-03', 1, 'ddddddddddddddd', '2023-03-30 10:02:36', '2023-03-30 10:02:36'),
(2, 2, 1, 10000, 0, 0, 0, 0, 10000, 0, 0, 0, 0, 0, 10000, 10000, 0, '2023-03', 1, 'ddddddddddddddd', '2023-03-30 10:02:36', '2023-03-30 10:02:36'),
(3, 3, 1, 10000, 0, 0, 0, 0, 10000, 0, 0, 0, 0, 0, 10000, 10000, 0, '2023-03', 1, 'ddddddddddddddd', '2023-03-30 10:02:36', '2023-03-30 10:02:36');

-- --------------------------------------------------------

--
-- Table structure for table `leaves`
--

CREATE TABLE `leaves` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` int DEFAULT NULL,
  `leave_type` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Unpaid, 2=Paid',
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `deletable` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=No, 2=Yes',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `leaves`
--

INSERT INTO `leaves` (`id`, `name`, `short_name`, `number`, `leave_type`, `status`, `deletable`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'ww', 'ww', 217, '1', '1', '2', 'Super Admin', NULL, '2023-03-07 09:12:38', '2023-03-07 09:12:38');

-- --------------------------------------------------------

--
-- Table structure for table `leave_application_manages`
--

CREATE TABLE `leave_application_manages` (
  `id` bigint UNSIGNED NOT NULL,
  `leave_id` bigint UNSIGNED NOT NULL,
  `employee_id` bigint UNSIGNED NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `alternative_employee` int DEFAULT NULL,
  `number_leave` int DEFAULT NULL,
  `leave_type` int DEFAULT NULL,
  `employee_location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purpose` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comments` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `submission` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Pre, 2=Post',
  `leave_status` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Pending, 2=Accepted, 3=Cancel',
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `deletable` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=No, 2=Yes',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leave_categories`
--

CREATE TABLE `leave_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `created_by` int NOT NULL,
  `leave_category` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `leave_category_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loans`
--

CREATE TABLE `loans` (
  `id` bigint UNSIGNED NOT NULL,
  `loan_categories_id` bigint UNSIGNED NOT NULL,
  `bank_id` bigint UNSIGNED NOT NULL,
  `reference_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `loan_amount` bigint DEFAULT NULL,
  `loan_percentage_percent` bigint DEFAULT NULL,
  `loan_percentage_tk` bigint DEFAULT NULL,
  `processing_charge` bigint DEFAULT NULL,
  `misc_charge` bigint DEFAULT NULL,
  `apply_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_amount` bigint DEFAULT NULL,
  `total_installment_month` bigint DEFAULT NULL,
  `monthly_installment` bigint DEFAULT NULL,
  `document` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` longtext COLLATE utf8mb4_unicode_ci,
  `start_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1 = active , 2 = in-active',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loan_categories`
--

CREATE TABLE `loan_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1 = active , 2 = in-active',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int UNSIGNED DEFAULT NULL,
  `grand_parent_id` int UNSIGNED DEFAULT NULL,
  `type` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=District, 2=Upazila, 3=Area',
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `name`, `parent_id`, `grand_parent_id`, `type`, `status`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(2, 'Dhaka', 0, NULL, '1', '1', 'Admin', NULL, '2022-01-11 19:14:31', '2022-01-11 19:14:31'),
(3, 'Dhaka North City', 2, NULL, '2', '1', 'Admin', 'Marjuk Nobi (Jitu)', '2022-01-11 19:42:21', '2022-11-28 11:12:16'),
(4, 'Mirpur', 3, 2, '3', '1', 'Admin', 'Admin', '2022-01-11 19:43:37', '2022-01-16 18:10:08'),
(37, 'Noakhali', 0, NULL, '1', '1', 'Admin', NULL, '2022-01-15 14:15:17', '2022-01-15 14:15:17'),
(41, 'Laxmipur', 0, NULL, '1', '1', 'Admin', NULL, '2022-01-15 14:20:40', '2022-01-15 14:20:40'),
(42, 'Fani', 0, NULL, '1', '1', 'Admin', NULL, '2022-01-15 14:20:51', '2022-01-15 14:20:51'),
(43, 'Cumilla', 0, NULL, '1', '1', 'Admin', NULL, '2022-01-15 14:21:03', '2022-01-15 14:21:03'),
(44, 'Bandarban', 0, NULL, '1', '1', 'Admin', NULL, '2022-01-15 14:23:22', '2022-01-15 14:23:22'),
(45, 'Brahmanbaria', 0, NULL, '1', '1', 'Admin', NULL, '2022-01-15 14:23:42', '2022-01-15 14:23:42'),
(46, 'Chandpur', 0, NULL, '1', '1', 'Admin', NULL, '2022-01-15 14:23:55', '2022-01-15 14:23:55'),
(47, 'Chattogram', 0, NULL, '1', '1', 'Admin', NULL, '2022-01-15 14:24:23', '2022-01-15 14:24:23'),
(48, 'Cox’s Bazar', 0, NULL, '1', '1', 'Admin', NULL, '2022-01-15 14:24:36', '2022-01-15 14:24:36'),
(49, 'Khagrachhari', 0, NULL, '1', '1', 'Admin', NULL, '2022-01-15 14:25:27', '2022-01-15 14:25:27'),
(50, 'Rangamati', 0, NULL, '1', '1', 'Admin', NULL, '2022-01-15 14:25:49', '2022-01-15 14:25:49'),
(51, 'Faridpur', 0, NULL, '1', '1', 'Admin', NULL, '2022-01-15 14:27:19', '2022-01-15 14:27:19'),
(52, 'Gazipur', 0, NULL, '1', '1', 'Admin', NULL, '2022-01-15 14:27:37', '2022-01-15 14:27:37'),
(53, 'Gopalganj', 0, NULL, '1', '1', 'Admin', NULL, '2022-01-15 14:29:54', '2022-01-15 14:29:54'),
(54, 'Kishoreganj', 0, NULL, '1', '1', 'Admin', NULL, '2022-01-15 14:30:12', '2022-01-15 14:30:12'),
(55, 'Madaripur', 0, NULL, '1', '1', 'Admin', NULL, '2022-01-15 14:30:33', '2022-01-15 14:30:33'),
(56, 'Manikganj', 0, NULL, '1', '1', 'Admin', NULL, '2022-01-15 14:31:06', '2022-01-15 14:31:06'),
(57, 'Munshiganj', 0, NULL, '1', '1', 'Admin', NULL, '2022-01-15 14:31:22', '2022-01-15 14:31:22'),
(58, 'Narayanganj', 0, NULL, '1', '1', 'Admin', NULL, '2022-01-15 14:31:40', '2022-01-15 14:31:40'),
(59, 'Narsingdi', 0, NULL, '1', '1', 'Admin', NULL, '2022-01-15 14:31:56', '2022-01-15 14:31:56'),
(60, 'Rajbari', 0, NULL, '1', '1', 'Admin', NULL, '2022-01-15 14:32:14', '2022-01-15 14:32:14'),
(61, 'Shariatpur', 0, NULL, '1', '1', 'Admin', NULL, '2022-01-15 14:32:33', '2022-01-15 14:32:33'),
(62, 'Habiganj', 0, NULL, '1', '1', 'Admin', NULL, '2022-01-15 14:32:38', '2022-01-15 14:32:38'),
(63, 'Moulvibazar', 0, NULL, '1', '1', 'Admin', NULL, '2022-01-15 14:32:49', '2022-01-15 14:32:49'),
(64, 'Tangail', 0, NULL, '1', '1', 'Admin', NULL, '2022-01-15 14:32:53', '2022-01-15 14:32:53'),
(65, 'Sunamganj', 0, NULL, '1', '1', 'Admin', NULL, '2022-01-15 14:32:59', '2022-01-15 14:32:59'),
(66, 'Sylhet', 0, NULL, '1', '1', 'Admin', NULL, '2022-01-15 14:33:13', '2022-01-15 14:33:13'),
(67, 'Barguna', 0, NULL, '1', '1', 'Admin', NULL, '2022-01-15 14:34:05', '2022-01-15 14:34:05'),
(68, 'Barishal', 0, NULL, '1', '1', 'Admin', NULL, '2022-01-15 14:34:47', '2022-01-15 14:34:47'),
(69, 'Bogura', 0, NULL, '1', '1', 'Admin', NULL, '2022-01-15 14:34:47', '2022-01-15 14:34:47'),
(70, 'Bhola', 0, NULL, '1', '1', 'Admin', NULL, '2022-01-15 14:34:57', '2022-01-15 14:34:57'),
(71, 'Joypurhat', 0, NULL, '1', '1', 'Admin', NULL, '2022-01-15 14:35:08', '2022-01-15 14:35:08'),
(72, 'Jhalokati', 0, NULL, '1', '1', 'Admin', NULL, '2022-01-15 14:35:11', '2022-01-15 14:35:11'),
(73, 'Patuakhali', 0, NULL, '1', '1', 'Admin', NULL, '2022-01-15 14:35:21', '2022-01-15 14:35:21'),
(74, 'Naogaon', 0, NULL, '1', '1', 'Admin', NULL, '2022-01-15 14:35:25', '2022-01-15 14:35:25'),
(75, 'Pirojpur', 0, NULL, '1', '1', 'Admin', NULL, '2022-01-15 14:35:31', '2022-01-15 14:35:31'),
(76, 'Natore', 0, NULL, '1', '1', 'Admin', NULL, '2022-01-15 14:35:40', '2022-01-15 14:35:40'),
(77, 'Chapainawabganj', 0, NULL, '1', '1', 'Admin', NULL, '2022-01-15 14:35:56', '2022-01-15 14:35:56'),
(78, 'Bagerhat', 0, NULL, '1', '1', 'Admin', NULL, '2022-01-15 14:36:03', '2022-01-15 14:36:03'),
(79, 'Pabna', 0, NULL, '1', '1', 'Admin', NULL, '2022-01-15 14:36:12', '2022-01-15 14:36:12'),
(80, 'Chuadanga', 0, NULL, '1', '1', 'Admin', NULL, '2022-01-15 14:36:20', '2022-01-15 14:36:20'),
(81, 'Rajshahi', 0, NULL, '1', '1', 'Admin', NULL, '2022-01-15 14:36:24', '2022-01-15 14:36:24'),
(82, 'Jashore', 0, NULL, '1', '1', 'Admin', NULL, '2022-01-15 14:36:31', '2022-01-15 14:36:31'),
(83, 'Sirajganj', 0, NULL, '1', '1', 'Admin', NULL, '2022-01-15 14:36:40', '2022-01-15 14:36:40'),
(84, 'Jhenaidah', 0, NULL, '1', '1', 'Admin', NULL, '2022-01-15 14:36:43', '2022-01-15 14:36:43'),
(85, 'Khulna', 0, NULL, '1', '1', 'Admin', NULL, '2022-01-15 14:36:58', '2022-01-15 14:36:58'),
(86, 'Kushtia', 0, NULL, '1', '1', 'Admin', NULL, '2022-01-15 14:37:15', '2022-01-15 14:37:15'),
(87, 'Dinajpur', 0, NULL, '1', '1', 'Admin', NULL, '2022-01-15 14:37:36', '2022-01-15 14:37:36'),
(88, 'Magura', 0, NULL, '1', '1', 'Admin', NULL, '2022-01-15 14:37:39', '2022-01-15 14:37:39'),
(89, 'Meherpur', 0, NULL, '1', '1', 'Admin', NULL, '2022-01-15 14:38:03', '2022-01-15 14:38:03'),
(90, 'Kurigram', 0, NULL, '1', '1', 'Admin', NULL, '2022-01-15 14:38:08', '2022-01-15 14:38:08'),
(91, 'Narail', 0, NULL, '1', '1', 'Admin', NULL, '2022-01-15 14:38:16', '2022-01-15 14:38:16'),
(92, 'Lalmonirhat', 0, NULL, '1', '1', 'Admin', NULL, '2022-01-15 14:38:23', '2022-01-15 14:38:23'),
(93, 'Satkhira', 0, NULL, '1', '1', 'Admin', NULL, '2022-01-15 14:38:26', '2022-01-15 14:38:26'),
(94, 'Nilphamari', 0, NULL, '1', '1', 'Admin', NULL, '2022-01-15 14:38:49', '2022-01-15 14:38:49'),
(95, 'Panchagarh', 0, NULL, '1', '1', 'Admin', NULL, '2022-01-15 14:39:04', '2022-01-15 14:39:04'),
(96, 'Jamalpur', 0, NULL, '1', '1', 'Admin', NULL, '2022-01-15 14:39:09', '2022-01-15 14:39:09'),
(97, 'Mymensingh', 0, NULL, '1', '1', 'Admin', NULL, '2022-01-15 14:39:20', '2022-01-15 14:39:20'),
(98, 'Rangpur', 0, NULL, '1', '1', 'Admin', NULL, '2022-01-15 14:39:26', '2022-01-15 14:39:26'),
(99, 'Netrokona', 0, NULL, '1', '1', 'Admin', NULL, '2022-01-15 14:39:32', '2022-01-15 14:39:32'),
(100, 'Thakurgaon', 0, NULL, '1', '1', 'Admin', NULL, '2022-01-15 14:39:40', '2022-01-15 14:39:40'),
(101, 'Sherpur', 0, NULL, '1', '1', 'Admin', NULL, '2022-01-15 14:40:08', '2022-01-15 14:40:08'),
(102, 'Amtali', 67, NULL, '2', '1', 'Admin', NULL, '2022-01-15 14:47:35', '2022-01-15 14:47:35'),
(103, 'Bamna', 67, NULL, '2', '1', 'Admin', NULL, '2022-01-15 14:48:00', '2022-01-15 14:48:00'),
(104, 'Barguna-S', 67, NULL, '2', '1', 'Admin', NULL, '2022-01-15 14:48:44', '2022-01-15 14:48:44'),
(105, 'Betagi', 67, NULL, '2', '1', 'Admin', NULL, '2022-01-15 14:50:06', '2022-01-15 14:50:06'),
(106, 'Ali Kadam', 44, NULL, '2', '1', 'Admin', NULL, '2022-01-15 14:50:21', '2022-01-15 14:50:21'),
(107, 'Patharghata', 67, NULL, '2', '1', 'Admin', NULL, '2022-01-15 14:50:34', '2022-01-15 14:50:34'),
(108, 'Bandarban Sadar', 44, NULL, '2', '1', 'Admin', NULL, '2022-01-15 14:51:14', '2022-01-15 14:51:14'),
(109, 'Taltali', 67, NULL, '2', '1', 'Admin', NULL, '2022-01-15 14:51:18', '2022-01-15 14:51:18'),
(110, 'Lama', 44, NULL, '2', '1', 'Admin', NULL, '2022-01-15 14:51:51', '2022-01-15 14:51:51'),
(111, 'Naikhongchhari', 44, NULL, '2', '1', 'Admin', NULL, '2022-01-15 14:52:43', '2022-01-15 14:52:43'),
(112, 'Rowangchhari', 44, NULL, '2', '1', 'Admin', NULL, '2022-01-15 14:53:14', '2022-01-15 14:53:14'),
(113, 'Agailjhara', 68, NULL, '2', '1', 'Admin', NULL, '2022-01-15 14:53:19', '2022-01-15 14:53:19'),
(114, 'Babuganj', 68, NULL, '2', '1', 'Admin', NULL, '2022-01-15 14:53:40', '2022-01-15 14:53:40'),
(115, 'Ruma', 44, NULL, '2', '1', 'Admin', NULL, '2022-01-15 14:53:40', '2022-01-15 14:53:40'),
(116, 'Bakerganj', 68, NULL, '2', '1', 'Admin', NULL, '2022-01-15 14:53:58', '2022-01-15 14:53:58'),
(117, 'Thanchi', 44, NULL, '2', '1', 'Admin', NULL, '2022-01-15 14:54:08', '2022-01-15 14:54:08'),
(118, 'Banaripara', 68, NULL, '2', '1', 'Admin', NULL, '2022-01-15 14:54:17', '2022-01-15 14:54:17'),
(119, 'Barishal-S', 68, NULL, '2', '1', 'Admin', NULL, '2022-01-15 14:54:44', '2022-01-15 14:54:44'),
(120, 'Gouranadi', 68, NULL, '2', '1', 'Admin', NULL, '2022-01-15 14:55:03', '2022-01-15 14:55:03'),
(121, 'Akhaura', 45, NULL, '2', '1', 'Admin', NULL, '2022-01-15 14:55:11', '2022-01-15 14:55:11'),
(122, 'Hizla', 68, NULL, '2', '1', 'Admin', NULL, '2022-01-15 14:55:44', '2022-01-15 14:55:44'),
(123, 'Mehendiganj', 68, NULL, '2', '1', 'Admin', NULL, '2022-01-15 14:56:05', '2022-01-15 14:56:05'),
(124, 'Bancharampur', 45, NULL, '2', '1', 'Admin', NULL, '2022-01-15 14:56:19', '2022-01-15 14:56:19'),
(125, 'Muladi', 68, NULL, '2', '1', 'Admin', NULL, '2022-01-15 14:56:29', '2022-01-15 14:56:29'),
(126, 'Brahmanbaria Sadar', 45, NULL, '2', '1', 'Admin', NULL, '2022-01-15 14:56:50', '2022-01-15 14:56:50'),
(127, 'Uzirpur', 68, NULL, '2', '1', 'Admin', NULL, '2022-01-15 14:56:59', '2022-01-15 14:56:59'),
(128, 'Kasba', 45, NULL, '2', '1', 'Admin', NULL, '2022-01-15 14:57:28', '2022-01-15 14:57:28'),
(129, 'Bhola-S', 70, NULL, '2', '1', 'Admin', NULL, '2022-01-15 14:57:35', '2022-01-15 14:57:35'),
(130, 'Nabinagar', 45, NULL, '2', '1', 'Admin', NULL, '2022-01-15 14:57:58', '2022-01-15 14:57:58'),
(131, 'Borhanuddin', 70, NULL, '2', '1', 'Admin', NULL, '2022-01-15 14:58:13', '2022-01-15 14:58:13'),
(132, 'Nasirnagar', 45, NULL, '2', '1', 'Admin', NULL, '2022-01-15 14:58:27', '2022-01-15 14:58:27'),
(133, 'Sarail', 45, NULL, '2', '1', 'Admin', NULL, '2022-01-15 14:59:13', '2022-01-15 14:59:13'),
(134, 'Ashuganj', 45, NULL, '2', '1', 'Admin', NULL, '2022-01-15 14:59:45', '2022-01-15 14:59:45'),
(135, 'Bijoynagar', 45, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:00:17', '2022-01-15 15:00:17'),
(136, 'Charfassion', 70, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:00:48', '2022-01-15 15:00:48'),
(137, 'Daulatkhan', 70, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:01:06', '2022-01-15 15:01:06'),
(138, 'Lalmohan', 70, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:01:24', '2022-01-15 15:01:24'),
(139, 'Chandpur Sadar', 46, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:01:41', '2022-01-15 15:01:41'),
(140, 'Monpura', 70, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:01:43', '2022-01-15 15:01:43'),
(141, 'Tazumuddin', 70, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:02:07', '2022-01-15 15:02:07'),
(142, 'Faridganj', 46, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:02:14', '2022-01-15 15:02:14'),
(143, 'Haimchar', 46, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:02:48', '2022-01-15 15:02:48'),
(144, 'Jhalokathi-S', 72, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:02:56', '2022-01-15 15:02:56'),
(145, 'Haziganj', 46, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:03:31', '2022-01-15 15:03:31'),
(146, 'Kathalia', 72, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:03:39', '2022-01-15 15:03:39'),
(147, 'Kachua', 46, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:04:10', '2022-01-15 15:04:10'),
(148, 'Nalchity', 72, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:04:17', '2022-01-15 15:04:17'),
(149, 'Rajapur', 72, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:04:36', '2022-01-15 15:04:36'),
(151, 'Matlab Dakshin', 46, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:04:46', '2022-01-15 15:04:46'),
(152, 'Matlab Uttar', 46, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:05:11', '2022-01-15 15:05:11'),
(153, 'Shahrasti', 46, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:05:50', '2022-01-15 15:05:50'),
(154, 'Bauphal', 73, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:09:18', '2022-01-15 15:09:18'),
(155, 'Dashmina', 73, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:09:43', '2022-01-15 15:09:43'),
(156, 'Dumki', 73, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:10:32', '2022-01-15 15:10:32'),
(157, 'Galachipa', 73, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:10:54', '2022-01-15 15:10:54'),
(158, 'Kalapara', 73, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:11:17', '2022-01-15 15:11:17'),
(159, 'Mirjaganj', 73, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:11:32', '2022-01-15 15:11:32'),
(160, 'Patuakhali-S', 73, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:11:47', '2022-01-15 15:11:47'),
(161, 'Rangabali', 73, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:12:07', '2022-01-15 15:12:07'),
(163, 'Bhandaria', 73, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:12:25', '2022-01-15 15:12:25'),
(168, 'Kawkhali', 75, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:14:21', '2022-01-15 15:14:21'),
(171, 'Mothbaria', 75, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:19:44', '2022-01-15 15:19:44'),
(172, 'Nazirpur', 75, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:20:02', '2022-01-15 15:20:02'),
(173, 'Nesarabad', 75, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:20:17', '2022-01-15 15:20:17'),
(174, 'Pirojpur-S', 75, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:20:48', '2022-01-15 15:20:48'),
(175, 'Zianagar', 75, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:21:03', '2022-01-15 15:21:03'),
(178, 'Chattagram Sadar', 47, NULL, '2', '1', 'Admin', 'Super Admin', '2022-01-15 15:25:55', '2022-04-04 06:30:29'),
(179, 'Anwara', 47, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:26:24', '2022-01-15 15:26:24'),
(180, 'Boalkhali', 47, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:26:46', '2022-01-15 15:26:46'),
(181, 'Chandanaish', 47, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:27:12', '2022-01-15 15:27:12'),
(182, 'Fatikchhari', 47, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:27:36', '2022-01-15 15:27:36'),
(183, 'Hathazari', 47, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:27:57', '2022-01-15 15:27:57'),
(184, 'Karnaphuli', 47, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:28:27', '2022-01-15 15:28:27'),
(186, 'Lohagara', 47, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:28:48', '2022-01-15 15:28:48'),
(188, 'Mirsharai', 47, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:34:10', '2022-01-15 15:34:10'),
(189, 'Patiya', 47, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:34:39', '2022-01-15 15:34:39'),
(190, 'Rangunia', 47, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:35:08', '2022-01-15 15:35:08'),
(191, 'Raozan', 47, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:35:33', '2022-01-15 15:35:33'),
(192, 'Dhamrai', 2, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:37:49', '2022-01-15 15:37:49'),
(193, 'Sandwip', 47, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:37:52', '2022-01-15 15:37:52'),
(194, 'Dohar', 2, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:38:03', '2022-01-15 15:38:03'),
(195, 'Keraniganj', 2, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:38:15', '2022-01-15 15:38:15'),
(196, 'Satkania', 47, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:38:15', '2022-01-15 15:38:15'),
(197, 'Nawabganj', 2, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:38:31', '2022-01-15 15:38:31'),
(198, 'Sitakunda', 47, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:38:41', '2022-01-15 15:38:41'),
(199, 'Savar', 2, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:38:46', '2022-01-15 15:38:46'),
(200, 'Alfadanga', 51, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:39:16', '2022-01-15 15:39:16'),
(203, 'Barura', 43, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:39:54', '2022-01-15 15:39:54'),
(206, 'Brahmanpara', 43, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:40:18', '2022-01-15 15:40:18'),
(209, 'Burichang', 43, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:40:39', '2022-01-15 15:40:39'),
(212, 'Chandina', 43, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:41:06', '2022-01-15 15:41:06'),
(213, 'Chauddagram', 43, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:41:55', '2022-01-15 15:41:55'),
(214, 'Daudkandi', 43, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:42:23', '2022-01-15 15:42:23'),
(215, 'Debidwar', 43, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:42:54', '2022-01-15 15:42:54'),
(216, 'Homna', 43, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:44:12', '2022-01-15 15:44:12'),
(217, 'Laksam', 43, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:44:33', '2022-01-15 15:44:33'),
(218, 'Lalmai', 43, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:44:56', '2022-01-15 15:44:56'),
(219, 'Bhanga', 51, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:45:09', '2022-01-15 15:45:09'),
(220, 'Muradnagar', 43, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:45:21', '2022-01-15 15:45:21'),
(221, 'Boalmari', 51, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:45:26', '2022-01-15 15:45:26'),
(222, 'Charbhadrasan', 51, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:45:39', '2022-01-15 15:45:39'),
(223, 'Nangalkot', 43, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:45:43', '2022-01-15 15:45:43'),
(224, 'Faridpur-S', 51, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:45:56', '2022-01-15 15:45:56'),
(225, 'Madhukhali', 51, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:46:08', '2022-01-15 15:46:08'),
(226, 'Nagarkanda', 51, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:46:19', '2022-01-15 15:46:19'),
(227, 'Cumilla Adarsha Sadar', 43, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:46:20', '2022-01-15 15:46:20'),
(228, 'Sadarpur', 51, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:46:31', '2022-01-15 15:46:31'),
(229, 'Saltha', 51, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:46:43', '2022-01-15 15:46:43'),
(230, 'Meghna', 43, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:46:50', '2022-01-15 15:46:50'),
(231, 'Titas', 43, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:47:10', '2022-01-15 15:47:10'),
(232, 'Gazipur-S', 52, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:47:15', '2022-01-15 15:47:15'),
(233, 'Kaliakoir', 52, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:47:29', '2022-01-15 15:47:29'),
(234, 'Monohargonj', 43, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:47:32', '2022-01-15 15:47:32'),
(235, 'Kaliganj', 52, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:47:42', '2022-01-15 15:47:42'),
(236, 'Kapasia', 52, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:47:55', '2022-01-15 15:47:55'),
(237, 'Cumilla Sadar Dakshin', 43, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:48:04', '2022-01-15 15:48:04'),
(238, 'Sreepur', 52, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:48:15', '2022-01-15 15:48:15'),
(239, 'Gopalganj-S', 53, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:49:10', '2022-01-15 15:49:10'),
(240, 'Gopalganj-S', 53, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:49:28', '2022-01-15 15:49:28'),
(241, 'Chakaria', 48, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:49:31', '2022-01-15 15:49:31'),
(242, 'Kasiani', 53, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:49:48', '2022-01-15 15:49:48'),
(243, 'Cox\'s Bazar Sadar', 48, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:49:53', '2022-01-15 15:49:53'),
(244, 'Kotwalipara', 53, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:50:05', '2022-01-15 15:50:05'),
(245, 'Kutubdia', 48, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:50:10', '2022-01-15 15:50:10'),
(246, 'Muksudpur', 53, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:50:17', '2022-01-15 15:50:17'),
(247, 'Tungipara', 53, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:50:28', '2022-01-15 15:50:28'),
(248, 'Maheshkhali', 48, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:50:30', '2022-01-15 15:50:30'),
(249, 'Ramu', 48, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:51:00', '2022-01-15 15:51:00'),
(250, 'Austagram', 54, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:51:07', '2022-01-15 15:51:07'),
(251, 'Bajitpur', 54, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:51:19', '2022-01-15 15:51:19'),
(252, 'Teknaf', 48, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:51:21', '2022-01-15 15:51:21'),
(253, 'Bhairab', 54, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:51:39', '2022-01-15 15:51:39'),
(254, 'Ukhia', 48, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:51:43', '2022-01-15 15:51:43'),
(255, 'Pekua', 48, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:52:07', '2022-01-15 15:52:07'),
(256, 'Eidgaon', 48, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:52:26', '2022-01-15 15:52:26'),
(257, 'Chhagalnaiya', 42, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:53:47', '2022-01-15 15:53:47'),
(258, 'Daganbhuiyan', 42, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:54:36', '2022-01-15 15:54:36'),
(259, 'Feni Sadar', 42, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:54:56', '2022-01-15 15:54:56'),
(260, 'Parshuram', 42, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:55:31', '2022-01-15 15:55:31'),
(261, 'Sonagazi', 42, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:55:54', '2022-01-15 15:55:54'),
(262, 'Fulgazi', 42, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:56:28', '2022-01-15 15:56:28'),
(263, 'Dighinala', 49, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:57:37', '2022-01-15 15:57:37'),
(264, 'Khagrachhari', 49, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:58:28', '2022-01-15 15:58:28'),
(265, 'Lakshmichhari', 49, NULL, '2', '1', 'Admin', NULL, '2022-01-15 15:58:52', '2022-01-15 15:58:52'),
(266, 'Mahalchhari', 49, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:00:00', '2022-01-15 16:00:00'),
(267, 'Manikchhari', 49, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:00:22', '2022-01-15 16:00:22'),
(268, 'Matiranga', 49, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:01:38', '2022-01-15 16:01:38'),
(269, 'Panchhari', 49, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:02:29', '2022-01-15 16:02:29'),
(270, 'Ramgarh', 49, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:03:52', '2022-01-15 16:03:52'),
(271, 'Lakshmipur Sadar', 41, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:04:36', '2022-01-15 16:04:36'),
(272, 'Hossainpur', 54, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:05:29', '2022-01-15 16:05:29'),
(273, 'Itna', 54, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:05:48', '2022-01-15 16:05:48'),
(274, 'Karimganj', 54, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:06:00', '2022-01-15 16:06:00'),
(275, 'Katiadi', 54, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:06:12', '2022-01-15 16:06:12'),
(276, 'Kishoreganj-S', 54, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:06:24', '2022-01-15 16:06:24'),
(277, 'Raipur', 41, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:06:37', '2022-01-15 16:06:37'),
(278, 'Kuliarchar', 54, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:06:38', '2022-01-15 16:06:38'),
(279, 'Ramganj', 41, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:06:59', '2022-01-15 16:06:59'),
(280, 'Mithamoin', 54, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:07:04', '2022-01-15 16:07:04'),
(281, 'Nikli', 54, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:07:16', '2022-01-15 16:07:16'),
(282, 'Ramgati', 41, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:07:25', '2022-01-15 16:07:25'),
(283, 'Pakundia', 54, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:07:30', '2022-01-15 16:07:30'),
(284, 'Kamalnagar', 41, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:07:49', '2022-01-15 16:07:49'),
(285, 'Tarail', 54, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:08:28', '2022-01-15 16:08:28'),
(286, 'Begumganj', 37, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:08:38', '2022-01-15 16:08:38'),
(288, 'Noakhali Sadar', 37, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:09:04', '2022-01-15 16:09:04'),
(289, 'Chatkhil', 37, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:09:21', '2022-01-15 16:09:21'),
(290, 'Kalkini', 55, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:09:28', '2022-01-15 16:09:28'),
(291, 'Companiganj', 37, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:09:44', '2022-01-15 16:09:44'),
(292, 'Madaripur-S', 55, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:10:08', '2022-01-15 16:10:08'),
(293, 'Hatiya', 37, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:10:08', '2022-01-15 16:10:08'),
(294, 'Rajoir', 55, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:10:21', '2022-01-15 16:10:21'),
(295, 'Senbagh', 37, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:10:28', '2022-01-15 16:10:28'),
(296, 'Shibchar', 55, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:10:33', '2022-01-15 16:10:33'),
(297, 'Sonaimuri', 37, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:10:49', '2022-01-15 16:10:49'),
(298, 'Daulatpur', 56, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:10:56', '2022-01-15 16:10:56'),
(299, 'Subarnachar', 37, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:11:14', '2022-01-15 16:11:14'),
(300, 'Ghior', 56, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:11:37', '2022-01-15 16:11:37'),
(301, 'Kabirhat', 37, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:11:38', '2022-01-15 16:11:38'),
(302, 'Harirampur', 56, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:12:00', '2022-01-15 16:12:00'),
(303, 'Manikganj-S', 56, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:12:17', '2022-01-15 16:12:17'),
(304, 'Saturia', 56, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:12:38', '2022-01-15 16:12:38'),
(305, 'Shivalaya', 56, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:12:55', '2022-01-15 16:12:55'),
(306, 'Singair', 56, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:13:09', '2022-01-15 16:13:09'),
(307, 'Lauhajong', 57, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:13:47', '2022-01-15 16:13:47'),
(308, 'Bagaichhari', 50, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:13:52', '2022-01-15 16:13:52'),
(309, 'Munshiganj-S', 57, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:14:03', '2022-01-15 16:14:03'),
(310, 'Sirajdikhan', 57, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:14:16', '2022-01-15 16:14:16'),
(311, 'Barkal', 50, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:14:27', '2022-01-15 16:14:27'),
(312, 'Sreenagar', 57, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:14:28', '2022-01-15 16:14:28'),
(313, 'Tongibari', 57, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:14:39', '2022-01-15 16:14:39'),
(314, 'Kawkhali (Betbunia)', 50, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:14:52', '2022-01-15 16:14:52'),
(315, 'Araihazar', 58, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:15:09', '2022-01-15 16:15:09'),
(316, 'Belaichhari', 50, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:15:48', '2022-01-15 16:15:48'),
(317, 'Bandar', 58, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:15:49', '2022-01-15 16:15:49'),
(318, 'Narayanganj-S', 58, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:16:05', '2022-01-15 16:16:05'),
(319, 'Kaptai', 50, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:16:15', '2022-01-15 16:16:15'),
(320, 'Rupganj', 58, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:16:16', '2022-01-15 16:16:16'),
(321, 'Sonargaon', 58, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:16:30', '2022-01-15 16:16:30'),
(322, 'Juraichhari', 50, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:16:45', '2022-01-15 16:16:45'),
(323, 'Langadu', 50, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:17:20', '2022-01-15 16:17:20'),
(324, 'Naniyachar', 50, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:17:48', '2022-01-15 16:17:48'),
(325, 'Narshingdi', 0, NULL, '1', '1', 'Admin', NULL, '2022-01-15 16:17:53', '2022-01-15 16:17:53'),
(326, 'Belabo', 325, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:18:17', '2022-01-15 16:18:17'),
(327, 'Rajasthali', 50, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:18:18', '2022-01-15 16:18:18'),
(328, 'Monohardi', 325, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:18:50', '2022-01-15 16:18:50'),
(329, 'Rangamati Sadar', 50, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:18:59', '2022-01-15 16:18:59'),
(330, 'Narshingdi-S', 325, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:19:05', '2022-01-15 16:19:05'),
(331, 'Palash', 325, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:19:17', '2022-01-15 16:19:17'),
(332, 'Raipura', 325, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:19:28', '2022-01-15 16:19:28'),
(333, 'Shibpur', 325, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:19:40', '2022-01-15 16:19:40'),
(334, 'Baliakandi', 60, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:20:07', '2022-01-15 16:20:07'),
(335, 'Goalanda', 60, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:20:21', '2022-01-15 16:20:21'),
(336, 'Kalukhali', 60, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:20:34', '2022-01-15 16:20:34'),
(337, 'Pangsha', 60, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:20:48', '2022-01-15 16:20:48'),
(338, 'Rajbari-S', 60, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:21:04', '2022-01-15 16:21:04'),
(339, 'Bhedarganj', 61, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:21:54', '2022-01-15 16:21:54'),
(340, 'Bhedarganj', 61, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:22:30', '2022-01-15 16:22:30'),
(341, 'Damuddya', 61, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:22:48', '2022-01-15 16:22:48'),
(342, 'Goshairhat', 61, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:23:01', '2022-01-15 16:23:01'),
(343, 'Janjira', 61, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:23:15', '2022-01-15 16:23:15'),
(344, 'Naria', 61, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:23:28', '2022-01-15 16:23:28'),
(345, 'Shariatpur-S', 61, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:23:46', '2022-01-15 16:23:46'),
(346, 'Basail', 64, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:24:16', '2022-01-15 16:24:16'),
(347, 'Bhuapur', 64, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:24:30', '2022-01-15 16:24:30'),
(348, 'Delduar', 64, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:24:40', '2022-01-15 16:24:40'),
(349, 'Dhanbari', 64, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:24:55', '2022-01-15 16:24:55'),
(350, 'Ghatail', 64, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:25:05', '2022-01-15 16:25:05'),
(351, 'Gopalpur', 64, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:25:14', '2022-01-15 16:25:14'),
(352, 'Kalihati', 64, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:25:24', '2022-01-15 16:25:24'),
(353, 'Madhupur', 64, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:25:35', '2022-01-15 16:25:35'),
(354, 'Mirzapur', 64, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:25:47', '2022-01-15 16:25:47'),
(355, 'Nagarpur', 64, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:26:02', '2022-01-15 16:26:02'),
(356, 'Shakhipur', 64, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:26:17', '2022-01-15 16:26:17'),
(357, 'Tangail-S', 64, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:26:34', '2022-01-15 16:26:34'),
(358, 'Bagerhat-S', 78, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:30:41', '2022-01-15 16:30:41'),
(359, 'Chitalmari', 78, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:38:04', '2022-01-15 16:38:04'),
(360, 'Fakirhat', 78, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:38:28', '2022-01-15 16:38:28'),
(361, 'Kachua', 78, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:38:44', '2022-01-15 16:38:44'),
(362, 'Mollahat', 78, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:39:02', '2022-01-15 16:39:02'),
(363, 'Mongla', 78, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:39:23', '2022-01-15 16:39:23'),
(364, 'Morrelganj', 78, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:39:35', '2022-01-15 16:39:35'),
(365, 'Rampal', 78, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:39:46', '2022-01-15 16:39:46'),
(366, 'Sharankhola', 78, NULL, '2', '1', 'Admin', NULL, '2022-01-15 16:40:00', '2022-01-15 16:40:00'),
(367, 'Akkelpur', 71, NULL, '2', '1', 'Admin', NULL, '2022-01-15 17:20:48', '2022-01-15 17:20:48'),
(368, 'Joypurhat Sadar', 71, NULL, '2', '1', 'Admin', NULL, '2022-01-15 17:21:11', '2022-01-15 17:21:11'),
(369, 'Kalai', 71, NULL, '2', '1', 'Admin', NULL, '2022-01-15 17:21:32', '2022-01-15 17:21:32'),
(370, 'Khetlal', 71, NULL, '2', '1', 'Admin', NULL, '2022-01-15 17:22:03', '2022-01-15 17:22:03'),
(371, 'Panchbibi', 71, NULL, '2', '1', 'Admin', NULL, '2022-01-15 17:22:29', '2022-01-15 17:22:29'),
(373, 'Adamdighi', 69, NULL, '2', '1', 'Admin', NULL, '2022-01-15 17:25:17', '2022-01-15 17:25:17'),
(374, 'Bogura Sadar', 69, NULL, '2', '1', 'Admin', NULL, '2022-01-15 17:27:40', '2022-01-15 17:27:40'),
(375, 'Dhunat', 69, NULL, '2', '1', 'Admin', NULL, '2022-01-15 17:36:30', '2022-01-15 17:36:30'),
(376, 'Dhupchanchia', 69, NULL, '2', '1', 'Admin', NULL, '2022-01-15 17:36:52', '2022-01-15 17:36:52'),
(377, 'Gabtali', 69, NULL, '2', '1', 'Admin', NULL, '2022-01-15 17:37:28', '2022-01-15 17:37:28'),
(378, 'Kahaloo', 69, NULL, '2', '1', 'Admin', NULL, '2022-01-15 17:38:21', '2022-01-15 17:38:21'),
(379, 'Nandigram', 69, NULL, '2', '1', 'Admin', NULL, '2022-01-15 17:38:53', '2022-01-15 17:38:53'),
(380, 'Sariakandi', 69, NULL, '2', '1', 'Admin', NULL, '2022-01-15 17:39:21', '2022-01-15 17:39:21'),
(381, 'Shajahanpur', 69, NULL, '2', '1', 'Admin', NULL, '2022-01-15 17:39:42', '2022-01-15 17:39:42'),
(382, 'Sherpur', 69, NULL, '2', '1', 'Admin', NULL, '2022-01-15 17:40:04', '2022-01-15 17:40:04'),
(383, 'Shibganj', 69, NULL, '2', '1', 'Admin', NULL, '2022-01-15 17:40:22', '2022-01-15 17:40:22'),
(384, 'Sonatola', 69, NULL, '2', '1', 'Admin', NULL, '2022-01-15 17:40:47', '2022-01-15 17:40:47'),
(385, 'Atrai', 74, NULL, '2', '1', 'Admin', NULL, '2022-01-15 17:42:51', '2022-01-15 17:42:51'),
(386, 'Badalgachhi', 74, NULL, '2', '1', 'Admin', NULL, '2022-01-15 17:43:19', '2022-01-15 17:43:19'),
(387, 'Manda', 74, NULL, '2', '1', 'Admin', NULL, '2022-01-15 17:43:47', '2022-01-15 17:43:47'),
(388, 'Manda', 74, NULL, '2', '1', 'Admin', NULL, '2022-01-15 17:44:52', '2022-01-15 17:44:52'),
(389, 'Mohadevpur', 74, NULL, '2', '1', 'Admin', NULL, '2022-01-15 17:45:25', '2022-01-15 17:45:25'),
(390, 'Naogaon Sadar', 74, NULL, '2', '1', 'Admin', NULL, '2022-01-15 17:45:49', '2022-01-15 17:45:49'),
(391, 'Niamatpur', 74, NULL, '2', '1', 'Admin', NULL, '2022-01-15 17:46:13', '2022-01-15 17:46:13'),
(392, 'Patnitala', 74, NULL, '2', '1', 'Admin', NULL, '2022-01-15 17:46:37', '2022-01-15 17:46:37'),
(393, 'Porsha', 74, NULL, '2', '1', 'Admin', NULL, '2022-01-15 17:47:01', '2022-01-15 17:47:01'),
(394, 'Raninagar', 74, NULL, '2', '1', 'Admin', NULL, '2022-01-15 17:47:21', '2022-01-15 17:47:21'),
(395, 'Sapahar', 74, NULL, '2', '1', 'Admin', NULL, '2022-01-15 17:47:46', '2022-01-15 17:47:46'),
(396, 'Bagatipara', 76, NULL, '2', '1', 'Admin', NULL, '2022-01-15 17:48:34', '2022-01-15 17:48:34'),
(397, 'Baraigram', 76, NULL, '2', '1', 'Admin', NULL, '2022-01-15 17:49:08', '2022-01-15 17:49:08'),
(398, 'Gurudaspur', 76, NULL, '2', '1', 'Admin', NULL, '2022-01-15 17:50:40', '2022-01-15 17:50:40'),
(399, 'Lalpur', 76, NULL, '2', '1', 'Admin', NULL, '2022-01-15 17:51:01', '2022-01-15 17:51:01'),
(400, 'Natore Sadar', 76, NULL, '2', '1', 'Admin', NULL, '2022-01-15 17:51:29', '2022-01-15 17:51:29'),
(401, 'Singra', 76, NULL, '2', '1', 'Admin', NULL, '2022-01-15 17:51:56', '2022-01-15 17:51:56'),
(402, 'Naldanga', 76, NULL, '2', '1', 'Admin', NULL, '2022-01-15 17:52:22', '2022-01-15 17:52:22'),
(403, 'Nawabganj', 0, NULL, '1', '1', 'Admin', NULL, '2022-01-15 17:54:33', '2022-01-15 17:54:33'),
(404, 'Bholahat', 403, NULL, '2', '1', 'Admin', NULL, '2022-01-15 17:55:12', '2022-01-15 17:55:12'),
(405, 'Gomastapur', 403, NULL, '2', '1', 'Admin', NULL, '2022-01-15 17:55:31', '2022-01-15 17:55:31'),
(406, 'Nachole', 403, NULL, '2', '1', 'Admin', NULL, '2022-01-15 17:55:52', '2022-01-15 17:55:52'),
(407, 'Nawabganj Sadar', 403, NULL, '2', '1', 'Admin', NULL, '2022-01-15 17:56:13', '2022-01-15 17:56:13'),
(408, 'Shibganj', 403, NULL, '2', '1', 'Admin', NULL, '2022-01-15 17:56:35', '2022-01-15 17:56:35'),
(409, 'Atgharia', 79, NULL, '2', '1', 'Admin', NULL, '2022-01-15 17:57:05', '2022-01-15 17:57:05'),
(410, 'Bera', 79, NULL, '2', '1', 'Admin', NULL, '2022-01-15 17:57:26', '2022-01-15 17:57:26'),
(411, 'Bhangura', 79, NULL, '2', '1', 'Admin', NULL, '2022-01-15 17:57:45', '2022-01-15 17:57:45'),
(412, 'Chatmohar', 79, NULL, '2', '1', 'Admin', NULL, '2022-01-15 17:58:11', '2022-01-15 17:58:11'),
(413, 'Faridpur', 79, NULL, '2', '1', 'Admin', NULL, '2022-01-15 17:58:30', '2022-01-15 17:58:30'),
(414, 'Ishwardi', 79, NULL, '2', '1', 'Admin', NULL, '2022-01-15 17:59:00', '2022-01-15 17:59:00'),
(415, 'Pabna Sadar', 79, NULL, '2', '1', 'Admin', NULL, '2022-01-15 17:59:23', '2022-01-15 17:59:23'),
(416, 'Santhia', 79, NULL, '2', '1', 'Admin', NULL, '2022-01-15 17:59:53', '2022-01-15 17:59:53'),
(417, 'Sujanagar', 79, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:00:33', '2022-01-15 18:00:33'),
(418, 'Belkuchi', 83, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:01:13', '2022-01-15 18:01:13'),
(419, 'Chauhali', 83, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:01:36', '2022-01-15 18:01:36'),
(420, 'Kamarkhanda', 83, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:02:13', '2022-01-15 18:02:13'),
(421, 'Kazipur', 83, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:15:43', '2022-01-15 18:15:43'),
(422, 'Raiganj', 83, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:16:02', '2022-01-15 18:16:02'),
(423, 'Shahjadpur', 83, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:16:25', '2022-01-15 18:16:25'),
(424, 'Sirajganj Sadar', 83, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:16:45', '2022-01-15 18:16:45'),
(425, 'Tarash', 83, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:17:06', '2022-01-15 18:17:06'),
(426, 'Ullahpara', 83, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:17:25', '2022-01-15 18:17:25'),
(427, 'Bagha', 81, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:18:06', '2022-01-15 18:18:06'),
(428, 'Bagmara', 81, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:18:28', '2022-01-15 18:18:28'),
(429, 'Charghat', 81, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:18:50', '2022-01-15 18:18:50'),
(430, 'Durgapur', 81, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:19:42', '2022-01-15 18:19:42'),
(431, 'Alamdanga', 80, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:20:02', '2022-01-15 18:20:02'),
(432, 'Godagari', 81, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:20:13', '2022-01-15 18:20:13'),
(433, 'Mohanpur', 81, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:20:31', '2022-01-15 18:20:31'),
(434, 'Chuadanga-S', 80, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:20:35', '2022-01-15 18:20:35'),
(435, 'Damurhuda', 80, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:20:51', '2022-01-15 18:20:51'),
(436, 'Paba', 81, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:21:03', '2022-01-15 18:21:03'),
(437, 'Jibannagar', 80, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:21:05', '2022-01-15 18:21:05'),
(438, 'Puthia', 81, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:21:31', '2022-01-15 18:21:31'),
(439, 'Abhoynagar', 82, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:21:33', '2022-01-15 18:21:33'),
(440, 'Bagherpara', 82, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:21:56', '2022-01-15 18:21:56'),
(441, 'Tanore', 81, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:21:56', '2022-01-15 18:21:56'),
(442, 'Chowgacha', 82, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:22:13', '2022-01-15 18:22:13'),
(443, 'Jashore-S', 82, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:22:30', '2022-01-15 18:22:30'),
(444, 'Jhikargacha', 82, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:22:43', '2022-01-15 18:22:43'),
(445, 'Keshabpur', 82, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:22:58', '2022-01-15 18:22:58'),
(446, 'Monirampur', 82, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:23:17', '2022-01-15 18:23:17'),
(447, 'Sarsha', 82, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:23:33', '2022-01-15 18:23:33'),
(448, 'Harinakunda', 84, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:23:57', '2022-01-15 18:23:57'),
(449, 'Jhenaidah-S', 84, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:24:20', '2022-01-15 18:24:20'),
(450, 'Kaliganj', 84, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:24:36', '2022-01-15 18:24:36'),
(451, 'Kotchandpur', 84, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:25:16', '2022-01-15 18:25:16'),
(452, 'Moheshpur', 84, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:25:42', '2022-01-15 18:25:42'),
(453, 'Shailkupa', 84, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:26:02', '2022-01-15 18:26:02'),
(454, 'Batiaghata', 85, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:26:39', '2022-01-15 18:26:39'),
(455, 'Dacope', 85, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:26:57', '2022-01-15 18:26:57'),
(456, 'Dighalia', 85, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:27:11', '2022-01-15 18:27:11'),
(457, 'Dumuria', 85, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:27:28', '2022-01-15 18:27:28'),
(458, 'Koira', 85, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:27:42', '2022-01-15 18:27:42'),
(459, 'Paikgacha', 85, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:27:57', '2022-01-15 18:27:57'),
(460, 'Phultala', 85, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:28:09', '2022-01-15 18:28:09'),
(461, 'Rupsa', 85, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:28:20', '2022-01-15 18:28:20'),
(462, 'Terokhada', 85, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:28:48', '2022-01-15 18:28:48'),
(463, 'Bheramara', 86, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:29:24', '2022-01-15 18:29:24'),
(464, 'Daulatpur', 86, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:29:45', '2022-01-15 18:29:45'),
(465, 'Khoksha', 86, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:29:58', '2022-01-15 18:29:58'),
(466, 'Kumarkhali', 86, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:30:15', '2022-01-15 18:30:15'),
(467, 'Kushtia-S', 86, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:31:01', '2022-01-15 18:31:01'),
(468, 'Mirpur', 86, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:31:18', '2022-01-15 18:31:18'),
(469, 'Magura-S', 88, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:31:42', '2022-01-15 18:31:42'),
(470, 'Mohammadpur', 88, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:31:56', '2022-01-15 18:31:56'),
(471, 'Salikha', 88, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:32:11', '2022-01-15 18:32:11'),
(472, 'Sreepur', 88, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:32:25', '2022-01-15 18:32:25'),
(473, 'Gangni', 89, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:32:45', '2022-01-15 18:32:45'),
(474, 'Meherpur-S', 89, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:33:16', '2022-01-15 18:33:16'),
(475, 'Kalia', 91, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:37:03', '2022-01-15 18:37:03'),
(476, 'Lohagara', 91, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:37:30', '2022-01-15 18:37:30'),
(477, 'Narail-S', 91, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:37:45', '2022-01-15 18:37:45'),
(478, 'Assasuni', 93, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:38:19', '2022-01-15 18:38:19'),
(479, 'Debhata', 93, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:38:39', '2022-01-15 18:38:39'),
(480, 'Kalaroa', 93, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:38:51', '2022-01-15 18:38:51'),
(481, 'Kaliganj', 93, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:39:04', '2022-01-15 18:39:04'),
(482, 'Satkhira-S', 93, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:39:20', '2022-01-15 18:39:20'),
(483, 'Shyamnagar', 93, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:39:33', '2022-01-15 18:39:33'),
(484, 'Tala', 93, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:39:48', '2022-01-15 18:39:48'),
(485, 'Bakshiganj', 96, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:40:48', '2022-01-15 18:40:48'),
(486, 'Dewanganj', 96, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:41:02', '2022-01-15 18:41:02'),
(487, 'Islampur', 96, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:41:14', '2022-01-15 18:41:14'),
(488, 'Jamalpur-S', 96, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:41:26', '2022-01-15 18:41:26'),
(489, 'Madarganj', 96, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:41:39', '2022-01-15 18:41:39'),
(490, 'Melendah', 96, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:41:51', '2022-01-15 18:41:51'),
(491, 'Sarishabari', 96, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:42:04', '2022-01-15 18:42:04'),
(492, 'Bhaluka', 97, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:42:25', '2022-01-15 18:42:25'),
(493, 'Dhobaura', 97, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:42:58', '2022-01-15 18:42:58'),
(494, 'Fulbaria', 97, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:43:11', '2022-01-15 18:43:11'),
(495, 'Gaffargaon', 97, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:43:24', '2022-01-15 18:43:24'),
(496, 'Gouripur', 97, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:43:36', '2022-01-15 18:43:36'),
(497, 'Haluaghat', 97, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:43:49', '2022-01-15 18:43:49'),
(498, 'Ishwarganj', 97, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:44:01', '2022-01-15 18:44:01'),
(499, 'Muktagacha', 97, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:44:16', '2022-01-15 18:44:16'),
(500, 'Mymensingh-S', 97, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:44:30', '2022-01-15 18:44:30'),
(501, 'Nandail', 97, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:44:42', '2022-01-15 18:44:42'),
(502, 'Phulpur', 97, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:44:58', '2022-01-15 18:44:58'),
(503, 'Tarakanda', 97, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:45:09', '2022-01-15 18:45:09'),
(504, 'Trishal', 97, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:45:22', '2022-01-15 18:45:22'),
(505, 'Atpara', 99, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:45:46', '2022-01-15 18:45:46'),
(506, 'Barhatta', 99, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:45:56', '2022-01-15 18:45:56'),
(507, 'Durgapur', 99, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:46:07', '2022-01-15 18:46:07'),
(508, 'Kalmakanda', 99, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:46:17', '2022-01-15 18:46:17'),
(509, 'Kendua', 99, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:46:28', '2022-01-15 18:46:28'),
(510, 'Khaliajuri', 99, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:46:38', '2022-01-15 18:46:38'),
(511, 'Madan', 99, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:46:55', '2022-01-15 18:46:55'),
(512, 'Mohanganj', 99, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:47:10', '2022-01-15 18:47:10'),
(513, 'Netrakona-S', 99, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:47:22', '2022-01-15 18:47:22'),
(514, 'Purbadhala', 99, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:47:32', '2022-01-15 18:47:32'),
(515, 'Jhenaigati', 101, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:47:54', '2022-01-15 18:47:54'),
(516, 'Nakla', 101, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:48:14', '2022-01-15 18:48:14'),
(517, 'Nalitabari', 101, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:48:29', '2022-01-15 18:48:29'),
(518, 'Sherpur-S', 101, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:48:45', '2022-01-15 18:48:45'),
(519, 'Sreebordi', 101, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:48:59', '2022-01-15 18:48:59'),
(520, 'Birampur', 87, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:51:22', '2022-01-15 18:51:22'),
(521, 'Gaibandha', 0, NULL, '1', '1', 'Admin', NULL, '2022-01-15 18:51:24', '2022-01-15 18:51:24'),
(522, 'Fulchari', 521, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:51:45', '2022-01-15 18:51:45'),
(523, 'Birganj', 87, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:51:58', '2022-01-15 18:51:58'),
(524, 'Gaibandha-S', 521, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:52:01', '2022-01-15 18:52:01'),
(525, 'Gobindaganj', 521, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:52:15', '2022-01-15 18:52:15'),
(526, 'Palashbari', 521, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:52:26', '2022-01-15 18:52:26'),
(527, 'Biral', 87, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:52:26', '2022-01-15 18:52:26'),
(528, 'Sadullapur', 521, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:52:35', '2022-01-15 18:52:35'),
(529, 'Saghata', 521, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:52:45', '2022-01-15 18:52:45'),
(530, 'Bochaganj', 87, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:52:48', '2022-01-15 18:52:48'),
(531, 'Sundarganj', 521, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:53:01', '2022-01-15 18:53:01'),
(532, 'Chirirbandar', 87, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:53:14', '2022-01-15 18:53:14'),
(533, 'Phulbari', 87, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:53:35', '2022-01-15 18:53:35'),
(534, 'Bhurungamari', 90, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:53:36', '2022-01-15 18:53:36'),
(535, 'Chilmari', 90, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:53:51', '2022-01-15 18:53:51'),
(536, 'Fulbari', 90, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:54:07', '2022-01-15 18:54:07'),
(537, 'Kurigram-S', 90, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:54:21', '2022-01-15 18:54:21'),
(538, 'Ghoraghat', 87, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:54:31', '2022-01-15 18:54:31'),
(539, 'Nageswari', 90, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:54:32', '2022-01-15 18:54:32'),
(540, 'Rajarhat', 90, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:54:45', '2022-01-15 18:54:45'),
(541, 'Hakimpur', 87, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:54:52', '2022-01-15 18:54:52'),
(542, 'Rajibpur', 90, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:54:58', '2022-01-15 18:54:58'),
(543, 'Kaharole', 87, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:55:12', '2022-01-15 18:55:12'),
(544, 'Rowmari', 90, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:55:13', '2022-01-15 18:55:13'),
(545, 'Khansama', 87, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:55:30', '2022-01-15 18:55:30'),
(546, 'Ulipur', 90, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:55:30', '2022-01-15 18:55:30'),
(547, 'Dinajpur Sadar', 87, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:55:52', '2022-01-15 18:55:52'),
(548, 'Aditmari', 92, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:56:02', '2022-01-15 18:56:02'),
(549, 'Nawabganj', 87, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:56:11', '2022-01-15 18:56:11'),
(550, 'Hatibandha', 92, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:56:13', '2022-01-15 18:56:13'),
(551, 'Kaliganj', 92, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:56:27', '2022-01-15 18:56:27'),
(552, 'Parbatipur', 87, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:56:28', '2022-01-15 18:56:28'),
(553, 'Lalmonirhat-S', 92, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:56:43', '2022-01-15 18:56:43'),
(554, 'Patgram', 92, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:56:57', '2022-01-15 18:56:57'),
(555, 'Dimla', 94, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:57:51', '2022-01-15 18:57:51'),
(556, 'Domar', 94, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:58:19', '2022-01-15 18:58:19'),
(557, 'Jaldhaka', 94, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:58:38', '2022-01-15 18:58:38'),
(558, 'Kishoreganj', 94, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:59:02', '2022-01-15 18:59:02'),
(559, 'Nilphamari Sadar', 94, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:59:20', '2022-01-15 18:59:20'),
(560, 'Saidpur', 94, NULL, '2', '1', 'Admin', NULL, '2022-01-15 18:59:38', '2022-01-15 18:59:38'),
(561, 'Atwari', 95, NULL, '2', '1', 'Admin', NULL, '2022-01-15 19:00:58', '2022-01-15 19:00:58'),
(562, 'Boda', 95, NULL, '2', '1', 'Admin', NULL, '2022-01-15 19:01:17', '2022-01-15 19:01:17'),
(563, 'Debiganj', 95, NULL, '2', '1', 'Admin', NULL, '2022-01-15 19:01:45', '2022-01-15 19:01:45'),
(564, 'Panchagarh Sadar', 95, NULL, '2', '1', 'Admin', NULL, '2022-01-15 19:02:07', '2022-01-15 19:02:07');
INSERT INTO `locations` (`id`, `name`, `parent_id`, `grand_parent_id`, `type`, `status`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(565, 'Tetulia', 95, NULL, '2', '1', 'Admin', NULL, '2022-01-15 19:02:30', '2022-01-15 19:02:30'),
(566, 'Atwari', 98, NULL, '2', '1', 'Admin', NULL, '2022-01-15 19:03:03', '2022-01-15 19:03:03'),
(567, 'Gangachhara', 98, NULL, '2', '1', 'Admin', NULL, '2022-01-15 19:03:31', '2022-01-15 19:03:31'),
(568, 'Kaunia', 98, NULL, '2', '1', 'Admin', NULL, '2022-01-15 19:03:55', '2022-01-15 19:03:55'),
(569, 'Rangpur Sadar', 98, NULL, '2', '1', 'Admin', NULL, '2022-01-15 19:04:23', '2022-01-15 19:04:23'),
(570, 'Mithapukur', 98, NULL, '2', '1', 'Admin', NULL, '2022-01-15 19:04:50', '2022-01-15 19:04:50'),
(571, 'Pirgachha', 98, NULL, '2', '1', 'Admin', NULL, '2022-01-15 19:05:15', '2022-01-15 19:05:15'),
(572, 'Pirganj', 98, NULL, '2', '1', 'Admin', NULL, '2022-01-15 19:05:42', '2022-01-15 19:05:42'),
(573, 'Taraganj', 98, NULL, '2', '1', 'Admin', NULL, '2022-01-15 19:06:22', '2022-01-15 19:06:22'),
(574, 'Baliadangi', 100, NULL, '2', '1', 'Admin', NULL, '2022-01-15 19:08:36', '2022-01-15 19:08:36'),
(575, 'Haripur', 100, NULL, '2', '1', 'Admin', NULL, '2022-01-15 19:09:00', '2022-01-15 19:09:00'),
(576, 'Pirganj', 100, NULL, '2', '1', 'Admin', NULL, '2022-01-15 19:09:12', '2022-01-15 19:09:12'),
(577, 'Ranisankail', 100, NULL, '2', '1', 'Admin', NULL, '2022-01-15 19:09:27', '2022-01-15 19:09:27'),
(578, 'Thakurgaon-S', 100, NULL, '2', '1', 'Admin', NULL, '2022-01-15 19:09:38', '2022-01-15 19:09:38'),
(579, 'Ajmiriganj', 62, NULL, '2', '1', 'Admin', NULL, '2022-01-15 19:09:48', '2022-01-15 19:09:48'),
(580, 'Bahubal', 62, NULL, '2', '1', 'Admin', NULL, '2022-01-15 19:10:19', '2022-01-15 19:10:19'),
(581, 'Baniyachong', 62, NULL, '2', '1', 'Admin', NULL, '2022-01-15 19:10:40', '2022-01-15 19:10:40'),
(582, 'Chunarughat', 62, NULL, '2', '1', 'Admin', NULL, '2022-01-15 19:11:05', '2022-01-15 19:11:05'),
(583, 'Habiganj Sadar', 62, NULL, '2', '1', 'Admin', NULL, '2022-01-15 19:11:30', '2022-01-15 19:11:30'),
(584, 'Lakhai', 62, NULL, '2', '1', 'Admin', NULL, '2022-01-15 19:11:57', '2022-01-15 19:11:57'),
(585, 'Barlekha', 63, NULL, '2', '1', 'Admin', NULL, '2022-01-15 19:11:57', '2022-01-15 19:11:57'),
(586, 'Juri', 63, NULL, '2', '1', 'Admin', NULL, '2022-01-15 19:12:12', '2022-01-15 19:12:12'),
(587, 'Kamalganj', 63, NULL, '2', '1', 'Admin', NULL, '2022-01-15 19:12:29', '2022-01-15 19:12:29'),
(588, 'Kulaura', 63, NULL, '2', '1', 'Admin', NULL, '2022-01-15 19:12:43', '2022-01-15 19:12:43'),
(589, 'Madhabpur', 62, NULL, '2', '1', 'Admin', NULL, '2022-01-15 19:12:50', '2022-01-15 19:12:50'),
(590, 'Moulvibazar-S', 63, NULL, '2', '1', 'Admin', NULL, '2022-01-15 19:12:56', '2022-01-15 19:12:56'),
(591, 'Rajnagar', 63, NULL, '2', '1', 'Admin', NULL, '2022-01-15 19:13:11', '2022-01-15 19:13:11'),
(592, 'Nabiganj', 62, NULL, '2', '1', 'Admin', NULL, '2022-01-15 19:13:22', '2022-01-15 19:13:22'),
(593, 'Sreemangal', 63, NULL, '2', '1', 'Admin', NULL, '2022-01-15 19:13:25', '2022-01-15 19:13:25'),
(594, 'Shayestaganj', 62, NULL, '2', '1', 'Admin', NULL, '2022-01-15 19:13:54', '2022-01-15 19:13:54'),
(595, 'Balaganj', 66, NULL, '2', '1', 'Admin', NULL, '2022-01-15 19:14:24', '2022-01-15 19:14:24'),
(596, 'Beanibazar', 66, NULL, '2', '1', 'Admin', NULL, '2022-01-15 19:14:36', '2022-01-15 19:14:36'),
(597, 'Bishwamvarpur', 65, NULL, '2', '1', 'Admin', NULL, '2022-01-15 19:14:43', '2022-01-15 19:14:43'),
(598, 'Biswanath', 66, NULL, '2', '1', 'Admin', NULL, '2022-01-15 19:14:48', '2022-01-15 19:14:48'),
(599, 'Companiganj', 66, NULL, '2', '1', 'Admin', NULL, '2022-01-15 19:15:00', '2022-01-15 19:15:00'),
(600, 'Chhatak', 65, NULL, '2', '1', 'Admin', NULL, '2022-01-15 19:15:13', '2022-01-15 19:15:13'),
(601, 'Dakshin Surma', 66, NULL, '2', '1', 'Admin', NULL, '2022-01-15 19:15:16', '2022-01-15 19:15:16'),
(602, 'Fenchuganj', 66, NULL, '2', '1', 'Admin', NULL, '2022-01-15 19:15:27', '2022-01-15 19:15:27'),
(603, 'Shantiganj', 65, NULL, '2', '1', 'Admin', NULL, '2022-01-15 19:15:37', '2022-01-15 19:15:37'),
(604, 'Golapganj', 66, NULL, '2', '1', 'Admin', NULL, '2022-01-15 19:15:38', '2022-01-15 19:15:38'),
(605, 'Gowainghat', 66, NULL, '2', '1', 'Admin', NULL, '2022-01-15 19:15:50', '2022-01-15 19:15:50'),
(606, 'Derai', 65, NULL, '2', '1', 'Admin', NULL, '2022-01-15 19:15:57', '2022-01-15 19:15:57'),
(607, 'Jointiapur', 66, NULL, '2', '1', 'Admin', NULL, '2022-01-15 19:16:00', '2022-01-15 19:16:00'),
(608, 'Kanaighat', 66, NULL, '2', '1', 'Admin', NULL, '2022-01-15 19:16:12', '2022-01-15 19:16:12'),
(609, 'Dharamapasha', 65, NULL, '2', '1', 'Admin', NULL, '2022-01-15 19:16:18', '2022-01-15 19:16:18'),
(610, 'Osmaninagar', 66, NULL, '2', '1', 'Admin', NULL, '2022-01-15 19:16:25', '2022-01-15 19:16:25'),
(611, 'Sylhet-S', 66, NULL, '2', '1', 'Admin', NULL, '2022-01-15 19:16:37', '2022-01-15 19:16:37'),
(612, 'Dowarabazar', 65, NULL, '2', '1', 'Admin', NULL, '2022-01-15 19:16:39', '2022-01-15 19:16:39'),
(613, 'Zakiganj', 66, NULL, '2', '1', 'Admin', NULL, '2022-01-15 19:16:47', '2022-01-15 19:16:47'),
(614, 'Jagannathpur', 65, NULL, '2', '1', 'Admin', NULL, '2022-01-15 19:17:06', '2022-01-15 19:17:06'),
(615, 'Jamalganj', 65, NULL, '2', '1', 'Admin', NULL, '2022-01-15 19:17:34', '2022-01-15 19:17:34'),
(616, 'Sullah', 65, NULL, '2', '1', 'Admin', NULL, '2022-01-15 19:17:58', '2022-01-15 19:17:58'),
(617, 'Sunamganj Sadar', 65, NULL, '2', '1', 'Admin', NULL, '2022-01-15 19:18:26', '2022-01-15 19:18:26'),
(618, 'Tahirpur', 65, NULL, '2', '1', 'Admin', NULL, '2022-01-15 19:18:48', '2022-01-15 19:18:48'),
(619, 'Modhyanagar', 65, NULL, '2', '1', 'Admin', NULL, '2022-01-15 19:19:26', '2022-01-15 19:19:26'),
(652, 'Mirpur 11', 3, 2, '3', '1', 'Admin', NULL, '2022-01-20 18:31:57', '2022-01-20 18:31:57'),
(653, 'Mirpur 11 -1/2', 3, 2, '3', '1', 'Admin', 'Admin', '2022-01-20 18:32:15', '2022-01-20 18:32:33'),
(654, 'Mohammadpur( মোহাম্মদপুর)', 3, 2, '3', '1', 'Admin', 'Sabbir Hossain (BABU)', '2022-01-20 18:32:51', '2022-12-10 13:40:43'),
(655, 'Bihari Camp( বিহারী কেম্প )', 3, 2, '3', '1', 'Admin', 'Sabbir Hossain (BABU)', '2022-01-20 18:34:14', '2022-12-10 13:40:27'),
(656, 'Muslim Bazer( মুসলিম বাজার)', 3, 2, '3', '1', 'Admin', 'Sabbir Hossain (BABU)', '2022-01-20 18:34:30', '2022-12-10 13:40:09'),
(695, 'Matikata( মাটিকাটা )', 3, 2, '3', '1', 'Super Admin', 'Sabbir Hossain (BABU)', '2022-06-15 05:38:28', '2022-12-10 13:39:56'),
(698, 'Dhaka South City', 2, NULL, '2', '1', 'Marjuk Nobi (Jitu)', NULL, '2022-11-28 11:13:01', '2022-11-28 11:13:01'),
(699, 'Shawrapara Bus stand( শেওড়াপাড়া বাস স্ট্যান্ড )', 3, 2, '3', '1', 'Sabbir Hossain (BABU)', 'Sabbir Hossain (BABU)', '2022-11-30 12:15:36', '2022-12-10 13:39:38'),
(700, 'Anondobazer( আনন্দবাজার )', 3, 2, '3', '1', 'Sabbir Hossain (BABU)', 'Sabbir Hossain (BABU)', '2022-11-30 12:16:01', '2022-12-10 13:39:22'),
(701, 'Olimiyer Tak Bou Bazer( অলিমিয়া টেক বউবাজার )', 3, 2, '3', '1', 'Sabbir Hossain (BABU)', 'Sabbir Hossain (BABU)', '2022-11-30 12:16:45', '2022-12-10 13:39:05'),
(702, 'Olimiyer Tak Khalper( অলি মিয়ার টেক খালপার )', 3, 2, '3', '1', 'Sabbir Hossain (BABU)', 'Sabbir Hossain (BABU)', '2022-11-30 12:17:33', '2022-12-10 13:38:46'),
(703, 'Porchim Shawrapara( পশ্চিম শেওড়াপাড়া )', 3, 2, '3', '1', 'Sabbir Hossain (BABU)', 'Sabbir Hossain (BABU)', '2022-11-30 12:18:08', '2022-12-10 13:38:26'),
(704, 'Bawniyabad(বাউনিয়াবাদ)', 3, 2, '3', '1', 'Sabbir Hossain (BABU)', 'Sabbir Hossain (BABU)', '2022-11-30 12:36:06', '2022-12-10 13:37:51'),
(705, 'Kollayanpur(কল্যাণপুর)', 3, 2, '3', '1', 'Abdul Hannan', 'Sabbir Hossain (BABU)', '2022-11-30 14:44:23', '2022-12-10 13:37:07'),
(706, 'Uttar kafrul( উত্তর কাফরুল)', 3, 2, '3', '1', 'Abdul Hannan', 'Sabbir Hossain (BABU)', '2022-11-30 14:50:52', '2022-12-10 13:36:40'),
(707, 'Damalcode(ধামালকোট)', 3, 2, '3', '1', 'Abdul Hannan', 'Sabbir Hossain (BABU)', '2022-11-30 14:51:17', '2022-12-10 13:36:18'),
(708, 'Uttar Pirerbug Kacha Bazaar (উত্তর পীরেরবাগ কাঁচা বাজার)', 3, 2, '3', '1', 'Abdul Hannan', 'Admin', '2022-11-30 14:51:50', '2022-12-13 14:58:20'),
(709, 'Vasantek(ভাষানটেক)', 3, 2, '3', '1', 'Abdul Hannan', 'Sabbir Hossain (BABU)', '2022-11-30 14:53:07', '2022-12-10 13:35:27'),
(710, 'Uttar Pirerbag(উত্তর পীরেরবাগ)', 3, 2, '3', '1', 'Sabbir Hossain (BABU)', 'Admin', '2022-11-30 20:34:00', '2022-12-13 14:57:14'),
(711, 'Dokhin paykpara(দক্ষিণ পাইকপাড়া)', 3, 2, '3', '1', 'Sabbir Hossain (BABU)', 'Sabbir Hossain (BABU)', '2022-11-30 21:24:34', '2022-12-10 13:35:01'),
(713, 'Manikdi(মানিকদি)', 3, 2, '3', '1', 'Abdul Hannan', 'Sabbir Hossain (BABU)', '2022-12-01 17:15:46', '2022-12-06 18:21:22'),
(714, 'Balughat bazer(বালুঘাট বাজার)', 3, 2, '3', '1', 'Abdul Hannan', 'Sabbir Hossain (BABU)', '2022-12-01 17:33:37', '2022-12-10 13:34:06'),
(715, 'Mirpur 13/Bayshtaki (মিরপুর ১৩/ বাইশটেকি)', 3, 2, '3', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-06 13:41:24', '2022-12-06 13:41:24'),
(716, 'B N P Bazer(বি এন পি বাজার)', 3, 2, '3', '1', 'Sabbir Hossain (BABU)', 'Sabbir Hossain (BABU)', '2022-12-07 17:41:42', '2022-12-07 17:49:38'),
(717, 'Taltola(তালতলা)', 3, 2, '3', '1', 'Sabbir Hossain (BABU)', 'Sabbir Hossain (BABU)', '2022-12-07 17:42:26', '2022-12-07 17:48:35'),
(718, 'Agargaon(আগারগাঁও)', 3, 2, '3', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-07 17:47:30', '2022-12-07 17:47:30'),
(719, 'Ahamed Nogor(আহমেদ নগর )', 3, 2, '3', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-07 21:09:15', '2022-12-07 21:09:15'),
(720, 'Borobag(বড়বাগ )', 3, 2, '3', '1', 'Sabbir Hossain (BABU)', 'Sabbir Hossain (BABU)', '2022-12-07 21:11:07', '2022-12-07 21:14:19'),
(721, 'Mirpur 14 Nave market(মিরপুর ১৪ নেবি মার্কেট)', 3, 2, '3', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 14:34:02', '2022-12-10 14:34:02'),
(722, 'Bawniya (বাউনিয়া)', 3, 2, '3', '1', 'Sabbir Hossain (BABU)', 'Admin', '2022-12-12 17:44:19', '2022-12-13 14:56:20'),
(723, 'Potka Bazar', 238, 52, '3', '1', 'Super Admin', NULL, '2023-05-02 06:02:47', '2023-05-02 06:02:47');

-- --------------------------------------------------------

--
-- Table structure for table `materials`
--

CREATE TABLE `materials` (
  `id` bigint UNSIGNED NOT NULL,
  `material_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `material_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `unit_id` bigint UNSIGNED NOT NULL,
  `purchase_unit_id` bigint UNSIGNED NOT NULL,
  `cost` double DEFAULT NULL,
  `old_cost` double(10,2) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `alert_qty` double DEFAULT NULL,
  `tax_id` bigint UNSIGNED DEFAULT NULL,
  `tax_method` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Exclusive,2=Inclusive',
  `type` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Raw,2=Packaging',
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `has_opening_stock` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=Yes, 2=No',
  `opening_stock_qty` double DEFAULT NULL,
  `opening_cost` double DEFAULT NULL,
  `opening_warehouse_id` bigint UNSIGNED DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `materials`
--

INSERT INTO `materials` (`id`, `material_name`, `material_code`, `category_id`, `unit_id`, `purchase_unit_id`, `cost`, `old_cost`, `qty`, `alert_qty`, `tax_id`, `tax_method`, `type`, `status`, `has_opening_stock`, `opening_stock_qty`, `opening_cost`, `opening_warehouse_id`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(4, 'Maize Local', '33042068', 10, 2, 2, 20, 0.00, 83.75, 5000, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', 'Super Admin', '2023-05-16 20:01:48', '2023-06-05 04:25:21'),
(5, 'Maize LC', '73219898', 10, 2, 14, 0, NULL, NULL, 2000, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', 'Super Admin', '2023-05-16 20:02:39', '2023-05-16 20:07:27'),
(6, 'Paddy Rice', '93169839', 10, 2, 14, 0, NULL, NULL, 0, NULL, '1', '1', '2', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-16 20:04:30', '2023-05-16 20:04:49'),
(7, 'Broken Wheat', '11280079', 10, 2, 14, 0, NULL, NULL, 0, NULL, '1', '1', '2', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-16 20:06:14', '2023-05-17 18:13:35'),
(8, 'Wheat Grain', '54019312', 10, 2, 14, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-16 20:06:56', '2023-05-17 18:13:27'),
(9, 'Broken Rice', '41490835', 10, 2, 14, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-16 20:08:30', '2023-05-16 20:08:30'),
(10, 'Rice Rough', '81926701', 10, 2, 14, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-16 20:09:07', '2023-05-16 20:09:07'),
(11, 'Soya Bean - Full Fat', '17632587', 10, 2, 2, 20, 0.00, 896.25, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', 'Super Admin', '2023-05-16 20:10:04', '2023-06-05 04:25:21'),
(12, 'Poultry Meal', '50318407', 10, 2, 2, 20, 0.00, 956.25, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:17:08', '2023-06-04 08:16:59'),
(13, 'Fish Meal', '35510900', 10, 2, 14, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:17:42', '2023-05-17 18:17:42'),
(14, 'Dry Fish Powder', '19780723', 10, 2, 2, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:18:13', '2023-05-17 18:18:13'),
(15, 'Blood Meal', '18954599', 10, 2, 2, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:18:38', '2023-05-17 18:18:38'),
(16, 'Soya Meal - Low Pro', '25180592', 10, 2, 14, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:19:15', '2023-05-17 18:19:15'),
(17, 'Shorisha Khoil', '73465828', 10, 2, 2, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:19:49', '2023-05-17 18:19:49'),
(18, 'Rapseed Meal', '24052433', 10, 2, 2, 20, 0.00, 947.5, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', 'Super Admin', '2023-05-17 18:20:20', '2023-06-04 08:16:59'),
(19, 'Bakery Biproduct', '43046320', 10, 2, 2, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:20:57', '2023-05-17 18:20:57'),
(20, 'Corn DDGS', '61098291', 10, 2, 2, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:21:31', '2023-05-17 18:21:31'),
(21, 'CGM', '51043826', 10, 2, 2, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:21:56', '2023-05-17 18:21:56'),
(22, 'Soya Seed Husk', '29538227', 10, 2, 2, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:22:55', '2023-05-17 18:22:55'),
(23, 'Rice Polish - Atop', '92413385', 10, 2, 14, 20, 0.00, 913.75, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:23:34', '2023-06-05 04:25:21'),
(24, 'Rice Polish - Boiled', '38391024', 10, 2, 2, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:24:09', '2023-05-17 18:24:09'),
(25, 'Rice Polish - B', '72188703', 10, 2, 2, 30, 0.00, 100, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:24:36', '2023-05-27 04:30:45'),
(26, 'DORB', '47862112', 10, 2, 2, 20, 0.00, 528.75, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:25:01', '2023-06-05 04:25:21'),
(27, 'Atta', '57326510', 10, 2, 2, 0, NULL, 100, 10, NULL, '1', '1', '1', '1', 100, 21, 5, 'Super Admin', 'Super Admin', '2023-05-17 18:25:39', '2023-06-05 04:15:44'),
(28, 'Calcium Phosphorus', '28064106', 10, 2, 2, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:26:26', '2023-05-17 18:26:26'),
(29, 'Limestone Powder', '72982505', 10, 2, 2, 20, 0.00, 968.5, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:26:51', '2023-06-04 08:16:59'),
(30, 'Limestone Granular', '62313310', 10, 2, 2, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:27:18', '2023-05-17 18:27:18'),
(31, 'Limestone Shujidana', '16335831', 10, 2, 2, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:27:43', '2023-05-17 18:27:43'),
(32, 'Di-calcium Phosphate', '97258603', 10, 2, 2, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:28:11', '2023-05-17 18:28:11'),
(33, 'Mono Calcium Phosphate', '09613523', 10, 2, 2, 20, 0.00, 989.5, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:28:48', '2023-06-04 08:16:59'),
(34, 'Egg Shell Powder', '87892373', 10, 2, 2, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:29:16', '2023-05-17 18:29:16'),
(35, 'Soya Oil', '38471705', 12, 10, 10, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:29:40', '2023-05-17 18:29:40'),
(36, 'Palm Oil', '75183892', 12, 10, 10, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:30:04', '2023-05-17 18:30:04'),
(37, 'Fish Oil', '49086895', 12, 10, 10, 20, 0.00, 999.13, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:30:32', '2023-06-04 08:16:59'),
(38, 'Rice Bran Oil', '73252241', 12, 10, 10, 20, 0.00, 965, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:30:58', '2023-06-04 08:16:59'),
(39, 'Other Fat', '87036213', 12, 10, 10, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:31:31', '2023-05-17 18:31:31'),
(40, 'Molasses', '02267119', 12, 10, 10, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:32:08', '2023-05-17 18:32:08'),
(41, 'DL - Methionine', '23187246', 11, 2, 2, 20, 0.00, 994.75, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:33:38', '2023-06-04 08:16:59'),
(42, 'L - Lysine', '02038530', 11, 2, 2, 20, 0.00, 996.5, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:34:05', '2023-06-04 08:16:59'),
(43, 'L - Threonine', '67235093', 11, 2, 2, 20, 0.00, 999.13, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:34:39', '2023-06-04 08:16:59'),
(44, 'L - Tryptophan', '27065293', 11, 2, 2, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:35:06', '2023-05-17 18:35:06'),
(45, 'L - Valine', '98701138', 11, 2, 2, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:35:27', '2023-05-17 18:35:27'),
(46, 'L - Cystine', '23276916', 11, 2, 2, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:35:53', '2023-05-17 18:35:53'),
(47, 'L - Histidine', '21952336', 11, 2, 2, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:36:18', '2023-05-17 18:36:18'),
(48, 'L -Arginine', '37303519', 11, 2, 2, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:36:57', '2023-05-17 18:36:57'),
(49, 'Guanidino Acetic Acid', '89544720', 11, 2, 2, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:37:32', '2023-05-17 18:37:32'),
(50, 'Choline Chloride', '24053237', 11, 2, 2, 20, 0.00, 999.13, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:38:33', '2023-06-04 08:16:59'),
(51, 'Sodium - bi - Carbonate', '17578893', 11, 2, 2, 20, 0.00, 998.25, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:39:15', '2023-06-04 08:16:59'),
(52, 'Common Salt', '10205142', 11, 2, 2, 20, 0.00, 995.63, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:39:40', '2023-06-04 08:16:59'),
(53, 'Toxin Binder', '02393974', 11, 2, 2, 20, 0.00, 998.25, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:40:08', '2023-06-04 08:16:59'),
(54, 'Mold Inhibitor', '27050183', 11, 2, 2, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:41:22', '2023-05-17 18:41:22'),
(55, 'Growth Promoter', '52440870', 11, 2, 2, 20, 0.00, 999.57, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:41:47', '2023-06-04 08:16:59'),
(56, 'Salmonella Killer', '21304215', 11, 2, 2, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:42:21', '2023-05-17 18:42:21'),
(57, 'Antioxidant', '93719122', 11, 2, 2, 20, 0.00, 999.73, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:42:45', '2023-06-04 08:16:59'),
(58, 'Emulsifier', '37705326', 11, 2, 2, 20, 0.00, 999.13, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:43:12', '2023-06-04 08:16:59'),
(59, 'Gut Stimulant', '60280299', 11, 2, 2, 20, 0.00, 999.13, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:43:42', '2023-06-04 08:16:59'),
(60, 'Liver Tonic', '24267198', 11, 2, 2, 10, 0.00, 100, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:44:05', '2023-05-28 03:31:27'),
(61, 'Feed Color', '56423879', 11, 2, 2, 20, 0.00, 999.57, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:44:29', '2023-06-04 08:16:59'),
(62, 'Turmeric Powder', '63130922', 11, 2, 2, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:44:52', '2023-05-17 18:44:52'),
(63, 'Feed Flavor', '92359378', 11, 2, 2, 20, 0.00, 999.53, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:45:22', '2023-06-04 08:16:59'),
(64, 'Probiotics', '75466017', 11, 2, 2, 20, 0.00, 999.57, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:46:08', '2023-06-04 08:16:59'),
(65, 'Prebiotics', '34040182', 11, 2, 2, 20, 0.00, 999.13, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:46:29', '2023-06-04 08:16:59'),
(66, 'Anti Diarrhoeal/NAGP', '18439212', 11, 2, 2, 20, 0.00, 999.13, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:47:19', '2023-06-04 08:16:59'),
(67, 'Urea', '08225036', 11, 2, 2, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:47:41', '2023-05-17 18:47:41'),
(68, 'Pellet Binder', '42132550', 11, 2, 2, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:48:21', '2023-05-17 18:48:21'),
(69, 'Vitamin C', '73417503', 11, 2, 2, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:48:45', '2023-05-17 18:48:45'),
(70, 'Copper Sulphate', '29860942', 11, 2, 2, 20, 0.00, 999.83, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:49:07', '2023-06-04 08:16:59'),
(71, 'Aluminum Sulphate', '04923978', 11, 2, 2, 20, 0.00, 999.57, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:49:51', '2023-06-04 08:16:59'),
(72, 'Magnesium Sulphate', '19981240', 11, 2, 2, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:50:19', '2023-05-17 18:50:19'),
(73, 'Vitamin & Mineral Premixes', '34947852', 13, 2, 2, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:50:51', '2023-05-17 18:50:51'),
(74, 'Layer Vitamin Premixes', '39182091', 13, 2, 2, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:51:16', '2023-05-17 18:51:16'),
(75, 'Broiler Vitamin Premixes', '18221558', 13, 2, 2, 20, 0.00, 1000, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:52:45', '2023-05-21 09:28:25'),
(76, 'Broiler Vitamin & Mineral Premixes', '97324829', 13, 2, 2, 0, NULL, 999.13, 10, NULL, '1', '1', '1', '1', 1000, 10, 5, 'Super Admin', 'Super Admin', '2023-05-17 18:53:21', '2023-06-04 08:16:59'),
(77, 'Fish Vitamin Premixes', '93201633', 13, 2, 2, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:53:50', '2023-05-17 18:53:50'),
(78, 'Cattle Vitamin Premixes', '86143815', 13, 2, 2, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:54:11', '2023-05-17 18:54:11'),
(79, 'Trace Vitamin Premixes', '20239134', 13, 2, 2, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:54:33', '2023-05-17 18:54:33'),
(80, 'Organic Vitamin Premixes', '93960772', 13, 2, 2, 20, 0.00, 999.57, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:54:54', '2023-06-04 08:16:59'),
(81, 'Fish Vitamin & Mineral Premixes', '39521290', 13, 2, 2, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:55:35', '2023-05-17 18:55:35'),
(82, 'Cattle Vitamin & Mineral Premixes', '70982923', 13, 2, 2, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:55:57', '2023-05-17 18:55:57'),
(83, 'Multi Vitamin & Mineral Premixes', '54295812', 13, 2, 2, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:56:22', '2023-05-17 18:56:22'),
(84, 'Enzyme Complex/ Multi', '85928091', 16, 2, 2, 20, 0.00, 999.83, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:58:24', '2023-06-04 08:16:59'),
(85, 'Enzyme Phytase', '81423793', 16, 2, 2, 20, 0.00, 999.13, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:58:50', '2023-06-04 08:16:59'),
(86, 'Enzyme Protease', '41810203', 16, 2, 2, 0, NULL, 999.73, 2, NULL, '1', '1', '1', '1', 1000, 10, 5, 'Super Admin', 'Super Admin', '2023-05-17 18:59:13', '2023-06-04 08:16:59'),
(87, 'Enzyme Xylanase', '82799429', 16, 2, 2, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 18:59:41', '2023-05-17 18:59:41'),
(88, 'Enzyme Mannanase', '51945720', 16, 2, 2, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 19:00:12', '2023-05-17 19:00:12'),
(89, 'Coccidiostat', '15179209', 16, 2, 2, 20, 0.00, 999.65, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 19:00:35', '2023-06-04 08:16:59'),
(90, 'Later 1', '70280249', 17, 2, 2, 20, 0.00, 999.13, 0, NULL, '1', '2', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 19:01:51', '2023-06-04 08:16:59'),
(91, 'Layer 2', '97740369', 17, 2, 2, 0, NULL, NULL, 0, NULL, '1', '2', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 19:02:29', '2023-05-17 19:02:29'),
(92, 'Broiler Starter', '72365106', 17, 2, 2, 0, NULL, NULL, 0, NULL, '1', '2', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 19:02:57', '2023-05-17 19:02:57'),
(93, 'Broiler Grower', '27340855', 17, 2, 2, 0, NULL, NULL, 0, NULL, '1', '2', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 19:03:23', '2023-05-17 19:03:23'),
(94, 'Sonali Starter', '20722483', 17, 2, 2, 0, NULL, NULL, 0, NULL, '1', '2', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 19:03:48', '2023-05-17 19:03:48'),
(95, 'Sonali Grower', '21168190', 17, 2, 2, 0, NULL, NULL, 0, NULL, '1', '2', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 19:04:13', '2023-05-17 19:04:13'),
(96, 'Layer Starter', '82714931', 17, 2, 2, 0, NULL, NULL, 0, NULL, '1', '2', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 19:04:38', '2023-05-17 19:04:38'),
(97, 'Layer Grower', '25600742', 17, 2, 2, 0, NULL, NULL, 0, NULL, '1', '2', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 19:05:03', '2023-05-17 19:05:03'),
(98, 'Layer Layer 1', '90513394', 17, 2, 2, 0, NULL, NULL, 0, NULL, '1', '2', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 19:05:29', '2023-05-17 19:05:29'),
(99, 'Layer Layer 2', '46098352', 17, 2, 2, 0, NULL, NULL, 0, NULL, '1', '2', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 19:05:50', '2023-05-17 19:05:50'),
(100, 'Soya Meal - Hi Pro', '80931420', 10, 2, 2, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-17 19:13:00', '2023-05-17 19:13:00'),
(101, 'A', '07122421', 11, 2, 2, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-21 04:33:33', '2023-05-21 04:33:33'),
(102, 'B', '43298857', 12, 2, 2, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-21 04:33:57', '2023-05-21 04:33:57'),
(103, 'C', '11680322', 12, 2, 2, 45, 0.00, 100, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-21 04:34:11', '2023-05-31 04:03:50'),
(104, 'D', '93458107', 16, 2, 2, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-21 04:34:41', '2023-05-21 04:34:41'),
(105, 'E', '28090653', 16, 10, 10, 0, NULL, NULL, 0, NULL, '1', '2', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-21 04:34:58', '2023-05-21 04:34:58'),
(106, 'F', '55248314', 11, 2, 2, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-21 04:35:11', '2023-05-21 04:35:11'),
(107, 'G', '29440980', 11, 2, 2, 0, NULL, NULL, 0, NULL, '1', '2', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-21 04:35:28', '2023-05-21 04:35:28'),
(108, 'H', '49168351', 11, 2, 2, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-21 04:35:47', '2023-05-21 04:35:47'),
(109, 'I', '03772158', 12, 2, 2, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-21 04:36:09', '2023-05-21 04:36:09'),
(110, 'J', '43769923', 11, 2, 2, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-21 04:36:28', '2023-05-21 04:36:28'),
(111, 'K', '40160703', 11, 2, 2, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-21 04:36:44', '2023-05-21 04:36:44'),
(112, 'L', '62089771', 11, 2, 2, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-21 04:37:01', '2023-05-21 04:37:01'),
(113, 'M', '35709426', 13, 2, 2, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-21 04:37:16', '2023-05-21 04:37:16'),
(114, 'N', '48137129', 10, 2, 2, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-21 04:37:31', '2023-05-21 04:37:31'),
(115, 'O', '61347290', 11, 2, 2, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-21 04:37:45', '2023-05-21 04:37:45'),
(116, 'P', '08129354', 16, 2, 2, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-21 04:38:01', '2023-05-21 04:38:01'),
(117, 'Q', '99436895', 12, 2, 2, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-21 04:38:26', '2023-05-21 04:38:26'),
(118, 'R', '29671146', 13, 2, 2, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-21 04:38:39', '2023-05-21 04:38:39'),
(119, 'S', '63417810', 11, 2, 2, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-21 04:38:52', '2023-05-21 04:38:52'),
(120, 'T', '51416073', 12, 2, 2, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-21 04:39:25', '2023-05-21 04:39:25'),
(121, 'U', '79723102', 12, 2, 2, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-21 04:39:39', '2023-05-21 04:39:39'),
(122, 'V', '29953011', 12, 10, 10, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-21 04:39:54', '2023-05-21 04:39:54'),
(123, 'W', '20762811', 11, 2, 2, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-21 04:40:09', '2023-05-21 04:40:09'),
(124, 'X', '85543931', 12, 2, 2, 0, NULL, NULL, 0, NULL, '1', '2', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-21 04:40:27', '2023-05-21 04:40:27'),
(125, 'Y', '59117144', 11, 2, 2, 23.055555555556, 21.67, 180, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-21 04:40:45', '2023-05-30 07:29:05'),
(126, 'Z', '96831243', 16, 2, 2, 25, 0.00, 100, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2023-05-21 04:41:05', '2023-05-27 04:32:46');

-- --------------------------------------------------------

--
-- Table structure for table `material_purchase`
--

CREATE TABLE `material_purchase` (
  `id` bigint UNSIGNED NOT NULL,
  `purchase_id` bigint UNSIGNED NOT NULL,
  `material_id` bigint UNSIGNED NOT NULL,
  `qty` double NOT NULL,
  `received` double NOT NULL,
  `purchase_unit_id` bigint UNSIGNED DEFAULT NULL,
  `net_unit_cost` double NOT NULL,
  `new_unit_cost` double(10,2) DEFAULT NULL,
  `current_unit_cost` float DEFAULT NULL,
  `old_unit_cost` float DEFAULT NULL,
  `old_cost` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount` double NOT NULL,
  `labor_cost` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `material_purchase`
--

INSERT INTO `material_purchase` (`id`, `purchase_id`, `material_id`, `qty`, `received`, `purchase_unit_id`, `net_unit_cost`, `new_unit_cost`, `current_unit_cost`, `old_unit_cost`, `old_cost`, `discount`, `labor_cost`, `tax_rate`, `tax`, `total`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 15000, 15000, 2, 27.5, 25.78, NULL, NULL, '0', 0, NULL, 0, 0, 412500, '2023-05-14 16:50:49', '2023-05-14 16:50:49'),
(2, 2, 4, 1000, 1000, 2, 20, 20.00, NULL, NULL, '0', 0, NULL, 0, 0, 20000, '2023-05-21 09:28:24', '2023-05-21 09:28:24'),
(3, 2, 26, 1000, 1000, 2, 20, 20.00, NULL, NULL, '0', 0, NULL, 0, 0, 20000, '2023-05-21 09:28:24', '2023-05-21 09:28:24'),
(4, 2, 11, 1000, 1000, 2, 20, 20.00, NULL, NULL, '0', 0, NULL, 0, 0, 20000, '2023-05-21 09:28:24', '2023-05-21 09:28:24'),
(5, 2, 23, 1000, 1000, 2, 20, 20.00, NULL, NULL, '0', 0, NULL, 0, 0, 20000, '2023-05-21 09:28:24', '2023-05-21 09:28:24'),
(6, 2, 12, 1000, 1000, 2, 20, 20.00, NULL, NULL, '0', 0, NULL, 0, 0, 20000, '2023-05-21 09:28:24', '2023-05-21 09:28:24'),
(7, 2, 38, 1000, 1000, 2, 20, 20.00, NULL, NULL, '0', 0, NULL, 0, 0, 20000, '2023-05-21 09:28:24', '2023-05-21 09:28:24'),
(8, 2, 29, 1000, 1000, 10, 20, 20.00, NULL, NULL, '0', 0, NULL, 0, 0, 20000, '2023-05-21 09:28:24', '2023-05-21 09:28:24'),
(9, 2, 33, 1000, 1000, 2, 20, 20.00, NULL, NULL, '0', 0, NULL, 0, 0, 20000, '2023-05-21 09:28:24', '2023-05-21 09:28:24'),
(10, 2, 41, 1000, 1000, 2, 20, 20.00, NULL, NULL, '0', 0, NULL, 0, 0, 20000, '2023-05-21 09:28:24', '2023-05-21 09:28:24'),
(11, 2, 52, 1000, 1000, 2, 20, 20.00, NULL, NULL, '0', 0, NULL, 0, 0, 20000, '2023-05-21 09:28:24', '2023-05-21 09:28:24'),
(12, 2, 42, 1000, 1000, 2, 20, 20.00, NULL, NULL, '0', 0, NULL, 0, 0, 20000, '2023-05-21 09:28:24', '2023-05-21 09:28:24'),
(13, 2, 51, 1000, 1000, 2, 20, 20.00, NULL, NULL, '0', 0, NULL, 0, 0, 20000, '2023-05-21 09:28:24', '2023-05-21 09:28:24'),
(14, 2, 53, 1000, 1000, 2, 20, 20.00, NULL, NULL, '0', 0, NULL, 0, 0, 20000, '2023-05-21 09:28:24', '2023-05-21 09:28:24'),
(15, 2, 37, 1000, 1000, 10, 20, 20.00, NULL, NULL, '0', 0, NULL, 0, 0, 20000, '2023-05-21 09:28:24', '2023-05-21 09:28:24'),
(16, 2, 43, 1000, 1000, 2, 20, 20.00, NULL, NULL, '0', 0, NULL, 0, 0, 20000, '2023-05-21 09:28:24', '2023-05-21 09:28:24'),
(17, 2, 50, 1000, 1000, 2, 20, 20.00, NULL, NULL, '0', 0, NULL, 0, 0, 20000, '2023-05-21 09:28:24', '2023-05-21 09:28:24'),
(18, 2, 75, 1000, 1000, 2, 20, 20.00, NULL, NULL, '0', 0, NULL, 0, 0, 20000, '2023-05-21 09:28:24', '2023-05-21 09:28:24'),
(19, 2, 85, 1000, 1000, 2, 20, 20.00, NULL, NULL, '0', 0, NULL, 0, 0, 20000, '2023-05-21 09:28:24', '2023-05-21 09:28:24'),
(20, 2, 90, 1000, 1000, 2, 20, 20.00, NULL, NULL, '0', 0, NULL, 0, 0, 20000, '2023-05-21 09:28:24', '2023-05-21 09:28:24'),
(21, 2, 58, 1000, 1000, 2, 20, 20.00, NULL, NULL, '0', 0, NULL, 0, 0, 20000, '2023-05-21 09:28:24', '2023-05-21 09:28:24'),
(22, 2, 59, 1000, 1000, 2, 20, 20.00, NULL, NULL, '0', 0, NULL, 0, 0, 20000, '2023-05-21 09:28:24', '2023-05-21 09:28:24'),
(23, 2, 65, 1000, 1000, 2, 20, 20.00, NULL, NULL, '0', 0, NULL, 0, 0, 20000, '2023-05-21 09:28:24', '2023-05-21 09:28:24'),
(24, 2, 66, 1000, 1000, 2, 20, 20.00, NULL, NULL, '0', 0, NULL, 0, 0, 20000, '2023-05-21 09:28:24', '2023-05-21 09:28:24'),
(25, 2, 80, 1000, 1000, 2, 20, 20.00, NULL, NULL, '0', 0, NULL, 0, 0, 20000, '2023-05-21 09:28:24', '2023-05-21 09:28:24'),
(26, 2, 55, 1000, 1000, 2, 20, 20.00, NULL, NULL, '0', 0, NULL, 0, 0, 20000, '2023-05-21 09:28:24', '2023-05-21 09:28:24'),
(27, 2, 61, 1000, 1000, 2, 20, 20.00, NULL, NULL, '0', 0, NULL, 0, 0, 20000, '2023-05-21 09:28:24', '2023-05-21 09:28:24'),
(28, 2, 64, 1000, 1000, 2, 20, 20.00, NULL, NULL, '0', 0, NULL, 0, 0, 20000, '2023-05-21 09:28:24', '2023-05-21 09:28:24'),
(29, 2, 71, 1000, 1000, 2, 20, 20.00, NULL, NULL, '0', 0, NULL, 0, 0, 20000, '2023-05-21 09:28:24', '2023-05-21 09:28:24'),
(30, 2, 89, 1000, 1000, 2, 20, 20.00, NULL, NULL, '0', 0, NULL, 0, 0, 20000, '2023-05-21 09:28:24', '2023-05-21 09:28:24'),
(31, 2, 57, 1000, 1000, 2, 20, 20.00, NULL, NULL, '0', 0, NULL, 0, 0, 20000, '2023-05-21 09:28:24', '2023-05-21 09:28:24'),
(32, 2, 84, 1000, 1000, 2, 20, 20.00, NULL, NULL, '0', 0, NULL, 0, 0, 20000, '2023-05-21 09:28:24', '2023-05-21 09:28:24'),
(33, 2, 70, 1000, 1000, 2, 20, 20.00, NULL, NULL, '0', 0, NULL, 0, 0, 20000, '2023-05-21 09:28:24', '2023-05-21 09:28:24'),
(34, 2, 63, 1000, 1000, 2, 20, 20.00, NULL, NULL, '0', 0, NULL, 0, 0, 20000, '2023-05-21 09:28:24', '2023-05-21 09:28:24'),
(35, 3, 18, 1000, 1000, 2, 20, 20.00, NULL, NULL, '0', 0, NULL, 0, 0, 20000, '2023-05-21 09:35:21', '2023-05-21 09:35:21'),
(36, 4, 7, 100, 1, 14, 23000, 23000.00, NULL, NULL, '0', 0, NULL, 0, 0, 2300000, '2023-05-24 10:20:17', '2023-05-27 04:51:09'),
(37, 5, 25, 100, 100, 2, 30, 30.00, NULL, NULL, '0', 0, NULL, 0, 0, 3000, '2023-05-27 04:30:45', '2023-05-27 04:30:45'),
(38, 6, 126, 100, 100, 2, 25, 25.00, NULL, NULL, '0', 0, NULL, 0, 0, 2500, '2023-05-27 04:32:46', '2023-05-27 04:32:46'),
(39, 7, 60, 100, 1, 2, 10, 10.00, NULL, NULL, '0', 0, NULL, 0, 0, 1000, '2023-05-28 03:30:56', '2023-05-28 03:30:56'),
(40, 8, 125, 100, 100, 2, 20, 20.00, NULL, NULL, '0', 0, NULL, 0, 0, 2000, '2023-05-30 05:57:21', '2023-05-30 05:57:21'),
(41, 9, 125, 50, 50, 2, 25, 21.67, NULL, NULL, '20', 0, NULL, 0, 0, 1250, '2023-05-30 05:59:12', '2023-05-30 05:59:12'),
(42, 10, 125, 30, 1, 2, 30, 23.06, NULL, NULL, '21.666666666667', 0, NULL, 0, 0, 900, '2023-05-30 07:28:27', '2023-05-30 07:29:05'),
(43, 11, 103, 100, 100, 2, 45, 45.00, NULL, NULL, '0', 0, NULL, 0, 0, 4500, '2023-05-31 04:03:50', '2023-05-31 04:03:50');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint UNSIGNED NOT NULL,
  `menu_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deletable` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=No, 2=Yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `menu_name`, `deletable`, `created_at`, `updated_at`) VALUES
(1, 'Admin Sidebar Menu', '1', '2021-03-26 17:49:24', '2021-07-16 19:07:49');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_resets_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2020_11_09_121424_create_roles_table', 1),
(4, '2020_11_09_121426_create_users_table', 1),
(5, '2020_11_09_121433_create_menus_table', 1),
(6, '2020_11_09_121444_create_modules_table', 1),
(7, '2020_11_09_121457_create_permissions_table', 1),
(8, '2020_11_09_121707_class_module_role_table', 1),
(9, '2020_11_09_121724_class_permission_role_table', 1),
(10, '2020_11_09_121842_create_settings_table', 1),
(11, '2020_11_11_114846_create_sessions_table', 1),
(12, '2020_11_11_115012_create_cache_table', 1),
(13, '2020_11_14_070601_create_categories_table', 1),
(14, '2020_11_15_082501_create_units_table', 1),
(15, '2020_11_16_112644_create_taxes_table', 1),
(16, '2020_11_16_112645_create_locations_table', 1),
(18, '2020_11_17_101058_create_warehouses_table', 1),
(19, '2020_11_17_101065_create_customer_groups_table', 1),
(20, '2021_11_17_102900_create_suppliers_table', 1),
(29, '2021_03_28_032515_create_materials_table', 4),
(30, '2021_03_28_033220_create_warehouse_material_table', 4),
(40, '2020_11_19_081237_create_products_table', 5),
(41, '2020_11_19_081255_create_product_material_table', 5),
(42, '2020_11_19_081265_create_warehouse_product_table', 6),
(49, '2021_08_03_153419_create_productions_table', 7),
(50, '2021_08_03_153516_create_production_products_table', 7),
(53, '2021_08_03_153525_create_production_product_materials_table', 8),
(54, '2021_03_26_063920_create_customers_table', 9),
(55, '2021_03_27_111921_create_chart_of_accounts_table', 10),
(56, '2021_03_27_111946_create_transactions_table', 10),
(58, '2020_11_18_131359_create_purchases_table', 11),
(59, '2020_11_19_054144_create_material_purchase_table', 11),
(60, '2021_02_06_081548_create_purchase_payments_table', 11),
(61, '2020_11_19_081427_create_adjustments_table', 12),
(62, '2020_11_19_081454_create_adjustment_products_table', 12),
(63, '2021_08_03_153541_create_production_coupons_table', 13),
(64, '2021_08_12_011143_create_transfers_table', 14),
(65, '2021_08_12_011156_create_transfer_products_table', 14),
(66, '2021_02_03_094656_create_received_coupons_table', 15),
(68, '2021_03_30_115349_create_sale_products_table', 16),
(70, '2021_04_01_033719_create_expenses_table', 17),
(73, '2021_03_28_045127_create_banks_table', 18),
(74, '2021_03_28_045148_create_mobile_banks_table', 19),
(75, '2021_06_19_141703_create_purchase_returns_table', 20),
(76, '2021_06_19_141731_create_purchase_return_materials_table', 20),
(77, '2021_06_19_141741_create_sale_returns_table', 20),
(78, '2021_06_19_141758_create_sale_return_products_table', 20),
(79, '2021_03_27_112248_create_daily_closings_table', 21),
(80, '2014_10_12_100000_create_password_resets_table', 21),
(82, '2020_11_16_112645_create_locations_table', 21),
(83, '2020_11_16_112652_create_asms_table', 21),
(84, '2020_11_17_101058_create_warehouses_table', 21),
(85, '2014_10_12_100000_create_password_resets_table', 21),
(89, '2022_03_22_164312_create_transfers_table', 22),
(90, '2022_03_22_164319_create_transfer_products_table', 22),
(97, '2022_03_24_103226_create_dealers_table', 23),
(98, '2022_03_24_103237_create_dealer_products_table', 23),
(114, '2022_05_18_115105_create_a_s_ms_table', 24),
(115, '2022_05_18_121323_create_a_s_m_areas_table', 24),
(117, '2021_01_28_090833_create_salesmen_areas__table', 25),
(118, '2022_04_06_120849_create_salesmen_monthly_targets_table', 25),
(119, '2022_04_06_120917_create_salesmen_product_targets_table', 25),
(120, '2022_05_16_114741_create_salesmen_product_commissions_table', 25),
(121, '2022_05_19_114702_create_a_s_m_monthly_targets_table', 26),
(122, '2021_10_05_141516_create_damages_table', 27),
(123, '2021_10_05_141527_create_damage_products_table', 27),
(124, '2020_12_27_043903_create_salesmen_table', 28),
(129, '2021_03_30_115339_create_sales_table', 29),
(130, '2022_05_29_152307_create_deliveries_table', 30),
(131, '2022_05_29_152326_create_delivery_products_table', 30),
(138, '2022_05_30_103003_create_dealer_sales_table', 31),
(139, '2022_05_30_103056_create_dealer_sale_products_table', 31),
(142, '2022_05_30_103133_create_dealer_deliveries_table', 32),
(143, '2022_05_30_103255_create_dealer_delivery_products_table', 32),
(148, '2022_08_11_054557_create_loan_categories_table', 34),
(149, '2022_08_11_112655_create_loans_table', 34),
(150, '2021_03_08_061326_create_leaves_table', 35),
(153, '2023_01_30_063823_create_employees_table', 36),
(154, '2023_02_01_055227_create_salarys_table', 36),
(155, '2023_02_02_122344_create_salary_payments_table', 36),
(156, '2023_02_02_123443_create_salary_payment_details_table', 36),
(157, '2023_02_04_052847_create_leave_categories_table', 36),
(158, '2023_02_04_053655_create_working_days_table', 36),
(159, '2023_02_04_053946_create_personal_events_table', 36),
(160, '2023_02_04_054214_create_award_categories_table', 36),
(161, '2023_02_04_054445_create_holidays_table', 37),
(162, '2023_02_05_053649_create_increments_table', 37),
(163, '2023_02_05_070216_create_deductions_table', 37),
(164, '2023_02_06_044320_create_Allowances_table', 37),
(165, '2023_02_11_165842_create_bonuses_table', 37),
(166, '2023_02_12_054148_create_branches_table', 37),
(167, '2023_02_15_045300_create_advances_table', 37),
(168, '2023_02_19_045759_create_labours_table', 37),
(169, '2023_02_19_092905_create_labour_salary_payment_table', 37),
(170, '2023_02_21_074952_create_labour_advances_table', 37),
(171, '2023_02_27_044936_create_daily_attendances_table', 37),
(172, '2023_02_27_092124_create_attendance_settings_table', 37),
(173, '2023_03_07_094509_create_employee_leave_apps_table', 37),
(174, '2023_03_07_094521_create_labour_leave_apps_table', 37),
(176, '2023_03_12_162059_create_departments_table', 38),
(177, '2023_03_12_174749_create_designations_table', 39),
(180, '2023_05_31_153825_create_monthly_target_table', 40),
(181, '2023_05_31_162813_create_yearly_target_table', 40);

-- --------------------------------------------------------

--
-- Table structure for table `mobile_banks`
--

CREATE TABLE `mobile_banks` (
  `id` bigint UNSIGNED NOT NULL,
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouse_id` bigint UNSIGNED NOT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` bigint UNSIGNED NOT NULL,
  `menu_id` bigint UNSIGNED NOT NULL,
  `type` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=divider,2=module',
  `module_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `divider_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int DEFAULT NULL,
  `parent_id` int UNSIGNED DEFAULT NULL,
  `target` enum('_self','_blank') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `menu_id`, `type`, `module_name`, `divider_title`, `icon_class`, `url`, `order`, `parent_id`, `target`, `created_at`, `updated_at`) VALUES
(1, 1, '2', 'Dashboard', NULL, 'fas fa-tachometer-alt', '/', 1, NULL, NULL, NULL, '2023-04-20 08:08:39'),
(2, 1, '1', NULL, 'Menus', NULL, NULL, 2, NULL, NULL, NULL, '2023-04-20 08:08:39'),
(3, 1, '1', NULL, 'Access Control', NULL, NULL, 20, NULL, NULL, NULL, '2023-04-20 08:08:40'),
(4, 1, '2', 'User', NULL, 'fas fa-users', 'user', 22, NULL, NULL, NULL, '2023-04-20 08:08:40'),
(5, 1, '2', 'Role', NULL, 'fas fa-user-tag', 'role', 23, NULL, NULL, NULL, '2023-04-20 08:08:40'),
(6, 1, '1', NULL, 'System', NULL, NULL, 24, NULL, NULL, NULL, '2023-04-20 08:08:40'),
(7, 1, '2', 'Setting', NULL, 'fas fa-cogs', NULL, 25, NULL, NULL, NULL, '2023-04-20 08:08:40'),
(8, 1, '2', 'Menu', NULL, 'fas fa-th-list', 'menu', 26, NULL, NULL, NULL, '2023-04-20 08:08:40'),
(9, 1, '2', 'Permission', NULL, 'fas fa-tasks', 'menu/module/permission', 27, NULL, NULL, NULL, '2023-04-20 08:08:40'),
(10, 1, '2', 'General Setting', NULL, NULL, 'setting', 1, 7, NULL, '2021-03-26 18:01:48', '2021-03-26 18:06:29'),
(11, 1, '2', 'Warehouse', NULL, NULL, 'warehouse', 2, 7, NULL, '2021-03-26 18:07:10', '2021-10-11 05:42:35'),
(12, 1, '2', 'Customer Group', NULL, NULL, 'customer-group', 3, 7, NULL, '2021-03-26 18:07:41', '2021-03-26 18:08:14'),
(13, 1, '2', 'Unit', NULL, NULL, 'unit', 4, 7, NULL, '2021-03-26 18:07:54', '2022-05-16 04:00:51'),
(14, 1, '2', 'Vat', NULL, NULL, 'vat', 5, 7, '_self', '2021-03-26 18:08:03', '2022-05-16 04:00:51'),
(15, 1, '2', 'Material', NULL, 'fas fa-toolbox', NULL, 3, NULL, NULL, '2021-07-13 04:20:56', '2023-04-20 08:08:39'),
(16, 1, '2', 'Category', NULL, NULL, 'material/category', 1, 15, '_self', '2021-07-13 04:21:32', '2021-07-13 04:42:48'),
(17, 1, '2', 'Manage Material', NULL, NULL, 'material', 2, 15, NULL, '2021-07-13 04:22:22', '2021-07-13 04:42:54'),
(18, 1, '2', 'Material Stock', NULL, NULL, 'material-stock-report', 3, 15, NULL, '2021-07-13 04:41:53', '2022-06-29 04:03:41'),
(20, 1, '2', 'Purchase', NULL, 'fas fa-cart-arrow-down', NULL, 4, NULL, NULL, '2021-07-13 04:45:27', '2023-04-20 08:08:39'),
(21, 1, '2', 'Add Purchase', NULL, NULL, 'purchase/add', 1, 20, NULL, '2021-07-13 04:46:05', '2021-07-13 04:46:35'),
(22, 1, '2', 'Manage Purchase', NULL, NULL, 'purchase', 2, 20, NULL, '2021-07-13 04:46:31', '2021-07-13 04:46:44'),
(23, 1, '2', 'Product', NULL, 'fas fa-box', NULL, 5, NULL, NULL, '2021-07-13 04:49:30', '2023-04-20 08:08:39'),
(24, 1, '2', 'Category', NULL, NULL, 'product/category', 1, 23, NULL, '2021-07-13 04:50:00', '2021-07-13 04:52:42'),
(26, 1, '2', 'Manage Product', NULL, NULL, 'product', 2, 23, NULL, '2021-07-13 04:51:10', '2022-05-25 07:18:48'),
(28, 1, '2', 'Print Barcode', NULL, NULL, 'print-barcode', 5, 23, NULL, '2021-07-13 04:53:40', '2023-04-20 08:08:10'),
(31, 1, '2', 'Product Stock', NULL, NULL, 'product-stock-report', 3, 23, NULL, '2021-07-13 04:57:37', '2022-06-29 04:05:18'),
(33, 1, '2', 'Production', NULL, 'fas fa-industry', NULL, 6, NULL, NULL, '2021-07-13 05:47:47', '2023-04-20 08:08:39'),
(34, 1, '2', 'Add Production', NULL, NULL, 'production/add', 1, 33, NULL, '2021-07-13 05:48:09', '2021-07-13 05:49:41'),
(35, 1, '2', 'Manage Production', NULL, NULL, 'production', 2, 33, NULL, '2021-07-13 05:48:34', '2021-07-13 05:49:47'),
(41, 1, '2', 'Customer', NULL, 'far fa-handshake', NULL, 10, NULL, '_self', '2021-07-13 05:58:05', '2023-04-20 08:08:39'),
(42, 1, '2', 'Manage Customer', NULL, NULL, 'customer', 1, 41, NULL, '2021-07-13 05:59:22', '2021-07-13 06:01:37'),
(43, 1, '2', 'Customer Ledger', NULL, NULL, 'customer-ledger', 2, 41, NULL, '2021-07-13 05:59:47', '2021-07-13 06:01:37'),
(47, 1, '2', 'Supplier', NULL, 'fas fa-user-tie', NULL, 11, NULL, NULL, '2021-07-13 06:02:42', '2023-04-20 08:08:39'),
(48, 1, '2', 'Manage Supplier', NULL, NULL, 'supplier', 1, 47, NULL, '2021-07-13 06:03:11', '2021-07-13 06:04:20'),
(49, 1, '2', 'Supplier Ledger', NULL, NULL, 'supplier-ledger', 2, 47, NULL, '2021-07-13 06:03:44', '2021-07-13 06:04:37'),
(50, 1, '2', 'Supplier Advance', NULL, NULL, 'supplier-advance', 3, 47, NULL, '2021-07-13 06:04:13', '2021-07-13 06:04:37'),
(51, 1, '2', 'Stock Return', NULL, 'fas fa-undo-alt', NULL, 12, NULL, NULL, '2021-07-13 06:14:46', '2023-04-20 08:08:39'),
(52, 1, '2', 'Return', NULL, NULL, 'return', 1, 51, '_self', '2021-07-13 06:15:33', '2021-09-23 04:37:04'),
(53, 1, '2', 'Purchase Return', NULL, NULL, 'purchase-return', 2, 51, NULL, '2021-07-13 06:16:14', '2021-09-23 04:37:15'),
(57, 1, '2', 'Location', NULL, 'fas fa-map-marker-alt', NULL, 19, NULL, NULL, '2021-07-13 06:56:46', '2023-04-20 08:08:40'),
(58, 1, '2', 'Manage District', NULL, NULL, 'district', 1, 57, '_self', '2021-07-13 06:57:29', '2021-07-13 06:58:53'),
(59, 1, '2', 'Manage Upazila', NULL, NULL, 'upazila', 2, 57, NULL, '2021-07-13 06:57:58', '2022-06-09 04:48:08'),
(61, 1, '2', 'Manage Area', NULL, NULL, 'area', 3, 57, NULL, '2021-07-13 06:58:48', '2022-06-09 04:48:08'),
(62, 1, '2', 'Bank', NULL, 'fas fa-university', NULL, 16, NULL, NULL, '2021-07-13 08:16:58', '2023-04-20 08:08:40'),
(63, 1, '2', 'Manage Bank', NULL, NULL, 'bank', 1, 62, NULL, '2021-07-13 08:17:23', '2021-07-13 08:18:19'),
(64, 1, '2', 'Bank Transaction', NULL, NULL, 'bank-transaction', 2, 62, NULL, '2021-07-13 08:17:50', '2021-07-13 08:18:23'),
(65, 1, '2', 'Bank Ledger', NULL, NULL, 'bank-ledger', 3, 62, NULL, '2021-07-13 08:18:15', '2021-07-13 08:18:27'),
(66, 1, '2', 'Mobile Bank', NULL, 'fas fa-mobile-alt', NULL, 17, NULL, NULL, '2021-07-13 08:19:07', '2023-04-20 08:08:40'),
(67, 1, '2', 'Manage Mobile Bank', NULL, NULL, 'mobile-bank', 1, 66, NULL, '2021-07-13 08:19:31', '2021-07-13 08:20:41'),
(68, 1, '2', 'Mobile Bank Transaction', NULL, NULL, 'mobile-bank-transaction', 2, 66, NULL, '2021-07-13 08:20:10', '2021-09-06 04:19:26'),
(69, 1, '2', 'Mobile Bank Ledger', NULL, NULL, 'mobile-bank-ledger', 3, 66, NULL, '2021-07-13 08:20:37', '2021-09-06 04:19:54'),
(70, 1, '2', 'Expense', NULL, 'fas fa-money-check-alt', NULL, 15, NULL, NULL, '2021-07-13 09:00:55', '2023-04-20 08:08:40'),
(71, 1, '2', 'Manage Expense Item', NULL, NULL, 'expense-item', 1, 70, NULL, '2021-07-13 09:01:28', '2021-07-13 09:02:23'),
(72, 1, '2', 'Manage Expense', NULL, NULL, 'expense', 2, 70, NULL, '2021-07-13 09:01:50', '2021-07-13 09:02:31'),
(73, 1, '2', 'Expense Statement', NULL, NULL, 'expense-statement', 3, 70, NULL, '2021-07-13 09:02:19', '2021-07-13 09:02:36'),
(74, 1, '2', 'Accounts', NULL, 'far fa-money-bill-alt', NULL, 13, NULL, NULL, '2021-03-26 18:52:27', '2023-04-20 08:08:39'),
(75, 1, '2', 'Chart of Account', NULL, NULL, 'coa', 1, 74, NULL, '2021-03-26 18:52:53', '2021-05-11 06:10:34'),
(76, 1, '2', 'Opening Balance', NULL, NULL, 'opening-balance', 2, 74, NULL, '2021-03-26 18:53:20', '2021-05-11 06:10:34'),
(77, 1, '2', 'Manage Supplier Payment', NULL, NULL, 'supplier-payment', 4, 74, NULL, '2021-03-26 18:53:43', '2022-05-30 11:20:20'),
(78, 1, '2', 'Manage Customer Receive', NULL, NULL, 'customer-receive', 5, 74, NULL, '2021-03-26 18:54:01', '2022-05-30 11:20:20'),
(83, 1, '2', 'Manage Contra Voucher', NULL, NULL, 'contra-voucher', 9, 74, NULL, '2021-07-03 05:53:42', '2023-04-20 08:08:40'),
(85, 1, '2', 'Manage Journal Voucher', NULL, NULL, 'journal-voucher', 10, 74, NULL, '2021-07-03 05:54:24', '2023-04-20 08:08:40'),
(86, 1, '2', 'Voucher Approval', NULL, NULL, 'voucher-approval', 11, 74, NULL, '2021-03-26 18:56:21', '2023-04-20 08:08:40'),
(92, 1, '2', 'General Ledger', NULL, NULL, 'general-ledger', 4, 179, NULL, '2021-03-26 19:00:23', '2023-05-01 08:06:31'),
(96, 1, '2', 'HRM', NULL, 'fas fa-users', NULL, 14, NULL, NULL, '2021-04-03 10:54:02', '2023-04-20 08:08:40'),
(126, 1, '2', 'Production Finish Goods', NULL, NULL, 'finish-goods', 3, 33, '_self', '2021-08-12 12:56:32', '2021-10-17 09:51:28'),
(179, 1, '2', 'Report', NULL, 'fas fa-file-signature', NULL, 18, NULL, NULL, '2021-09-06 04:06:13', '2023-04-20 08:08:40'),
(183, 1, '2', 'Sales Report', NULL, NULL, 'sales-report', 6, 179, '_self', '2021-09-06 04:07:55', '2023-05-01 08:06:31'),
(196, 1, '2', 'Material Stock Alert Report', NULL, NULL, 'material-stock-alert-report', 7, 179, '_self', '2021-09-06 04:14:40', '2023-05-01 08:06:31'),
(203, 1, '2', 'Manage Debit Voucher', NULL, NULL, 'debit-voucher', 7, 74, '_self', '2021-09-07 09:55:31', '2023-04-20 08:08:39'),
(204, 1, '2', 'Manage Credit Voucher', NULL, NULL, 'credit-voucher', 8, 74, '_self', '2021-09-07 09:56:13', '2023-04-20 08:08:39'),
(234, 1, '2', 'Sale', NULL, 'fab fa-opencart', NULL, 7, NULL, '_self', '2021-09-22 08:55:19', '2023-04-20 08:08:39'),
(236, 1, '2', 'Manage Sale', NULL, NULL, 'sale', 1, 234, '_self', '2021-09-22 09:18:29', '2022-05-25 07:18:48'),
(237, 1, '2', 'Sale Return', NULL, NULL, 'sale-return', 3, 51, '_self', '2021-09-23 04:37:37', '2021-09-23 04:37:49'),
(238, 1, '2', 'Product Stock Alert Report', NULL, NULL, 'product-stock-alert-report', 8, 179, '_self', '2021-09-23 06:59:01', '2023-05-01 08:06:31'),
(241, 1, '2', 'Manage Salesmen Payment', NULL, NULL, 'salesmen-payment', 3, 74, NULL, '2021-10-03 09:56:32', '2022-05-31 05:38:25'),
(247, 1, '2', 'Material Stock Ledger', NULL, NULL, 'material-stock-ledger', 4, 15, NULL, '2021-10-07 06:54:47', '2022-11-23 07:08:26'),
(250, 1, '2', 'Transfer Inventory', NULL, 'fas fa-exchange-alt', NULL, 9, NULL, NULL, '2022-03-23 06:34:04', '2023-04-20 08:08:39'),
(251, 1, '2', 'Transfer Inventory Form', NULL, NULL, 'transfer-inventory/create', 1, 250, '_self', '2022-03-23 06:34:34', '2022-03-23 06:35:06'),
(252, 1, '2', 'Manage Transfer Inventory', NULL, NULL, 'transfer-inventory', 2, 250, '_self', '2022-03-23 06:35:00', '2022-03-23 06:35:10'),
(253, 1, '2', 'Dealer', NULL, 'fas fa-user', NULL, 21, NULL, NULL, '2022-04-04 03:46:46', '2023-04-20 08:08:40'),
(254, 1, '2', 'Add Dealer', NULL, NULL, 'dealer/add', 1, 253, '_self', '2022-04-04 03:47:09', '2022-04-04 03:47:30'),
(255, 1, '2', 'Manage Dealer', NULL, NULL, 'dealer', 2, 253, '_self', '2022-04-04 03:47:26', '2022-04-04 03:47:35'),
(256, 1, '2', 'Dealer Ledger', NULL, NULL, 'dealer-ledger', 3, 253, '_self', '2022-04-04 03:48:44', '2022-04-04 03:49:23'),
(257, 1, '2', 'Dealer Advance', NULL, NULL, 'dealer-advance', 6, 253, '_self', '2022-04-04 03:49:07', '2023-06-04 06:30:16'),
(276, 1, '2', 'Attendance', NULL, NULL, NULL, 4, 96, '_self', '2022-11-23 06:56:49', '2023-03-12 09:06:53'),
(277, 1, '2', 'Manage Attendance', NULL, NULL, 'attendance', 1, 276, '_self', '2022-11-23 06:57:11', '2022-11-23 06:57:15'),
(278, 1, '2', 'Attendance Report', NULL, NULL, 'attendance-report', 2, 276, '_self', '2022-11-23 06:57:45', '2022-11-23 06:57:50'),
(279, 1, '2', 'Holiday', NULL, NULL, NULL, 5, 96, '_self', '2022-11-23 06:58:40', '2023-03-12 09:06:53'),
(280, 1, '2', 'Weekly Holiday', NULL, NULL, 'weekly-holiday', 1, 279, '_self', '2022-11-23 06:59:14', '2022-11-23 06:59:42'),
(281, 1, '2', 'Holiday', NULL, NULL, 'holiday', 2, 279, '_self', '2022-11-23 06:59:36', '2022-11-23 06:59:43'),
(285, 1, '2', 'HR', NULL, NULL, 'hr', 1, 96, NULL, '2023-03-12 05:07:16', '2023-03-12 05:09:35'),
(286, 1, '2', 'Manage Employee', NULL, NULL, 'manage-employee', 1, 285, '_self', '2023-03-12 05:08:01', '2023-03-12 05:09:01'),
(287, 1, '2', 'Manage Labour', NULL, NULL, 'manage-labour', 2, 285, '_self', '2023-03-12 05:08:53', '2023-03-12 05:09:15'),
(288, 1, '2', 'Configuration', NULL, 'fas fa-cog', NULL, 6, 96, '_self', '2023-03-12 05:18:43', '2023-03-12 09:06:53'),
(289, 1, '2', 'Manage Department', NULL, NULL, 'manage-departments', 1, 288, '_self', '2023-03-12 05:19:18', '2023-03-12 07:02:10'),
(290, 1, '2', 'Manage Designation', NULL, NULL, 'manage-designation', 2, 288, '_self', '2023-03-12 05:19:47', '2023-03-12 05:24:19'),
(291, 1, '2', 'Manage Branch', NULL, NULL, 'manage-branch', 3, 288, '_self', '2023-03-12 05:20:15', '2023-03-12 05:24:22'),
(292, 1, '2', 'Labour Payroll', NULL, 'fas fa-dollar-sign', NULL, 3, 96, '_self', '2023-03-12 08:35:12', '2023-03-12 09:06:53'),
(293, 1, '2', 'Manage Salary Payment', NULL, NULL, 'manage-labour-salary-payment', 1, 292, '_self', '2023-03-12 08:35:37', '2023-03-12 08:40:15'),
(294, 1, '2', 'Manage Bonus', NULL, NULL, 'manage-labour-bonus', 2, 292, '_self', '2023-03-12 08:36:16', '2023-03-12 08:40:32'),
(295, 1, '2', 'Manage Allowances', NULL, NULL, 'manage-labour-allowance', 3, 292, '_self', '2023-03-12 08:37:08', '2023-03-12 08:40:32'),
(296, 1, '2', 'Manage Deductions', NULL, NULL, 'manage-labour-deductions', 4, 292, '_self', '2023-03-12 08:39:29', '2023-03-12 08:40:37'),
(297, 1, '2', 'Labour Salary Advance', NULL, NULL, 'labour-salary-advance', 5, 292, '_self', '2023-03-12 08:40:01', '2023-03-12 08:40:47'),
(298, 1, '2', 'Employee Payroll', NULL, 'fas fa-dollar-sign', NULL, 2, 96, NULL, '2023-03-12 08:45:47', '2023-03-12 09:06:53'),
(299, 1, '2', 'Manage Salary', NULL, NULL, 'manage-salary', 1, 298, '_self', '2023-03-12 08:47:00', '2023-03-12 08:50:39'),
(300, 1, '2', 'Manage Salary Payment', NULL, NULL, 'manage-salary-payment', 2, 298, '_self', '2023-03-12 08:47:29', '2023-03-12 08:50:55'),
(301, 1, '2', 'Manage Increment', NULL, NULL, 'manage-increment', 3, 298, '_self', '2023-03-12 08:47:59', '2023-03-12 08:51:11'),
(302, 1, '2', 'Manage Bonuses', NULL, NULL, 'manage-bonuses', 4, 298, '_self', '2023-03-12 08:49:31', '2023-03-12 08:51:20'),
(303, 1, '2', 'Manage Allowances', NULL, NULL, 'manage-allowances', 5, 298, '_self', '2023-03-12 08:51:58', '2023-03-12 08:53:51'),
(304, 1, '2', 'Manage Deductions', NULL, NULL, 'manage-deductions', 6, 298, '_self', '2023-03-12 08:52:27', '2023-03-12 08:53:51'),
(305, 1, '2', 'Manage Salary Advance', NULL, NULL, 'manage-salary-advance', 7, 298, '_self', '2023-03-12 08:52:58', '2023-03-12 08:53:51'),
(306, 1, '2', 'Provident Funds', NULL, NULL, 'provident-funds', 8, 298, '_self', '2023-03-12 08:53:29', '2023-03-12 08:53:57'),
(307, 1, '2', 'Product Ledger', NULL, NULL, 'product-ledger', 4, 23, '_self', '2023-03-29 04:37:58', '2023-03-29 04:38:08'),
(308, 1, '2', 'Dealer Sale', NULL, 'fab fa-opencart', NULL, 8, NULL, NULL, '2023-03-29 06:14:13', '2023-04-20 08:08:39'),
(309, 1, '2', 'Manage Dealer Sale', NULL, NULL, 'dealer-sale', 1, 308, '_self', '2023-03-29 06:14:44', '2023-03-29 06:14:50'),
(310, 1, '2', 'Manage Dealer Receive', NULL, NULL, 'dealer-receive', 6, 74, '_self', '2023-04-20 08:08:03', '2023-04-20 08:08:39'),
(311, 1, '2', 'Due Report', NULL, NULL, 'due-report', 5, 179, '_self', '2023-04-29 06:19:34', '2023-05-01 08:06:31'),
(312, 1, '2', 'Purchase Report', NULL, NULL, 'purchase-report', 3, 179, '_self', '2023-04-30 10:32:18', '2023-05-01 08:06:31'),
(313, 1, '2', 'Dealer Report', NULL, NULL, '/dealer-report', 2, 179, '_self', '2023-05-01 03:25:46', '2023-05-01 08:06:31'),
(314, 1, '2', 'Income Statement Report', NULL, NULL, 'income-statement-report', 1, 179, '_self', '2023-05-01 08:06:15', '2023-05-01 08:06:31'),
(315, 1, '2', 'Monthly Commission', NULL, NULL, NULL, 4, 253, NULL, '2023-06-03 03:44:31', '2023-06-03 03:46:28'),
(316, 1, '2', 'Manage Monthly Commission', NULL, NULL, 'dealer-monthly-commission', 1, 315, '_self', '2023-06-03 03:45:51', '2023-06-03 03:46:11'),
(317, 1, '2', 'Yearly Commission', NULL, NULL, NULL, 5, 253, NULL, '2023-06-04 06:30:03', '2023-06-04 06:30:16'),
(318, 1, '2', 'Manage Yearly Commission', NULL, NULL, 'dealer-yearly-commission', 1, 317, '_self', '2023-06-04 06:30:45', '2023-06-04 06:30:57');

-- --------------------------------------------------------

--
-- Table structure for table `module_role`
--

CREATE TABLE `module_role` (
  `id` bigint UNSIGNED NOT NULL,
  `module_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `module_role`
--

INSERT INTO `module_role` (`id`, `module_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(2, 2, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(3, 15, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(4, 16, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(5, 17, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(6, 18, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(7, 23, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(8, 24, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(11, 26, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(12, 28, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(15, 31, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(16, 33, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(17, 34, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(18, 35, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(19, 126, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(20, 47, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(21, 48, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(22, 49, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(23, 50, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(24, 57, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(25, 58, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(26, 59, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(28, 61, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(29, 3, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(30, 4, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(31, 5, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(34, 6, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(35, 7, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(36, 10, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(37, 11, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(38, 12, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(39, 13, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(40, 14, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(41, 20, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(42, 21, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(43, 22, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(44, 41, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(45, 42, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(46, 43, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(51, 51, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(52, 52, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(53, 53, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(55, 74, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(56, 75, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(57, 76, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(58, 77, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(59, 78, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(63, 203, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(65, 204, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(67, 83, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(69, 85, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(70, 86, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(76, 92, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(91, 96, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(112, 70, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(113, 71, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(114, 72, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(115, 73, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(116, 62, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(117, 63, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(118, 64, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(119, 65, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(120, 66, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(121, 67, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(122, 68, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(123, 69, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(124, 179, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(129, 183, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(146, 196, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(149, 234, 2, '2021-09-23 06:57:20', '2021-09-23 06:57:20'),
(151, 236, 2, '2021-09-23 06:57:20', '2021-09-23 06:57:20'),
(152, 237, 2, '2021-09-23 06:57:41', '2021-09-23 06:57:41'),
(153, 247, 2, '2021-10-13 10:19:18', '2021-10-13 10:19:18'),
(159, 241, 2, '2021-10-13 10:19:18', '2021-10-13 10:19:18'),
(161, 238, 2, '2021-10-13 10:19:18', '2021-10-13 10:19:18'),
(1451, 1, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1452, 2, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1453, 15, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1456, 18, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1457, 247, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1461, 23, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1468, 31, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1470, 33, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1472, 35, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1473, 126, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1481, 41, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1483, 43, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1487, 47, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1489, 49, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1491, 51, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1492, 52, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1493, 53, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1494, 237, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1517, 92, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1553, 70, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1556, 73, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1557, 62, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1558, 63, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1559, 64, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1560, 65, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1565, 179, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1569, 183, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1582, 196, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1583, 238, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1589, 3, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1603, 1, 40, '2022-03-03 09:24:10', '2022-03-03 09:24:10'),
(1604, 2, 40, '2022-03-03 09:24:10', '2022-03-03 09:24:10'),
(1605, 23, 40, '2022-03-03 09:24:10', '2022-03-03 09:24:10'),
(1606, 24, 40, '2022-03-03 09:24:10', '2022-03-03 09:24:10'),
(1608, 26, 40, '2022-03-03 09:24:10', '2022-03-03 09:24:10'),
(1609, 28, 40, '2022-03-03 09:24:10', '2022-03-03 09:24:10'),
(1612, 31, 40, '2022-03-03 09:24:10', '2022-03-03 09:24:10'),
(1614, 33, 40, '2022-03-03 09:24:10', '2022-03-03 09:24:10'),
(1615, 34, 40, '2022-03-03 09:24:10', '2022-03-03 09:24:10'),
(1616, 35, 40, '2022-03-03 09:24:10', '2022-03-03 09:24:10'),
(1617, 126, 40, '2022-03-03 09:24:10', '2022-03-03 09:24:10'),
(1618, 1, 41, '2022-03-03 09:25:13', '2022-03-03 09:25:13'),
(1619, 2, 41, '2022-03-03 09:25:13', '2022-03-03 09:25:13'),
(1620, 1, 42, '2022-03-03 09:26:02', '2022-03-03 09:26:02'),
(1621, 2, 42, '2022-03-03 09:26:02', '2022-03-03 09:26:02'),
(1622, 15, 42, '2022-03-03 09:26:02', '2022-03-03 09:26:02'),
(1623, 16, 42, '2022-03-03 09:26:02', '2022-03-03 09:26:02'),
(1624, 17, 42, '2022-03-03 09:26:02', '2022-03-03 09:26:02'),
(1625, 18, 42, '2022-03-03 09:26:02', '2022-03-03 09:26:02'),
(1626, 247, 42, '2022-03-03 09:26:02', '2022-03-03 09:26:02'),
(1627, 20, 42, '2022-03-03 09:26:02', '2022-03-03 09:26:02'),
(1628, 21, 42, '2022-03-03 09:26:02', '2022-03-03 09:26:02'),
(1629, 22, 42, '2022-03-03 09:26:02', '2022-03-03 09:26:02'),
(1708, 250, 40, '2022-03-23 10:06:05', '2022-03-23 10:06:05'),
(1709, 252, 40, '2022-03-23 10:06:05', '2022-03-23 10:06:05'),
(1712, 250, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(1713, 251, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(1714, 252, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(1724, 253, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(1725, 254, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(1726, 255, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(1727, 256, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(1728, 257, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(1729, 1, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(1730, 2, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(1731, 74, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(1732, 75, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(1733, 76, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(1734, 241, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(1735, 77, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(1736, 78, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(1737, 203, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(1738, 204, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(1739, 83, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(1740, 85, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(1741, 86, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(1742, 87, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(1743, 88, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(1744, 89, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(1745, 90, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(1746, 91, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(1747, 92, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(1748, 93, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(1749, 94, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(1750, 95, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(1751, 233, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(1755, 96, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(1756, 270, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(1757, 271, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(1758, 272, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(1759, 273, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(1760, 274, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(1761, 275, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(1762, 276, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(1763, 277, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(1764, 278, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(1765, 279, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(1766, 280, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(1767, 281, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(1768, 282, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(1769, 283, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(1770, 284, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(1771, 265, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(1772, 266, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(1773, 70, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(1774, 71, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(1775, 72, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(1776, 73, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(1777, 62, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(1778, 63, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(1779, 64, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(1780, 65, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(1781, 66, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(1782, 67, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(1783, 68, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(1784, 69, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(1785, 179, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(1786, 180, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(1787, 181, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(1788, 182, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(1789, 183, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(1790, 185, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(1791, 186, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(1792, 187, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(1793, 239, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(1794, 193, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(1795, 196, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(1796, 238, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(1797, 57, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(1798, 58, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(1799, 59, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(1800, 61, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(1810, 276, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(1811, 277, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(1812, 278, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(1813, 279, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(1814, 280, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(1815, 281, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(1822, 234, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(1823, 236, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(1824, 263, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(1825, 264, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(1826, 250, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(1827, 251, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(1828, 252, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(1829, 244, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(1830, 245, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(1831, 246, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(1832, 41, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(1833, 42, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(1834, 43, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(1835, 44, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(1836, 45, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(1837, 46, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(1842, 51, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(1843, 52, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(1844, 53, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(1845, 237, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(1846, 3, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(1847, 55, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(1848, 261, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(1849, 262, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(1850, 243, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(1851, 56, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(1852, 258, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(1853, 260, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(1854, 259, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(1855, 242, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(1856, 253, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(1857, 254, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(1858, 255, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(1859, 256, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(1860, 257, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(1861, 23, 45, '2022-11-28 11:04:01', '2022-11-28 11:04:01'),
(1862, 26, 45, '2022-11-28 11:04:01', '2022-11-28 11:04:01'),
(1863, 31, 45, '2022-11-28 11:04:01', '2022-11-28 11:04:01'),
(1864, 249, 45, '2022-11-28 11:04:01', '2022-11-28 11:04:01'),
(1865, 28, 45, '2022-11-28 11:04:01', '2022-11-28 11:04:01'),
(1887, 250, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1888, 251, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1889, 252, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1961, 234, 46, '2022-11-30 14:17:17', '2022-11-30 14:17:17'),
(1962, 236, 46, '2022-11-30 14:17:17', '2022-11-30 14:17:17'),
(1963, 263, 46, '2022-11-30 14:17:17', '2022-11-30 14:17:17'),
(1964, 264, 46, '2022-11-30 14:17:17', '2022-11-30 14:17:17'),
(1965, 41, 46, '2022-11-30 14:17:17', '2022-11-30 14:17:17'),
(1966, 42, 46, '2022-11-30 14:17:17', '2022-11-30 14:17:17'),
(1967, 57, 46, '2022-11-30 14:30:40', '2022-11-30 14:30:40'),
(1968, 61, 46, '2022-11-30 14:30:40', '2022-11-30 14:30:40'),
(1969, 243, 46, '2022-11-30 14:38:59', '2022-11-30 14:38:59'),
(1970, 56, 46, '2022-11-30 14:38:59', '2022-11-30 14:38:59'),
(1971, 258, 46, '2022-11-30 14:38:59', '2022-11-30 14:38:59'),
(1972, 259, 46, '2022-11-30 14:38:59', '2022-11-30 14:38:59'),
(1973, 1, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(1974, 2, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(1975, 234, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(1976, 236, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(1977, 263, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(1978, 264, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(1979, 250, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(1980, 251, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(1981, 252, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(1982, 244, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(1983, 245, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(1984, 246, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(1985, 41, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(1986, 42, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(1987, 43, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(1988, 44, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(1989, 45, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(1990, 46, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(1991, 51, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(1992, 52, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(1993, 53, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(1994, 237, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(1995, 70, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(1996, 71, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(1997, 72, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(1998, 73, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(1999, 179, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(2000, 180, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(2001, 181, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(2002, 182, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(2003, 183, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(2004, 185, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(2005, 186, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(2006, 187, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(2007, 239, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(2008, 193, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(2009, 196, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(2010, 238, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(2011, 57, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(2012, 58, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(2013, 59, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(2014, 61, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(2015, 3, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(2016, 55, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(2017, 261, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(2018, 262, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(2019, 243, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(2020, 56, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(2021, 258, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(2022, 260, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(2023, 259, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(2024, 242, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(2025, 253, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(2026, 254, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(2027, 255, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(2028, 256, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(2029, 257, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(2030, 23, 47, '2022-12-12 12:18:23', '2022-12-12 12:18:23'),
(2031, 31, 47, '2022-12-12 12:18:23', '2022-12-12 12:18:23'),
(2032, 249, 47, '2022-12-12 12:18:23', '2022-12-12 12:18:23'),
(2033, 28, 47, '2022-12-12 12:18:23', '2022-12-12 12:18:23'),
(2034, 15, 40, '2023-05-10 16:34:04', '2023-05-10 16:34:04'),
(2035, 16, 40, '2023-05-10 16:34:04', '2023-05-10 16:34:04'),
(2036, 17, 40, '2023-05-10 16:34:04', '2023-05-10 16:34:04'),
(2037, 18, 40, '2023-05-10 16:34:04', '2023-05-10 16:34:04'),
(2038, 247, 40, '2023-05-10 16:34:04', '2023-05-10 16:34:04'),
(2039, 20, 40, '2023-05-10 16:34:04', '2023-05-10 16:34:04'),
(2040, 21, 40, '2023-05-10 16:34:04', '2023-05-10 16:34:04'),
(2041, 22, 40, '2023-05-10 16:34:04', '2023-05-10 16:34:04'),
(2042, 307, 40, '2023-05-10 16:34:04', '2023-05-10 16:34:04'),
(2043, 2, 48, '2023-05-14 16:22:18', '2023-05-14 16:22:18'),
(2049, 23, 48, '2023-05-14 16:22:18', '2023-05-14 16:22:18'),
(2050, 24, 48, '2023-05-14 16:22:18', '2023-05-14 16:22:18'),
(2051, 26, 48, '2023-05-14 16:22:18', '2023-05-14 16:22:18'),
(2059, 20, 49, '2023-05-16 19:29:17', '2023-05-16 19:29:17'),
(2060, 21, 49, '2023-05-16 19:29:17', '2023-05-16 19:29:17'),
(2061, 22, 49, '2023-05-16 19:29:17', '2023-05-16 19:29:17'),
(2062, 234, 50, '2023-05-16 19:33:23', '2023-05-16 19:33:23'),
(2063, 236, 50, '2023-05-16 19:33:23', '2023-05-16 19:33:23'),
(2064, 308, 50, '2023-05-16 19:33:23', '2023-05-16 19:33:23'),
(2065, 309, 50, '2023-05-16 19:33:23', '2023-05-16 19:33:23'),
(2066, 307, 39, '2023-05-16 19:45:28', '2023-05-16 19:45:28'),
(2067, 250, 39, '2023-05-16 19:45:28', '2023-05-16 19:45:28'),
(2068, 251, 39, '2023-05-16 19:45:28', '2023-05-16 19:45:28'),
(2069, 314, 39, '2023-05-16 19:45:28', '2023-05-16 19:45:28'),
(2070, 313, 39, '2023-05-16 19:45:28', '2023-05-16 19:45:28'),
(2071, 312, 39, '2023-05-16 19:45:28', '2023-05-16 19:45:28'),
(2072, 311, 39, '2023-05-16 19:45:28', '2023-05-16 19:45:28'),
(2073, 253, 39, '2023-05-16 19:45:28', '2023-05-16 19:45:28'),
(2074, 256, 39, '2023-05-16 19:45:28', '2023-05-16 19:45:28'),
(2075, 257, 39, '2023-05-16 19:45:28', '2023-05-16 19:45:28'),
(2076, 31, 48, '2023-05-17 19:31:14', '2023-05-17 19:31:14'),
(2079, 234, 39, '2023-05-31 04:56:57', '2023-05-31 04:56:57'),
(2080, 236, 39, '2023-05-31 04:56:57', '2023-05-31 04:56:57'),
(2081, 308, 39, '2023-05-31 04:56:57', '2023-05-31 04:56:57'),
(2082, 309, 39, '2023-05-31 04:56:57', '2023-05-31 04:56:57'),
(2083, 24, 39, '2023-05-31 04:58:58', '2023-05-31 04:58:58'),
(2084, 26, 39, '2023-05-31 04:58:58', '2023-05-31 04:58:58'),
(2085, 28, 39, '2023-05-31 04:58:58', '2023-05-31 04:58:58'),
(2086, 1, 51, '2023-05-31 05:04:18', '2023-05-31 05:04:18'),
(2087, 234, 51, '2023-05-31 05:04:18', '2023-05-31 05:04:18'),
(2088, 236, 51, '2023-05-31 05:04:18', '2023-05-31 05:04:18'),
(2089, 308, 51, '2023-05-31 05:04:18', '2023-05-31 05:04:18'),
(2090, 309, 51, '2023-05-31 05:04:18', '2023-05-31 05:04:18'),
(2091, 253, 51, '2023-05-31 05:07:09', '2023-05-31 05:07:09'),
(2092, 254, 51, '2023-05-31 05:07:09', '2023-05-31 05:07:09'),
(2093, 255, 51, '2023-05-31 05:07:09', '2023-05-31 05:07:09'),
(2094, 256, 51, '2023-05-31 05:07:09', '2023-05-31 05:07:09'),
(2095, 257, 51, '2023-05-31 05:07:09', '2023-05-31 05:07:09');

-- --------------------------------------------------------

--
-- Table structure for table `monthly_target`
--

CREATE TABLE `monthly_target` (
  `id` bigint UNSIGNED NOT NULL,
  `dealer_id` bigint NOT NULL,
  `qty` int NOT NULL,
  `commission_amount` double(10,2) NOT NULL,
  `paid_amount` double(10,2) NOT NULL,
  `due_amount` double(10,2) NOT NULL,
  `is_paid` tinyint NOT NULL DEFAULT '0' COMMENT '0=not paid, 1=paid',
  `year` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `month` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `acheived_qty` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `monthly_target`
--

INSERT INTO `monthly_target` (`id`, `dealer_id`, `qty`, `commission_amount`, `paid_amount`, `due_amount`, `is_paid`, `year`, `month`, `status`, `created_by`, `modified_by`, `created_at`, `updated_at`, `acheived_qty`) VALUES
(1, 1, 20, 200.00, 0.00, 0.00, 0, '2023', '3', '1', NULL, 'Super Admin', '2023-06-03 08:45:31', '2023-06-04 05:43:32', 0),
(2, 0, 0, 0.00, 0.00, 0.00, 0, '', '', '1', NULL, NULL, '2023-06-03 08:48:44', '2023-06-03 08:48:44', 0),
(3, 1, 100, 20.00, 0.00, 0.00, 0, '2023', '1', '1', 'Super Admin', 'Super Admin', NULL, NULL, 0),
(4, 1, 100, 10.00, 0.00, 0.00, 0, '2023', '1', '1', 'Super Admin', 'Super Admin', '2023-06-03 08:52:13', NULL, 0),
(5, 1, 20, 200.00, 0.00, 0.00, 0, '2023', '5', '1', 'Super Admin', 'Super Admin', '2023-06-03 10:07:37', '2023-06-04 05:44:28', 0);

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
  `id` bigint UNSIGNED NOT NULL,
  `module_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `module_id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 1, 'Dashboard Access', 'dashboard-access', '2021-03-26 17:49:24', NULL),
(2, 4, 'User Access', 'user-access', '2021-03-26 17:49:24', NULL),
(3, 4, 'User Add', 'user-add', '2021-03-26 17:49:24', NULL),
(4, 4, 'User Edit', 'user-edit', '2021-03-26 17:49:24', NULL),
(5, 4, 'User View', 'user-view', '2021-03-26 17:49:24', NULL),
(6, 4, 'User Delete', 'user-delete', '2021-03-26 17:49:24', NULL),
(7, 4, 'User Bulk Delete', 'user-bulk-delete', '2021-03-26 17:49:24', NULL),
(8, 4, 'User Report', 'user-report', '2021-03-26 17:49:24', NULL),
(9, 5, 'Role Access', 'role-access', '2021-03-26 17:49:24', NULL),
(10, 5, 'Role Add', 'role-add', '2021-03-26 17:49:24', NULL),
(11, 5, 'Role Edit', 'role-edit', '2021-03-26 17:49:24', NULL),
(12, 5, 'Role View', 'role-view', '2021-03-26 17:49:24', NULL),
(13, 5, 'Role Delete', 'role-delete', '2021-03-26 17:49:24', NULL),
(14, 5, 'Role Bulk Delete', 'role-bulk-delete', '2021-03-26 17:49:24', NULL),
(15, 5, 'Role Report', 'role-report', '2021-03-26 17:49:24', NULL),
(17, 8, 'Menu Access', 'menu-access', '2021-03-26 17:49:24', NULL),
(18, 8, 'Menu Add', 'menu-add', '2021-03-26 17:49:24', NULL),
(19, 8, 'Menu Edit', 'menu-edit', '2021-03-26 17:49:24', NULL),
(20, 8, 'Menu Delete', 'menu-delete', '2021-03-26 17:49:24', NULL),
(21, 8, 'Menu Bulk Delete', 'menu-bulk-delete', '2021-03-26 17:49:24', NULL),
(22, 8, 'Menu Report', 'menu-report', '2021-03-26 17:49:24', NULL),
(23, 8, 'Menu Builder Access', 'menu-builder-access', '2021-03-26 17:49:24', NULL),
(24, 8, 'Menu Module Add', 'menu-module-add', '2021-03-26 17:49:24', NULL),
(25, 8, 'Menu Module Edit', 'menu-module-edit', '2021-03-26 17:49:24', NULL),
(26, 8, 'Menu Module Delete', 'menu-module-delete', '2021-03-26 17:49:24', NULL),
(27, 9, 'Permission Access', 'permission-access', '2021-03-26 17:49:24', NULL),
(28, 9, 'Permission Add', 'permission-add', '2021-03-26 17:49:24', NULL),
(29, 9, 'Permission Edit', 'permission-edit', '2021-03-26 17:49:24', NULL),
(30, 9, 'Permission Delete', 'permission-delete', '2021-03-26 17:49:24', NULL),
(31, 9, 'Permission Bulk Delete', 'permission-bulk-delete', '2021-03-26 17:49:24', NULL),
(32, 9, 'Permission Report', 'permission-report', '2021-03-26 17:49:24', NULL),
(33, 11, 'Warehouse Access', 'warehouse-access', '2021-03-26 20:06:16', '2021-10-11 05:43:11'),
(34, 11, 'Warehouse Add', 'warehouse-add', '2021-03-26 20:06:16', '2021-10-11 05:43:21'),
(35, 11, 'Warehouse Edit', 'warehouse-edit', '2021-03-26 20:06:16', '2021-10-11 05:43:32'),
(36, 11, 'Warehouse Delete', 'warehouse-delete', '2021-03-26 20:06:16', '2021-10-11 05:43:42'),
(37, 11, 'Warehouse Bulk Delete', 'warehouse-bulk-delete', '2021-03-26 20:06:16', '2021-10-11 05:43:53'),
(38, 11, 'Warehouse Report', 'warehouse-report', '2021-03-26 20:06:16', '2021-10-11 05:44:05'),
(39, 10, 'General Setting Access', 'general-setting-access', '2021-03-26 20:07:15', NULL),
(40, 12, 'Customer Group Access', 'customer-group-access', '2021-03-26 20:08:50', NULL),
(41, 12, 'Customer Group Add', 'customer-group-add', '2021-03-26 20:08:50', NULL),
(42, 12, 'Customer Group Edit', 'customer-group-edit', '2021-03-26 20:08:50', NULL),
(43, 12, 'Customer Group Delete', 'customer-group-delete', '2021-03-26 20:08:50', NULL),
(44, 12, 'Customer Group Bulk Delete', 'customer-group-bulk-delete', '2021-03-26 20:08:50', NULL),
(45, 12, 'Customer Group Report', 'customer-group-report', '2021-03-26 20:08:50', NULL),
(46, 13, 'Unit Access', 'unit-access', '2021-03-26 20:10:02', NULL),
(47, 13, 'Unit Add', 'unit-add', '2021-03-26 20:10:02', NULL),
(48, 13, 'Unit Edit', 'unit-edit', '2021-03-26 20:10:02', NULL),
(49, 13, 'Unit Delete', 'unit-delete', '2021-03-26 20:10:02', NULL),
(50, 13, 'Unit Bulk Delete', 'unit-bulk-delete', '2021-03-26 20:10:02', NULL),
(51, 13, 'Unit Report', 'unit-report', '2021-03-26 20:10:02', NULL),
(52, 14, 'Vat Access', 'vat-access', '2021-03-26 20:10:46', '2022-03-22 10:28:02'),
(53, 14, 'Vat Add', 'vat-add', '2021-03-26 20:10:46', '2022-03-22 10:28:09'),
(54, 14, 'Vat Edit', 'vat-edit', '2021-03-26 20:10:46', '2022-03-22 10:28:16'),
(55, 14, 'Vat Delete', 'vat-delete', '2021-03-26 20:10:46', '2022-03-22 10:28:23'),
(56, 14, 'Vat Bulk Delete', 'vat-bulk-delete', '2021-03-26 20:10:46', '2022-03-22 10:28:31'),
(57, 14, 'Vat Report', 'vat-report', '2021-03-26 20:10:46', '2022-03-22 10:28:38'),
(58, 16, 'Material Category Access', 'material-category-access', '2021-07-13 10:31:39', NULL),
(59, 16, 'Material Category Add', 'material-category-add', '2021-07-13 10:31:39', NULL),
(60, 16, 'Material Category Edit', 'material-category-edit', '2021-07-13 10:31:39', NULL),
(61, 16, 'Material Category Delete', 'material-category-delete', '2021-07-13 10:31:39', NULL),
(62, 16, 'Material Category Bulk Delete', 'material-category-bulk-delete', '2021-07-13 10:31:39', NULL),
(63, 16, 'Material Category Report', 'material-category-report', '2021-07-13 10:31:39', NULL),
(64, 17, 'Material Access', 'material-access', '2021-07-13 10:34:53', NULL),
(65, 17, 'Material Add', 'material-add', '2021-07-13 10:34:53', NULL),
(66, 17, 'Material Edit', 'material-edit', '2021-07-13 10:34:53', NULL),
(67, 17, 'Material View', 'material-view', '2021-07-13 10:34:53', NULL),
(68, 17, 'Material Delete', 'material-delete', '2021-07-13 10:34:53', NULL),
(69, 17, 'Material Bulk Delete', 'material-bulk-delete', '2021-07-13 10:34:53', NULL),
(70, 17, 'Material Report', 'material-report', '2021-07-13 10:34:53', NULL),
(71, 18, 'Material Stock Report Access', 'material-stock-report-access', '2021-07-13 10:35:17', NULL),
(73, 22, 'Purchase Access', 'purchase-access', '2021-07-13 10:37:12', NULL),
(74, 22, 'Purchase Add', 'purchase-add', '2021-07-13 10:37:12', NULL),
(75, 22, 'Purchase Edit', 'purchase-edit', '2021-07-13 10:37:12', NULL),
(76, 22, 'Purchase View', 'purchase-view', '2021-07-13 10:37:12', NULL),
(77, 22, 'Purchase Delete', 'purchase-delete', '2021-07-13 10:37:12', NULL),
(78, 22, 'Purchase Bulk Delete', 'purchase-bulk-delete', '2021-07-13 10:37:12', NULL),
(79, 22, 'Purchase Report', 'purchase-report', '2021-07-13 10:37:12', NULL),
(80, 24, 'Product Category Access', 'product-category-access', '2021-07-13 10:38:23', NULL),
(81, 24, 'Product Category Add', 'product-category-add', '2021-07-13 10:38:23', NULL),
(82, 24, 'Product Category Edit', 'product-category-edit', '2021-07-13 10:38:23', NULL),
(83, 24, 'Product Category Delete', 'product-category-delete', '2021-07-13 10:38:23', NULL),
(84, 24, 'Product Category Bulk Delete', 'product-category-bulk-delete', '2021-07-13 10:38:23', NULL),
(85, 24, 'Product Category Report', 'product-category-report', '2021-07-13 10:38:23', NULL),
(92, 26, 'Product Access', 'product-access', '2021-07-13 10:42:37', NULL),
(93, 26, 'Product Add', 'product-add', '2021-07-13 10:42:37', NULL),
(94, 26, 'Product Edit', 'product-edit', '2021-07-13 10:42:37', NULL),
(95, 26, 'Product View', 'product-view', '2021-07-13 10:42:37', NULL),
(96, 26, 'Product Delete', 'product-delete', '2021-07-13 10:42:37', NULL),
(97, 26, 'Product Bulk Delete', 'product-bulk-delete', '2021-07-13 10:42:37', NULL),
(98, 26, 'Product Report', 'product-report', '2021-07-13 10:42:37', NULL),
(99, 28, 'Print Barcode Access', 'print-barcode-access', '2021-07-13 10:43:04', NULL),
(107, 31, 'Product Stock Report Access', 'product-stock-report-access', '2021-07-13 10:47:01', NULL),
(109, 35, 'Production Access', 'production-access', '2021-07-13 10:59:50', NULL),
(110, 35, 'Production Add', 'production-add', '2021-07-13 10:59:50', NULL),
(111, 35, 'Production Edit', 'production-edit', '2021-07-13 10:59:50', NULL),
(112, 35, 'Production View', 'production-view', '2021-07-13 10:59:50', NULL),
(113, 35, 'Production Delete', 'production-delete', '2021-07-13 10:59:50', NULL),
(114, 35, 'Production Approve', 'production-approve', '2021-07-13 10:59:50', NULL),
(115, 35, 'Production Report', 'production-report', '2021-07-13 10:59:50', NULL),
(124, 42, 'Customer Access', 'customer-access', '2021-07-13 11:06:18', NULL),
(130, 42, 'Customer Add', 'customer-add', '2021-07-13 11:06:18', '2021-09-22 04:20:36'),
(131, 43, 'Customer Ledger Access', 'customer-ledger-access', '2021-07-13 11:06:41', NULL),
(140, 48, 'Supplier Access', 'supplier-access', '2021-07-13 11:09:21', NULL),
(141, 48, 'Supplier Add', 'supplier-add', '2021-07-13 11:09:21', NULL),
(142, 48, 'Supplier Edit', 'supplier-edit', '2021-07-13 11:09:21', NULL),
(143, 48, 'Supplier View', 'supplier-view', '2021-07-13 11:09:21', NULL),
(144, 48, 'Supplier Delete', 'supplier-delete', '2021-07-13 11:09:21', NULL),
(145, 48, 'Supplier Bulk Delete', 'supplier-bulk-delete', '2021-07-13 11:09:21', NULL),
(146, 48, 'Supplier Report', 'supplier-report', '2021-07-13 11:09:21', NULL),
(147, 49, 'Supplier Ledger Access', 'supplier-ledger-access', '2021-07-13 11:09:45', NULL),
(148, 50, 'Supplier Advance Access', 'supplier-advance-access', '2021-07-13 11:10:00', NULL),
(152, 52, 'Return Access', 'return-access', '2021-07-13 11:18:24', '2021-09-23 04:38:18'),
(153, 53, 'Purchase Return Access', 'purchase-return-access', '2021-07-13 11:19:27', NULL),
(154, 53, 'Purchase Return Add', 'purchase-return-add', '2021-07-13 11:19:27', NULL),
(155, 53, 'Purchase Return View', 'purchase-return-view', '2021-07-13 11:19:27', NULL),
(156, 53, 'Purchase Return Delete', 'purchase-return-delete', '2021-07-13 11:19:27', NULL),
(160, 75, 'COA Access', 'coa-access', '2021-07-13 16:12:36', '2021-09-13 05:09:58'),
(161, 75, 'COA Add', 'coa-add', '2021-07-13 16:12:36', '2021-09-13 05:09:51'),
(162, 75, 'COA Edit', 'coa-edit', '2021-07-13 16:12:36', '2021-09-13 05:09:43'),
(163, 75, 'COA Delete', 'coa-delete', '2021-07-13 16:12:36', '2021-09-13 05:09:35'),
(164, 76, 'Opening Balance Access', 'opening-balance-access', '2021-07-13 16:13:13', NULL),
(165, 77, 'Supplier Payment Access', 'supplier-payment-access', '2021-07-13 16:13:38', NULL),
(166, 78, 'Customer Receive Access', 'customer-receive-access', '2021-07-13 16:14:05', NULL),
(170, 83, 'Contra Voucher Access', 'contra-voucher-access', '2021-07-13 16:20:59', NULL),
(171, 83, 'Contra Voucher Add', 'contra-voucher-add', '2021-07-13 16:20:59', NULL),
(172, 83, 'Contra Voucher View', 'contra-voucher-view', '2021-07-13 16:20:59', NULL),
(173, 83, 'Contra Voucher Delete', 'contra-voucher-delete', '2021-07-13 16:20:59', NULL),
(174, 85, 'Journal Voucher Access', 'journal-voucher-access', '2021-07-13 16:21:48', '2021-09-20 09:40:17'),
(175, 85, 'Journal Voucher Add', 'journal-voucher-add', '2021-07-13 16:21:48', '2021-09-20 09:40:24'),
(176, 85, 'Journal Voucher View', 'journal-voucher-view', '2021-07-13 16:21:48', '2021-09-20 09:40:30'),
(177, 85, 'Journal Voucher Delete', 'journal-voucher-delete', '2021-07-13 16:21:48', '2021-09-20 09:40:36'),
(178, 86, 'Voucher Access', 'voucher-access', '2021-07-13 16:24:05', NULL),
(179, 86, 'Voucher Approve', 'voucher-approve', '2021-07-13 16:24:05', NULL),
(180, 86, 'Voucher Edit', 'voucher-edit', '2021-07-13 16:24:05', NULL),
(181, 86, 'Voucher Delete', 'voucher-delete', '2021-07-13 16:24:05', NULL),
(186, 92, 'General Ledger Access', 'general-ledger-access', '2021-07-13 17:00:34', NULL),
(190, 71, 'Expense Item Access', 'expense-item-access', '2021-07-13 17:03:02', NULL),
(191, 71, 'Expense Item Add', 'expense-item-add', '2021-07-13 17:03:02', NULL),
(192, 71, 'Expense Item Edit', 'expense-item-edit', '2021-07-13 17:03:02', NULL),
(193, 71, 'Expense Item Delete', 'expense-item-delete', '2021-07-13 17:03:02', NULL),
(194, 71, 'Expense Item Bulk Delete', 'expense-item-bulk-delete', '2021-07-13 17:03:02', NULL),
(195, 71, 'Expense Item Report', 'expense-item-report', '2021-07-13 17:03:02', NULL),
(196, 72, 'Expense Access', 'expense-access', '2021-07-13 17:04:23', NULL),
(197, 72, 'Expense Add', 'expense-add', '2021-07-13 17:04:23', NULL),
(198, 72, 'Expense Edit', 'expense-edit', '2021-07-13 17:04:23', NULL),
(199, 72, 'Expense Delete', 'expense-delete', '2021-07-13 17:04:23', NULL),
(200, 72, 'Expense Bulk Delete', 'expense-bulk-delete', '2021-07-13 17:04:23', NULL),
(201, 72, 'Expense Report', 'expense-report', '2021-07-13 17:04:23', NULL),
(202, 72, 'Expense Approve', 'expense-approve', '2021-07-13 17:04:23', NULL),
(203, 73, 'Expense Statement Access', 'expense-statement-access', '2021-07-13 17:04:44', NULL),
(204, 63, 'Bank Access', 'bank-access', '2021-07-13 17:06:06', NULL),
(205, 63, 'Bank Add', 'bank-add', '2021-07-13 17:06:06', NULL),
(206, 63, 'Bank Edit', 'bank-edit', '2021-07-13 17:06:06', NULL),
(207, 63, 'Bank Delete', 'bank-delete', '2021-07-13 17:06:06', NULL),
(208, 63, 'Bank Report', 'bank-report', '2021-07-13 17:06:06', NULL),
(209, 64, 'Bank Transaction Access', 'bank-transaction-access', '2021-07-13 17:09:48', NULL),
(210, 65, 'Bank Ledger Access', 'bank-ledger-access', '2021-07-13 17:10:05', NULL),
(211, 67, 'Mobile Bank Access', 'mobile-bank-access', '2021-07-13 17:17:15', NULL),
(212, 67, 'Mobile Bank Add', 'mobile-bank-add', '2021-07-13 17:17:15', NULL),
(213, 67, 'Mobile Bank Edit', 'mobile-bank-edit', '2021-07-13 17:17:15', NULL),
(214, 67, 'Mobile Bank Delete', 'mobile-bank-delete', '2021-07-13 17:17:15', NULL),
(215, 67, 'Mobile Bank Bulk Delete', 'mobile-bank-bulk-delete', '2021-07-13 17:17:15', NULL),
(216, 67, 'Mobile Bank Report', 'mobile-bank-report', '2021-07-13 17:17:15', NULL),
(217, 68, 'Mobile Bank Transaction Access', 'mobile-bank-transaction-access', '2021-07-13 17:17:36', NULL),
(218, 69, 'Mobile Bank Ledger Access', 'mobile-bank-ledger-access', '2021-07-13 17:17:56', NULL),
(219, 58, 'District Access', 'district-access', '2021-07-13 17:26:47', NULL),
(220, 58, 'District Add', 'district-add', '2021-07-13 17:26:47', NULL),
(221, 58, 'District Edit', 'district-edit', '2021-07-13 17:26:47', NULL),
(222, 58, 'District Delete', 'district-delete', '2021-07-13 17:26:47', NULL),
(223, 58, 'District Bulk Delete', 'district-bulk-delete', '2021-07-13 17:26:47', NULL),
(224, 58, 'District Report', 'district-report', '2021-07-13 17:26:47', NULL),
(225, 59, 'Upazila Access', 'upazila-access', '2021-07-13 17:30:37', NULL),
(226, 59, 'Upazila Add', 'upazila-add', '2021-07-13 17:30:37', NULL),
(227, 59, 'Upazila Edit', 'upazila-edit', '2021-07-13 17:30:37', NULL),
(228, 59, 'Upazila Delete', 'upazila-delete', '2021-07-13 17:30:37', NULL),
(229, 59, 'Upazila Bulk Delete', 'upazila-bulk-delete', '2021-07-13 17:30:37', NULL),
(230, 59, 'Upazila Report', 'upazila-report', '2021-07-13 17:30:37', NULL),
(237, 61, 'Area Access', 'area-access', '2021-07-13 17:32:53', NULL),
(238, 61, 'Area Add', 'area-add', '2021-07-13 17:32:53', NULL),
(239, 61, 'Area Edit', 'area-edit', '2021-07-13 17:32:53', NULL),
(240, 61, 'Area Delete', 'area-delete', '2021-07-13 17:32:53', NULL),
(241, 61, 'Area Bulk Delete', 'area-bulk-delete', '2021-07-13 17:32:53', NULL),
(242, 61, 'Area Report', 'area-report', '2021-07-13 17:32:53', NULL),
(354, 35, 'Production Operation', 'production-operation', '2021-08-06 17:14:21', NULL),
(355, 35, 'Production Transfer', 'production-transfer', '2021-08-06 17:14:21', NULL),
(356, 50, 'Supplier Advance Add', 'supplier-advance-add', '2021-08-11 08:05:49', NULL),
(357, 50, 'Supplier Advance Edit', 'supplier-advance-edit', '2021-08-11 08:05:49', NULL),
(358, 50, 'Supplier Advance Delete', 'supplier-advance-delete', '2021-08-11 08:05:49', NULL),
(359, 50, 'Supplier Advance Bulk Delete', 'supplier-advance-bulk-delete', '2021-08-11 08:05:49', NULL),
(360, 50, 'Supplier Advance Approve', 'supplier-advance-approve', '2021-08-11 08:05:49', NULL),
(364, 126, 'Finish Goods Access', 'finish-goods-access', '2021-08-12 12:57:26', NULL),
(455, 183, 'Sales Report Access', 'sales-report-access', '2021-09-06 04:26:08', NULL),
(468, 196, 'Material Stock Alert Report Access', 'material-stock-alert-report-access', '2021-09-06 04:32:12', '2021-09-06 18:30:08'),
(475, 203, 'Debit Voucher Access', 'debit-voucher-access', '2021-09-07 09:57:25', '2021-09-20 09:23:24'),
(476, 204, 'Credit Voucher Access', 'credit-voucher-access', '2021-09-07 09:59:32', '2021-09-20 09:28:19'),
(542, 42, 'Customer Edit', 'customer-edit', '2021-09-14 10:04:06', '2021-09-22 04:20:43'),
(543, 42, 'Customer View', 'customer-view', '2021-09-14 10:04:06', '2021-09-22 04:20:55'),
(544, 203, 'Debit Voucher Add', 'debit-voucher-add', '2021-09-20 09:24:08', NULL),
(545, 204, 'Credit Voucher Add', 'credit-voucher-add', '2021-09-20 09:28:51', NULL),
(546, 42, 'Customer Delete', 'customer-delete', '2021-09-22 04:21:13', NULL),
(547, 236, 'Sale Access', 'sale-access', '2021-09-22 09:21:37', NULL),
(548, 236, 'Sale Add', 'sale-add', '2021-09-22 09:21:37', NULL),
(549, 236, 'Sale Edit', 'sale-edit', '2021-09-22 09:21:37', NULL),
(550, 236, 'Sale View', 'sale-view', '2021-09-22 09:21:37', NULL),
(551, 236, 'Sale Delete', 'sale-delete', '2021-09-22 09:21:37', NULL),
(552, 236, 'Sale Bulk Delete', 'sale-bulk-delete', '2021-09-22 09:21:37', NULL),
(553, 237, 'Sale Return Access', 'sale-return-access', '2021-09-23 04:39:13', NULL),
(554, 237, 'Sale Return Add', 'sale-return-add', '2021-09-23 04:39:13', NULL),
(555, 237, 'Sale Return View', 'sale-return-view', '2021-09-23 04:39:13', NULL),
(556, 237, 'Sale Return Delete', 'sale-return-delete', '2021-09-23 04:39:13', NULL),
(558, 238, 'Product Stock Alert Report Access', 'product-stock-alert-report-access', '2021-09-23 10:12:15', NULL),
(560, 241, 'Salesmen Payment Access', 'salesmen-payment-access', '2021-10-03 09:57:18', NULL),
(564, 247, 'Material Stock Ledger Access', 'material-stock-ledger-access', '2021-10-07 06:59:00', NULL),
(565, 247, 'Material Stock Ledger Cost View', 'material-stock-ledger-cost-view', '2021-10-07 06:59:00', NULL),
(568, 203, 'Debit Voucher View', 'debit-voucher-view', '2021-10-13 11:18:33', NULL),
(569, 203, 'Debit Voucher Delete', 'debit-voucher-delete', '2021-10-13 11:18:33', NULL),
(570, 204, 'Credit Voucher View', 'credit-voucher-view', '2021-10-13 11:19:06', NULL),
(571, 204, 'Credit Voucher Delete', 'credit-voucher-delete', '2021-10-13 11:19:06', NULL),
(572, 22, 'Purchase Payment Add', 'purchase-payment-add', '2021-11-15 12:07:18', NULL),
(573, 22, 'Purchase Payment Edit', 'purchase-payment-edit', '2021-11-15 12:07:18', NULL),
(574, 22, 'Purchase Payment View', 'purchase-payment-view', '2021-11-15 12:07:18', NULL),
(575, 22, 'Purchase Payment Delete', 'purchase-payment-delete', '2021-11-15 12:07:18', NULL),
(580, 252, 'Transfer Inventory Access', 'transfer-inventory-access', '2022-03-23 06:36:36', NULL),
(581, 252, 'Transfer Inventory Add', 'transfer-inventory-add', '2022-03-23 06:36:36', NULL),
(582, 252, 'Transfer Inventory Edit', 'transfer-inventory-edit', '2022-03-23 06:36:36', NULL),
(583, 252, 'Transfer Inventory View', 'transfer-inventory-view', '2022-03-23 06:36:36', NULL),
(584, 252, 'Transfer Inventory Delete', 'transfer-inventory-delete', '2022-03-23 06:36:36', NULL),
(585, 252, 'Transfer Inventory Bulk Delete', 'transfer-inventory-bulk-delete', '2022-03-23 06:36:36', NULL),
(586, 255, 'Dealer Access', 'dealer-access', '2022-04-04 03:52:56', NULL),
(587, 255, 'Dealer Add', 'dealer-add', '2022-04-04 03:52:56', NULL),
(588, 255, 'Dealer Edit', 'dealer-edit', '2022-04-04 03:52:56', NULL),
(589, 255, 'Dealer View', 'dealer-view', '2022-04-04 03:52:56', NULL),
(590, 255, 'Dealer Delete', 'dealer-delete', '2022-04-04 03:52:56', NULL),
(591, 255, 'Dealer Bulk Delete', 'dealer-bulk-delete', '2022-04-04 03:52:56', NULL),
(592, 256, 'Dealer Ledger Access', 'dealer-ledger-access', '2022-04-04 03:53:15', NULL),
(593, 257, 'Dealer Advance Access', 'dealer-advance-access', '2022-04-04 03:54:11', NULL),
(594, 257, 'Dealer Advance Add', 'dealer-advance-add', '2022-04-04 03:54:11', NULL),
(595, 257, 'Dealer Advance Edit', 'dealer-advance-edit', '2022-04-04 03:54:11', NULL),
(596, 257, 'Dealer Advance Delete', 'dealer-advance-delete', '2022-04-04 03:54:11', NULL),
(597, 257, 'Dealer Advance Bulk Delete', 'dealer-advance-bulk-delete', '2022-04-04 03:54:11', NULL),
(623, 236, 'Sale Status change', 'sale-status-change', '2022-05-29 04:50:38', NULL),
(624, 236, 'Sale Product Delivery', 'sale-product-delivery', '2022-05-29 07:19:22', NULL),
(632, 78, 'Customer Receive Add', 'customer-receive-add', '2022-05-30 10:14:11', NULL),
(633, 78, 'Customer Receive Delete', 'customer-receive-delete', '2022-05-30 10:52:09', NULL),
(634, 78, 'Customer Receive Details', 'customer-receive-details', '2022-05-30 10:57:39', NULL),
(635, 77, 'Supplier Payment Create', 'supplier-payment-create', '2022-05-31 05:01:20', NULL),
(636, 77, 'Supplier Payment Details', 'supplier-payment-details', '2022-05-31 05:01:20', NULL),
(637, 77, 'Supplier Payment Delete', 'supplier-payment-delete', '2022-05-31 05:01:20', NULL),
(638, 241, 'Salesmen Payment Add', 'salesmen-payment-add', '2022-05-31 05:22:10', NULL),
(639, 241, 'Salesmen Payment Details', 'salesmen-payment-details', '2022-05-31 05:22:10', NULL),
(640, 241, 'Salesmen Payment Delete', 'salesmen-payment-delete', '2022-05-31 05:22:10', NULL),
(641, 22, 'Purchase Change Status', 'purchase-change-status', '2022-06-29 05:34:10', NULL),
(700, 277, 'Attendance Report', 'attendance-report', '2022-11-23 08:35:01', NULL),
(701, 277, 'Attendance Bulk Delete', 'attendance-bulk-delete', '2022-11-23 08:35:01', NULL),
(702, 277, 'Attendance Delete', 'attendance-delete', '2022-11-23 08:35:01', NULL),
(703, 277, 'Attendance Edit', 'attendance-edit', '2022-11-23 08:35:01', NULL),
(704, 277, 'Attendance Add', 'attendance-add', '2022-11-23 08:35:01', NULL),
(705, 277, 'Attendance Access', 'attendance-access', '2022-11-23 08:35:01', NULL),
(706, 278, 'Attendance Report Access', 'attendance-report-access', '2022-11-23 08:35:29', NULL),
(707, 280, 'Weekly Holiday Report', 'weekly-holiday-report', '2022-11-23 08:36:25', NULL),
(708, 280, 'Weekly Holiday Bulk Delete', 'weekly-holiday-bulk-delete', '2022-11-23 08:36:25', NULL),
(709, 280, 'Weekly Holiday Delete', 'weekly-holiday-delete', '2022-11-23 08:36:25', NULL),
(710, 280, 'Weekly Holiday Edit', 'weekly-holiday-edit', '2022-11-23 08:36:25', NULL),
(711, 280, 'Weekly Holiday Add', 'weekly-holiday-add', '2022-11-23 08:36:25', NULL),
(712, 280, 'Weekly Holiday Access', 'weekly-holiday-access', '2022-11-23 08:36:25', NULL),
(713, 281, 'Holiday Report', 'holiday-report', '2022-11-23 08:37:16', NULL),
(714, 281, 'Holiday Bulk Delete', 'holiday-bulk-delete', '2022-11-23 08:37:16', NULL),
(715, 281, 'Holiday Delete', 'holiday-delete', '2022-11-23 08:37:16', NULL),
(716, 281, 'Holiday Edit', 'holiday-edit', '2022-11-23 08:37:16', NULL),
(717, 281, 'Holiday Add', 'holiday-add', '2022-11-23 08:37:16', NULL),
(718, 281, 'Holiday Access', 'holiday-access', '2022-11-23 08:37:16', NULL),
(732, 286, 'Employee Access', 'employee-access', '2023-03-12 05:14:48', NULL),
(733, 286, 'Employee Add', 'employee-add', '2023-03-12 05:14:48', NULL),
(734, 286, 'Employee Edit', 'employee-edit', '2023-03-12 05:14:48', NULL),
(735, 286, 'Employee View', 'employee-view', '2023-03-12 05:14:48', NULL),
(736, 286, 'Employee Delete', 'employee-delete', '2023-03-12 05:14:48', NULL),
(737, 286, 'Employee Report', 'employee-report', '2023-03-12 05:14:48', NULL),
(738, 287, 'Labour Access', 'labour-access', '2023-03-12 05:16:36', NULL),
(739, 287, 'Labour Add', 'labour-add', '2023-03-12 05:16:36', NULL),
(740, 287, 'Labour edit', 'labour-edit', '2023-03-12 05:16:36', NULL),
(741, 287, 'Labour report', 'labour-report', '2023-03-12 05:16:36', NULL),
(742, 289, 'Department Access', 'department-access', '2023-03-12 05:22:00', NULL),
(743, 289, 'Department Add', 'department-add', '2023-03-12 05:22:00', NULL),
(744, 289, 'Department Edit', 'department-edit', '2023-03-12 05:22:00', NULL),
(745, 289, 'Department Delete', 'department-delete', '2023-03-12 05:22:00', NULL),
(746, 289, 'Department Report', 'department-report', '2023-03-12 05:22:00', NULL),
(747, 290, 'Designation Access', 'designation-access', '2023-03-12 05:22:58', NULL),
(748, 290, 'Designation Add', 'designation-add', '2023-03-12 05:22:58', NULL),
(749, 290, 'Designation Edit', 'designation-edit', '2023-03-12 05:22:58', NULL),
(750, 290, 'Designation Delete', 'designation-delete', '2023-03-12 05:22:58', NULL),
(751, 290, 'Designation Report', 'designation-report', '2023-03-12 05:22:58', NULL),
(752, 291, 'Branch Add', 'branch-add', '2023-03-12 05:23:59', NULL),
(753, 291, 'Branch Edit', 'branch-edit', '2023-03-12 05:23:59', NULL),
(754, 291, 'Branch Delete', 'branch-delete', '2023-03-12 05:23:59', NULL),
(755, 291, 'Branch Access', 'branch-access', '2023-03-12 05:23:59', NULL),
(756, 299, 'Salary Access', 'salary-access', '2023-03-12 08:58:03', NULL),
(757, 299, 'Salary Add', 'salary-add', '2023-03-12 08:58:03', NULL),
(758, 299, 'Salary Edit', 'salary-edit', '2023-03-12 08:58:03', NULL),
(759, 299, 'Salary View', 'salary-view', '2023-03-12 08:58:03', NULL),
(760, 299, 'Salary Delete', 'salary-delete', '2023-03-12 08:58:03', NULL),
(761, 299, 'Salary Report', 'salary-report', '2023-03-12 08:58:03', NULL),
(762, 300, 'Salary Payment Access', 'salary-payment-access', '2023-03-12 08:59:02', NULL),
(763, 300, 'Salary Payment Add', 'salary-payment-add', '2023-03-12 08:59:02', NULL),
(764, 300, 'Salary Payment Edit', 'salary-payment-edit', '2023-03-12 08:59:02', NULL),
(765, 300, 'Salary Payment Delete', 'salary-payment-delete', '2023-03-12 08:59:02', NULL),
(766, 300, 'Salary Payment View', 'salary-payment-view', '2023-03-12 08:59:02', NULL),
(767, 301, 'Increment Access', 'increment-access', '2023-03-12 09:00:14', NULL),
(768, 301, 'Increment Add', 'increment-add', '2023-03-12 09:00:14', NULL),
(769, 301, 'Increment Edit', 'increment-edit', '2023-03-12 09:00:14', NULL),
(770, 301, 'Increment Delete', 'increment-delete', '2023-03-12 09:00:14', NULL),
(771, 301, 'Increment View', 'increment-view', '2023-03-12 09:00:14', NULL),
(772, 302, 'Bonus Access', 'bonus-access', '2023-03-12 09:00:53', NULL),
(773, 302, 'Bonus Add', 'bonus-add', '2023-03-12 09:00:53', NULL),
(774, 302, 'Bonus Edit', 'bonus-edit', '2023-03-12 09:00:53', NULL),
(775, 303, 'Allowances Access', 'allowances-access', '2023-03-12 09:02:17', NULL),
(776, 303, 'Allowances Add', 'allowances-add', '2023-03-12 09:02:17', NULL),
(777, 303, 'Allowances Edit', 'allowances-edit', '2023-03-12 09:02:17', NULL),
(778, 303, 'Allowances Delete', 'allowances-delete', '2023-03-12 09:02:17', NULL),
(779, 303, 'Allowances View', 'allowances-view', '2023-03-12 09:02:17', NULL),
(780, 304, 'Deduction Access', 'deduction-access', '2023-03-12 09:03:21', NULL),
(781, 304, 'Deduction Add', 'deduction-add', '2023-03-12 09:03:21', NULL),
(782, 304, 'Deduction Edit', 'deduction-edit', '2023-03-12 09:03:21', NULL),
(783, 304, 'Deduction Delete', 'deduction-delete', '2023-03-12 09:03:21', NULL),
(784, 304, 'Deduction View', 'deduction-view', '2023-03-12 09:03:21', NULL),
(785, 305, 'Salary Advance Add', 'salary-advance-add', '2023-03-12 09:04:01', NULL),
(786, 305, 'Salary Advance Edit', 'salary-advance-edit', '2023-03-12 09:04:01', NULL),
(787, 305, 'Salary Advance Access', 'salary-advance-access', '2023-03-12 09:04:01', NULL),
(788, 293, 'Labour Salary Payment Access', 'labour-salary-payment-access', '2023-03-12 09:18:49', NULL),
(789, 293, 'Labour Salary Payment Add', 'labour-salary-payment-add', '2023-03-12 09:18:49', NULL),
(790, 293, 'Labour Salary Payment Edit', 'labour-salary-payment-edit', '2023-03-12 09:18:49', NULL),
(791, 293, 'Labour Salary Payment View', 'labour-salary-payment-view', '2023-03-12 09:18:49', NULL),
(792, 293, 'Labour Salary Payment Delete', 'labour-salary-payment-delete', '2023-03-12 09:18:49', NULL),
(799, 310, 'Dealer Receive Delete', 'dealer-receive-delete', '2023-04-29 03:18:37', NULL),
(800, 310, 'Dealer Receive Details', 'dealer-receive-details', '2023-04-29 03:18:37', NULL),
(801, 310, 'Dealer Receive Access', 'dealer-receive-access', '2023-04-29 03:18:37', NULL),
(802, 311, 'Due Report Access', 'due-report-access', '2023-04-29 06:23:04', NULL),
(803, 312, 'Purchase Report Access', 'purchase-report-access', '2023-04-30 10:35:35', NULL),
(804, 313, 'Dealer Report Access', 'dealer-report-access', '2023-05-01 05:23:30', NULL),
(805, 307, 'Product Ledger Access', 'product-ledger-access', '2023-05-01 05:26:09', NULL),
(806, 314, 'Income Statement Report Access', 'income-statement-report-access', '2023-05-01 08:07:37', NULL),
(807, 309, 'Dealer Sale Add', 'dealer-sale-add', '2023-05-31 04:53:40', NULL),
(808, 309, 'Dealer Sale Product Delivery', 'dealer-sale-product-delivery', '2023-05-31 04:53:40', NULL),
(809, 309, 'Dealer Sale Status Change', 'dealer-sale-status-change', '2023-05-31 04:53:40', NULL),
(810, 309, 'Dealer Sale View', 'dealer-sale-view', '2023-05-31 04:53:40', NULL),
(811, 309, 'Dealer Sale Edit', 'dealer-sale-edit', '2023-05-31 04:53:40', NULL),
(812, 309, 'Dealer Sale Access', 'dealer-sale-access', '2023-05-31 04:53:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `id` bigint UNSIGNED NOT NULL,
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(2, 58, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(3, 59, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(4, 60, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(5, 61, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(6, 62, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(7, 63, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(8, 64, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(9, 65, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(10, 66, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(11, 67, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(12, 68, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(13, 69, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(14, 70, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(15, 71, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(16, 80, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(17, 81, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(18, 82, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(19, 83, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(20, 84, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(21, 85, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(28, 92, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(29, 93, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(30, 94, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(31, 95, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(32, 96, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(33, 97, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(34, 98, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(35, 99, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(43, 107, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(44, 109, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(45, 110, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(46, 111, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(47, 112, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(48, 113, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(49, 114, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(50, 115, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(51, 354, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(52, 355, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(53, 364, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(54, 140, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(55, 141, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(56, 142, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(57, 143, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(58, 144, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(59, 145, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(60, 146, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(61, 147, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(62, 148, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(63, 356, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(64, 357, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(65, 358, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(66, 359, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(67, 360, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(68, 219, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(69, 220, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(70, 221, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(71, 222, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(72, 223, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(73, 224, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(74, 225, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(75, 226, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(76, 227, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(77, 228, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(78, 229, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(79, 230, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(86, 237, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(87, 238, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(88, 239, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(89, 240, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(90, 241, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(91, 242, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(92, 2, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(93, 3, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(94, 4, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(95, 5, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(96, 6, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(97, 7, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(98, 8, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(99, 9, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(100, 10, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(101, 11, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(102, 12, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(103, 13, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(104, 14, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(105, 15, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(121, 39, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(122, 33, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(123, 34, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(124, 35, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(125, 36, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(126, 37, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(127, 38, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(128, 40, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(129, 41, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(130, 42, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(131, 43, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(132, 44, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(133, 45, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(134, 46, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(135, 47, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(136, 48, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(137, 49, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(138, 50, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(139, 51, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(140, 52, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(141, 53, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(142, 54, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(143, 55, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(144, 56, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(145, 57, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(146, 73, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(147, 74, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(148, 75, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(149, 76, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(150, 77, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(151, 78, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(152, 79, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(153, 124, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(154, 130, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(155, 131, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(166, 152, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(167, 153, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(168, 154, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(169, 155, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(170, 156, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(174, 160, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(175, 161, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(176, 162, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(177, 163, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(178, 164, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(179, 165, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(180, 166, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(187, 475, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(189, 476, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(190, 170, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(191, 171, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(192, 172, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(193, 173, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(194, 174, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(195, 175, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(196, 176, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(197, 177, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(198, 178, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(199, 179, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(200, 180, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(201, 181, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(206, 186, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(326, 190, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(327, 191, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(328, 192, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(329, 193, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(330, 194, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(331, 195, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(332, 196, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(333, 197, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(334, 198, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(335, 199, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(336, 200, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(337, 201, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(338, 202, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(339, 203, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(340, 204, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(341, 205, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(342, 206, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(343, 207, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(344, 208, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(345, 209, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(346, 210, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(347, 211, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(348, 212, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(349, 213, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(350, 214, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(351, 215, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(352, 216, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(353, 217, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(354, 218, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(359, 455, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(376, 468, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(377, 542, 2, '2021-09-14 11:45:19', '2021-09-14 11:45:19'),
(378, 543, 2, '2021-09-14 11:45:19', '2021-09-14 11:45:19'),
(379, 544, 2, '2021-09-20 09:42:13', '2021-09-20 09:42:13'),
(380, 545, 2, '2021-09-20 09:42:13', '2021-09-20 09:42:13'),
(381, 547, 2, '2021-09-23 06:57:20', '2021-09-23 06:57:20'),
(382, 548, 2, '2021-09-23 06:57:20', '2021-09-23 06:57:20'),
(383, 549, 2, '2021-09-23 06:57:20', '2021-09-23 06:57:20'),
(384, 550, 2, '2021-09-23 06:57:20', '2021-09-23 06:57:20'),
(385, 551, 2, '2021-09-23 06:57:20', '2021-09-23 06:57:20'),
(386, 552, 2, '2021-09-23 06:57:20', '2021-09-23 06:57:20'),
(387, 553, 2, '2021-09-23 06:57:41', '2021-09-23 06:57:41'),
(388, 554, 2, '2021-09-23 06:57:41', '2021-09-23 06:57:41'),
(389, 555, 2, '2021-09-23 06:57:41', '2021-09-23 06:57:41'),
(390, 556, 2, '2021-09-23 06:57:41', '2021-09-23 06:57:41'),
(391, 564, 2, '2021-10-13 10:19:18', '2021-10-13 10:19:18'),
(392, 565, 2, '2021-10-13 10:19:18', '2021-10-13 10:19:18'),
(398, 546, 2, '2021-10-13 10:19:18', '2021-10-13 10:19:18'),
(399, 560, 2, '2021-10-13 10:19:18', '2021-10-13 10:19:18'),
(401, 558, 2, '2021-10-13 10:19:18', '2021-10-13 10:19:18'),
(403, 568, 2, '2021-10-13 05:29:34', '2021-10-13 05:29:34'),
(404, 569, 2, '2021-10-13 05:29:34', '2021-10-13 05:29:34'),
(405, 570, 2, '2021-10-13 05:29:34', '2021-10-13 05:29:34'),
(406, 571, 2, '2021-10-13 05:29:34', '2021-10-13 05:29:34'),
(3351, 572, 2, '2022-02-28 23:56:14', '2022-02-28 23:56:14'),
(3352, 573, 2, '2022-02-28 23:56:14', '2022-02-28 23:56:14'),
(3353, 574, 2, '2022-02-28 23:56:14', '2022-02-28 23:56:14'),
(3354, 575, 2, '2022-02-28 23:56:14', '2022-02-28 23:56:14'),
(3358, 1, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3372, 71, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3373, 564, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3374, 565, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3407, 107, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3410, 109, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3411, 110, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3412, 111, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3413, 112, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3414, 113, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3415, 114, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3416, 115, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3417, 354, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3418, 355, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3419, 364, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3434, 131, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3449, 147, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3456, 152, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3457, 153, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3458, 154, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3459, 155, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3460, 156, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3461, 553, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3462, 554, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3463, 555, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3464, 556, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3502, 186, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3635, 203, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3636, 204, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3637, 205, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3638, 206, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3639, 207, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3640, 208, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3641, 209, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3642, 210, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3654, 455, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3667, 468, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3668, 558, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3747, 1, 40, '2022-03-03 09:24:10', '2022-03-03 09:24:10'),
(3748, 80, 40, '2022-03-03 09:24:10', '2022-03-03 09:24:10'),
(3749, 81, 40, '2022-03-03 09:24:10', '2022-03-03 09:24:10'),
(3750, 82, 40, '2022-03-03 09:24:10', '2022-03-03 09:24:10'),
(3751, 83, 40, '2022-03-03 09:24:10', '2022-03-03 09:24:10'),
(3752, 84, 40, '2022-03-03 09:24:10', '2022-03-03 09:24:10'),
(3753, 85, 40, '2022-03-03 09:24:10', '2022-03-03 09:24:10'),
(3754, 92, 40, '2022-03-03 09:24:10', '2022-03-03 09:24:10'),
(3755, 93, 40, '2022-03-03 09:24:10', '2022-03-03 09:24:10'),
(3756, 94, 40, '2022-03-03 09:24:10', '2022-03-03 09:24:10'),
(3757, 95, 40, '2022-03-03 09:24:10', '2022-03-03 09:24:10'),
(3758, 96, 40, '2022-03-03 09:24:10', '2022-03-03 09:24:10'),
(3759, 97, 40, '2022-03-03 09:24:10', '2022-03-03 09:24:10'),
(3760, 98, 40, '2022-03-03 09:24:10', '2022-03-03 09:24:10'),
(3761, 99, 40, '2022-03-03 09:24:10', '2022-03-03 09:24:10'),
(3769, 107, 40, '2022-03-03 09:24:10', '2022-03-03 09:24:10'),
(3772, 109, 40, '2022-03-03 09:24:10', '2022-03-03 09:24:10'),
(3773, 110, 40, '2022-03-03 09:24:10', '2022-03-03 09:24:10'),
(3775, 112, 40, '2022-03-03 09:24:10', '2022-03-03 09:24:10'),
(3777, 114, 40, '2022-03-03 09:24:10', '2022-03-03 09:24:10'),
(3778, 115, 40, '2022-03-03 09:24:10', '2022-03-03 09:24:10'),
(3779, 354, 40, '2022-03-03 09:24:10', '2022-03-03 09:24:10'),
(3781, 364, 40, '2022-03-03 09:24:10', '2022-03-03 09:24:10'),
(3782, 1, 41, '2022-03-03 09:25:13', '2022-03-03 09:25:13'),
(3783, 1, 42, '2022-03-03 09:26:02', '2022-03-03 09:26:02'),
(3784, 58, 42, '2022-03-03 09:26:02', '2022-03-03 09:26:02'),
(3785, 59, 42, '2022-03-03 09:26:02', '2022-03-03 09:26:02'),
(3786, 60, 42, '2022-03-03 09:26:02', '2022-03-03 09:26:02'),
(3787, 61, 42, '2022-03-03 09:26:02', '2022-03-03 09:26:02'),
(3788, 62, 42, '2022-03-03 09:26:02', '2022-03-03 09:26:02'),
(3789, 63, 42, '2022-03-03 09:26:02', '2022-03-03 09:26:02'),
(3790, 64, 42, '2022-03-03 09:26:02', '2022-03-03 09:26:02'),
(3791, 65, 42, '2022-03-03 09:26:02', '2022-03-03 09:26:02'),
(3792, 66, 42, '2022-03-03 09:26:02', '2022-03-03 09:26:02'),
(3793, 67, 42, '2022-03-03 09:26:02', '2022-03-03 09:26:02'),
(3794, 68, 42, '2022-03-03 09:26:02', '2022-03-03 09:26:02'),
(3795, 69, 42, '2022-03-03 09:26:02', '2022-03-03 09:26:02'),
(3796, 70, 42, '2022-03-03 09:26:02', '2022-03-03 09:26:02'),
(3797, 71, 42, '2022-03-03 09:26:02', '2022-03-03 09:26:02'),
(3798, 564, 42, '2022-03-03 09:26:02', '2022-03-03 09:26:02'),
(3799, 565, 42, '2022-03-03 09:26:02', '2022-03-03 09:26:02'),
(3800, 73, 42, '2022-03-03 09:26:02', '2022-03-03 09:26:02'),
(3801, 74, 42, '2022-03-03 09:26:02', '2022-03-03 09:26:02'),
(3802, 75, 42, '2022-03-03 09:26:02', '2022-03-03 09:26:02'),
(3803, 76, 42, '2022-03-03 09:26:02', '2022-03-03 09:26:02'),
(3804, 77, 42, '2022-03-03 09:26:02', '2022-03-03 09:26:02'),
(3805, 78, 42, '2022-03-03 09:26:02', '2022-03-03 09:26:02'),
(3806, 79, 42, '2022-03-03 09:26:02', '2022-03-03 09:26:02'),
(3807, 572, 42, '2022-03-03 09:26:02', '2022-03-03 09:26:02'),
(3808, 573, 42, '2022-03-03 09:26:02', '2022-03-03 09:26:02'),
(3809, 574, 42, '2022-03-03 09:26:02', '2022-03-03 09:26:02'),
(3810, 575, 42, '2022-03-03 09:26:02', '2022-03-03 09:26:02'),
(3950, 580, 40, '2022-03-23 10:06:05', '2022-03-23 10:06:05'),
(3951, 582, 40, '2022-03-23 10:06:05', '2022-03-23 10:06:05'),
(3952, 583, 40, '2022-03-23 10:06:05', '2022-03-23 10:06:05'),
(3953, 641, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(3954, 623, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(3955, 624, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(3963, 580, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(3964, 581, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(3965, 582, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(3966, 583, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(3967, 584, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(3968, 585, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(3969, 638, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(3970, 639, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(3971, 640, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(3972, 635, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(3973, 636, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(3974, 637, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(3975, 632, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(3976, 633, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(3977, 634, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(4017, 586, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(4018, 587, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(4019, 588, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(4020, 589, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(4021, 590, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(4022, 591, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(4023, 592, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(4024, 593, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(4025, 594, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(4026, 595, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(4027, 596, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(4028, 597, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(4029, 1, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4030, 160, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4031, 161, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4032, 162, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4033, 163, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4034, 164, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4035, 560, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4036, 638, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4037, 639, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4038, 640, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4039, 165, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4040, 635, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4041, 636, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4042, 637, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4043, 166, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4044, 632, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4045, 633, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4046, 634, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4047, 475, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4048, 544, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4049, 568, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4050, 569, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4051, 476, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4052, 545, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4053, 570, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4054, 571, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4055, 170, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4056, 171, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4057, 172, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4058, 173, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4059, 174, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4060, 175, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4061, 176, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4062, 177, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4063, 178, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4064, 179, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4065, 180, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4066, 181, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4067, 182, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4068, 183, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4069, 184, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4070, 185, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4071, 186, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4072, 187, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4073, 188, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4074, 189, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4075, 540, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4086, 662, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4087, 663, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4088, 664, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4089, 665, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4090, 666, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4091, 667, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4092, 668, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4093, 669, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4094, 670, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4095, 671, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4096, 672, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4097, 673, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4098, 674, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4099, 675, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4100, 676, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4101, 677, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4102, 678, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4103, 679, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4104, 680, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4105, 681, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4106, 682, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4107, 683, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4108, 684, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4109, 685, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4110, 686, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4111, 687, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4112, 688, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4113, 689, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4114, 690, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4115, 691, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4116, 692, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4117, 693, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4118, 694, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4119, 695, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4120, 696, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4121, 697, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4122, 698, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4123, 699, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4124, 700, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4125, 701, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4126, 702, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4127, 703, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4128, 704, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4129, 705, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4130, 706, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4131, 707, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4132, 708, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4133, 709, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4134, 710, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4135, 711, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4136, 712, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4137, 713, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4138, 714, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4139, 715, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4140, 716, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4141, 717, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4142, 718, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4143, 719, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4144, 720, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4145, 721, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4146, 722, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4147, 723, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4148, 724, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4149, 725, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4150, 726, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4151, 727, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4152, 728, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4153, 729, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4154, 730, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4155, 731, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4156, 642, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4157, 643, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4158, 644, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4159, 645, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4160, 646, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4161, 647, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4162, 648, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4163, 649, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4164, 650, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4165, 651, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4166, 190, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4167, 191, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4168, 192, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4169, 193, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4170, 194, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4171, 195, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4172, 196, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4173, 197, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4174, 198, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4175, 199, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4176, 200, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4177, 201, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4178, 202, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4179, 203, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4180, 204, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4181, 205, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4182, 206, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4183, 207, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4184, 208, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4185, 209, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4186, 210, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4187, 211, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4188, 212, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4189, 213, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4190, 214, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4191, 215, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4192, 216, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4193, 217, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4194, 218, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4195, 453, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4196, 576, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4197, 577, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4198, 578, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4199, 579, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4200, 454, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4201, 455, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4202, 457, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4203, 458, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4204, 459, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4205, 557, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4206, 465, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4207, 468, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4208, 558, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4209, 219, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4210, 220, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4211, 221, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4212, 222, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4213, 223, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4214, 224, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4215, 225, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4216, 226, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4217, 227, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4218, 228, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4219, 229, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4220, 230, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4221, 237, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4222, 238, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4223, 239, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4224, 240, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4225, 241, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4226, 242, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26'),
(4275, 700, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(4276, 701, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(4277, 702, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(4278, 703, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(4279, 704, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(4280, 705, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(4281, 706, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(4282, 707, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(4283, 708, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(4284, 709, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(4285, 710, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(4286, 711, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(4287, 712, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(4288, 713, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(4289, 714, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(4290, 715, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(4291, 716, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(4292, 717, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(4293, 718, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(4317, 547, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4318, 548, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4319, 549, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4320, 550, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4321, 551, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4322, 552, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4323, 623, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4324, 624, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4325, 625, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4326, 626, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4327, 627, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4328, 628, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4329, 629, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4330, 630, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4331, 631, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4332, 580, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4333, 581, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4334, 582, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4335, 583, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4336, 584, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4337, 585, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4338, 562, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4339, 563, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4340, 124, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4341, 130, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4342, 542, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4343, 543, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4344, 546, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4345, 131, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4346, 132, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4347, 133, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4348, 134, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4349, 139, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4350, 477, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4351, 478, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4352, 479, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4367, 152, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4368, 153, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4369, 154, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4370, 155, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4371, 156, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4372, 553, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4373, 554, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4374, 555, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4375, 556, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4376, 613, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4377, 614, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4378, 615, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4379, 616, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4380, 617, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4381, 618, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4382, 619, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4383, 620, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4384, 621, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4385, 622, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4386, 251, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4387, 252, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4388, 253, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4389, 254, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4390, 255, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4391, 256, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4392, 257, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4393, 598, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4394, 599, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4395, 600, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4396, 601, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4397, 602, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4398, 608, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4399, 609, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4400, 610, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4401, 611, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4402, 612, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4403, 603, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4404, 604, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4405, 605, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4406, 606, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4407, 561, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4408, 586, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4409, 587, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4410, 588, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4411, 589, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4412, 590, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4413, 591, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4414, 592, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4415, 593, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4416, 594, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4417, 595, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4418, 596, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4419, 597, 45, '2022-11-28 10:55:14', '2022-11-28 10:55:14'),
(4420, 92, 45, '2022-11-28 11:04:01', '2022-11-28 11:04:01'),
(4421, 107, 45, '2022-11-28 11:04:01', '2022-11-28 11:04:01'),
(4422, 566, 45, '2022-11-28 11:04:01', '2022-11-28 11:04:01'),
(4423, 567, 45, '2022-11-28 11:04:01', '2022-11-28 11:04:01'),
(4424, 99, 45, '2022-11-28 11:04:01', '2022-11-28 11:04:01'),
(4490, 580, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4491, 581, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4492, 582, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4493, 583, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4494, 584, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4495, 585, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4720, 547, 46, '2022-11-30 14:17:17', '2022-11-30 14:17:17'),
(4721, 548, 46, '2022-11-30 14:17:17', '2022-11-30 14:17:17'),
(4722, 549, 46, '2022-11-30 14:17:17', '2022-11-30 14:17:17'),
(4723, 550, 46, '2022-11-30 14:17:17', '2022-11-30 14:17:17'),
(4724, 625, 46, '2022-11-30 14:17:17', '2022-11-30 14:17:17'),
(4725, 626, 46, '2022-11-30 14:17:17', '2022-11-30 14:17:17'),
(4726, 627, 46, '2022-11-30 14:17:17', '2022-11-30 14:17:17'),
(4727, 628, 46, '2022-11-30 14:17:17', '2022-11-30 14:17:17'),
(4728, 124, 46, '2022-11-30 14:17:17', '2022-11-30 14:17:17'),
(4729, 130, 46, '2022-11-30 14:17:17', '2022-11-30 14:17:17'),
(4730, 542, 46, '2022-11-30 14:17:17', '2022-11-30 14:17:17'),
(4731, 543, 46, '2022-11-30 14:17:17', '2022-11-30 14:17:17'),
(4732, 237, 46, '2022-11-30 14:30:40', '2022-11-30 14:30:40'),
(4733, 238, 46, '2022-11-30 14:30:40', '2022-11-30 14:30:40'),
(4734, 239, 46, '2022-11-30 14:30:40', '2022-11-30 14:30:40'),
(4735, 251, 46, '2022-11-30 14:38:59', '2022-11-30 14:38:59'),
(4736, 252, 46, '2022-11-30 14:38:59', '2022-11-30 14:38:59'),
(4737, 253, 46, '2022-11-30 14:38:59', '2022-11-30 14:38:59'),
(4738, 254, 46, '2022-11-30 14:38:59', '2022-11-30 14:38:59'),
(4739, 598, 46, '2022-11-30 14:38:59', '2022-11-30 14:38:59'),
(4740, 603, 46, '2022-11-30 14:38:59', '2022-11-30 14:38:59'),
(4741, 1, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4742, 547, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4743, 548, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4744, 549, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4745, 550, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4746, 551, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4747, 552, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4748, 623, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4749, 624, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4750, 625, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4751, 626, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4752, 627, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4753, 628, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4754, 629, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4755, 630, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4756, 631, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4757, 580, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4758, 581, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4759, 582, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4760, 583, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4761, 584, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4762, 585, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4763, 562, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4764, 563, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4765, 124, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4766, 130, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4767, 542, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4768, 543, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4769, 546, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4770, 131, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4771, 132, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4772, 133, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4773, 134, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4774, 139, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4775, 477, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4776, 478, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4777, 479, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4778, 152, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4779, 153, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4780, 154, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4781, 155, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4782, 156, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4783, 553, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4784, 554, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4785, 555, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4786, 556, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4787, 190, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4788, 191, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4789, 192, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4790, 193, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4791, 194, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4792, 195, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4793, 196, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4794, 197, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4795, 198, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4796, 199, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4797, 200, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4798, 201, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4799, 202, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4800, 203, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4801, 453, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4802, 576, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4803, 577, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4804, 578, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4805, 579, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4806, 454, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4807, 455, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4808, 457, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4809, 458, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4810, 459, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4811, 557, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4812, 465, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4813, 468, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4814, 558, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4815, 219, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4816, 220, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4817, 221, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4818, 222, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4819, 223, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4820, 224, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4821, 225, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4822, 226, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4823, 227, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4824, 228, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4825, 229, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4826, 230, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4827, 237, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4828, 238, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4829, 239, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4830, 240, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4831, 241, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4832, 242, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4833, 613, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4834, 614, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4835, 615, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4836, 616, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4837, 617, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4838, 618, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4839, 619, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4840, 620, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4841, 621, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4842, 622, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4843, 251, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4844, 252, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4845, 253, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4846, 254, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4847, 255, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4848, 256, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4849, 257, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4850, 598, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4851, 599, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4852, 600, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4853, 601, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4854, 602, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4855, 608, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4856, 609, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4857, 610, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4858, 611, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4859, 612, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4860, 603, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4861, 604, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4862, 605, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4863, 606, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4864, 561, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4865, 586, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4866, 587, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4867, 588, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4868, 589, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4869, 590, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4870, 591, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4871, 592, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4872, 593, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4873, 594, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4874, 595, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4875, 596, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4876, 597, 47, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(4877, 107, 47, '2022-12-12 12:18:23', '2022-12-12 12:18:23'),
(4878, 566, 47, '2022-12-12 12:18:23', '2022-12-12 12:18:23'),
(4879, 567, 47, '2022-12-12 12:18:23', '2022-12-12 12:18:23'),
(4880, 99, 47, '2022-12-12 12:18:23', '2022-12-12 12:18:23'),
(4881, 58, 40, '2023-05-10 16:34:04', '2023-05-10 16:34:04'),
(4882, 59, 40, '2023-05-10 16:34:04', '2023-05-10 16:34:04'),
(4883, 63, 40, '2023-05-10 16:34:04', '2023-05-10 16:34:04'),
(4884, 64, 40, '2023-05-10 16:34:04', '2023-05-10 16:34:04'),
(4885, 65, 40, '2023-05-10 16:34:04', '2023-05-10 16:34:04'),
(4886, 67, 40, '2023-05-10 16:34:04', '2023-05-10 16:34:04'),
(4887, 70, 40, '2023-05-10 16:34:04', '2023-05-10 16:34:04'),
(4888, 71, 40, '2023-05-10 16:34:04', '2023-05-10 16:34:04'),
(4889, 564, 40, '2023-05-10 16:34:04', '2023-05-10 16:34:04'),
(4890, 565, 40, '2023-05-10 16:34:04', '2023-05-10 16:34:04'),
(4891, 73, 40, '2023-05-10 16:34:04', '2023-05-10 16:34:04'),
(4892, 74, 40, '2023-05-10 16:34:04', '2023-05-10 16:34:04'),
(4893, 75, 40, '2023-05-10 16:34:04', '2023-05-10 16:34:04'),
(4894, 76, 40, '2023-05-10 16:34:04', '2023-05-10 16:34:04'),
(4895, 77, 40, '2023-05-10 16:34:04', '2023-05-10 16:34:04'),
(4896, 78, 40, '2023-05-10 16:34:04', '2023-05-10 16:34:04'),
(4897, 79, 40, '2023-05-10 16:34:04', '2023-05-10 16:34:04'),
(4898, 572, 40, '2023-05-10 16:34:04', '2023-05-10 16:34:04'),
(4899, 573, 40, '2023-05-10 16:34:04', '2023-05-10 16:34:04'),
(4900, 574, 40, '2023-05-10 16:34:04', '2023-05-10 16:34:04'),
(4901, 575, 40, '2023-05-10 16:34:04', '2023-05-10 16:34:04'),
(4902, 641, 40, '2023-05-10 16:34:04', '2023-05-10 16:34:04'),
(4903, 805, 40, '2023-05-10 16:34:04', '2023-05-10 16:34:04'),
(4914, 80, 48, '2023-05-14 16:22:19', '2023-05-14 16:22:19'),
(4915, 81, 48, '2023-05-14 16:22:19', '2023-05-14 16:22:19'),
(4916, 85, 48, '2023-05-14 16:22:19', '2023-05-14 16:22:19'),
(4917, 92, 48, '2023-05-14 16:22:19', '2023-05-14 16:22:19'),
(4918, 93, 48, '2023-05-14 16:22:19', '2023-05-14 16:22:19'),
(4919, 95, 48, '2023-05-14 16:22:19', '2023-05-14 16:22:19'),
(4920, 98, 48, '2023-05-14 16:22:19', '2023-05-14 16:22:19'),
(4931, 73, 49, '2023-05-16 19:29:17', '2023-05-16 19:29:17'),
(4932, 74, 49, '2023-05-16 19:29:17', '2023-05-16 19:29:17');
INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`, `created_at`, `updated_at`) VALUES
(4933, 76, 49, '2023-05-16 19:29:17', '2023-05-16 19:29:17'),
(4934, 79, 49, '2023-05-16 19:29:17', '2023-05-16 19:29:17'),
(4935, 572, 49, '2023-05-16 19:29:17', '2023-05-16 19:29:17'),
(4936, 574, 49, '2023-05-16 19:29:17', '2023-05-16 19:29:17'),
(4937, 641, 49, '2023-05-16 19:29:17', '2023-05-16 19:29:17'),
(4938, 547, 50, '2023-05-16 19:33:23', '2023-05-16 19:33:23'),
(4939, 548, 50, '2023-05-16 19:33:23', '2023-05-16 19:33:23'),
(4940, 549, 50, '2023-05-16 19:33:23', '2023-05-16 19:33:23'),
(4941, 550, 50, '2023-05-16 19:33:23', '2023-05-16 19:33:23'),
(4942, 551, 50, '2023-05-16 19:33:23', '2023-05-16 19:33:23'),
(4943, 552, 50, '2023-05-16 19:33:23', '2023-05-16 19:33:23'),
(4944, 623, 50, '2023-05-16 19:33:23', '2023-05-16 19:33:23'),
(4945, 624, 50, '2023-05-16 19:33:23', '2023-05-16 19:33:23'),
(4946, 805, 39, '2023-05-16 19:45:28', '2023-05-16 19:45:28'),
(4947, 806, 39, '2023-05-16 19:45:28', '2023-05-16 19:45:28'),
(4948, 804, 39, '2023-05-16 19:45:28', '2023-05-16 19:45:28'),
(4949, 803, 39, '2023-05-16 19:45:28', '2023-05-16 19:45:28'),
(4950, 802, 39, '2023-05-16 19:45:28', '2023-05-16 19:45:28'),
(4951, 592, 39, '2023-05-16 19:45:28', '2023-05-16 19:45:28'),
(4952, 593, 39, '2023-05-16 19:45:28', '2023-05-16 19:45:28'),
(4953, 594, 39, '2023-05-16 19:45:28', '2023-05-16 19:45:28'),
(4954, 595, 39, '2023-05-16 19:45:28', '2023-05-16 19:45:28'),
(4955, 596, 39, '2023-05-16 19:45:28', '2023-05-16 19:45:28'),
(4956, 597, 39, '2023-05-16 19:45:28', '2023-05-16 19:45:28'),
(4957, 107, 48, '2023-05-17 19:31:14', '2023-05-17 19:31:14'),
(4958, 547, 39, '2023-05-31 04:56:57', '2023-05-31 04:56:57'),
(4959, 548, 39, '2023-05-31 04:56:57', '2023-05-31 04:56:57'),
(4960, 549, 39, '2023-05-31 04:56:57', '2023-05-31 04:56:57'),
(4961, 550, 39, '2023-05-31 04:56:57', '2023-05-31 04:56:57'),
(4962, 551, 39, '2023-05-31 04:56:57', '2023-05-31 04:56:57'),
(4963, 552, 39, '2023-05-31 04:56:57', '2023-05-31 04:56:57'),
(4964, 623, 39, '2023-05-31 04:56:57', '2023-05-31 04:56:57'),
(4965, 624, 39, '2023-05-31 04:56:57', '2023-05-31 04:56:57'),
(4966, 807, 39, '2023-05-31 04:56:57', '2023-05-31 04:56:57'),
(4967, 808, 39, '2023-05-31 04:56:57', '2023-05-31 04:56:57'),
(4968, 809, 39, '2023-05-31 04:56:57', '2023-05-31 04:56:57'),
(4969, 810, 39, '2023-05-31 04:56:57', '2023-05-31 04:56:57'),
(4970, 811, 39, '2023-05-31 04:56:57', '2023-05-31 04:56:57'),
(4971, 812, 39, '2023-05-31 04:56:57', '2023-05-31 04:56:57'),
(4972, 80, 39, '2023-05-31 04:58:58', '2023-05-31 04:58:58'),
(4973, 81, 39, '2023-05-31 04:58:58', '2023-05-31 04:58:58'),
(4974, 82, 39, '2023-05-31 04:58:58', '2023-05-31 04:58:58'),
(4975, 83, 39, '2023-05-31 04:58:58', '2023-05-31 04:58:58'),
(4976, 84, 39, '2023-05-31 04:58:58', '2023-05-31 04:58:58'),
(4977, 85, 39, '2023-05-31 04:58:58', '2023-05-31 04:58:58'),
(4978, 92, 39, '2023-05-31 04:58:58', '2023-05-31 04:58:58'),
(4979, 93, 39, '2023-05-31 04:58:58', '2023-05-31 04:58:58'),
(4980, 94, 39, '2023-05-31 04:58:58', '2023-05-31 04:58:58'),
(4981, 95, 39, '2023-05-31 04:58:58', '2023-05-31 04:58:58'),
(4982, 96, 39, '2023-05-31 04:58:58', '2023-05-31 04:58:58'),
(4983, 97, 39, '2023-05-31 04:58:58', '2023-05-31 04:58:58'),
(4984, 98, 39, '2023-05-31 04:58:58', '2023-05-31 04:58:58'),
(4985, 99, 39, '2023-05-31 04:58:58', '2023-05-31 04:58:58'),
(4986, 1, 51, '2023-05-31 05:04:18', '2023-05-31 05:04:18'),
(4987, 547, 51, '2023-05-31 05:04:18', '2023-05-31 05:04:18'),
(4988, 548, 51, '2023-05-31 05:04:18', '2023-05-31 05:04:18'),
(4989, 549, 51, '2023-05-31 05:04:18', '2023-05-31 05:04:18'),
(4990, 550, 51, '2023-05-31 05:04:18', '2023-05-31 05:04:18'),
(4991, 551, 51, '2023-05-31 05:04:18', '2023-05-31 05:04:18'),
(4992, 552, 51, '2023-05-31 05:04:18', '2023-05-31 05:04:18'),
(4993, 623, 51, '2023-05-31 05:04:18', '2023-05-31 05:04:18'),
(4994, 624, 51, '2023-05-31 05:04:18', '2023-05-31 05:04:18'),
(4995, 807, 51, '2023-05-31 05:04:18', '2023-05-31 05:04:18'),
(4996, 808, 51, '2023-05-31 05:04:18', '2023-05-31 05:04:18'),
(4997, 809, 51, '2023-05-31 05:04:18', '2023-05-31 05:04:18'),
(4998, 810, 51, '2023-05-31 05:04:18', '2023-05-31 05:04:18'),
(4999, 811, 51, '2023-05-31 05:04:18', '2023-05-31 05:04:18'),
(5000, 812, 51, '2023-05-31 05:04:18', '2023-05-31 05:04:18'),
(5001, 586, 51, '2023-05-31 05:07:09', '2023-05-31 05:07:09'),
(5002, 587, 51, '2023-05-31 05:07:09', '2023-05-31 05:07:09'),
(5003, 588, 51, '2023-05-31 05:07:09', '2023-05-31 05:07:09'),
(5004, 589, 51, '2023-05-31 05:07:09', '2023-05-31 05:07:09'),
(5005, 590, 51, '2023-05-31 05:07:09', '2023-05-31 05:07:09'),
(5006, 591, 51, '2023-05-31 05:07:09', '2023-05-31 05:07:09'),
(5007, 592, 51, '2023-05-31 05:07:09', '2023-05-31 05:07:09'),
(5008, 593, 51, '2023-05-31 05:07:09', '2023-05-31 05:07:09'),
(5009, 594, 51, '2023-05-31 05:07:09', '2023-05-31 05:07:09'),
(5010, 595, 51, '2023-05-31 05:07:09', '2023-05-31 05:07:09'),
(5011, 596, 51, '2023-05-31 05:07:09', '2023-05-31 05:07:09'),
(5012, 597, 51, '2023-05-31 05:07:09', '2023-05-31 05:07:09');

-- --------------------------------------------------------

--
-- Table structure for table `personal_events`
--

CREATE TABLE `personal_events` (
  `id` bigint UNSIGNED NOT NULL,
  `created_by` int NOT NULL,
  `personal_event` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_event_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `publication_status` tinyint NOT NULL,
  `deletion_status` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `productions`
--

CREATE TABLE `productions` (
  `id` bigint UNSIGNED NOT NULL,
  `batch_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouse_id` bigint UNSIGNED NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `item` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=Approved, 2=Pending,3=Rejevted',
  `production_status` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Pending,2=Processing,3=Finished',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `productions`
--

INSERT INTO `productions` (`id`, `batch_no`, `warehouse_id`, `start_date`, `end_date`, `item`, `status`, `production_status`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(3, '1003', 5, '2023-05-21', '2023-07-08', '1', '1', '3', 'Super Admin', 'Super Admin', '2023-05-21 09:42:09', '2023-05-21 09:42:55'),
(6, '1004', 5, '2023-09-09', '2023-05-27', '1', '1', '3', 'Super Admin', 'Super Admin', '2023-05-27 06:02:12', '2023-05-27 06:02:46'),
(7, '1005', 5, '2023-06-04', NULL, '1', '1', '2', 'Super Admin', 'Super Admin', '2023-06-04 08:16:41', '2023-06-03 18:00:00'),
(8, '1006', 5, '2023-06-05', NULL, '1', '2', '1', 'Super Admin', NULL, '2023-06-05 03:36:31', '2023-06-05 03:36:31'),
(9, '1007', 5, '2023-06-05', NULL, '1', '1', '2', 'Super Admin', 'Super Admin', '2023-06-05 04:17:51', '2023-06-04 18:00:00'),
(10, '1008', 5, '2023-06-05', NULL, '1', '1', '2', 'Super Admin', 'Super Admin', '2023-06-05 04:25:08', '2023-06-04 18:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `production_products`
--

CREATE TABLE `production_products` (
  `id` bigint UNSIGNED NOT NULL,
  `production_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `year` int NOT NULL,
  `mfg_date` date NOT NULL,
  `exp_date` date NOT NULL,
  `labor_cost` bigint DEFAULT NULL,
  `other_cost` bigint DEFAULT NULL,
  `sub_total` double DEFAULT NULL,
  `base_unit_qty` double DEFAULT NULL,
  `per_unit_cost` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `production_products`
--

INSERT INTO `production_products` (`id`, `production_id`, `product_id`, `year`, `mfg_date`, `exp_date`, `labor_cost`, `other_cost`, `sub_total`, `base_unit_qty`, `per_unit_cost`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 0, '2023-05-14', '2023-05-14', NULL, NULL, NULL, 3, NULL, '2023-05-14 17:08:30', '2023-05-14 17:08:30'),
(2, 2, 1, 0, '2023-05-15', '2023-05-15', NULL, NULL, NULL, 100, NULL, '2023-05-15 10:46:08', '2023-05-15 10:46:08'),
(3, 3, 8, 2, '2023-05-21', '2023-07-08', NULL, NULL, NULL, 1, 19987, '2023-05-21 09:42:09', '2023-05-21 09:42:50'),
(4, 4, 8, 3, '2023-05-27', '2023-08-05', NULL, NULL, NULL, 10, NULL, '2023-05-27 05:14:11', '2023-05-27 05:14:11'),
(5, 5, 8, 2, '2023-05-27', '2023-07-27', NULL, NULL, NULL, 10, NULL, '2023-05-27 05:52:22', '2023-05-27 05:52:22'),
(6, 6, 8, 0, '2023-05-27', '2023-05-27', NULL, NULL, NULL, 5, 999.35, '2023-05-27 06:02:12', '2023-05-27 06:02:41'),
(7, 7, 8, 0, '2023-06-04', '2023-06-04', NULL, NULL, NULL, 10, NULL, '2023-06-04 08:16:41', '2023-06-04 08:16:41'),
(8, 8, 8, 0, '2023-06-05', '2023-06-05', NULL, NULL, NULL, 2, NULL, '2023-06-05 03:36:31', '2023-06-05 03:36:31'),
(9, 9, 9, 5, '2023-06-05', '2023-11-10', NULL, NULL, NULL, 20, NULL, '2023-06-05 04:17:51', '2023-06-05 04:17:51'),
(10, 10, 9, 4, '2023-06-05', '2023-10-07', NULL, NULL, NULL, 10, NULL, '2023-06-05 04:25:08', '2023-06-05 04:25:08');

-- --------------------------------------------------------

--
-- Table structure for table `production_product_materials`
--

CREATE TABLE `production_product_materials` (
  `id` bigint UNSIGNED NOT NULL,
  `production_product_id` bigint UNSIGNED NOT NULL,
  `material_id` bigint UNSIGNED NOT NULL,
  `unit_id` bigint UNSIGNED NOT NULL,
  `qty` double(8,2) DEFAULT NULL,
  `cost` double(8,2) DEFAULT NULL,
  `total` double(8,2) DEFAULT NULL,
  `used_qty` double(8,2) DEFAULT NULL,
  `damaged_qty` double(8,2) DEFAULT NULL,
  `odd_qty` double(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `production_product_materials`
--

INSERT INTO `production_product_materials` (`id`, `production_product_id`, `material_id`, `unit_id`, `qty`, `cost`, `total`, `used_qty`, `damaged_qty`, `odd_qty`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 2, 1.80, 25.78, 46.41, 1.80, NULL, NULL, '2023-05-14 17:08:30', '2023-05-14 17:08:30'),
(2, 1, 2, 2, 0.60, 0.00, 0.00, 0.60, NULL, NULL, '2023-05-14 17:08:30', '2023-05-14 17:08:30'),
(3, 1, 3, 10, 0.60, 0.00, 0.00, 0.60, NULL, NULL, '2023-05-14 17:08:30', '2023-05-14 17:08:30'),
(4, 2, 1, 2, 60.00, 25.78, 1546.88, 60.00, NULL, NULL, '2023-05-15 10:46:08', '2023-05-15 10:46:08'),
(5, 2, 2, 2, 20.00, 0.00, 0.00, 20.00, NULL, NULL, '2023-05-15 10:46:08', '2023-05-15 10:46:08'),
(6, 2, 3, 10, 20.00, 0.00, 0.00, 20.00, NULL, NULL, '2023-05-15 10:46:08', '2023-05-15 10:46:08'),
(7, 3, 4, 2, 519.50, 20.00, 10390.00, 519.50, NULL, NULL, '2023-05-21 09:42:09', '2023-05-21 09:42:09'),
(8, 3, 26, 2, 265.00, 20.00, 5300.00, 265.00, NULL, NULL, '2023-05-21 09:42:09', '2023-05-21 09:42:09'),
(9, 3, 11, 2, 55.00, 20.00, 1100.00, 55.00, NULL, NULL, '2023-05-21 09:42:09', '2023-05-21 09:42:09'),
(10, 3, 23, 2, 45.00, 20.00, 900.00, 45.00, NULL, NULL, '2023-05-21 09:42:09', '2023-05-21 09:42:09'),
(11, 3, 18, 2, 30.00, 20.00, 600.00, 30.00, NULL, NULL, '2023-05-21 09:42:09', '2023-05-21 09:42:09'),
(12, 3, 12, 2, 25.00, 20.00, 500.00, 25.00, NULL, NULL, '2023-05-21 09:42:09', '2023-05-21 09:42:09'),
(13, 3, 38, 10, 20.00, 20.00, 400.00, 20.00, NULL, NULL, '2023-05-21 09:42:09', '2023-05-21 09:42:09'),
(14, 3, 29, 2, 18.00, 20.00, 360.00, 18.00, NULL, NULL, '2023-05-21 09:42:09', '2023-05-21 09:42:09'),
(15, 3, 33, 2, 6.00, 20.00, 120.00, 6.00, NULL, NULL, '2023-05-21 09:42:09', '2023-05-21 09:42:09'),
(16, 3, 41, 2, 3.00, 20.00, 60.00, 3.00, NULL, NULL, '2023-05-21 09:42:09', '2023-05-21 09:42:09'),
(17, 3, 52, 2, 2.50, 20.00, 50.00, 2.50, NULL, NULL, '2023-05-21 09:42:09', '2023-05-21 09:42:09'),
(18, 3, 42, 2, 2.00, 20.00, 40.00, 2.00, NULL, NULL, '2023-05-21 09:42:09', '2023-05-21 09:42:09'),
(19, 3, 51, 2, 1.00, 20.00, 20.00, 1.00, NULL, NULL, '2023-05-21 09:42:09', '2023-05-21 09:42:09'),
(20, 3, 53, 2, 1.00, 20.00, 20.00, 1.00, NULL, NULL, '2023-05-21 09:42:09', '2023-05-21 09:42:09'),
(21, 3, 37, 10, 0.50, 20.00, 10.00, 0.50, NULL, NULL, '2023-05-21 09:42:09', '2023-05-21 09:42:09'),
(22, 3, 43, 2, 0.50, 20.00, 10.00, 0.50, NULL, NULL, '2023-05-21 09:42:09', '2023-05-21 09:42:09'),
(23, 3, 50, 2, 0.50, 20.00, 10.00, 0.50, NULL, NULL, '2023-05-21 09:42:09', '2023-05-21 09:42:09'),
(24, 3, 76, 2, 0.50, 0.00, 0.00, 0.50, NULL, NULL, '2023-05-21 09:42:09', '2023-05-21 09:42:09'),
(25, 3, 85, 2, 0.50, 20.00, 10.00, 0.50, NULL, NULL, '2023-05-21 09:42:09', '2023-05-21 09:42:09'),
(26, 3, 90, 2, 0.50, 20.00, 10.00, 0.50, NULL, NULL, '2023-05-21 09:42:09', '2023-05-21 09:42:09'),
(27, 3, 58, 2, 0.50, 20.00, 10.00, 0.50, NULL, NULL, '2023-05-21 09:42:09', '2023-05-21 09:42:09'),
(28, 3, 59, 2, 0.50, 20.00, 10.00, 0.50, NULL, NULL, '2023-05-21 09:42:09', '2023-05-21 09:42:09'),
(29, 3, 65, 2, 0.50, 20.00, 10.00, 0.50, NULL, NULL, '2023-05-21 09:42:09', '2023-05-21 09:42:09'),
(30, 3, 66, 2, 0.50, 20.00, 10.00, 0.50, NULL, NULL, '2023-05-21 09:42:09', '2023-05-21 09:42:09'),
(31, 3, 80, 2, 0.25, 20.00, 5.00, 0.25, NULL, NULL, '2023-05-21 09:42:09', '2023-05-21 09:42:09'),
(32, 3, 55, 2, 0.25, 20.00, 5.00, 0.25, NULL, NULL, '2023-05-21 09:42:09', '2023-05-21 09:42:09'),
(33, 3, 61, 2, 0.25, 20.00, 5.00, 0.25, NULL, NULL, '2023-05-21 09:42:09', '2023-05-21 09:42:09'),
(34, 3, 64, 2, 0.25, 20.00, 5.00, 0.25, NULL, NULL, '2023-05-21 09:42:09', '2023-05-21 09:42:09'),
(35, 3, 71, 2, 0.25, 20.00, 5.00, 0.25, NULL, NULL, '2023-05-21 09:42:09', '2023-05-21 09:42:09'),
(36, 3, 89, 2, 0.20, 20.00, 4.00, 0.20, NULL, NULL, '2023-05-21 09:42:09', '2023-05-21 09:42:09'),
(37, 3, 86, 2, 0.15, 0.00, 0.00, 0.15, NULL, NULL, '2023-05-21 09:42:09', '2023-05-21 09:42:09'),
(38, 3, 57, 2, 0.15, 20.00, 3.00, 0.15, NULL, NULL, '2023-05-21 09:42:09', '2023-05-21 09:42:09'),
(39, 3, 84, 2, 0.10, 20.00, 2.00, 0.10, NULL, NULL, '2023-05-21 09:42:09', '2023-05-21 09:42:09'),
(40, 3, 70, 2, 0.10, 20.00, 2.00, 0.10, NULL, NULL, '2023-05-21 09:42:09', '2023-05-21 09:42:09'),
(41, 3, 63, 2, 0.05, 20.00, 1.00, 0.05, NULL, NULL, '2023-05-21 09:42:09', '2023-05-21 09:42:09'),
(42, 4, 4, 2, 259.50, 20.00, 5190.00, 259.50, NULL, NULL, '2023-05-27 05:14:11', '2023-05-27 05:14:11'),
(43, 4, 26, 2, 132.50, 20.00, 2650.00, 132.50, NULL, NULL, '2023-05-27 05:14:11', '2023-05-27 05:14:11'),
(44, 4, 11, 2, 27.50, 20.00, 550.00, 27.50, NULL, NULL, '2023-05-27 05:14:11', '2023-05-27 05:14:11'),
(45, 4, 23, 2, 22.50, 20.00, 450.00, 22.50, NULL, NULL, '2023-05-27 05:14:11', '2023-05-27 05:14:11'),
(46, 4, 18, 2, 15.00, 20.00, 300.00, 15.00, NULL, NULL, '2023-05-27 05:14:11', '2023-05-27 05:14:11'),
(47, 4, 12, 2, 12.50, 20.00, 250.00, 12.50, NULL, NULL, '2023-05-27 05:14:11', '2023-05-27 05:14:11'),
(48, 4, 38, 10, 10.00, 20.00, 200.00, 10.00, NULL, NULL, '2023-05-27 05:14:11', '2023-05-27 05:14:11'),
(49, 4, 29, 2, 9.00, 20.00, 180.00, 9.00, NULL, NULL, '2023-05-27 05:14:11', '2023-05-27 05:14:11'),
(50, 4, 33, 2, 3.00, 20.00, 60.00, 3.00, NULL, NULL, '2023-05-27 05:14:11', '2023-05-27 05:14:11'),
(51, 4, 41, 2, 1.50, 20.00, 30.00, 1.50, NULL, NULL, '2023-05-27 05:14:11', '2023-05-27 05:14:11'),
(52, 4, 52, 2, 1.25, 20.00, 25.00, 1.25, NULL, NULL, '2023-05-27 05:14:11', '2023-05-27 05:14:11'),
(53, 4, 42, 2, 1.00, 20.00, 20.00, 1.00, NULL, NULL, '2023-05-27 05:14:11', '2023-05-27 05:14:11'),
(54, 4, 51, 2, 0.50, 20.00, 10.00, 0.50, NULL, NULL, '2023-05-27 05:14:11', '2023-05-27 05:14:11'),
(55, 4, 53, 2, 0.50, 20.00, 10.00, 0.50, NULL, NULL, '2023-05-27 05:14:11', '2023-05-27 05:14:11'),
(56, 4, 37, 10, 0.25, 20.00, 5.00, 0.25, NULL, NULL, '2023-05-27 05:14:11', '2023-05-27 05:14:11'),
(57, 4, 43, 2, 0.25, 20.00, 5.00, 0.25, NULL, NULL, '2023-05-27 05:14:11', '2023-05-27 05:14:11'),
(58, 4, 50, 2, 0.25, 20.00, 5.00, 0.25, NULL, NULL, '2023-05-27 05:14:11', '2023-05-27 05:14:11'),
(59, 4, 76, 2, 0.25, 0.00, 0.00, 0.25, NULL, NULL, '2023-05-27 05:14:11', '2023-05-27 05:14:11'),
(60, 4, 85, 2, 0.25, 20.00, 5.00, 0.25, NULL, NULL, '2023-05-27 05:14:11', '2023-05-27 05:14:11'),
(61, 4, 90, 2, 0.25, 20.00, 5.00, 0.25, NULL, NULL, '2023-05-27 05:14:11', '2023-05-27 05:14:11'),
(62, 4, 58, 2, 0.25, 20.00, 5.00, 0.25, NULL, NULL, '2023-05-27 05:14:11', '2023-05-27 05:14:11'),
(63, 4, 59, 2, 0.25, 20.00, 5.00, 0.25, NULL, NULL, '2023-05-27 05:14:11', '2023-05-27 05:14:11'),
(64, 4, 65, 2, 0.25, 20.00, 5.00, 0.25, NULL, NULL, '2023-05-27 05:14:11', '2023-05-27 05:14:11'),
(65, 4, 66, 2, 0.25, 20.00, 5.00, 0.25, NULL, NULL, '2023-05-27 05:14:11', '2023-05-27 05:14:11'),
(66, 4, 80, 2, 0.12, 20.00, 2.50, 0.12, NULL, NULL, '2023-05-27 05:14:11', '2023-05-27 05:14:11'),
(67, 4, 55, 2, 0.12, 20.00, 2.50, 0.12, NULL, NULL, '2023-05-27 05:14:11', '2023-05-27 05:14:11'),
(68, 4, 61, 2, 0.12, 20.00, 2.50, 0.12, NULL, NULL, '2023-05-27 05:14:11', '2023-05-27 05:14:11'),
(69, 4, 64, 2, 0.12, 20.00, 2.50, 0.12, NULL, NULL, '2023-05-27 05:14:11', '2023-05-27 05:14:11'),
(70, 4, 71, 2, 0.12, 20.00, 2.50, 0.12, NULL, NULL, '2023-05-27 05:14:11', '2023-05-27 05:14:11'),
(71, 4, 89, 2, 0.10, 20.00, 2.00, 0.10, NULL, NULL, '2023-05-27 05:14:11', '2023-05-27 05:14:11'),
(72, 4, 86, 2, 0.08, 0.00, 0.00, 0.08, NULL, NULL, '2023-05-27 05:14:11', '2023-05-27 05:14:11'),
(73, 4, 57, 2, 0.08, 20.00, 1.50, 0.08, NULL, NULL, '2023-05-27 05:14:11', '2023-05-27 05:14:11'),
(74, 4, 84, 2, 0.05, 20.00, 1.00, 0.05, NULL, NULL, '2023-05-27 05:14:11', '2023-05-27 05:14:11'),
(75, 4, 70, 2, 0.05, 20.00, 1.00, 0.05, NULL, NULL, '2023-05-27 05:14:11', '2023-05-27 05:14:11'),
(76, 4, 63, 2, 0.28, 20.00, 5.50, 0.28, NULL, NULL, '2023-05-27 05:14:11', '2023-05-27 05:14:11'),
(77, 5, 4, 2, 259.50, 20.00, 5190.00, 259.50, NULL, NULL, '2023-05-27 05:52:22', '2023-05-27 05:52:22'),
(78, 5, 26, 2, 132.50, 20.00, 2650.00, 132.50, NULL, NULL, '2023-05-27 05:52:22', '2023-05-27 05:52:22'),
(79, 5, 11, 2, 27.50, 20.00, 550.00, 27.50, NULL, NULL, '2023-05-27 05:52:22', '2023-05-27 05:52:22'),
(80, 5, 23, 2, 22.50, 20.00, 450.00, 22.50, NULL, NULL, '2023-05-27 05:52:22', '2023-05-27 05:52:22'),
(81, 5, 18, 2, 15.00, 20.00, 300.00, 15.00, NULL, NULL, '2023-05-27 05:52:22', '2023-05-27 05:52:22'),
(82, 5, 12, 2, 12.50, 20.00, 250.00, 12.50, NULL, NULL, '2023-05-27 05:52:22', '2023-05-27 05:52:22'),
(83, 5, 38, 10, 10.00, 20.00, 200.00, 10.00, NULL, NULL, '2023-05-27 05:52:22', '2023-05-27 05:52:22'),
(84, 5, 29, 2, 9.00, 20.00, 180.00, 9.00, NULL, NULL, '2023-05-27 05:52:22', '2023-05-27 05:52:22'),
(85, 5, 33, 2, 3.00, 20.00, 60.00, 3.00, NULL, NULL, '2023-05-27 05:52:22', '2023-05-27 05:52:22'),
(86, 5, 41, 2, 1.50, 20.00, 30.00, 1.50, NULL, NULL, '2023-05-27 05:52:22', '2023-05-27 05:52:22'),
(87, 5, 52, 2, 1.25, 20.00, 25.00, 1.25, NULL, NULL, '2023-05-27 05:52:22', '2023-05-27 05:52:22'),
(88, 5, 42, 2, 1.00, 20.00, 20.00, 1.00, NULL, NULL, '2023-05-27 05:52:22', '2023-05-27 05:52:22'),
(89, 5, 51, 2, 0.50, 20.00, 10.00, 0.50, NULL, NULL, '2023-05-27 05:52:22', '2023-05-27 05:52:22'),
(90, 5, 53, 2, 0.50, 20.00, 10.00, 0.50, NULL, NULL, '2023-05-27 05:52:22', '2023-05-27 05:52:22'),
(91, 5, 37, 10, 0.25, 20.00, 5.00, 0.25, NULL, NULL, '2023-05-27 05:52:22', '2023-05-27 05:52:22'),
(92, 5, 43, 2, 0.25, 20.00, 5.00, 0.25, NULL, NULL, '2023-05-27 05:52:22', '2023-05-27 05:52:22'),
(93, 5, 50, 2, 0.25, 20.00, 5.00, 0.25, NULL, NULL, '2023-05-27 05:52:22', '2023-05-27 05:52:22'),
(94, 5, 76, 2, 0.25, 0.00, 0.00, 0.25, NULL, NULL, '2023-05-27 05:52:22', '2023-05-27 05:52:22'),
(95, 5, 85, 2, 0.25, 20.00, 5.00, 0.25, NULL, NULL, '2023-05-27 05:52:22', '2023-05-27 05:52:22'),
(96, 5, 90, 2, 0.25, 20.00, 5.00, 0.25, NULL, NULL, '2023-05-27 05:52:22', '2023-05-27 05:52:22'),
(97, 5, 58, 2, 0.25, 20.00, 5.00, 0.25, NULL, NULL, '2023-05-27 05:52:22', '2023-05-27 05:52:22'),
(98, 5, 59, 2, 0.25, 20.00, 5.00, 0.25, NULL, NULL, '2023-05-27 05:52:22', '2023-05-27 05:52:22'),
(99, 5, 65, 2, 0.25, 20.00, 5.00, 0.25, NULL, NULL, '2023-05-27 05:52:22', '2023-05-27 05:52:22'),
(100, 5, 66, 2, 0.25, 20.00, 5.00, 0.25, NULL, NULL, '2023-05-27 05:52:22', '2023-05-27 05:52:22'),
(101, 5, 80, 2, 0.12, 20.00, 2.50, 0.12, NULL, NULL, '2023-05-27 05:52:22', '2023-05-27 05:52:22'),
(102, 5, 55, 2, 0.12, 20.00, 2.50, 0.12, NULL, NULL, '2023-05-27 05:52:22', '2023-05-27 05:52:22'),
(103, 5, 61, 2, 0.12, 20.00, 2.50, 0.12, NULL, NULL, '2023-05-27 05:52:22', '2023-05-27 05:52:22'),
(104, 5, 64, 2, 0.12, 20.00, 2.50, 0.12, NULL, NULL, '2023-05-27 05:52:22', '2023-05-27 05:52:22'),
(105, 5, 71, 2, 0.12, 20.00, 2.50, 0.12, NULL, NULL, '2023-05-27 05:52:22', '2023-05-27 05:52:22'),
(106, 5, 89, 2, 0.10, 20.00, 2.00, 0.10, NULL, NULL, '2023-05-27 05:52:22', '2023-05-27 05:52:22'),
(107, 5, 86, 2, 0.08, 0.00, 0.00, 0.08, NULL, NULL, '2023-05-27 05:52:22', '2023-05-27 05:52:22'),
(108, 5, 57, 2, 0.08, 20.00, 1.50, 0.08, NULL, NULL, '2023-05-27 05:52:22', '2023-05-27 05:52:22'),
(109, 5, 84, 2, 0.05, 20.00, 1.00, 0.05, NULL, NULL, '2023-05-27 05:52:22', '2023-05-27 05:52:22'),
(110, 5, 70, 2, 0.05, 20.00, 1.00, 0.05, NULL, NULL, '2023-05-27 05:52:22', '2023-05-27 05:52:22'),
(111, 5, 63, 2, 0.28, 20.00, 5.50, 0.28, NULL, NULL, '2023-05-27 05:52:22', '2023-05-27 05:52:22'),
(112, 6, 4, 2, 129.75, 20.00, 2595.00, 129.75, NULL, NULL, '2023-05-27 06:02:12', '2023-05-27 06:02:12'),
(113, 6, 26, 2, 66.25, 20.00, 1325.00, 66.25, NULL, NULL, '2023-05-27 06:02:12', '2023-05-27 06:02:12'),
(114, 6, 11, 2, 13.75, 20.00, 275.00, 13.75, NULL, NULL, '2023-05-27 06:02:12', '2023-05-27 06:02:12'),
(115, 6, 23, 2, 11.25, 20.00, 225.00, 11.25, NULL, NULL, '2023-05-27 06:02:12', '2023-05-27 06:02:12'),
(116, 6, 18, 2, 7.50, 20.00, 150.00, 7.50, NULL, NULL, '2023-05-27 06:02:12', '2023-05-27 06:02:12'),
(117, 6, 12, 2, 6.25, 20.00, 125.00, 6.25, NULL, NULL, '2023-05-27 06:02:12', '2023-05-27 06:02:12'),
(118, 6, 38, 10, 5.00, 20.00, 100.00, 5.00, NULL, NULL, '2023-05-27 06:02:12', '2023-05-27 06:02:12'),
(119, 6, 29, 2, 4.50, 20.00, 90.00, 4.50, NULL, NULL, '2023-05-27 06:02:12', '2023-05-27 06:02:12'),
(120, 6, 33, 2, 1.50, 20.00, 30.00, 1.50, NULL, NULL, '2023-05-27 06:02:12', '2023-05-27 06:02:12'),
(121, 6, 41, 2, 0.75, 20.00, 15.00, 0.75, NULL, NULL, '2023-05-27 06:02:12', '2023-05-27 06:02:12'),
(122, 6, 52, 2, 0.62, 20.00, 12.50, 0.62, NULL, NULL, '2023-05-27 06:02:12', '2023-05-27 06:02:12'),
(123, 6, 42, 2, 0.50, 20.00, 10.00, 0.50, NULL, NULL, '2023-05-27 06:02:12', '2023-05-27 06:02:12'),
(124, 6, 51, 2, 0.25, 20.00, 5.00, 0.25, NULL, NULL, '2023-05-27 06:02:12', '2023-05-27 06:02:12'),
(125, 6, 53, 2, 0.25, 20.00, 5.00, 0.25, NULL, NULL, '2023-05-27 06:02:12', '2023-05-27 06:02:12'),
(126, 6, 37, 10, 0.12, 20.00, 2.50, 0.12, NULL, NULL, '2023-05-27 06:02:12', '2023-05-27 06:02:12'),
(127, 6, 43, 2, 0.12, 20.00, 2.50, 0.12, NULL, NULL, '2023-05-27 06:02:12', '2023-05-27 06:02:12'),
(128, 6, 50, 2, 0.12, 20.00, 2.50, 0.12, NULL, NULL, '2023-05-27 06:02:12', '2023-05-27 06:02:12'),
(129, 6, 76, 2, 0.12, 0.00, 0.00, 0.12, NULL, NULL, '2023-05-27 06:02:12', '2023-05-27 06:02:12'),
(130, 6, 85, 2, 0.12, 20.00, 2.50, 0.12, NULL, NULL, '2023-05-27 06:02:12', '2023-05-27 06:02:12'),
(131, 6, 90, 2, 0.12, 20.00, 2.50, 0.12, NULL, NULL, '2023-05-27 06:02:12', '2023-05-27 06:02:12'),
(132, 6, 58, 2, 0.12, 20.00, 2.50, 0.12, NULL, NULL, '2023-05-27 06:02:12', '2023-05-27 06:02:12'),
(133, 6, 59, 2, 0.12, 20.00, 2.50, 0.12, NULL, NULL, '2023-05-27 06:02:12', '2023-05-27 06:02:12'),
(134, 6, 65, 2, 0.12, 20.00, 2.50, 0.12, NULL, NULL, '2023-05-27 06:02:12', '2023-05-27 06:02:12'),
(135, 6, 66, 2, 0.12, 20.00, 2.50, 0.12, NULL, NULL, '2023-05-27 06:02:12', '2023-05-27 06:02:12'),
(136, 6, 80, 2, 0.06, 20.00, 1.25, 0.06, NULL, NULL, '2023-05-27 06:02:12', '2023-05-27 06:02:12'),
(137, 6, 55, 2, 0.06, 20.00, 1.25, 0.06, NULL, NULL, '2023-05-27 06:02:12', '2023-05-27 06:02:12'),
(138, 6, 61, 2, 0.06, 20.00, 1.25, 0.06, NULL, NULL, '2023-05-27 06:02:12', '2023-05-27 06:02:12'),
(139, 6, 64, 2, 0.06, 20.00, 1.25, 0.06, NULL, NULL, '2023-05-27 06:02:12', '2023-05-27 06:02:12'),
(140, 6, 71, 2, 0.06, 20.00, 1.25, 0.06, NULL, NULL, '2023-05-27 06:02:12', '2023-05-27 06:02:12'),
(141, 6, 89, 2, 0.05, 20.00, 1.00, 0.05, NULL, NULL, '2023-05-27 06:02:12', '2023-05-27 06:02:12'),
(142, 6, 86, 2, 0.04, 0.00, 0.00, 0.04, NULL, NULL, '2023-05-27 06:02:12', '2023-05-27 06:02:12'),
(143, 6, 57, 2, 0.04, 20.00, 0.75, 0.04, NULL, NULL, '2023-05-27 06:02:12', '2023-05-27 06:02:12'),
(144, 6, 84, 2, 0.02, 20.00, 0.50, 0.02, NULL, NULL, '2023-05-27 06:02:12', '2023-05-27 06:02:12'),
(145, 6, 70, 2, 0.02, 20.00, 0.50, 0.02, NULL, NULL, '2023-05-27 06:02:12', '2023-05-27 06:02:12'),
(146, 6, 63, 2, 0.14, 20.00, 2.75, 0.14, NULL, NULL, '2023-05-27 06:02:12', '2023-05-27 06:02:12'),
(147, 7, 4, 2, 259.50, 20.00, 5190.00, 259.50, NULL, NULL, '2023-06-04 08:16:41', '2023-06-04 08:16:41'),
(148, 7, 26, 2, 132.50, 20.00, 2650.00, 132.50, NULL, NULL, '2023-06-04 08:16:41', '2023-06-04 08:16:41'),
(149, 7, 11, 2, 27.50, 20.00, 550.00, 27.50, NULL, NULL, '2023-06-04 08:16:41', '2023-06-04 08:16:41'),
(150, 7, 23, 2, 22.50, 20.00, 450.00, 22.50, NULL, NULL, '2023-06-04 08:16:41', '2023-06-04 08:16:41'),
(151, 7, 18, 2, 15.00, 20.00, 300.00, 15.00, NULL, NULL, '2023-06-04 08:16:41', '2023-06-04 08:16:41'),
(152, 7, 12, 2, 12.50, 20.00, 250.00, 12.50, NULL, NULL, '2023-06-04 08:16:41', '2023-06-04 08:16:41'),
(153, 7, 38, 10, 10.00, 20.00, 200.00, 10.00, NULL, NULL, '2023-06-04 08:16:41', '2023-06-04 08:16:41'),
(154, 7, 29, 2, 9.00, 20.00, 180.00, 9.00, NULL, NULL, '2023-06-04 08:16:41', '2023-06-04 08:16:41'),
(155, 7, 33, 2, 3.00, 20.00, 60.00, 3.00, NULL, NULL, '2023-06-04 08:16:41', '2023-06-04 08:16:41'),
(156, 7, 41, 2, 1.50, 20.00, 30.00, 1.50, NULL, NULL, '2023-06-04 08:16:41', '2023-06-04 08:16:41'),
(157, 7, 52, 2, 1.25, 20.00, 25.00, 1.25, NULL, NULL, '2023-06-04 08:16:41', '2023-06-04 08:16:41'),
(158, 7, 42, 2, 1.00, 20.00, 20.00, 1.00, NULL, NULL, '2023-06-04 08:16:41', '2023-06-04 08:16:41'),
(159, 7, 51, 2, 0.50, 20.00, 10.00, 0.50, NULL, NULL, '2023-06-04 08:16:41', '2023-06-04 08:16:41'),
(160, 7, 53, 2, 0.50, 20.00, 10.00, 0.50, NULL, NULL, '2023-06-04 08:16:41', '2023-06-04 08:16:41'),
(161, 7, 37, 10, 0.25, 20.00, 5.00, 0.25, NULL, NULL, '2023-06-04 08:16:41', '2023-06-04 08:16:41'),
(162, 7, 43, 2, 0.25, 20.00, 5.00, 0.25, NULL, NULL, '2023-06-04 08:16:41', '2023-06-04 08:16:41'),
(163, 7, 50, 2, 0.25, 20.00, 5.00, 0.25, NULL, NULL, '2023-06-04 08:16:41', '2023-06-04 08:16:41'),
(164, 7, 76, 2, 0.25, 0.00, 0.00, 0.25, NULL, NULL, '2023-06-04 08:16:41', '2023-06-04 08:16:41'),
(165, 7, 85, 2, 0.25, 20.00, 5.00, 0.25, NULL, NULL, '2023-06-04 08:16:41', '2023-06-04 08:16:41'),
(166, 7, 90, 2, 0.25, 20.00, 5.00, 0.25, NULL, NULL, '2023-06-04 08:16:41', '2023-06-04 08:16:41'),
(167, 7, 58, 2, 0.25, 20.00, 5.00, 0.25, NULL, NULL, '2023-06-04 08:16:41', '2023-06-04 08:16:41'),
(168, 7, 59, 2, 0.25, 20.00, 5.00, 0.25, NULL, NULL, '2023-06-04 08:16:41', '2023-06-04 08:16:41'),
(169, 7, 65, 2, 0.25, 20.00, 5.00, 0.25, NULL, NULL, '2023-06-04 08:16:41', '2023-06-04 08:16:41'),
(170, 7, 66, 2, 0.25, 20.00, 5.00, 0.25, NULL, NULL, '2023-06-04 08:16:41', '2023-06-04 08:16:41'),
(171, 7, 80, 2, 0.12, 20.00, 2.50, 0.12, NULL, NULL, '2023-06-04 08:16:41', '2023-06-04 08:16:41'),
(172, 7, 55, 2, 0.12, 20.00, 2.50, 0.12, NULL, NULL, '2023-06-04 08:16:41', '2023-06-04 08:16:41'),
(173, 7, 61, 2, 0.12, 20.00, 2.50, 0.12, NULL, NULL, '2023-06-04 08:16:41', '2023-06-04 08:16:41'),
(174, 7, 64, 2, 0.12, 20.00, 2.50, 0.12, NULL, NULL, '2023-06-04 08:16:41', '2023-06-04 08:16:41'),
(175, 7, 71, 2, 0.12, 20.00, 2.50, 0.12, NULL, NULL, '2023-06-04 08:16:41', '2023-06-04 08:16:41'),
(176, 7, 89, 2, 0.10, 20.00, 2.00, 0.10, NULL, NULL, '2023-06-04 08:16:41', '2023-06-04 08:16:41'),
(177, 7, 86, 2, 0.08, 0.00, 0.00, 0.08, NULL, NULL, '2023-06-04 08:16:41', '2023-06-04 08:16:41'),
(178, 7, 57, 2, 0.08, 20.00, 1.50, 0.08, NULL, NULL, '2023-06-04 08:16:41', '2023-06-04 08:16:41'),
(179, 7, 84, 2, 0.05, 20.00, 1.00, 0.05, NULL, NULL, '2023-06-04 08:16:41', '2023-06-04 08:16:41'),
(180, 7, 70, 2, 0.05, 20.00, 1.00, 0.05, NULL, NULL, '2023-06-04 08:16:41', '2023-06-04 08:16:41'),
(181, 7, 63, 2, 0.28, 20.00, 5.50, 0.28, NULL, NULL, '2023-06-04 08:16:41', '2023-06-04 08:16:41'),
(182, 8, 4, 2, 51.90, 20.00, 1038.00, 51.90, NULL, NULL, '2023-06-05 03:36:31', '2023-06-05 03:36:31'),
(183, 8, 26, 2, 26.50, 20.00, 530.00, 26.50, NULL, NULL, '2023-06-05 03:36:31', '2023-06-05 03:36:31'),
(184, 8, 11, 2, 5.50, 20.00, 110.00, 5.50, NULL, NULL, '2023-06-05 03:36:31', '2023-06-05 03:36:31'),
(185, 8, 23, 2, 4.50, 20.00, 90.00, 4.50, NULL, NULL, '2023-06-05 03:36:31', '2023-06-05 03:36:31'),
(186, 8, 18, 2, 3.00, 20.00, 60.00, 3.00, NULL, NULL, '2023-06-05 03:36:31', '2023-06-05 03:36:31'),
(187, 8, 12, 2, 2.50, 20.00, 50.00, 2.50, NULL, NULL, '2023-06-05 03:36:31', '2023-06-05 03:36:31'),
(188, 8, 38, 10, 2.00, 20.00, 40.00, 2.00, NULL, NULL, '2023-06-05 03:36:31', '2023-06-05 03:36:31'),
(189, 8, 29, 2, 1.80, 20.00, 36.00, 1.80, NULL, NULL, '2023-06-05 03:36:31', '2023-06-05 03:36:31'),
(190, 8, 33, 2, 0.60, 20.00, 12.00, 0.60, NULL, NULL, '2023-06-05 03:36:31', '2023-06-05 03:36:31'),
(191, 8, 41, 2, 0.30, 20.00, 6.00, 0.30, NULL, NULL, '2023-06-05 03:36:31', '2023-06-05 03:36:31'),
(192, 8, 52, 2, 0.25, 20.00, 5.00, 0.25, NULL, NULL, '2023-06-05 03:36:31', '2023-06-05 03:36:31'),
(193, 8, 42, 2, 0.20, 20.00, 4.00, 0.20, NULL, NULL, '2023-06-05 03:36:31', '2023-06-05 03:36:31'),
(194, 8, 51, 2, 0.10, 20.00, 2.00, 0.10, NULL, NULL, '2023-06-05 03:36:31', '2023-06-05 03:36:31'),
(195, 8, 53, 2, 0.10, 20.00, 2.00, 0.10, NULL, NULL, '2023-06-05 03:36:31', '2023-06-05 03:36:31'),
(196, 8, 37, 10, 0.05, 20.00, 1.00, 0.05, NULL, NULL, '2023-06-05 03:36:31', '2023-06-05 03:36:31'),
(197, 8, 43, 2, 0.05, 20.00, 1.00, 0.05, NULL, NULL, '2023-06-05 03:36:31', '2023-06-05 03:36:31'),
(198, 8, 50, 2, 0.05, 20.00, 1.00, 0.05, NULL, NULL, '2023-06-05 03:36:31', '2023-06-05 03:36:31'),
(199, 8, 76, 2, 0.05, 0.00, 0.00, 0.05, NULL, NULL, '2023-06-05 03:36:31', '2023-06-05 03:36:31'),
(200, 8, 85, 2, 0.05, 20.00, 1.00, 0.05, NULL, NULL, '2023-06-05 03:36:31', '2023-06-05 03:36:31'),
(201, 8, 90, 2, 0.05, 20.00, 1.00, 0.05, NULL, NULL, '2023-06-05 03:36:31', '2023-06-05 03:36:31'),
(202, 8, 58, 2, 0.05, 20.00, 1.00, 0.05, NULL, NULL, '2023-06-05 03:36:31', '2023-06-05 03:36:31'),
(203, 8, 59, 2, 0.05, 20.00, 1.00, 0.05, NULL, NULL, '2023-06-05 03:36:31', '2023-06-05 03:36:31'),
(204, 8, 65, 2, 0.05, 20.00, 1.00, 0.05, NULL, NULL, '2023-06-05 03:36:31', '2023-06-05 03:36:31'),
(205, 8, 66, 2, 0.05, 20.00, 1.00, 0.05, NULL, NULL, '2023-06-05 03:36:31', '2023-06-05 03:36:31'),
(206, 8, 80, 2, 0.02, 20.00, 0.50, 0.02, NULL, NULL, '2023-06-05 03:36:31', '2023-06-05 03:36:31'),
(207, 8, 55, 2, 0.02, 20.00, 0.50, 0.02, NULL, NULL, '2023-06-05 03:36:31', '2023-06-05 03:36:31'),
(208, 8, 61, 2, 0.02, 20.00, 0.50, 0.02, NULL, NULL, '2023-06-05 03:36:31', '2023-06-05 03:36:31'),
(209, 8, 64, 2, 0.02, 20.00, 0.50, 0.02, NULL, NULL, '2023-06-05 03:36:31', '2023-06-05 03:36:31'),
(210, 8, 71, 2, 0.02, 20.00, 0.50, 0.02, NULL, NULL, '2023-06-05 03:36:31', '2023-06-05 03:36:31'),
(211, 8, 89, 2, 0.02, 20.00, 0.40, 0.02, NULL, NULL, '2023-06-05 03:36:31', '2023-06-05 03:36:31'),
(212, 8, 86, 2, 0.02, 0.00, 0.00, 0.02, NULL, NULL, '2023-06-05 03:36:31', '2023-06-05 03:36:31'),
(213, 8, 57, 2, 0.02, 20.00, 0.30, 0.02, NULL, NULL, '2023-06-05 03:36:31', '2023-06-05 03:36:31'),
(214, 8, 84, 2, 0.01, 20.00, 0.20, 0.01, NULL, NULL, '2023-06-05 03:36:31', '2023-06-05 03:36:31'),
(215, 8, 70, 2, 0.01, 20.00, 0.20, 0.01, NULL, NULL, '2023-06-05 03:36:31', '2023-06-05 03:36:31'),
(216, 8, 63, 2, 0.06, 20.00, 1.10, 0.06, NULL, NULL, '2023-06-05 03:36:31', '2023-06-05 03:36:31'),
(217, 9, 4, 2, 5.00, 20.00, 100.00, 5.00, NULL, NULL, '2023-06-05 04:17:51', '2023-06-05 04:17:51'),
(218, 9, 23, 2, 5.00, 20.00, 100.00, 5.00, NULL, NULL, '2023-06-05 04:17:51', '2023-06-05 04:17:51'),
(219, 9, 11, 2, 5.00, 20.00, 100.00, 5.00, NULL, NULL, '2023-06-05 04:17:51', '2023-06-05 04:17:51'),
(220, 9, 26, 2, 5.00, 20.00, 100.00, 5.00, NULL, NULL, '2023-06-05 04:17:51', '2023-06-05 04:17:51'),
(221, 10, 4, 2, 2.50, 20.00, 50.00, 2.50, NULL, NULL, '2023-06-05 04:25:08', '2023-06-05 04:25:08'),
(222, 10, 23, 2, 2.50, 20.00, 50.00, 2.50, NULL, NULL, '2023-06-05 04:25:08', '2023-06-05 04:25:08'),
(223, 10, 11, 2, 2.50, 20.00, 50.00, 2.50, NULL, NULL, '2023-06-05 04:25:08', '2023-06-05 04:25:08'),
(224, 10, 26, 2, 2.50, 20.00, 50.00, 2.50, NULL, NULL, '2023-06-05 04:25:08', '2023-06-05 04:25:08');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `barcode_symbology` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_unit_id` bigint UNSIGNED DEFAULT NULL,
  `unit_id` bigint UNSIGNED DEFAULT NULL,
  `cost` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Base Unit wise cost',
  `base_unit_price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Base Unit wise Price',
  `unit_price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Base Unit wise Price',
  `base_unit_qty` double DEFAULT NULL,
  `unit_qty` double DEFAULT NULL,
  `alert_quantity` double DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_id` bigint UNSIGNED DEFAULT NULL,
  `tax_method` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Exclusive, 2=Inclusive',
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `code`, `category_id`, `barcode_symbology`, `base_unit_id`, `unit_id`, `cost`, `base_unit_price`, `unit_price`, `base_unit_qty`, `unit_qty`, `alert_quantity`, `image`, `tax_id`, `tax_method`, `status`, `description`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(2, 'Broiler Starter Without Old Stock', '92003711', 14, 'C128', 2, NULL, NULL, '55.6', NULL, NULL, NULL, 500, NULL, NULL, '1', '1', NULL, 'Tajul', 'Super Admin', '2023-05-17 19:27:55', '2023-05-17 19:35:50'),
(3, 'Broiler feed-A', '01974462', 14, 'C128', 2, NULL, NULL, '12', NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'no', 'Super Admin', 'Super Admin', '2023-05-21 04:16:18', '2023-05-21 04:17:00'),
(4, 'Brioler feed-B', '87620316', 14, NULL, 2, NULL, NULL, '13', NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'dsfs', 'Super Admin', 'Super Admin', '2023-05-21 04:30:10', '2023-05-21 04:30:32'),
(5, 'Feed Broiler -C', '48126108', 14, NULL, 2, NULL, NULL, '15', NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'ffdg', 'Super Admin', 'Super Admin', '2023-05-21 04:48:35', '2023-05-21 04:49:02'),
(6, 'Producr- D', '03424972', 14, NULL, 2, NULL, NULL, '21', NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'sdfdsf', 'Super Admin', 'Super Admin', '2023-05-21 05:30:40', '2023-05-21 05:31:52'),
(8, 'Special 1', '00194065', 14, NULL, 2, NULL, '999.35', '100', NULL, NULL, NULL, NULL, NULL, 0, '1', '1', 'Demo product for testing purpose', 'Super Admin', 'Super Admin', '2023-05-21 09:06:35', '2023-05-27 06:02:46'),
(9, 'ABC', '41334297', 14, 'C128', 2, NULL, NULL, '50', NULL, NULL, NULL, 10, NULL, 0, '1', '1', 'sdsa', 'Super Admin', 'Super Admin', '2023-06-05 04:13:51', '2023-06-05 04:16:23');

-- --------------------------------------------------------

--
-- Table structure for table `product_material`
--

CREATE TABLE `product_material` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `material_id` bigint UNSIGNED NOT NULL,
  `qty` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_material`
--

INSERT INTO `product_material` (`id`, `product_id`, `material_id`, `qty`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 0.2, '2023-05-14 17:02:16', '2023-05-15 12:36:38'),
(2, 1, 3, 0.2, '2023-05-14 17:02:16', '2023-05-15 12:36:38'),
(4, 1, 3, 0.2, '2023-05-15 12:36:38', '2023-05-15 12:36:38'),
(5, 2, 85, 0.5, '2023-05-17 19:27:55', '2023-05-17 19:35:50'),
(7, 2, 42, 2, '2023-05-17 19:27:55', '2023-05-17 19:35:50'),
(8, 2, 69, 0.5, '2023-05-17 19:27:55', '2023-05-17 19:35:50'),
(9, 2, 85, 0.5, '2023-05-17 19:27:55', '2023-05-17 19:35:50'),
(10, 2, 51, 1, '2023-05-17 19:27:55', '2023-05-17 19:35:50'),
(12, 2, 89, 0.2, '2023-05-17 19:27:55', '2023-05-17 19:35:50'),
(13, 2, 70, 0.1, '2023-05-17 19:27:55', '2023-05-17 19:35:50'),
(40, 2, 85, 0.5, '2023-05-17 19:35:50', '2023-05-17 19:35:50'),
(41, 2, 100, 265, '2023-05-17 19:35:50', '2023-05-17 19:35:50'),
(42, 2, 42, 2, '2023-05-17 19:35:50', '2023-05-17 19:35:50'),
(43, 2, 69, 0.5, '2023-05-17 19:35:50', '2023-05-17 19:35:50'),
(44, 2, 51, 1, '2023-05-17 19:35:50', '2023-05-17 19:35:50'),
(45, 2, 38, 20, '2023-05-17 19:35:50', '2023-05-17 19:35:50'),
(46, 2, 89, 0.2, '2023-05-17 19:35:50', '2023-05-17 19:35:50'),
(47, 2, 70, 0.1, '2023-05-17 19:35:50', '2023-05-17 19:35:50'),
(48, 2, 41, 3, '2023-05-17 19:35:50', '2023-05-17 19:35:50'),
(49, 2, 52, 2.5, '2023-05-17 19:35:50', '2023-05-17 19:35:50'),
(50, 2, 53, 1, '2023-05-17 19:35:50', '2023-05-17 19:35:50'),
(51, 2, 37, 0.5, '2023-05-17 19:35:50', '2023-05-17 19:35:50'),
(52, 2, 43, 0.5, '2023-05-17 19:35:50', '2023-05-17 19:35:50'),
(53, 2, 50, 0.5, '2023-05-17 19:35:50', '2023-05-17 19:35:50'),
(54, 2, 76, 0.5, '2023-05-17 19:35:50', '2023-05-17 19:35:50'),
(55, 2, 89, 0.5, '2023-05-17 19:35:50', '2023-05-17 19:35:50'),
(56, 2, 58, 0.5, '2023-05-17 19:35:50', '2023-05-17 19:35:50'),
(57, 2, 59, 0.5, '2023-05-17 19:35:50', '2023-05-17 19:35:50'),
(58, 2, 65, 0.5, '2023-05-17 19:35:50', '2023-05-17 19:35:50'),
(59, 2, 80, 0.25, '2023-05-17 19:35:50', '2023-05-17 19:35:50'),
(60, 2, 55, 0.25, '2023-05-17 19:35:50', '2023-05-17 19:35:50'),
(61, 2, 61, 0.25, '2023-05-17 19:35:50', '2023-05-17 19:35:50'),
(62, 2, 64, 0.25, '2023-05-17 19:35:50', '2023-05-17 19:35:50'),
(63, 2, 71, 0.25, '2023-05-17 19:35:50', '2023-05-17 19:35:50'),
(64, 2, 86, 0.15, '2023-05-17 19:35:50', '2023-05-17 19:35:50'),
(65, 2, 57, 0.15, '2023-05-17 19:35:50', '2023-05-17 19:35:50'),
(66, 2, 84, 0.1, '2023-05-17 19:35:50', '2023-05-17 19:35:50'),
(67, 2, 63, 0.05, '2023-05-17 19:35:50', '2023-05-17 19:35:50'),
(129, 3, 38, 30, '2023-05-21 04:17:25', '2023-05-21 04:31:10'),
(130, 3, 53, 2, '2023-05-21 04:17:25', '2023-05-21 04:31:10'),
(131, 3, 55, 0.5, '2023-05-21 04:17:25', '2023-05-21 04:31:10'),
(132, 3, 58, 0.5, '2023-05-21 04:17:25', '2023-05-21 04:31:10'),
(134, 3, 99, 0.2, '2023-05-21 04:17:25', '2023-05-21 04:31:10'),
(162, 4, 85, 0.5, '2023-05-21 04:30:10', '2023-05-21 04:30:32'),
(163, 4, 42, 2, '2023-05-21 04:30:10', '2023-05-21 04:30:32'),
(164, 4, 53, 1, '2023-05-21 04:30:10', '2023-05-21 04:30:32'),
(165, 4, 66, 0.5, '2023-05-21 04:30:10', '2023-05-21 04:30:32'),
(166, 4, 85, 0.5, '2023-05-21 04:30:10', '2023-05-21 04:30:32'),
(167, 4, 51, 1, '2023-05-21 04:30:10', '2023-05-21 04:30:32'),
(169, 4, 87, 0.2, '2023-05-21 04:30:10', '2023-05-21 04:30:32'),
(170, 4, 70, 0.1, '2023-05-21 04:30:10', '2023-05-21 04:30:32'),
(197, 4, 85, 0.5, '2023-05-21 04:30:32', '2023-05-21 04:30:32'),
(198, 4, 42, 2, '2023-05-21 04:30:32', '2023-05-21 04:30:32'),
(199, 4, 53, 1, '2023-05-21 04:30:32', '2023-05-21 04:30:32'),
(200, 4, 66, 0.5, '2023-05-21 04:30:32', '2023-05-21 04:30:32'),
(201, 4, 51, 1, '2023-05-21 04:30:32', '2023-05-21 04:30:32'),
(202, 4, 38, 20, '2023-05-21 04:30:32', '2023-05-21 04:30:32'),
(203, 4, 87, 0.2, '2023-05-21 04:30:32', '2023-05-21 04:30:32'),
(204, 4, 70, 0.1, '2023-05-21 04:30:32', '2023-05-21 04:30:32'),
(205, 4, 41, 3, '2023-05-21 04:30:32', '2023-05-21 04:30:32'),
(206, 4, 52, 2.5, '2023-05-21 04:30:32', '2023-05-21 04:30:32'),
(207, 4, 37, 0.5, '2023-05-21 04:30:32', '2023-05-21 04:30:32'),
(208, 4, 43, 0.5, '2023-05-21 04:30:32', '2023-05-21 04:30:32'),
(209, 4, 50, 0.5, '2023-05-21 04:30:32', '2023-05-21 04:30:32'),
(210, 4, 75, 0.5, '2023-05-21 04:30:32', '2023-05-21 04:30:32'),
(211, 4, 89, 0.5, '2023-05-21 04:30:32', '2023-05-21 04:30:32'),
(212, 4, 58, 0.5, '2023-05-21 04:30:32', '2023-05-21 04:30:32'),
(213, 4, 59, 0.5, '2023-05-21 04:30:32', '2023-05-21 04:30:32'),
(214, 4, 65, 0.5, '2023-05-21 04:30:32', '2023-05-21 04:30:32'),
(215, 4, 80, 0.25, '2023-05-21 04:30:32', '2023-05-21 04:30:32'),
(216, 4, 55, 0.25, '2023-05-21 04:30:32', '2023-05-21 04:30:32'),
(217, 4, 61, 0.25, '2023-05-21 04:30:32', '2023-05-21 04:30:32'),
(218, 4, 64, 0.25, '2023-05-21 04:30:32', '2023-05-21 04:30:32'),
(219, 4, 71, 0.25, '2023-05-21 04:30:32', '2023-05-21 04:30:32'),
(220, 4, 86, 0.15, '2023-05-21 04:30:32', '2023-05-21 04:30:32'),
(221, 4, 57, 0.15, '2023-05-21 04:30:32', '2023-05-21 04:30:32'),
(222, 4, 84, 0.1, '2023-05-21 04:30:32', '2023-05-21 04:30:32'),
(223, 4, 63, 0.05, '2023-05-21 04:30:32', '2023-05-21 04:30:32'),
(224, 3, 38, 30, '2023-05-21 04:31:10', '2023-05-21 04:31:10'),
(225, 3, 53, 2, '2023-05-21 04:31:10', '2023-05-21 04:31:10'),
(226, 3, 55, 0.5, '2023-05-21 04:31:10', '2023-05-21 04:31:10'),
(227, 3, 58, 0.5, '2023-05-21 04:31:10', '2023-05-21 04:31:10'),
(228, 3, 99, 0.2, '2023-05-21 04:31:10', '2023-05-21 04:31:10'),
(229, 3, 33, 20, '2023-05-21 04:31:10', '2023-05-21 04:31:10'),
(230, 3, 41, 18, '2023-05-21 04:31:10', '2023-05-21 04:31:10'),
(231, 3, 52, 6, '2023-05-21 04:31:10', '2023-05-21 04:31:10'),
(232, 3, 42, 3, '2023-05-21 04:31:10', '2023-05-21 04:31:10'),
(233, 3, 51, 2.5, '2023-05-21 04:31:10', '2023-05-21 04:31:10'),
(234, 3, 37, 1, '2023-05-21 04:31:10', '2023-05-21 04:31:10'),
(235, 3, 43, 1, '2023-05-21 04:31:10', '2023-05-21 04:31:10'),
(236, 3, 50, 0.5, '2023-05-21 04:31:10', '2023-05-21 04:31:10'),
(237, 3, 76, 0.5, '2023-05-21 04:31:10', '2023-05-21 04:31:10'),
(238, 3, 85, 0.5, '2023-05-21 04:31:10', '2023-05-21 04:31:10'),
(239, 3, 89, 0.5, '2023-05-21 04:31:10', '2023-05-21 04:31:10'),
(240, 3, 59, 0.5, '2023-05-21 04:31:10', '2023-05-21 04:31:10'),
(241, 3, 65, 0.5, '2023-05-21 04:31:10', '2023-05-21 04:31:10'),
(242, 3, 57, 0.5, '2023-05-21 04:31:10', '2023-05-21 04:31:10'),
(243, 3, 80, 0.5, '2023-05-21 04:31:10', '2023-05-21 04:31:10'),
(244, 3, 61, 0.25, '2023-05-21 04:31:10', '2023-05-21 04:31:10'),
(245, 3, 64, 0.25, '2023-05-21 04:31:10', '2023-05-21 04:31:10'),
(246, 3, 71, 0.25, '2023-05-21 04:31:10', '2023-05-21 04:31:10'),
(247, 3, 98, 0.25, '2023-05-21 04:31:10', '2023-05-21 04:31:10'),
(248, 3, 86, 0.25, '2023-05-21 04:31:10', '2023-05-21 04:31:10'),
(249, 3, 84, 0.15, '2023-05-21 04:31:10', '2023-05-21 04:31:10'),
(250, 3, 70, 0.15, '2023-05-21 04:31:10', '2023-05-21 04:31:10'),
(251, 3, 61, 0.25, '2023-05-21 04:31:10', '2023-05-21 04:31:10'),
(330, 5, 101, 519.5, '2023-05-21 04:49:57', '2023-05-21 04:49:57'),
(331, 5, 102, 265, '2023-05-21 04:49:57', '2023-05-21 04:49:57'),
(332, 5, 103, 55, '2023-05-21 04:49:57', '2023-05-21 04:49:57'),
(333, 5, 104, 45, '2023-05-21 04:49:57', '2023-05-21 04:49:57'),
(334, 5, 105, 30, '2023-05-21 04:49:57', '2023-05-21 04:49:57'),
(335, 5, 106, 25, '2023-05-21 04:49:57', '2023-05-21 04:49:57'),
(336, 5, 107, 20, '2023-05-21 04:49:57', '2023-05-21 04:49:57'),
(337, 5, 108, 18, '2023-05-21 04:49:57', '2023-05-21 04:49:57'),
(338, 5, 109, 6, '2023-05-21 04:49:57', '2023-05-21 04:49:57'),
(339, 5, 110, 4, '2023-05-21 04:49:57', '2023-05-21 04:49:57'),
(340, 5, 111, 2.5, '2023-05-21 04:49:57', '2023-05-21 04:49:57'),
(341, 5, 112, 2, '2023-05-21 04:49:57', '2023-05-21 04:49:57'),
(342, 5, 113, 1.5, '2023-05-21 04:49:57', '2023-05-21 04:49:57'),
(343, 5, 114, 1, '2023-05-21 04:49:57', '2023-05-21 04:49:57'),
(344, 5, 115, 0.5, '2023-05-21 04:49:57', '2023-05-21 04:49:57'),
(345, 5, 116, 0.5, '2023-05-21 04:49:57', '2023-05-21 04:49:57'),
(346, 5, 117, 0.5, '2023-05-21 04:49:57', '2023-05-21 04:49:57'),
(347, 5, 118, 0.5, '2023-05-21 04:49:57', '2023-05-21 04:49:57'),
(348, 5, 119, 0.5, '2023-05-21 04:49:57', '2023-05-21 04:49:57'),
(349, 5, 120, 0.5, '2023-05-21 04:49:57', '2023-05-21 04:49:57'),
(350, 5, 121, 0.5, '2023-05-21 04:49:57', '2023-05-21 04:49:57'),
(351, 5, 122, 0.5, '2023-05-21 04:49:57', '2023-05-21 04:49:57'),
(352, 5, 123, 0.5, '2023-05-21 04:49:57', '2023-05-21 04:49:57'),
(353, 5, 124, 0.5, '2023-05-21 04:49:57', '2023-05-21 04:49:57'),
(354, 5, 125, 0.25, '2023-05-21 04:49:57', '2023-05-21 04:49:57'),
(355, 5, 126, 0.25, '2023-05-21 04:49:57', '2023-05-21 04:49:57'),
(356, 6, 90, 0.5, '2023-05-21 05:30:40', '2023-05-21 05:31:52'),
(357, 6, 54, 0.5, '2023-05-21 05:30:40', '2023-05-21 05:31:52'),
(358, 6, 82, 0.75, '2023-05-21 05:30:40', '2023-05-21 05:31:52'),
(359, 6, 32, 2, '2023-05-21 05:30:40', '2023-05-21 05:31:52'),
(360, 6, 90, 0.5, '2023-05-21 05:30:40', '2023-05-21 05:31:52'),
(361, 6, 49, 0.25, '2023-05-21 05:30:40', '2023-05-21 05:31:52'),
(362, 6, 30, 1, '2023-05-21 05:30:40', '2023-05-21 05:31:52'),
(363, 6, 48, 0.5, '2023-05-21 05:30:40', '2023-05-21 05:31:52'),
(364, 6, 54, 0.5, '2023-05-21 05:30:40', '2023-05-21 05:31:52'),
(365, 6, 82, 0.75, '2023-05-21 05:30:40', '2023-05-21 05:31:52'),
(368, 6, 49, 0.25, '2023-05-21 05:30:40', '2023-05-21 05:31:52'),
(372, 6, 87, 0.5, '2023-05-21 05:30:40', '2023-05-21 05:31:52'),
(374, 6, 90, 0.5, '2023-05-21 05:30:40', '2023-05-21 05:31:52'),
(378, 6, 49, 0.25, '2023-05-21 05:30:40', '2023-05-21 05:31:52'),
(384, 6, 83, 0.5, '2023-05-21 05:30:40', '2023-05-21 05:31:52'),
(386, 6, 90, 0.5, '2023-05-21 05:31:52', '2023-05-21 05:31:52'),
(387, 6, 54, 0.5, '2023-05-21 05:31:52', '2023-05-21 05:31:52'),
(388, 6, 82, 0.75, '2023-05-21 05:31:52', '2023-05-21 05:31:52'),
(389, 6, 32, 2, '2023-05-21 05:31:52', '2023-05-21 05:31:52'),
(390, 6, 30, 1, '2023-05-21 05:31:52', '2023-05-21 05:31:52'),
(391, 6, 48, 0.5, '2023-05-21 05:31:52', '2023-05-21 05:31:52'),
(392, 6, 31, 2.5, '2023-05-21 05:31:52', '2023-05-21 05:31:52'),
(393, 6, 15, 0.5, '2023-05-21 05:31:52', '2023-05-21 05:31:52'),
(394, 6, 59, 0.5, '2023-05-21 05:31:52', '2023-05-21 05:31:52'),
(395, 6, 14, 0.5, '2023-05-21 05:31:52', '2023-05-21 05:31:52'),
(396, 6, 5, 0.5, '2023-05-21 05:31:52', '2023-05-21 05:31:52'),
(397, 6, 52, 0.5, '2023-05-21 05:31:52', '2023-05-21 05:31:52'),
(398, 6, 39, 0.25, '2023-05-21 05:31:52', '2023-05-21 05:31:52'),
(399, 6, 56, 0.25, '2023-05-21 05:31:52', '2023-05-21 05:31:52'),
(400, 6, 65, 0.25, '2023-05-21 05:31:52', '2023-05-21 05:31:52'),
(401, 6, 21, 0.25, '2023-05-21 05:31:52', '2023-05-21 05:31:52'),
(402, 7, 4, 519.5, '2023-05-21 08:34:46', '2023-05-21 08:35:28'),
(403, 7, 11, 265, '2023-05-21 08:34:47', '2023-05-21 08:35:28'),
(404, 7, 13, 55, '2023-05-21 08:34:47', '2023-05-21 08:35:28'),
(405, 7, 23, 45, '2023-05-21 08:34:47', '2023-05-21 08:35:28'),
(406, 7, 18, 30, '2023-05-21 08:34:47', '2023-05-21 08:35:28'),
(407, 7, 12, 25, '2023-05-21 08:34:47', '2023-05-21 08:35:28'),
(408, 7, 38, 20, '2023-05-21 08:34:47', '2023-05-21 08:35:28'),
(409, 7, 29, 18, '2023-05-21 08:34:47', '2023-05-21 08:35:28'),
(410, 7, 33, 6, '2023-05-21 08:34:47', '2023-05-21 08:35:28'),
(411, 7, 41, 3, '2023-05-21 08:34:47', '2023-05-21 08:35:28'),
(412, 7, 52, 2.5, '2023-05-21 08:34:47', '2023-05-21 08:35:28'),
(413, 7, 42, 2, '2023-05-21 08:34:47', '2023-05-21 08:35:28'),
(414, 7, 51, 1, '2023-05-21 08:34:47', '2023-05-21 08:35:28'),
(415, 7, 53, 1, '2023-05-21 08:34:47', '2023-05-21 08:35:28'),
(416, 7, 37, 0.5, '2023-05-21 08:34:47', '2023-05-21 08:35:28'),
(417, 7, 43, 0.5, '2023-05-21 08:34:47', '2023-05-21 08:35:28'),
(418, 7, 50, 0.5, '2023-05-21 08:34:47', '2023-05-21 08:35:28'),
(419, 7, 76, 0.5, '2023-05-21 08:34:47', '2023-05-21 08:35:28'),
(420, 7, 85, 0.15, '2023-05-21 08:34:47', '2023-05-21 08:35:28'),
(421, 7, 89, 0.5, '2023-05-21 08:34:47', '2023-05-21 08:35:28'),
(422, 7, 58, 0.5, '2023-05-21 08:34:47', '2023-05-21 08:35:28'),
(423, 7, 59, 0.5, '2023-05-21 08:34:47', '2023-05-21 08:35:28'),
(424, 7, 65, 0.5, '2023-05-21 08:34:47', '2023-05-21 08:35:28'),
(425, 7, 66, 0.5, '2023-05-21 08:34:47', '2023-05-21 08:35:28'),
(426, 7, 80, 0.25, '2023-05-21 08:34:47', '2023-05-21 08:35:28'),
(427, 7, 55, 0.25, '2023-05-21 08:34:47', '2023-05-21 08:35:28'),
(428, 7, 61, 0.05, '2023-05-21 08:34:47', '2023-05-21 08:35:28'),
(429, 7, 64, 0.25, '2023-05-21 08:34:47', '2023-05-21 08:35:28'),
(430, 7, 71, 0.25, '2023-05-21 08:34:47', '2023-05-21 08:35:28'),
(431, 7, 90, 0.2, '2023-05-21 08:34:47', '2023-05-21 08:35:28'),
(432, 7, 57, 0.15, '2023-05-21 08:34:47', '2023-05-21 08:35:28'),
(433, 7, 84, 0.1, '2023-05-21 08:34:47', '2023-05-21 08:35:28'),
(434, 7, 70, 0.1, '2023-05-21 08:34:47', '2023-05-21 08:35:28'),
(435, 8, 4, 25.95, '2023-05-21 09:06:35', '2023-05-27 05:11:41'),
(436, 8, 26, 13.25, '2023-05-21 09:06:35', '2023-05-27 05:11:41'),
(437, 8, 11, 2.75, '2023-05-21 09:06:35', '2023-05-27 05:11:41'),
(438, 8, 23, 2.25, '2023-05-21 09:06:35', '2023-05-27 05:11:41'),
(439, 8, 18, 1.5, '2023-05-21 09:06:35', '2023-05-27 05:11:41'),
(440, 8, 12, 1.25, '2023-05-21 09:06:35', '2023-05-27 05:11:41'),
(441, 8, 38, 1, '2023-05-21 09:06:35', '2023-05-27 05:11:41'),
(442, 8, 29, 0.9, '2023-05-21 09:06:35', '2023-05-27 05:11:41'),
(443, 8, 33, 0.3, '2023-05-21 09:06:35', '2023-05-27 05:11:41'),
(444, 8, 41, 0.15, '2023-05-21 09:06:35', '2023-05-27 05:11:41'),
(445, 8, 52, 0.125, '2023-05-21 09:06:35', '2023-05-27 05:11:41'),
(446, 8, 42, 0.1, '2023-05-21 09:06:35', '2023-05-27 05:11:41'),
(447, 8, 51, 0.05, '2023-05-21 09:06:35', '2023-05-27 05:11:41'),
(448, 8, 53, 0.05, '2023-05-21 09:06:35', '2023-05-27 05:11:41'),
(449, 8, 37, 0.025, '2023-05-21 09:06:35', '2023-05-27 05:11:41'),
(450, 8, 43, 0.025, '2023-05-21 09:06:35', '2023-05-27 05:11:41'),
(451, 8, 50, 0.025, '2023-05-21 09:06:35', '2023-05-27 05:11:41'),
(452, 8, 76, 0.025, '2023-05-21 09:06:35', '2023-05-27 05:11:41'),
(453, 8, 85, 0.025, '2023-05-21 09:06:35', '2023-05-27 05:11:41'),
(454, 8, 90, 0.025, '2023-05-21 09:06:35', '2023-05-27 05:11:41'),
(455, 8, 58, 0.025, '2023-05-21 09:06:35', '2023-05-27 05:11:41'),
(456, 8, 59, 0.025, '2023-05-21 09:06:35', '2023-05-27 05:11:41'),
(457, 8, 65, 0.025, '2023-05-21 09:06:35', '2023-05-27 05:11:41'),
(458, 8, 66, 0.025, '2023-05-21 09:06:35', '2023-05-27 05:11:41'),
(459, 8, 80, 0.0125, '2023-05-21 09:06:35', '2023-05-27 05:11:41'),
(460, 8, 55, 0.0125, '2023-05-21 09:06:35', '2023-05-27 05:11:41'),
(461, 8, 61, 0.0125, '2023-05-21 09:06:35', '2023-05-27 05:11:41'),
(462, 8, 64, 0.0125, '2023-05-21 09:06:35', '2023-05-27 05:11:41'),
(463, 8, 71, 0.0125, '2023-05-21 09:06:35', '2023-05-27 05:11:41'),
(464, 8, 89, 0.01, '2023-05-21 09:06:35', '2023-05-27 05:11:41'),
(465, 8, 86, 0.0075, '2023-05-21 09:06:35', '2023-05-27 05:11:41'),
(466, 8, 57, 0.0075, '2023-05-21 09:06:35', '2023-05-27 05:11:41'),
(467, 8, 84, 0.005, '2023-05-21 09:06:35', '2023-05-27 05:11:41'),
(468, 8, 70, 0.005, '2023-05-21 09:06:35', '2023-05-27 05:11:41'),
(469, 8, 63, 0.0275, '2023-05-21 09:06:35', '2023-05-27 05:11:41'),
(470, 9, 4, 0.25, '2023-06-05 04:13:51', '2023-06-05 04:16:23'),
(472, 9, 23, 0.25, '2023-06-05 04:13:51', '2023-06-05 04:16:23'),
(473, 9, 11, 0.25, '2023-06-05 04:13:51', '2023-06-05 04:16:23'),
(474, 9, 26, 0.25, '2023-06-05 04:16:23', '2023-06-05 04:16:23');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` bigint UNSIGNED NOT NULL,
  `memo_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier_id` bigint UNSIGNED NOT NULL,
  `warehouse_id` int NOT NULL,
  `item` double(8,2) NOT NULL,
  `total_qty` double(8,2) NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_labor_cost` double DEFAULT NULL,
  `total_cost` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `order_discount` double DEFAULT NULL,
  `shipping_cost` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `paid_amount` double NOT NULL,
  `due_amount` double NOT NULL,
  `account_id` int DEFAULT NULL,
  `cheque_number` varchar(260) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_status` enum('1','2','3','4') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Received,2=Rejected,3=Pending,4=Ordered',
  `payment_status` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Paid,2=Partial,3=Due',
  `payment_method` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Cash,2=Cheque,3=Mobile',
  `document` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `purchase_date` date NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `memo_no`, `supplier_id`, `warehouse_id`, `item`, `total_qty`, `total_discount`, `total_tax`, `total_labor_cost`, `total_cost`, `order_tax_rate`, `order_tax`, `order_discount`, `shipping_cost`, `grand_total`, `paid_amount`, `due_amount`, `account_id`, `cheque_number`, `purchase_status`, `payment_status`, `payment_method`, `document`, `note`, `purchase_date`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'PINV-1001', 1, 4, 1.00, 15000.00, 0, 0, 3000, 412500, 0, 0, NULL, 15000, 430500, 430500, 0, 23, '0', '1', '1', '1', NULL, NULL, '2023-05-14', 'Super Admin', NULL, '2023-05-14 16:50:49', '2023-05-14 16:50:49'),
(2, 'PINV-1002', 1, 5, 34.00, 34000.00, 0, 0, NULL, 680000, 0, 0, NULL, NULL, 680000, 680000, 0, 23, '0', '1', '1', '1', NULL, NULL, '2023-05-21', 'Super Admin', NULL, '2023-05-21 09:28:24', '2023-05-21 09:28:24'),
(3, 'PINV-1003', 1, 5, 1.00, 1000.00, 0, 0, NULL, 20000, 0, 0, NULL, NULL, 20000, 20000, 0, 23, '0', '1', '1', '1', NULL, NULL, '2023-05-21', 'Super Admin', NULL, '2023-05-21 09:35:21', '2023-05-21 09:35:21'),
(4, 'PINV-1004', 1, 4, 1.00, 100.00, 0, 0, 200, 2300000, 0, 0, 0, 500, 2300700, 0, 0, 23, '0', '3', '3', '1', NULL, NULL, '2023-05-24', 'Super Admin', 'Super Admin', '2023-05-24 10:20:17', '2023-05-27 04:51:09'),
(5, 'PINV-1005', 1, 4, 1.00, 100.00, 0, 0, 200, 3000, 0, 0, NULL, 100, 3300, 0, 0, 23, '0', '1', '3', '1', NULL, NULL, '2023-05-27', 'Super Admin', NULL, '2023-05-27 04:30:45', '2023-05-27 04:30:45'),
(6, 'PINV-1006', 1, 4, 1.00, 100.00, 0, 0, 300, 2500, 0, 0, NULL, 500, 3300, 0, 0, 23, '0', '1', '3', '1', NULL, NULL, '2023-05-27', 'Super Admin', NULL, '2023-05-27 04:32:45', '2023-05-27 04:32:45'),
(7, 'PINV-1007', 1, 5, 1.00, 100.00, 0, 0, NULL, 1000, 0, 0, NULL, NULL, 1000, 500, 0, 23, '0', '1', '2', '1', NULL, NULL, '2023-05-28', 'Super Admin', NULL, '2023-05-28 03:30:56', '2023-05-28 03:31:27'),
(8, 'PINV-1008', 1, 5, 1.00, 100.00, 0, 0, 300, 2000, 0, 0, NULL, 200, 2500, 0, 0, 23, '0', '1', '3', '1', NULL, NULL, '2023-05-30', 'Super Admin', NULL, '2023-05-30 05:57:21', '2023-05-30 05:57:21'),
(9, 'PINV-1009', 1, 5, 1.00, 50.00, 0, 0, 300, 1250, 0, 0, NULL, 200, 1750, 0, 0, 23, '0', '1', '3', '1', NULL, NULL, '2023-05-30', 'Super Admin', NULL, '2023-05-30 05:59:12', '2023-05-30 05:59:12'),
(10, 'PINV-1010', 1, 5, 1.00, 30.00, 0, 0, 200, 900, 0, 0, NULL, 100, 1200, 0, 0, 23, '0', '1', '3', '1', NULL, NULL, '2023-05-30', 'Super Admin', NULL, '2023-05-30 07:28:27', '2023-05-30 07:29:05'),
(11, 'PINV-1011', 2, 5, 1.00, 100.00, 0, 0, 300, 4500, 0, 0, NULL, 200, 5000, 0, 0, 23, '0', '1', '3', '1', NULL, NULL, '2023-05-31', 'Super Admin', NULL, '2023-05-31 04:03:50', '2023-05-31 04:03:50');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_payments`
--

CREATE TABLE `purchase_payments` (
  `id` bigint UNSIGNED NOT NULL,
  `purchase_id` bigint UNSIGNED NOT NULL,
  `account_id` bigint UNSIGNED NOT NULL,
  `transaction_id` bigint UNSIGNED NOT NULL,
  `supplier_debit_transaction_id` bigint UNSIGNED NOT NULL,
  `amount` double NOT NULL,
  `payment_method` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Cash,2=Cheque,3=Mobile',
  `cheque_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_note` text COLLATE utf8mb4_unicode_ci,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_payments`
--

INSERT INTO `purchase_payments` (`id`, `purchase_id`, `account_id`, `transaction_id`, `supplier_debit_transaction_id`, `amount`, `payment_method`, `cheque_no`, `payment_note`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 1, 23, 0, 4, 430500, '1', '0', NULL, 'Super Admin', NULL, '2023-05-14 16:50:49', '2023-05-14 16:50:49'),
(2, 2, 23, 0, 9, 680000, '1', '0', NULL, 'Super Admin', NULL, '2023-05-21 09:28:25', '2023-05-21 09:28:25'),
(3, 3, 23, 0, 22, 20000, '1', '0', NULL, 'Super Admin', NULL, '2023-05-21 09:35:21', '2023-05-21 09:35:21'),
(4, 7, 23, 0, 43, 500, '1', '0', NULL, 'Super Admin', NULL, '2023-05-28 03:31:27', '2023-05-28 03:31:27');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_returns`
--

CREATE TABLE `purchase_returns` (
  `id` bigint UNSIGNED NOT NULL,
  `return_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `memo_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouse_id` bigint UNSIGNED NOT NULL,
  `supplier_id` bigint UNSIGNED DEFAULT NULL,
  `total_price` double NOT NULL,
  `total_deduction` double DEFAULT NULL,
  `tax_rate` double DEFAULT NULL,
  `total_tax` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci,
  `date` date NOT NULL,
  `return_date` date NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_return_materials`
--

CREATE TABLE `purchase_return_materials` (
  `id` bigint UNSIGNED NOT NULL,
  `purchase_return_id` bigint UNSIGNED NOT NULL,
  `memo_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `material_id` bigint UNSIGNED NOT NULL,
  `return_qty` double NOT NULL,
  `unit_id` bigint UNSIGNED DEFAULT NULL,
  `material_rate` double NOT NULL,
  `deduction_rate` double DEFAULT NULL,
  `deduction_amount` double DEFAULT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `role_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deletable` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=No, 2=Yes',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role_name`, `deletable`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', '1', NULL, NULL, NULL, NULL),
(2, 'Admin', '1', NULL, NULL, NULL, NULL),
(39, 'Managing Director (MD)', '2', NULL, NULL, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(40, 'Factory Manager', '2', NULL, NULL, '2022-03-03 09:24:10', '2022-03-03 09:24:10'),
(41, 'Chief Executive Officer (CEO)', '2', NULL, NULL, '2022-03-03 09:25:13', '2022-03-03 09:25:13'),
(42, 'Chief Financial Officer (CFO)', '2', NULL, NULL, '2022-03-03 09:26:02', '2022-03-03 09:26:02'),
(43, 'Warehouse Manager', '2', NULL, NULL, '2022-03-03 09:28:05', '2023-05-16 19:19:50'),
(45, 'Accounts', '2', NULL, NULL, '2022-11-26 16:24:26', '2022-11-28 11:04:18'),
(46, 'ASM', '2', NULL, NULL, '2022-11-30 14:17:17', '2022-11-30 14:17:17'),
(47, 'DEPO Incharge', '2', NULL, NULL, '2022-12-11 12:22:29', '2022-12-11 12:22:29'),
(48, 'Nutritionist', '2', NULL, NULL, '2023-05-14 16:22:18', '2023-05-14 16:22:18'),
(49, 'Purchase Manager', '2', NULL, NULL, '2023-05-16 19:29:17', '2023-05-16 19:29:17'),
(50, 'Sales Manager', '2', NULL, NULL, '2023-05-16 19:33:23', '2023-05-16 19:33:23'),
(51, 'Demo', '2', NULL, NULL, '2023-05-31 05:04:18', '2023-05-31 05:04:18');

-- --------------------------------------------------------

--
-- Table structure for table `salarys`
--

CREATE TABLE `salarys` (
  `id` bigint UNSIGNED NOT NULL,
  `created_by` int NOT NULL,
  `employee_id` bigint UNSIGNED NOT NULL,
  `employee_type` tinyint NOT NULL COMMENT '1= Provision , 2 = Permanent, 3 = Full Time , 4 = Part Time',
  `basic_salary` double NOT NULL DEFAULT '0',
  `house_rent_allowance` double NOT NULL DEFAULT '0',
  `medical_allowance` double NOT NULL DEFAULT '0',
  `transport_allowance` double NOT NULL DEFAULT '0',
  `mobile_allowance` double NOT NULL DEFAULT '0',
  `other_allowance` double NOT NULL DEFAULT '0',
  `provident_fund_contribution` double NOT NULL DEFAULT '0',
  `tax_deduction` double NOT NULL DEFAULT '0',
  `provident_fund_deduction` double NOT NULL DEFAULT '0',
  `other_deduction` double NOT NULL DEFAULT '0',
  `gross_salary` double NOT NULL DEFAULT '0',
  `total_deduction` double NOT NULL DEFAULT '0',
  `total_provident_fund` double NOT NULL DEFAULT '0',
  `net_salary` double NOT NULL DEFAULT '0',
  `date` date NOT NULL,
  `month` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `joining_month` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `retired_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `salarys`
--

INSERT INTO `salarys` (`id`, `created_by`, `employee_id`, `employee_type`, `basic_salary`, `house_rent_allowance`, `medical_allowance`, `transport_allowance`, `mobile_allowance`, `other_allowance`, `provident_fund_contribution`, `tax_deduction`, `provident_fund_deduction`, `other_deduction`, `gross_salary`, `total_deduction`, `total_provident_fund`, `net_salary`, `date`, `month`, `joining_month`, `status`, `retired_date`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 3, 20000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20000, 0, 0, 20000, '2023-03-30', '2023-03', '2023-03', 1, NULL, '2023-03-30 08:48:55', '2023-03-30 08:48:55'),
(2, 1, 2, 2, 20000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20000, 0, 0, 20000, '2023-03-30', '2023-03', '2023-03', 1, NULL, '2023-03-30 08:56:10', '2023-03-30 08:56:10'),
(3, 1, 3, 3, 10000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10000, 0, 0, 10000, '2023-03-30', '2023-03', '2023-03', 1, NULL, '2023-03-30 08:56:29', '2023-03-30 08:56:29'),
(4, 1, 4, 3, 20000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20000, 0, 0, 20000, '2023-03-30', '2023-03', '2023-03', 1, NULL, '2023-03-30 08:56:57', '2023-03-30 08:56:57'),
(5, 1, 5, 3, 20000, 9000, 2000, 1000, 500, 1000, 0, 0, 500, 0, 33500, 500, 500, 33000, '2023-05-06', '2023-05', '2023-05', 1, NULL, '2023-05-06 09:43:24', '2023-05-06 09:43:24');

-- --------------------------------------------------------

--
-- Table structure for table `salary_payments`
--

CREATE TABLE `salary_payments` (
  `id` bigint UNSIGNED NOT NULL,
  `employee_id` bigint UNSIGNED NOT NULL,
  `created_by` int NOT NULL,
  `gross_salary` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `basic_salary` double NOT NULL DEFAULT '0',
  `salary_advance` double DEFAULT '0',
  `total_deduction` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_allowance` double NOT NULL DEFAULT '0',
  `bonus` double DEFAULT NULL,
  `net_salary` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provident_fund` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_type` tinyint NOT NULL COMMENT '1 for cash payment, 2 for chaque payment & 3 for bank payment',
  `payment_month` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `salary_payments`
--

INSERT INTO `salary_payments` (`id`, `employee_id`, `created_by`, `gross_salary`, `basic_salary`, `salary_advance`, `total_deduction`, `total_allowance`, `bonus`, `net_salary`, `provident_fund`, `payment_amount`, `payment_type`, `payment_month`, `note`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '20000', 20000, 0, '0', 0, 0, '20000', '0', '20000', 1, '2023-03', 'ddddddddddddddd', '2023-03-30 09:47:45', '2023-03-30 09:47:45'),
(2, 2, 1, '20000', 20000, 0, '0', 0, 0, '20000', '0', '20000', 1, '2023-03', 'ddddddddddddddd', '2023-03-30 09:47:45', '2023-03-30 09:47:45'),
(3, 3, 1, '10000', 10000, 0, '0', 0, 0, '10000', '0', '10000', 1, '2023-03', 'ddddddddddddddd', '2023-03-30 09:47:45', '2023-03-30 09:47:45'),
(4, 4, 1, '20000', 20000, 0, '0', 0, 0, '20000', '0', '20000', 1, '2023-03', 'ddddddddddddddd', '2023-03-30 09:47:45', '2023-03-30 09:47:45'),
(5, 1, 1, '20000', 20000, 0, '0', 0, 0, '20000', '0', '20000', 4, '2023-05', 'cash in hand', '2023-05-06 09:45:14', '2023-05-06 09:45:14'),
(6, 2, 1, '20000', 20000, 0, '0', 0, 0, '20000', '0', '20000', 4, '2023-05', 'cash in hand', '2023-05-06 09:45:14', '2023-05-06 09:45:14'),
(7, 3, 1, '10000', 10000, 0, '0', 0, 0, '10000', '0', '10000', 4, '2023-05', 'cash in hand', '2023-05-06 09:45:14', '2023-05-06 09:45:14'),
(8, 4, 1, '20000', 20000, 0, '0', 0, 0, '20000', '0', '20000', 4, '2023-05', 'cash in hand', '2023-05-06 09:45:14', '2023-05-06 09:45:14'),
(9, 5, 1, '33500', 20000, 0, '500', 13500, 0, '33000', '500', '33000', 4, '2023-05', 'cash in hand', '2023-05-06 09:45:14', '2023-05-06 09:45:14');

-- --------------------------------------------------------

--
-- Table structure for table `salary_payment_details`
--

CREATE TABLE `salary_payment_details` (
  `id` bigint UNSIGNED NOT NULL,
  `salary_payment_id` int UNSIGNED NOT NULL,
  `item_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` int UNSIGNED NOT NULL,
  `status` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` bigint UNSIGNED NOT NULL,
  `memo_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salesmen_id` bigint UNSIGNED DEFAULT NULL,
  `area_id` bigint DEFAULT NULL,
  `customer_id` bigint UNSIGNED DEFAULT NULL,
  `sale_date` date NOT NULL,
  `document` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_qty` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_free_qty` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_delivery_quantity` bigint DEFAULT NULL,
  `total_tax` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_commission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_tax` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_tax_rate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_discount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_cost` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `labor_cost` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `previous_due` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `net_total` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grand_total` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `due_amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Paid,2=Partial,3=Due',
  `payment_method` enum('1','2','3') COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '1=Cash,2=Bank Deposit,3=Mobile',
  `reference_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_id` bigint UNSIGNED DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `status` enum('1','2','3') COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '1=Pending,2=Approved,3=Reject',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `memo_no`, `salesmen_id`, `area_id`, `customer_id`, `sale_date`, `document`, `item`, `total_qty`, `total_free_qty`, `total_delivery_quantity`, `total_tax`, `total_price`, `total_commission`, `order_tax`, `order_tax_rate`, `order_discount`, `shipping_cost`, `labor_cost`, `previous_due`, `net_total`, `paid_amount`, `grand_total`, `due_amount`, `payment_status`, `payment_method`, `reference_no`, `account_id`, `note`, `status`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'SINV-230327722', NULL, NULL, 1, '2023-03-27', NULL, '1', '10', '0', 10, '0.00', '2000.00', '2000.00', '0.00', '0', NULL, NULL, NULL, '0.00', '2000.00', '2000.00', '2000.00', '0.00', '1', '1', NULL, 23, NULL, '2', 'Super Admin', NULL, '2023-03-27 07:32:05', '2023-03-27 07:40:22'),
(2, 'SINV-230328545', NULL, NULL, 1, '2023-03-28', NULL, '1', '5', '0', 5, '0.00', '1000.00', '1000.00', '0.00', '0', NULL, NULL, NULL, '0.00', '1000.00', '1000.00', '1000.00', '0.00', '1', '1', NULL, 23, NULL, '2', 'Super Admin', NULL, '2023-03-28 06:06:35', '2023-03-28 06:07:11'),
(3, 'SINV-230329379', NULL, NULL, 1, '2023-03-29', NULL, '1', '10', '0', 10, '0.00', '2000.00', '2000.00', '0.00', '0', NULL, NULL, NULL, '0.00', '2000.00', '2000.00', '2000.00', '0.00', '1', '1', NULL, 23, NULL, '2', 'Super Admin', NULL, '2023-03-29 08:36:35', '2023-03-29 08:41:19'),
(4, 'SINV-230329823', NULL, NULL, 1, '2023-03-29', NULL, '1', '12', '0', 0, '0.00', '2400.00', '2400.00', '0.00', '0', NULL, NULL, NULL, '0.00', '2400.00', '2400.00', '2400.00', '0.00', '1', '1', NULL, 23, NULL, '2', 'Super Admin', NULL, '2023-03-29 09:14:17', '2023-03-29 09:14:27'),
(5, 'SINV-230331616', NULL, NULL, 2, '2023-03-31', NULL, '1', '10', '0', 0, '0.00', '2000.00', '2000.00', '0.00', '0', NULL, NULL, NULL, '1000.00', '3000.00', '3000.00', '2000.00', '0.00', '1', '1', NULL, 23, NULL, '2', 'Super Admin', NULL, '2023-03-31 09:57:13', '2023-04-30 06:43:09'),
(6, 'SINV-230331807', NULL, NULL, 1, '2023-03-31', NULL, '1', '5', '0', 5, '0.00', '1000.00', '1000.00', '0.00', '0', NULL, NULL, NULL, '0.00', '1000.00', '500', '1000.00', '500.00', '2', '2', '1111111111111', 421, NULL, '2', 'Super Admin', NULL, '2023-03-31 09:58:41', '2023-03-31 10:02:59'),
(7, 'SINV-230402704', NULL, NULL, 1, '2023-04-02', NULL, '3', '3', '0', 3, '0.00', '470.00', '470.00', '0.00', '0', NULL, NULL, NULL, '500.00', '970.00', '970.00', '470.00', '0.00', '1', '1', NULL, 23, NULL, '2', 'Super Admin', NULL, '2023-04-02 10:02:15', '2023-04-02 10:05:57'),
(8, 'SINV-230430105', NULL, NULL, 2, '2023-04-30', NULL, '1', '10', '0', 0, '0.00', '700.00', '700.00', '0.00', '0', NULL, NULL, NULL, '-1000.00', '-300.00', '-300.00', '700.00', '0.00', '1', '2', '1255sdgsdfgd', 420, NULL, '2', 'Super Admin', NULL, '2023-04-30 06:06:55', '2023-04-30 06:07:05'),
(9, 'SINV-230430623', NULL, NULL, 2, '2023-04-30', NULL, '1', '10', '0', 0, '0.00', '2000.00', '2000.00', '0.00', '0', NULL, NULL, NULL, '0.00', '2000.00', '2000.00', '2000.00', '0.00', '1', '2', 'fdgfdg', 420, NULL, '2', 'Super Admin', NULL, '2023-04-30 06:36:32', '2023-04-30 06:37:00'),
(10, 'SINV-230430726', NULL, NULL, 2, '2023-04-30', NULL, '1', '10', '0', 0, '0.00', '2000.00', '2000.00', '0.00', '0', NULL, NULL, NULL, '0.00', '2000.00', '2000.00', '2000.00', '0.00', '1', '2', 'sdgfdsg', 420, NULL, '2', 'Super Admin', NULL, '2023-04-30 06:40:20', '2023-04-30 06:41:04'),
(11, 'SINV-230430862', NULL, NULL, 2, '2023-04-30', NULL, '1', '10', '0', 0, '0.00', '2000.00', '2000.00', '0.00', '0', NULL, NULL, NULL, '-1000.00', '1000.00', '1000.00', '2000.00', '0.00', '1', '2', 'xcxhgjg', 420, NULL, '2', 'Super Admin', NULL, '2023-04-30 06:44:42', '2023-04-30 06:47:19'),
(12, 'SINV-230430102', NULL, NULL, 2, '2023-04-30', NULL, '1', '10', '0', 0, '0.00', '2000.00', '2000.00', '0.00', '0', NULL, NULL, NULL, '0.00', '2000.00', '2000.00', '2000.00', '0.00', '1', '2', 'gfhgfhfg', 420, NULL, '2', 'Super Admin', NULL, '2023-04-30 06:49:31', '2023-04-30 06:51:53'),
(13, 'SINV-230430636', NULL, NULL, 1, '2023-04-30', NULL, '1', '10', '0', 0, '0.00', '700.00', '700.00', '0.00', '0', NULL, NULL, NULL, '0.00', '700.00', '0', '700.00', '700.00', '3', '2', NULL, NULL, NULL, '2', 'Super Admin', NULL, '2023-04-30 07:46:29', '2023-04-30 07:46:39'),
(14, 'SINV-230430985', NULL, NULL, 2, '2023-04-30', NULL, '1', '5', '0', 0, '0.00', '350.00', '350.00', '0.00', '0', NULL, NULL, NULL, '0.00', '350.00', '350.00', '350.00', '0.00', '1', '2', 'aa', 421, NULL, '2', 'Super Admin', NULL, '2023-04-30 08:11:42', '2023-04-30 08:11:54'),
(15, 'SINV-230430121', NULL, NULL, 2, '2023-04-30', NULL, '1', '6', '0', 0, '0.00', '420.00', '420.00', '0.00', '0', NULL, NULL, NULL, '0.00', '420.00', '200', '420.00', '220.00', '2', '2', 'sa', 421, NULL, '2', 'Super Admin', NULL, '2023-04-30 08:13:30', '2023-04-30 08:13:47'),
(16, 'SINV-230502494', NULL, NULL, 2, '2023-05-02', NULL, '1', '4', '0', 0, '0.00', '280.00', '280.00', '0.00', '0', NULL, NULL, NULL, '30.00', '310.00', '310.00', '280.00', '0.00', '1', '1', NULL, 23, NULL, '2', 'Super Admin', NULL, '2023-05-02 04:10:19', '2023-05-02 04:10:31'),
(17, 'SINV-230507758', NULL, NULL, 3, '2023-05-07', NULL, '1', '50', '0', 0, '0.00', '2000.00', '2000.00', '0.00', '0', NULL, NULL, NULL, '5000.00', '7000.00', '7000.00', '2000.00', '0.00', '1', '1', NULL, 23, NULL, '2', 'Super Admin', NULL, '2023-05-07 05:16:18', '2023-05-07 05:16:27'),
(18, 'SINV-230509141', NULL, NULL, 3, '2023-05-09', NULL, '1', '12', '0', 12, '0.00', '480.00', '480.00', '0.00', '0', NULL, NULL, NULL, '0.00', '480.00', '0', '480.00', '480.00', '3', NULL, NULL, NULL, NULL, '2', 'Super Admin', NULL, '2023-05-09 09:03:05', '2023-05-09 09:04:54'),
(19, 'SINV-230509127', NULL, NULL, 3, '2023-05-09', NULL, '1', '10', '0', 0, '0.00', '400.00', '400.00', '0.00', '0', NULL, NULL, NULL, '200.00', '600.00', '0', '400.00', '600.00', '3', NULL, NULL, NULL, 'das', '2', 'Super Admin', NULL, '2023-05-09 13:19:20', '2023-05-09 13:19:30'),
(20, 'SINV-230509447', NULL, NULL, 3, '2023-05-09', NULL, '1', '7', '0', 0, '0.00', '280.00', '280.00', '0.00', '0', NULL, NULL, NULL, '0.00', '280.00', '100', '280.00', '180.00', '2', '2', 'hjf21f2', 421, NULL, '2', 'Super Admin', NULL, '2023-05-09 13:27:22', '2023-05-09 13:27:29'),
(21, 'SINV-2305276', NULL, NULL, 1, '2023-05-27', NULL, '1', '1', '0', 0, '0.00', '105.00', '105.00', '0.00', '0', NULL, NULL, NULL, '0.00', '105.00', '0', '105.00', '105.00', '3', NULL, NULL, NULL, NULL, '1', 'Super Admin', NULL, '2023-05-27 04:52:17', '2023-05-27 04:52:17'),
(22, 'SINV-230527814', NULL, NULL, 1, '2023-05-27', NULL, '1', '1', '0', 0, '0.00', '105.00', '105.00', '0.00', '0', NULL, NULL, NULL, '0.00', '105.00', '0', '105.00', '105.00', '3', NULL, NULL, NULL, NULL, '2', 'Super Admin', NULL, '2023-05-27 11:02:46', '2023-05-29 10:05:01'),
(23, 'SINV-230531674', NULL, NULL, 1, '2023-05-31', NULL, '1', '1', '0', 1, '0.00', '100.00', '100.00', '0.00', '0', '0.00', '0.00', '0.00', '105.00', '205', '205', '100.00', '0.00', '1', '1', NULL, 23, NULL, '2', 'Super Admin', 'Super Admin', '2023-05-31 06:51:04', '2023-05-31 07:01:11');

-- --------------------------------------------------------

--
-- Table structure for table `salesmen`
--

CREATE TABLE `salesmen` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `additional_phone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salary` varchar(260) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `warehouse_id` bigint UNSIGNED NOT NULL,
  `asm_id` bigint UNSIGNED NOT NULL,
  `district_id` bigint UNSIGNED NOT NULL,
  `upazila_id` bigint UNSIGNED NOT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salesmen_areas`
--

CREATE TABLE `salesmen_areas` (
  `id` bigint UNSIGNED NOT NULL,
  `salesmen_id` bigint UNSIGNED NOT NULL,
  `area_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salesmen_monthly_targets`
--

CREATE TABLE `salesmen_monthly_targets` (
  `id` bigint UNSIGNED NOT NULL,
  `mtcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salesmen_id` bigint UNSIGNED NOT NULL,
  `target_value` double NOT NULL,
  `achieved_value` double DEFAULT NULL,
  `commission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commission_rate` double(8,2) NOT NULL,
  `commission_earned` double(8,2) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `closing_date` date NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salesmen_product_commissions`
--

CREATE TABLE `salesmen_product_commissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  `product_price` bigint DEFAULT NULL,
  `quantity` bigint DEFAULT NULL,
  `commission_percent` bigint DEFAULT NULL,
  `commission_amount` bigint DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salesmen_product_targets`
--

CREATE TABLE `salesmen_product_targets` (
  `id` bigint UNSIGNED NOT NULL,
  `salesmen_id` bigint UNSIGNED DEFAULT NULL,
  `product_commission_id` bigint UNSIGNED DEFAULT NULL,
  `ptcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `achieved_value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pcs` varchar(260) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sale_products`
--

CREATE TABLE `sale_products` (
  `id` bigint UNSIGNED NOT NULL,
  `sale_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `qty` double NOT NULL,
  `free_qty` double DEFAULT NULL,
  `delivered_qty` bigint DEFAULT NULL,
  `sale_unit_id` bigint UNSIGNED DEFAULT NULL,
  `net_unit_price` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sale_products`
--

INSERT INTO `sale_products` (`id`, `sale_id`, `product_id`, `qty`, `free_qty`, `delivered_qty`, `sale_unit_id`, `net_unit_price`, `discount`, `tax_rate`, `tax`, `total`, `created_at`, `updated_at`) VALUES
(1, 21, 8, 1, 0, 0, 2, 105, 0, 0, 0, 105, NULL, NULL),
(2, 22, 8, 1, 0, 0, 2, 105, 0, 0, 0, 105, NULL, NULL),
(4, 23, 8, 1, 0, 1, 2, 100, 0, 0, 0, 100, NULL, '2023-05-31 07:01:11');

-- --------------------------------------------------------

--
-- Table structure for table `sale_returns`
--

CREATE TABLE `sale_returns` (
  `id` bigint UNSIGNED NOT NULL,
  `return_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `memo_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouse_id` bigint UNSIGNED NOT NULL,
  `customer_id` bigint UNSIGNED DEFAULT NULL,
  `total_price` double NOT NULL,
  `total_deduction` double DEFAULT NULL,
  `tax_rate` double DEFAULT NULL,
  `total_tax` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `deducted_sr_commission` float DEFAULT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci,
  `date` date NOT NULL,
  `return_date` date NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sale_return_products`
--

CREATE TABLE `sale_return_products` (
  `id` bigint UNSIGNED NOT NULL,
  `sale_return_id` bigint UNSIGNED NOT NULL,
  `memo_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch_no` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `return_qty` double NOT NULL,
  `unit_id` bigint UNSIGNED DEFAULT NULL,
  `product_rate` double NOT NULL,
  `deduction_rate` double DEFAULT NULL,
  `deduction_amount` double DEFAULT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('Yh5abX6dkwXo4bmWjG5zsRHbljnDKwlSH353fldO', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiaVJQTFc1c3BhdWpBM1dnb0lrM3ROeWxESXFNTTVOUHZmS3NmM21CRSI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjM2OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvcHJvZHVjdGlvbi9hZGQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MTU6InVzZXJfcGVybWlzc2lvbiI7YTozNDY6e2k6MDtzOjE2OiJkYXNoYm9hcmQtYWNjZXNzIjtpOjE7czoxMToidXNlci1hY2Nlc3MiO2k6MjtzOjg6InVzZXItYWRkIjtpOjM7czo5OiJ1c2VyLWVkaXQiO2k6NDtzOjk6InVzZXItdmlldyI7aTo1O3M6MTE6InVzZXItZGVsZXRlIjtpOjY7czoxNjoidXNlci1idWxrLWRlbGV0ZSI7aTo3O3M6MTE6InVzZXItcmVwb3J0IjtpOjg7czoxMToicm9sZS1hY2Nlc3MiO2k6OTtzOjg6InJvbGUtYWRkIjtpOjEwO3M6OToicm9sZS1lZGl0IjtpOjExO3M6OToicm9sZS12aWV3IjtpOjEyO3M6MTE6InJvbGUtZGVsZXRlIjtpOjEzO3M6MTY6InJvbGUtYnVsay1kZWxldGUiO2k6MTQ7czoxMToicm9sZS1yZXBvcnQiO2k6MTU7czoxMToibWVudS1hY2Nlc3MiO2k6MTY7czo4OiJtZW51LWFkZCI7aToxNztzOjk6Im1lbnUtZWRpdCI7aToxODtzOjExOiJtZW51LWRlbGV0ZSI7aToxOTtzOjE2OiJtZW51LWJ1bGstZGVsZXRlIjtpOjIwO3M6MTE6Im1lbnUtcmVwb3J0IjtpOjIxO3M6MTk6Im1lbnUtYnVpbGRlci1hY2Nlc3MiO2k6MjI7czoxNToibWVudS1tb2R1bGUtYWRkIjtpOjIzO3M6MTY6Im1lbnUtbW9kdWxlLWVkaXQiO2k6MjQ7czoxODoibWVudS1tb2R1bGUtZGVsZXRlIjtpOjI1O3M6MTc6InBlcm1pc3Npb24tYWNjZXNzIjtpOjI2O3M6MTQ6InBlcm1pc3Npb24tYWRkIjtpOjI3O3M6MTU6InBlcm1pc3Npb24tZWRpdCI7aToyODtzOjE3OiJwZXJtaXNzaW9uLWRlbGV0ZSI7aToyOTtzOjIyOiJwZXJtaXNzaW9uLWJ1bGstZGVsZXRlIjtpOjMwO3M6MTc6InBlcm1pc3Npb24tcmVwb3J0IjtpOjMxO3M6MTY6IndhcmVob3VzZS1hY2Nlc3MiO2k6MzI7czoxMzoid2FyZWhvdXNlLWFkZCI7aTozMztzOjE0OiJ3YXJlaG91c2UtZWRpdCI7aTozNDtzOjE2OiJ3YXJlaG91c2UtZGVsZXRlIjtpOjM1O3M6MjE6IndhcmVob3VzZS1idWxrLWRlbGV0ZSI7aTozNjtzOjE2OiJ3YXJlaG91c2UtcmVwb3J0IjtpOjM3O3M6MjI6ImdlbmVyYWwtc2V0dGluZy1hY2Nlc3MiO2k6Mzg7czoyMToiY3VzdG9tZXItZ3JvdXAtYWNjZXNzIjtpOjM5O3M6MTg6ImN1c3RvbWVyLWdyb3VwLWFkZCI7aTo0MDtzOjE5OiJjdXN0b21lci1ncm91cC1lZGl0IjtpOjQxO3M6MjE6ImN1c3RvbWVyLWdyb3VwLWRlbGV0ZSI7aTo0MjtzOjI2OiJjdXN0b21lci1ncm91cC1idWxrLWRlbGV0ZSI7aTo0MztzOjIxOiJjdXN0b21lci1ncm91cC1yZXBvcnQiO2k6NDQ7czoxMToidW5pdC1hY2Nlc3MiO2k6NDU7czo4OiJ1bml0LWFkZCI7aTo0NjtzOjk6InVuaXQtZWRpdCI7aTo0NztzOjExOiJ1bml0LWRlbGV0ZSI7aTo0ODtzOjE2OiJ1bml0LWJ1bGstZGVsZXRlIjtpOjQ5O3M6MTE6InVuaXQtcmVwb3J0IjtpOjUwO3M6MTA6InZhdC1hY2Nlc3MiO2k6NTE7czo3OiJ2YXQtYWRkIjtpOjUyO3M6ODoidmF0LWVkaXQiO2k6NTM7czoxMDoidmF0LWRlbGV0ZSI7aTo1NDtzOjE1OiJ2YXQtYnVsay1kZWxldGUiO2k6NTU7czoxMDoidmF0LXJlcG9ydCI7aTo1NjtzOjI0OiJtYXRlcmlhbC1jYXRlZ29yeS1hY2Nlc3MiO2k6NTc7czoyMToibWF0ZXJpYWwtY2F0ZWdvcnktYWRkIjtpOjU4O3M6MjI6Im1hdGVyaWFsLWNhdGVnb3J5LWVkaXQiO2k6NTk7czoyNDoibWF0ZXJpYWwtY2F0ZWdvcnktZGVsZXRlIjtpOjYwO3M6Mjk6Im1hdGVyaWFsLWNhdGVnb3J5LWJ1bGstZGVsZXRlIjtpOjYxO3M6MjQ6Im1hdGVyaWFsLWNhdGVnb3J5LXJlcG9ydCI7aTo2MjtzOjE1OiJtYXRlcmlhbC1hY2Nlc3MiO2k6NjM7czoxMjoibWF0ZXJpYWwtYWRkIjtpOjY0O3M6MTM6Im1hdGVyaWFsLWVkaXQiO2k6NjU7czoxMzoibWF0ZXJpYWwtdmlldyI7aTo2NjtzOjE1OiJtYXRlcmlhbC1kZWxldGUiO2k6Njc7czoyMDoibWF0ZXJpYWwtYnVsay1kZWxldGUiO2k6Njg7czoxNToibWF0ZXJpYWwtcmVwb3J0IjtpOjY5O3M6Mjg6Im1hdGVyaWFsLXN0b2NrLXJlcG9ydC1hY2Nlc3MiO2k6NzA7czoxNToicHVyY2hhc2UtYWNjZXNzIjtpOjcxO3M6MTI6InB1cmNoYXNlLWFkZCI7aTo3MjtzOjEzOiJwdXJjaGFzZS1lZGl0IjtpOjczO3M6MTM6InB1cmNoYXNlLXZpZXciO2k6NzQ7czoxNToicHVyY2hhc2UtZGVsZXRlIjtpOjc1O3M6MjA6InB1cmNoYXNlLWJ1bGstZGVsZXRlIjtpOjc2O3M6MTU6InB1cmNoYXNlLXJlcG9ydCI7aTo3NztzOjIzOiJwcm9kdWN0LWNhdGVnb3J5LWFjY2VzcyI7aTo3ODtzOjIwOiJwcm9kdWN0LWNhdGVnb3J5LWFkZCI7aTo3OTtzOjIxOiJwcm9kdWN0LWNhdGVnb3J5LWVkaXQiO2k6ODA7czoyMzoicHJvZHVjdC1jYXRlZ29yeS1kZWxldGUiO2k6ODE7czoyODoicHJvZHVjdC1jYXRlZ29yeS1idWxrLWRlbGV0ZSI7aTo4MjtzOjIzOiJwcm9kdWN0LWNhdGVnb3J5LXJlcG9ydCI7aTo4MztzOjE0OiJwcm9kdWN0LWFjY2VzcyI7aTo4NDtzOjExOiJwcm9kdWN0LWFkZCI7aTo4NTtzOjEyOiJwcm9kdWN0LWVkaXQiO2k6ODY7czoxMjoicHJvZHVjdC12aWV3IjtpOjg3O3M6MTQ6InByb2R1Y3QtZGVsZXRlIjtpOjg4O3M6MTk6InByb2R1Y3QtYnVsay1kZWxldGUiO2k6ODk7czoxNDoicHJvZHVjdC1yZXBvcnQiO2k6OTA7czoyMDoicHJpbnQtYmFyY29kZS1hY2Nlc3MiO2k6OTE7czoyNzoicHJvZHVjdC1zdG9jay1yZXBvcnQtYWNjZXNzIjtpOjkyO3M6MTc6InByb2R1Y3Rpb24tYWNjZXNzIjtpOjkzO3M6MTQ6InByb2R1Y3Rpb24tYWRkIjtpOjk0O3M6MTU6InByb2R1Y3Rpb24tZWRpdCI7aTo5NTtzOjE1OiJwcm9kdWN0aW9uLXZpZXciO2k6OTY7czoxNzoicHJvZHVjdGlvbi1kZWxldGUiO2k6OTc7czoxODoicHJvZHVjdGlvbi1hcHByb3ZlIjtpOjk4O3M6MTc6InByb2R1Y3Rpb24tcmVwb3J0IjtpOjk5O3M6MTU6ImN1c3RvbWVyLWFjY2VzcyI7aToxMDA7czoxMjoiY3VzdG9tZXItYWRkIjtpOjEwMTtzOjIyOiJjdXN0b21lci1sZWRnZXItYWNjZXNzIjtpOjEwMjtzOjE1OiJzdXBwbGllci1hY2Nlc3MiO2k6MTAzO3M6MTI6InN1cHBsaWVyLWFkZCI7aToxMDQ7czoxMzoic3VwcGxpZXItZWRpdCI7aToxMDU7czoxMzoic3VwcGxpZXItdmlldyI7aToxMDY7czoxNToic3VwcGxpZXItZGVsZXRlIjtpOjEwNztzOjIwOiJzdXBwbGllci1idWxrLWRlbGV0ZSI7aToxMDg7czoxNToic3VwcGxpZXItcmVwb3J0IjtpOjEwOTtzOjIyOiJzdXBwbGllci1sZWRnZXItYWNjZXNzIjtpOjExMDtzOjIzOiJzdXBwbGllci1hZHZhbmNlLWFjY2VzcyI7aToxMTE7czoxMzoicmV0dXJuLWFjY2VzcyI7aToxMTI7czoyMjoicHVyY2hhc2UtcmV0dXJuLWFjY2VzcyI7aToxMTM7czoxOToicHVyY2hhc2UtcmV0dXJuLWFkZCI7aToxMTQ7czoyMDoicHVyY2hhc2UtcmV0dXJuLXZpZXciO2k6MTE1O3M6MjI6InB1cmNoYXNlLXJldHVybi1kZWxldGUiO2k6MTE2O3M6MTA6ImNvYS1hY2Nlc3MiO2k6MTE3O3M6NzoiY29hLWFkZCI7aToxMTg7czo4OiJjb2EtZWRpdCI7aToxMTk7czoxMDoiY29hLWRlbGV0ZSI7aToxMjA7czoyMjoib3BlbmluZy1iYWxhbmNlLWFjY2VzcyI7aToxMjE7czoyMzoic3VwcGxpZXItcGF5bWVudC1hY2Nlc3MiO2k6MTIyO3M6MjM6ImN1c3RvbWVyLXJlY2VpdmUtYWNjZXNzIjtpOjEyMztzOjIxOiJjb250cmEtdm91Y2hlci1hY2Nlc3MiO2k6MTI0O3M6MTg6ImNvbnRyYS12b3VjaGVyLWFkZCI7aToxMjU7czoxOToiY29udHJhLXZvdWNoZXItdmlldyI7aToxMjY7czoyMToiY29udHJhLXZvdWNoZXItZGVsZXRlIjtpOjEyNztzOjIyOiJqb3VybmFsLXZvdWNoZXItYWNjZXNzIjtpOjEyODtzOjE5OiJqb3VybmFsLXZvdWNoZXItYWRkIjtpOjEyOTtzOjIwOiJqb3VybmFsLXZvdWNoZXItdmlldyI7aToxMzA7czoyMjoiam91cm5hbC12b3VjaGVyLWRlbGV0ZSI7aToxMzE7czoxNDoidm91Y2hlci1hY2Nlc3MiO2k6MTMyO3M6MTU6InZvdWNoZXItYXBwcm92ZSI7aToxMzM7czoxMjoidm91Y2hlci1lZGl0IjtpOjEzNDtzOjE0OiJ2b3VjaGVyLWRlbGV0ZSI7aToxMzU7czoyMToiZ2VuZXJhbC1sZWRnZXItYWNjZXNzIjtpOjEzNjtzOjE5OiJleHBlbnNlLWl0ZW0tYWNjZXNzIjtpOjEzNztzOjE2OiJleHBlbnNlLWl0ZW0tYWRkIjtpOjEzODtzOjE3OiJleHBlbnNlLWl0ZW0tZWRpdCI7aToxMzk7czoxOToiZXhwZW5zZS1pdGVtLWRlbGV0ZSI7aToxNDA7czoyNDoiZXhwZW5zZS1pdGVtLWJ1bGstZGVsZXRlIjtpOjE0MTtzOjE5OiJleHBlbnNlLWl0ZW0tcmVwb3J0IjtpOjE0MjtzOjE0OiJleHBlbnNlLWFjY2VzcyI7aToxNDM7czoxMToiZXhwZW5zZS1hZGQiO2k6MTQ0O3M6MTI6ImV4cGVuc2UtZWRpdCI7aToxNDU7czoxNDoiZXhwZW5zZS1kZWxldGUiO2k6MTQ2O3M6MTk6ImV4cGVuc2UtYnVsay1kZWxldGUiO2k6MTQ3O3M6MTQ6ImV4cGVuc2UtcmVwb3J0IjtpOjE0ODtzOjE1OiJleHBlbnNlLWFwcHJvdmUiO2k6MTQ5O3M6MjQ6ImV4cGVuc2Utc3RhdGVtZW50LWFjY2VzcyI7aToxNTA7czoxMToiYmFuay1hY2Nlc3MiO2k6MTUxO3M6ODoiYmFuay1hZGQiO2k6MTUyO3M6OToiYmFuay1lZGl0IjtpOjE1MztzOjExOiJiYW5rLWRlbGV0ZSI7aToxNTQ7czoxMToiYmFuay1yZXBvcnQiO2k6MTU1O3M6MjM6ImJhbmstdHJhbnNhY3Rpb24tYWNjZXNzIjtpOjE1NjtzOjE4OiJiYW5rLWxlZGdlci1hY2Nlc3MiO2k6MTU3O3M6MTg6Im1vYmlsZS1iYW5rLWFjY2VzcyI7aToxNTg7czoxNToibW9iaWxlLWJhbmstYWRkIjtpOjE1OTtzOjE2OiJtb2JpbGUtYmFuay1lZGl0IjtpOjE2MDtzOjE4OiJtb2JpbGUtYmFuay1kZWxldGUiO2k6MTYxO3M6MjM6Im1vYmlsZS1iYW5rLWJ1bGstZGVsZXRlIjtpOjE2MjtzOjE4OiJtb2JpbGUtYmFuay1yZXBvcnQiO2k6MTYzO3M6MzA6Im1vYmlsZS1iYW5rLXRyYW5zYWN0aW9uLWFjY2VzcyI7aToxNjQ7czoyNToibW9iaWxlLWJhbmstbGVkZ2VyLWFjY2VzcyI7aToxNjU7czoxNToiZGlzdHJpY3QtYWNjZXNzIjtpOjE2NjtzOjEyOiJkaXN0cmljdC1hZGQiO2k6MTY3O3M6MTM6ImRpc3RyaWN0LWVkaXQiO2k6MTY4O3M6MTU6ImRpc3RyaWN0LWRlbGV0ZSI7aToxNjk7czoyMDoiZGlzdHJpY3QtYnVsay1kZWxldGUiO2k6MTcwO3M6MTU6ImRpc3RyaWN0LXJlcG9ydCI7aToxNzE7czoxNDoidXBhemlsYS1hY2Nlc3MiO2k6MTcyO3M6MTE6InVwYXppbGEtYWRkIjtpOjE3MztzOjEyOiJ1cGF6aWxhLWVkaXQiO2k6MTc0O3M6MTQ6InVwYXppbGEtZGVsZXRlIjtpOjE3NTtzOjE5OiJ1cGF6aWxhLWJ1bGstZGVsZXRlIjtpOjE3NjtzOjE0OiJ1cGF6aWxhLXJlcG9ydCI7aToxNzc7czoxMToiYXJlYS1hY2Nlc3MiO2k6MTc4O3M6ODoiYXJlYS1hZGQiO2k6MTc5O3M6OToiYXJlYS1lZGl0IjtpOjE4MDtzOjExOiJhcmVhLWRlbGV0ZSI7aToxODE7czoxNjoiYXJlYS1idWxrLWRlbGV0ZSI7aToxODI7czoxMToiYXJlYS1yZXBvcnQiO2k6MTgzO3M6MjA6InByb2R1Y3Rpb24tb3BlcmF0aW9uIjtpOjE4NDtzOjE5OiJwcm9kdWN0aW9uLXRyYW5zZmVyIjtpOjE4NTtzOjIwOiJzdXBwbGllci1hZHZhbmNlLWFkZCI7aToxODY7czoyMToic3VwcGxpZXItYWR2YW5jZS1lZGl0IjtpOjE4NztzOjIzOiJzdXBwbGllci1hZHZhbmNlLWRlbGV0ZSI7aToxODg7czoyODoic3VwcGxpZXItYWR2YW5jZS1idWxrLWRlbGV0ZSI7aToxODk7czoyNDoic3VwcGxpZXItYWR2YW5jZS1hcHByb3ZlIjtpOjE5MDtzOjE5OiJmaW5pc2gtZ29vZHMtYWNjZXNzIjtpOjE5MTtzOjE5OiJzYWxlcy1yZXBvcnQtYWNjZXNzIjtpOjE5MjtzOjM0OiJtYXRlcmlhbC1zdG9jay1hbGVydC1yZXBvcnQtYWNjZXNzIjtpOjE5MztzOjIwOiJkZWJpdC12b3VjaGVyLWFjY2VzcyI7aToxOTQ7czoyMToiY3JlZGl0LXZvdWNoZXItYWNjZXNzIjtpOjE5NTtzOjEzOiJjdXN0b21lci1lZGl0IjtpOjE5NjtzOjEzOiJjdXN0b21lci12aWV3IjtpOjE5NztzOjE3OiJkZWJpdC12b3VjaGVyLWFkZCI7aToxOTg7czoxODoiY3JlZGl0LXZvdWNoZXItYWRkIjtpOjE5OTtzOjE1OiJjdXN0b21lci1kZWxldGUiO2k6MjAwO3M6MTE6InNhbGUtYWNjZXNzIjtpOjIwMTtzOjg6InNhbGUtYWRkIjtpOjIwMjtzOjk6InNhbGUtZWRpdCI7aToyMDM7czo5OiJzYWxlLXZpZXciO2k6MjA0O3M6MTE6InNhbGUtZGVsZXRlIjtpOjIwNTtzOjE2OiJzYWxlLWJ1bGstZGVsZXRlIjtpOjIwNjtzOjE4OiJzYWxlLXJldHVybi1hY2Nlc3MiO2k6MjA3O3M6MTU6InNhbGUtcmV0dXJuLWFkZCI7aToyMDg7czoxNjoic2FsZS1yZXR1cm4tdmlldyI7aToyMDk7czoxODoic2FsZS1yZXR1cm4tZGVsZXRlIjtpOjIxMDtzOjMzOiJwcm9kdWN0LXN0b2NrLWFsZXJ0LXJlcG9ydC1hY2Nlc3MiO2k6MjExO3M6MjM6InNhbGVzbWVuLXBheW1lbnQtYWNjZXNzIjtpOjIxMjtzOjI4OiJtYXRlcmlhbC1zdG9jay1sZWRnZXItYWNjZXNzIjtpOjIxMztzOjMxOiJtYXRlcmlhbC1zdG9jay1sZWRnZXItY29zdC12aWV3IjtpOjIxNDtzOjE4OiJkZWJpdC12b3VjaGVyLXZpZXciO2k6MjE1O3M6MjA6ImRlYml0LXZvdWNoZXItZGVsZXRlIjtpOjIxNjtzOjE5OiJjcmVkaXQtdm91Y2hlci12aWV3IjtpOjIxNztzOjIxOiJjcmVkaXQtdm91Y2hlci1kZWxldGUiO2k6MjE4O3M6MjA6InB1cmNoYXNlLXBheW1lbnQtYWRkIjtpOjIxOTtzOjIxOiJwdXJjaGFzZS1wYXltZW50LWVkaXQiO2k6MjIwO3M6MjE6InB1cmNoYXNlLXBheW1lbnQtdmlldyI7aToyMjE7czoyMzoicHVyY2hhc2UtcGF5bWVudC1kZWxldGUiO2k6MjIyO3M6MjU6InRyYW5zZmVyLWludmVudG9yeS1hY2Nlc3MiO2k6MjIzO3M6MjI6InRyYW5zZmVyLWludmVudG9yeS1hZGQiO2k6MjI0O3M6MjM6InRyYW5zZmVyLWludmVudG9yeS1lZGl0IjtpOjIyNTtzOjIzOiJ0cmFuc2Zlci1pbnZlbnRvcnktdmlldyI7aToyMjY7czoyNToidHJhbnNmZXItaW52ZW50b3J5LWRlbGV0ZSI7aToyMjc7czozMDoidHJhbnNmZXItaW52ZW50b3J5LWJ1bGstZGVsZXRlIjtpOjIyODtzOjEzOiJkZWFsZXItYWNjZXNzIjtpOjIyOTtzOjEwOiJkZWFsZXItYWRkIjtpOjIzMDtzOjExOiJkZWFsZXItZWRpdCI7aToyMzE7czoxMToiZGVhbGVyLXZpZXciO2k6MjMyO3M6MTM6ImRlYWxlci1kZWxldGUiO2k6MjMzO3M6MTg6ImRlYWxlci1idWxrLWRlbGV0ZSI7aToyMzQ7czoyMDoiZGVhbGVyLWxlZGdlci1hY2Nlc3MiO2k6MjM1O3M6MjE6ImRlYWxlci1hZHZhbmNlLWFjY2VzcyI7aToyMzY7czoxODoiZGVhbGVyLWFkdmFuY2UtYWRkIjtpOjIzNztzOjE5OiJkZWFsZXItYWR2YW5jZS1lZGl0IjtpOjIzODtzOjIxOiJkZWFsZXItYWR2YW5jZS1kZWxldGUiO2k6MjM5O3M6MjY6ImRlYWxlci1hZHZhbmNlLWJ1bGstZGVsZXRlIjtpOjI0MDtzOjE4OiJzYWxlLXN0YXR1cy1jaGFuZ2UiO2k6MjQxO3M6MjE6InNhbGUtcHJvZHVjdC1kZWxpdmVyeSI7aToyNDI7czoyMDoiY3VzdG9tZXItcmVjZWl2ZS1hZGQiO2k6MjQzO3M6MjM6ImN1c3RvbWVyLXJlY2VpdmUtZGVsZXRlIjtpOjI0NDtzOjI0OiJjdXN0b21lci1yZWNlaXZlLWRldGFpbHMiO2k6MjQ1O3M6MjM6InN1cHBsaWVyLXBheW1lbnQtY3JlYXRlIjtpOjI0NjtzOjI0OiJzdXBwbGllci1wYXltZW50LWRldGFpbHMiO2k6MjQ3O3M6MjM6InN1cHBsaWVyLXBheW1lbnQtZGVsZXRlIjtpOjI0ODtzOjIwOiJzYWxlc21lbi1wYXltZW50LWFkZCI7aToyNDk7czoyNDoic2FsZXNtZW4tcGF5bWVudC1kZXRhaWxzIjtpOjI1MDtzOjIzOiJzYWxlc21lbi1wYXltZW50LWRlbGV0ZSI7aToyNTE7czoyMjoicHVyY2hhc2UtY2hhbmdlLXN0YXR1cyI7aToyNTI7czoxNzoiYXR0ZW5kYW5jZS1yZXBvcnQiO2k6MjUzO3M6MjI6ImF0dGVuZGFuY2UtYnVsay1kZWxldGUiO2k6MjU0O3M6MTc6ImF0dGVuZGFuY2UtZGVsZXRlIjtpOjI1NTtzOjE1OiJhdHRlbmRhbmNlLWVkaXQiO2k6MjU2O3M6MTQ6ImF0dGVuZGFuY2UtYWRkIjtpOjI1NztzOjE3OiJhdHRlbmRhbmNlLWFjY2VzcyI7aToyNTg7czoyNDoiYXR0ZW5kYW5jZS1yZXBvcnQtYWNjZXNzIjtpOjI1OTtzOjIxOiJ3ZWVrbHktaG9saWRheS1yZXBvcnQiO2k6MjYwO3M6MjY6IndlZWtseS1ob2xpZGF5LWJ1bGstZGVsZXRlIjtpOjI2MTtzOjIxOiJ3ZWVrbHktaG9saWRheS1kZWxldGUiO2k6MjYyO3M6MTk6IndlZWtseS1ob2xpZGF5LWVkaXQiO2k6MjYzO3M6MTg6IndlZWtseS1ob2xpZGF5LWFkZCI7aToyNjQ7czoyMToid2Vla2x5LWhvbGlkYXktYWNjZXNzIjtpOjI2NTtzOjE0OiJob2xpZGF5LXJlcG9ydCI7aToyNjY7czoxOToiaG9saWRheS1idWxrLWRlbGV0ZSI7aToyNjc7czoxNDoiaG9saWRheS1kZWxldGUiO2k6MjY4O3M6MTI6ImhvbGlkYXktZWRpdCI7aToyNjk7czoxMToiaG9saWRheS1hZGQiO2k6MjcwO3M6MTQ6ImhvbGlkYXktYWNjZXNzIjtpOjI3MTtzOjE1OiJlbXBsb3llZS1hY2Nlc3MiO2k6MjcyO3M6MTI6ImVtcGxveWVlLWFkZCI7aToyNzM7czoxMzoiZW1wbG95ZWUtZWRpdCI7aToyNzQ7czoxMzoiZW1wbG95ZWUtdmlldyI7aToyNzU7czoxNToiZW1wbG95ZWUtZGVsZXRlIjtpOjI3NjtzOjE1OiJlbXBsb3llZS1yZXBvcnQiO2k6Mjc3O3M6MTM6ImxhYm91ci1hY2Nlc3MiO2k6Mjc4O3M6MTA6ImxhYm91ci1hZGQiO2k6Mjc5O3M6MTE6ImxhYm91ci1lZGl0IjtpOjI4MDtzOjEzOiJsYWJvdXItcmVwb3J0IjtpOjI4MTtzOjE3OiJkZXBhcnRtZW50LWFjY2VzcyI7aToyODI7czoxNDoiZGVwYXJ0bWVudC1hZGQiO2k6MjgzO3M6MTU6ImRlcGFydG1lbnQtZWRpdCI7aToyODQ7czoxNzoiZGVwYXJ0bWVudC1kZWxldGUiO2k6Mjg1O3M6MTc6ImRlcGFydG1lbnQtcmVwb3J0IjtpOjI4NjtzOjE4OiJkZXNpZ25hdGlvbi1hY2Nlc3MiO2k6Mjg3O3M6MTU6ImRlc2lnbmF0aW9uLWFkZCI7aToyODg7czoxNjoiZGVzaWduYXRpb24tZWRpdCI7aToyODk7czoxODoiZGVzaWduYXRpb24tZGVsZXRlIjtpOjI5MDtzOjE4OiJkZXNpZ25hdGlvbi1yZXBvcnQiO2k6MjkxO3M6MTA6ImJyYW5jaC1hZGQiO2k6MjkyO3M6MTE6ImJyYW5jaC1lZGl0IjtpOjI5MztzOjEzOiJicmFuY2gtZGVsZXRlIjtpOjI5NDtzOjEzOiJicmFuY2gtYWNjZXNzIjtpOjI5NTtzOjEzOiJzYWxhcnktYWNjZXNzIjtpOjI5NjtzOjEwOiJzYWxhcnktYWRkIjtpOjI5NztzOjExOiJzYWxhcnktZWRpdCI7aToyOTg7czoxMToic2FsYXJ5LXZpZXciO2k6Mjk5O3M6MTM6InNhbGFyeS1kZWxldGUiO2k6MzAwO3M6MTM6InNhbGFyeS1yZXBvcnQiO2k6MzAxO3M6MjE6InNhbGFyeS1wYXltZW50LWFjY2VzcyI7aTozMDI7czoxODoic2FsYXJ5LXBheW1lbnQtYWRkIjtpOjMwMztzOjE5OiJzYWxhcnktcGF5bWVudC1lZGl0IjtpOjMwNDtzOjIxOiJzYWxhcnktcGF5bWVudC1kZWxldGUiO2k6MzA1O3M6MTk6InNhbGFyeS1wYXltZW50LXZpZXciO2k6MzA2O3M6MTY6ImluY3JlbWVudC1hY2Nlc3MiO2k6MzA3O3M6MTM6ImluY3JlbWVudC1hZGQiO2k6MzA4O3M6MTQ6ImluY3JlbWVudC1lZGl0IjtpOjMwOTtzOjE2OiJpbmNyZW1lbnQtZGVsZXRlIjtpOjMxMDtzOjE0OiJpbmNyZW1lbnQtdmlldyI7aTozMTE7czoxMjoiYm9udXMtYWNjZXNzIjtpOjMxMjtzOjk6ImJvbnVzLWFkZCI7aTozMTM7czoxMDoiYm9udXMtZWRpdCI7aTozMTQ7czoxNzoiYWxsb3dhbmNlcy1hY2Nlc3MiO2k6MzE1O3M6MTQ6ImFsbG93YW5jZXMtYWRkIjtpOjMxNjtzOjE1OiJhbGxvd2FuY2VzLWVkaXQiO2k6MzE3O3M6MTc6ImFsbG93YW5jZXMtZGVsZXRlIjtpOjMxODtzOjE1OiJhbGxvd2FuY2VzLXZpZXciO2k6MzE5O3M6MTY6ImRlZHVjdGlvbi1hY2Nlc3MiO2k6MzIwO3M6MTM6ImRlZHVjdGlvbi1hZGQiO2k6MzIxO3M6MTQ6ImRlZHVjdGlvbi1lZGl0IjtpOjMyMjtzOjE2OiJkZWR1Y3Rpb24tZGVsZXRlIjtpOjMyMztzOjE0OiJkZWR1Y3Rpb24tdmlldyI7aTozMjQ7czoxODoic2FsYXJ5LWFkdmFuY2UtYWRkIjtpOjMyNTtzOjE5OiJzYWxhcnktYWR2YW5jZS1lZGl0IjtpOjMyNjtzOjIxOiJzYWxhcnktYWR2YW5jZS1hY2Nlc3MiO2k6MzI3O3M6Mjg6ImxhYm91ci1zYWxhcnktcGF5bWVudC1hY2Nlc3MiO2k6MzI4O3M6MjU6ImxhYm91ci1zYWxhcnktcGF5bWVudC1hZGQiO2k6MzI5O3M6MjY6ImxhYm91ci1zYWxhcnktcGF5bWVudC1lZGl0IjtpOjMzMDtzOjI2OiJsYWJvdXItc2FsYXJ5LXBheW1lbnQtdmlldyI7aTozMzE7czoyODoibGFib3VyLXNhbGFyeS1wYXltZW50LWRlbGV0ZSI7aTozMzI7czoyMToiZGVhbGVyLXJlY2VpdmUtZGVsZXRlIjtpOjMzMztzOjIyOiJkZWFsZXItcmVjZWl2ZS1kZXRhaWxzIjtpOjMzNDtzOjIxOiJkZWFsZXItcmVjZWl2ZS1hY2Nlc3MiO2k6MzM1O3M6MTc6ImR1ZS1yZXBvcnQtYWNjZXNzIjtpOjMzNjtzOjIyOiJwdXJjaGFzZS1yZXBvcnQtYWNjZXNzIjtpOjMzNztzOjIwOiJkZWFsZXItcmVwb3J0LWFjY2VzcyI7aTozMzg7czoyMToicHJvZHVjdC1sZWRnZXItYWNjZXNzIjtpOjMzOTtzOjMwOiJpbmNvbWUtc3RhdGVtZW50LXJlcG9ydC1hY2Nlc3MiO2k6MzQwO3M6MTU6ImRlYWxlci1zYWxlLWFkZCI7aTozNDE7czoyODoiZGVhbGVyLXNhbGUtcHJvZHVjdC1kZWxpdmVyeSI7aTozNDI7czoyNToiZGVhbGVyLXNhbGUtc3RhdHVzLWNoYW5nZSI7aTozNDM7czoxNjoiZGVhbGVy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OjEyOiJpbmNyZW1lbnRpbmciO2I6MTtzOjc6IgAqAHdpdGgiO2E6MDp7fXM6MTI6IgAqAHdpdGhDb3VudCI7YTowOnt9czoxOToicHJldmVudHNMYXp5TG9hZGluZyI7YjowO3M6MTA6IgAqAHBlclBhZ2UiO2k6MTU7czo2OiJleGlzdHMiO2I6MTtzOjE4OiJ3YXNSZWNlbnRseUNyZWF0ZWQiO2I6MDtzOjI4OiIAKgBlc2NhcGVXaGVuQ2FzdGluZ1RvU3RyaW5nIjtiOjA7czoxMzoiACoAYXR0cmlidXRlcyI7YToxMjp7czoyOiJpZCI7aToxNjtzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO3M6MToiMiI7czoxMToibW9kdWxlX25hbWUiO3M6ODoiQ2F0ZWdvcnkiO3M6MTM6ImRpdmlkZXJfdGl0bGUiO047czoxMDoiaWNvbl9jbGFzcyI7TjtzOjM6InVybCI7czoxNzoibWF0ZXJpYWwvY2F0ZWdvcnkiO3M6NToib3JkZXIiO2k6MTtzOjk6InBhcmVudF9pZCI7aToxNTtzOjY6InRhcmdldCI7czo1OiJfc2VsZiI7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyMS0wNy0xMyAxMDoyMTozMiI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyMS0wNy0xMyAxMDo0Mjo0OCI7fXM6MTE6IgAqAG9yaWdpbmFsIjthOjEyOntzOjI6ImlkIjtpOjE2O3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7czoxOiIyIjtzOjExOiJtb2R1bGVfbmFtZSI7czo4OiJDYXRlZ29yeSI7czoxMzoiZGl2aWRlcl90aXRsZSI7TjtzOjEwOiJpY29uX2NsYXNzIjtOO3M6MzoidXJsIjtzOjE3OiJtYXRlcmlhbC9jYXRlZ29yeSI7czo1OiJvcmRlciI7aToxO3M6OToicGFyZW50X2lkIjtpOjE1O3M6NjoidGFyZ2V0IjtzOjU6Il9zZWxmIjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDIxLTA3LTEzIDEwOjIxOjMyIjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDIxLTA3LTEzIDEwOjQyOjQ4Ijt9czoxMDoi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AGtleVR5cGUiO3M6MzoiaW50IjtzOjEyOiJpbmNyZW1lbnRpbmciO2I6MTtzOjc6IgAqAHdpdGgiO2E6MDp7fXM6MTI6IgAqAHdpdGhDb3VudCI7YTowOnt9czoxOToicHJldmVudHNMYXp5TG9hZGluZyI7YjowO3M6MTA6IgAqAHBlclBhZ2UiO2k6MTU7czo2OiJleGlzdHMiO2I6MTtzOjE4OiJ3YXNSZWNlbnRseUNyZWF0ZWQiO2I6MDtzOjI4OiIAKgBlc2NhcGVXaGVuQ2FzdGluZ1RvU3RyaW5nIjtiOjA7czoxMzoiACoAYXR0cmlidXRlcyI7YToxMjp7czoyOiJpZCI7aToyNTI7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtzOjE6IjIiO3M6MTE6Im1vZHVsZV9uYW1lIjtzOjI1OiJNYW5hZ2UgVHJhbnNmZXIgSW52ZW50b3J5IjtzOjEzOiJkaXZpZGVyX3RpdGxlIjtOO3M6MTA6Imljb25fY2xhc3MiO047czozOiJ1cmwiO3M6MTg6InRyYW5zZmVyLWludmVudG9yeSI7czo1OiJvcmRlciI7aToyO3M6OToicGFyZW50X2lkIjtpOjI1MDtzOjY6InRhcmdldCI7czo1OiJfc2VsZiI7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyMi0wMy0yMyAxMjozNTowMCI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyMi0wMy0yMyAxMjozNToxMCI7fXM6MTE6IgAqAG9yaWdpbmFsIjthOjEyOntzOjI6ImlkIjtpOjI1MjtzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO3M6MToiMiI7czoxMToibW9kdWxlX25hbWUiO3M6MjU6Ik1hbmFnZSBUcmFuc2ZlciBJbnZlbnRvcnkiO3M6MTM6ImRpdmlkZXJfdGl0bGUiO047czoxMDoiaWNvbl9jbGFzcyI7TjtzOjM6InVybCI7czoxODoidHJhbnNmZXItaW52ZW50b3J5IjtzOjU6Im9yZGVyIjtpOjI7czo5OiJwYXJlbnRfaWQiO2k6MjUwO3M6NjoidGFyZ2V0IjtzOjU6Il9zZWxmIjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDIyLTAzLTIz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aXRoIjthOjA6e31zOjEyOiIAKgB3aXRoQ291bnQiO2E6MDp7fXM6MTk6InByZXZlbnRzTGF6eUxvYWRpbmciO2I6MDtzOjEwOiIAKgBwZXJQYWdlIjtpOjE1O3M6NjoiZXhpc3RzIjtiOjE7czoxODoid2FzUmVjZW50bHlDcmVhdGVkIjtiOjA7czoyODoiACoAZXNjYXBlV2hlbkNhc3RpbmdUb1N0cmluZyI7YjowO3M6MTM6IgAqAGF0dHJpYnV0ZXMiO2E6MTI6e3M6MjoiaWQiO2k6Mjg2O3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7czoxOiIyIjtzOjExOiJtb2R1bGVfbmFtZSI7czoxNToiTWFuYWdlIEVtcGxveWVlIjtzOjEzOiJkaXZpZGVyX3RpdGxlIjtOO3M6MTA6Imljb25fY2xhc3MiO047czozOiJ1cmwiO3M6MTU6Im1hbmFnZS1lbXBsb3llZSI7czo1OiJvcmRlciI7aToxO3M6OToicGFyZW50X2lkIjtpOjI4NTtzOjY6InRhcmdldCI7czo1OiJfc2VsZiI7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyMy0wMy0xMiAxMTowODowMSI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyMy0wMy0xMiAxMTowOTowMSI7fXM6MTE6IgAqAG9yaWdpbmFsIjthOjEyOntzOjI6ImlkIjtpOjI4NjtzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO3M6MToiMiI7czoxMToibW9kdWxlX25hbWUiO3M6MTU6Ik1hbmFnZSBFbXBsb3llZSI7czoxMzoiZGl2aWRlcl90aXRsZSI7TjtzOjEwOiJpY29uX2NsYXNzIjtOO3M6MzoidXJsIjtzOjE1OiJtYW5hZ2UtZW1wbG95ZWUiO3M6NToib3JkZXIiO2k6MTtzOjk6InBhcmVudF9pZCI7aToyODU7czo2OiJ0YXJnZXQiO3M6NToiX3NlbGYiO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjMtMDMtMTIgMTE6MDg6MDEiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjMtMDMtMTIgMTE6MDk6MDEiO31zOjEwOiIAKgBjaGFuZ2VzIjthOjA6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cGVyUGFnZSI7aToxNTtzOjY6ImV4aXN0cyI7YjoxO3M6MTg6Indhc1JlY2VudGx5Q3JlYXRlZCI7YjowO3M6Mjg6IgAqAGVzY2FwZVdoZW5DYXN0aW5nVG9TdHJpbmciO2I6MDtzOjEzOiIAKgBhdHRyaWJ1dGVzIjthOjEyOntzOjI6ImlkIjtpOjMwNTtzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO3M6MToiMiI7czoxMToibW9kdWxlX25hbWUiO3M6MjE6Ik1hbmFnZSBTYWxhcnkgQWR2YW5jZSI7czoxMzoiZGl2aWRlcl90aXRsZSI7TjtzOjEwOiJpY29uX2NsYXNzIjtOO3M6MzoidXJsIjtzOjIxOiJtYW5hZ2Utc2FsYXJ5LWFkdmFuY2UiO3M6NToib3JkZXIiO2k6NztzOjk6InBhcmVudF9pZCI7aToyOTg7czo2OiJ0YXJnZXQiO3M6NToiX3NlbGYiO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjMtMDMtMTIgMTQ6NTI6NTgiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjMtMDMtMTIgMTQ6NTM6NTEiO31zOjExOiIAKgBvcmlnaW5hbCI7YToxMjp7czoyOiJpZCI7aTozMDU7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtzOjE6IjIiO3M6MTE6Im1vZHVsZV9uYW1lIjtzOjIxOiJNYW5hZ2UgU2FsYXJ5IEFkdmFuY2UiO3M6MTM6ImRpdmlkZXJfdGl0bGUiO047czoxMDoiaWNvbl9jbGFzcyI7TjtzOjM6InVybCI7czoyMToibWFuYWdlLXNhbGFyeS1hZHZhbmNlIjtzOjU6Im9yZGVyIjtpOjc7czo5OiJwYXJlbnRfaWQiO2k6Mjk4O3M6NjoidGFyZ2V0IjtzOjU6Il9zZWxmIjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDIzLTAzLTEyIDE0OjUyOjU4IjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDIzLTAzLTEyIDE0OjUzOjUxIjt9czoxMDoiACoAY2hhbmdlcyI7YTowOnt9czo4OiIAKgBjYXN0cyI7YTowOnt9czoxNzoiACoAY2xhc3NDYXN0Q2FjaGUiO2E6MDp7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', 1685939165);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES
(1, 'title', 'INSAF AGRO', NULL, NULL),
(2, 'email', 'insafagro22@gmail.com', NULL, NULL),
(3, 'contact_no', '+880258053917', NULL, NULL),
(4, 'address', '152, West Shawrapara, 2nd Floor, Mirpur Dhaka-1216', NULL, NULL),
(5, 'currency_code', 'BDT', NULL, NULL),
(6, 'currency_symbol', 'Tk', NULL, NULL),
(7, 'currency_position', '2', NULL, NULL),
(8, 'timezone', 'Asia/Dhaka', NULL, NULL),
(9, 'date_format', 'd-M-Y', NULL, NULL),
(10, 'logo', 'milon-logo.png', NULL, NULL),
(11, 'favicon', 'milon-favicon.png', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zipcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `company_name`, `mobile`, `email`, `city`, `zipcode`, `address`, `status`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'reza', 'nai', '0192', 'hdfksj@gmail.com', NULL, NULL, NULL, '1', 'Super Admin', NULL, '2023-05-14 16:49:35', '2023-05-14 16:49:35'),
(2, 'Justin', 'justin shop', '01298732541', 'sdf@fds.fd', 'Dhaka, Bangladesh', '1229', 'house-44, road-8/A, Nikunjo-1, Khillket, Dhaka-1229', '1', 'Super Admin', NULL, '2023-05-31 04:03:04', '2023-05-31 04:03:04');

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `taxes`
--

INSERT INTO `taxes` (`id`, `name`, `rate`, `status`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'Vat 15%', '15', '1', 'Admin', NULL, '2022-12-01 14:18:04', '2022-12-01 14:18:04');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint UNSIGNED NOT NULL,
  `chart_of_account_id` bigint UNSIGNED DEFAULT NULL,
  `warehouse_id` bigint UNSIGNED DEFAULT NULL,
  `voucher_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `voucher_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `voucher_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `debit` double DEFAULT NULL,
  `credit` double DEFAULT NULL,
  `is_opening` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=Yes, 2=No',
  `posted` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Yes, 2=No',
  `approve` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Yes, 2=No,3=Pending',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `chart_of_account_id`, `warehouse_id`, `voucher_no`, `voucher_type`, `voucher_date`, `description`, `debit`, `credit`, `is_opening`, `posted`, `approve`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 249, 1, 'PINV-1001', 'Purchase', '2023-05-14', 'Supplierreza', 0, 430500, '2', '1', '1', 'Super Admin', NULL, '2023-05-14 16:50:49', NULL),
(2, 17, 1, 'PINV-1001', 'Purchase', '2023-05-14', 'Inventory Debit For Supplier reza', 430500, 0, '2', '1', '1', 'Super Admin', NULL, '2023-05-14 16:50:49', NULL),
(3, 1, 1, 'PINV-1001', 'Purchase', '2023-05-14', 'Company Credit For Supplier reza', 430500, 0, '2', '1', '', 'Super Admin', NULL, '2023-05-14 16:50:49', NULL),
(4, 249, 1, 'PINV-1001', 'Purchase', '2023-05-14', 'Supplierreza', 430500, 0, '2', '1', '1', 'Super Admin', NULL, '2023-05-14 16:50:49', '2023-05-14 16:50:49'),
(5, 23, 1, 'PINV-1001', 'Purchase', '2023-05-14', 'Paid amount for Supplierreza', 430500, 0, '2', '1', '1', 'Super Admin', NULL, '2023-05-14 16:50:49', '2023-05-14 16:50:49'),
(6, 249, 1, 'PINV-1002', 'Purchase', '2023-05-21', 'Supplierreza', 0, 680000, '2', '1', '1', 'Super Admin', NULL, '2023-05-21 09:28:25', NULL),
(7, 17, 1, 'PINV-1002', 'Purchase', '2023-05-21', 'Inventory Debit For Supplier reza', 680000, 0, '2', '1', '1', 'Super Admin', NULL, '2023-05-21 09:28:25', NULL),
(8, 1, 1, 'PINV-1002', 'Purchase', '2023-05-21', 'Company Credit For Supplier reza', 680000, 0, '2', '1', '', 'Super Admin', NULL, '2023-05-21 09:28:25', NULL),
(9, 249, 1, 'PINV-1002', 'Purchase', '2023-05-21', 'Supplierreza', 680000, 0, '2', '1', '1', 'Super Admin', NULL, '2023-05-21 09:28:25', '2023-05-21 09:28:25'),
(10, 23, 1, 'PINV-1002', 'Purchase', '2023-05-21', 'Paid amount for Supplierreza', 680000, 0, '2', '1', '1', 'Super Admin', NULL, '2023-05-21 09:28:25', '2023-05-21 09:28:25'),
(11, 445, 5, 'CV-20230521333', 'CV', '2023-05-21', 'vcxcxv', 0, 200, '2', '1', '3', 'Super Admin', NULL, '2023-05-21 09:30:36', NULL),
(12, 23, 5, 'CV-20230521333', 'CV', '2023-05-21', 'Credit Voucher From Cash In Hand', 200, 0, '2', '1', '3', 'Super Admin', NULL, '2023-05-21 09:30:36', NULL),
(13, 444, 5, 'CV-20230521333', 'CV', '2023-05-21', 'vcxcxv', 0, 300, '2', '1', '3', 'Super Admin', NULL, '2023-05-21 09:30:36', NULL),
(14, 23, 5, 'CV-20230521333', 'CV', '2023-05-21', 'Credit Voucher From Cash In Hand', 300, 0, '2', '1', '3', 'Super Admin', NULL, '2023-05-21 09:30:36', NULL),
(15, 446, 5, 'CV-20230521759', 'CV', '2023-05-21', 'paid for paper bill and electric bill', 0, 150, '2', '1', '1', 'Super Admin', NULL, '2023-05-21 09:32:25', '2023-05-21 09:33:01'),
(16, 23, 5, 'CV-20230521759', 'CV', '2023-05-21', 'Credit Voucher From Cash In Hand', 150, 0, '2', '1', '1', 'Super Admin', NULL, '2023-05-21 09:32:25', '2023-05-21 09:33:01'),
(17, 447, 5, 'CV-20230521759', 'CV', '2023-05-21', 'paid for paper bill and electric bill', 0, 130, '2', '1', '1', 'Super Admin', NULL, '2023-05-21 09:32:25', '2023-05-21 09:33:01'),
(18, 23, 5, 'CV-20230521759', 'CV', '2023-05-21', 'Credit Voucher From Cash In Hand', 130, 0, '2', '1', '1', 'Super Admin', NULL, '2023-05-21 09:32:25', '2023-05-21 09:33:01'),
(19, 249, 1, 'PINV-1003', 'Purchase', '2023-05-21', 'Supplierreza', 0, 20000, '2', '1', '1', 'Super Admin', NULL, '2023-05-21 09:35:21', NULL),
(20, 17, 1, 'PINV-1003', 'Purchase', '2023-05-21', 'Inventory Debit For Supplier reza', 20000, 0, '2', '1', '1', 'Super Admin', NULL, '2023-05-21 09:35:21', NULL),
(21, 1, 1, 'PINV-1003', 'Purchase', '2023-05-21', 'Company Credit For Supplier reza', 20000, 0, '2', '1', '', 'Super Admin', NULL, '2023-05-21 09:35:21', NULL),
(22, 249, 1, 'PINV-1003', 'Purchase', '2023-05-21', 'Supplierreza', 20000, 0, '2', '1', '1', 'Super Admin', NULL, '2023-05-21 09:35:21', '2023-05-21 09:35:21'),
(23, 23, 1, 'PINV-1003', 'Purchase', '2023-05-21', 'Paid amount for Supplierreza', 20000, 0, '2', '1', '1', 'Super Admin', NULL, '2023-05-21 09:35:21', '2023-05-21 09:35:21'),
(24, 8, 5, 'JOURNALV-230521153537474', 'JOURNALV', '2023-05-21', 'dsfdsf', 210, 0, '2', '1', '3', 'Super Admin', NULL, '2023-05-21 09:35:58', NULL),
(25, 23, 5, 'JOURNALV-230521153537474', 'JOURNALV', '2023-05-21', 'dsfdsf', 0, 210, '2', '1', '3', 'Super Admin', NULL, '2023-05-21 09:35:58', NULL),
(26, 446, 5, 'EXP-20230524171714767', 'Expense', '2023-05-24', 'Electric bill Expense EXP-20230524171714767', 2500, 0, '2', '1', '1', 'Super Admin', NULL, '2023-05-24 11:17:14', NULL),
(27, 23, 5, 'EXP-20230524171714767', 'Expense', '2023-05-24', 'Electric bill Expense EXP-20230524171714767', 0, 2500, '2', '1', '1', 'Super Admin', NULL, '2023-05-24 11:17:14', NULL),
(28, 447, 5, 'EXP-20230524173403214', 'Expense', '2023-05-24', 'Paper bill Expense EXP-20230524173403214', 6000, 0, '2', '1', '1', 'Super Admin', NULL, '2023-05-24 11:34:03', NULL),
(29, 420, 5, 'EXP-20230524173403214', 'Expense', '2023-05-24', 'dutch bangla bank Expense EXP-20230524173403214', 0, 6000, '2', '1', '1', 'Super Admin', NULL, '2023-05-24 11:34:03', NULL),
(30, 249, 1, 'PINV-1005', 'Purchase', '2023-05-27', 'Supplierreza', 0, 3300, '2', '1', '1', 'Super Admin', NULL, '2023-05-27 04:30:45', NULL),
(31, 17, 1, 'PINV-1005', 'Purchase', '2023-05-27', 'Inventory Debit For Supplier reza', 3300, 0, '2', '1', '1', 'Super Admin', NULL, '2023-05-27 04:30:45', NULL),
(32, 1, 1, 'PINV-1005', 'Purchase', '2023-05-27', 'Company Credit For Supplier reza', 3300, 0, '2', '1', '', 'Super Admin', NULL, '2023-05-27 04:30:45', NULL),
(33, 249, 1, 'PINV-1006', 'Purchase', '2023-05-27', 'Supplierreza', 0, 3300, '2', '1', '1', 'Super Admin', NULL, '2023-05-27 04:32:46', NULL),
(34, 17, 1, 'PINV-1006', 'Purchase', '2023-05-27', 'Inventory Debit For Supplier reza', 3300, 0, '2', '1', '1', 'Super Admin', NULL, '2023-05-27 04:32:46', NULL),
(35, 1, 1, 'PINV-1006', 'Purchase', '2023-05-27', 'Company Credit For Supplier reza', 3300, 0, '2', '1', '', 'Super Admin', NULL, '2023-05-27 04:32:46', NULL),
(36, 249, 1, 'Q7Q7S8XXPE', 'Advance', '2023-05-27', 'Supplier Advance For reza', 0, 5000, '2', '1', '1', 'Super Admin', 'Super Admin', '2023-05-27 06:56:41', '2023-05-27 06:56:48'),
(37, 23, 1, 'Q7Q7S8XXPE', 'Advance', '2023-05-27', 'Cash in Hand For reza', 0, 5000, '2', '1', '1', 'Super Admin', 'Super Admin', '2023-05-27 06:56:41', '2023-05-27 06:56:48'),
(38, 249, 1, 'ON4TOHTV4X', 'Advance', '2023-05-27', 'Supplier Advance For reza', 8000, 0, '2', '1', '1', 'Super Admin', 'Super Admin', '2023-05-27 06:57:50', '2023-05-27 06:58:01'),
(39, 23, 1, 'ON4TOHTV4X', 'Advance', '2023-05-27', 'Cash in Hand For reza', 8000, 0, '2', '1', '1', 'Super Admin', 'Super Admin', '2023-05-27 06:57:50', '2023-05-27 06:58:01'),
(40, 249, 1, 'PINV-1007', 'Purchase', '2023-05-28', 'Supplierreza', 0, 1000, '2', '1', '1', 'Super Admin', NULL, '2023-05-28 03:31:27', NULL),
(41, 17, 1, 'PINV-1007', 'Purchase', '2023-05-28', 'Inventory Debit For Supplier reza', 1000, 0, '2', '1', '1', 'Super Admin', NULL, '2023-05-28 03:31:27', NULL),
(42, 1, 1, 'PINV-1007', 'Purchase', '2023-05-28', 'Company Credit For Supplier reza', 1000, 0, '2', '1', '', 'Super Admin', NULL, '2023-05-28 03:31:27', NULL),
(43, 249, 1, 'PINV-1007', 'Purchase', '2023-05-28', 'Supplierreza', 500, 0, '2', '1', '1', 'Super Admin', NULL, '2023-05-28 03:31:27', '2023-05-28 03:31:27'),
(44, 23, 1, 'PINV-1007', 'Purchase', '2023-05-28', 'Paid amount for Supplierreza', 500, 0, '2', '1', '1', 'Super Admin', NULL, '2023-05-28 03:31:27', '2023-05-28 03:31:27'),
(45, 267, NULL, 'SINV-230527814', 'INVOICE', '2023-05-27', 'Customer debit For Invoice No -  SINV-230527814 Customer James Bond', 105, 0, '2', '1', '1', 'Super Admin', NULL, '2023-05-29 10:05:01', NULL),
(46, 8, NULL, 'SINV-230527814', 'INVOICE', '2023-05-27', 'Sale Income For Invoice NO - SINV-230527814 Customer James Bond', 0, 105, '2', '1', '1', 'Super Admin', NULL, '2023-05-29 10:05:01', NULL),
(47, 249, 1, 'PINV-1008', 'Purchase', '2023-05-30', 'Supplierreza', 0, 2500, '2', '1', '1', 'Super Admin', NULL, '2023-05-30 05:57:21', NULL),
(48, 17, 1, 'PINV-1008', 'Purchase', '2023-05-30', 'Inventory Debit For Supplier reza', 2500, 0, '2', '1', '1', 'Super Admin', NULL, '2023-05-30 05:57:21', NULL),
(49, 1, 1, 'PINV-1008', 'Purchase', '2023-05-30', 'Company Credit For Supplier reza', 2500, 0, '2', '1', '', 'Super Admin', NULL, '2023-05-30 05:57:21', NULL),
(50, 249, 1, 'PINV-1009', 'Purchase', '2023-05-30', 'Supplierreza', 0, 1750, '2', '1', '1', 'Super Admin', NULL, '2023-05-30 05:59:12', NULL),
(51, 17, 1, 'PINV-1009', 'Purchase', '2023-05-30', 'Inventory Debit For Supplier reza', 1750, 0, '2', '1', '1', 'Super Admin', NULL, '2023-05-30 05:59:12', NULL),
(52, 1, 1, 'PINV-1009', 'Purchase', '2023-05-30', 'Company Credit For Supplier reza', 1750, 0, '2', '1', '', 'Super Admin', NULL, '2023-05-30 05:59:12', NULL),
(53, 249, 1, 'PINV-1010', 'Purchase', '2023-05-30', 'Supplierreza', 0, 1200, '2', '1', '1', 'Super Admin', NULL, '2023-05-30 07:29:05', NULL),
(54, 17, 1, 'PINV-1010', 'Purchase', '2023-05-30', 'Inventory Debit For Supplier reza', 1200, 0, '2', '1', '1', 'Super Admin', NULL, '2023-05-30 07:29:05', NULL),
(55, 1, 1, 'PINV-1010', 'Purchase', '2023-05-30', 'Company Credit For Supplier reza', 1200, 0, '2', '1', '', 'Super Admin', NULL, '2023-05-30 07:29:05', NULL),
(56, 250, 1, 'PINV-1011', 'Purchase', '2023-05-31', 'SupplierJustin', 0, 5000, '2', '1', '1', 'Super Admin', NULL, '2023-05-31 04:03:50', NULL),
(57, 17, 1, 'PINV-1011', 'Purchase', '2023-05-31', 'Inventory Debit For Supplier Justin', 5000, 0, '2', '1', '1', 'Super Admin', NULL, '2023-05-31 04:03:51', NULL),
(58, 1, 1, 'PINV-1011', 'Purchase', '2023-05-31', 'Company Credit For Supplier Justin', 5000, 0, '2', '1', '', 'Super Admin', NULL, '2023-05-31 04:03:51', NULL),
(59, 267, NULL, 'SINV-230531674', 'INVOICE', '2023-05-31', 'Customer debit For Invoice No -  SINV-230531674 Customer James Bond', 100, 0, '2', '1', '1', 'Super Admin', NULL, '2023-05-31 07:00:45', NULL),
(60, 8, NULL, 'SINV-230531674', 'INVOICE', '2023-05-31', 'Sale Income For Invoice NO - SINV-230531674 Customer James Bond', 0, 100, '2', '1', '1', 'Super Admin', NULL, '2023-05-31 07:00:45', NULL),
(61, 23, NULL, 'SINV-230531674', 'INVOICE', '2023-05-31', 'Cash in Hand in Sale for Invoice No - SINV-230531674 customer- James Bond', 205, 0, '2', '1', '1', 'Super Admin', NULL, '2023-05-31 07:00:45', '2023-05-31 07:00:45'),
(62, 267, NULL, 'SINV-230531674', 'INVOICE', '2023-05-31', 'Customer credit for Paid Amount For Customer Invoice NO- SINV-230531674 Customer- James Bond', 0, 205, '2', '1', '1', 'Super Admin', NULL, '2023-05-31 07:00:45', NULL),
(63, 17, 5, 'SINV-230531674', 'INVOICE', '2023-05-31', 'Inventory Credit For Invoice No SINV-230531674', 0, 100, '2', '1', '1', 'Super Admin', NULL, '2023-05-31 07:01:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transfers`
--

CREATE TABLE `transfers` (
  `id` bigint UNSIGNED NOT NULL,
  `challan_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_warehouse_id` bigint UNSIGNED NOT NULL,
  `to_warehouse_id` bigint UNSIGNED NOT NULL,
  `item` double(8,2) NOT NULL,
  `total_qty` double(8,2) NOT NULL,
  `receive_qty` double(8,2) NOT NULL DEFAULT '0.00',
  `damage_qty` double(8,2) NOT NULL DEFAULT '0.00',
  `shipping_cost` double DEFAULT NULL,
  `received_cost` bigint DEFAULT NULL,
  `grand_total` double NOT NULL,
  `transfer_date` date NOT NULL,
  `driver_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dmobile_no` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfer_status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Transfered,2=Pending',
  `receiver_id` bigint UNSIGNED NOT NULL,
  `receive_date` date DEFAULT NULL,
  `receive_status` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '3' COMMENT '1=Full Received,2=Partial,3=Pending',
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transfer_products`
--

CREATE TABLE `transfer_products` (
  `id` bigint UNSIGNED NOT NULL,
  `transfer_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `transfer_qty` double NOT NULL,
  `receive_qty` double NOT NULL DEFAULT '0',
  `damage_qty` double NOT NULL DEFAULT '0',
  `unit_id` bigint UNSIGNED DEFAULT NULL,
  `net_unit_cost` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint UNSIGNED NOT NULL,
  `unit_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `base_unit` int UNSIGNED DEFAULT NULL,
  `operator` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '*',
  `operation_value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '1',
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=active,2=inactive',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `unit_name`, `unit_code`, `base_unit`, `operator`, `operation_value`, `status`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'Piece', 'Pc', NULL, '*', '1', '1', 'Super Admin', NULL, '2021-07-13 19:14:39', '2021-07-13 19:14:39'),
(2, 'Kilogram', 'Kg', NULL, '*', '1', '1', 'Super Admin', 'Super Admin', '2021-07-13 19:14:57', '2022-03-07 11:47:06'),
(10, 'Liter', 'Ltr', NULL, '*', '1', '1', 'Super Admin', NULL, '2021-07-31 09:27:05', '2021-07-31 09:27:05'),
(11, 'Carton - 8', 'Ctn - 8', 1, '*', '8', '1', 'Super Admin', 'Admin', '2021-07-31 09:27:18', '2022-02-28 17:54:01'),
(14, 'Metric Ton', 'MT', 2, '*', '1000', '1', 'Super Admin', 'Super Admin', '2022-03-07 13:48:59', '2023-05-21 08:09:02'),
(15, '1', 'pcs', 1, '*', '1', '1', 'Super Admin', NULL, '2022-11-24 06:14:32', '2022-11-24 06:14:32'),
(16, 'Ton', 'T', 2, '*', '1000', '1', 'Super Admin', 'Super Admin', '2023-05-16 20:00:26', '2023-05-21 08:09:12'),
(17, '50', 'kg', 2, '*', '1', '1', 'Super Admin', NULL, '2023-05-27 03:11:08', '2023-05-27 03:11:08');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `warehouse_id` int DEFAULT NULL,
  `parent_id` int NOT NULL DEFAULT '0',
  `role_id` bigint UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Male,2=Female,3=Other',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `deletable` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=No, 2=Yes',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `warehouse_id`, `parent_id`, `role_id`, `name`, `username`, `email`, `phone`, `avatar`, `gender`, `password`, `status`, `deletable`, `created_by`, `modified_by`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, NULL, 0, 1, 'Super Admin', 'SuperAdmin', 'superadmin@mail.com', '01521225987', NULL, '1', '$2y$10$oyBQnkvC8WZEQffhpEEsyeZPPqXEHmpaErfi62fsfyAw.UMwIzS/m', '1', '1', NULL, NULL, 'GgECnboEd90KQsN257UgvKAXhJPLxE0tnG2Ws7nHvuOBcPB0Bnm3DZnmnzg5', '2021-03-26 17:49:24', '2021-03-26 17:49:24'),
(2, NULL, 0, 2, 'Admin', 'Admin', 'admin@mail.com', '01711154960', NULL, '1', '$2y$10$opnxMmWrqtlHJMJFy1DpY.fIECVnMDoTkUcPBzUm1nRk/apMJqmsi', '1', '1', 'Admin', 'Admin', 'pzWZ3YwqnQ9GR5DN1eMOaUhW6AgWgkw8avOK87jo7ppTnea52jx4Ad61zc5n', '2021-03-26 17:49:24', '2022-10-29 13:35:49'),
(57, 1, 2, 48, 'Tajul', 'formula1', 'md.tajul100@gmail.com', '01912371086', NULL, '1', '$2y$10$d9QaxO2RBAF1vdjpwyu4r.Jtr4GTHRddmktVjSagc1ww3e25SlRAy', '1', '2', 'Super Admin', NULL, NULL, '2023-05-14 16:24:50', '2023-05-14 16:24:50'),
(58, 5, 2, 43, 'Rashed', 'warehouse', 'warehouse@gmail.com', '12342313', NULL, '1', '$2y$10$DOy/ew/sI8Mb84d5UhMBGejVrxEWrV0gu0M82Y06V6bUff.9owbH.', '1', '2', 'Super Admin', 'Super Admin', NULL, '2023-05-16 19:24:01', '2023-05-16 19:27:13'),
(59, 4, 2, 49, 'Hasan', 'purchase', 'insaf_purchase@gmail.com', '21938', NULL, '1', '$2y$10$CKrhj15taTccAvQNACr76eLtWtHgAPcBAsxMh43enXpYADu6K7I36', '1', '2', 'Super Admin', NULL, NULL, '2023-05-16 19:31:40', '2023-05-16 19:31:40'),
(60, 5, 0, 50, 'Chandan Baidhya', 'sales', 'chandanbaidhya@gmail.com', '01722442688', NULL, '1', '$2y$10$0NLDiXLiqMTaEp1kjbgGj.s.XhWtPqpipTJC/dP9mTvvXW.lpTcQC', '1', '2', 'Super Admin', 'Super Admin', NULL, '2023-05-16 19:38:44', '2023-05-23 12:10:00'),
(61, 4, 0, 39, 'Saifur Rahman', 'mdinsaf', 'insafagro22@gmail.com', '01776463383', NULL, '1', '$2y$10$4XK7X34FS.QtHXHP1Son4OrXnkNjYR2pZHbIORVAydAKUWjk2/59a', '1', '2', 'Super Admin', 'Super Admin', NULL, '2023-05-16 19:48:06', '2023-05-31 04:57:32'),
(62, 4, 0, 39, 'Limon', 'limoninsafkorlona', 'hasanlimon11@gmail.com', '01712761315', NULL, '1', '$2y$10$DxtZU7ROQwt0HIZY2cORbOwnchvFn7/tFfG8ium5/qiqdSNWtZSoK', '1', '2', 'Super Admin', 'Super Admin', NULL, '2023-05-16 19:51:50', '2023-05-16 19:53:34'),
(63, 4, 0, 51, 'James Bond', 'jamesbond', 'jamesbond@b2gsoft.com', '01236598475', NULL, '1', '$2y$10$13bC3EPU0NMkQGYVvTK13O2tWkf/IQOPtFAuLyFV73q4rcW/mPOs2', '1', '2', 'Super Admin', NULL, NULL, '2023-05-31 05:05:50', '2023-05-31 05:05:50');

-- --------------------------------------------------------

--
-- Table structure for table `warehouses`
--

CREATE TABLE `warehouses` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `store_manager` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `district_id` bigint UNSIGNED NOT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `deletable` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=No, 2=Yes',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `warehouses`
--

INSERT INTO `warehouses` (`id`, `name`, `store_manager`, `phone`, `email`, `address`, `district_id`, `status`, `deletable`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(4, 'Production Factory', 'Md. Sakib', '+880 1616-070816', 'sakib@insaf.com', 'Gazipur, sreepur ,near narish company, potka bajar', 52, '1', '2', 'Super Admin', 'Super Admin', '2023-05-02 05:59:38', '2023-05-16 19:09:28'),
(5, 'Warehouse', 'XYZ', NULL, NULL, NULL, 43, '1', '1', 'Super Admin', NULL, '2023-05-16 19:14:53', '2023-05-16 19:14:53');

-- --------------------------------------------------------

--
-- Table structure for table `warehouse_material`
--

CREATE TABLE `warehouse_material` (
  `id` bigint UNSIGNED NOT NULL,
  `warehouse_id` bigint UNSIGNED NOT NULL,
  `material_id` bigint UNSIGNED NOT NULL,
  `qty` double(8,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `warehouse_material`
--

INSERT INTO `warehouse_material` (`id`, `warehouse_id`, `material_id`, `qty`, `created_at`, `updated_at`) VALUES
(5, 5, 4, 83.75, '2023-05-21 09:28:24', '2023-06-05 04:25:21'),
(6, 5, 26, 528.75, '2023-05-21 09:28:24', '2023-06-05 04:25:21'),
(7, 5, 11, 896.25, '2023-05-21 09:28:25', '2023-06-05 04:25:21'),
(8, 5, 23, 913.75, '2023-05-21 09:28:25', '2023-06-05 04:25:21'),
(9, 5, 12, 956.25, '2023-05-21 09:28:25', '2023-06-04 08:16:59'),
(10, 5, 38, 965.00, '2023-05-21 09:28:25', '2023-06-04 08:16:59'),
(11, 5, 29, 968.50, '2023-05-21 09:28:25', '2023-06-04 08:16:59'),
(12, 5, 33, 989.50, '2023-05-21 09:28:25', '2023-06-04 08:16:59'),
(13, 5, 41, 994.75, '2023-05-21 09:28:25', '2023-06-04 08:16:59'),
(14, 5, 52, 995.63, '2023-05-21 09:28:25', '2023-06-04 08:16:59'),
(15, 5, 42, 996.50, '2023-05-21 09:28:25', '2023-06-04 08:16:59'),
(16, 5, 51, 998.25, '2023-05-21 09:28:25', '2023-06-04 08:16:59'),
(17, 5, 53, 998.25, '2023-05-21 09:28:25', '2023-06-04 08:16:59'),
(18, 5, 37, 999.13, '2023-05-21 09:28:25', '2023-06-04 08:16:59'),
(19, 5, 43, 999.13, '2023-05-21 09:28:25', '2023-06-04 08:16:59'),
(20, 5, 50, 999.13, '2023-05-21 09:28:25', '2023-06-04 08:16:59'),
(21, 5, 75, 1000.00, '2023-05-21 09:28:25', '2023-05-21 09:28:25'),
(22, 5, 85, 999.13, '2023-05-21 09:28:25', '2023-06-04 08:16:59'),
(23, 5, 90, 999.13, '2023-05-21 09:28:25', '2023-06-04 08:16:59'),
(24, 5, 58, 999.13, '2023-05-21 09:28:25', '2023-06-04 08:16:59'),
(25, 5, 59, 999.13, '2023-05-21 09:28:25', '2023-06-04 08:16:59'),
(26, 5, 65, 999.13, '2023-05-21 09:28:25', '2023-06-04 08:16:59'),
(27, 5, 66, 999.13, '2023-05-21 09:28:25', '2023-06-04 08:16:59'),
(28, 5, 80, 999.57, '2023-05-21 09:28:25', '2023-06-04 08:16:59'),
(29, 5, 55, 999.57, '2023-05-21 09:28:25', '2023-06-04 08:16:59'),
(30, 5, 61, 999.57, '2023-05-21 09:28:25', '2023-06-04 08:16:59'),
(31, 5, 64, 999.57, '2023-05-21 09:28:25', '2023-06-04 08:16:59'),
(32, 5, 71, 999.57, '2023-05-21 09:28:25', '2023-06-04 08:16:59'),
(33, 5, 89, 999.65, '2023-05-21 09:28:25', '2023-06-04 08:16:59'),
(34, 5, 57, 999.73, '2023-05-21 09:28:25', '2023-06-04 08:16:59'),
(35, 5, 84, 999.83, '2023-05-21 09:28:25', '2023-06-04 08:16:59'),
(36, 5, 70, 999.83, '2023-05-21 09:28:25', '2023-06-04 08:16:59'),
(37, 5, 63, 999.53, '2023-05-21 09:28:25', '2023-06-04 08:16:59'),
(38, 5, 18, 947.50, '2023-05-21 09:35:21', '2023-06-04 08:16:59'),
(39, 5, 76, 999.13, '2023-05-21 09:40:27', '2023-06-04 08:16:59'),
(40, 5, 86, 999.73, '2023-05-21 09:42:05', '2023-06-04 08:16:59'),
(41, 4, 25, 100.00, '2023-05-27 04:30:45', '2023-05-27 04:30:45'),
(42, 4, 126, 100.00, '2023-05-27 04:32:46', '2023-05-27 04:32:46'),
(43, 5, 60, 100.00, '2023-05-28 03:31:27', '2023-05-28 03:31:27'),
(44, 5, 125, 180.00, '2023-05-30 05:57:21', '2023-05-30 07:29:05'),
(45, 5, 103, 100.00, '2023-05-31 04:03:50', '2023-05-31 04:03:50'),
(46, 5, 27, 100.00, '2023-06-05 04:15:44', '2023-06-05 04:15:44');

-- --------------------------------------------------------

--
-- Table structure for table `warehouse_product`
--

CREATE TABLE `warehouse_product` (
  `id` bigint UNSIGNED NOT NULL,
  `warehouse_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `qty` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `warehouse_product`
--

INSERT INTO `warehouse_product` (`id`, `warehouse_id`, `product_id`, `qty`, `created_at`, `updated_at`) VALUES
(1, 5, 8, 5, '2023-05-21 09:42:55', '2023-05-31 07:01:11');

-- --------------------------------------------------------

--
-- Table structure for table `working_days`
--

CREATE TABLE `working_days` (
  `id` bigint UNSIGNED NOT NULL,
  `updated_by` int NOT NULL,
  `day` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `working_status` tinyint NOT NULL COMMENT '0 for holiday & 1 for working day',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `yearly_target`
--

CREATE TABLE `yearly_target` (
  `id` bigint UNSIGNED NOT NULL,
  `dealer_id` bigint NOT NULL,
  `qty` int NOT NULL,
  `commission_amount` double(10,2) NOT NULL,
  `paid_amount` double(10,2) NOT NULL,
  `due_amount` double(10,2) NOT NULL,
  `is_paid` tinyint NOT NULL DEFAULT '0' COMMENT '0=not paid, 1=paid',
  `year` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `acheived_qty` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `yearly_target`
--

INSERT INTO `yearly_target` (`id`, `dealer_id`, `qty`, `commission_amount`, `paid_amount`, `due_amount`, `is_paid`, `year`, `status`, `created_by`, `modified_by`, `created_at`, `updated_at`, `acheived_qty`) VALUES
(1, 1, 500, 2000.00, 0.00, 0.00, 0, '2023', '1', 'Super Admin', 'Super Admin', '2023-06-04 06:37:50', NULL, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `advances`
--
ALTER TABLE `advances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `allowances`
--
ALTER TABLE `allowances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendance_settings`
--
ALTER TABLE `attendance_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `award_categories`
--
ALTER TABLE `award_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `a_s_ms`
--
ALTER TABLE `a_s_ms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `a_s_m_areas`
--
ALTER TABLE `a_s_m_areas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `a_s_m_areas_asm_id_foreign` (`asm_id`),
  ADD KEY `a_s_m_areas_area_id_foreign` (`area_id`);

--
-- Indexes for table `a_s_m_monthly_targets`
--
ALTER TABLE `a_s_m_monthly_targets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `a_s_m_monthly_targets_mtcode_unique` (`mtcode`),
  ADD KEY `a_s_m_monthly_targets_asm_id_foreign` (`asm_id`),
  ADD KEY `start_date` (`start_date`),
  ADD KEY `end_date` (`end_date`);

--
-- Indexes for table `banks`
--
ALTER TABLE `banks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `banks_account_number_unique` (`account_number`),
  ADD KEY `banks_warehouse_id_foreign` (`warehouse_id`);

--
-- Indexes for table `bonuses`
--
ALTER TABLE `bonuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `branches_name_unique` (`name`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD UNIQUE KEY `cache_key_unique` (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chart_of_accounts`
--
ALTER TABLE `chart_of_accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `chart_of_accounts_code_unique` (`code`),
  ADD KEY `chart_of_accounts_customer_id_foreign` (`customer_id`),
  ADD KEY `chart_of_accounts_supplier_id_foreign` (`supplier_id`),
  ADD KEY `chart_of_accounts_dealer_id_foreign` (`dealer_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customers_customer_group_id_foreign` (`customer_group_id`),
  ADD KEY `customers_district_id_foreign` (`district_id`),
  ADD KEY `customers_upazila_id_foreign` (`upazila_id`),
  ADD KEY `customers_area_id_foreign` (`area_id`);

--
-- Indexes for table `customer_groups`
--
ALTER TABLE `customer_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customer_groups_group_name_unique` (`group_name`);

--
-- Indexes for table `daily_attendances`
--
ALTER TABLE `daily_attendances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `daily_closings`
--
ALTER TABLE `daily_closings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `daily_closings_warehouse_id_foreign` (`warehouse_id`);

--
-- Indexes for table `damages`
--
ALTER TABLE `damages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `damages_damage_no_unique` (`damage_no`),
  ADD KEY `damages_warehouse_id_foreign` (`warehouse_id`),
  ADD KEY `damages_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `damage_products`
--
ALTER TABLE `damage_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `damage_products_damage_id_foreign` (`damage_id`),
  ADD KEY `damage_products_product_id_foreign` (`product_id`),
  ADD KEY `damage_products_unit_id_foreign` (`unit_id`);

--
-- Indexes for table `dealers`
--
ALTER TABLE `dealers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dealers_username_unique` (`username`),
  ADD KEY `dealers_warehouse_id_foreign` (`warehouse_id`),
  ADD KEY `dealers_district_id_foreign` (`district_id`),
  ADD KEY `dealers_upazila_id_foreign` (`upazila_id`);

--
-- Indexes for table `dealer_deliveries`
--
ALTER TABLE `dealer_deliveries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dealer_deliveries_dealer_id_foreign` (`dealer_id`),
  ADD KEY `dealer_deliveries_warehouse_id_foreign` (`warehouse_id`);

--
-- Indexes for table `dealer_delivery_products`
--
ALTER TABLE `dealer_delivery_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dealer_delivery_products_dealer_delivery_id_foreign` (`dealer_delivery_id`),
  ADD KEY `dealer_delivery_products_product_id_foreign` (`product_id`);

--
-- Indexes for table `dealer_products`
--
ALTER TABLE `dealer_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dealer_products_dealer_id_foreign` (`dealer_id`),
  ADD KEY `dealer_products_product_id_foreign` (`product_id`);

--
-- Indexes for table `dealer_sales`
--
ALTER TABLE `dealer_sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dealer_sales_dealer_id_foreign` (`dealer_id`),
  ADD KEY `dealer_sales_account_id_foreign` (`account_id`);

--
-- Indexes for table `dealer_sale_products`
--
ALTER TABLE `dealer_sale_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dealer_sale_products_dealer_sale_id_foreign` (`dealer_sale_id`),
  ADD KEY `dealer_sale_products_product_id_foreign` (`product_id`),
  ADD KEY `dealer_sale_products_sale_unit_id_foreign` (`sale_unit_id`);

--
-- Indexes for table `deductions`
--
ALTER TABLE `deductions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deliveries_sale_id_foreign` (`sale_id`),
  ADD KEY `deliveries_salesmen_id_foreign` (`salesmen_id`),
  ADD KEY `deliveries_customer_id_foreign` (`customer_id`),
  ADD KEY `deliveries_warehouse_id_foreign` (`warehouse_id`);

--
-- Indexes for table `delivery_products`
--
ALTER TABLE `delivery_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `delivery_products_delivery_id_foreign` (`delivery_id`),
  ADD KEY `delivery_products_product_id_foreign` (`product_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `departments_name_unique` (`name`),
  ADD UNIQUE KEY `departments_depart_code_unique` (`depart_code`);

--
-- Indexes for table `designations`
--
ALTER TABLE `designations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `designations_name_unique` (`name`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employees_email_unique` (`email`);

--
-- Indexes for table `employee_leave_apps`
--
ALTER TABLE `employee_leave_apps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `expenses_voucher_no_unique` (`voucher_no`),
  ADD KEY `expenses_warehouse_id_foreign` (`warehouse_id`),
  ADD KEY `expenses_expense_item_id_foreign` (`expense_item_id`),
  ADD KEY `expenses_account_id_foreign` (`account_id`);

--
-- Indexes for table `expense_items`
--
ALTER TABLE `expense_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `expense_items_name_unique` (`name`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `increments`
--
ALTER TABLE `increments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `labours`
--
ALTER TABLE `labours`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `labour_advances`
--
ALTER TABLE `labour_advances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `labour_leave_apps`
--
ALTER TABLE `labour_leave_apps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `labour_salary_payment`
--
ALTER TABLE `labour_salary_payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leaves`
--
ALTER TABLE `leaves`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave_application_manages`
--
ALTER TABLE `leave_application_manages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leave_application_manages_leave_id_foreign` (`leave_id`);

--
-- Indexes for table `leave_categories`
--
ALTER TABLE `leave_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `leave_categories_leave_category_unique` (`leave_category`);

--
-- Indexes for table `loans`
--
ALTER TABLE `loans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `loans_loan_categories_id_foreign` (`loan_categories_id`),
  ADD KEY `loans_bank_id_foreign` (`bank_id`);

--
-- Indexes for table `loan_categories`
--
ALTER TABLE `loan_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `materials`
--
ALTER TABLE `materials`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `materials_material_code_unique` (`material_code`),
  ADD KEY `materials_category_id_foreign` (`category_id`),
  ADD KEY `materials_unit_id_foreign` (`unit_id`),
  ADD KEY `materials_purchase_unit_id_foreign` (`purchase_unit_id`),
  ADD KEY `materials_tax_id_foreign` (`tax_id`),
  ADD KEY `materials_opening_warehouse_id_foreign` (`opening_warehouse_id`);

--
-- Indexes for table `material_purchase`
--
ALTER TABLE `material_purchase`
  ADD PRIMARY KEY (`id`),
  ADD KEY `material_purchase_purchase_id_foreign` (`purchase_id`),
  ADD KEY `material_purchase_material_id_foreign` (`material_id`),
  ADD KEY `material_purchase_purchase_unit_id_foreign` (`purchase_unit_id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_menu_name_unique` (`menu_name`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mobile_banks`
--
ALTER TABLE `mobile_banks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mobile_banks_warehouse_id_foreign` (`warehouse_id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `modules_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `module_role`
--
ALTER TABLE `module_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `module_role_module_id_foreign` (`module_id`),
  ADD KEY `module_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `monthly_target`
--
ALTER TABLE `monthly_target`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_module_id_foreign` (`module_id`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permission_role_permission_id_foreign` (`permission_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `personal_events`
--
ALTER TABLE `personal_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productions`
--
ALTER TABLE `productions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `productions_batch_no_unique` (`batch_no`),
  ADD KEY `productions_warehouse_id_foreign` (`warehouse_id`);

--
-- Indexes for table `production_products`
--
ALTER TABLE `production_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `production_products_production_id_foreign` (`production_id`),
  ADD KEY `production_products_product_id_foreign` (`product_id`);

--
-- Indexes for table `production_product_materials`
--
ALTER TABLE `production_product_materials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `production_product_materials_production_product_id_foreign` (`production_product_id`),
  ADD KEY `production_product_materials_material_id_foreign` (`material_id`),
  ADD KEY `production_product_materials_unit_id_foreign` (`unit_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_code_unique` (`code`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_base_unit_id_foreign` (`base_unit_id`),
  ADD KEY `products_unit_id_foreign` (`unit_id`),
  ADD KEY `products_tax_id_foreign` (`tax_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `product_material`
--
ALTER TABLE `product_material`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_material_product_id_foreign` (`product_id`),
  ADD KEY `product_material_material_id_foreign` (`material_id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `purchases_memo_no_unique` (`memo_no`),
  ADD KEY `purchases_supplier_id_foreign` (`supplier_id`);

--
-- Indexes for table `purchase_payments`
--
ALTER TABLE `purchase_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_payments_purchase_id_foreign` (`purchase_id`),
  ADD KEY `purchase_payments_account_id_foreign` (`account_id`),
  ADD KEY `purchase_payments_transaction_id_foreign` (`transaction_id`),
  ADD KEY `purchase_payments_supplier_debit_transaction_id_foreign` (`supplier_debit_transaction_id`);

--
-- Indexes for table `purchase_returns`
--
ALTER TABLE `purchase_returns`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `purchase_returns_return_no_unique` (`return_no`),
  ADD KEY `purchase_returns_warehouse_id_foreign` (`warehouse_id`),
  ADD KEY `purchase_returns_supplier_id_foreign` (`supplier_id`);

--
-- Indexes for table `purchase_return_materials`
--
ALTER TABLE `purchase_return_materials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_return_materials_purchase_return_id_foreign` (`purchase_return_id`),
  ADD KEY `purchase_return_materials_material_id_foreign` (`material_id`),
  ADD KEY `purchase_return_materials_unit_id_foreign` (`unit_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_role_name_unique` (`role_name`);

--
-- Indexes for table `salarys`
--
ALTER TABLE `salarys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salary_payments`
--
ALTER TABLE `salary_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salary_payment_details`
--
ALTER TABLE `salary_payment_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sales_salesmen_id_foreign` (`salesmen_id`),
  ADD KEY `sales_customer_id_foreign` (`customer_id`),
  ADD KEY `sales_account_id_foreign` (`account_id`);

--
-- Indexes for table `salesmen`
--
ALTER TABLE `salesmen`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `salesmen_username_unique` (`username`),
  ADD UNIQUE KEY `salesmen_phone_unique` (`phone`),
  ADD KEY `salesmen_warehouse_id_foreign` (`warehouse_id`),
  ADD KEY `salesmen_asm_id_foreign` (`asm_id`),
  ADD KEY `salesmen_district_id_foreign` (`district_id`),
  ADD KEY `salesmen_upazila_id_foreign` (`upazila_id`);

--
-- Indexes for table `salesmen_areas`
--
ALTER TABLE `salesmen_areas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `salesmen_areas_salesmen_id_foreign` (`salesmen_id`),
  ADD KEY `salesmen_areas_area_id_foreign` (`area_id`);

--
-- Indexes for table `salesmen_monthly_targets`
--
ALTER TABLE `salesmen_monthly_targets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `salesmen_monthly_targets_mtcode_unique` (`mtcode`),
  ADD KEY `salesmen_monthly_targets_salesmen_id_foreign` (`salesmen_id`),
  ADD KEY `start_date` (`start_date`),
  ADD KEY `end_date` (`end_date`);

--
-- Indexes for table `salesmen_product_commissions`
--
ALTER TABLE `salesmen_product_commissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salesmen_product_targets`
--
ALTER TABLE `salesmen_product_targets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sale_products`
--
ALTER TABLE `sale_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_products_sale_id_foreign` (`sale_id`),
  ADD KEY `sale_products_product_id_foreign` (`product_id`),
  ADD KEY `sale_products_sale_unit_id_foreign` (`sale_unit_id`);

--
-- Indexes for table `sale_returns`
--
ALTER TABLE `sale_returns`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sale_returns_return_no_unique` (`return_no`),
  ADD KEY `sale_returns_warehouse_id_foreign` (`warehouse_id`),
  ADD KEY `sale_returns_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `sale_return_products`
--
ALTER TABLE `sale_return_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_return_products_sale_return_id_foreign` (`sale_return_id`),
  ADD KEY `sale_return_products_product_id_foreign` (`product_id`),
  ADD KEY `sale_return_products_unit_id_foreign` (`unit_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_name_unique` (`name`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `taxes_name_unique` (`name`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_chart_of_account_id_foreign` (`chart_of_account_id`),
  ADD KEY `transactions_warehouse_id_foreign` (`warehouse_id`);

--
-- Indexes for table `transfers`
--
ALTER TABLE `transfers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transfers_challan_no_unique` (`challan_no`),
  ADD KEY `transfers_from_warehouse_id_foreign` (`from_warehouse_id`),
  ADD KEY `transfers_to_warehouse_id_foreign` (`to_warehouse_id`),
  ADD KEY `transfers_receiver_id_foreign` (`receiver_id`),
  ADD KEY `transfer_date` (`transfer_date`);

--
-- Indexes for table `transfer_products`
--
ALTER TABLE `transfer_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transfer_products_transfer_id_foreign` (`transfer_id`),
  ADD KEY `transfer_products_product_id_foreign` (`product_id`),
  ADD KEY `transfer_products_unit_id_foreign` (`unit_id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`),
  ADD KEY `users_role_id_foreign` (`role_id`),
  ADD KEY `users_warehouse_id_foreign` (`warehouse_id`);

--
-- Indexes for table `warehouses`
--
ALTER TABLE `warehouses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `warehouses_name_unique` (`name`),
  ADD KEY `warehouses_district_id_foreign` (`district_id`);

--
-- Indexes for table `warehouse_material`
--
ALTER TABLE `warehouse_material`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warehouse_material_warehouse_id_foreign` (`warehouse_id`),
  ADD KEY `warehouse_material_material_id_foreign` (`material_id`);

--
-- Indexes for table `warehouse_product`
--
ALTER TABLE `warehouse_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warehouse_id` (`warehouse_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `working_days`
--
ALTER TABLE `working_days`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `yearly_target`
--
ALTER TABLE `yearly_target`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `advances`
--
ALTER TABLE `advances`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `allowances`
--
ALTER TABLE `allowances`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `attendance_settings`
--
ALTER TABLE `attendance_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `award_categories`
--
ALTER TABLE `award_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `a_s_ms`
--
ALTER TABLE `a_s_ms`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `a_s_m_areas`
--
ALTER TABLE `a_s_m_areas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `a_s_m_monthly_targets`
--
ALTER TABLE `a_s_m_monthly_targets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `banks`
--
ALTER TABLE `banks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bonuses`
--
ALTER TABLE `bonuses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `chart_of_accounts`
--
ALTER TABLE `chart_of_accounts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=452;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer_groups`
--
ALTER TABLE `customer_groups`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `daily_attendances`
--
ALTER TABLE `daily_attendances`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `daily_closings`
--
ALTER TABLE `daily_closings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `damages`
--
ALTER TABLE `damages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `damage_products`
--
ALTER TABLE `damage_products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dealers`
--
ALTER TABLE `dealers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `dealer_deliveries`
--
ALTER TABLE `dealer_deliveries`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `dealer_delivery_products`
--
ALTER TABLE `dealer_delivery_products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dealer_products`
--
ALTER TABLE `dealer_products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `dealer_sales`
--
ALTER TABLE `dealer_sales`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `dealer_sale_products`
--
ALTER TABLE `dealer_sale_products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `deductions`
--
ALTER TABLE `deductions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `deliveries`
--
ALTER TABLE `deliveries`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `delivery_products`
--
ALTER TABLE `delivery_products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `designations`
--
ALTER TABLE `designations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_leave_apps`
--
ALTER TABLE `employee_leave_apps`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `expense_items`
--
ALTER TABLE `expense_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `increments`
--
ALTER TABLE `increments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `labours`
--
ALTER TABLE `labours`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `labour_advances`
--
ALTER TABLE `labour_advances`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `labour_leave_apps`
--
ALTER TABLE `labour_leave_apps`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `labour_salary_payment`
--
ALTER TABLE `labour_salary_payment`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `leaves`
--
ALTER TABLE `leaves`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `leave_application_manages`
--
ALTER TABLE `leave_application_manages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leave_categories`
--
ALTER TABLE `leave_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loans`
--
ALTER TABLE `loans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loan_categories`
--
ALTER TABLE `loan_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=724;

--
-- AUTO_INCREMENT for table `materials`
--
ALTER TABLE `materials`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT for table `material_purchase`
--
ALTER TABLE `material_purchase`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=182;

--
-- AUTO_INCREMENT for table `mobile_banks`
--
ALTER TABLE `mobile_banks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=319;

--
-- AUTO_INCREMENT for table `module_role`
--
ALTER TABLE `module_role`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2096;

--
-- AUTO_INCREMENT for table `monthly_target`
--
ALTER TABLE `monthly_target`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=813;

--
-- AUTO_INCREMENT for table `permission_role`
--
ALTER TABLE `permission_role`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5013;

--
-- AUTO_INCREMENT for table `personal_events`
--
ALTER TABLE `personal_events`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `productions`
--
ALTER TABLE `productions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `production_products`
--
ALTER TABLE `production_products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `production_product_materials`
--
ALTER TABLE `production_product_materials`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=225;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `product_material`
--
ALTER TABLE `product_material`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=475;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `purchase_payments`
--
ALTER TABLE `purchase_payments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `purchase_returns`
--
ALTER TABLE `purchase_returns`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_return_materials`
--
ALTER TABLE `purchase_return_materials`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `salarys`
--
ALTER TABLE `salarys`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `salary_payments`
--
ALTER TABLE `salary_payments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `salary_payment_details`
--
ALTER TABLE `salary_payment_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `salesmen`
--
ALTER TABLE `salesmen`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salesmen_areas`
--
ALTER TABLE `salesmen_areas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salesmen_monthly_targets`
--
ALTER TABLE `salesmen_monthly_targets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salesmen_product_commissions`
--
ALTER TABLE `salesmen_product_commissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salesmen_product_targets`
--
ALTER TABLE `salesmen_product_targets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sale_products`
--
ALTER TABLE `sale_products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sale_returns`
--
ALTER TABLE `sale_returns`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sale_return_products`
--
ALTER TABLE `sale_return_products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `transfers`
--
ALTER TABLE `transfers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transfer_products`
--
ALTER TABLE `transfer_products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `warehouses`
--
ALTER TABLE `warehouses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `warehouse_material`
--
ALTER TABLE `warehouse_material`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `warehouse_product`
--
ALTER TABLE `warehouse_product`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `working_days`
--
ALTER TABLE `working_days`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `yearly_target`
--
ALTER TABLE `yearly_target`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `a_s_m_areas`
--
ALTER TABLE `a_s_m_areas`
  ADD CONSTRAINT `a_s_m_areas_area_id_foreign` FOREIGN KEY (`area_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `a_s_m_areas_asm_id_foreign` FOREIGN KEY (`asm_id`) REFERENCES `a_s_ms` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `a_s_m_monthly_targets`
--
ALTER TABLE `a_s_m_monthly_targets`
  ADD CONSTRAINT `a_s_m_monthly_targets_asm_id_foreign` FOREIGN KEY (`asm_id`) REFERENCES `a_s_ms` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_area_id_foreign` FOREIGN KEY (`area_id`) REFERENCES `locations` (`id`),
  ADD CONSTRAINT `customers_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`),
  ADD CONSTRAINT `customers_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `locations` (`id`),
  ADD CONSTRAINT `customers_upazila_id_foreign` FOREIGN KEY (`upazila_id`) REFERENCES `locations` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
