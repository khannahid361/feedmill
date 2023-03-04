-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 04, 2023 at 10:15 AM
-- Server version: 5.7.33
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `insaf`
--

-- --------------------------------------------------------

--
-- Table structure for table `allowance_deductions`
--

CREATE TABLE `allowance_deductions` (
  `id` bigint(20) UNSIGNED NOT NULL,
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `allowance_deduction_id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `type` int(11) DEFAULT NULL COMMENT '1=Alowance, 2=Deduction, 3=Others',
  `basic_salary` double NOT NULL,
  `percentage` int(11) NOT NULL,
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `asset_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `warranty` double(8,2) DEFAULT NULL,
  `user` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cost` double NOT NULL,
  `asset_status` int(11) DEFAULT NULL,
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
  `id` bigint(20) UNSIGNED NOT NULL,
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
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
-- Table structure for table `a_s_ms`
--

CREATE TABLE `a_s_ms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED DEFAULT NULL,
  `district_id` bigint(20) UNSIGNED DEFAULT NULL,
  `upazila_id` bigint(20) UNSIGNED DEFAULT NULL,
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `asm_id` bigint(20) UNSIGNED NOT NULL,
  `area_id` bigint(20) UNSIGNED NOT NULL,
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `mtcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `asm_id` bigint(20) UNSIGNED NOT NULL,
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
  `id` bigint(20) UNSIGNED NOT NULL,
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `batches`
--

CREATE TABLE `batches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `batch_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mill_id` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `total_material_cost` bigint(20) DEFAULT NULL,
  `total_milling_cost` bigint(20) DEFAULT NULL,
  `total_expense_cost` bigint(20) DEFAULT NULL,
  `total_cost` bigint(20) DEFAULT NULL,
  `per_unit_cost` bigint(20) DEFAULT NULL,
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `batch_id` bigint(20) DEFAULT NULL,
  `expense_id` bigint(20) DEFAULT NULL,
  `expense_cost` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `batch_materials`
--

CREATE TABLE `batch_materials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `batch_id` bigint(20) DEFAULT NULL,
  `warehouse_id` bigint(20) DEFAULT NULL,
  `material_id` bigint(20) DEFAULT NULL,
  `unit_id` bigint(20) DEFAULT NULL,
  `quantity` bigint(20) DEFAULT NULL,
  `total_price` bigint(20) DEFAULT NULL,
  `milling` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `batch_products`
--

CREATE TABLE `batch_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `batch_id` bigint(20) DEFAULT NULL,
  `warehouse_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `quantity` bigint(20) DEFAULT NULL,
  `material_id` bigint(20) DEFAULT NULL,
  `pcs` bigint(20) DEFAULT NULL,
  `product_status` enum('1','2') COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '1 = product,2 = byProduct',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('insaf_cache_active_taxes', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:1:{i:0;O:8:\"stdClass\":8:{s:2:\"id\";i:1;s:4:\"name\";s:7:\"Vat 15%\";s:4:\"rate\";s:2:\"15\";s:6:\"status\";s:1:\"1\";s:10:\"created_by\";s:5:\"Admin\";s:11:\"modified_by\";N;s:10:\"created_at\";s:19:\"2022-12-01 20:18:04\";s:10:\"updated_at\";s:19:\"2022-12-01 20:18:04\";}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', 1993268045),
('insaf_cache_active_warehouses', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:6:{i:0;O:8:\"stdClass\":13:{s:2:\"id\";i:1;s:4:\"name\";s:7:\"Factory\";s:13:\"store_manager\";s:6:\"Shorif\";s:5:\"phone\";N;s:5:\"email\";N;s:7:\"address\";s:28:\"Bankhua, Ullapara, Sirajganj\";s:11:\"district_id\";i:83;s:6:\"status\";s:1:\"1\";s:9:\"deletable\";s:1:\"1\";s:10:\"created_by\";s:11:\"Super Admin\";s:11:\"modified_by\";s:5:\"Admin\";s:10:\"created_at\";s:19:\"2022-03-07 20:24:35\";s:10:\"updated_at\";s:19:\"2022-11-28 17:25:28\";}i:1;O:8:\"stdClass\":13:{s:2:\"id\";i:2;s:4:\"name\";s:11:\"Mirpur DEPO\";s:13:\"store_manager\";N;s:5:\"phone\";N;s:5:\"email\";N;s:7:\"address\";s:54:\"152, Ananda Bazar, West Shewrapara, Mirpur, Dhaka-1216\";s:11:\"district_id\";i:2;s:6:\"status\";s:1:\"1\";s:9:\"deletable\";s:1:\"1\";s:10:\"created_by\";s:5:\"Admin\";s:11:\"modified_by\";s:5:\"Admin\";s:10:\"created_at\";s:19:\"2022-03-07 21:14:10\";s:10:\"updated_at\";s:19:\"2022-11-28 17:26:47\";}i:2;O:8:\"stdClass\":13:{s:2:\"id\";i:3;s:4:\"name\";s:15:\"Chittagong DEPO\";s:13:\"store_manager\";s:16:\"Shahadat Hossain\";s:5:\"phone\";s:14:\"+8801991234020\";s:5:\"email\";N;s:7:\"address\";N;s:11:\"district_id\";i:47;s:6:\"status\";s:1:\"1\";s:9:\"deletable\";s:1:\"1\";s:10:\"created_by\";s:11:\"Super Admin\";s:11:\"modified_by\";s:5:\"Admin\";s:10:\"created_at\";s:19:\"2022-03-22 16:24:21\";s:10:\"updated_at\";s:19:\"2022-11-28 17:24:02\";}i:3;O:8:\"stdClass\":13:{s:2:\"id\";i:4;s:4:\"name\";s:13:\"Noakhali DEPO\";s:13:\"store_manager\";s:9:\"Md. Noman\";s:5:\"phone\";s:14:\"+8801818161976\";s:5:\"email\";N;s:7:\"address\";s:30:\"Maijdi Bazar, Maijdi, Noakhali\";s:11:\"district_id\";i:37;s:6:\"status\";s:1:\"1\";s:9:\"deletable\";s:1:\"1\";s:10:\"created_by\";s:11:\"Super Admin\";s:11:\"modified_by\";s:5:\"Admin\";s:10:\"created_at\";s:19:\"2022-05-31 17:00:39\";s:10:\"updated_at\";s:19:\"2022-11-28 17:24:29\";}i:4;O:8:\"stdClass\":13:{s:2:\"id\";i:5;s:4:\"name\";s:11:\"Sylhet DEPO\";s:13:\"store_manager\";N;s:5:\"phone\";N;s:5:\"email\";N;s:7:\"address\";N;s:11:\"district_id\";i:66;s:6:\"status\";s:1:\"1\";s:9:\"deletable\";s:1:\"1\";s:10:\"created_by\";s:5:\"Admin\";s:11:\"modified_by\";N;s:10:\"created_at\";s:19:\"2022-11-28 17:26:32\";s:10:\"updated_at\";s:19:\"2022-11-28 17:26:32\";}i:5;O:8:\"stdClass\":13:{s:2:\"id\";i:6;s:4:\"name\";s:15:\"Jatra Bari DEPO\";s:13:\"store_manager\";s:14:\"Ismail Hossain\";s:5:\"phone\";N;s:5:\"email\";N;s:7:\"address\";N;s:11:\"district_id\";i:2;s:6:\"status\";s:1:\"1\";s:9:\"deletable\";s:1:\"1\";s:10:\"created_by\";s:5:\"Admin\";s:11:\"modified_by\";s:5:\"Admin\";s:10:\"created_at\";s:19:\"2022-11-28 17:27:30\";s:10:\"updated_at\";s:19:\"2022-12-11 18:19:01\";}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', 1993279805);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
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
(2, 'Oil', '2', '1', 'Ruhul Amin', 'Ruhul Amin', '2022-03-02 16:51:33', '2022-03-08 12:38:57'),
(3, 'Rice', '2', '1', 'Ruhul Amin', NULL, '2022-03-02 16:51:54', '2022-03-02 16:51:54'),
(4, 'Spice', '2', '1', 'Ruhul Amin', NULL, '2022-03-02 16:52:27', '2022-03-02 16:52:27'),
(6, 'Puffed Rice', '2', '1', 'Ruhul Amin', NULL, '2022-03-02 16:53:49', '2022-03-02 16:53:49'),
(7, 'Bakery', '2', '1', 'Ruhul Amin', NULL, '2022-03-02 16:54:44', '2022-03-02 16:54:44'),
(22, 'Oil', '1', '1', 'Admin', NULL, '2022-11-28 11:43:54', '2022-11-28 11:43:54'),
(23, 'Rice', '1', '1', 'Admin', NULL, '2022-11-28 11:49:06', '2022-11-28 11:49:06'),
(25, 'Semai', '1', '1', 'Admin', NULL, '2022-11-28 11:50:03', '2022-11-28 11:50:03'),
(26, 'Spice', '1', '1', 'Admin', NULL, '2022-11-28 11:54:19', '2022-11-28 11:54:19'),
(27, 'Puffed Rice', '1', '1', 'Admin', NULL, '2022-11-28 14:40:19', '2022-11-28 14:40:19'),
(28, 'Semai', '2', '1', 'Admin', NULL, '2022-11-28 15:04:42', '2022-11-28 15:04:42'),
(29, 'Pickle', '2', '1', 'Admin', NULL, '2022-11-30 11:51:31', '2022-11-30 11:51:31'),
(30, 'Ready Mix Masala', '2', '1', 'Admin', NULL, '2022-11-30 11:55:01', '2022-11-30 11:55:01'),
(31, 'Pickle', '1', '1', 'Admin', NULL, '2022-11-30 11:56:51', '2022-11-30 11:56:51'),
(32, 'Ready Mix Masala', '1', '1', 'Admin', NULL, '2022-11-30 11:56:58', '2022-11-30 11:56:58'),
(33, 'Ink', '1', '1', 'Admin', 'Admin', '2022-12-01 13:47:52', '2022-12-01 13:48:22');

-- --------------------------------------------------------

--
-- Table structure for table `chart_of_accounts`
--

CREATE TABLE `chart_of_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT '0',
  `type` enum('A','L','I','E') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'A=Asset, L=Liabilty, I=income, E=Expense',
  `transaction` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Yes, 2=No',
  `general_ledger` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Yes, 2=No',
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `supplier_id` bigint(20) UNSIGNED DEFAULT NULL,
  `asm_id` bigint(20) DEFAULT NULL,
  `salesmen_id` int(11) DEFAULT NULL,
  `dealer_id` int(11) DEFAULT NULL,
  `bank_id` int(11) DEFAULT NULL,
  `mobile_bank_id` int(11) DEFAULT NULL,
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
(415, '10202030002', 'Joyonto Kumar', 'Dealer Receivable', 4, 'A', '1', '2', NULL, NULL, NULL, NULL, 1, NULL, NULL, '2', '2', 0, '1', 'Super Admin', NULL, '2023-03-04 09:05:12', '2023-03-04 09:05:12');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shop_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `warehouse_id` int(11) NOT NULL,
  `customer_group_id` bigint(20) UNSIGNED NOT NULL,
  `district_id` bigint(20) UNSIGNED NOT NULL,
  `upazila_id` bigint(20) UNSIGNED NOT NULL,
  `area_id` bigint(20) UNSIGNED NOT NULL,
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
(2, 'Samsul islam', 'Muslim sweets(মুসলিম সুইট )', '012', NULL, NULL, 2, 1, 2, 3, 705, 'Kollanpur bus stand', '1', 'Abdul Hannan', 'Sabbir Hossain (BABU)', '2022-11-30 14:56:26', '2022-12-06 23:43:13'),
(6, 'নুর আলম', 'Ma(মা জেনারেল স্টোর)', '০১ ৭১০৩১১২৭৩', NULL, NULL, 2, 1, 2, 3, 705, 'কল্যাণপুর নতুন বাজার', '1', 'Abdul Hannan', 'Sabbir Hossain (BABU)', '2022-11-30 15:14:38', '2022-12-06 23:41:45'),
(7, 'Prodib(মন্টু চন্দ্র দাস)', 'Prodib(প্রদীপ স্টোর)', '০১৮১১২২৮৬৮৯', NULL, NULL, 2, 1, 2, 3, 705, 'দোকান নং: 19, 82/1 A কল্লানপুর পুর নটুন বাজার', '1', 'Abdul Hannan', 'Sabbir Hossain (BABU)', '2022-11-30 15:16:03', '2022-12-12 19:53:54'),
(8, 'New shfiq(ফিরোজ খান)', 'New shfiq(নিউ শফিক স্টোর)', '০১৭৮৬৫১১৩৯৩', NULL, NULL, 2, 1, 2, 3, 705, 'Kallanpur pur notun bazar', '1', 'Abdul Hannan', 'Sabbir Hossain (BABU)', '2022-11-30 15:18:12', '2022-12-12 19:54:14'),
(9, 'Alamin(আলামিন)', 'Alamin(আলামিন স্টোর)', '০১৯১৩৩৮৯০৩৫', NULL, NULL, 2, 1, 2, 3, 708, 'Uttar pirerbag kaca bazar', '1', 'Abdul Hannan', 'Sabbir Hossain (BABU)', '2022-11-30 15:19:54', '2022-12-12 19:54:33'),
(10, 'Kamal - কামাল', 'Kamal Stor - কামাল স্টোর', '01660159608', NULL, NULL, 2, 1, 2, 3, 705, 'দোকান নং ২৬ কল্যাণপুর নতুন বাজার', '1', 'Sabbir Hossain (BABU)', 'Sabbir Hossain (BABU)', '2022-11-30 20:33:10', '2022-12-06 13:43:51'),
(11, 'Dalower Joshor(দেলোয়ার হোসেন)', 'Dalower Joshor(দেলোয়ার যশোর স্টোর)', '০১৯০৭০০০৩৭২', NULL, NULL, 2, 1, 2, 3, 708, '৩৩/২উত্তর পীরের বাগ কাচা বাজার', '1', 'Sabbir Hossain (BABU)', 'Sabbir Hossain (BABU)', '2022-11-30 21:02:20', '2022-12-12 19:54:57'),
(12, 'Shodas(আজিজুল ইসলাম রিয়াজ)', 'Shodas(স্বদেশ স্টোর)', '০১৯৭২২৭০২৮৮', NULL, NULL, 2, 1, 2, 3, 708, '৩৩/২ উত্তর পীরেরবাগ কাঁচা বাজার', '1', 'Sabbir Hossain (BABU)', 'Sabbir Hossain (BABU)', '2022-11-30 21:06:47', '2022-12-12 19:55:14'),
(13, 'Sotota(মিজানুর রহমান)', 'Sotota(সততা স্টোর)', '০১৯১৬৮৩২২২৯৩', NULL, NULL, 2, 1, 2, 3, 708, '৩৩/২ উত্তর পীরের বা কাঁচা বাজার', '1', 'Sabbir Hossain (BABU)', 'Sabbir Hossain (BABU)', '2022-11-30 21:10:12', '2022-12-12 19:55:32'),
(14, 'সবুজ ইসলাম', 'Madina(মদিনা স্টোর)', '০১৩০৯২৬৯৭৮৭', NULL, NULL, 2, 1, 2, 3, 708, 'উত্তর পীরের বা কাঁচা বাজার', '1', 'Sabbir Hossain (BABU)', 'Sabbir Hossain (BABU)', '2022-11-30 21:12:28', '2022-12-06 23:37:13'),
(15, 'হোসেন', 'Ma(মা জেনারেল ষ্টোর)', '৯১৮১১২ ০৭১২১', NULL, NULL, 2, 1, 2, 3, 708, 'উত্তর পীরের কাঁচা বাজার', '1', 'Sabbir Hossain (BABU)', 'Sabbir Hossain (BABU)', '2022-11-30 21:15:54', '2022-12-06 23:36:48'),
(16, 'আলমগীর হোসেন', 'Ayat(আয়াত জেনারেল স্টোর)', '০১৭২৩৬৬২৫২০', NULL, NULL, 2, 1, 2, 3, 711, '৩৯৬/১দক্ষিণ পাইকপাড়া', '1', 'Sabbir Hossain (BABU)', 'Sabbir Hossain (BABU)', '2022-11-30 21:20:56', '2022-12-06 23:36:19'),
(17, 'সীমান্ত', 'Simanto(সীমান্ত স্টোর)', '০১৯৯৭৭২৪০৮০', NULL, NULL, 2, 1, 2, 3, 711, 'বাড়ি নং ৩৭৫ দোকান ৩০\r\n চাটমহল রোড দক্ষিন পাইকপাড়া', '1', 'Sabbir Hossain (BABU)', 'Sabbir Hossain (BABU)', '2022-11-30 21:38:45', '2022-12-06 23:35:52'),
(18, 'রনি হোসেন', 'Adorsho banijjo(আদর্শ বাণিজ্য ভান্ডার)', '০১৯২০০৯৬৬০৯৯', NULL, NULL, 2, 1, 2, 3, 705, '৮২/১ কল্যাণপুর নতুন বাজার', '1', 'Sabbir Hossain (BABU)', 'Sabbir Hossain (BABU)', '2022-11-30 21:42:15', '2022-12-06 23:33:33'),
(19, 'ইমাম হোসেন', 'Youshof(ইউসুফ খাদ্য বিতান)', '০১৯৮৮১৭০৭২৫', NULL, NULL, 2, 1, 2, 3, 705, 'কল্যাণপুর নতুন বাজার', '1', 'Sabbir Hossain (BABU)', 'Sabbir Hossain (BABU)', '2022-11-30 21:45:16', '2022-12-06 23:32:00'),
(20, 'গোলাম মাওলা', 'Sarower(সারোয়ার স্টোর)', '০১৬১২৩৫২৫৪৪', NULL, NULL, 2, 1, 2, 3, 705, 'কল্যানপুর নতুন বাজার', '1', 'Sabbir Hossain (BABU)', 'Sabbir Hossain (BABU)', '2022-11-30 21:49:20', '2022-12-06 23:31:22'),
(21, 'Kamaler dokan(কামাল হোসেন)', 'Kamaler Dokan(কামালের দোকান)', '০১৭১১৪৭৩৬৭৩', NULL, NULL, 2, 1, 2, 3, 710, '৪৪/২ উত্তর পীরেরবাগ , মিরপুর -১', '1', 'Sabbir Hossain (BABU)', 'Sabbir Hossain (BABU)', '2022-11-30 22:04:53', '2022-12-10 13:27:18'),
(22, 'Mijan(মিজান)', 'Mijan(মিজান স্টোর)', '০১৮১৩৯৭৮০৮', NULL, NULL, 2, 1, 2, 3, 705, 'দোকান নং ১৮৪ কল্যাণপুর নতুন বাজার', '1', 'Sabbir Hossain (BABU)', 'Sabbir Hossain (BABU)', '2022-11-30 22:06:59', '2022-12-06 23:30:29'),
(23, 'Anower(আনোয়ার ইসলাম)', 'Anower(আনোয়ার স্টোর)', '০১৭৩৩৯৮৬৯৮৭', NULL, NULL, 2, 1, 2, 3, 705, 'কল্যানপুর নতুন বাজার', '1', 'Sabbir Hossain (BABU)', 'Sabbir Hossain (BABU)', '2022-11-30 22:09:37', '2022-12-10 14:39:29'),
(24, 'আব্দুল করিম', 'Motin(মতিন এন্ড ব্রাদার্স)', '০১৮৩২৮২৭১৭৫', NULL, NULL, 2, 1, 2, 3, 705, 'কল্যাণপুর নতুন বাজার', '1', 'Sabbir Hossain (BABU)', 'Sabbir Hossain (BABU)', '2022-11-30 22:11:18', '2022-12-06 23:27:48'),
(25, 'জাবেদ', 'Jabad(জাবেদ স্টোর)', '০১৭২১০৮০৫৩৭', NULL, NULL, 2, 1, 2, 3, 705, '২২৭ কল্যাণপুর নতুন বাজার', '1', 'Sabbir Hossain (BABU)', 'Sabbir Hossain (BABU)', '2022-11-30 22:13:13', '2022-12-06 23:24:07'),
(26, 'Shohal(সোহেল)', 'Shohal(সোহেল স্টোর)', '০১৬৯৯০৪৫৮০৯', NULL, NULL, 2, 1, 2, 3, 705, 'কল্যাণপুর নতুন বাজার', '1', 'Sabbir Hossain (BABU)', 'Sabbir Hossain (BABU)', '2022-11-30 22:14:40', '2022-12-06 23:22:54'),
(27, 'জাকির হোসেন', 'Joya(জয়া স্টোর)', '01874150689', NULL, NULL, 2, 1, 2, 3, 705, 'কল্যাণপুর নতুন বাজার', '1', 'Sabbir Hossain (BABU)', 'Sabbir Hossain (BABU)', '2022-11-30 22:16:50', '2022-12-06 23:21:27'),
(28, 'Rakib(রাকিব)', 'Rakib(রাকিব স্টোর)', '০১৮১১৫৬৪৪৩ (Vl)', NULL, NULL, 2, 1, 2, 3, 705, '২৮৩ কল্যাণপুর নতুন বাজার', '1', 'Sabbir Hossain (BABU)', 'Sabbir Hossain (BABU)', '2022-11-30 22:21:11', '2022-12-06 23:19:53'),
(29, 'Chadpur(রিপন ইসলাম)', 'Chadpur(চাঁদপুর স্টোর)', '০১৭২৭৩৯০৩৮৯', NULL, NULL, 2, 1, 2, 3, 705, 'কল্যানপুর নতুন বাজার', '1', 'Sabbir Hossain (BABU)', 'Sabbir Hossain (BABU)', '2022-11-30 22:22:59', '2022-12-12 19:53:15'),
(30, 'Rasel(রাসেল)', 'Rasel(রাসেল স্টোর)', '০১৭৪৮৪৪০১২৪', NULL, NULL, 2, 1, 2, 3, 705, 'কল্যানপুর নতুন বাজার', '1', 'Sabbir Hossain (BABU)', 'Sabbir Hossain (BABU)', '2022-11-30 22:24:45', '2022-12-06 23:18:00'),
(31, 'Asraful(আশরাফুল)', 'Asraful(আশরাফুল স্টোর)', '০১৮৩৬৯৬১৮০২', NULL, NULL, 2, 1, 2, 3, 705, 'কল্যানপুর নতুন বাজার', '1', 'Sabbir Hossain (BABU)', 'Sabbir Hossain (BABU)', '2022-11-30 22:26:31', '2022-12-06 23:11:21'),
(32, 'Matrivander(জয় দাস)', 'Matrivander(মাতৃভান্ডার ২)', '০১৭৯২০৫৭৪৮', NULL, NULL, 2, 1, 2, 3, 705, 'কল্যাণপুর নতুন বাজার', '1', 'Sabbir Hossain (BABU)', 'Sabbir Hossain (BABU)', '2022-11-30 22:28:43', '2022-12-06 23:07:05'),
(33, 'Imdadul(ইমদাদুল ইসলাম)', 'Imdadul(ইমদাদুল স্টোর )', '০১৬২৭৭৪৫২৪১', NULL, NULL, 2, 1, 2, 3, 705, 'কল্যানপুর দেশময় সুপার মার্কেট', '1', 'Sabbir Hossain (BABU)', 'Sabbir Hossain (BABU)', '2022-11-30 22:33:27', '2022-12-06 23:05:17'),
(34, 'Rokon(রোকন)', 'Rokon(রোকন স্টোর)', '০১৯২৩৫২৪৩৩৩', NULL, NULL, 2, 1, 2, 3, 705, 'কল্যানপুর দেশময় সুপার মার্কেট', '1', 'Sabbir Hossain (BABU)', 'Sabbir Hossain (BABU)', '2022-11-30 22:35:02', '2022-12-06 23:03:48'),
(35, 'Chadpur(জসিম)', 'Chadpur(চাঁদপুর জেনারেল স্টোর)', '০১৯১৪ ০৩০৮৭৬', NULL, NULL, 2, 1, 2, 3, 705, 'দোকান নং ৩০ কল্যাণপুর দেশ ওয়াকফ সময় সুপার মার্কেট', '1', 'Admin', 'Sabbir Hossain (BABU)', '2022-11-30 22:41:33', '2022-12-06 23:03:14'),
(36, 'Jubayer(জুবায়ের)', 'Jubayer(জুবায়ের স্টোর)', '০১৭৯১ ১০০৩৬৯', NULL, NULL, 2, 1, 2, 3, 705, 'dokan no : 27 / 28 কল্যানপুর দেশ ওয়াকফ  সময় সুপার মার্কেট', '1', 'Sabbir Hossain (BABU)', 'Sabbir Hossain (BABU)', '2022-11-30 22:48:46', '2022-12-06 23:02:20'),
(37, 'Jamal(জামাল)', 'Jamal(জামাল স্টোর)', '০১৬৮৮৭৪৮২৭৫', NULL, NULL, 2, 1, 2, 3, 705, 'দোকান নং ৩২ কল্যাণপুর নতুন বাজার', '1', 'Sabbir Hossain (BABU)', 'Sabbir Hossain (BABU)', '2022-11-30 22:54:17', '2022-12-06 23:01:29'),
(38, 'Shoykot(নবীন হোসেন)', 'Shoykot(সৈকত ষ্টোর)', '০১৭৭৩৬১৬৩১৫', NULL, NULL, 2, 1, 2, 3, 705, 'দোকান নং ৩৮/৩৯ কল্যাণপুর নতুন বাজার', '1', 'Sabbir Hossain (BABU)', 'Sabbir Hossain (BABU)', '2022-11-30 22:55:57', '2022-12-06 23:00:50'),
(39, 'Shakil(শাকিল আহমেদ)', 'Shakil(শাকিল স্টোর)', '০১৮৩১০০১২৫৪', NULL, NULL, 2, 1, 2, 3, 713, 'বাউনিয়া বাজার', '1', 'Abdul Hannan', 'Sabbir Hossain (BABU)', '2022-12-01 17:17:47', '2022-12-10 13:32:00'),
(40, 'হাফিজ ইসলাম', 'সোলেমান খান', '০১৬৭৩৮৬৬৫০', NULL, NULL, 2, 1, 2, 3, 713, 'মানিকদি বাজার আমতলা', '1', 'Abdul Hannan', NULL, '2022-12-01 17:23:27', '2022-12-01 17:23:27'),
(41, 'Imran(রোকুনোদ জামাল)', 'Imran(ইমরান স্টোর)', '০১৯৩৭৩০০১৬২', NULL, NULL, 2, 1, 2, 3, 713, 'মানিকদি বাজার আমতলা', '1', 'Abdul Hannan', 'Sabbir Hossain (BABU)', '2022-12-01 17:25:59', '2022-12-06 18:55:58'),
(42, 'Brihottom Noakhali(আব্দুল্লাহ)', 'Brihottom Noakhali(বৃহত্তম নোয়াখালী স্টোর)', '০১৬২০৮৬১৩৫৫', NULL, NULL, 2, 1, 2, 3, 713, 'সবুজ ছাতার গলি মানিকদি', '1', 'Abdul Hannan', 'Sabbir Hossain (BABU)', '2022-12-01 17:30:10', '2022-12-12 19:52:23'),
(43, 'Hazrat shajalal(হযরত শাহজালাল', 'Hazrat shajalal(হযরত শাহজালাল স্টোর', '০১৯১৩৭৪৩৭৩৮', NULL, NULL, 2, 1, 2, 3, 713, 'সবুজ ছাতার গলি মানিকদি', '1', 'Abdul Hannan', 'Sabbir Hossain (BABU)', '2022-12-01 17:32:46', '2022-12-06 19:22:14'),
(44, 'Harun(হারুন ইসলাম)', 'Harun((হারুন স্টোর)', '০১৯৮০০৮০৯৫৫', NULL, NULL, 2, 1, 2, 3, 714, 'বালুঘাট বাজার', '1', 'Abdul Hannan', 'Sabbir Hossain (BABU)', '2022-12-01 17:35:50', '2022-12-06 19:01:30'),
(45, 'Mun mun (নাসির উদ্দীন)', 'Mun mun (মুনমুন স্টোর)', '০১৮৫৫৭১৫২৮৪', NULL, NULL, 2, 1, 2, 3, 713, 'মানিকদি বাজার আমতলা', '1', 'Abdul Hannan', 'Sabbir Hossain (BABU)', '2022-12-01 17:38:23', '2022-12-06 18:53:09'),
(46, 'Ali(খোকনুদ জামাল)', 'Ali(আলী স্টোর)', '০১৬৭৩৪৯৯৮৩৮', NULL, NULL, 2, 1, 2, 3, 713, 'মানিকদি বাজার আমতলা', '1', 'Abdul Hannan', 'Sabbir Hossain (BABU)', '2022-12-01 17:40:31', '2022-12-06 19:00:58'),
(47, 'Fahim (ফাহিম)', 'Fahim(ফাহিম ষ্টোর)', '01874150680', NULL, NULL, 2, 1, 2, 3, 715, 'পশ্চিম বাইস টেকি হাজিআলি হোসেন রোড', '1', 'Sabbir Hossain (BABU)', 'Sabbir Hossain (BABU)', '2022-12-06 13:49:09', '2022-12-06 19:00:02'),
(48, 'Mohashin( মহাসিন )', 'Mohashin(মহাসিন স্টোর)', '01874-150683', NULL, NULL, 2, 1, 2, 3, 715, 'পশ্চিম বাইশটিকি আয়না মসজিদ রোড', '1', 'Sabbir Hossain (BABU)', 'Sabbir Hossain (BABU)', '2022-12-06 17:51:29', '2022-12-06 18:59:45'),
(49, 'Imdad(ইমদাদ)', 'Imdad(ইমদাদ স্টোর)', '01874-150685', NULL, NULL, 2, 1, 2, 3, 715, 'পশ্চিম বাইশটিকে কাঁচা বাজার', '1', 'Sabbir Hossain (BABU)', 'Sabbir Hossain (BABU)', '2022-12-06 17:54:40', '2022-12-06 18:59:22'),
(50, 'Shojib( সজীব)', 'Shojib(সুজিব ষ্টোর)', '01874-150688', NULL, NULL, 2, 1, 2, 3, 715, '৩৯/১ এফ  পশ্চিম বাসটেকি', '1', 'Sabbir Hossain (BABU)', 'Sabbir Hossain (BABU)', '2022-12-06 17:56:41', '2022-12-06 18:59:03'),
(51, 'Bornoful( বনফুল )', 'Bornoful(বনফুল ষ্টোর)', '01874-150687', NULL, NULL, 2, 1, 2, 3, 715, '১/ ৬৯ হাজী আলী হোসেন রোড', '1', 'Sabbir Hossain (BABU)', 'Sabbir Hossain (BABU)', '2022-12-06 17:59:14', '2022-12-06 18:58:46'),
(52, 'Ma(মা )', 'Ma(মা স্টোর)', '01874-150681', NULL, NULL, 2, 1, 2, 3, 715, '১/৯ পূর্ব ভাইস ঠিকই জব্বার গলি', '1', 'Sabbir Hossain (BABU)', 'Sabbir Hossain (BABU)', '2022-12-06 18:00:36', '2022-12-06 18:58:24'),
(53, 'Alomgir( আলমগীর )', 'Alomgir(আলমগীর স্টোর)', '01874-150696', NULL, NULL, 2, 1, 2, 3, 715, 'পূর্ব বাইশটেকি  মাংস দোকানের সামনে', '1', 'Sabbir Hossain (BABU)', 'Sabbir Hossain (BABU)', '2022-12-06 18:03:07', '2022-12-06 18:58:08'),
(54, 'Nuralom( নুর আলম )', 'Nuralom(নুর আলম স্টোর)', '01874-150693', NULL, NULL, 2, 1, 2, 3, 715, 'পূর্ব বাইশটেকি ভ্যানের দোকান', '1', 'Sabbir Hossain (BABU)', 'Sabbir Hossain (BABU)', '2022-12-06 18:04:49', '2022-12-06 18:57:47'),
(55, 'Ruma 2(রুমা ২)', 'Ruma 2(রুমা স্টোর ২)', '01874-150692', NULL, NULL, 2, 1, 2, 3, 715, 'পূর্ব বাইশ টেকি  পাঁচ তলা মোড়', '1', 'Sabbir Hossain (BABU)', 'Sabbir Hossain (BABU)', '2022-12-06 18:10:10', '2022-12-06 18:57:24'),
(56, 'Ali(আলী )', 'Ali(আলী স্টোর)', '01874-150691', NULL, NULL, 2, 1, 2, 3, 713, 'মানিকদি বাজার', '1', 'Sabbir Hossain (BABU)', 'Sabbir Hossain (BABU)', '2022-12-06 18:18:56', '2022-12-06 18:57:00'),
(57, 'Hazrat shajalal( হযরত শাহজালাল )', 'Hazrat shajalal(হযরত শাহজালাল স্টোর)', '01913743736', NULL, NULL, 2, 1, 2, 3, 713, 'সবুজ ছাতার গলি মানিকটি', '1', 'Sabbir Hossain (BABU)', 'Sabbir Hossain (BABU)', '2022-12-06 18:41:21', '2022-12-06 18:56:31'),
(58, 'Monir(মনির)', 'Monir(মনির স্টোর)', '01856432387', NULL, NULL, 2, 1, 2, 3, 716, 'বি এন পি বাজার', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-07 17:54:01', '2022-12-07 17:54:01'),
(59, 'Kamrul(কামরুল )', 'Kqmrul(কামরুল স্টোর)', '০১৭২৩৪৫৯৯৬', NULL, NULL, 2, 1, 2, 3, 716, 'বি এন পি বাজার', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-07 18:49:21', '2022-12-07 18:49:21'),
(60, 'Arafat(আরাফাত)', 'Arafat(আরাফাত স্টোর)', '০১৭২৩৫৬৩৯৭', NULL, NULL, 2, 1, 2, 3, 716, 'বি এন পি বাজার', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-07 18:50:37', '2022-12-07 18:50:37'),
(61, 'Three Stare(থ্রী ষ্টার)', 'Three stare(থ্রী ষ্টার)', '0178452136', NULL, NULL, 2, 1, 2, 3, 716, 'বি এন পি বাজার', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-07 18:53:52', '2022-12-07 18:53:52'),
(62, 'Alamin(আলিমন)', 'Alamin(আলামিন স্টোর)', '01745218763', NULL, NULL, 2, 1, 2, 3, 716, '৯৬ পশ্চিম কাফরুল', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-07 18:57:35', '2022-12-07 18:57:35'),
(63, 'Shulov(সুলভ)', 'Shulov(সুলভ স্টোর)', '01785422398', NULL, NULL, 2, 1, 2, 3, 718, 'আগারগাঁও ফুল মার্কেট', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-07 19:01:40', '2022-12-07 19:01:40'),
(64, 'Khokhon(খোকন)', 'Khokhon(খোকন স্টোর)', '01784521397', NULL, NULL, 2, 1, 2, 3, 718, 'আগারগাঁও ফুল মার্কেট', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-07 19:03:40', '2022-12-07 19:03:40'),
(65, 'Arif(আরিফ)', 'Arif(আরিফ স্টোর)', '01784521349', NULL, NULL, 2, 1, 2, 3, 717, '১৮৩ হক ভিলা পশ্চিম কাফরুল', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-07 19:05:50', '2022-12-07 19:05:50'),
(66, 'Ma(Kafrul মা )', 'Ma(Kafrul মা স্টোর)', '018754239787365', NULL, NULL, 2, 1, 2, 3, 717, '১৭৫/৩ পশ্চিম কাফরুল তালতলা', '1', 'Sabbir Hossain (BABU)', 'Sabbir Hossain (BABU)', '2022-12-07 19:07:53', '2022-12-13 15:59:50'),
(67, 'Karanigonj(মনির)', 'Karanigonj(কেরানীগঞ্জ স্টোর)', '0178452394546', NULL, NULL, 2, 1, 2, 3, 717, '৯৬ পশ্চিম কাফরুল তালতলা', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-07 19:10:31', '2022-12-07 19:10:31'),
(68, 'Dalower(দালোয়ার)', 'Dalower(দেলোয়ার স্টোর)', '018754231945', NULL, NULL, 2, 1, 2, 3, 717, 'তালতলা কাঁচা বাজার', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-07 19:12:48', '2022-12-07 19:12:48'),
(69, 'Shofiq(শফিক)', 'Shofiq(শফিক)', '018754213164', NULL, NULL, 2, 1, 2, 3, 717, 'তালতলা কাঁচা বাজার', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-07 19:18:49', '2022-12-07 19:18:49'),
(70, 'Raja Badsha( রাজা বাদশা )', 'Raja Badsha( রাজা বাদশাহ স্টোর )', '0184542164875', NULL, NULL, 2, 1, 2, 3, 717, 'তালতলা কাঁচা বাজার', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-07 19:20:29', '2022-12-07 19:20:29'),
(71, 'Iqbal( ইকবাল)', 'Iqbal( ইকবাল স্টোর )', '0187542131945', NULL, NULL, 2, 1, 2, 3, 717, 'তালতলা কাঁচা বাজার', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-07 19:23:28', '2022-12-07 19:23:28'),
(72, 'Nayeem( নাঈম )', 'Nayeem( নাইম স্টোর )', '0187521349', NULL, NULL, 2, 1, 2, 3, 718, 'শহীদ লালু মার্কেট', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-07 19:24:43', '2022-12-07 19:24:43'),
(73, 'Almodina( আল মদিনা )', 'Almodina( আল মদিনা ষ্টোর )', '0784215', NULL, NULL, 2, 1, 2, 3, 718, '৬৩/৩ পশ্চিম আগারগাঁও', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-07 19:26:31', '2022-12-07 19:26:31'),
(74, 'Faymeli( ফ্যামিলি )', 'Faymeli( ফ্যামিলি শপ )', '018754239416', NULL, NULL, 2, 1, 2, 3, 718, '৬৭ পশ্চিমা আগারগাঁও', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-07 19:30:44', '2022-12-07 19:30:44'),
(75, 'Bickumpur(anower)', 'Bickumpur( বিক্রমপুর সুইট )', '0187542319755', NULL, NULL, 2, 1, 2, 3, 716, 'বিএনপি হাফিজিয়া মাদ্রাসা সংলগ্ন', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-07 19:32:31', '2022-12-07 19:32:31'),
(76, 'Hakim( হাকিম )', 'Hakim( হাকিম স্টোর )', '018754213948', NULL, NULL, 2, 1, 2, 3, 716, 'বিএনপি বাজার', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-07 19:33:46', '2022-12-07 19:33:46'),
(77, 'Sattar( সাত্তার )', 'Sattar( সাত্তার স্টোর )', '018754231678', NULL, NULL, 2, 1, 2, 3, 716, 'বিএনপি বাজার', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-07 19:35:23', '2022-12-07 19:35:23'),
(78, 'Anower(আনোয়ার ইসলাম)', 'Anower(আনোয়ার স্টোর)', '018754231997', NULL, NULL, 2, 1, 2, 3, 716, 'বিএনপি বাজার', '1', 'Sabbir Hossain (BABU)', 'Sabbir Hossain (BABU)', '2022-12-07 19:36:35', '2022-12-10 14:43:04'),
(79, 'Ajmir( আজমির)', 'Ajmir vander( আজমির ভান্ডার)', '012543678', NULL, NULL, 2, 1, 2, 3, 720, 'বড়বাগ কাচা বাজার', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-08 20:34:52', '2022-12-08 20:34:52'),
(80, 'Shahin(শাহীন)', 'Shahin( শাহীন স্টোর )', '01248724697', NULL, NULL, 2, 1, 2, 3, 720, 'বড় বাগ কাঁচা বাজার', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-08 20:37:16', '2022-12-08 20:37:16'),
(81, 'Kazi(কাজী)', 'Kazi( কাজী স্টোর)', '0124578367', NULL, NULL, 2, 1, 2, 3, 720, 'বড় বাগ কাঁচা বাজার', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-08 20:38:44', '2022-12-08 20:38:44'),
(82, 'Islam(ইসলাম)', 'Islam( ইসলাম স্টোর)', '01245573649', NULL, NULL, 2, 1, 2, 3, 720, 'বড় বাগ বাজারের সাইডের দোকান', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-08 20:41:26', '2022-12-08 20:41:26'),
(83, 'Adiba(আদিবা)', 'Adiba(আদিবা স্টোর)', '01215486436', NULL, NULL, 2, 1, 2, 3, 720, 'বড় বাঘ মেইন রাস্তা', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-08 20:43:00', '2022-12-08 20:43:00'),
(84, 'Siraj(সিরাজ)', 'Siraj( সিরাজী স্টোর)', '01245379987', NULL, NULL, 2, 1, 2, 3, 720, 'বড় বাঘ কাঁচা বাজার', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-08 20:44:28', '2022-12-08 20:44:28'),
(85, 'রাতুল 2(রাতুল ২)', 'Ratul 2( রাতুল ২)', '0124534945', NULL, NULL, 2, 1, 2, 3, 719, '২৭/২ জোনাকি রোড', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-08 20:46:12', '2022-12-08 20:46:12'),
(86, 'Ma(মা )', 'Ma(মা স্টোর)', '01215437675', NULL, NULL, 2, 1, 2, 3, 719, 'শাহালিবাগ বড় বাজার', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-08 20:48:54', '2022-12-08 20:48:54'),
(87, 'Sayed( সাঈদ)', 'Sayed( সাঈদ স্টোর)', '01245784631879', NULL, NULL, 2, 1, 2, 3, 719, 'শাহলীবাগ বড় বাজার', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 12:47:35', '2022-12-10 12:47:35'),
(88, 'Hazrat(হযরত)', 'Hazrat( হযরত স্টোর)', '0125836987', NULL, NULL, 2, 1, 2, 3, 719, 'বারিশ হলো রোড ৩ কলখানা পাড়া', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 12:49:35', '2022-12-10 12:49:35'),
(89, 'Alauddin(আলাউদ্দিন)', 'Alauddin( আলাউদ্দিন স্টোর)', '084215845', NULL, NULL, 2, 1, 2, 3, 719, 'শাহ আলী বাগ বড় বাজার', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 12:51:53', '2022-12-10 12:51:53'),
(90, 'Bismillha(বিসমিল্লাহ)', 'Bismillha( বিসমিল্লাহ স্টোর)', '81254560', NULL, NULL, 2, 1, 2, 3, 719, 'আহমেদনগর সেলিম উদ্দিন মার্কেট\r\n (আর. এফ. এল. এর সামনের দোকান)', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 12:56:24', '2022-12-10 12:56:24'),
(91, 'Ma moni( মা মনি)', 'Ma moni( মামনি স্টোর)', '0125487636', NULL, NULL, 2, 1, 2, 3, 719, 'আহমেদনগর সেলিম উদ্দিন মার্কেট', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 12:57:51', '2022-12-10 12:57:51'),
(92, 'Madina(মদিনা)', 'Madina(মদিনা স্টোর)', '012154873679', NULL, NULL, 2, 1, 2, 3, 719, 'আহমেদনগর সেলিম উদ্দিন মার্কেট', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 12:59:34', '2022-12-10 12:59:34'),
(93, 'Tayem(তাইম)', 'Tayem(তাইম স্টোর)', '01254876979', NULL, NULL, 2, 1, 2, 3, 719, '৩৩৪/৬ -৩ আহমেদনগর ডি.আই.জি. গলি', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 13:02:24', '2022-12-10 13:02:24'),
(94, 'Shawly(শিউলি)', 'Shawly( শিউলি স্টোর)', '01254876976', NULL, NULL, 2, 1, 2, 3, 719, 'আহমেদনগর কাঁচা বাজার', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 13:05:23', '2022-12-10 13:05:23'),
(95, 'Kumilla(কুমিল্লা)', 'Kumilla( কুমিল্লা স্টোর)', '012458766', NULL, NULL, 2, 1, 2, 3, 719, 'আহাম্মেদ নগর কাঁচা বাজার', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 13:07:06', '2022-12-10 13:07:06'),
(96, 'Nishat(নিশাত)', 'Nishat( নিশাত স্টোর)', '01248493898', NULL, NULL, 2, 1, 2, 3, 719, 'আহমেদ নগর আইকনি স্কুলের গলি', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 13:09:48', '2022-12-10 13:09:48'),
(97, 'Alvi(আলভী)', 'Alvi(আলভী)', '012457873984', NULL, NULL, 2, 1, 2, 3, 715, 'মিরপুর ১৩ রূপসী', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 13:21:06', '2022-12-10 13:21:06'),
(98, 'Alamin(আলিমন)', 'Alamin(আলামিন স্টোর)', '01245879349', NULL, NULL, 2, 1, 2, 3, 717, 'তালতলা কাঁচা বাজার', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 13:22:02', '2022-12-10 13:22:02'),
(99, 'Shahanaj( শাহনাজ )', 'Shahanaj( শাহনাজ স্টোর )', '0125874939', NULL, NULL, 2, 1, 2, 3, 695, 'মাটি কাটা', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 13:44:49', '2022-12-10 13:44:49'),
(100, 'Mashud( মাসুদ)', 'Mashud( মাসুদ ষ্টোর )', '0121864637', NULL, NULL, 2, 1, 2, 3, 695, 'মাটি কাটা', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 13:46:00', '2022-12-10 13:46:00'),
(101, 'Riphon( রিপন )', 'Riphon( রিপন স্টোর )', '012874536', NULL, NULL, 2, 1, 2, 3, 695, 'মাটিকাটা', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 13:47:31', '2022-12-10 13:47:31'),
(102, 'Bickrompur(বিক্রমপুর)', 'Bickrompur( বিক্রমপুর স্টোর)', '01258446', NULL, NULL, 2, 1, 2, 3, 709, 'ভাষানটেক ক্যান্টনমেন্ট', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 13:49:47', '2022-12-10 13:49:47'),
(103, 'Almokka( আল মক্কা )', 'Almokka( আল মক্কা স্টোর )', '01257486', NULL, NULL, 2, 1, 2, 3, 709, 'ভাষানটেক ক্যান্টনমেন্ট', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 13:51:42', '2022-12-10 13:51:42'),
(104, 'Rakib(রাকিব)', 'Rakib(রাকিব স্টোর)', '0421857594', NULL, NULL, 2, 1, 2, 3, 709, 'ভাষানটেক ক্যান্টনমেন্ট', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 13:54:29', '2022-12-10 13:54:29'),
(105, 'Shikder( সিকদার এন্টারপ্রাইজ )', 'Shikder( শিকদার এন্টারপ্রাইজ )', '012545878', NULL, NULL, 2, 1, 2, 3, 709, 'ভাষানটেক বাজার প্রথম গলি', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 13:56:14', '2022-12-10 13:56:14'),
(106, 'Shahanaj( শাহনাজ )', 'Shahanaj( শাহনাজ স্টোর )', '0128497594', NULL, NULL, 2, 1, 2, 3, 709, 'ভাষানটেক বাজার মিজানের সামনের দোকান', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 13:57:36', '2022-12-10 13:57:36'),
(107, 'Mijan(মিজান)', 'Mijan(মিজান স্টোর)', '021254566', NULL, NULL, 2, 1, 2, 3, 709, 'ভাষানটেক বাজার', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 13:59:06', '2022-12-10 13:59:06'),
(108, 'Samiya(সামিয়া)', 'Samiya( সামিয়া স্টোর )', '0128489676', NULL, NULL, 2, 1, 2, 3, 709, 'ভাষানটেক বাজার', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 14:00:29', '2022-12-10 14:00:29'),
(109, 'Sultan(সুলতান)', 'Sultan(সুলতান স্টোর)', '0124845949', NULL, NULL, 2, 1, 2, 3, 709, 'ভাষানটেক বাজার', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 14:01:56', '2022-12-10 14:01:56'),
(110, 'Shohid(শহীদ)', 'Shohid(শহীদ ষ্টোর)', '0124587969', NULL, NULL, 2, 1, 2, 3, 709, 'ভাষানটেক বাজার', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 14:03:23', '2022-12-10 14:03:23'),
(111, 'Mayer Dowa shobji bitan(মায়ের দোয়া সবজি বিতান)', 'Mayer Dowa shobji bitan(মায়ের দোয়া সবজি বিতান)', '0124087976', NULL, NULL, 2, 1, 2, 3, 709, 'পশ্চিম ভাষানটেক মজুমদার মোড়', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 14:06:32', '2022-12-10 14:06:32'),
(112, 'Mariya(মারিয়া)', 'Mariya( মারিয়া স্টোর )', '0125844599', NULL, NULL, 2, 1, 2, 3, 707, 'ধামাল কোড', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 14:08:45', '2022-12-10 14:08:45'),
(113, 'Jorna(ঝরনা)', 'Jorna( ঝরনা স্টোর )', '012884579', NULL, NULL, 2, 1, 2, 3, 707, 'ধামাল কোট নীরব রোড', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 14:11:07', '2022-12-10 14:11:07'),
(114, 'Siyam(সিয়াম)', 'Siyam(সিয়াম স্টোর)', '01248797964', NULL, NULL, 2, 1, 2, 3, 707, 'হাজী সোবাহান রোড ধামালকোট', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 14:12:27', '2022-12-10 14:12:27'),
(115, 'Ahad(আহাদ )', 'Ahad( হাদিস স্টোর )', '01248766787', NULL, NULL, 2, 1, 2, 3, 707, 'ধামাল কোটবাজার', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 14:13:41', '2022-12-10 14:13:41'),
(116, 'Ma Baber Dowa( মা-বাবার দোয়া )', 'Ma Baber Dowa( মা-বাবার দোয়া )', '012587459', NULL, NULL, 2, 1, 2, 3, 707, 'ধামালকোট আদর্শ রোড', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 14:15:53', '2022-12-10 14:15:53'),
(117, 'Jahid 2( জাহিদ ২ )', 'Jahid 2( জাহিদ ২ স্টোর)', '012458946319', NULL, NULL, 2, 1, 2, 3, 707, 'ধামাল কোট বাজার', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 14:17:47', '2022-12-10 14:17:47'),
(118, 'Allahordan( আল্লাহর দান )', 'Allahordan( আল্লাহর দান )', '0124548937', NULL, NULL, 2, 1, 2, 3, 707, 'ধামাল কোড শেষ মাথা', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 14:19:35', '2022-12-10 14:19:35'),
(119, 'Rahi Madicin Corner( রাহি মেডিসিন কর্নার )', 'Rahi( রাহি মেডিসিন কর্নার )', '01624769684', NULL, NULL, 2, 1, 2, 3, 707, 'ধামাল কোট বাজারের আগের গলি', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 14:22:46', '2022-12-10 14:22:46'),
(120, 'Adori mariya T store( আদরি মারিয়া টি স্টোর )', 'Adori( আদরী মারিয়া টি স্টোর )', '0125845964', NULL, NULL, 2, 1, 2, 3, 707, 'ধামাল কোড আদর্শ রোড', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 14:25:14', '2022-12-10 14:25:14'),
(121, 'Jahid 1(জাহিদ ১)', 'Jahid 1(জাহিদ ১ স্টোর)', '01258458695', NULL, NULL, 2, 1, 2, 3, 707, 'ধামাল কোড', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 14:27:06', '2022-12-10 14:27:06'),
(122, 'Samiha( সামিহা )', 'Samiha( সামিহা স্টোর )', '0128745639', NULL, NULL, 2, 1, 2, 3, 707, 'ধামালকোট মারিয়া দোকানের সামনের দোকান', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 14:28:28', '2022-12-10 14:28:28'),
(123, 'Mordan fashon( মর্ডান ফেশন )', 'Mordan( মর্ডান ফ্যাশন )', '0125448957', NULL, NULL, 2, 1, 2, 3, 707, '৯৯ নং টিন সাইড কলোনি', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 14:30:50', '2022-12-10 14:30:50'),
(124, 'Alamin(আলিমন)', 'Alamin(আলামিন স্টোর)', '0128745397', NULL, NULL, 2, 1, 2, 3, 707, 'লালা সরাই টিন সাইড কলোনি', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 14:31:51', '2022-12-10 14:31:51'),
(125, 'Khokhon(খোকন)', 'Khokhon(খোকন স্টোর)', '01254566548', NULL, NULL, 2, 1, 2, 3, 721, 'মিরপুর ১৪ নেবি মার্কেট', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 14:36:42', '2022-12-10 14:36:42'),
(126, 'Mashud( মাসুদ)', 'Mashud( মাসুদ ষ্টোর )', '0125848995', NULL, NULL, 2, 1, 2, 3, 721, 'মিরপুর ১৪ নেবী মার্কেট', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 14:37:36', '2022-12-10 14:37:36'),
(127, 'Anower(আনোয়ার ইসলাম)', 'Anower(আনোয়ার স্টোর)', '012877896', NULL, NULL, 2, 1, 2, 3, 721, 'মিরপুর ১৪ নেবি মার্কেট', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 14:44:39', '2022-12-10 14:44:39'),
(128, 'Lokkhipur(লক্ষীপুর)', 'Lokkhipur(লক্ষ্মীপুর স্টোর)', '012887496', NULL, NULL, 2, 1, 2, 3, 721, 'সি. বি. পুরাতন কচুক্ষেত', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-10 14:47:25', '2022-12-10 14:47:25'),
(129, 'Hasan(হাসান)', 'Hassan(হাসান স্টোর)', '0124849734945', NULL, NULL, 2, 1, 2, 3, 722, 'বাউনিয়া', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 15:12:12', '2022-12-13 15:12:12');

-- --------------------------------------------------------

--
-- Table structure for table `customer_groups`
--

CREATE TABLE `customer_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
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
(1, 'Regular', 0.00, '1', 'Super Admin', NULL, '2021-09-14 14:30:18', '2021-09-14 14:30:18');

-- --------------------------------------------------------

--
-- Table structure for table `daily_closings`
--

CREATE TABLE `daily_closings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED NOT NULL,
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `damage_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `memo_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `total_price` double NOT NULL,
  `total_deduction` double DEFAULT NULL,
  `tax_rate` double DEFAULT NULL,
  `total_tax` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `deducted_sr_commission` bigint(20) DEFAULT NULL,
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `damage_id` bigint(20) UNSIGNED NOT NULL,
  `memo_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `damage_qty` double NOT NULL,
  `unit_id` bigint(20) UNSIGNED DEFAULT NULL,
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shop_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `district_id` bigint(20) UNSIGNED NOT NULL,
  `upazila_id` bigint(20) UNSIGNED NOT NULL,
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
(1, 'Joyonto Kumar', 'b2g', '01303560087', 'admin@gmail.com', '$2y$10$.PVxHK8J4qZ6ywwYGteEw.gPu8NbPHRMlvzAuDk5AZfRCTLUXgVTu', 'shuvosarker472@gmail.com', NULL, 3, 47, 178, 'webst malibugh, dhaka', '1', 'Super Admin', NULL, NULL, '2023-03-04 09:05:12', '2023-03-04 09:05:12');

-- --------------------------------------------------------

--
-- Table structure for table `dealer_deliveries`
--

CREATE TABLE `dealer_deliveries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `dealer_sale_id` bigint(20) DEFAULT NULL,
  `dealer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `warehouse_id` bigint(20) UNSIGNED DEFAULT NULL,
  `total_delivery_quantity` bigint(20) DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `note` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dealer_delivery_products`
--

CREATE TABLE `dealer_delivery_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `dealer_delivery_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `dealer_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `commission_rate` double(8,2) NOT NULL,
  `commission_percentage` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dealer_products`
--

INSERT INTO `dealer_products` (`id`, `dealer_id`, `product_id`, `commission_rate`, `commission_percentage`, `created_at`, `updated_at`) VALUES
(1, 1, 38, 5.00, 14.29, '2023-03-04 09:05:12', '2023-03-04 09:05:12');

-- --------------------------------------------------------

--
-- Table structure for table `dealer_sales`
--

CREATE TABLE `dealer_sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `memo_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dealer_id` bigint(20) UNSIGNED DEFAULT NULL,
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
  `account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `status` enum('1','2','3') COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '1=Pending,2=Approved,3=Reject',
  `order_type` enum('1','2') COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '1 = office , 2 = dealer',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dealer_sale_products`
--

CREATE TABLE `dealer_sale_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `dealer_sale_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `qty` double NOT NULL,
  `free_qty` double NOT NULL,
  `delivered_qty` double NOT NULL,
  `sale_unit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `net_unit_price` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deliveries`
--

CREATE TABLE `deliveries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_id` bigint(20) UNSIGNED DEFAULT NULL,
  `salesmen_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `warehouse_id` bigint(20) UNSIGNED DEFAULT NULL,
  `total_delivery_quantity` bigint(20) DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `note` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deliveries`
--

INSERT INTO `deliveries` (`id`, `sale_id`, `salesmen_id`, `customer_id`, `warehouse_id`, `total_delivery_quantity`, `delivery_date`, `note`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 10, 2, 11, '2022-12-06', NULL, '2022-12-06 13:18:17', '2022-12-06 13:18:17'),
(2, 2, 2, 47, 2, 15, '2022-12-01', NULL, '2022-12-11 17:09:20', '2022-12-11 17:09:20'),
(3, 4, 2, 48, 1, 15, '2022-12-01', NULL, '2022-12-12 11:56:28', '2022-12-12 11:56:28'),
(4, 5, 2, 51, 2, 3, '2022-12-12', NULL, '2022-12-12 12:02:05', '2022-12-12 12:02:05'),
(5, 6, 2, 52, 2, 12, '2022-12-12', NULL, '2022-12-12 12:25:45', '2022-12-12 12:25:45'),
(6, 7, 2, 55, 2, 11, '2022-12-12', NULL, '2022-12-12 12:32:31', '2022-12-12 12:32:31'),
(7, 8, 2, 49, 2, 40, '2022-12-12', NULL, '2022-12-12 12:41:42', '2022-12-12 12:41:42'),
(8, 9, 2, 53, 2, 15, '2022-12-01', NULL, '2022-12-12 12:49:06', '2022-12-12 12:49:06'),
(9, 10, 2, 54, 2, 51, '2022-12-01', NULL, '2022-12-12 12:49:44', '2022-12-12 12:49:44'),
(10, 11, 2, 50, 2, 18, '2022-12-12', NULL, '2022-12-12 12:54:10', '2022-12-12 12:54:10'),
(11, 12, 2, 39, 2, 1, '2022-12-01', NULL, '2022-12-12 17:53:46', '2022-12-12 17:53:46'),
(12, 13, 2, 41, 2, 15, '2022-12-12', NULL, '2022-12-12 17:57:20', '2022-12-12 17:57:20'),
(13, 14, 2, 43, 2, 12, '2022-12-12', NULL, '2022-12-12 18:00:20', '2022-12-12 18:00:20'),
(14, 15, 2, 44, 2, 14, '2022-12-01', NULL, '2022-12-12 19:23:51', '2022-12-12 19:23:51'),
(15, 16, 2, 45, 2, 15, '2022-12-12', NULL, '2022-12-12 19:27:52', '2022-12-12 19:27:52'),
(16, 17, 2, 46, 2, 34, '2022-12-12', NULL, '2022-12-12 19:31:14', '2022-12-12 19:31:14'),
(17, 18, 2, 129, 2, 40, '2022-12-04', NULL, '2022-12-13 15:15:31', '2022-12-13 15:15:31'),
(18, 19, 2, 69, 2, 8, '2022-12-04', NULL, '2022-12-13 15:19:41', '2022-12-13 15:19:41'),
(19, 20, 2, 70, 2, 18, '2022-12-13', NULL, '2022-12-13 15:25:15', '2022-12-13 15:25:15'),
(20, 21, 2, 71, 2, 1, '2022-12-13', NULL, '2022-12-13 15:28:24', '2022-12-13 15:28:24'),
(21, 22, 2, 63, 2, 48, '2022-12-13', NULL, '2022-12-13 15:31:39', '2022-12-13 15:31:39'),
(22, 23, 2, 64, 2, 40, '2022-12-13', NULL, '2022-12-13 15:35:31', '2022-12-13 15:35:31'),
(23, 24, 2, 61, 2, 2, '2022-12-13', NULL, '2022-12-13 15:38:33', '2022-12-13 15:38:33'),
(24, 25, 2, 58, 2, 57, '2022-12-04', NULL, '2022-12-13 15:41:51', '2022-12-13 15:41:51'),
(25, 26, 2, 77, 2, 4, '2022-12-04', NULL, '2022-12-13 15:44:24', '2022-12-13 15:44:24'),
(26, 27, 2, 76, 2, 5, '2022-12-13', NULL, '2022-12-13 15:46:43', '2022-12-13 15:46:43'),
(27, 28, 2, 75, 2, 6, '2022-12-04', NULL, '2022-12-13 15:50:16', '2022-12-13 15:50:16'),
(28, 29, 2, 74, 2, 1, '2022-12-04', NULL, '2022-12-13 15:52:55', '2022-12-13 15:52:55'),
(29, 30, 2, 73, 2, 4, '2022-12-04', NULL, '2022-12-13 15:55:16', '2022-12-13 15:55:16'),
(30, 31, 2, 66, 2, 20, '2022-12-04', NULL, '2022-12-13 16:01:30', '2022-12-13 16:01:30'),
(31, 33, NULL, 2, 2, 2, '2023-03-04', NULL, '2023-03-04 08:55:16', '2023-03-04 08:55:16'),
(32, 33, NULL, 2, 6, 4, '2023-03-04', NULL, '2023-03-04 08:56:08', '2023-03-04 08:56:08');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_products`
--

CREATE TABLE `delivery_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
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
(1, 1, 5, '33', '0', '6', NULL, NULL),
(2, 1, 4, '982', '0', '3', NULL, NULL),
(3, 1, 6, '190', '0', '2', NULL, NULL),
(4, 2, 30, '8410', '0', '15', NULL, NULL),
(5, 3, 1, '6999', '0', '12', NULL, NULL),
(6, 3, 2, '2907', '0', '3', NULL, NULL),
(7, 4, 30, '8395', '0', '3', NULL, NULL),
(8, 5, 1, '6339', '0', '12', NULL, NULL),
(9, 6, 8, '240', '0', '1', NULL, NULL),
(10, 6, 30, '8392', '0', '10', NULL, NULL),
(11, 7, 30, '8382', '0', '40', NULL, NULL),
(12, 8, 30, '8342', '0', '15', NULL, NULL),
(13, 9, 1, '6567', '0', '48', NULL, NULL),
(14, 9, 4, '1003', '0', '3', NULL, NULL),
(15, 10, 1, '6519', '0', '12', NULL, NULL),
(16, 10, 3, '905', '0', '6', NULL, NULL),
(17, 11, 8, '239', '0', '1', NULL, NULL),
(18, 12, 1, '6507', '0', '12', NULL, NULL),
(19, 12, 2, '2842', '0', '3', NULL, NULL),
(20, 13, 1, '6495', '0', '6', NULL, NULL),
(21, 13, 30, '8327', '0', '6', NULL, NULL),
(22, 14, 32, '375', '0', '14', NULL, NULL),
(23, 15, 1, '6489', '0', '12', NULL, NULL),
(24, 15, 3, '899', '0', '3', NULL, NULL),
(25, 16, 1, '6477', '0', '24', NULL, NULL),
(26, 16, 30, '8321', '0', '10', NULL, NULL),
(27, 17, 30, '8311', '0', '40', NULL, NULL),
(28, 18, 2, '2839', '0', '3', NULL, NULL),
(29, 18, 30, '8271', '0', '5', NULL, NULL),
(30, 19, 3, '896', '0', '12', NULL, NULL),
(31, 19, 4, '1000', '0', '6', NULL, NULL),
(32, 20, 8, '238', '0', '1', NULL, NULL),
(33, 21, 1, '6453', '0', '48', NULL, NULL),
(34, 22, 30, '8266', '0', '40', NULL, NULL),
(35, 23, 4, '994', '0', '2', NULL, NULL),
(36, 24, 1, '6405', '0', '47', NULL, NULL),
(37, 24, 30, '8226', '0', '10', NULL, NULL),
(38, 25, 8, '237', '0', '4', NULL, NULL),
(39, 26, 3, '884', '0', '5', NULL, NULL),
(40, 27, 32, '361', '0', '6', NULL, NULL),
(41, 28, 6, '428', '0', '1', NULL, NULL),
(42, 29, 30, '8216', '0', '4', NULL, NULL),
(43, 30, 30, '8212', '0', '20', NULL, NULL),
(44, 31, 35, '101', '0', '2', NULL, NULL),
(45, 32, 35, '14', '2', '4', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `deletable` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=No, 2=Yes',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `divisions`
--

CREATE TABLE `divisions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department_id` bigint(20) UNSIGNED NOT NULL,
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
  `id` bigint(20) UNSIGNED NOT NULL,
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photograph` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternative_phone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zipcode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `holiday` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attendance_type` int(11) DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `employee_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `finger_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shift_id` bigint(20) UNSIGNED NOT NULL,
  `department_id` bigint(20) UNSIGNED NOT NULL,
  `division_id` bigint(20) UNSIGNED NOT NULL,
  `job_status` enum('1','2','3','4') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Permanent,2=Probation,3=Resigned,4=Suspended',
  `duty_type` enum('1','2','3','4') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Full Time,2=Part Time,3=Contractual,4=Other',
  `joining_designation_id` bigint(20) UNSIGNED NOT NULL,
  `current_designation_id` bigint(20) UNSIGNED NOT NULL,
  `joining_date` date DEFAULT NULL,
  `probation_start` date DEFAULT NULL,
  `probation_end` date DEFAULT NULL,
  `contract_start` date DEFAULT NULL,
  `contract_end` date DEFAULT NULL,
  `confirmation_date` date DEFAULT NULL,
  `termination_date` date DEFAULT NULL,
  `termination_reason` text COLLATE utf8mb4_unicode_ci,
  `rate_type` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Hourly,2=Salary',
  `rate` double NOT NULL,
  `joining_rate` double DEFAULT NULL,
  `overtime` enum('1','2') COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '1=Allowed,2=Not Allowed',
  `pay_freequency` enum('1','2','3','4') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Weekly,2=Biweekly,3=Monthly,4=Annual',
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supervisor_id` int(10) UNSIGNED DEFAULT NULL,
  `is_supervisor` enum('1','2') COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '1=Yes,2=No',
  `father_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mother_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Male,2=Female,3=Other',
  `marital_status` enum('1','2','3','4','5') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Single,2=Married,3=Divorced,4=Widowed,5=Other',
  `blood_group` enum('1','2','3','4','5','6','7','8') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=A+,2=B+,3=A-,4=B-,5=AB+,6=AB-,7=O+,8=O-',
  `religion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nid_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nid_photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `residential_status` enum('1','2') COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '1=Resident,2=Non-Resident',
  `emergency_contact_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emergency_contact_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emergency_contact_relation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emergency_contact_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternative_emergency_contact_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternative_emergency_contact_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternative_emergency_contact_relation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternative_emergency_contact_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_education`
--

CREATE TABLE `employee_education` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `degree` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `major` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `institute` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `passing_year` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `result` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_professional_information`
--

CREATE TABLE `employee_professional_information` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `designation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `responsibility` text COLLATE utf8mb4_unicode_ci,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_routes`
--

CREATE TABLE `employee_routes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `deletable` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=No, 2=Yes',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `expense_item_id` bigint(20) UNSIGNED NOT NULL,
  `voucher_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double NOT NULL,
  `date` date NOT NULL,
  `payment_type` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Cash,2=Bank,3=Mobile',
  `account_id` bigint(20) UNSIGNED NOT NULL,
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
(1, 2, 1, 'EXP-20221206123502503', 3500, '2022-12-02', '1', 23, 'Micom Android TV Box.', 'Admin', NULL, '2022-12-06 12:35:02', '2022-12-06 12:35:02'),
(2, 2, 2, 'EXP-20221207163507543', 2300, '2022-12-06', '1', 23, '2022-12-06 Night\r\n4 person labour Bill', 'Admin', NULL, '2022-12-07 16:35:07', '2022-12-07 16:35:07');

-- --------------------------------------------------------

--
-- Table structure for table `expense_items`
--

CREATE TABLE `expense_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
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
(3, 'Inventory Transfer Cost', '1', 'Admin', 'Admin', '2022-12-07 16:33:18', '2022-12-07 16:33:47');

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
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

CREATE TABLE `holidays` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `holiday_type` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Weekly, 2=Public',
  `holiday_status` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Holiday, 2=General, 3=Others',
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `deletable` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=No, 2=Yes',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `labor_bills`
--

CREATE TABLE `labor_bills` (
  `id` bigint(20) UNSIGNED NOT NULL,
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `labor_bill_id` bigint(20) UNSIGNED NOT NULL,
  `unit_id` bigint(20) UNSIGNED NOT NULL,
  `rate` double(8,2) NOT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=active,2=inactive',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leaves`
--

CREATE TABLE `leaves` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` int(11) DEFAULT NULL,
  `leave_type` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Unpaid, 2=Paid',
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `deletable` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=No, 2=Yes',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leave_application_manages`
--

CREATE TABLE `leave_application_manages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `leave_id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `alternative_employee` int(11) DEFAULT NULL,
  `number_leave` int(11) DEFAULT NULL,
  `leave_type` int(11) DEFAULT NULL,
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
-- Table structure for table `loans`
--

CREATE TABLE `loans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `loan_categories_id` bigint(20) UNSIGNED NOT NULL,
  `bank_id` bigint(20) UNSIGNED NOT NULL,
  `reference_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `loan_amount` bigint(20) DEFAULT NULL,
  `loan_percentage_percent` bigint(20) DEFAULT NULL,
  `loan_percentage_tk` bigint(20) DEFAULT NULL,
  `processing_charge` bigint(20) DEFAULT NULL,
  `misc_charge` bigint(20) DEFAULT NULL,
  `apply_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_amount` bigint(20) DEFAULT NULL,
  `total_installment_month` bigint(20) DEFAULT NULL,
  `monthly_installment` bigint(20) DEFAULT NULL,
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
  `id` bigint(20) UNSIGNED NOT NULL,
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `grand_parent_id` int(10) UNSIGNED DEFAULT NULL,
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
(722, 'Bawniya (বাউনিয়া)', 3, 2, '3', '1', 'Sabbir Hossain (BABU)', 'Admin', '2022-12-12 17:44:19', '2022-12-13 14:56:20');

-- --------------------------------------------------------

--
-- Table structure for table `materials`
--

CREATE TABLE `materials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `material_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `material_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `unit_id` bigint(20) UNSIGNED NOT NULL,
  `purchase_unit_id` bigint(20) UNSIGNED NOT NULL,
  `cost` double DEFAULT NULL,
  `old_cost` double(10,2) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `alert_qty` double DEFAULT NULL,
  `tax_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tax_method` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Exclusive,2=Inclusive',
  `type` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Raw,2=Packaging',
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `has_opening_stock` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=Yes, 2=No',
  `opening_stock_qty` double DEFAULT NULL,
  `opening_cost` double DEFAULT NULL,
  `opening_warehouse_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `materials`
--

INSERT INTO `materials` (`id`, `material_name`, `material_code`, `category_id`, `unit_id`, `purchase_unit_id`, `cost`, `old_cost`, `qty`, `alert_qty`, `tax_id`, `tax_method`, `type`, `status`, `has_opening_stock`, `opening_stock_qty`, `opening_cost`, `opening_warehouse_id`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(47, 'Chinigura Rice 1kg PP Poly', '56897701', 23, 1, 1, 0, NULL, NULL, 0, NULL, '1', '2', '1', '2', NULL, 0, NULL, 'Admin', NULL, '2022-11-30 11:41:52', '2022-11-30 11:41:52'),
(52, 'Mango Pickle (আমের আচার)', '56033010', 31, 2, 2, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Admin', 'Admin', '2022-11-30 12:10:56', '2022-11-30 13:19:38'),
(53, 'Olive Pickle (জলপাইয়ের আচার)', '92723106', 31, 2, 2, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Admin', 'Admin', '2022-11-30 12:12:47', '2022-11-30 13:20:19'),
(54, 'Mix Pickle (মিক্স আচার)', '92491056', 31, 2, 2, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Admin', 'Admin', '2022-11-30 12:15:18', '2022-11-30 13:20:49'),
(55, 'Pickle 400g Glass Jar', '59110273', 31, 1, 1, 0, NULL, NULL, 0, NULL, '1', '2', '1', '2', NULL, 0, NULL, 'Admin', NULL, '2022-11-30 12:16:20', '2022-11-30 12:16:20'),
(56, 'Pickle 400g Glass Jar Cap', '54829092', 31, 1, 1, 0, NULL, NULL, 0, NULL, '1', '2', '1', '2', NULL, 0, NULL, 'Admin', 'Admin', '2022-11-30 12:18:21', '2022-11-30 12:18:34'),
(57, 'Pickle 400g Carton 12p', '28197356', 31, 1, 1, 0, NULL, NULL, 0, NULL, '1', '2', '1', '2', NULL, 0, NULL, 'Admin', NULL, '2022-11-30 12:21:29', '2022-11-30 12:21:29'),
(58, 'Mango Pickle 400g Label', '62487116', 31, 1, 1, 0, NULL, NULL, 0, NULL, '1', '2', '1', '2', NULL, 0, NULL, 'Admin', NULL, '2022-11-30 12:50:24', '2022-11-30 12:50:24'),
(59, 'Olive Pickle 400g Label', '90675243', 31, 1, 1, 0, NULL, NULL, 0, NULL, '1', '2', '1', '2', NULL, 0, NULL, 'Admin', NULL, '2022-11-30 12:50:53', '2022-11-30 12:50:53'),
(60, 'Mix Pickle 400g Label', '70343009', 31, 1, 1, 0, NULL, NULL, 0, NULL, '1', '2', '1', '2', NULL, 0, NULL, 'Admin', NULL, '2022-11-30 12:51:40', '2022-11-30 12:51:40'),
(61, 'Pickle 400g Poly Lock', '56817904', 31, 1, 1, 0, NULL, NULL, 0, NULL, '1', '2', '1', '2', NULL, 0, NULL, 'Admin', NULL, '2022-11-30 13:03:12', '2022-11-30 13:03:12'),
(62, 'Chilli Powder (মরিচের গুঁড়া)', '25784991', 26, 2, 2, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Admin', 'Admin', '2022-11-30 13:09:24', '2022-11-30 13:16:09'),
(63, 'Turmeric Powder (হলুদ গুঁড়া)', '33491702', 26, 2, 2, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Admin', 'Admin', '2022-11-30 13:12:45', '2022-11-30 13:15:40'),
(64, 'Cumin Powder (জিরা গুঁড়া)', '17273523', 26, 2, 2, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Admin', 'Admin', '2022-11-30 13:13:30', '2022-11-30 13:15:07'),
(65, 'Coriander Powder (ধনিয়া গুঁড়া)', '07119896', 26, 2, 2, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Admin', NULL, '2022-11-30 13:14:20', '2022-11-30 13:14:20'),
(66, 'Chilli Powder  Label', '20907791', 26, 1, 1, 0, NULL, NULL, 0, NULL, '1', '2', '1', '2', NULL, 0, NULL, 'Admin', 'Admin', '2022-11-30 13:29:27', '2022-11-30 13:38:11'),
(67, 'Turmeric Powder  Label', '03082131', 26, 1, 1, 0, NULL, NULL, 0, NULL, '1', '2', '1', '2', NULL, 0, NULL, 'Admin', 'Admin', '2022-11-30 13:29:57', '2022-11-30 13:38:02'),
(68, 'Cumin Powder Label', '55806913', 26, 1, 1, 0, NULL, NULL, 0, NULL, '1', '2', '1', '2', NULL, 0, NULL, 'Admin', 'Admin', '2022-11-30 13:30:43', '2022-11-30 13:37:51'),
(69, 'Coriander Powder Label', '07280911', 26, 1, 1, 0, NULL, NULL, 0, NULL, '1', '2', '1', '2', NULL, 0, NULL, 'Admin', 'Admin', '2022-11-30 13:31:21', '2022-11-30 13:38:22'),
(70, 'Spice Powder 500g White PP Poly', '68252273', 26, 1, 1, 0, NULL, NULL, 0, NULL, '1', '2', '1', '2', NULL, 0, NULL, 'Admin', NULL, '2022-11-30 13:34:57', '2022-11-30 13:34:57'),
(71, 'Spice Powder 1kg White PP Poly', '49106349', 26, 1, 1, 0, NULL, NULL, 0, NULL, '1', '2', '1', '2', NULL, 0, NULL, 'Admin', NULL, '2022-11-30 13:39:42', '2022-11-30 13:39:42'),
(72, 'Spice Powder 500g Carton 20p', '93062839', 26, 1, 1, 0, NULL, NULL, 0, NULL, '1', '2', '1', '2', NULL, 0, NULL, 'Admin', NULL, '2022-11-30 13:55:33', '2022-11-30 13:55:33'),
(73, 'Spice Powder 500g Carton 24p', '94730128', 26, 1, 1, 0, NULL, NULL, 0, NULL, '1', '2', '1', '2', NULL, 0, NULL, 'Admin', NULL, '2022-11-30 13:55:58', '2022-11-30 13:55:58'),
(74, 'Spice Powder 1kg Carton 20p', '92162002', 26, 1, 1, 0, NULL, NULL, 0, NULL, '1', '2', '2', '2', NULL, 0, NULL, 'Admin', 'Admin', '2022-11-30 13:56:32', '2022-12-04 17:28:29'),
(91, 'Mustard Oil (সরিষার তেল)', '05310783', 22, 10, 10, 177.45, 175.00, 0, 0, NULL, '1', '1', '1', '1', 3951.67, 175, 1, 'Admin', 'Admin', '2022-12-01 13:18:40', '2022-12-12 10:29:52'),
(92, 'Mustard Oil (সরিষার তেল) - kg', '72019075', 22, 2, 2, 195, 195.00, 0, 1000, NULL, '1', '1', '1', '1', 4016, 193, 1, 'Admin', 'Admin', '2022-12-01 13:21:44', '2022-12-12 10:24:24'),
(93, 'Mustard Oil Security Lock', '40329393', 22, 1, 1, 0.16, NULL, 0, 1000, NULL, '1', '2', '1', '1', 12278, 0.16, 1, 'Admin', 'Admin', '2022-12-01 13:31:14', '2022-12-12 10:24:24'),
(95, 'Mustard Oil 80ml Container', '37931225', 22, 1, 1, 2.7, NULL, 0, 1000, NULL, '1', '2', '1', '1', 6999, 2.7, 1, 'Admin', 'Admin', '2022-12-01 13:33:53', '2022-12-12 10:24:23'),
(96, 'Mustard Oil 80ml Label', '95110990', 22, 1, 1, 0.13, NULL, 0, 0, NULL, '1', '2', '1', '1', 6999, 0.13, 1, 'Admin', 'Admin', '2022-12-01 13:35:36', '2022-12-12 10:24:23'),
(97, 'Mustard Oil 80ml Carton 48p', '09112668', 22, 1, 1, 15, NULL, 0, 1000, NULL, '1', '2', '1', '1', 147, 15, 1, 'Admin', 'Admin', '2022-12-01 13:37:39', '2022-12-12 10:24:23'),
(98, 'Mustard Oil Container Cap', '41343570', 22, 1, 1, 0.5, NULL, 0, 100, NULL, '1', '2', '1', '1', 12278, 0.5, 1, 'Admin', 'Admin', '2022-12-01 13:40:13', '2022-12-12 10:24:24'),
(99, 'Mustard Oil 250ml Label', '53618341', 22, 1, 1, 0.5, NULL, 0, 1000, 1, '2', '2', '1', '1', 2907, 0.5, 1, 'Admin', 'Admin', '2022-12-01 14:37:33', '2022-12-12 10:24:23'),
(100, 'Mustard Oil 250ml Carton 24p', '59378510', 22, 1, 1, 35, NULL, 0, 1000, 1, '2', '2', '1', '1', 122, 35, 1, 'Admin', 'Admin', '2022-12-01 14:43:24', '2022-12-12 10:24:24'),
(101, 'Mustard Oil 250ml Container', '29297093', 22, 1, 1, 4, NULL, 0, 1000, 1, '2', '2', '1', '1', 2907, 4, 1, 'Admin', 'Admin', '2022-12-01 14:44:56', '2022-12-12 10:24:23'),
(102, 'Mustard Oil 500ml Label', '12961354', 22, 1, 1, 0.5, NULL, 0, 1000, 1, '2', '2', '1', '1', 1058, 0.5, 1, 'Admin', 'Admin', '2022-12-01 14:48:48', '2022-12-12 10:24:24'),
(103, 'Mustard Oil 500ml Carton 24p', '89631217', 22, 1, 1, 38, NULL, 0, 1000, 1, '2', '2', '1', '1', 45, 38, 1, 'Admin', 'Admin', '2022-12-01 14:50:55', '2022-12-12 10:24:24'),
(104, 'Mustard Oil 500ml Container', '76215239', 22, 1, 1, 6, NULL, 0, 1000, 1, '2', '2', '1', '1', 1058, 6, 1, 'Admin', 'Admin', '2022-12-01 14:51:44', '2022-12-12 10:24:24'),
(105, 'Mustard Oil 1L Carton 12p', '19056088', 22, 1, 1, 36, NULL, 0, 1000, 1, '2', '2', '1', '1', 85, 36, 1, 'Admin', 'Admin', '2022-12-01 14:54:53', '2022-12-12 10:24:24'),
(106, 'Mustard Oil 1L Container', '42634007', 22, 1, 1, 9, NULL, 0, 1000, 1, '2', '2', '1', '1', 1017, 9, 1, 'Admin', 'Admin', '2022-12-01 14:57:31', '2022-12-12 10:24:24'),
(107, 'Mustard Oil 1L Label', '91011374', 22, 1, 1, 0.7, NULL, 0, 1000, 1, '2', '2', '1', '1', 1017, 0.7, 1, 'Admin', 'Admin', '2022-12-01 14:58:40', '2022-12-12 10:24:24'),
(108, 'Mustard Oil 2L Label', '01712849', 22, 1, 1, 1.5, NULL, 0, 1000, 1, '2', '2', '1', '1', 297, 1.5, 1, 'Admin', 'Admin', '2022-12-01 15:09:30', '2022-12-12 10:24:24'),
(109, 'Mustard Oil 2L Container', '61087379', 22, 1, 1, 13, NULL, 0, 1000, 1, '2', '2', '1', '1', 297, 13, 1, 'Admin', 'Admin', '2022-12-01 15:10:17', '2022-12-12 10:24:24'),
(110, 'Mustard Oil 2L Carton 8p', '72088329', 22, 1, 1, 40, NULL, 0, 1000, 1, '2', '2', '1', '1', 37, 40, 1, 'Admin', 'Admin', '2022-12-01 15:11:33', '2022-12-12 10:24:24'),
(111, 'Mustard Oil 5L Label', '93757118', 22, 1, 1, 2.75, NULL, 0, 1000, 1, '2', '2', '1', '1', 441, 2.75, 1, 'Admin', 'Admin', '2022-12-01 15:13:25', '2022-12-12 10:24:24'),
(112, 'Mustard Oil 5L Container', '61072830', 22, 1, 1, 36, NULL, 0, 1000, 1, '2', '2', '1', '1', 441, 36, 1, 'Admin', 'Admin', '2022-12-01 15:15:08', '2022-12-12 10:24:24'),
(115, 'Mustard Oil 5L Carton 4p', '01268780', 22, 1, 1, 40, NULL, 0, 100, 1, '2', '2', '1', '1', 111, 40, 1, 'Admin', 'Admin', '2022-12-01 15:20:15', '2022-12-12 10:24:24'),
(117, 'Mustard Oil 5L Security Lock', '19325051', 22, 1, 1, 0.2, NULL, 0, 1000, 1, '2', '2', '1', '1', 441, 0.2, 1, 'Admin', 'Admin', '2022-12-01 15:22:23', '2022-12-12 10:24:24'),
(118, 'Mustard Oil 8kg Tin', '94371818', 22, 1, 1, 100, NULL, 0, 1000, 1, '2', '2', '1', '1', 31, 100, 1, 'Admin', 'Admin', '2022-12-01 15:27:22', '2022-12-07 16:17:47'),
(120, 'Mustard Oil 8kg Tin Cap', '67361120', 22, 1, 1, 5, NULL, 0, 100, 1, '2', '2', '1', '1', 31, 5, 1, 'Admin', 'Admin', '2022-12-01 15:31:49', '2022-12-07 16:17:47'),
(121, 'Mustard Oil 16kg Tin', '18960970', 22, 1, 1, 180, NULL, 0, 1000, 1, '2', '2', '1', '1', 243, 180, 1, 'Admin', 'Admin', '2022-12-01 15:33:23', '2022-12-12 10:24:24'),
(122, 'Mustard Oil 16kg Tin Cap', '53390796', 22, 1, 1, 5, NULL, 0, 1000, 1, '2', '2', '1', '1', 243, 5, 1, 'Admin', 'Admin', '2022-12-01 15:34:02', '2022-12-12 10:24:24'),
(123, 'Mustard Oil 5L Container Cap', '97252100', 22, 1, 1, 2, NULL, 0, 1000, 1, '2', '2', '1', '1', 441, 2, 1, 'Admin', 'Admin', '2022-12-01 16:06:35', '2022-12-12 10:24:24'),
(124, 'Chinigura Aromatic Rice (চিনির গুঁড়া সুগন্ধি চাল)', '37954160', 23, 2, 2, 100, NULL, 0, 1000, NULL, '1', '1', '1', '1', 8483, 100, 1, 'Admin', 'Admin', '2022-12-04 16:50:49', '2022-12-12 10:58:28'),
(125, 'Chinigura Aromatic Rice 1kg Pouch Pack', '47110356', 23, 1, 1, 4.25, NULL, 0, 1000, 1, '2', '2', '1', '1', 8483, 4.25, 1, 'Admin', 'Admin', '2022-12-04 16:52:36', '2022-12-12 10:58:28'),
(126, 'Chinigura Rice 1kg Bag 40p', '75911636', 23, 1, 1, 20, NULL, 0, 1000, NULL, '1', '2', '1', '1', 212, 20, 1, 'Admin', 'Admin', '2022-12-04 16:54:11', '2022-12-12 10:58:28'),
(127, 'Lachcha Semai (লাচ্ছা সেমাই)', '70530825', 25, 2, 2, 122.75, 116.00, 1910, 100, 1, '2', '1', '1', '1', 61.4, 116, 1, 'Admin', NULL, '2022-12-04 17:04:37', '2022-12-07 16:17:47'),
(129, 'Lachcha Semai Pouch Pack', '85290431', 25, 1, 1, 4.6, NULL, 0, 1000, 1, '2', '2', '1', '1', 807, 4.6, 1, 'Admin', 'Admin', '2022-12-04 17:07:06', '2022-12-07 16:17:47'),
(130, 'Lachcha Semai PP Poly 25p', '18409352', 25, 1, 1, 13, NULL, 0, 1000, 1, '2', '2', '1', '1', 33, 13, 1, 'Admin', 'Admin', '2022-12-04 17:09:50', '2022-12-07 16:17:47'),
(131, 'Puffed Rice (মুড়ি)', '31327642', 27, 2, 2, 72.5, NULL, 0, 1000, NULL, '1', '1', '1', '1', 229.5, 72.5, 1, 'Admin', 'Admin', '2022-12-04 17:11:58', '2022-12-12 10:58:28'),
(132, 'Puffed Rice 500g Pouch Pack', '38725096', 27, 1, 1, 7.5, NULL, 0, 1000, 1, '2', '2', '1', '1', 459, 7.5, 1, 'Admin', 'Admin', '2022-12-04 17:12:58', '2022-12-12 10:58:28'),
(133, 'Puffed Rice 500g PP Poly', '71937453', 27, 1, 1, 15, NULL, 0, 1000, NULL, '1', '2', '1', '1', 28, 15, 1, 'Admin', 'Admin', '2022-12-04 17:14:11', '2022-12-12 10:58:28'),
(134, 'Meat Curry Masala (গরুর মাংসের মশলা)', '20635123', 32, 2, 2, 402.5, NULL, 0, 100, 1, '2', '1', '1', '1', 4.72, 402.5, 1, 'Admin', NULL, '2022-12-04 17:24:10', '2022-12-05 13:55:16'),
(136, 'Meat Curry Masala 40g Paper Packet', '75194400', 32, 1, 1, 5.45, NULL, 0, 1000, 1, '2', '2', '1', '1', 118, 5.45, 1, 'Admin', NULL, '2022-12-04 17:47:59', '2022-12-05 13:55:16'),
(137, 'Chicken Curry Masala (মুরগির মাংসের মশলা)', '33749206', 32, 2, 2, 359, NULL, 0, 100, 1, '2', '1', '1', '1', 4.76, 359, 1, 'Admin', 'Admin', '2022-12-04 17:49:49', '2022-12-12 10:58:28'),
(138, 'Chicken Curry Masala 40g Paper Packet', '28395867', 32, 1, 1, 5.45, NULL, 0, 1000, 1, '2', '2', '1', '1', 119, 5.45, 1, 'Admin', 'Admin', '2022-12-04 17:51:10', '2022-12-12 10:58:28'),
(139, 'Biryani Masala (বিরিয়ানি মসলা)', '95896031', 32, 2, 2, 375, NULL, 0, 100, 1, '2', '1', '1', '1', 4.6, 375, 1, 'Admin', 'Admin', '2022-12-04 17:54:50', '2022-12-12 10:58:28'),
(140, 'Biryani Curry Masala 40g Paper Packet', '90528508', 32, 1, 1, 5.45, NULL, 0, 1000, 1, '2', '2', '1', '1', 115, 5.45, 1, 'Admin', 'Admin', '2022-12-04 17:55:50', '2022-12-12 10:58:28'),
(141, 'Halim Mix (হালিম মিক্স)', '52912423', 32, 2, 2, 153, NULL, 0, 100, 1, '2', '1', '1', '1', 16.4, 153, 1, 'Admin', NULL, '2022-12-04 17:59:23', '2022-12-05 13:55:16'),
(142, 'Halim Mix 200g Paper Packet', '62560923', 32, 1, 1, 6.35, NULL, 0, 1000, 1, '2', '2', '1', '1', 82, 6.35, 1, 'Admin', NULL, '2022-12-04 18:04:59', '2022-12-05 13:55:16'),
(144, 'Fish Curry Masala (মাছের মশলা)', '20932849', 32, 2, 2, 0, NULL, NULL, 100, 1, '2', '1', '1', '2', NULL, 0, NULL, 'Admin', NULL, '2022-12-04 18:36:35', '2022-12-04 18:36:35'),
(145, 'Fish Curry Masala 40g Paper Packet', '23036487', 32, 1, 1, 0, NULL, NULL, 0, 1, '2', '2', '1', '2', NULL, 0, NULL, 'Admin', NULL, '2022-12-04 18:40:06', '2022-12-04 18:40:06'),
(146, 'Ready Mix 40g Metal Packet', '18863792', 32, 1, 1, 1.55, NULL, 0, 1000, 1, '2', '2', '1', '1', 352, 1.55, 1, 'Admin', 'Admin', '2022-12-04 18:48:31', '2022-12-12 10:58:28'),
(147, 'Ready Mix 200g Metal Packet', '86399022', 32, 1, 1, 1.15, NULL, 0, 1000, 1, '2', '2', '1', '1', 82, 1.15, 1, 'Admin', NULL, '2022-12-04 18:49:38', '2022-12-05 13:55:16'),
(148, 'Meat Curry Masala 40g Carton 24p', '84539931', 32, 1, 1, 15, NULL, 0, 100, 1, '2', '2', '1', '1', 5, 15, 1, 'Admin', NULL, '2022-12-04 19:00:40', '2022-12-05 13:55:16'),
(149, 'Chicken Curry Masala 40g Carton 24p', '62808297', 32, 1, 1, 15, NULL, 0, 100, 1, '2', '2', '1', '1', 5, 15, 1, 'Admin', 'Admin', '2022-12-04 19:01:51', '2022-12-12 10:58:28'),
(150, 'Biryani Curry Masala 40g Carton 24p', '39281610', 32, 1, 1, 15, NULL, 0, 100, 1, '2', '2', '1', '1', 5, 15, 1, 'Admin', 'Admin', '2022-12-04 19:02:39', '2022-12-12 10:58:28'),
(151, 'Fish Curry Masala 40g Carton 24', '87719409', 32, 1, 1, 15, NULL, 0, 0, 1, '2', '2', '1', '1', 0, 15, 1, 'Admin', NULL, '2022-12-04 19:04:18', '2022-12-04 19:04:18'),
(152, 'Halim Mix 200g Carton 20p', '43969501', 32, 1, 1, 18, NULL, 0, 100, 1, '2', '2', '1', '1', 4, 18, 1, 'Admin', NULL, '2022-12-04 19:05:44', '2022-12-05 13:55:16');

-- --------------------------------------------------------

--
-- Table structure for table `material_purchase`
--

CREATE TABLE `material_purchase` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_id` bigint(20) UNSIGNED NOT NULL,
  `material_id` bigint(20) UNSIGNED NOT NULL,
  `qty` double NOT NULL,
  `received` double NOT NULL,
  `purchase_unit_id` bigint(20) UNSIGNED DEFAULT NULL,
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
(1, 1, 127, 2000, 2000, 2, 122.75, 122.75, NULL, NULL, '116', 0, NULL, 15, 32021.74, 245500, '2022-12-07 15:22:24', '2022-12-07 15:22:24'),
(2, 2, 92, 120, 1, 2, 195, 195.00, NULL, NULL, '193', 0, NULL, 0, 0, 23400, '2022-12-07 15:41:16', '2022-12-07 15:41:16'),
(3, 3, 91, 1680, 1680, 10, 177.45, 177.45, NULL, NULL, '175', 0, NULL, 0, 0, 298116, '2022-12-07 15:44:11', '2022-12-07 15:44:11'),
(4, 4, 92, 34, 34, 2, 195, 195.00, NULL, NULL, '195', 0, NULL, 0, 0, 6630, '2022-12-07 15:46:01', '2022-12-07 15:46:01');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
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
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
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
(81, '2021_03_06_114840_create_departments_table', 21),
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
(147, '2022_10_23_183516_create_salaries_table', 33),
(148, '2022_08_11_054557_create_loan_categories_table', 34),
(149, '2022_08_11_112655_create_loans_table', 34),
(150, '2021_03_08_061326_create_leaves_table', 35),
(151, '2021_03_07_053148_create_shifts_table', 36),
(152, '2021_07_04_091802_create_employee_routes_table', 37);

-- --------------------------------------------------------

--
-- Table structure for table `mobile_banks`
--

CREATE TABLE `mobile_banks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED NOT NULL,
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=divider,2=module',
  `module_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `divider_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `target` enum('_self','_blank') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `menu_id`, `type`, `module_name`, `divider_title`, `icon_class`, `url`, `order`, `parent_id`, `target`, `created_at`, `updated_at`) VALUES
(1, 1, '2', 'Dashboard', NULL, 'fas fa-tachometer-alt', '/', 1, NULL, NULL, NULL, '2022-11-23 07:01:52'),
(2, 1, '1', NULL, 'Menus', NULL, NULL, 2, NULL, NULL, NULL, '2022-11-23 07:01:52'),
(3, 1, '1', NULL, 'Access Control', NULL, NULL, 22, NULL, NULL, NULL, '2022-11-23 07:01:52'),
(4, 1, '2', 'User', NULL, 'fas fa-users', 'user', 26, NULL, NULL, NULL, '2022-11-23 07:01:52'),
(5, 1, '2', 'Role', NULL, 'fas fa-user-tag', 'role', 27, NULL, NULL, NULL, '2022-11-23 07:01:52'),
(6, 1, '1', NULL, 'System', NULL, NULL, 28, NULL, NULL, NULL, '2022-11-23 07:01:52'),
(7, 1, '2', 'Setting', NULL, 'fas fa-cogs', NULL, 29, NULL, NULL, NULL, '2022-11-23 07:01:52'),
(8, 1, '2', 'Menu', NULL, 'fas fa-th-list', 'menu', 30, NULL, NULL, NULL, '2022-11-23 07:01:52'),
(9, 1, '2', 'Permission', NULL, 'fas fa-tasks', 'menu/module/permission', 31, NULL, NULL, NULL, '2022-11-23 07:01:52'),
(10, 1, '2', 'General Setting', NULL, NULL, 'setting', 1, 7, NULL, '2021-03-26 18:01:48', '2021-03-26 18:06:29'),
(11, 1, '2', 'Warehouse', NULL, NULL, 'warehouse', 2, 7, NULL, '2021-03-26 18:07:10', '2021-10-11 05:42:35'),
(12, 1, '2', 'Customer Group', NULL, NULL, 'customer-group', 3, 7, NULL, '2021-03-26 18:07:41', '2021-03-26 18:08:14'),
(13, 1, '2', 'Unit', NULL, NULL, 'unit', 4, 7, NULL, '2021-03-26 18:07:54', '2022-05-16 04:00:51'),
(14, 1, '2', 'Vat', NULL, NULL, 'vat', 5, 7, '_self', '2021-03-26 18:08:03', '2022-05-16 04:00:51'),
(15, 1, '2', 'Material', NULL, 'fas fa-toolbox', NULL, 3, NULL, NULL, '2021-07-13 04:20:56', '2022-11-23 07:01:52'),
(16, 1, '2', 'Category', NULL, NULL, 'material/category', 1, 15, '_self', '2021-07-13 04:21:32', '2021-07-13 04:42:48'),
(17, 1, '2', 'Manage Material', NULL, NULL, 'material', 2, 15, NULL, '2021-07-13 04:22:22', '2021-07-13 04:42:54'),
(18, 1, '2', 'Material Stock', NULL, NULL, 'material-stock-report', 3, 15, NULL, '2021-07-13 04:41:53', '2022-06-29 04:03:41'),
(20, 1, '2', 'Purchase', NULL, 'fas fa-cart-arrow-down', NULL, 4, NULL, NULL, '2021-07-13 04:45:27', '2022-11-23 07:01:52'),
(21, 1, '2', 'Add Purchase', NULL, NULL, 'purchase/add', 1, 20, NULL, '2021-07-13 04:46:05', '2021-07-13 04:46:35'),
(22, 1, '2', 'Manage Purchase', NULL, NULL, 'purchase', 2, 20, NULL, '2021-07-13 04:46:31', '2021-07-13 04:46:44'),
(23, 1, '2', 'Product', NULL, 'fas fa-box', NULL, 5, NULL, NULL, '2021-07-13 04:49:30', '2022-11-23 07:01:52'),
(24, 1, '2', 'Category', NULL, NULL, 'product/category', 1, 23, NULL, '2021-07-13 04:50:00', '2021-07-13 04:52:42'),
(26, 1, '2', 'Manage Product', NULL, NULL, 'product', 2, 23, NULL, '2021-07-13 04:51:10', '2022-05-25 07:18:48'),
(28, 1, '2', 'Print Barcode', NULL, NULL, 'print-barcode', 5, 23, NULL, '2021-07-13 04:53:40', '2022-06-28 08:51:21'),
(31, 1, '2', 'Product Stock', NULL, NULL, 'product-stock-report', 3, 23, NULL, '2021-07-13 04:57:37', '2022-06-29 04:05:18'),
(33, 1, '2', 'Production', NULL, 'fas fa-industry', NULL, 6, NULL, NULL, '2021-07-13 05:47:47', '2022-11-23 07:01:52'),
(34, 1, '2', 'Add Production', NULL, NULL, 'production/add', 1, 33, NULL, '2021-07-13 05:48:09', '2021-07-13 05:49:41'),
(35, 1, '2', 'Manage Production', NULL, NULL, 'production', 2, 33, NULL, '2021-07-13 05:48:34', '2021-07-13 05:49:47'),
(41, 1, '2', 'Customer', NULL, 'far fa-handshake', NULL, 11, NULL, '_self', '2021-07-13 05:58:05', '2022-11-23 07:01:52'),
(42, 1, '2', 'Manage Customer', NULL, NULL, 'customer', 1, 41, NULL, '2021-07-13 05:59:22', '2021-07-13 06:01:37'),
(43, 1, '2', 'Customer Ledger', NULL, NULL, 'customer-ledger', 2, 41, NULL, '2021-07-13 05:59:47', '2021-07-13 06:01:37'),
(44, 1, '2', 'Credit Customer', NULL, NULL, 'credit-customer', 3, 41, NULL, '2021-07-13 06:00:15', '2021-07-13 06:01:40'),
(45, 1, '2', 'Paid Customer', NULL, NULL, 'paid-customer', 4, 41, NULL, '2021-07-13 06:00:44', '2021-07-13 06:01:43'),
(46, 1, '2', 'Customer Advance', NULL, NULL, 'customer-advance', 5, 41, NULL, '2021-07-13 06:01:22', '2021-07-13 06:01:47'),
(47, 1, '2', 'Supplier', NULL, 'fas fa-user-tie', NULL, 12, NULL, NULL, '2021-07-13 06:02:42', '2022-11-23 07:01:52'),
(48, 1, '2', 'Manage Supplier', NULL, NULL, 'supplier', 1, 47, NULL, '2021-07-13 06:03:11', '2021-07-13 06:04:20'),
(49, 1, '2', 'Supplier Ledger', NULL, NULL, 'supplier-ledger', 2, 47, NULL, '2021-07-13 06:03:44', '2021-07-13 06:04:37'),
(50, 1, '2', 'Supplier Advance', NULL, NULL, 'supplier-advance', 3, 47, NULL, '2021-07-13 06:04:13', '2021-07-13 06:04:37'),
(51, 1, '2', 'Stock Return', NULL, 'fas fa-undo-alt', NULL, 13, NULL, NULL, '2021-07-13 06:14:46', '2022-11-23 07:01:52'),
(52, 1, '2', 'Return', NULL, NULL, 'return', 1, 51, '_self', '2021-07-13 06:15:33', '2021-09-23 04:37:04'),
(53, 1, '2', 'Purchase Return', NULL, NULL, 'purchase-return', 2, 51, NULL, '2021-07-13 06:16:14', '2021-09-23 04:37:15'),
(57, 1, '2', 'Location', NULL, 'fas fa-map-marker-alt', NULL, 21, NULL, NULL, '2021-07-13 06:56:46', '2022-11-23 07:01:52'),
(58, 1, '2', 'Manage District', NULL, NULL, 'district', 1, 57, '_self', '2021-07-13 06:57:29', '2021-07-13 06:58:53'),
(59, 1, '2', 'Manage Upazila', NULL, NULL, 'upazila', 2, 57, NULL, '2021-07-13 06:57:58', '2022-06-09 04:48:08'),
(61, 1, '2', 'Manage Area', NULL, NULL, 'area', 3, 57, NULL, '2021-07-13 06:58:48', '2022-06-09 04:48:08'),
(62, 1, '2', 'Bank', NULL, 'fas fa-university', NULL, 18, NULL, NULL, '2021-07-13 08:16:58', '2022-11-23 07:01:52'),
(63, 1, '2', 'Manage Bank', NULL, NULL, 'bank', 1, 62, NULL, '2021-07-13 08:17:23', '2021-07-13 08:18:19'),
(64, 1, '2', 'Bank Transaction', NULL, NULL, 'bank-transaction', 2, 62, NULL, '2021-07-13 08:17:50', '2021-07-13 08:18:23'),
(65, 1, '2', 'Bank Ledger', NULL, NULL, 'bank-ledger', 3, 62, NULL, '2021-07-13 08:18:15', '2021-07-13 08:18:27'),
(66, 1, '2', 'Mobile Bank', NULL, 'fas fa-mobile-alt', NULL, 19, NULL, NULL, '2021-07-13 08:19:07', '2022-11-23 07:01:52'),
(67, 1, '2', 'Manage Mobile Bank', NULL, NULL, 'mobile-bank', 1, 66, NULL, '2021-07-13 08:19:31', '2021-07-13 08:20:41'),
(68, 1, '2', 'Mobile Bank Transaction', NULL, NULL, 'mobile-bank-transaction', 2, 66, NULL, '2021-07-13 08:20:10', '2021-09-06 04:19:26'),
(69, 1, '2', 'Mobile Bank Ledger', NULL, NULL, 'mobile-bank-ledger', 3, 66, NULL, '2021-07-13 08:20:37', '2021-09-06 04:19:54'),
(70, 1, '2', 'Expense', NULL, 'fas fa-money-check-alt', NULL, 17, NULL, NULL, '2021-07-13 09:00:55', '2022-11-23 07:01:52'),
(71, 1, '2', 'Manage Expense Item', NULL, NULL, 'expense-item', 1, 70, NULL, '2021-07-13 09:01:28', '2021-07-13 09:02:23'),
(72, 1, '2', 'Manage Expense', NULL, NULL, 'expense', 2, 70, NULL, '2021-07-13 09:01:50', '2021-07-13 09:02:31'),
(73, 1, '2', 'Expense Statement', NULL, NULL, 'expense-statement', 3, 70, NULL, '2021-07-13 09:02:19', '2021-07-13 09:02:36'),
(74, 1, '2', 'Accounts', NULL, 'far fa-money-bill-alt', NULL, 14, NULL, NULL, '2021-03-26 18:52:27', '2022-11-23 07:01:52'),
(75, 1, '2', 'Chart of Account', NULL, NULL, 'coa', 1, 74, NULL, '2021-03-26 18:52:53', '2021-05-11 06:10:34'),
(76, 1, '2', 'Opening Balance', NULL, NULL, 'opening-balance', 2, 74, NULL, '2021-03-26 18:53:20', '2021-05-11 06:10:34'),
(77, 1, '2', 'Manage Supplier Payment', NULL, NULL, 'supplier-payment', 4, 74, NULL, '2021-03-26 18:53:43', '2022-05-30 11:20:20'),
(78, 1, '2', 'Manage Customer Receive', NULL, NULL, 'customer-receive', 5, 74, NULL, '2021-03-26 18:54:01', '2022-05-30 11:20:20'),
(83, 1, '2', 'Manage Contra Voucher', NULL, NULL, 'contra-voucher', 8, 74, NULL, '2021-07-03 05:53:42', '2022-10-23 10:07:26'),
(85, 1, '2', 'Manage Journal Voucher', NULL, NULL, 'journal-voucher', 9, 74, NULL, '2021-07-03 05:54:24', '2022-10-23 10:07:26'),
(86, 1, '2', 'Voucher Approval', NULL, NULL, 'voucher-approval', 10, 74, NULL, '2021-03-26 18:56:21', '2022-10-23 10:07:26'),
(87, 1, '2', 'Report', NULL, 'fas fa-file-signature', NULL, 11, 74, NULL, '2021-03-26 18:58:02', '2022-10-23 10:07:26'),
(88, 1, '2', 'Cash Book', NULL, NULL, 'cash-book', 1, 87, NULL, '2021-03-26 18:58:53', '2021-03-26 19:01:24'),
(89, 1, '2', 'Inventory Ledger', NULL, NULL, 'inventory-ledger', 2, 87, NULL, '2021-03-26 18:59:21', '2021-03-26 19:01:25'),
(90, 1, '2', 'Bank Book', NULL, NULL, 'bank-book', 3, 87, NULL, '2021-03-26 18:59:42', '2021-03-26 19:01:30'),
(91, 1, '2', 'Mobile Bank Book', NULL, NULL, 'mobile-bank-book', 4, 87, NULL, '2021-03-26 19:00:00', '2021-03-26 19:01:41'),
(92, 1, '2', 'General Ledger', NULL, NULL, 'general-ledger', 5, 87, NULL, '2021-03-26 19:00:23', '2021-03-26 19:01:42'),
(93, 1, '2', 'Trial Balance', NULL, NULL, 'trial-balance', 6, 87, NULL, '2021-03-26 19:00:42', '2021-03-26 19:01:46'),
(94, 1, '2', 'Profit Loss', NULL, NULL, 'profit-loss', 7, 87, NULL, '2021-03-26 19:01:03', '2021-03-26 19:01:47'),
(95, 1, '2', 'Cash Flow', NULL, NULL, 'cash-flow', 8, 87, NULL, '2021-03-26 19:01:21', '2021-03-26 19:01:51'),
(96, 1, '2', 'Human Resource', NULL, 'fas fa-users', NULL, 16, NULL, NULL, '2021-04-03 10:54:02', '2022-11-23 07:01:52'),
(126, 1, '2', 'Production Finish Goods', NULL, NULL, 'finish-goods', 3, 33, '_self', '2021-08-12 12:56:32', '2021-10-17 09:51:28'),
(179, 1, '2', 'Report', NULL, 'fas fa-file-signature', NULL, 20, NULL, NULL, '2021-09-06 04:06:13', '2022-11-23 07:01:52'),
(180, 1, '2', 'Closing', NULL, NULL, 'closing', 1, 179, '_self', '2021-09-06 04:06:36', '2021-09-06 04:15:28'),
(181, 1, '2', 'Closing Report', NULL, NULL, 'closing-report', 2, 179, '_self', '2021-09-06 04:06:57', '2021-09-06 04:15:33'),
(182, 1, '2', 'Today\'s Sales Report', NULL, NULL, 'today-sales-report', 3, 179, '_self', '2021-09-06 04:07:35', '2021-10-17 10:03:54'),
(183, 1, '2', 'Sales Report', NULL, NULL, 'sales-report', 4, 179, '_self', '2021-09-06 04:07:55', '2021-09-23 06:57:46'),
(185, 1, '2', 'Today\'s Customer Receipt', NULL, NULL, 'todays-customer-receipt', 6, 179, '_self', '2021-09-06 04:09:08', '2021-09-23 06:57:46'),
(186, 1, '2', 'Customer Receipt List', NULL, NULL, 'customer-receipt-list', 7, 179, '_self', '2021-09-06 04:09:36', '2021-09-23 06:57:46'),
(187, 1, '2', 'Salesman Wise Sales Report', NULL, NULL, 'salesman-wise-sales-report', 8, 179, '_self', '2021-09-06 04:10:07', '2021-09-23 06:57:46'),
(193, 1, '2', 'Collection Report', NULL, NULL, 'collection-report', 12, 179, '_self', '2021-09-06 04:13:08', '2022-10-23 10:14:06'),
(196, 1, '2', 'Material Stock Alert Report', NULL, NULL, 'material-stock-alert-report', 16, 179, '_self', '2021-09-06 04:14:40', '2022-10-23 10:14:06'),
(203, 1, '2', 'Manage Debit Voucher', NULL, NULL, 'debit-voucher', 6, 74, '_self', '2021-09-07 09:55:31', '2022-10-23 10:07:26'),
(204, 1, '2', 'Manage Credit Voucher', NULL, NULL, 'credit-voucher', 7, 74, '_self', '2021-09-07 09:56:13', '2022-10-23 10:07:26'),
(233, 1, '2', 'Balance Sheet', NULL, NULL, 'balance-sheet', 9, 87, '_self', '2021-09-13 05:21:49', '2021-09-13 05:22:04'),
(234, 1, '2', 'Sale', NULL, 'fab fa-opencart', NULL, 7, NULL, '_self', '2021-09-22 08:55:19', '2022-11-23 07:01:52'),
(236, 1, '2', 'Manage Sale', NULL, NULL, 'sale', 1, 234, '_self', '2021-09-22 09:18:29', '2022-05-25 07:18:48'),
(237, 1, '2', 'Sale Return', NULL, NULL, 'sale-return', 3, 51, '_self', '2021-09-23 04:37:37', '2021-09-23 04:37:49'),
(238, 1, '2', 'Product Stock Alert Report', NULL, NULL, 'product-stock-alert-report', 17, 179, '_self', '2021-09-23 06:59:01', '2022-10-23 10:14:06'),
(239, 1, '2', 'SR Commission Report', NULL, NULL, 'sr-commission-report', 9, 179, '_self', '2021-09-23 08:30:24', '2021-09-23 08:30:55'),
(241, 1, '2', 'Manage Salesmen Payment', NULL, NULL, 'salesmen-payment', 3, 74, NULL, '2021-10-03 09:56:32', '2022-05-31 05:38:25'),
(244, 1, '2', 'Damage Product', NULL, 'fas fa-recycle', NULL, 10, NULL, NULL, '2021-10-05 07:58:44', '2022-11-23 07:01:52'),
(245, 1, '2', 'Damage', NULL, NULL, 'damage', 1, 244, NULL, '2021-10-05 07:59:04', '2021-10-05 09:24:26'),
(246, 1, '2', 'Damage Product', NULL, NULL, 'damage-product', 2, 244, NULL, '2021-10-06 08:16:38', '2021-10-06 08:16:48'),
(247, 1, '2', 'Material Stock Ledger', NULL, NULL, 'material-stock-ledger', 4, 15, NULL, '2021-10-07 06:54:47', '2022-11-23 07:08:26'),
(249, 1, '2', 'Product Stock Ledger', NULL, NULL, 'product-stock-ledger', 4, 23, NULL, '2021-10-07 08:46:55', '2022-06-28 08:51:21'),
(250, 1, '2', 'Transfer Inventory', NULL, 'fas fa-exchange-alt', NULL, 9, NULL, NULL, '2022-03-23 06:34:04', '2022-11-23 07:01:52'),
(251, 1, '2', 'Transfer Inventory Form', NULL, NULL, 'transfer-inventory/create', 1, 250, '_self', '2022-03-23 06:34:34', '2022-03-23 06:35:06'),
(252, 1, '2', 'Manage Transfer Inventory', NULL, NULL, 'transfer-inventory', 2, 250, '_self', '2022-03-23 06:35:00', '2022-03-23 06:35:10'),
(253, 1, '2', 'Dealer', NULL, 'fas fa-user', NULL, 25, NULL, NULL, '2022-04-04 03:46:46', '2022-11-23 07:01:52'),
(254, 1, '2', 'Add Dealer', NULL, NULL, 'dealer/add', 1, 253, '_self', '2022-04-04 03:47:09', '2022-04-04 03:47:30'),
(255, 1, '2', 'Manage Dealer', NULL, NULL, 'dealer', 2, 253, '_self', '2022-04-04 03:47:26', '2022-04-04 03:47:35'),
(256, 1, '2', 'Dealer Ledger', NULL, NULL, 'dealer-ledger', 3, 253, '_self', '2022-04-04 03:48:44', '2022-04-04 03:49:23'),
(257, 1, '2', 'Dealer Advance', NULL, NULL, 'dealer-advance', 4, 253, '_self', '2022-04-04 03:49:07', '2022-04-04 03:49:28'),
(263, 1, '2', 'Dealer Sale', NULL, 'fab fa-opencart', NULL, 8, NULL, NULL, '2022-05-29 07:15:43', '2022-11-23 07:01:52'),
(264, 1, '2', 'Manage Dealer Sale', NULL, NULL, 'dealer-sale', 1, 263, '_self', '2022-05-29 07:16:18', '2022-05-29 07:16:23'),
(265, 1, '2', 'Manage SR Salary', NULL, NULL, 'sr-salary', 1, 284, '_self', '2022-10-23 10:07:10', '2022-11-23 07:02:08'),
(266, 1, '2', 'Manage ASM Salary', NULL, NULL, 'asm-salary', 2, 284, '_self', '2022-10-23 10:13:50', '2022-11-23 07:02:16'),
(267, 1, '2', 'Loan', NULL, 'far fa-money-bill-alt', NULL, 15, NULL, '_self', '2022-11-10 09:38:02', '2022-11-23 07:01:52'),
(268, 1, '2', 'Manage Loan Categories', NULL, NULL, 'loan-categories', 1, 267, '_self', '2022-11-10 09:38:32', '2022-11-10 09:38:35'),
(269, 1, '2', 'Manage Loan', NULL, NULL, 'loan', 2, 267, '_self', '2022-11-10 09:39:02', '2022-11-10 09:39:08'),
(270, 1, '2', 'HRM', NULL, NULL, NULL, 1, 96, '_self', '2022-11-23 06:51:54', '2022-11-23 06:55:53'),
(271, 1, '2', 'Manage Department', NULL, NULL, 'department', 1, 270, '_self', '2022-11-23 06:52:55', '2022-11-23 06:52:59'),
(272, 1, '2', 'Manage Division', NULL, NULL, 'division', 2, 270, '_self', '2022-11-23 06:53:21', '2022-11-23 06:53:26'),
(273, 1, '2', 'Manage Designation', NULL, NULL, 'designation', 3, 270, '_self', '2022-11-23 06:53:53', '2022-11-23 06:53:58'),
(274, 1, '2', 'Manage Employee', NULL, NULL, 'employee', 4, 270, '_self', '2022-11-23 06:54:31', '2022-11-23 06:54:35'),
(275, 1, '2', 'Manage Shift', NULL, NULL, 'shift', 5, 270, '_self', '2022-11-23 06:54:53', '2022-11-23 06:54:59'),
(276, 1, '2', 'Attendance', NULL, NULL, NULL, 2, 96, '_self', '2022-11-23 06:56:49', '2022-11-23 06:58:10'),
(277, 1, '2', 'Manage Attendance', NULL, NULL, 'attendance', 1, 276, '_self', '2022-11-23 06:57:11', '2022-11-23 06:57:15'),
(278, 1, '2', 'Attendance Report', NULL, NULL, 'attendance-report', 2, 276, '_self', '2022-11-23 06:57:45', '2022-11-23 06:57:50'),
(279, 1, '2', 'Leave', NULL, NULL, NULL, 3, 96, '_self', '2022-11-23 06:58:40', '2022-11-23 07:01:18'),
(280, 1, '2', 'Weekly Holiday', NULL, NULL, 'weekly-holiday', 1, 279, '_self', '2022-11-23 06:59:14', '2022-11-23 06:59:42'),
(281, 1, '2', 'Holiday', NULL, NULL, 'holiday', 2, 279, '_self', '2022-11-23 06:59:36', '2022-11-23 06:59:43'),
(282, 1, '2', 'Manage Leave Type', NULL, NULL, 'leave-type', 3, 279, '_self', '2022-11-23 07:00:20', '2022-11-23 07:00:25'),
(283, 1, '2', 'Manage Leave Application', NULL, NULL, 'leave-application', 4, 279, '_self', '2022-11-23 07:00:57', '2022-11-23 07:01:02'),
(284, 1, '2', 'Payroll', NULL, NULL, NULL, 4, 96, '_self', '2022-11-23 07:01:35', '2022-11-23 07:01:52');

-- --------------------------------------------------------

--
-- Table structure for table `module_role`
--

CREATE TABLE `module_role` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `module_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
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
(32, 55, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(33, 56, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
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
(47, 44, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(48, 45, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(49, 46, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
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
(71, 87, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(72, 88, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(73, 89, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(74, 90, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(75, 91, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(76, 92, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(77, 93, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(78, 94, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(79, 95, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(80, 233, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
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
(128, 182, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(129, 183, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(131, 185, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(132, 186, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(133, 187, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(139, 193, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(146, 196, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(149, 234, 2, '2021-09-23 06:57:20', '2021-09-23 06:57:20'),
(151, 236, 2, '2021-09-23 06:57:20', '2021-09-23 06:57:20'),
(152, 237, 2, '2021-09-23 06:57:41', '2021-09-23 06:57:41'),
(153, 247, 2, '2021-10-13 10:19:18', '2021-10-13 10:19:18'),
(154, 249, 2, '2021-10-13 10:19:18', '2021-10-13 10:19:18'),
(156, 244, 2, '2021-10-13 10:19:18', '2021-10-13 10:19:18'),
(157, 245, 2, '2021-10-13 10:19:18', '2021-10-13 10:19:18'),
(158, 246, 2, '2021-10-13 10:19:18', '2021-10-13 10:19:18'),
(159, 241, 2, '2021-10-13 10:19:18', '2021-10-13 10:19:18'),
(160, 239, 2, '2021-10-13 10:19:18', '2021-10-13 10:19:18'),
(161, 238, 2, '2021-10-13 10:19:18', '2021-10-13 10:19:18'),
(162, 243, 2, '2021-10-13 10:19:18', '2021-10-13 10:19:18'),
(163, 242, 2, '2021-10-13 10:19:18', '2021-10-13 10:19:18'),
(1451, 1, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1452, 2, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1453, 15, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1454, 16, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1455, 17, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1456, 18, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1457, 247, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1458, 20, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1459, 21, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1460, 22, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1461, 23, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1462, 24, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1463, 25, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1464, 26, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1465, 28, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1466, 29, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1467, 30, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1468, 31, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1469, 249, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1470, 33, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1471, 34, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1472, 35, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1473, 126, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1474, 234, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1475, 235, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1476, 236, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1477, 240, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1478, 244, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1479, 245, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1480, 246, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1481, 41, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1482, 42, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1483, 43, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1484, 44, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1485, 45, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1486, 46, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1487, 47, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1488, 48, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1489, 49, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1490, 50, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1491, 51, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1492, 52, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1493, 53, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1494, 237, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1495, 74, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1496, 75, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1497, 76, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1498, 77, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1499, 78, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1500, 241, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1501, 79, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1502, 222, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1503, 80, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1504, 203, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1505, 81, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1506, 204, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1507, 82, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1508, 83, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1509, 84, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1510, 85, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1511, 86, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1512, 87, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1513, 88, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1514, 89, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1515, 90, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1516, 91, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1517, 92, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1518, 93, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1519, 94, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1520, 95, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1521, 233, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1522, 223, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1523, 224, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1524, 225, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1525, 226, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1526, 227, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1527, 228, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1528, 229, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1529, 230, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1530, 231, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1531, 232, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1532, 96, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1533, 97, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1534, 98, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1535, 99, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1536, 100, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1537, 101, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1538, 102, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1539, 103, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1540, 104, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1541, 105, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1542, 106, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1543, 112, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1544, 113, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1545, 114, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1546, 115, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1547, 116, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1548, 107, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1549, 108, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1550, 109, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1551, 110, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1552, 111, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1553, 70, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1554, 71, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1555, 72, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1556, 73, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1557, 62, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1558, 63, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1559, 64, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1560, 65, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1561, 66, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1562, 67, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1563, 68, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1564, 69, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1565, 179, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1568, 182, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1569, 183, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1570, 184, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1571, 185, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1572, 186, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1573, 187, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1574, 239, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1575, 188, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1576, 189, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1577, 190, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1578, 193, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1579, 194, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1580, 199, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1581, 198, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1582, 196, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1583, 238, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1584, 57, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1585, 58, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1586, 59, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1588, 61, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1589, 3, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1590, 4, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1591, 5, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1592, 55, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1593, 243, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1594, 56, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1595, 242, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1596, 6, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1597, 7, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1598, 10, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1599, 11, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1600, 12, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1601, 13, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1602, 14, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(1603, 1, 40, '2022-03-03 09:24:10', '2022-03-03 09:24:10'),
(1604, 2, 40, '2022-03-03 09:24:10', '2022-03-03 09:24:10'),
(1605, 23, 40, '2022-03-03 09:24:10', '2022-03-03 09:24:10'),
(1606, 24, 40, '2022-03-03 09:24:10', '2022-03-03 09:24:10'),
(1607, 25, 40, '2022-03-03 09:24:10', '2022-03-03 09:24:10'),
(1608, 26, 40, '2022-03-03 09:24:10', '2022-03-03 09:24:10'),
(1609, 28, 40, '2022-03-03 09:24:10', '2022-03-03 09:24:10'),
(1610, 29, 40, '2022-03-03 09:24:10', '2022-03-03 09:24:10'),
(1611, 30, 40, '2022-03-03 09:24:10', '2022-03-03 09:24:10'),
(1612, 31, 40, '2022-03-03 09:24:10', '2022-03-03 09:24:10'),
(1613, 249, 40, '2022-03-03 09:24:10', '2022-03-03 09:24:10'),
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
(1631, 2, 43, '2022-03-03 09:28:05', '2022-03-03 09:28:05'),
(1632, 55, 43, '2022-03-03 09:28:05', '2022-03-03 09:28:05'),
(1663, 234, 43, '2022-03-03 09:38:39', '2022-03-03 09:38:39'),
(1665, 236, 43, '2022-03-03 09:38:39', '2022-03-03 09:38:39'),
(1667, 244, 43, '2022-03-03 09:38:39', '2022-03-03 09:38:39'),
(1668, 245, 43, '2022-03-03 09:38:39', '2022-03-03 09:38:39'),
(1669, 246, 43, '2022-03-03 09:38:39', '2022-03-03 09:38:39'),
(1670, 51, 43, '2022-03-03 09:38:39', '2022-03-03 09:38:39'),
(1671, 52, 43, '2022-03-03 09:38:39', '2022-03-03 09:38:39'),
(1672, 53, 43, '2022-03-03 09:38:39', '2022-03-03 09:38:39'),
(1673, 237, 43, '2022-03-03 09:38:39', '2022-03-03 09:38:39'),
(1674, 243, 43, '2022-03-03 09:38:39', '2022-03-03 09:38:39'),
(1675, 56, 43, '2022-03-03 09:38:39', '2022-03-03 09:38:39'),
(1676, 242, 43, '2022-03-03 09:38:39', '2022-03-03 09:38:39'),
(1677, 41, 43, '2022-03-03 17:10:51', '2022-03-03 17:10:51'),
(1678, 42, 43, '2022-03-03 17:10:51', '2022-03-03 17:10:51'),
(1679, 43, 43, '2022-03-03 17:10:51', '2022-03-03 17:10:51'),
(1680, 44, 43, '2022-03-03 17:10:51', '2022-03-03 17:10:51'),
(1681, 45, 43, '2022-03-03 17:10:51', '2022-03-03 17:10:51'),
(1682, 46, 43, '2022-03-03 17:10:51', '2022-03-03 17:10:51'),
(1683, 70, 43, '2022-03-03 17:10:51', '2022-03-03 17:10:51'),
(1684, 71, 43, '2022-03-03 17:10:52', '2022-03-03 17:10:52'),
(1685, 72, 43, '2022-03-03 17:10:52', '2022-03-03 17:10:52'),
(1686, 73, 43, '2022-03-03 17:10:52', '2022-03-03 17:10:52'),
(1687, 179, 43, '2022-03-03 17:10:52', '2022-03-03 17:10:52'),
(1690, 182, 43, '2022-03-03 17:10:52', '2022-03-03 17:10:52'),
(1691, 183, 43, '2022-03-03 17:10:52', '2022-03-03 17:10:52'),
(1693, 185, 43, '2022-03-03 17:10:52', '2022-03-03 17:10:52'),
(1694, 186, 43, '2022-03-03 17:10:52', '2022-03-03 17:10:52'),
(1695, 187, 43, '2022-03-03 17:10:52', '2022-03-03 17:10:52'),
(1696, 239, 43, '2022-03-03 17:10:52', '2022-03-03 17:10:52'),
(1700, 193, 43, '2022-03-03 17:10:52', '2022-03-03 17:10:52'),
(1704, 196, 43, '2022-03-03 17:10:52', '2022-03-03 17:10:52'),
(1705, 238, 43, '2022-03-03 17:10:52', '2022-03-03 17:10:52'),
(1708, 250, 40, '2022-03-23 10:06:05', '2022-03-23 10:06:05'),
(1709, 252, 40, '2022-03-23 10:06:05', '2022-03-23 10:06:05'),
(1710, 263, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(1711, 264, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(1712, 250, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(1713, 251, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(1714, 252, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(1715, 265, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(1716, 266, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(1717, 180, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(1718, 181, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(1719, 261, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(1720, 262, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(1721, 258, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(1722, 260, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(1723, 259, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
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
(1804, 270, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(1805, 271, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(1806, 272, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(1807, 273, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(1808, 274, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(1809, 275, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(1810, 276, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(1811, 277, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(1812, 278, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(1813, 279, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(1814, 280, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(1815, 281, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(1816, 282, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(1817, 283, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(1818, 284, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(1819, 267, 2, '2022-11-28 10:46:40', '2022-11-28 10:46:40'),
(1820, 268, 2, '2022-11-28 10:46:40', '2022-11-28 10:46:40'),
(1821, 269, 2, '2022-11-28 10:46:40', '2022-11-28 10:46:40'),
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
(1866, 1, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1867, 15, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1868, 16, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1869, 17, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1870, 18, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1871, 247, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1872, 20, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1873, 21, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1874, 22, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1875, 23, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1876, 24, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1877, 26, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1878, 31, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1879, 249, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1880, 28, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1881, 33, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1882, 34, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1883, 35, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1884, 126, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1885, 263, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1886, 264, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1887, 250, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1888, 251, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1889, 252, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1890, 47, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1891, 48, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1892, 49, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1893, 50, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1894, 74, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1895, 75, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1896, 76, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1897, 241, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1898, 77, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1899, 78, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1900, 203, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1901, 204, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1902, 83, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1903, 85, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1904, 86, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1905, 87, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1906, 88, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1907, 89, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1908, 90, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1909, 91, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1910, 92, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1911, 93, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1912, 94, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1913, 95, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1914, 233, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1915, 267, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1916, 268, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1917, 269, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1918, 96, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1919, 270, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1920, 271, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1921, 272, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1922, 273, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1923, 274, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1924, 275, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1925, 276, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1926, 277, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1927, 278, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1928, 279, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1929, 280, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1930, 281, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1931, 282, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1932, 283, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1933, 284, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1934, 265, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1935, 266, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1936, 62, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1937, 63, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1938, 64, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1939, 65, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1940, 66, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1941, 67, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1942, 68, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1943, 69, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1944, 180, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1945, 181, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1946, 57, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1947, 58, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1948, 59, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1949, 61, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1950, 3, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1951, 261, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1952, 262, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1953, 258, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1954, 260, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1955, 259, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1956, 253, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1957, 254, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1958, 255, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1959, 256, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(1960, 257, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
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
(2033, 28, 47, '2022-12-12 12:18:23', '2022-12-12 12:18:23');

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
  `id` bigint(20) UNSIGNED NOT NULL,
  `module_id` bigint(20) UNSIGNED NOT NULL,
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
(132, 44, 'Credit Customer Access', 'credit-customer-access', '2021-07-13 11:06:56', NULL),
(133, 45, 'Paid Customer Access', 'paid-customer-access', '2021-07-13 11:07:12', NULL),
(134, 46, 'Customer Advance Access', 'customer-advance-access', '2021-07-13 11:08:16', NULL),
(139, 46, 'Customer Advance Report', 'customer-advance-report', '2021-07-13 11:08:16', NULL),
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
(182, 88, 'Cash Book Access', 'cash-book-access', '2021-07-13 16:31:28', NULL),
(183, 89, 'Inventory Ledger Access', 'inventory-ledger-access', '2021-07-13 16:31:52', NULL),
(184, 90, 'Bank Book Access', 'bank-book-access', '2021-07-13 16:32:26', NULL),
(185, 91, 'Mobile Bank Book Access', 'mobile-bank-book-access', '2021-07-13 16:32:46', NULL),
(186, 92, 'General Ledger Access', 'general-ledger-access', '2021-07-13 17:00:34', NULL),
(187, 93, 'Trial Balance Access', 'trial-balance-access', '2021-07-13 17:00:59', NULL),
(188, 94, 'Profit Loss Access', 'profit-loss-access', '2021-07-13 17:01:20', NULL),
(189, 95, 'Cash Flow Access', 'cash-flow-access', '2021-07-13 17:01:40', NULL),
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
(453, 181, 'Closing Report Access', 'closing-report-access', '2021-09-06 04:21:26', NULL),
(454, 182, 'Today Sales Report Access', 'today-sales-report-access', '2021-09-06 04:25:48', NULL),
(455, 183, 'Sales Report Access', 'sales-report-access', '2021-09-06 04:26:08', NULL),
(457, 185, 'Todays-customer-receipt-access', 'todays-customer-receipt-access', '2021-09-06 04:27:18', NULL),
(458, 186, 'Customer Receipt List Access', 'customer-receipt-list-access', '2021-09-06 04:27:40', NULL),
(459, 187, 'Salesman Wise Sales Report Access', 'salesman-wise-sales-report-access', '2021-09-06 04:28:10', NULL),
(465, 193, 'Collection Report Access', 'collection-report-access', '2021-09-06 04:31:04', NULL),
(468, 196, 'Material Stock Alert Report Access', 'material-stock-alert-report-access', '2021-09-06 04:32:12', '2021-09-06 18:30:08'),
(475, 203, 'Debit Voucher Access', 'debit-voucher-access', '2021-09-07 09:57:25', '2021-09-20 09:23:24'),
(476, 204, 'Credit Voucher Access', 'credit-voucher-access', '2021-09-07 09:59:32', '2021-09-20 09:28:19'),
(477, 46, 'Customer Advance Add', 'customer-advance-add', '2021-09-07 10:34:17', NULL),
(478, 46, 'Customer Advance Edit', 'customer-advance-edit', '2021-09-07 10:34:50', NULL),
(479, 46, 'Customer Advance Delete', 'customer-advance-delete', '2021-09-07 10:34:50', NULL),
(540, 233, 'Balance Sheet Access', 'balance-sheet-access', '2021-09-13 05:22:33', NULL),
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
(557, 239, 'SR Commission Report Access', 'sr-commission-report-access', '2021-09-23 08:31:23', NULL),
(558, 238, 'Product Stock Alert Report Access', 'product-stock-alert-report-access', '2021-09-23 10:12:15', NULL),
(560, 241, 'Salesmen Payment Access', 'salesmen-payment-access', '2021-10-03 09:57:18', NULL),
(562, 245, 'Damage Access', 'damage-access', '2021-10-05 09:14:28', NULL),
(563, 245, 'Damage Add', 'damage-add', '2021-10-06 07:45:13', NULL),
(564, 247, 'Material Stock Ledger Access', 'material-stock-ledger-access', '2021-10-07 06:59:00', NULL),
(565, 247, 'Material Stock Ledger Cost View', 'material-stock-ledger-cost-view', '2021-10-07 06:59:00', NULL),
(566, 249, 'Product Ledger Access', 'product-ledger-access', '2021-10-07 08:47:59', NULL),
(567, 249, 'Product Stock Ledger Price View', 'product-stock-ledger-price-view', '2021-10-07 08:47:59', NULL),
(568, 203, 'Debit Voucher View', 'debit-voucher-view', '2021-10-13 11:18:33', NULL),
(569, 203, 'Debit Voucher Delete', 'debit-voucher-delete', '2021-10-13 11:18:33', NULL),
(570, 204, 'Credit Voucher View', 'credit-voucher-view', '2021-10-13 11:19:06', NULL),
(571, 204, 'Credit Voucher Delete', 'credit-voucher-delete', '2021-10-13 11:19:06', NULL),
(572, 22, 'Purchase Payment Add', 'purchase-payment-add', '2021-11-15 12:07:18', NULL),
(573, 22, 'Purchase Payment Edit', 'purchase-payment-edit', '2021-11-15 12:07:18', NULL),
(574, 22, 'Purchase Payment View', 'purchase-payment-view', '2021-11-15 12:07:18', NULL),
(575, 22, 'Purchase Payment Delete', 'purchase-payment-delete', '2021-11-15 12:07:18', NULL),
(576, 181, 'Closing Access', 'closing-access', '2022-03-22 06:50:02', NULL),
(577, 181, 'Closing Add', 'closing-add', '2022-03-22 06:50:02', NULL),
(578, 181, 'Closing View', 'closing-view', '2022-03-22 06:50:02', NULL),
(579, 181, 'Closing Delete', 'closing-delete', '2022-03-22 06:50:02', NULL),
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
(625, 264, 'Dealer Sale Access', 'dealer-sale-access', '2022-05-30 04:27:41', NULL),
(626, 264, 'Dealer Sale Add', 'dealer-sale-add', '2022-05-30 04:27:41', NULL),
(627, 264, 'Dealer Sale Edit', 'dealer-sale-edit', '2022-05-30 04:27:41', '2022-05-30 06:41:00'),
(628, 264, 'Dealer Sale View', 'dealer-sale-view', '2022-05-30 04:27:41', NULL),
(629, 264, 'Dealer Sale Delete', 'dealer-sale-delete', '2022-05-30 04:27:41', NULL),
(630, 264, 'Dealer Sale Status Change', 'dealer-sale-status-change', '2022-05-30 04:27:41', NULL),
(631, 264, 'Dealer Sale Product Delivery', 'dealer-sale-product-delivery', '2022-05-30 04:27:41', NULL),
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
(642, 265, 'Sr Salary Access', 'sr-salary-access', '2022-10-24 08:58:16', NULL),
(643, 265, 'Sr Salary Add', 'sr-salary-add', '2022-10-24 08:59:12', NULL),
(644, 265, 'Sr Salary Edit', 'sr-salary-edit', '2022-10-24 08:59:12', NULL),
(645, 265, 'Sr Salary Status Change', 'sr-salary-status-change', '2022-10-24 08:59:12', NULL),
(646, 265, 'Sr Salary Delete', 'sr-salary-delete', '2022-10-24 08:59:12', NULL),
(647, 266, 'ASM Salary Access', 'asm-salary-access', '2022-10-25 17:31:46', NULL),
(648, 266, 'ASM Salary Add', 'asm-salary-add', '2022-10-25 17:31:46', NULL),
(649, 266, 'ASM Salary Edit', 'asm-salary-edit', '2022-10-25 17:31:46', NULL),
(650, 266, 'ASM Salary Status Change', 'asm-salary-status-change', '2022-10-25 17:31:46', NULL),
(651, 266, 'ASM Salary Delete', 'asm-salary-delete', '2022-10-25 17:31:46', NULL),
(652, 268, 'Loan Categories Access', 'loan-categories-access', '2022-11-10 09:49:59', NULL),
(653, 268, 'Loan Categories Store Update', 'loan-categories-store-update', '2022-11-10 09:49:59', NULL),
(654, 268, 'Loan Categories Edit', 'loan-categories-edit', '2022-11-10 09:49:59', NULL),
(655, 268, 'Loan Categories Delete', 'loan-categories-delete', '2022-11-10 09:49:59', NULL),
(656, 269, 'Loan Access', 'loan-access', '2022-11-10 09:51:17', NULL),
(657, 269, 'Loan Add', 'loan-add', '2022-11-10 09:51:17', NULL),
(658, 269, 'Loan Edit', 'loan-edit', '2022-11-10 09:51:17', NULL),
(659, 269, 'Loan Delete', 'loan-delete', '2022-11-10 09:51:17', NULL),
(660, 269, 'Loan View', 'loan-view', '2022-11-10 09:51:17', NULL),
(661, 269, 'Loan Status Change', 'loan-status-change', '2022-11-10 09:51:17', NULL),
(662, 271, 'Department Report', 'department-report', '2022-11-23 08:29:13', NULL),
(663, 271, 'Department Bulk Delete', 'department-bulk-delete', '2022-11-23 08:29:13', NULL),
(664, 271, 'Department Delete', 'department-delete', '2022-11-23 08:29:13', NULL),
(665, 271, 'Department Edit', 'department-edit', '2022-11-23 08:29:13', NULL),
(666, 271, 'Department Add', 'department-add', '2022-11-23 08:29:13', NULL),
(667, 271, 'Department Access', 'department-access', '2022-11-23 08:29:13', NULL),
(668, 272, 'Division Report', 'division-report', '2022-11-23 08:30:07', NULL),
(669, 272, 'Division Bulk Delete', 'division-bulk-delete', '2022-11-23 08:30:07', NULL),
(670, 272, 'Division Delete', 'division-delete', '2022-11-23 08:30:07', NULL),
(671, 272, 'Division Edit', 'division-edit', '2022-11-23 08:30:07', NULL),
(672, 272, 'Division Add', 'division-add', '2022-11-23 08:30:07', NULL),
(673, 272, 'Division Access', 'division-access', '2022-11-23 08:30:07', NULL),
(674, 273, 'Designation Report', 'designation-report', '2022-11-23 08:31:35', NULL),
(675, 273, 'Designation Bulk Delete', 'designation-bulk-delete', '2022-11-23 08:31:35', NULL),
(676, 273, 'Designation Delete', 'designation-delete', '2022-11-23 08:31:35', NULL),
(677, 273, 'Designation Edit', 'designation-edit', '2022-11-23 08:31:35', NULL),
(678, 273, 'Designation Add', 'designation-add', '2022-11-23 08:31:35', NULL),
(679, 273, 'Designation Access', 'designation-access', '2022-11-23 08:31:35', NULL),
(680, 274, 'Employee Report', 'employee-report', '2022-11-23 08:32:35', NULL),
(681, 274, 'Employee Bulk Delete', 'employee-bulk-delete', '2022-11-23 08:32:35', NULL),
(682, 274, 'Employee Delete', 'employee-delete', '2022-11-23 08:32:35', NULL),
(683, 274, 'Employee View', 'employee-view', '2022-11-23 08:32:35', NULL),
(684, 274, 'Employee Edit', 'employee-edit', '2022-11-23 08:32:35', NULL),
(685, 274, 'Employee Add', 'employee-add', '2022-11-23 08:32:35', NULL),
(686, 274, 'Employee Access', 'employee-access', '2022-11-23 08:32:35', NULL),
(687, 275, 'Employee Shift Change', 'employee-shift-change', '2022-11-23 08:34:07', NULL),
(688, 275, 'Shift Manage Report', 'shift-manage-report', '2022-11-23 08:34:07', NULL),
(689, 275, 'Shift Manage Bulk Delete', 'shift-manage-bulk-delete', '2022-11-23 08:34:07', NULL),
(690, 275, 'Shift Manage Delete', 'shift-manage-delete', '2022-11-23 08:34:07', NULL),
(691, 275, 'Shift Manage Edit', 'shift-manage-edit', '2022-11-23 08:34:07', NULL),
(692, 275, 'Shift Manage Add', 'shift-manage-add', '2022-11-23 08:34:07', NULL),
(693, 275, 'Shift Manage Access', 'shift-manage-access', '2022-11-23 08:34:07', NULL),
(694, 275, 'Shift Report', 'shift-report', '2022-11-23 08:34:07', NULL),
(695, 275, 'Shift Bulk Delete', 'shift-bulk-delete', '2022-11-23 08:34:07', NULL),
(696, 275, 'Shift Delete', 'shift-delete', '2022-11-23 08:34:07', NULL),
(697, 275, 'Shift Edit', 'shift-edit', '2022-11-23 08:34:07', NULL),
(698, 275, 'Shift Add', 'shift-add', '2022-11-23 08:34:07', NULL),
(699, 275, 'Shift Access', 'shift-access', '2022-11-23 08:34:07', NULL),
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
(719, 282, 'Leave Type Report', 'leave-type-report', '2022-11-23 08:38:09', NULL),
(720, 282, 'Leave Type Bulk Delete', 'leave-type-bulk-delete', '2022-11-23 08:38:09', NULL),
(721, 282, 'Leave Type Delete', 'leave-type-delete', '2022-11-23 08:38:09', NULL),
(722, 282, 'Leave Type Edit', 'leave-type-edit', '2022-11-23 08:38:09', NULL),
(723, 282, 'Leave Type Add', 'leave-type-add', '2022-11-23 08:38:09', NULL),
(724, 282, 'Leave Type Access', 'leave-type-access', '2022-11-23 08:38:09', NULL),
(725, 283, 'Leave Application Approve', 'leave-application-approve', '2022-11-23 08:39:13', NULL),
(726, 283, 'Leave Application Report', 'leave-application-report', '2022-11-23 08:39:13', NULL),
(727, 283, 'Leave Application Bulk Delete', 'leave-application-bulk-delete', '2022-11-23 08:39:13', NULL),
(728, 283, 'Leave Application Delete', 'leave-application-delete', '2022-11-23 08:39:13', NULL),
(729, 283, 'Leave Application Edit', 'leave-application-edit', '2022-11-23 08:39:13', NULL),
(730, 283, 'Leave Application Add', 'leave-application-add', '2022-11-23 08:39:13', NULL),
(731, 283, 'Leave Application Access', 'leave-application-access', '2022-11-23 08:39:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
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
(114, 251, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(115, 252, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(116, 253, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(117, 254, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(118, 255, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(119, 256, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(120, 257, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
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
(156, 132, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(157, 133, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(158, 134, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(159, 139, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(160, 477, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(161, 478, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(162, 479, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
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
(202, 182, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(203, 183, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(204, 184, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(205, 185, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(206, 186, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(207, 187, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(208, 188, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(209, 189, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(210, 540, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
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
(358, 454, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(359, 455, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(361, 457, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(362, 458, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(363, 459, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(369, 465, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
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
(393, 566, 2, '2021-10-13 10:19:18', '2021-10-13 10:19:18'),
(394, 567, 2, '2021-10-13 10:19:18', '2021-10-13 10:19:18'),
(396, 562, 2, '2021-10-13 10:19:18', '2021-10-13 10:19:18'),
(397, 563, 2, '2021-10-13 10:19:18', '2021-10-13 10:19:18'),
(398, 546, 2, '2021-10-13 10:19:18', '2021-10-13 10:19:18'),
(399, 560, 2, '2021-10-13 10:19:18', '2021-10-13 10:19:18'),
(400, 557, 2, '2021-10-13 10:19:18', '2021-10-13 10:19:18'),
(401, 558, 2, '2021-10-13 10:19:18', '2021-10-13 10:19:18'),
(402, 561, 2, '2021-10-13 10:19:18', '2021-10-13 10:19:18'),
(403, 568, 2, '2021-10-13 05:29:34', '2021-10-13 05:29:34'),
(404, 569, 2, '2021-10-13 05:29:34', '2021-10-13 05:29:34'),
(405, 570, 2, '2021-10-13 05:29:34', '2021-10-13 05:29:34'),
(406, 571, 2, '2021-10-13 05:29:34', '2021-10-13 05:29:34'),
(3351, 572, 2, '2022-02-28 23:56:14', '2022-02-28 23:56:14'),
(3352, 573, 2, '2022-02-28 23:56:14', '2022-02-28 23:56:14'),
(3353, 574, 2, '2022-02-28 23:56:14', '2022-02-28 23:56:14'),
(3354, 575, 2, '2022-02-28 23:56:14', '2022-02-28 23:56:14'),
(3358, 1, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3359, 58, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3360, 59, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3361, 60, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3362, 61, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3363, 62, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3364, 63, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3365, 64, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3366, 65, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3367, 66, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3368, 67, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3369, 68, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3370, 69, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3371, 70, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3372, 71, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3373, 564, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3374, 565, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3375, 73, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3376, 74, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3377, 75, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3378, 76, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3379, 77, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3380, 78, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3381, 79, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3382, 572, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3383, 573, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3384, 574, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3385, 575, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3386, 80, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3387, 81, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3388, 82, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3389, 83, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3390, 84, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3391, 85, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3392, 92, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3393, 93, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3394, 94, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3395, 95, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3396, 96, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3397, 97, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3398, 98, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3399, 99, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3400, 100, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3401, 101, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3402, 102, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3403, 103, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3404, 104, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3405, 105, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3406, 106, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3407, 107, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3408, 566, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3409, 567, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
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
(3420, 547, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3421, 548, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3422, 549, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3423, 550, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3424, 551, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3425, 552, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3426, 559, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3427, 562, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3428, 563, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3429, 124, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3430, 130, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3431, 542, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3432, 543, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3433, 546, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3434, 131, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3435, 132, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3436, 133, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3437, 134, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3438, 139, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3439, 477, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3440, 478, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3441, 479, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3442, 140, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3443, 141, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3444, 142, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3445, 143, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3446, 144, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3447, 145, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3448, 146, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3449, 147, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3450, 148, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3451, 356, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3452, 357, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3453, 358, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3454, 359, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3455, 360, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3456, 152, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3457, 153, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3458, 154, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3459, 155, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3460, 156, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3461, 553, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3462, 554, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3463, 555, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3464, 556, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3465, 160, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3466, 161, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3467, 162, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3468, 163, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3469, 164, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3470, 165, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3471, 166, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3472, 560, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3473, 509, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3474, 510, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3475, 511, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3476, 512, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3477, 513, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3478, 475, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3479, 544, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3480, 568, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3481, 569, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3482, 476, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3483, 545, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3484, 570, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3485, 571, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3486, 170, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3487, 171, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3488, 172, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3489, 173, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3490, 174, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3491, 175, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3492, 176, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3493, 177, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3494, 178, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3495, 179, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3496, 180, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3497, 181, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3498, 182, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3499, 183, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3500, 184, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3501, 185, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3502, 186, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3503, 187, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3504, 188, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3505, 189, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3506, 540, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3507, 514, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3508, 515, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3509, 516, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3510, 517, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3511, 518, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3512, 519, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3513, 520, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3514, 521, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3515, 522, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3516, 523, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3517, 524, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3518, 525, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3519, 526, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3520, 527, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3521, 528, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3522, 529, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3523, 530, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3524, 531, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3525, 532, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3526, 533, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3527, 534, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3528, 535, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3529, 536, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3530, 537, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3531, 538, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3532, 539, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3533, 258, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3534, 259, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3535, 260, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3536, 261, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3537, 262, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3538, 263, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3539, 264, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3540, 265, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3541, 266, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3542, 267, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3543, 268, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3544, 269, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3545, 270, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3546, 271, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3547, 272, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3548, 273, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3549, 274, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3550, 275, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3551, 333, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3552, 334, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3553, 335, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3554, 336, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3555, 337, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3556, 338, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3557, 339, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3558, 340, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3559, 341, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3560, 342, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3561, 343, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3562, 344, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3563, 345, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3564, 276, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3565, 277, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3566, 278, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3567, 279, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3568, 280, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3569, 281, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3570, 282, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3571, 283, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3572, 284, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3573, 285, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3574, 286, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3575, 287, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3576, 288, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3577, 289, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3578, 290, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3579, 291, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3580, 292, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3581, 293, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3582, 294, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3583, 295, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3584, 296, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3585, 297, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3586, 298, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3587, 299, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3588, 300, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3589, 301, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3590, 302, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3591, 303, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3592, 304, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3593, 305, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3594, 306, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3595, 307, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3596, 308, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3597, 309, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3598, 310, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3599, 311, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3600, 312, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3601, 313, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3602, 314, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3603, 315, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3604, 316, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3605, 317, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3606, 318, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3607, 319, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3608, 320, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3609, 321, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3610, 322, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3611, 323, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3612, 324, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3613, 325, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3614, 326, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3615, 327, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3616, 328, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3617, 329, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3618, 330, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3619, 331, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3620, 332, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3621, 541, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3622, 190, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3623, 191, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3624, 192, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3625, 193, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3626, 194, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3627, 195, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3628, 196, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3629, 197, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3630, 198, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3631, 199, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3632, 200, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3633, 201, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3634, 202, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3635, 203, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3636, 204, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3637, 205, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3638, 206, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3639, 207, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3640, 208, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3641, 209, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3642, 210, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3643, 211, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3644, 212, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3645, 213, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3646, 214, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3647, 215, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3648, 216, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3649, 217, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3650, 218, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3653, 454, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3654, 455, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3655, 456, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3656, 457, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3657, 458, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3658, 459, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3659, 557, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3660, 460, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3661, 461, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3662, 462, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3663, 465, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3664, 466, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3665, 470, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3666, 472, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3667, 468, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3668, 558, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3669, 219, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3670, 220, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3671, 221, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3672, 222, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3673, 223, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3674, 224, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3675, 225, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3676, 226, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3677, 227, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3678, 228, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3679, 229, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3680, 230, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3687, 237, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3688, 238, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3689, 239, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3690, 240, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3691, 241, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3692, 242, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3693, 2, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3694, 3, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3695, 4, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3696, 5, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3697, 6, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3698, 7, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3699, 8, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3700, 9, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3701, 10, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3702, 11, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3703, 12, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3704, 13, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3705, 14, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3706, 15, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3707, 243, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3708, 244, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3709, 245, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3710, 246, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3711, 247, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3712, 248, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3713, 249, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3714, 251, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3715, 252, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3716, 253, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3717, 254, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3718, 255, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3719, 256, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3720, 257, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3721, 561, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3722, 39, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3723, 33, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3724, 34, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3725, 35, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3726, 36, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3727, 37, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3728, 38, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3729, 40, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3730, 41, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3731, 42, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3732, 43, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3733, 44, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3734, 45, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3735, 46, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3736, 47, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3737, 48, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3738, 49, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3739, 50, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3740, 51, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3741, 52, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3742, 53, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3743, 54, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3744, 55, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3745, 56, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
(3746, 57, 39, '2022-03-03 09:22:48', '2022-03-03 09:22:48'),
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
(3762, 100, 40, '2022-03-03 09:24:10', '2022-03-03 09:24:10'),
(3763, 101, 40, '2022-03-03 09:24:10', '2022-03-03 09:24:10'),
(3764, 102, 40, '2022-03-03 09:24:10', '2022-03-03 09:24:10'),
(3765, 103, 40, '2022-03-03 09:24:10', '2022-03-03 09:24:10'),
(3766, 104, 40, '2022-03-03 09:24:10', '2022-03-03 09:24:10'),
(3767, 105, 40, '2022-03-03 09:24:10', '2022-03-03 09:24:10'),
(3768, 106, 40, '2022-03-03 09:24:10', '2022-03-03 09:24:10'),
(3769, 107, 40, '2022-03-03 09:24:10', '2022-03-03 09:24:10'),
(3770, 566, 40, '2022-03-03 09:24:10', '2022-03-03 09:24:10'),
(3771, 567, 40, '2022-03-03 09:24:10', '2022-03-03 09:24:10'),
(3772, 109, 40, '2022-03-03 09:24:10', '2022-03-03 09:24:10'),
(3773, 110, 40, '2022-03-03 09:24:10', '2022-03-03 09:24:10'),
(3774, 111, 40, '2022-03-03 09:24:10', '2022-03-03 09:24:10'),
(3775, 112, 40, '2022-03-03 09:24:10', '2022-03-03 09:24:10'),
(3776, 113, 40, '2022-03-03 09:24:10', '2022-03-03 09:24:10'),
(3777, 114, 40, '2022-03-03 09:24:10', '2022-03-03 09:24:10'),
(3778, 115, 40, '2022-03-03 09:24:10', '2022-03-03 09:24:10'),
(3779, 354, 40, '2022-03-03 09:24:10', '2022-03-03 09:24:10'),
(3780, 355, 40, '2022-03-03 09:24:10', '2022-03-03 09:24:10'),
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
(3877, 547, 43, '2022-03-03 09:38:39', '2022-03-03 09:38:39'),
(3878, 548, 43, '2022-03-03 09:38:39', '2022-03-03 09:38:39'),
(3879, 549, 43, '2022-03-03 09:38:39', '2022-03-03 09:38:39'),
(3880, 550, 43, '2022-03-03 09:38:39', '2022-03-03 09:38:39'),
(3881, 551, 43, '2022-03-03 09:38:39', '2022-03-03 09:38:39'),
(3882, 552, 43, '2022-03-03 09:38:39', '2022-03-03 09:38:39'),
(3884, 562, 43, '2022-03-03 09:38:39', '2022-03-03 09:38:39'),
(3885, 563, 43, '2022-03-03 09:38:39', '2022-03-03 09:38:39'),
(3886, 152, 43, '2022-03-03 09:38:39', '2022-03-03 09:38:39'),
(3887, 153, 43, '2022-03-03 09:38:39', '2022-03-03 09:38:39'),
(3888, 154, 43, '2022-03-03 09:38:39', '2022-03-03 09:38:39'),
(3889, 155, 43, '2022-03-03 09:38:39', '2022-03-03 09:38:39'),
(3890, 156, 43, '2022-03-03 09:38:39', '2022-03-03 09:38:39'),
(3891, 553, 43, '2022-03-03 09:38:39', '2022-03-03 09:38:39'),
(3892, 554, 43, '2022-03-03 09:38:39', '2022-03-03 09:38:39'),
(3893, 555, 43, '2022-03-03 09:38:39', '2022-03-03 09:38:39'),
(3894, 556, 43, '2022-03-03 09:38:39', '2022-03-03 09:38:39'),
(3895, 251, 43, '2022-03-03 09:38:39', '2022-03-03 09:38:39'),
(3896, 252, 43, '2022-03-03 09:38:39', '2022-03-03 09:38:39'),
(3897, 253, 43, '2022-03-03 09:38:39', '2022-03-03 09:38:39'),
(3898, 254, 43, '2022-03-03 09:38:39', '2022-03-03 09:38:39'),
(3899, 255, 43, '2022-03-03 09:38:39', '2022-03-03 09:38:39'),
(3900, 256, 43, '2022-03-03 09:38:39', '2022-03-03 09:38:39'),
(3901, 257, 43, '2022-03-03 09:38:39', '2022-03-03 09:38:39'),
(3902, 561, 43, '2022-03-03 09:38:39', '2022-03-03 09:38:39'),
(3903, 124, 43, '2022-03-03 17:10:52', '2022-03-03 17:10:52'),
(3904, 130, 43, '2022-03-03 17:10:52', '2022-03-03 17:10:52'),
(3905, 542, 43, '2022-03-03 17:10:52', '2022-03-03 17:10:52'),
(3906, 543, 43, '2022-03-03 17:10:52', '2022-03-03 17:10:52'),
(3907, 546, 43, '2022-03-03 17:10:52', '2022-03-03 17:10:52'),
(3908, 131, 43, '2022-03-03 17:10:52', '2022-03-03 17:10:52'),
(3909, 132, 43, '2022-03-03 17:10:52', '2022-03-03 17:10:52'),
(3910, 133, 43, '2022-03-03 17:10:52', '2022-03-03 17:10:52'),
(3911, 134, 43, '2022-03-03 17:10:52', '2022-03-03 17:10:52'),
(3912, 139, 43, '2022-03-03 17:10:52', '2022-03-03 17:10:52'),
(3913, 477, 43, '2022-03-03 17:10:52', '2022-03-03 17:10:52'),
(3914, 478, 43, '2022-03-03 17:10:52', '2022-03-03 17:10:52'),
(3915, 479, 43, '2022-03-03 17:10:52', '2022-03-03 17:10:52'),
(3916, 190, 43, '2022-03-03 17:10:52', '2022-03-03 17:10:52'),
(3917, 191, 43, '2022-03-03 17:10:52', '2022-03-03 17:10:52'),
(3918, 192, 43, '2022-03-03 17:10:52', '2022-03-03 17:10:52'),
(3919, 193, 43, '2022-03-03 17:10:52', '2022-03-03 17:10:52'),
(3920, 194, 43, '2022-03-03 17:10:52', '2022-03-03 17:10:52'),
(3921, 195, 43, '2022-03-03 17:10:52', '2022-03-03 17:10:52'),
(3922, 196, 43, '2022-03-03 17:10:52', '2022-03-03 17:10:52'),
(3923, 197, 43, '2022-03-03 17:10:52', '2022-03-03 17:10:52'),
(3924, 198, 43, '2022-03-03 17:10:52', '2022-03-03 17:10:52'),
(3925, 199, 43, '2022-03-03 17:10:52', '2022-03-03 17:10:52'),
(3926, 200, 43, '2022-03-03 17:10:52', '2022-03-03 17:10:52'),
(3927, 201, 43, '2022-03-03 17:10:52', '2022-03-03 17:10:52'),
(3928, 202, 43, '2022-03-03 17:10:52', '2022-03-03 17:10:52'),
(3929, 203, 43, '2022-03-03 17:10:52', '2022-03-03 17:10:52'),
(3932, 454, 43, '2022-03-03 17:10:52', '2022-03-03 17:10:52'),
(3933, 455, 43, '2022-03-03 17:10:52', '2022-03-03 17:10:52'),
(3935, 457, 43, '2022-03-03 17:10:52', '2022-03-03 17:10:52'),
(3936, 458, 43, '2022-03-03 17:10:52', '2022-03-03 17:10:52'),
(3937, 459, 43, '2022-03-03 17:10:52', '2022-03-03 17:10:52'),
(3938, 557, 43, '2022-03-03 17:10:52', '2022-03-03 17:10:52'),
(3942, 465, 43, '2022-03-03 17:10:52', '2022-03-03 17:10:52'),
(3946, 468, 43, '2022-03-03 17:10:52', '2022-03-03 17:10:52'),
(3947, 558, 43, '2022-03-03 17:10:52', '2022-03-03 17:10:52'),
(3950, 580, 40, '2022-03-23 10:06:05', '2022-03-23 10:06:05'),
(3951, 582, 40, '2022-03-23 10:06:05', '2022-03-23 10:06:05'),
(3952, 583, 40, '2022-03-23 10:06:05', '2022-03-23 10:06:05'),
(3953, 641, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(3954, 623, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(3955, 624, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(3956, 625, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(3957, 626, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(3958, 627, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(3959, 628, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(3960, 629, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(3961, 630, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(3962, 631, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
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
(3978, 642, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(3979, 643, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(3980, 644, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(3981, 645, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(3982, 646, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(3983, 647, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(3984, 648, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(3985, 649, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(3986, 650, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(3987, 651, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(3988, 453, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(3989, 576, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(3990, 577, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(3991, 578, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(3992, 579, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(3993, 613, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(3994, 614, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(3995, 615, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(3996, 616, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(3997, 617, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(3998, 618, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(3999, 619, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(4000, 620, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(4001, 621, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(4002, 622, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(4003, 598, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(4004, 599, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(4005, 600, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(4006, 601, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(4007, 602, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(4008, 608, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(4009, 609, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(4010, 610, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(4011, 611, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(4012, 612, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(4013, 603, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(4014, 604, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(4015, 605, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
(4016, 606, 2, '2022-10-29 13:29:20', '2022-10-29 13:29:20'),
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
(4035, 560, 45, '2022-11-26 16:24:26', '2022-11-26 16:24:26');
INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`, `created_at`, `updated_at`) VALUES
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
(4237, 662, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(4238, 663, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(4239, 664, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(4240, 665, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(4241, 666, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(4242, 667, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(4243, 668, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(4244, 669, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(4245, 670, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(4246, 671, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(4247, 672, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(4248, 673, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(4249, 674, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(4250, 675, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(4251, 676, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(4252, 677, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(4253, 678, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(4254, 679, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(4255, 680, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(4256, 681, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(4257, 682, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(4258, 683, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(4259, 684, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(4260, 685, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(4261, 686, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(4262, 687, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(4263, 688, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(4264, 689, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(4265, 690, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(4266, 691, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(4267, 692, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(4268, 693, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(4269, 694, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(4270, 695, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(4271, 696, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(4272, 697, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(4273, 698, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(4274, 699, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
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
(4294, 719, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(4295, 720, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(4296, 721, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(4297, 722, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(4298, 723, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(4299, 724, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(4300, 725, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(4301, 726, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(4302, 727, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(4303, 728, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(4304, 729, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(4305, 730, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(4306, 731, 2, '2022-11-27 14:37:49', '2022-11-27 14:37:49'),
(4307, 652, 2, '2022-11-28 10:46:40', '2022-11-28 10:46:40'),
(4308, 653, 2, '2022-11-28 10:46:40', '2022-11-28 10:46:40'),
(4309, 654, 2, '2022-11-28 10:46:40', '2022-11-28 10:46:40'),
(4310, 655, 2, '2022-11-28 10:46:40', '2022-11-28 10:46:40'),
(4311, 656, 2, '2022-11-28 10:46:40', '2022-11-28 10:46:40'),
(4312, 657, 2, '2022-11-28 10:46:40', '2022-11-28 10:46:40'),
(4313, 658, 2, '2022-11-28 10:46:40', '2022-11-28 10:46:40'),
(4314, 659, 2, '2022-11-28 10:46:40', '2022-11-28 10:46:40'),
(4315, 660, 2, '2022-11-28 10:46:40', '2022-11-28 10:46:40'),
(4316, 661, 2, '2022-11-28 10:46:40', '2022-11-28 10:46:40'),
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
(4425, 1, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(4426, 58, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(4427, 59, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(4428, 60, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(4429, 61, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(4430, 62, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(4431, 63, 43, '2022-11-28 11:05:45', '2022-11-28 11:05:45'),
(4432, 64, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4433, 65, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4434, 66, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4435, 67, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4436, 68, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4437, 69, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4438, 70, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4439, 71, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4440, 564, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4441, 565, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4442, 73, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4443, 74, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4444, 75, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4445, 76, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4446, 77, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4447, 78, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4448, 79, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4449, 572, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4450, 573, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4451, 574, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4452, 575, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4453, 641, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4454, 80, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4455, 81, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4456, 82, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4457, 83, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4458, 84, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4459, 85, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4460, 92, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4461, 93, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4462, 94, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4463, 95, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4464, 96, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4465, 97, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4466, 98, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4467, 107, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4468, 566, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4469, 567, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4470, 99, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4471, 109, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4472, 110, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4473, 111, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4474, 112, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4475, 113, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4476, 114, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4477, 115, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4478, 354, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4479, 355, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4480, 364, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4481, 623, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4482, 624, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4483, 625, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4484, 626, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4485, 627, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4486, 628, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4487, 629, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4488, 630, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4489, 631, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4490, 580, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4491, 581, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4492, 582, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4493, 583, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4494, 584, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4495, 585, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4496, 140, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4497, 141, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4498, 142, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4499, 143, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4500, 144, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4501, 145, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4502, 146, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4503, 147, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4504, 148, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4505, 356, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4506, 357, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4507, 358, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4508, 359, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4509, 360, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4510, 160, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4511, 161, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4512, 162, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4513, 163, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4514, 164, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4515, 560, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4516, 638, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4517, 639, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4518, 640, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4519, 165, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4520, 635, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4521, 636, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4522, 637, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4523, 166, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4524, 632, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4525, 633, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4526, 634, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4527, 475, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4528, 544, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4529, 568, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4530, 569, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4531, 476, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4532, 545, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4533, 570, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4534, 571, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4535, 170, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4536, 171, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4537, 172, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4538, 173, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4539, 174, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4540, 175, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4541, 176, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4542, 177, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4543, 178, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4544, 179, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4545, 180, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4546, 181, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4547, 182, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4548, 183, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4549, 184, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4550, 185, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4551, 186, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4552, 187, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4553, 188, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4554, 189, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4555, 540, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4556, 652, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4557, 653, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4558, 654, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4559, 655, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4560, 656, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4561, 657, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4562, 658, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4563, 659, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4564, 660, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4565, 661, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4566, 662, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4567, 663, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4568, 664, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4569, 665, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4570, 666, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4571, 667, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4572, 668, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4573, 669, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4574, 670, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4575, 671, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4576, 672, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4577, 673, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4578, 674, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4579, 675, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4580, 676, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4581, 677, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4582, 678, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4583, 679, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4584, 680, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4585, 681, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4586, 682, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4587, 683, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4588, 684, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4589, 685, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4590, 686, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4591, 687, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4592, 688, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4593, 689, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4594, 690, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4595, 691, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4596, 692, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4597, 693, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4598, 694, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4599, 695, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4600, 696, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4601, 697, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4602, 698, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4603, 699, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4604, 700, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4605, 701, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4606, 702, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4607, 703, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4608, 704, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4609, 705, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4610, 706, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4611, 707, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4612, 708, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4613, 709, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4614, 710, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4615, 711, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4616, 712, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4617, 713, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4618, 714, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4619, 715, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4620, 716, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4621, 717, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4622, 718, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4623, 719, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4624, 720, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4625, 721, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4626, 722, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4627, 723, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4628, 724, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4629, 725, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4630, 726, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4631, 727, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4632, 728, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4633, 729, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4634, 730, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4635, 731, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4636, 642, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4637, 643, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4638, 644, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4639, 645, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4640, 646, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4641, 647, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4642, 648, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4643, 649, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4644, 650, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4645, 651, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4646, 204, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4647, 205, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4648, 206, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4649, 207, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4650, 208, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4651, 209, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4652, 210, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4653, 211, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4654, 212, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4655, 213, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4656, 214, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4657, 215, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4658, 216, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4659, 217, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4660, 218, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4661, 453, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4662, 576, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4663, 577, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4664, 578, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4665, 579, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4666, 219, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4667, 220, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4668, 221, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4669, 222, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4670, 223, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4671, 224, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4672, 225, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4673, 226, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4674, 227, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4675, 228, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4676, 229, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4677, 230, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4678, 237, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4679, 238, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4680, 239, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4681, 240, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4682, 241, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4683, 242, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4684, 613, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4685, 614, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4686, 615, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4687, 616, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4688, 617, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4689, 618, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4690, 619, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4691, 620, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4692, 621, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4693, 622, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4694, 598, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4695, 599, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4696, 600, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4697, 601, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4698, 602, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4699, 608, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4700, 609, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4701, 610, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4702, 611, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4703, 612, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4704, 603, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4705, 604, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4706, 605, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4707, 606, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4708, 586, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4709, 587, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4710, 588, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4711, 589, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4712, 590, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4713, 591, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4714, 592, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4715, 593, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4716, 594, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4717, 595, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4718, 596, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
(4719, 597, 43, '2022-11-28 11:05:46', '2022-11-28 11:05:46'),
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
(4880, 99, 47, '2022-12-12 12:18:23', '2022-12-12 12:18:23');

-- --------------------------------------------------------

--
-- Table structure for table `productions`
--

CREATE TABLE `productions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `batch_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED NOT NULL,
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
(1, '1001', 1, '2022-12-01', '2022-12-01', '1', '1', '3', 'Admin', 'Admin', '2022-12-01 13:54:34', '2022-12-01 14:29:53'),
(2, '1002', 1, '2022-12-01', '2022-12-01', '1', '1', '3', 'Admin', 'Admin', '2022-12-01 15:55:16', '2022-12-01 16:13:07'),
(3, '1003', 1, '2022-12-01', '2022-12-01', '2', '1', '3', 'Admin', 'Admin', '2022-12-01 15:56:38', '2022-12-01 16:17:12'),
(4, '1004', 1, '2022-12-01', '2022-12-01', '4', '1', '3', 'Admin', 'Admin', '2022-12-01 16:09:46', '2022-12-01 16:28:13'),
(5, '1005', 1, '2022-12-05', '2022-12-06', '3', '1', '3', 'Admin', 'Admin', '2022-12-05 13:51:56', '2022-12-06 00:00:00'),
(6, '1006', 1, '2022-12-05', '2022-12-06', '4', '1', '3', 'Admin', 'Admin', '2022-12-05 13:54:31', '2022-12-06 00:00:00'),
(7, '1007', 1, '2022-12-07', '2022-12-07', '6', '1', '3', 'Admin', 'Admin', '2022-12-07 16:17:26', '2022-12-07 16:27:32'),
(8, '1008', 1, '2022-12-12', '2022-12-12', '7', '1', '3', 'Admin', 'Admin', '2022-12-12 10:24:15', '2022-12-12 10:41:42'),
(9, '1009', 1, '2022-12-12', '2022-12-12', '4', '1', '3', 'Admin', 'Admin', '2022-12-12 10:58:07', '2022-12-12 11:04:42');

-- --------------------------------------------------------

--
-- Table structure for table `production_products`
--

CREATE TABLE `production_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `production_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `year` int(11) NOT NULL,
  `mfg_date` date NOT NULL,
  `exp_date` date NOT NULL,
  `labor_cost` bigint(20) DEFAULT NULL,
  `other_cost` bigint(20) DEFAULT NULL,
  `base_unit_qty` double DEFAULT NULL,
  `per_unit_cost` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `production_products`
--

INSERT INTO `production_products` (`id`, `production_id`, `product_id`, `year`, `mfg_date`, `exp_date`, `labor_cost`, `other_cost`, `base_unit_qty`, `per_unit_cost`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '2022-12-01', '2023-12-01', 3200, 15784, 6339, 20.8, '2022-12-01 13:54:34', '2022-12-01 14:28:16'),
(2, 2, 2, 1, '2022-12-01', '2023-12-01', 1590, 12220, 2530, 55.83, '2022-12-01 15:55:16', '2022-12-01 16:12:57'),
(3, 3, 3, 1, '2022-12-01', '2023-12-01', 566, 5992, 905, 103.5, '2022-12-01 15:56:38', '2022-12-01 16:17:07'),
(4, 3, 4, 1, '2022-12-01', '2023-12-01', 1277, 9712, 982, 199.56, '2022-12-01 15:56:38', '2022-12-01 16:17:07'),
(5, 4, 5, 1, '2022-12-01', '2023-12-01', 99, 495, 33, 388.01, '2022-12-01 16:09:46', '2022-12-01 16:28:08'),
(6, 4, 6, 1, '2022-12-01', '2023-12-01', 950, 5499, 190, 960, '2022-12-01 16:09:46', '2022-12-01 16:28:08'),
(7, 4, 7, 1, '2022-12-01', '2023-12-01', NULL, 496, 16, 1680, '2022-12-01 16:09:46', '2022-12-01 16:28:08'),
(8, 4, 8, 1, '2022-12-01', '2023-12-01', NULL, 14400, 240, 3333, '2022-12-01 16:09:46', '2022-12-01 16:28:08'),
(9, 5, 30, 1, '2022-12-05', '2023-12-05', 1286, 14784, 3214, 109.75, '2022-12-05 13:51:56', '2022-12-06 12:46:25'),
(10, 5, 31, 1, '2022-12-05', '2023-12-05', 246, 721, 307, 31.5, '2022-12-05 13:51:56', '2022-12-06 12:46:25'),
(11, 5, 32, 1, '2022-12-05', '2023-12-05', 229, 738, 305, 48, '2022-12-05 13:51:56', '2022-12-06 12:46:25'),
(12, 6, 33, 1, '2022-12-05', '2023-12-05', 89, 524, 118, 28.93, '2022-12-05 13:54:31', '2022-12-06 12:54:25'),
(13, 6, 34, 1, '2022-12-05', '2023-12-05', 53, 218, 71, 25.81, '2022-12-05 13:54:31', '2022-12-06 12:54:25'),
(14, 6, 35, 1, '2022-12-05', '2023-12-05', 76, 453, 101, 27.83, '2022-12-05 13:54:31', '2022-12-06 12:54:25'),
(15, 6, 36, 1, '2022-12-05', '2023-12-05', 62, 335, 82, 43.82, '2022-12-05 13:54:31', '2022-12-06 12:54:25'),
(16, 7, 30, 1, '2022-12-07', '2023-12-07', 2078, 23902, 5196, 109.75, '2022-12-07 16:17:26', '2022-12-07 16:27:22'),
(17, 7, 5, 1, '2022-12-07', '2023-12-07', 720, 3586, 240, 393, '2022-12-07 16:17:26', '2022-12-07 16:27:22'),
(18, 7, 6, 1, '2022-12-07', '2023-12-07', 1200, 6672, 240, 971, '2022-12-07 16:17:26', '2022-12-07 16:27:22'),
(19, 7, 38, 1, '2022-12-07', '2023-12-07', 250, 1718, 500, 31.15, '2022-12-07 16:17:26', '2022-12-07 16:27:22'),
(20, 7, 7, 1, '2022-12-07', '2023-12-07', NULL, NULL, 15, 1665, '2022-12-07 16:17:26', '2022-12-07 16:27:22'),
(21, 7, 37, 1, '2022-12-07', '2023-12-07', NULL, 70, 1, 6700, '2022-12-07 16:17:26', '2022-12-07 16:27:22'),
(22, 8, 1, 1, '2022-12-12', '2023-12-12', NULL, 1848, 660, 20.8, '2022-12-12 10:24:15', '2022-12-12 10:41:36'),
(23, 8, 2, 1, '2022-12-12', '2023-12-12', NULL, 1817, 377, 55.83, '2022-12-12 10:24:15', '2022-12-12 10:41:36'),
(24, 8, 3, 1, '2022-12-12', '2023-12-12', NULL, 900, 153, 103.5, '2022-12-12 10:24:15', '2022-12-12 10:41:36'),
(25, 8, 4, 1, '2022-12-12', '2023-12-12', NULL, 303, 35, 199.56, '2022-12-12 10:24:15', '2022-12-12 10:41:36'),
(26, 8, 5, 1, '2022-12-12', '2023-12-12', NULL, 311, 24, 388.01, '2022-12-12 10:24:15', '2022-12-12 10:41:36'),
(27, 8, 6, 1, '2022-12-12', '2023-12-12', NULL, 230, 11, 960, '2022-12-12 10:24:15', '2022-12-12 10:41:36'),
(28, 8, 8, 1, '2022-12-12', '2023-12-12', NULL, 84, 3, 3333, '2022-12-12 10:24:15', '2022-12-12 10:41:36'),
(29, 9, 30, 1, '2022-12-12', '2023-12-12', NULL, 361, 73, 109.75, '2022-12-12 10:58:07', '2022-12-12 11:04:36'),
(30, 9, 32, 1, '2022-12-12', '2023-12-12', NULL, 565, 154, 48, '2022-12-12 10:58:07', '2022-12-12 11:04:36'),
(31, 9, 35, 1, '2022-12-12', '2023-12-12', NULL, 67, 14, 27.83, '2022-12-12 10:58:07', '2022-12-12 11:04:36'),
(32, 9, 34, 1, '2022-12-12', '2023-12-12', NULL, 184, 48, 25.81, '2022-12-12 10:58:07', '2022-12-12 11:04:36');

-- --------------------------------------------------------

--
-- Table structure for table `production_product_materials`
--

CREATE TABLE `production_product_materials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `production_product_id` bigint(20) UNSIGNED NOT NULL,
  `material_id` bigint(20) UNSIGNED NOT NULL,
  `unit_id` bigint(20) UNSIGNED NOT NULL,
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
(1, 1, 91, 10, 3590.12, 175.00, 628271.00, 507.12, 0.00, 3083.00, '2022-12-01 13:54:34', '2022-12-01 14:28:16'),
(2, 1, 96, 1, 6339.00, 0.13, 824.07, 6339.00, 0.00, 0.00, '2022-12-01 13:54:34', '2022-12-01 14:28:16'),
(3, 1, 95, 1, 6339.00, 2.70, 17115.30, 6339.00, 0.00, 0.00, '2022-12-01 13:54:34', '2022-12-01 14:28:16'),
(4, 1, 98, 1, 6339.00, 0.50, 3169.50, 6339.00, 0.00, 0.00, '2022-12-01 13:54:34', '2022-12-01 14:28:16'),
(5, 1, 93, 1, 6339.00, 0.16, 1014.24, 6339.00, 0.00, 0.00, '2022-12-01 13:54:34', '2022-12-01 14:28:16'),
(6, 1, 97, 1, 6339.00, 15.00, 95085.00, 133.00, 0.00, 6206.00, '2022-12-01 13:54:34', '2022-12-01 14:28:16'),
(7, 2, 91, 10, 632.50, 175.00, 110687.50, 632.50, 0.00, 0.00, '2022-12-01 15:55:16', '2022-12-01 16:12:57'),
(8, 2, 99, 1, 2530.00, 0.50, 1265.00, 2530.00, 0.00, 0.00, '2022-12-01 15:55:16', '2022-12-01 16:12:57'),
(9, 2, 101, 1, 2530.00, 4.00, 10120.00, 2530.00, 0.00, 0.00, '2022-12-01 15:55:16', '2022-12-01 16:12:57'),
(10, 2, 98, 1, 2530.00, 0.50, 1265.00, 2530.00, 0.00, 0.00, '2022-12-01 15:55:16', '2022-12-01 16:12:57'),
(11, 2, 93, 1, 2530.00, 0.16, 404.80, 2530.00, 0.00, 0.00, '2022-12-01 15:55:16', '2022-12-01 16:12:57'),
(12, 2, 100, 1, 106.00, 35.00, 3710.00, 106.00, 0.00, 0.00, '2022-12-01 15:55:16', '2022-12-01 16:12:57'),
(13, 3, 91, 10, 452.50, 175.00, 79187.50, 452.50, 0.00, 0.00, '2022-12-01 15:56:38', '2022-12-01 16:17:07'),
(14, 3, 102, 1, 905.00, 0.50, 452.50, 905.00, 0.00, 0.00, '2022-12-01 15:56:38', '2022-12-01 16:17:07'),
(15, 3, 104, 1, 905.00, 6.00, 5430.00, 905.00, 0.00, 0.00, '2022-12-01 15:56:38', '2022-12-01 16:17:07'),
(16, 3, 98, 1, 905.00, 0.50, 452.50, 905.00, 0.00, 0.00, '2022-12-01 15:56:38', '2022-12-01 16:17:07'),
(17, 3, 93, 1, 905.00, 0.16, 144.80, 905.00, 0.00, 0.00, '2022-12-01 15:56:38', '2022-12-01 16:17:07'),
(18, 3, 103, 1, 38.00, 38.00, 1444.00, 38.00, 0.00, 0.00, '2022-12-01 15:56:38', '2022-12-01 16:17:07'),
(19, 4, 91, 10, 982.00, 175.00, 171850.00, 982.00, 0.00, 0.00, '2022-12-01 15:56:38', '2022-12-01 16:17:07'),
(20, 4, 107, 1, 982.00, 0.70, 687.40, 982.00, 0.00, 0.00, '2022-12-01 15:56:38', '2022-12-01 16:17:07'),
(21, 4, 106, 1, 982.00, 9.00, 8838.00, 982.00, 0.00, 0.00, '2022-12-01 15:56:38', '2022-12-01 16:17:07'),
(22, 4, 98, 1, 982.00, 0.50, 491.00, 982.00, 0.00, 0.00, '2022-12-01 15:56:38', '2022-12-01 16:17:07'),
(23, 4, 93, 1, 982.00, 0.16, 157.12, 982.00, 0.00, 0.00, '2022-12-01 15:56:38', '2022-12-01 16:17:07'),
(24, 4, 105, 1, 82.00, 36.00, 2952.00, 82.00, 0.00, 0.00, '2022-12-01 15:56:38', '2022-12-01 16:17:07'),
(25, 5, 91, 10, 66.00, 175.00, 11550.00, 66.00, 0.00, 0.00, '2022-12-01 16:09:46', '2022-12-01 16:28:08'),
(26, 5, 108, 1, 33.00, 1.50, 49.50, 33.00, 0.00, 0.00, '2022-12-01 16:09:46', '2022-12-01 16:28:08'),
(27, 5, 109, 1, 33.00, 13.00, 429.00, 33.00, 0.00, 0.00, '2022-12-01 16:09:46', '2022-12-01 16:28:08'),
(28, 5, 98, 1, 33.00, 0.50, 16.50, 33.00, 0.00, 0.00, '2022-12-01 16:09:46', '2022-12-01 16:28:08'),
(29, 5, 93, 1, 33.00, 0.16, 5.28, 33.00, 0.00, 0.00, '2022-12-01 16:09:46', '2022-12-01 16:28:08'),
(30, 5, 110, 1, 4.00, 40.00, 160.00, 4.00, 0.00, 0.00, '2022-12-01 16:09:46', '2022-12-01 16:28:08'),
(31, 6, 91, 10, 950.00, 175.00, 166250.00, 950.00, 0.00, 0.00, '2022-12-01 16:09:46', '2022-12-01 16:28:08'),
(32, 6, 111, 1, 190.00, 2.75, 522.50, 190.00, 0.00, 0.00, '2022-12-01 16:09:46', '2022-12-01 16:28:08'),
(33, 6, 112, 1, 190.00, 36.00, 6840.00, 190.00, 0.00, 0.00, '2022-12-01 16:09:46', '2022-12-01 16:28:08'),
(34, 6, 117, 1, 190.00, 0.20, 38.00, 190.00, 0.00, 0.00, '2022-12-01 16:09:46', '2022-12-01 16:28:08'),
(35, 6, 115, 1, 48.00, 40.00, 1920.00, 48.00, 0.00, 0.00, '2022-12-01 16:09:46', '2022-12-01 16:28:08'),
(36, 6, 123, 1, 190.00, 2.00, 380.00, 190.00, 0.00, 0.00, '2022-12-01 16:09:46', '2022-12-01 16:28:08'),
(37, 7, 92, 2, 128.00, 193.00, 24704.00, 128.00, 0.00, 0.00, '2022-12-01 16:09:46', '2022-12-01 16:28:08'),
(38, 7, 118, 1, 16.00, 100.00, 1600.00, 16.00, 0.00, 0.00, '2022-12-01 16:09:46', '2022-12-01 16:28:08'),
(39, 7, 120, 1, 16.00, 5.00, 80.00, 16.00, 0.00, 0.00, '2022-12-01 16:09:46', '2022-12-01 16:28:08'),
(40, 8, 92, 2, 3840.00, 193.00, 741120.00, 3840.00, 0.00, 0.00, '2022-12-01 16:09:46', '2022-12-01 16:28:08'),
(41, 8, 121, 1, 240.00, 180.00, 43200.00, 240.00, 0.00, 0.00, '2022-12-01 16:09:46', '2022-12-01 16:28:08'),
(42, 8, 122, 1, 240.00, 5.00, 1200.00, 240.00, 0.00, 0.00, '2022-12-01 16:09:46', '2022-12-01 16:28:08'),
(43, 9, 124, 2, 3214.00, 100.00, 321400.00, 3214.00, 0.00, 0.00, '2022-12-05 13:51:56', '2022-12-06 12:46:25'),
(44, 9, 125, 1, 3214.00, 4.25, 13659.50, 3214.00, 0.00, 0.00, '2022-12-05 13:51:56', '2022-12-06 12:46:25'),
(45, 9, 126, 1, 80.00, 20.00, 1600.00, 80.00, 0.00, 0.00, '2022-12-05 13:51:56', '2022-12-06 12:46:25'),
(46, 10, 127, 2, 61.40, 116.00, 7122.40, 61.40, 0.00, 0.00, '2022-12-05 13:51:56', '2022-12-06 12:46:25'),
(47, 10, 129, 1, 307.00, 4.60, 1412.20, 307.00, 0.00, 0.00, '2022-12-05 13:51:56', '2022-12-06 12:46:25'),
(48, 10, 130, 1, 13.00, 13.00, 169.00, 13.00, 0.00, 0.00, '2022-12-05 13:51:56', '2022-12-06 12:46:25'),
(49, 11, 131, 2, 152.50, 72.50, 11056.25, 152.50, 0.00, 0.00, '2022-12-05 13:51:56', '2022-12-06 12:46:25'),
(50, 11, 132, 1, 305.00, 7.50, 2287.50, 305.00, 0.00, 0.00, '2022-12-05 13:51:56', '2022-12-06 12:46:25'),
(51, 11, 133, 1, 22.00, 15.00, 330.00, 22.00, 0.00, 0.00, '2022-12-05 13:51:56', '2022-12-06 12:46:25'),
(52, 12, 134, 2, 4.72, 402.50, 1899.80, 4.72, 0.00, 0.00, '2022-12-05 13:54:31', '2022-12-06 12:54:25'),
(53, 12, 136, 1, 118.00, 5.45, 643.10, 118.00, 0.00, 0.00, '2022-12-05 13:54:31', '2022-12-06 12:54:25'),
(54, 12, 146, 1, 118.00, 1.55, 182.90, 118.00, 0.00, 0.00, '2022-12-05 13:54:31', '2022-12-06 12:54:25'),
(55, 12, 148, 1, 5.00, 15.00, 75.00, 5.00, 0.00, 0.00, '2022-12-05 13:54:31', '2022-12-06 12:54:25'),
(56, 13, 137, 2, 2.84, 359.00, 1019.56, 2.84, 0.00, 0.00, '2022-12-05 13:54:31', '2022-12-06 12:54:25'),
(57, 13, 138, 1, 71.00, 5.45, 386.95, 71.00, 0.00, 0.00, '2022-12-05 13:54:31', '2022-12-06 12:54:25'),
(58, 13, 146, 1, 71.00, 1.55, 110.05, 71.00, 0.00, 0.00, '2022-12-05 13:54:31', '2022-12-06 12:54:25'),
(59, 13, 149, 1, 3.00, 15.00, 45.00, 3.00, 0.00, 0.00, '2022-12-05 13:54:31', '2022-12-06 12:54:25'),
(60, 14, 139, 2, 4.04, 375.00, 1515.00, 4.04, 0.00, 0.00, '2022-12-05 13:54:31', '2022-12-06 12:54:25'),
(61, 14, 140, 1, 101.00, 5.45, 550.45, 101.00, 0.00, 0.00, '2022-12-05 13:54:31', '2022-12-06 12:54:25'),
(62, 14, 146, 1, 101.00, 1.55, 156.55, 101.00, 0.00, 0.00, '2022-12-05 13:54:31', '2022-12-06 12:54:25'),
(63, 14, 150, 1, 4.00, 15.00, 60.00, 4.00, 0.00, 0.00, '2022-12-05 13:54:31', '2022-12-06 12:54:25'),
(64, 15, 141, 2, 16.40, 153.00, 2509.20, 16.40, 0.00, 0.00, '2022-12-05 13:54:31', '2022-12-06 12:54:25'),
(65, 15, 142, 1, 82.00, 6.35, 520.70, 82.00, 0.00, 0.00, '2022-12-05 13:54:31', '2022-12-06 12:54:25'),
(66, 15, 152, 1, 4.00, 18.00, 72.00, 4.00, 0.00, 0.00, '2022-12-05 13:54:31', '2022-12-06 12:54:25'),
(67, 15, 147, 1, 82.00, 1.15, 94.30, 82.00, 0.00, 0.00, '2022-12-05 13:54:31', '2022-12-06 12:54:25'),
(68, 16, 124, 2, 5196.00, 100.00, 519600.00, 5196.00, 0.00, 0.00, '2022-12-07 16:17:26', '2022-12-07 16:27:22'),
(69, 16, 125, 1, 5196.00, 4.25, 22083.00, 5196.00, 0.00, 0.00, '2022-12-07 16:17:26', '2022-12-07 16:27:22'),
(70, 16, 126, 1, 130.00, 20.00, 2600.00, 130.00, 0.00, 0.00, '2022-12-07 16:17:26', '2022-12-07 16:27:22'),
(71, 17, 91, 10, 480.00, 177.45, 85176.00, 480.00, 0.00, 0.00, '2022-12-07 16:17:26', '2022-12-07 16:27:22'),
(72, 17, 108, 1, 240.00, 1.50, 360.00, 240.00, 0.00, 0.00, '2022-12-07 16:17:26', '2022-12-07 16:27:22'),
(73, 17, 109, 1, 240.00, 13.00, 3120.00, 240.00, 0.00, 0.00, '2022-12-07 16:17:26', '2022-12-07 16:27:22'),
(74, 17, 98, 1, 240.00, 0.50, 120.00, 240.00, 0.00, 0.00, '2022-12-07 16:17:26', '2022-12-07 16:27:22'),
(75, 17, 93, 1, 240.00, 0.16, 38.40, 240.00, 0.00, 0.00, '2022-12-07 16:17:26', '2022-12-07 16:27:22'),
(76, 17, 110, 1, 30.00, 40.00, 1200.00, 30.00, 0.00, 0.00, '2022-12-07 16:17:26', '2022-12-07 16:27:22'),
(77, 18, 91, 10, 1200.00, 177.45, 212940.00, 1200.00, 0.00, 0.00, '2022-12-07 16:17:26', '2022-12-07 16:27:22'),
(78, 18, 111, 1, 240.00, 2.75, 660.00, 240.00, 0.00, 0.00, '2022-12-07 16:17:26', '2022-12-07 16:27:22'),
(79, 18, 112, 1, 240.00, 36.00, 8640.00, 240.00, 0.00, 0.00, '2022-12-07 16:17:26', '2022-12-07 16:27:22'),
(80, 18, 117, 1, 240.00, 0.20, 48.00, 240.00, 0.00, 0.00, '2022-12-07 16:17:26', '2022-12-07 16:27:22'),
(81, 18, 115, 1, 60.00, 40.00, 2400.00, 60.00, 0.00, 0.00, '2022-12-07 16:17:26', '2022-12-07 16:27:22'),
(82, 18, 123, 1, 240.00, 2.00, 480.00, 240.00, 0.00, 0.00, '2022-12-07 16:17:26', '2022-12-07 16:27:22'),
(83, 19, 127, 2, 90.00, 122.75, 11047.50, 90.00, 0.00, 0.00, '2022-12-07 16:17:26', '2022-12-07 16:27:22'),
(84, 19, 129, 1, 500.00, 4.60, 2300.00, 500.00, 0.00, 0.00, '2022-12-07 16:17:26', '2022-12-07 16:27:22'),
(85, 19, 130, 1, 20.00, 13.00, 260.00, 20.00, 0.00, 0.00, '2022-12-07 16:17:26', '2022-12-07 16:27:22'),
(86, 20, 92, 2, 120.00, 195.00, 23400.00, 120.00, 0.00, 0.00, '2022-12-07 16:17:26', '2022-12-07 16:27:22'),
(87, 20, 118, 1, 15.00, 100.00, 1500.00, 15.00, 0.00, 0.00, '2022-12-07 16:17:26', '2022-12-07 16:27:22'),
(88, 20, 120, 1, 15.00, 5.00, 75.00, 15.00, 0.00, 0.00, '2022-12-07 16:17:26', '2022-12-07 16:27:22'),
(89, 21, 92, 2, 34.00, 195.00, 6630.00, 34.00, 0.00, 0.00, '2022-12-07 16:17:26', '2022-12-07 16:27:22'),
(90, 22, 91, 10, 52.80, 177.45, 9369.36, 52.80, 0.00, 0.00, '2022-12-12 10:24:15', '2022-12-12 10:41:36'),
(91, 22, 96, 1, 660.00, 0.13, 85.80, 660.00, 0.00, 0.00, '2022-12-12 10:24:15', '2022-12-12 10:41:36'),
(92, 22, 95, 1, 660.00, 2.70, 1782.00, 660.00, 0.00, 0.00, '2022-12-12 10:24:15', '2022-12-12 10:41:36'),
(93, 22, 98, 1, 660.00, 0.50, 330.00, 660.00, 0.00, 0.00, '2022-12-12 10:24:15', '2022-12-12 10:41:36'),
(94, 22, 93, 1, 660.00, 0.16, 105.60, 660.00, 0.00, 0.00, '2022-12-12 10:24:15', '2022-12-12 10:41:36'),
(95, 22, 97, 1, 14.00, 15.00, 210.00, 14.00, 0.00, 0.00, '2022-12-12 10:24:15', '2022-12-12 10:41:36'),
(96, 23, 91, 10, 94.25, 177.45, 16724.66, 94.25, 0.00, 0.00, '2022-12-12 10:24:15', '2022-12-12 10:41:36'),
(97, 23, 99, 1, 377.00, 0.50, 188.50, 377.00, 0.00, 0.00, '2022-12-12 10:24:15', '2022-12-12 10:41:36'),
(98, 23, 101, 1, 377.00, 4.00, 1508.00, 377.00, 0.00, 0.00, '2022-12-12 10:24:15', '2022-12-12 10:41:36'),
(99, 23, 98, 1, 377.00, 0.50, 188.50, 377.00, 0.00, 0.00, '2022-12-12 10:24:15', '2022-12-12 10:41:36'),
(100, 23, 93, 1, 377.00, 0.16, 60.32, 377.00, 0.00, 0.00, '2022-12-12 10:24:15', '2022-12-12 10:41:36'),
(101, 23, 100, 1, 16.00, 35.00, 560.00, 16.00, 0.00, 0.00, '2022-12-12 10:24:15', '2022-12-12 10:41:36'),
(102, 24, 91, 10, 76.50, 177.45, 13574.92, 76.50, 0.00, 0.00, '2022-12-12 10:24:15', '2022-12-12 10:41:36'),
(103, 24, 102, 1, 153.00, 0.50, 76.50, 153.00, 0.00, 0.00, '2022-12-12 10:24:15', '2022-12-12 10:41:36'),
(104, 24, 104, 1, 153.00, 6.00, 918.00, 153.00, 0.00, 0.00, '2022-12-12 10:24:15', '2022-12-12 10:41:36'),
(105, 24, 98, 1, 153.00, 0.50, 76.50, 153.00, 0.00, 0.00, '2022-12-12 10:24:15', '2022-12-12 10:41:36'),
(106, 24, 93, 1, 153.00, 0.16, 24.48, 153.00, 0.00, 0.00, '2022-12-12 10:24:15', '2022-12-12 10:41:36'),
(107, 24, 103, 1, 7.00, 38.00, 266.00, 7.00, 0.00, 0.00, '2022-12-12 10:24:15', '2022-12-12 10:41:36'),
(108, 25, 91, 10, 35.00, 177.45, 6210.75, 35.00, 0.00, 0.00, '2022-12-12 10:24:15', '2022-12-12 10:41:36'),
(109, 25, 107, 1, 35.00, 0.70, 24.50, 35.00, 0.00, 0.00, '2022-12-12 10:24:15', '2022-12-12 10:41:36'),
(110, 25, 106, 1, 35.00, 9.00, 315.00, 35.00, 0.00, 0.00, '2022-12-12 10:24:15', '2022-12-12 10:41:36'),
(111, 25, 98, 1, 35.00, 0.50, 17.50, 35.00, 0.00, 0.00, '2022-12-12 10:24:15', '2022-12-12 10:41:36'),
(112, 25, 93, 1, 35.00, 0.16, 5.60, 35.00, 0.00, 0.00, '2022-12-12 10:24:15', '2022-12-12 10:41:36'),
(113, 25, 105, 1, 3.00, 36.00, 108.00, 3.00, 0.00, 0.00, '2022-12-12 10:24:15', '2022-12-12 10:41:36'),
(114, 26, 91, 10, 48.00, 177.45, 8517.60, 48.00, 0.00, 0.00, '2022-12-12 10:24:15', '2022-12-12 10:41:36'),
(115, 26, 108, 1, 24.00, 1.50, 36.00, 24.00, 0.00, 0.00, '2022-12-12 10:24:15', '2022-12-12 10:41:36'),
(116, 26, 109, 1, 24.00, 13.00, 312.00, 24.00, 0.00, 0.00, '2022-12-12 10:24:15', '2022-12-12 10:41:36'),
(117, 26, 98, 1, 24.00, 0.50, 12.00, 24.00, 0.00, 0.00, '2022-12-12 10:24:15', '2022-12-12 10:41:36'),
(118, 26, 93, 1, 24.00, 0.16, 3.84, 24.00, 0.00, 0.00, '2022-12-12 10:24:15', '2022-12-12 10:41:36'),
(119, 26, 110, 1, 3.00, 40.00, 120.00, 3.00, 0.00, 0.00, '2022-12-12 10:24:15', '2022-12-12 10:41:36'),
(120, 27, 91, 10, 55.00, 177.45, 9759.75, 55.00, 0.00, 0.00, '2022-12-12 10:24:15', '2022-12-12 10:41:36'),
(121, 27, 111, 1, 11.00, 2.75, 30.25, 11.00, 0.00, 0.00, '2022-12-12 10:24:15', '2022-12-12 10:41:36'),
(122, 27, 112, 1, 11.00, 36.00, 396.00, 11.00, 0.00, 0.00, '2022-12-12 10:24:15', '2022-12-12 10:41:36'),
(123, 27, 117, 1, 11.00, 0.20, 2.20, 11.00, 0.00, 0.00, '2022-12-12 10:24:15', '2022-12-12 10:41:36'),
(124, 27, 115, 1, 3.00, 40.00, 120.00, 3.00, 0.00, 0.00, '2022-12-12 10:24:15', '2022-12-12 10:41:36'),
(125, 27, 123, 1, 11.00, 2.00, 22.00, 11.00, 0.00, 0.00, '2022-12-12 10:24:15', '2022-12-12 10:41:36'),
(126, 28, 92, 2, 48.00, 195.00, 9360.00, 48.00, 0.00, 0.00, '2022-12-12 10:24:15', '2022-12-12 10:41:36'),
(127, 28, 121, 1, 3.00, 180.00, 540.00, 3.00, 0.00, 0.00, '2022-12-12 10:24:15', '2022-12-12 10:41:36'),
(128, 28, 122, 1, 3.00, 5.00, 15.00, 3.00, 0.00, 0.00, '2022-12-12 10:24:15', '2022-12-12 10:41:36'),
(129, 29, 124, 2, 73.00, 100.00, 7300.00, 73.00, 0.00, 0.00, '2022-12-12 10:58:07', '2022-12-12 11:04:36'),
(130, 29, 125, 1, 73.00, 4.25, 310.25, 73.00, 0.00, 0.00, '2022-12-12 10:58:07', '2022-12-12 11:04:36'),
(131, 29, 126, 1, 2.00, 20.00, 40.00, 2.00, 0.00, 0.00, '2022-12-12 10:58:07', '2022-12-12 11:04:36'),
(132, 30, 131, 2, 77.00, 72.50, 5582.50, 77.00, 0.00, 0.00, '2022-12-12 10:58:07', '2022-12-12 11:04:36'),
(133, 30, 132, 1, 154.00, 7.50, 1155.00, 154.00, 0.00, 0.00, '2022-12-12 10:58:07', '2022-12-12 11:04:36'),
(134, 30, 133, 1, 6.00, 15.00, 90.00, 6.00, 0.00, 0.00, '2022-12-12 10:58:07', '2022-12-12 11:04:36'),
(135, 31, 139, 2, 0.56, 375.00, 210.00, 0.56, 0.00, 0.00, '2022-12-12 10:58:07', '2022-12-12 11:04:36'),
(136, 31, 140, 1, 14.00, 5.45, 76.30, 14.00, 0.00, 0.00, '2022-12-12 10:58:07', '2022-12-12 11:04:36'),
(137, 31, 146, 1, 14.00, 1.55, 21.70, 14.00, 0.00, 0.00, '2022-12-12 10:58:07', '2022-12-12 11:04:36'),
(138, 31, 150, 1, 1.00, 15.00, 15.00, 1.00, 0.00, 0.00, '2022-12-12 10:58:07', '2022-12-12 11:04:36'),
(139, 32, 137, 2, 1.92, 359.00, 689.28, 1.92, 0.00, 0.00, '2022-12-12 10:58:07', '2022-12-12 11:04:36'),
(140, 32, 138, 1, 48.00, 5.45, 261.60, 48.00, 0.00, 0.00, '2022-12-12 10:58:07', '2022-12-12 11:04:36'),
(141, 32, 146, 1, 48.00, 1.55, 74.40, 48.00, 0.00, 0.00, '2022-12-12 10:58:07', '2022-12-12 11:04:36'),
(142, 32, 149, 1, 2.00, 15.00, 30.00, 2.00, 0.00, 0.00, '2022-12-12 10:58:07', '2022-12-12 11:04:36');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `barcode_symbology` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_unit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `unit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `cost` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Base Unit wise cost',
  `base_unit_price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Base Unit wise Price',
  `unit_price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Base Unit wise Price',
  `base_unit_qty` double DEFAULT NULL,
  `unit_qty` double DEFAULT NULL,
  `alert_quantity` double DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_id` bigint(20) UNSIGNED DEFAULT NULL,
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
(1, 'Mustard Oil 80ml', '8941154040240', 2, 'EAN13', 1, NULL, '20.8', '28', NULL, NULL, NULL, NULL, NULL, NULL, '2', '1', NULL, 'Admin', 'Sabbir Hossain (BABU)', '2022-11-28 13:09:09', '2022-12-12 11:32:05'),
(2, 'Mustard Oil 250ml', '8941154040158', 2, 'EAN13', 1, NULL, '55.83', '75', NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, 'Admin', 'Admin', '2022-11-28 14:46:43', '2022-12-01 16:13:07'),
(3, 'Mustard Oil 500ml', '8941154040271', 2, 'EAN13', 1, NULL, '103.5', '135', NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, 'Admin', 'Admin', '2022-11-28 14:48:46', '2022-12-01 16:17:12'),
(4, 'Mustard Oil 1L', '8941154040295', 2, 'EAN13', 1, NULL, '199.56', '240', NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, 'Admin', 'Admin', '2022-11-28 14:49:36', '2022-12-01 16:17:12'),
(5, 'Mustard Oil 2L', '8941154040660', 2, 'EAN13', 1, NULL, '388.01', '480', NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, 'Admin', 'Admin', '2022-11-28 14:50:43', '2022-12-12 10:41:42'),
(6, 'Mustard Oil 5L', '8941154040523', 2, 'EAN13', 1, NULL, '960', '1180', NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, 'Admin', 'Admin', '2022-11-28 14:51:14', '2022-12-12 10:41:42'),
(7, 'Mustard Oil 8kg Tin', '8941154040', 2, 'EAN13', 1, NULL, '1665', '1800', NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, 'Admin', 'Admin', '2022-11-28 14:52:57', '2022-12-07 16:27:32'),
(8, 'Mustard Oil 16kg Tin', '8941154040400', 2, 'EAN13', 1, NULL, '3333', '3600', NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, 'Admin', 'Admin', '2022-11-28 14:53:59', '2022-12-01 16:28:13'),
(9, 'Chinigura Rice 1kg Inactive', '42211387', 3, 'EAN13', 1, NULL, NULL, '125', NULL, NULL, NULL, NULL, NULL, NULL, '1', '2', NULL, 'Admin', 'Admin', '2022-11-28 14:59:26', '2022-12-05 13:43:14'),
(10, 'Lachcha Semai 180g (Inactive)', '85402969', 28, 'EAN13', 1, NULL, NULL, '35', NULL, NULL, NULL, NULL, NULL, NULL, '1', '2', NULL, 'Admin', 'Admin', '2022-11-28 15:01:38', '2022-12-04 19:34:29'),
(11, 'Lachcha Semai 200g (Inactive)', '31169073', 28, 'EAN13', 1, NULL, NULL, '38', NULL, NULL, NULL, NULL, NULL, NULL, '1', '2', NULL, 'Admin', 'Admin', '2022-11-28 15:02:38', '2022-12-04 19:34:25'),
(12, 'Puffed Rice 250g (Inactive)', '8941154040189', 6, 'EAN13', 1, NULL, NULL, '25', NULL, NULL, NULL, NULL, NULL, NULL, '1', '2', NULL, 'Admin', 'Admin', '2022-11-28 15:03:26', '2022-12-05 13:22:14'),
(13, 'Puffed Rice 500g (Inactive)', '19398004', 6, 'EAN13', 1, NULL, NULL, '50', NULL, NULL, NULL, NULL, NULL, NULL, '1', '2', NULL, 'Sabbir Hossain (BABU)', 'Admin', '2022-11-28 15:49:05', '2022-12-04 19:38:50'),
(14, 'Mango Pickle 400g', '8941154040110', 29, 'EAN13', 1, NULL, NULL, '110', NULL, NULL, NULL, NULL, NULL, NULL, '1', '2', NULL, 'Admin', 'Admin', '2022-11-30 12:53:46', '2022-12-05 13:23:16'),
(15, 'Olive Pickle 400g', '8941154040134', 29, 'EAN13', 1, NULL, NULL, '110', NULL, NULL, NULL, NULL, NULL, NULL, '1', '2', NULL, 'Admin', 'Admin', '2022-11-30 12:56:47', '2022-12-05 13:23:32'),
(16, 'Mix Pickle 400g', '8941154040127', 29, 'EAN13', 1, NULL, NULL, '110', NULL, NULL, NULL, NULL, NULL, NULL, '1', '2', NULL, 'Admin', 'Admin', '2022-11-30 12:59:19', '2022-12-05 13:23:37'),
(17, 'Chilli Powder 500g', '8941154040554', 4, 'EAN13', 1, NULL, NULL, '210', NULL, NULL, NULL, NULL, NULL, NULL, '1', '2', NULL, 'Admin', 'Admin', '2022-11-30 15:55:20', '2022-12-05 13:43:37'),
(18, 'Chilli Powder 1kg', '8941154040547', 4, 'EAN13', 1, NULL, NULL, '420', NULL, NULL, NULL, NULL, NULL, NULL, '1', '2', NULL, 'Admin', NULL, '2022-11-30 16:00:11', '2022-12-05 13:43:46'),
(19, 'Turmeric Powder 500g', '8941154040578', 4, 'EAN13', 1, NULL, NULL, '140', NULL, NULL, NULL, NULL, NULL, NULL, '1', '2', NULL, 'Admin', NULL, '2022-11-30 16:06:20', '2022-12-05 13:43:53'),
(20, 'Turmeric Powder 1kg', '8941154040561', 4, 'EAN13', 1, NULL, NULL, '280', NULL, NULL, NULL, NULL, NULL, NULL, '1', '2', NULL, 'Admin', NULL, '2022-11-30 16:12:05', '2022-12-05 13:43:58'),
(21, 'Coriander Powder 500g', '8941154040592', 4, 'EAN13', 1, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, '1', '2', NULL, 'Admin', 'Admin', '2022-11-30 16:14:34', '2022-11-30 16:36:57'),
(22, 'Coriander Powder 1kg', '8941154040585', 4, 'EAN13', 1, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, '1', '2', NULL, 'Admin', 'Admin', '2022-11-30 16:15:44', '2022-11-30 16:36:52'),
(23, 'Cumin Powder 500g', '8941154040615', 4, 'EAN13', 1, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, '1', '2', NULL, 'Admin', 'Admin', '2022-11-30 16:17:47', '2022-11-30 16:36:48'),
(24, 'Cumin Powder 1kg', '8941154040608', 4, 'EAN13', 1, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, '1', '2', NULL, 'Admin', 'Admin', '2022-11-30 16:19:00', '2022-11-30 16:36:44'),
(25, 'Meat Curry Masala 40g (Inactive)', '63490318', 30, 'EAN13', 1, NULL, NULL, '30', NULL, NULL, NULL, NULL, NULL, NULL, '1', '2', NULL, 'Admin', 'Admin', '2022-11-30 16:26:13', '2022-12-05 13:30:14'),
(26, 'Chicken Curry Masala 40g (Inactive)', '33601017', 30, 'EAN13', 1, NULL, NULL, '30', NULL, NULL, NULL, NULL, NULL, NULL, '1', '2', NULL, 'Admin', 'Admin', '2022-11-30 16:28:23', '2022-12-05 13:33:25'),
(27, 'Fish Curry Masala 40g', '89411540401', 30, 'EAN13', 1, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, '1', '2', NULL, 'Admin', 'Admin', '2022-11-30 16:31:37', '2022-12-04 18:37:15'),
(28, 'Biryani Masala 40g (Inactive)', '60248121', 30, 'EAN13', 1, NULL, NULL, '40', NULL, NULL, NULL, NULL, NULL, NULL, '1', '2', NULL, 'Admin', 'Admin', '2022-11-30 16:32:52', '2022-12-05 13:35:18'),
(29, 'Halim Mix 200g (Inactive)', '78442003', 30, 'EAN13', 1, NULL, NULL, '45', NULL, NULL, NULL, NULL, NULL, NULL, '1', '2', NULL, 'Admin', 'Admin', '2022-11-30 16:34:30', '2022-12-05 13:37:06'),
(30, 'Chinigura Aromatic Rice 1kg', '8941154040165', 3, 'EAN13', 1, NULL, '109.75', '122', NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, 'Admin', NULL, '2022-12-04 17:01:16', '2022-12-06 12:46:29'),
(31, 'Lachcha Semai 200gm', '89411540401720', 28, 'EAN13', 1, NULL, '31.5', '38', NULL, NULL, NULL, NULL, NULL, 1, '1', '1', NULL, 'Admin', 'Admin', '2022-12-04 19:15:32', '2022-12-06 12:46:29'),
(32, 'Puffed Rice 500g', '8941154040202', 6, 'EAN13', 1, NULL, '48', '50', NULL, NULL, NULL, NULL, NULL, NULL, '2', '1', NULL, 'Admin', 'Sabbir Hossain (BABU)', '2022-12-04 19:38:31', '2022-12-12 19:22:07'),
(33, 'Meat Curry Masala 40g', '8941154040325', 30, 'EAN13', 1, NULL, '28.93', '30', NULL, NULL, NULL, NULL, NULL, 1, '1', '1', NULL, 'Admin', 'Admin', '2022-12-05 13:29:50', '2022-12-06 12:54:32'),
(34, 'Chicken Curry Masala 40g', '8941154040370', 30, 'EAN13', 1, NULL, '25.81', '30', NULL, NULL, NULL, NULL, NULL, 1, '1', '1', NULL, 'Admin', 'Admin', '2022-12-05 13:33:33', '2022-12-06 12:54:32'),
(35, 'Biryani Masala 40g', '8941154040011', 30, 'EAN13', 1, NULL, '27.83', '40', NULL, NULL, NULL, NULL, NULL, 1, '1', '1', NULL, 'Admin', 'Admin', '2022-12-05 13:36:00', '2022-12-06 12:54:32'),
(36, 'Halim Mix 200g', '8941154040394', 30, 'EAN13', 1, NULL, '43.82', '45', NULL, NULL, NULL, NULL, NULL, 1, '1', '1', NULL, 'Admin', NULL, '2022-12-05 13:39:04', '2022-12-06 12:54:32'),
(37, 'Mustard Oil 34kg Drum', '66721339', 2, 'EAN13', 1, NULL, '6700', '7140', NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, 'Admin', NULL, '2022-12-07 15:51:01', '2022-12-07 16:27:32'),
(38, 'Lachcha Semai 180g', '89411540401700', 28, 'EAN13', 1, NULL, '31.15', '35', NULL, NULL, NULL, NULL, NULL, 1, '1', '1', NULL, 'Admin', NULL, '2022-12-07 15:55:28', '2022-12-07 16:27:32');

-- --------------------------------------------------------

--
-- Table structure for table `product_material`
--

CREATE TABLE `product_material` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `material_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_material`
--

INSERT INTO `product_material` (`id`, `product_id`, `material_id`, `created_at`, `updated_at`) VALUES
(30, 14, 52, '2022-11-30 12:53:46', '2022-11-30 12:53:46'),
(31, 15, 53, '2022-11-30 12:56:47', '2022-11-30 12:56:47'),
(32, 15, 55, '2022-11-30 12:56:47', '2022-11-30 12:56:47'),
(33, 15, 56, '2022-11-30 12:56:47', '2022-11-30 12:56:47'),
(34, 15, 57, '2022-11-30 12:56:47', '2022-11-30 12:56:47'),
(35, 15, 59, '2022-11-30 12:56:47', '2022-11-30 12:56:47'),
(36, 16, 54, '2022-11-30 12:59:19', '2022-11-30 12:59:19'),
(37, 16, 60, '2022-11-30 12:59:19', '2022-11-30 12:59:19'),
(38, 16, 55, '2022-11-30 12:59:19', '2022-11-30 12:59:19'),
(39, 16, 56, '2022-11-30 12:59:19', '2022-11-30 12:59:19'),
(40, 16, 57, '2022-11-30 12:59:19', '2022-11-30 12:59:19'),
(41, 14, 58, '2022-11-30 13:01:23', '2022-11-30 13:01:23'),
(42, 14, 55, '2022-11-30 13:01:23', '2022-11-30 13:01:23'),
(43, 14, 56, '2022-11-30 13:01:23', '2022-11-30 13:01:23'),
(44, 14, 57, '2022-11-30 13:01:23', '2022-11-30 13:01:23'),
(45, 16, 61, '2022-11-30 13:03:35', '2022-11-30 13:03:35'),
(46, 15, 61, '2022-11-30 13:03:47', '2022-11-30 13:03:47'),
(47, 14, 61, '2022-11-30 13:04:03', '2022-11-30 13:04:03'),
(48, 17, 62, '2022-11-30 15:55:20', '2022-11-30 15:55:20'),
(49, 17, 66, '2022-11-30 15:55:20', '2022-11-30 15:55:20'),
(50, 17, 70, '2022-11-30 15:55:20', '2022-11-30 15:55:20'),
(51, 17, 73, '2022-11-30 15:55:20', '2022-11-30 15:55:20'),
(53, 18, 62, '2022-11-30 16:00:11', '2022-11-30 16:00:11'),
(54, 18, 66, '2022-11-30 16:00:11', '2022-11-30 16:00:11'),
(55, 18, 71, '2022-11-30 16:00:11', '2022-11-30 16:00:11'),
(56, 18, 74, '2022-11-30 16:00:11', '2022-11-30 16:00:11'),
(57, 19, 63, '2022-11-30 16:06:20', '2022-11-30 16:06:20'),
(58, 19, 67, '2022-11-30 16:06:20', '2022-11-30 16:06:20'),
(59, 19, 70, '2022-11-30 16:06:20', '2022-11-30 16:06:20'),
(60, 19, 72, '2022-11-30 16:06:20', '2022-11-30 16:06:20'),
(62, 20, 63, '2022-11-30 16:12:05', '2022-11-30 16:12:05'),
(63, 20, 67, '2022-11-30 16:12:05', '2022-11-30 16:12:05'),
(64, 20, 71, '2022-11-30 16:12:05', '2022-11-30 16:12:05'),
(65, 20, 74, '2022-11-30 16:12:05', '2022-11-30 16:12:05'),
(66, 21, 65, '2022-11-30 16:14:34', '2022-11-30 16:14:34'),
(67, 21, 69, '2022-11-30 16:14:34', '2022-11-30 16:14:34'),
(68, 21, 70, '2022-11-30 16:14:34', '2022-11-30 16:14:34'),
(69, 21, 72, '2022-11-30 16:14:34', '2022-11-30 16:14:34'),
(70, 21, 73, '2022-11-30 16:14:34', '2022-11-30 16:14:34'),
(71, 22, 65, '2022-11-30 16:15:44', '2022-11-30 16:15:44'),
(72, 22, 69, '2022-11-30 16:15:44', '2022-11-30 16:15:44'),
(73, 22, 71, '2022-11-30 16:15:44', '2022-11-30 16:15:44'),
(74, 22, 74, '2022-11-30 16:15:44', '2022-11-30 16:15:44'),
(75, 23, 64, '2022-11-30 16:17:47', '2022-11-30 16:17:47'),
(76, 23, 68, '2022-11-30 16:17:47', '2022-11-30 16:17:47'),
(77, 23, 70, '2022-11-30 16:17:47', '2022-11-30 16:17:47'),
(78, 23, 72, '2022-11-30 16:17:47', '2022-11-30 16:17:47'),
(79, 23, 73, '2022-11-30 16:17:47', '2022-11-30 16:17:47'),
(80, 24, 64, '2022-11-30 16:19:00', '2022-11-30 16:19:00'),
(81, 24, 68, '2022-11-30 16:19:00', '2022-11-30 16:19:00'),
(82, 24, 71, '2022-11-30 16:19:00', '2022-11-30 16:19:00'),
(83, 24, 74, '2022-11-30 16:19:00', '2022-11-30 16:19:00'),
(109, 8, 92, '2022-12-01 13:23:08', '2022-12-01 13:23:08'),
(110, 7, 92, '2022-12-01 13:23:16', '2022-12-01 13:23:16'),
(111, 6, 91, '2022-12-01 13:23:41', '2022-12-01 13:23:41'),
(112, 5, 91, '2022-12-01 13:24:29', '2022-12-01 13:24:29'),
(113, 4, 91, '2022-12-01 13:24:36', '2022-12-01 13:24:36'),
(114, 3, 91, '2022-12-01 13:24:44', '2022-12-01 13:24:44'),
(115, 2, 91, '2022-12-01 13:24:56', '2022-12-01 13:24:56'),
(116, 1, 91, '2022-12-01 13:25:03', '2022-12-01 13:25:03'),
(117, 1, 96, '2022-12-01 13:44:36', '2022-12-01 13:44:36'),
(118, 1, 95, '2022-12-01 13:44:36', '2022-12-01 13:44:36'),
(119, 1, 98, '2022-12-01 13:44:36', '2022-12-01 13:44:36'),
(120, 1, 93, '2022-12-01 13:44:36', '2022-12-01 13:44:36'),
(121, 1, 97, '2022-12-01 13:44:36', '2022-12-01 13:44:36'),
(122, 2, 99, '2022-12-01 14:46:24', '2022-12-01 14:46:24'),
(123, 2, 101, '2022-12-01 14:46:24', '2022-12-01 14:46:24'),
(124, 2, 98, '2022-12-01 14:46:24', '2022-12-01 14:46:24'),
(125, 2, 93, '2022-12-01 14:46:24', '2022-12-01 14:46:24'),
(126, 2, 100, '2022-12-01 14:46:24', '2022-12-01 14:46:24'),
(127, 3, 102, '2022-12-01 15:36:41', '2022-12-01 15:36:41'),
(128, 3, 104, '2022-12-01 15:36:41', '2022-12-01 15:36:41'),
(129, 3, 98, '2022-12-01 15:36:41', '2022-12-01 15:36:41'),
(130, 3, 93, '2022-12-01 15:36:41', '2022-12-01 15:36:41'),
(131, 3, 103, '2022-12-01 15:36:41', '2022-12-01 15:36:41'),
(132, 4, 107, '2022-12-01 15:37:48', '2022-12-01 15:37:48'),
(133, 4, 106, '2022-12-01 15:37:48', '2022-12-01 15:37:48'),
(134, 4, 98, '2022-12-01 15:37:48', '2022-12-01 15:37:48'),
(135, 4, 93, '2022-12-01 15:37:48', '2022-12-01 15:37:48'),
(136, 4, 105, '2022-12-01 15:37:48', '2022-12-01 15:37:48'),
(137, 5, 108, '2022-12-01 15:38:51', '2022-12-01 15:38:51'),
(138, 5, 109, '2022-12-01 15:38:51', '2022-12-01 15:38:51'),
(139, 5, 98, '2022-12-01 15:38:51', '2022-12-01 15:38:51'),
(140, 5, 93, '2022-12-01 15:38:51', '2022-12-01 15:38:51'),
(141, 5, 110, '2022-12-01 15:38:51', '2022-12-01 15:38:51'),
(142, 6, 111, '2022-12-01 15:39:38', '2022-12-01 15:39:38'),
(143, 6, 112, '2022-12-01 15:39:38', '2022-12-01 15:39:38'),
(145, 6, 117, '2022-12-01 15:39:38', '2022-12-01 15:39:38'),
(146, 6, 115, '2022-12-01 15:39:38', '2022-12-01 15:39:38'),
(147, 8, 121, '2022-12-01 15:40:15', '2022-12-01 15:40:15'),
(148, 8, 122, '2022-12-01 15:40:15', '2022-12-01 15:40:15'),
(149, 7, 118, '2022-12-01 15:40:36', '2022-12-01 15:40:36'),
(151, 7, 120, '2022-12-01 16:02:45', '2022-12-01 16:02:45'),
(152, 6, 123, '2022-12-01 16:07:37', '2022-12-01 16:07:37'),
(153, 30, 124, '2022-12-04 17:01:16', '2022-12-04 17:01:16'),
(154, 30, 125, '2022-12-04 17:01:16', '2022-12-04 17:01:16'),
(155, 30, 126, '2022-12-04 17:01:16', '2022-12-04 17:01:16'),
(156, 27, 144, '2022-12-04 18:37:15', '2022-12-04 18:37:15'),
(157, 31, 127, '2022-12-04 19:15:32', '2022-12-04 19:15:32'),
(158, 31, 129, '2022-12-04 19:15:32', '2022-12-04 19:15:32'),
(159, 31, 130, '2022-12-04 19:15:32', '2022-12-04 19:15:32'),
(160, 32, 131, '2022-12-04 19:38:31', '2022-12-04 19:38:31'),
(161, 32, 132, '2022-12-04 19:38:31', '2022-12-04 19:38:31'),
(162, 32, 133, '2022-12-04 19:38:31', '2022-12-04 19:38:31'),
(163, 33, 134, '2022-12-05 13:29:50', '2022-12-05 13:29:50'),
(164, 33, 136, '2022-12-05 13:29:50', '2022-12-05 13:29:50'),
(165, 33, 146, '2022-12-05 13:29:50', '2022-12-05 13:29:50'),
(166, 34, 137, '2022-12-05 13:33:33', '2022-12-05 13:33:33'),
(167, 34, 138, '2022-12-05 13:33:33', '2022-12-05 13:33:33'),
(168, 34, 146, '2022-12-05 13:33:33', '2022-12-05 13:33:33'),
(169, 35, 139, '2022-12-05 13:36:00', '2022-12-05 13:36:00'),
(170, 35, 140, '2022-12-05 13:36:00', '2022-12-05 13:36:00'),
(171, 35, 146, '2022-12-05 13:36:00', '2022-12-05 13:36:00'),
(172, 36, 141, '2022-12-05 13:39:04', '2022-12-05 13:39:04'),
(173, 36, 142, '2022-12-05 13:39:04', '2022-12-05 13:39:04'),
(174, 36, 152, '2022-12-05 13:39:04', '2022-12-05 13:39:04'),
(175, 36, 147, '2022-12-05 13:39:04', '2022-12-05 13:39:04'),
(176, 35, 150, '2022-12-05 13:40:55', '2022-12-05 13:40:55'),
(177, 34, 149, '2022-12-05 13:41:27', '2022-12-05 13:41:27'),
(178, 33, 148, '2022-12-05 13:41:54', '2022-12-05 13:41:54'),
(179, 37, 92, '2022-12-07 15:51:01', '2022-12-07 15:51:01'),
(180, 38, 127, '2022-12-07 15:55:28', '2022-12-07 15:55:28'),
(181, 38, 129, '2022-12-07 15:55:28', '2022-12-07 15:55:28'),
(182, 38, 130, '2022-12-07 15:55:28', '2022-12-07 15:55:28');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `memo_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier_id` bigint(20) UNSIGNED NOT NULL,
  `warehouse_id` int(11) NOT NULL,
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
  `account_id` int(11) DEFAULT NULL,
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
(1, 'PINV-1001', 3, 1, 1.00, 2000.00, 0, 32021.74, NULL, 245500, 0, 0, NULL, NULL, 245500, 245500, 0, 23, '0', '1', '1', '1', NULL, 'Vat = 1000kg@70taka*15%=10500', '2022-11-15', 'Admin', NULL, '2022-12-07 15:22:24', '2022-12-07 15:22:24'),
(2, 'PINV-1002', 1, 1, 1.00, 120.00, 0, 0, NULL, 23400, 0, 0, NULL, NULL, 23400, 0, 0, 23, '0', '1', '3', '1', NULL, NULL, '2022-12-07', 'Admin', NULL, '2022-12-07 15:41:16', '2022-12-07 15:41:48'),
(3, 'PINV-1003', 1, 1, 1.00, 1680.00, 0, 0, NULL, 298116, 0, 0, NULL, NULL, 298116, 0, 0, 23, '0', '1', '3', '1', NULL, NULL, '2022-12-06', 'Admin', NULL, '2022-12-07 15:44:11', '2022-12-07 15:44:11'),
(4, 'PINV-1004', 1, 1, 1.00, 34.00, 0, 0, NULL, 6630, 0, 0, NULL, NULL, 6630, 0, 0, 23, '0', '1', '3', '1', NULL, NULL, '2022-12-07', 'Admin', NULL, '2022-12-07 15:46:01', '2022-12-07 15:46:01');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_payments`
--

CREATE TABLE `purchase_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_id` bigint(20) UNSIGNED NOT NULL,
  `account_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` bigint(20) UNSIGNED NOT NULL,
  `supplier_debit_transaction_id` bigint(20) UNSIGNED NOT NULL,
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
(1, 1, 23, 0, 26, 245500, '1', '0', NULL, 'Admin', NULL, '2022-12-07 15:22:24', '2022-12-07 15:22:24');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_returns`
--

CREATE TABLE `purchase_returns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `return_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `memo_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `supplier_id` bigint(20) UNSIGNED DEFAULT NULL,
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_return_id` bigint(20) UNSIGNED NOT NULL,
  `memo_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `material_id` bigint(20) UNSIGNED NOT NULL,
  `return_qty` double NOT NULL,
  `unit_id` bigint(20) UNSIGNED DEFAULT NULL,
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
  `id` bigint(20) UNSIGNED NOT NULL,
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
(43, 'DEPO Manager', '2', NULL, NULL, '2022-03-03 09:28:05', '2022-11-28 11:06:41'),
(45, 'Accounts', '2', NULL, NULL, '2022-11-26 16:24:26', '2022-11-28 11:04:18'),
(46, 'ASM', '2', NULL, NULL, '2022-11-30 14:17:17', '2022-11-30 14:17:17'),
(47, 'DEPO Incharge', '2', NULL, NULL, '2022-12-11 12:22:29', '2022-12-11 12:22:29');

-- --------------------------------------------------------

--
-- Table structure for table `salaries`
--

CREATE TABLE `salaries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `month` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salary` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `monthly_target_achieve` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `product_target_achieve` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `ta_td` varchar(260) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `deduction` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `claim` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salarytable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salarytable_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1 = Active , 2 = InActive',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `memo_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salesmen_id` bigint(20) UNSIGNED DEFAULT NULL,
  `area_id` bigint(20) DEFAULT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sale_date` date NOT NULL,
  `document` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_qty` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_free_qty` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_delivery_quantity` bigint(20) DEFAULT NULL,
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
  `account_id` bigint(20) UNSIGNED DEFAULT NULL,
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
(32, 'SINV-230301893', 1, 1, 2, '2023-03-01', NULL, '1', '1', '10', 0, '6.00', '46.00', '45.00', '0.00', '0', '1', '1', '1', '0.00', '47.00', '47.00', '47.00', '0.00', '1', '1', NULL, 23, NULL, '2', 'Super Admin', NULL, '2023-03-01 10:00:03', '2023-03-04 07:18:20'),
(33, 'SINV-230304973', NULL, NULL, 2, '2023-03-04', NULL, '1', '5', '1', 6, '30.00', '230.00', '0.00', '0.00', '0', '10.00', '100.00', '100.00', '0.00', '650.00', '650.00', '420.00', '0.00', '1', '1', NULL, 23, NULL, '2', 'Super Admin', 'Super Admin', '2023-03-04 07:35:10', '2023-03-04 08:56:08'),
(34, 'SINV-230304448', NULL, NULL, 14, '2023-03-04', NULL, '1', '20', '1', 0, '0.00', '72000.00', '71900.00', '0.00', '0', '100', '50', '10', '0.00', '71960.00', '71960.00', '71960.00', '0.00', '1', '1', NULL, 23, NULL, '1', 'Super Admin', NULL, '2023-03-04 08:16:43', '2023-03-04 08:16:43');

-- --------------------------------------------------------

--
-- Table structure for table `salesmen`
--

CREATE TABLE `salesmen` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `additional_phone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salary` varchar(260) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `asm_id` bigint(20) UNSIGNED NOT NULL,
  `district_id` bigint(20) UNSIGNED NOT NULL,
  `upazila_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `salesmen`
--

INSERT INTO `salesmen` (`id`, `name`, `username`, `phone`, `additional_phone`, `email`, `avatar`, `password`, `salary`, `warehouse_id`, `asm_id`, `district_id`, `upazila_id`, `status`, `created_by`, `modified_by`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Ruma Akter', 'ruma', '+8801952740489', NULL, NULL, NULL, '$2y$10$WfaUSqUlt0GP/Q30euan7ehENQK7uWxIgM/L9p9MLwhk6EV.8U11K', '11000', 2, 1, 2, 3, '1', 'Admin', NULL, NULL, '2022-11-30 12:36:05', '2022-11-30 12:36:05'),
(2, 'Alo Akter', 'aloakter', '+8801874150689', NULL, NULL, NULL, '$2y$10$9gjxA/j2nfOG.0KHXBtD9OJNoZDbUCRFAXDcaVuKbN5wgR71lg/QG', '10000', 2, 1, 2, 3, '1', 'Admin', 'Sabbir Hossain (BABU)', NULL, '2022-11-30 12:39:58', '2022-11-30 23:02:16'),
(3, 'Ripon Hossain', 'ripon', '+8801736965621', NULL, NULL, NULL, '$2y$10$JYwyaeAt9g/6VZ7ezCVlxehUzkYf4GtVrLhjiBGudq1wjivt61CjO', '15000', 2, 1, 2, 3, '1', 'Admin', 'Admin', NULL, '2022-11-30 12:42:15', '2022-12-12 13:51:44'),
(4, 'Office Sale', 'office', '+880258053917', NULL, 'mfbl.2k20@gmail.com', NULL, '$2y$10$EEdXn5V.L.PFjJ6IkfBWE.U5md8.jwGKNAuOLq53.csVgl1oVBFXi', '0', 2, 1, 2, 3, '1', 'Admin', NULL, NULL, '2022-12-12 13:57:12', '2022-12-12 13:57:12');

-- --------------------------------------------------------

--
-- Table structure for table `salesmen_areas`
--

CREATE TABLE `salesmen_areas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `salesmen_id` bigint(20) UNSIGNED NOT NULL,
  `area_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `salesmen_areas`
--

INSERT INTO `salesmen_areas` (`id`, `salesmen_id`, `area_id`, `created_at`, `updated_at`) VALUES
(1, 1, 652, '2022-11-30 12:36:05', '2022-11-30 12:36:05'),
(2, 1, 653, '2022-11-30 12:36:05', '2022-11-30 12:36:05'),
(3, 1, 654, '2022-11-30 12:36:05', '2022-11-30 12:36:05'),
(4, 1, 655, '2022-11-30 12:36:05', '2022-11-30 12:36:05'),
(6, 3, 699, '2022-11-30 12:42:15', '2022-11-30 12:42:15'),
(7, 2, 705, '2022-11-30 23:02:16', '2022-11-30 23:02:16'),
(8, 2, 708, '2022-11-30 23:02:16', '2022-11-30 23:02:16'),
(9, 2, 710, '2022-11-30 23:02:16', '2022-11-30 23:02:16'),
(10, 2, 711, '2022-11-30 23:02:16', '2022-11-30 23:02:16'),
(11, 2, 716, '2022-12-07 19:45:32', '2022-12-07 19:45:32'),
(12, 2, 718, '2022-12-07 19:45:32', '2022-12-07 19:45:32'),
(13, 2, 717, '2022-12-07 19:45:32', '2022-12-07 19:45:32'),
(14, 2, 695, '2022-12-07 19:46:40', '2022-12-07 19:46:40'),
(15, 2, 713, '2022-12-07 19:46:40', '2022-12-07 19:46:40'),
(16, 2, 707, '2022-12-07 19:46:40', '2022-12-07 19:46:40'),
(17, 2, 719, '2022-12-07 21:18:06', '2022-12-07 21:18:06'),
(18, 2, 720, '2022-12-07 21:18:06', '2022-12-07 21:18:06'),
(19, 2, 715, '2022-12-11 17:05:45', '2022-12-11 17:05:45'),
(20, 3, 703, '2022-12-12 13:51:44', '2022-12-12 13:51:44'),
(21, 4, 4, '2022-12-12 13:57:12', '2022-12-12 13:57:12'),
(22, 2, 714, '2022-12-12 19:19:58', '2022-12-12 19:19:58'),
(23, 2, 722, '2022-12-13 15:13:42', '2022-12-13 15:13:42');

-- --------------------------------------------------------

--
-- Table structure for table `salesmen_monthly_targets`
--

CREATE TABLE `salesmen_monthly_targets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mtcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salesmen_id` bigint(20) UNSIGNED NOT NULL,
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `product_price` bigint(20) DEFAULT NULL,
  `quantity` bigint(20) DEFAULT NULL,
  `commission_percent` bigint(20) DEFAULT NULL,
  `commission_amount` bigint(20) DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `salesmen_product_commissions`
--

INSERT INTO `salesmen_product_commissions` (`id`, `name`, `product_id`, `product_price`, `quantity`, `commission_percent`, `commission_amount`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Mustard Oil 80ml 1680p Bundle', 1, 28, 1680, 1, 329, 'Admin', '2022-12-27 11:47:26', '2022-12-27 11:47:26'),
(2, 'Mustard Oil 250ml 720p Bundle', 2, 75, 720, 1, 378, 'Admin', '2022-12-27 11:47:52', '2022-12-27 11:47:52');

-- --------------------------------------------------------

--
-- Table structure for table `salesmen_product_targets`
--

CREATE TABLE `salesmen_product_targets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `salesmen_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_commission_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ptcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `achieved_value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pcs` varchar(260) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `salesmen_product_targets`
--

INSERT INTO `salesmen_product_targets` (`id`, `salesmen_id`, `product_commission_id`, `ptcode`, `achieved_value`, `pcs`, `start_date`, `end_date`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 'SPT-2212271148252', NULL, '0', '2022-11-30', '2022-12-30', 'Admin', NULL, NULL),
(2, 2, 2, 'SPT-2212271148253', NULL, '0', '2022-11-30', '2022-12-30', 'Admin', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sale_products`
--

CREATE TABLE `sale_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `qty` double NOT NULL,
  `free_qty` double DEFAULT NULL,
  `delivered_qty` bigint(20) DEFAULT NULL,
  `sale_unit_id` bigint(20) UNSIGNED DEFAULT NULL,
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
(1, 1, 5, 6, 0, 6, 1, 480, 0, 0, 0, 2880, NULL, '2022-12-06 13:18:17'),
(2, 1, 4, 3, 0, 3, 1, 240, 0, 0, 0, 720, NULL, '2022-12-06 13:18:17'),
(3, 1, 6, 2, 0, 2, 1, 1150, 0, 0, 0, 2300, NULL, '2022-12-06 13:18:17'),
(4, 2, 30, 15, 0, 15, 1, 125, 0, 0, 0, 1875, NULL, '2022-12-11 17:09:20'),
(6, 4, 1, 12, 0, 12, 1, 25, 0, 0, 0, 300, NULL, '2022-12-12 11:56:28'),
(7, 4, 2, 3, 0, 3, 1, 70, 0, 0, 0, 210, NULL, '2022-12-12 11:56:28'),
(8, 5, 30, 3, 0, 3, 1, 120, 0, 0, 0, 360, NULL, '2022-12-12 12:02:05'),
(9, 6, 1, 12, 0, 12, 1, 25, 0, 0, 0, 300, NULL, '2022-12-12 12:25:45'),
(10, 7, 8, 1, 0, 1, 1, 3500, 0, 0, 0, 3500, NULL, '2022-12-12 12:32:31'),
(11, 7, 30, 10, 0, 10, 1, 125, 0, 0, 0, 1250, NULL, '2022-12-12 12:32:31'),
(12, 8, 30, 40, 0, 40, 1, 125, 0, 0, 0, 5000, NULL, '2022-12-12 12:41:42'),
(13, 9, 30, 15, 0, 15, 1, 125, 0, 0, 0, 1875, NULL, '2022-12-12 12:49:06'),
(14, 10, 1, 48, 0, 48, 1, 23, 0, 0, 0, 1104, NULL, '2022-12-12 12:49:44'),
(15, 10, 4, 3, 0, 3, 1, 230, 0, 0, 0, 690, NULL, '2022-12-12 12:49:44'),
(16, 11, 1, 12, 0, 12, 1, 25, 0, 0, 0, 300, NULL, '2022-12-12 12:54:10'),
(17, 11, 3, 6, 0, 6, 1, 140, 0, 0, 0, 840, NULL, '2022-12-12 12:54:10'),
(18, 12, 8, 1, 0, 1, 1, 3500, 0, 0, 0, 3500, NULL, '2022-12-12 17:53:46'),
(19, 13, 1, 12, 0, 12, 1, 25, 0, 0, 0, 300, NULL, '2022-12-12 17:57:20'),
(20, 13, 2, 3, 0, 3, 1, 70, 0, 0, 0, 210, NULL, '2022-12-12 17:57:20'),
(21, 14, 1, 6, 0, 6, 1, 25, 0, 0, 0, 150, NULL, '2022-12-12 18:00:20'),
(22, 14, 30, 6, 0, 6, 1, 125, 0, 0, 0, 750, NULL, '2022-12-12 18:00:20'),
(23, 15, 32, 14, 0, 14, 1, 48, 0, 0, 0, 672, NULL, '2022-12-12 19:23:51'),
(24, 16, 1, 12, 0, 12, 1, 25, 0, 0, 0, 300, NULL, '2022-12-12 19:27:52'),
(25, 16, 3, 3, 0, 3, 1, 130, 0, 0, 0, 390, NULL, '2022-12-12 19:27:52'),
(26, 17, 1, 24, 0, 24, 1, 25, 0, 0, 0, 600, NULL, '2022-12-12 19:31:14'),
(27, 17, 30, 10, 0, 10, 1, 125, 0, 0, 0, 1250, NULL, '2022-12-12 19:31:14'),
(28, 18, 30, 40, 0, 40, 1, 122, 0, 0, 0, 4880, NULL, '2022-12-13 15:15:31'),
(29, 19, 2, 3, 0, 3, 1, 70, 0, 0, 0, 210, NULL, '2022-12-13 15:19:41'),
(30, 19, 30, 5, 0, 5, 1, 120, 0, 0, 0, 600, NULL, '2022-12-13 15:19:41'),
(31, 20, 3, 12, 0, 12, 1, 130, 0, 0, 0, 1560, NULL, '2022-12-13 15:25:15'),
(32, 20, 4, 6, 0, 6, 1, 230, 0, 0, 0, 1380, NULL, '2022-12-13 15:25:15'),
(33, 21, 8, 1, 0, 1, 1, 3500, 0, 0, 0, 3500, NULL, '2022-12-13 15:28:24'),
(34, 22, 1, 48, 0, 48, 1, 23, 0, 0, 0, 1104, NULL, '2022-12-13 15:31:39'),
(35, 23, 30, 40, 0, 40, 1, 120, 0, 0, 0, 4800, NULL, '2022-12-13 15:35:31'),
(36, 24, 4, 2, 0, 2, 1, 240, 0, 0, 0, 480, NULL, '2022-12-13 15:38:33'),
(37, 25, 1, 47, 0, 47, 1, 22, 0, 0, 0, 1034, NULL, '2022-12-13 15:41:51'),
(38, 25, 30, 10, 0, 10, 1, 120, 0, 0, 0, 1200, NULL, '2022-12-13 15:41:51'),
(39, 26, 8, 4, 0, 4, 1, 3500, 0, 0, 0, 14000, NULL, '2022-12-13 15:44:24'),
(40, 27, 3, 5, 0, 5, 1, 125, 0, 0, 0, 625, NULL, '2022-12-13 15:46:43'),
(41, 28, 32, 6, 0, 6, 1, 50, 0, 0, 0, 300, NULL, '2022-12-13 15:50:16'),
(42, 29, 6, 1, 0, 1, 1, 1150, 0, 0, 0, 1150, NULL, '2022-12-13 15:52:55'),
(43, 30, 30, 4, 0, 4, 1, 122, 0, 0, 0, 488, NULL, '2022-12-13 15:55:16'),
(44, 31, 30, 20, 0, 20, 1, 120, 0, 0, 0, 2400, NULL, '2022-12-13 16:01:30'),
(45, 32, 35, 1, 10, 0, 1, 40, 0, 15, 6, 46, NULL, NULL),
(47, 34, 8, 20, 1, 0, 1, 3600, 0, 0, 0, 72000, NULL, NULL),
(49, 33, 35, 5, 1, 6, 1, 40, 0, 15, 30, 230, NULL, '2023-03-04 08:56:08');

-- --------------------------------------------------------

--
-- Table structure for table `sale_returns`
--

CREATE TABLE `sale_returns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `return_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `memo_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_return_id` bigint(20) UNSIGNED NOT NULL,
  `memo_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch_no` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `return_qty` double NOT NULL,
  `unit_id` bigint(20) UNSIGNED DEFAULT NULL,
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
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('aFPpmWFNxv57WXYtIEqido3m0vwalE28HOQQyeIO', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiZkR1alJKNUVwMENCOEUwR0ZCNlJmMERMTUIyY1B4N0VpUGRsRlNQaiI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI2OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvc2FsZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoxNToidXNlcl9wZXJtaXNzaW9uIjthOjQxODp7aTowO3M6MTY6ImRhc2hib2FyZC1hY2Nlc3MiO2k6MTtzOjExOiJ1c2VyLWFjY2VzcyI7aToyO3M6ODoidXNlci1hZGQiO2k6MztzOjk6InVzZXItZWRpdCI7aTo0O3M6OToidXNlci12aWV3IjtpOjU7czoxMToidXNlci1kZWxldGUiO2k6NjtzOjE2OiJ1c2VyLWJ1bGstZGVsZXRlIjtpOjc7czoxMToidXNlci1yZXBvcnQiO2k6ODtzOjExOiJyb2xlLWFjY2VzcyI7aTo5O3M6ODoicm9sZS1hZGQiO2k6MTA7czo5OiJyb2xlLWVkaXQiO2k6MTE7czo5OiJyb2xlLXZpZXciO2k6MTI7czoxMToicm9sZS1kZWxldGUiO2k6MTM7czoxNjoicm9sZS1idWxrLWRlbGV0ZSI7aToxNDtzOjExOiJyb2xlLXJlcG9ydCI7aToxNTtzOjExOiJtZW51LWFjY2VzcyI7aToxNjtzOjg6Im1lbnUtYWRkIjtpOjE3O3M6OToibWVudS1lZGl0IjtpOjE4O3M6MTE6Im1lbnUtZGVsZXRlIjtpOjE5O3M6MTY6Im1lbnUtYnVsay1kZWxldGUiO2k6MjA7czoxMToibWVudS1yZXBvcnQiO2k6MjE7czoxOToibWVudS1idWlsZGVyLWFjY2VzcyI7aToyMjtzOjE1OiJtZW51LW1vZHVsZS1hZGQiO2k6MjM7czoxNjoibWVudS1tb2R1bGUtZWRpdCI7aToyNDtzOjE4OiJtZW51LW1vZHVsZS1kZWxldGUiO2k6MjU7czoxNzoicGVybWlzc2lvbi1hY2Nlc3MiO2k6MjY7czoxNDoicGVybWlzc2lvbi1hZGQiO2k6Mjc7czoxNToicGVybWlzc2lvbi1lZGl0IjtpOjI4O3M6MTc6InBlcm1pc3Npb24tZGVsZXRlIjtpOjI5O3M6MjI6InBlcm1pc3Npb24tYnVsay1kZWxldGUiO2k6MzA7czoxNzoicGVybWlzc2lvbi1yZXBvcnQiO2k6MzE7czoxNjoid2FyZWhvdXNlLWFjY2VzcyI7aTozMjtzOjEzOiJ3YXJlaG91c2UtYWRkIjtpOjMzO3M6MTQ6IndhcmVob3VzZS1lZGl0IjtpOjM0O3M6MTY6IndhcmVob3VzZS1kZWxldGUiO2k6MzU7czoyMToid2FyZWhvdXNlLWJ1bGstZGVsZXRlIjtpOjM2O3M6MTY6IndhcmVob3VzZS1yZXBvcnQiO2k6Mzc7czoyMjoiZ2VuZXJhbC1zZXR0aW5nLWFjY2VzcyI7aTozODtzOjIxOiJjdXN0b21lci1ncm91cC1hY2Nlc3MiO2k6Mzk7czoxODoiY3VzdG9tZXItZ3JvdXAtYWRkIjtpOjQwO3M6MTk6ImN1c3RvbWVyLWdyb3VwLWVkaXQiO2k6NDE7czoyMToiY3VzdG9tZXItZ3JvdXAtZGVsZXRlIjtpOjQyO3M6MjY6ImN1c3RvbWVyLWdyb3VwLWJ1bGstZGVsZXRlIjtpOjQzO3M6MjE6ImN1c3RvbWVyLWdyb3VwLXJlcG9ydCI7aTo0NDtzOjExOiJ1bml0LWFjY2VzcyI7aTo0NTtzOjg6InVuaXQtYWRkIjtpOjQ2O3M6OToidW5pdC1lZGl0IjtpOjQ3O3M6MTE6InVuaXQtZGVsZXRlIjtpOjQ4O3M6MTY6InVuaXQtYnVsay1kZWxldGUiO2k6NDk7czoxMToidW5pdC1yZXBvcnQiO2k6NTA7czoxMDoidmF0LWFjY2VzcyI7aTo1MTtzOjc6InZhdC1hZGQiO2k6NTI7czo4OiJ2YXQtZWRpdCI7aTo1MztzOjEwOiJ2YXQtZGVsZXRlIjtpOjU0O3M6MTU6InZhdC1idWxrLWRlbGV0ZSI7aTo1NTtzOjEwOiJ2YXQtcmVwb3J0IjtpOjU2O3M6MjQ6Im1hdGVyaWFsLWNhdGVnb3J5LWFjY2VzcyI7aTo1NztzOjIxOiJtYXRlcmlhbC1jYXRlZ29yeS1hZGQiO2k6NTg7czoyMjoibWF0ZXJpYWwtY2F0ZWdvcnktZWRpdCI7aTo1OTtzOjI0OiJtYXRlcmlhbC1jYXRlZ29yeS1kZWxldGUiO2k6NjA7czoyOToibWF0ZXJpYWwtY2F0ZWdvcnktYnVsay1kZWxldGUiO2k6NjE7czoyNDoibWF0ZXJpYWwtY2F0ZWdvcnktcmVwb3J0IjtpOjYyO3M6MTU6Im1hdGVyaWFsLWFjY2VzcyI7aTo2MztzOjEyOiJtYXRlcmlhbC1hZGQiO2k6NjQ7czoxMzoibWF0ZXJpYWwtZWRpdCI7aTo2NTtzOjEzOiJtYXRlcmlhbC12aWV3IjtpOjY2O3M6MTU6Im1hdGVyaWFsLWRlbGV0ZSI7aTo2NztzOjIwOiJtYXRlcmlhbC1idWxrLWRlbGV0ZSI7aTo2ODtzOjE1OiJtYXRlcmlhbC1yZXBvcnQiO2k6Njk7czoyODoibWF0ZXJpYWwtc3RvY2stcmVwb3J0LWFjY2VzcyI7aTo3MDtzOjE1OiJwdXJjaGFzZS1hY2Nlc3MiO2k6NzE7czoxMjoicHVyY2hhc2UtYWRkIjtpOjcyO3M6MTM6InB1cmNoYXNlLWVkaXQiO2k6NzM7czoxMzoicHVyY2hhc2UtdmlldyI7aTo3NDtzOjE1OiJwdXJjaGFzZS1kZWxldGUiO2k6NzU7czoyMDoicHVyY2hhc2UtYnVsay1kZWxldGUiO2k6NzY7czoxNToicHVyY2hhc2UtcmVwb3J0IjtpOjc3O3M6MjM6InByb2R1Y3QtY2F0ZWdvcnktYWNjZXNzIjtpOjc4O3M6MjA6InByb2R1Y3QtY2F0ZWdvcnktYWRkIjtpOjc5O3M6MjE6InByb2R1Y3QtY2F0ZWdvcnktZWRpdCI7aTo4MDtzOjIzOiJwcm9kdWN0LWNhdGVnb3J5LWRlbGV0ZSI7aTo4MTtzOjI4OiJwcm9kdWN0LWNhdGVnb3J5LWJ1bGstZGVsZXRlIjtpOjgyO3M6MjM6InByb2R1Y3QtY2F0ZWdvcnktcmVwb3J0IjtpOjgzO3M6MTQ6InByb2R1Y3QtYWNjZXNzIjtpOjg0O3M6MTE6InByb2R1Y3QtYWRkIjtpOjg1O3M6MTI6InByb2R1Y3QtZWRpdCI7aTo4NjtzOjEyOiJwcm9kdWN0LXZpZXciO2k6ODc7czoxNDoicHJvZHVjdC1kZWxldGUiO2k6ODg7czoxOToicHJvZHVjdC1idWxrLWRlbGV0ZSI7aTo4OTtzOjE0OiJwcm9kdWN0LXJlcG9ydCI7aTo5MDtzOjIwOiJwcmludC1iYXJjb2RlLWFjY2VzcyI7aTo5MTtzOjI3OiJwcm9kdWN0LXN0b2NrLXJlcG9ydC1hY2Nlc3MiO2k6OTI7czoxNzoicHJvZHVjdGlvbi1hY2Nlc3MiO2k6OTM7czoxNDoicHJvZHVjdGlvbi1hZGQiO2k6OTQ7czoxNToicHJvZHVjdGlvbi1lZGl0IjtpOjk1O3M6MTU6InByb2R1Y3Rpb24tdmlldyI7aTo5NjtzOjE3OiJwcm9kdWN0aW9uLWRlbGV0ZSI7aTo5NztzOjE4OiJwcm9kdWN0aW9uLWFwcHJvdmUiO2k6OTg7czoxNzoicHJvZHVjdGlvbi1yZXBvcnQiO2k6OTk7czoxNToiY3VzdG9tZXItYWNjZXNzIjtpOjEwMDtzOjEyOiJjdXN0b21lci1hZGQiO2k6MTAxO3M6MjI6ImN1c3RvbWVyLWxlZGdlci1hY2Nlc3MiO2k6MTAyO3M6MjI6ImNyZWRpdC1jdXN0b21lci1hY2Nlc3MiO2k6MTAzO3M6MjA6InBhaWQtY3VzdG9tZXItYWNjZXNzIjtpOjEwNDtzOjIzOiJjdXN0b21lci1hZHZhbmNlLWFjY2VzcyI7aToxMDU7czoyMzoiY3VzdG9tZXItYWR2YW5jZS1yZXBvcnQiO2k6MTA2O3M6MTU6InN1cHBsaWVyLWFjY2VzcyI7aToxMDc7czoxMjoic3VwcGxpZXItYWRkIjtpOjEwODtzOjEzOiJzdXBwbGllci1lZGl0IjtpOjEwOTtzOjEzOiJzdXBwbGllci12aWV3IjtpOjExMDtzOjE1OiJzdXBwbGllci1kZWxldGUiO2k6MTExO3M6MjA6InN1cHBsaWVyLWJ1bGstZGVsZXRlIjtpOjExMjtzOjE1OiJzdXBwbGllci1yZXBvcnQiO2k6MTEzO3M6MjI6InN1cHBsaWVyLWxlZGdlci1hY2Nlc3MiO2k6MTE0O3M6MjM6InN1cHBsaWVyLWFkdmFuY2UtYWNjZXNzIjtpOjExNTtzOjEzOiJyZXR1cm4tYWNjZXNzIjtpOjExNjtzOjIyOiJwdXJjaGFzZS1yZXR1cm4tYWNjZXNzIjtpOjExNztzOjE5OiJwdXJjaGFzZS1yZXR1cm4tYWRkIjtpOjExODtzOjIwOiJwdXJjaGFzZS1yZXR1cm4tdmlldyI7aToxMTk7czoyMjoicHVyY2hhc2UtcmV0dXJuLWRlbGV0ZSI7aToxMjA7czoxMDoiY29hLWFjY2VzcyI7aToxMjE7czo3OiJjb2EtYWRkIjtpOjEyMjtzOjg6ImNvYS1lZGl0IjtpOjEyMztzOjEwOiJjb2EtZGVsZXRlIjtpOjEyNDtzOjIyOiJvcGVuaW5nLWJhbGFuY2UtYWNjZXNzIjtpOjEyNTtzOjIzOiJzdXBwbGllci1wYXltZW50LWFjY2VzcyI7aToxMjY7czoyMzoiY3VzdG9tZXItcmVjZWl2ZS1hY2Nlc3MiO2k6MTI3O3M6MjE6ImNvbnRyYS12b3VjaGVyLWFjY2VzcyI7aToxMjg7czoxODoiY29udHJhLXZvdWNoZXItYWRkIjtpOjEyOTtzOjE5OiJjb250cmEtdm91Y2hlci12aWV3IjtpOjEzMDtzOjIxOiJjb250cmEtdm91Y2hlci1kZWxldGUiO2k6MTMxO3M6MjI6ImpvdXJuYWwtdm91Y2hlci1hY2Nlc3MiO2k6MTMyO3M6MTk6ImpvdXJuYWwtdm91Y2hlci1hZGQiO2k6MTMzO3M6MjA6ImpvdXJuYWwtdm91Y2hlci12aWV3IjtpOjEzNDtzOjIyOiJqb3VybmFsLXZvdWNoZXItZGVsZXRlIjtpOjEzNTtzOjE0OiJ2b3VjaGVyLWFjY2VzcyI7aToxMzY7czoxNToidm91Y2hlci1hcHByb3ZlIjtpOjEzNztzOjEyOiJ2b3VjaGVyLWVkaXQiO2k6MTM4O3M6MTQ6InZvdWNoZXItZGVsZXRlIjtpOjEzOTtzOjE2OiJjYXNoLWJvb2stYWNjZXNzIjtpOjE0MDtzOjIzOiJpbnZlbnRvcnktbGVkZ2VyLWFjY2VzcyI7aToxNDE7czoxNjoiYmFuay1ib29rLWFjY2VzcyI7aToxNDI7czoyMzoibW9iaWxlLWJhbmstYm9vay1hY2Nlc3MiO2k6MTQzO3M6MjE6ImdlbmVyYWwtbGVkZ2VyLWFjY2VzcyI7aToxNDQ7czoyMDoidHJpYWwtYmFsYW5jZS1hY2Nlc3MiO2k6MTQ1O3M6MTg6InByb2ZpdC1sb3NzLWFjY2VzcyI7aToxNDY7czoxNjoiY2FzaC1mbG93LWFjY2VzcyI7aToxNDc7czoxOToiZXhwZW5zZS1pdGVtLWFjY2VzcyI7aToxNDg7czoxNjoiZXhwZW5zZS1pdGVtLWFkZCI7aToxNDk7czoxNzoiZXhwZW5zZS1pdGVtLWVkaXQiO2k6MTUwO3M6MTk6ImV4cGVuc2UtaXRlbS1kZWxldGUiO2k6MTUxO3M6MjQ6ImV4cGVuc2UtaXRlbS1idWxrLWRlbGV0ZSI7aToxNTI7czoxOToiZXhwZW5zZS1pdGVtLXJlcG9ydCI7aToxNTM7czoxNDoiZXhwZW5zZS1hY2Nlc3MiO2k6MTU0O3M6MTE6ImV4cGVuc2UtYWRkIjtpOjE1NTtzOjEyOiJleHBlbnNlLWVkaXQiO2k6MTU2O3M6MTQ6ImV4cGVuc2UtZGVsZXRlIjtpOjE1NztzOjE5OiJleHBlbnNlLWJ1bGstZGVsZXRlIjtpOjE1ODtzOjE0OiJleHBlbnNlLXJlcG9ydCI7aToxNTk7czoxNToiZXhwZW5zZS1hcHByb3ZlIjtpOjE2MDtzOjI0OiJleHBlbnNlLXN0YXRlbWVudC1hY2Nlc3MiO2k6MTYxO3M6MTE6ImJhbmstYWNjZXNzIjtpOjE2MjtzOjg6ImJhbmstYWRkIjtpOjE2MztzOjk6ImJhbmstZWRpdCI7aToxNjQ7czoxMToiYmFuay1kZWxldGUiO2k6MTY1O3M6MTE6ImJhbmstcmVwb3J0IjtpOjE2NjtzOjIzOiJiYW5rLXRyYW5zYWN0aW9uLWFjY2VzcyI7aToxNjc7czoxODoiYmFuay1sZWRnZXItYWNjZXNzIjtpOjE2ODtzOjE4OiJtb2JpbGUtYmFuay1hY2Nlc3MiO2k6MTY5O3M6MTU6Im1vYmlsZS1iYW5rLWFkZCI7aToxNzA7czoxNjoibW9iaWxlLWJhbmstZWRpdCI7aToxNzE7czoxODoibW9iaWxlLWJhbmstZGVsZXRlIjtpOjE3MjtzOjIzOiJtb2JpbGUtYmFuay1idWxrLWRlbGV0ZSI7aToxNzM7czoxODoibW9iaWxlLWJhbmstcmVwb3J0IjtpOjE3NDtzOjMwOiJtb2JpbGUtYmFuay10cmFuc2FjdGlvbi1hY2Nlc3MiO2k6MTc1O3M6MjU6Im1vYmlsZS1iYW5rLWxlZGdlci1hY2Nlc3MiO2k6MTc2O3M6MTU6ImRpc3RyaWN0LWFjY2VzcyI7aToxNzc7czoxMjoiZGlzdHJpY3QtYWRkIjtpOjE3ODtzOjEzOiJkaXN0cmljdC1lZGl0IjtpOjE3OTtzOjE1OiJkaXN0cmljdC1kZWxldGUiO2k6MTgwO3M6MjA6ImRpc3RyaWN0LWJ1bGstZGVsZXRlIjtpOjE4MTtzOjE1OiJkaXN0cmljdC1yZXBvcnQiO2k6MTgyO3M6MTQ6InVwYXppbGEtYWNjZXNzIjtpOjE4MztzOjExOiJ1cGF6aWxhLWFkZCI7aToxODQ7czoxMjoidXBhemlsYS1lZGl0IjtpOjE4NTtzOjE0OiJ1cGF6aWxhLWRlbGV0ZSI7aToxODY7czoxOToidXBhemlsYS1idWxrLWRlbGV0ZSI7aToxODc7czoxNDoidXBhemlsYS1yZXBvcnQiO2k6MTg4O3M6MTE6ImFyZWEtYWNjZXNzIjtpOjE4OTtzOjg6ImFyZWEtYWRkIjtpOjE5MDtzOjk6ImFyZWEtZWRpdCI7aToxOTE7czoxMToiYXJlYS1kZWxldGUiO2k6MTkyO3M6MTY6ImFyZWEtYnVsay1kZWxldGUiO2k6MTkzO3M6MTE6ImFyZWEtcmVwb3J0IjtpOjE5NDtzOjEwOiJhc20tYWNjZXNzIjtpOjE5NTtzOjc6ImFzbS1hZGQiO2k6MTk2O3M6ODoiYXNtLWVkaXQiO2k6MTk3O3M6ODoiYXNtLXZpZXciO2k6MTk4O3M6MTA6ImFzbS1kZWxldGUiO2k6MTk5O3M6MTU6ImFzbS1idWxrLWRlbGV0ZSI7aToyMDA7czoxMDoiYXNtLXJlcG9ydCI7aToyMDE7czo5OiJzci1hY2Nlc3MiO2k6MjAyO3M6Njoic3ItYWRkIjtpOjIwMztzOjc6InNyLWVkaXQiO2k6MjA0O3M6Nzoic3ItdmlldyI7aToyMDU7czo5OiJzci1kZWxldGUiO2k6MjA2O3M6MTQ6InNyLWJ1bGstZGVsZXRlIjtpOjIwNztzOjk6InNyLXJlcG9ydCI7aToyMDg7czoyMDoicHJvZHVjdGlvbi1vcGVyYXRpb24iO2k6MjA5O3M6MTk6InByb2R1Y3Rpb24tdHJhbnNmZXIiO2k6MjEwO3M6MjA6InN1cHBsaWVyLWFkdmFuY2UtYWRkIjtpOjIxMTtzOjIxOiJzdXBwbGllci1hZHZhbmNlLWVkaXQiO2k6MjEyO3M6MjM6InN1cHBsaWVyLWFkdmFuY2UtZGVsZXRlIjtpOjIxMztzOjI4OiJzdXBwbGllci1hZHZhbmNlLWJ1bGstZGVsZXRlIjtpOjIxNDtzOjI0OiJzdXBwbGllci1hZHZhbmNlLWFwcHJvdmUiO2k6MjE1O3M6MTk6ImZpbmlzaC1nb29kcy1hY2Nlc3MiO2k6MjE2O3M6MjE6ImNsb3NpbmctcmVwb3J0LWFjY2VzcyI7aToyMTc7czoyNToidG9kYXktc2FsZXMtcmVwb3J0LWFjY2VzcyI7aToyMTg7czoxOToic2FsZXMtcmVwb3J0LWFjY2VzcyI7aToyMTk7czozMDoidG9kYXlzLWN1c3RvbWVyLXJlY2VpcHQtYWNjZXNzIjtpOjIyMDtzOjI4OiJjdXN0b21lci1yZWNlaXB0LWxpc3QtYWNjZXNzIjtpOjIyMTtzOjMzOiJzYWxlc21hbi13aXNlLXNhbGVzLXJlcG9ydC1hY2Nlc3MiO2k6MjIyO3M6MjQ6ImNvbGxlY3Rpb24tcmVwb3J0LWFjY2VzcyI7aToyMjM7czozNDoibWF0ZXJpYWwtc3RvY2stYWxlcnQtcmVwb3J0LWFjY2VzcyI7aToyMjQ7czoyMDoiZGViaXQtdm91Y2hlci1hY2Nlc3MiO2k6MjI1O3M6MjE6ImNyZWRpdC12b3VjaGVyLWFjY2VzcyI7aToyMjY7czoyMDoiY3VzdG9tZXItYWR2YW5jZS1hZGQiO2k6MjI3O3M6MjE6ImN1c3RvbWVyLWFkdmFuY2UtZWRpdCI7aToyMjg7czoyMzoiY3VzdG9tZXItYWR2YW5jZS1kZWxldGUiO2k6MjI5O3M6MjA6ImJhbGFuY2Utc2hlZXQtYWNjZXNzIjtpOjIzMDtzOjEzOiJjdXN0b21lci1lZGl0IjtpOjIzMTtzOjEzOiJjdXN0b21lci12aWV3IjtpOjIzMjtzOjE3OiJkZWJpdC12b3VjaGVyLWFkZCI7aToyMzM7czoxODoiY3JlZGl0LXZvdWNoZXItYWRkIjtpOjIzNDtzOjE1OiJjdXN0b21lci1kZWxldGUiO2k6MjM1O3M6MTE6InNhbGUtYWNjZXNzIjtpOjIzNjtzOjg6InNhbGUtYWRkIjtpOjIzNztzOjk6InNhbGUtZWRpdCI7aToyMzg7czo5OiJzYWxlLXZpZXciO2k6MjM5O3M6MTE6InNhbGUtZGVsZXRlIjtpOjI0MDtzOjE2OiJzYWxlLWJ1bGstZGVsZXRlIjtpOjI0MTtzOjE4OiJzYWxlLXJldHVybi1hY2Nlc3MiO2k6MjQyO3M6MTU6InNhbGUtcmV0dXJuLWFkZCI7aToyNDM7czoxNjoic2FsZS1yZXR1cm4tdmlldyI7aToyNDQ7czoxODoic2FsZS1yZXR1cm4tZGVsZXRlIjtpOjI0NTtzOjI3OiJzci1jb21taXNzaW9uLXJlcG9ydC1hY2Nlc3MiO2k6MjQ2O3M6MzM6InByb2R1Y3Qtc3RvY2stYWxlcnQtcmVwb3J0LWFjY2VzcyI7aToyNDc7czoyMzoic2FsZXNtZW4tcGF5bWVudC1hY2Nlc3MiO2k6MjQ4O3M6MjI6InNhbGVzbWVuLWxlZGdlci1hY2Nlc3MiO2k6MjQ5O3M6MTM6ImRhbWFnZS1hY2Nlc3MiO2k6MjUwO3M6MTA6ImRhbWFnZS1hZGQiO2k6MjUxO3M6Mjg6Im1hdGVyaWFsLXN0b2NrLWxlZGdlci1hY2Nlc3MiO2k6MjUyO3M6MzE6Im1hdGVyaWFsLXN0b2NrLWxlZGdlci1jb3N0LXZpZXciO2k6MjUzO3M6MjE6InByb2R1Y3QtbGVkZ2VyLWFjY2VzcyI7aToyNTQ7czozMToicHJvZHVjdC1zdG9jay1sZWRnZXItcHJpY2UtdmlldyI7aToyNTU7czoxODoiZGViaXQtdm91Y2hlci12aWV3IjtpOjI1NjtzOjIwOiJkZWJpdC12b3VjaGVyLWRlbGV0ZSI7aToyNTc7czoxOToiY3JlZGl0LXZvdWNoZXItdmlldyI7aToyNTg7czoyMToiY3JlZGl0LXZvdWNoZXItZGVsZXRlIjtpOjI1OTtzOjIwOiJwdXJjaGFzZS1wYXltZW50LWFkZCI7aToyNjA7czoyMToicHVyY2hhc2UtcGF5bWVudC1lZGl0IjtpOjI2MTtzOjIxOiJwdXJjaGFzZS1wYXltZW50LXZpZXciO2k6MjYyO3M6MjM6InB1cmNoYXNlLXBheW1lbnQtZGVsZXRlIjtpOjI2MztzOjE0OiJjbG9zaW5nLWFjY2VzcyI7aToyNjQ7czoxMToiY2xvc2luZy1hZGQiO2k6MjY1O3M6MTI6ImNsb3NpbmctdmlldyI7aToyNjY7czoxNDoiY2xvc2luZy1kZWxldGUiO2k6MjY3O3M6MjU6InRyYW5zZmVyLWludmVudG9yeS1hY2Nlc3MiO2k6MjY4O3M6MjI6InRyYW5zZmVyLWludmVudG9yeS1hZGQiO2k6MjY5O3M6MjM6InRyYW5zZmVyLWludmVudG9yeS1lZGl0IjtpOjI3MDtzOjIzOiJ0cmFuc2Zlci1pbnZlbnRvcnktdmlldyI7aToyNzE7czoyNToidHJhbnNmZXItaW52ZW50b3J5LWRlbGV0ZSI7aToyNzI7czozMDoidHJhbnNmZXItaW52ZW50b3J5LWJ1bGstZGVsZXRlIjtpOjI3MztzOjEzOiJkZWFsZXItYWNjZXNzIjtpOjI3NDtzOjEwOiJkZWFsZXItYWRkIjtpOjI3NTtzOjExOiJkZWFsZXItZWRpdCI7aToyNzY7czoxMToiZGVhbGVyLXZpZXciO2k6Mjc3O3M6MTM6ImRlYWxlci1kZWxldGUiO2k6Mjc4O3M6MTg6ImRlYWxlci1idWxrLWRlbGV0ZSI7aToyNzk7czoyMDoiZGVhbGVyLWxlZGdlci1hY2Nlc3MiO2k6MjgwO3M6MjE6ImRlYWxlci1hZHZhbmNlLWFjY2VzcyI7aToyODE7czoxODoiZGVhbGVyLWFkdmFuY2UtYWRkIjtpOjI4MjtzOjE5OiJkZWFsZXItYWR2YW5jZS1lZGl0IjtpOjI4MztzOjIxOiJkZWFsZXItYWR2YW5jZS1kZWxldGUiO2k6Mjg0O3M6MjY6ImRlYWxlci1hZHZhbmNlLWJ1bGstZGVsZXRlIjtpOjI4NTtzOjI0OiJzci1tb250aGx5LXRhcmdldC1hY2Nlc3MiO2k6Mjg2O3M6MjE6InNyLW1vbnRobHktdGFyZ2V0LWFkZCI7aToyODc7czoyMjoic3ItbW9udGhseS10YXJnZXQtZWRpdCI7aToyODg7czoyNDoic3ItbW9udGhseS10YXJnZXQtZGVsZXRlIjtpOjI4OTtzOjI5OiJzci1tb250aGx5LXRhcmdldC1idWxrLWRlbGV0ZSI7aToyOTA7czoyNDoic3ItcHJvZHVjdC10YXJnZXQtYWNjZXNzIjtpOjI5MTtzOjIxOiJzci1wcm9kdWN0LXRhcmdldC1hZGQiO2k6MjkyO3M6MjI6InNyLXByb2R1Y3QtdGFyZ2V0LWVkaXQiO2k6MjkzO3M6MjQ6InNyLXByb2R1Y3QtdGFyZ2V0LWRlbGV0ZSI7aToyOTQ7czoyODoic3ItcHJvZHVjdC1jb21taXNzaW9uLWFjY2VzcyI7aToyOTU7czoyNToic3ItcHJvZHVjdC1jb21taXNzaW9uLWFkZCI7aToyOTY7czoyNjoic3ItcHJvZHVjdC1jb21taXNzaW9uLWVkaXQiO2k6Mjk3O3M6Mjg6InNyLXByb2R1Y3QtY29tbWlzc2lvbi1kZWxldGUiO2k6Mjk4O3M6MjY6InNyLXByb2R1Y3QtY29tbWlzc2lvbi12aWV3IjtpOjI5OTtzOjEwOiJhc20tYWNjZXNzIjtpOjMwMDtzOjc6ImFzbS1hZGQiO2k6MzAxO3M6ODoiYXNtLWVkaXQiO2k6MzAyO3M6MTA6ImFzbS1kZWxldGUiO2k6MzAzO3M6ODoiYXNtLXNob3ciO2k6MzA0O3M6MjU6ImFzbS1tb250aGx5LXRhcmdldC1hY2Nlc3MiO2k6MzA1O3M6MjI6ImFzbS1tb250aGx5LXRhcmdldC1hZGQiO2k6MzA2O3M6MjM6ImFzbS1tb250aGx5LXRhcmdldC1lZGl0IjtpOjMwNztzOjI1OiJhc20tbW9udGhseS10YXJnZXQtZGVsZXRlIjtpOjMwODtzOjIzOiJhc20tbW9udGhseS10YXJnZXQtdmlldyI7aTozMDk7czoxODoic2FsZS1zdGF0dXMtY2hhbmdlIjtpOjMxMDtzOjIxOiJzYWxlLXByb2R1Y3QtZGVsaXZlcnkiO2k6MzExO3M6MTg6ImRlYWxlci1zYWxlLWFjY2VzcyI7aTozMTI7czoxNToiZGVhbGVyLXNhbGUtYWRkIjtpOjMxMztzOjE2OiJkZWFsZXItc2FsZS1lZGl0IjtpOjMxNDtzOjE2OiJkZWFsZXItc2FsZS12aWV3IjtpOjMxNTtzOjE4OiJkZWFsZXItc2FsZS1kZWxldGUiO2k6MzE2O3M6MjU6ImRlYWxlci1zYWxlLXN0YXR1cy1jaGFuZ2UiO2k6MzE3O3M6Mjg6ImRlYWxlci1zYWxlLXByb2R1Y3QtZGVsaXZlcnkiO2k6MzE4O3M6MjA6ImN1c3RvbWVyLXJlY2VpdmUtYWRkIjtpOjMxOTtzOjIzOiJjdXN0b21lci1yZWNlaXZlLWRlbGV0ZSI7aTozMjA7czoyNDoiY3VzdG9tZXItcmVjZWl2ZS1kZXRhaWxzIjtpOjMyMTtzOjIzOiJzdXBwbGllci1wYXltZW50LWNyZWF0ZSI7aTozMjI7czoyNDoic3VwcGxpZXItcGF5bWVudC1kZXRhaWxzIjtpOjMyMztzOjIzOiJzdXBwbGllci1wYXltZW50LWRlbGV0ZSI7aTozMjQ7czoyMDoic2FsZXNtZW4tcGF5bWVudC1hZGQiO2k6MzI1O3M6MjQ6InNhbGVzbWVuLXBheW1lbnQtZGV0YWlscyI7aTozMjY7czoyMzoic2FsZXNtZW4tcGF5bWVudC1kZWxldGUiO2k6MzI3O3M6MjI6InB1cmNoYXNlLWNoYW5nZS1zdGF0dXMiO2k6MzI4O3M6MTY6InNyLXNhbGFyeS1hY2Nlc3MiO2k6MzI5O3M6MTM6InNyLXNhbGFyeS1hZGQiO2k6MzMwO3M6MTQ6InNyLXNhbGFyeS1lZGl0IjtpOjMzMTtzOjIzOiJzci1zYWxhcnktc3RhdHVzLWNoYW5nZSI7aTozMzI7czoxNjoic3Itc2FsYXJ5LWRlbGV0ZSI7aTozMzM7czoxNzoiYXNtLXNhbGFyeS1hY2Nlc3MiO2k6MzM0O3M6MTQ6ImFzbS1zYWxhcnktYWRkIjtpOjMzNTtzOjE1OiJhc20tc2FsYXJ5LWVkaXQiO2k6MzM2O3M6MjQ6ImFzbS1zYWxhcnktc3RhdHVzLWNoYW5nZSI7aTozMzc7czoxNzoiYXNtLXNhbGFyeS1kZWxldGUiO2k6MzM4O3M6MjI6ImxvYW4tY2F0ZWdvcmllcy1hY2Nlc3MiO2k6MzM5O3M6Mjg6ImxvYW4tY2F0ZWdvcmllcy1zdG9yZS11cGRhdGUiO2k6MzQwO3M6MjA6ImxvYW4tY2F0ZWdvcmllcy1lZGl0IjtpOjM0MTtzOjIyOiJsb2FuLWNhdGVnb3JpZXMtZGVsZXRlIjtpOjM0MjtzOjExOiJsb2FuLWFjY2VzcyI7aTozNDM7czo4OiJsb2FuLWFkZCI7aTozNDQ7czo5OiJsb2FuLWVkaXQiO2k6MzQ1O3M6MTE6ImxvYW4tZGVsZXRlIjtpOjM0NjtzOjk6ImxvYW4tdmlldyI7aTozNDc7czoxODoibG9hbi1zdGF0dXMtY2hhbmdlIjtpOjM0ODtzOjE3OiJkZXBhcnRtZW50LXJlcG9ydCI7aTozNDk7czoyMjoiZGVwYXJ0bWVudC1idWxrLWRlbGV0ZSI7aTozNTA7czoxNzoiZGVwYXJ0bWVudC1kZWxldGUiO2k6MzUxO3M6MTU6ImRlcGFydG1lbnQtZWRpdCI7aTozNTI7czoxNDoiZGVwYXJ0bWVudC1hZGQiO2k6MzUzO3M6MTc6ImRlcGFydG1lbnQtYWNjZXNzIjtpOjM1NDtzOjE1OiJkaXZpc2lvbi1yZXBvcnQiO2k6MzU1O3M6MjA6ImRpdmlzaW9uLWJ1bGstZGVsZXRlIjtpOjM1NjtzOjE1OiJkaXZpc2lvbi1kZWxldGUiO2k6MzU3O3M6MTM6ImRpdmlzaW9uLWVkaXQiO2k6MzU4O3M6MTI6ImRpdmlzaW9uLWFkZCI7aTozNTk7czoxNToiZGl2aXNpb24tYWNjZXNzIjtpOjM2MDtzOjE4OiJkZXNpZ25hdGlvbi1yZXBvcnQiO2k6MzYxO3M6MjM6ImRlc2lnbmF0aW9uLWJ1bGstZGVsZXRlIjtpOjM2MjtzOjE4OiJkZXNpZ25hdGlvbi1kZWxldGUiO2k6MzYzO3M6MTY6ImRlc2lnbmF0aW9uLWVkaXQiO2k6MzY0O3M6MTU6ImRlc2lnbmF0aW9uLWFkZCI7aTozNjU7czoxODoiZGVzaWduYXRpb24tYWNjZXNzIjtpOjM2NjtzOjE1OiJlbXBsb3llZS1yZXBvcnQiO2k6MzY3O3M6MjA6ImVtcGxveWVlLWJ1bGstZGVsZXRlIjtpOjM2ODtzOjE1OiJlbXBsb3llZS1kZWxldGUiO2k6MzY5O3M6MTM6ImVtcGxveWVlLXZpZXciO2k6MzcwO3M6MTM6ImVtcGxveWVlLWVkaXQiO2k6MzcxO3M6MTI6ImVtcGxveWVlLWFkZCI7aTozNzI7czoxNToiZW1wbG95ZWUtYWNjZXNzIjtpOjM3MztzOjIxOiJlbXBsb3llZS1zaGlmdC1jaGFuZ2UiO2k6Mzc0O3M6MTk6InNoaWZ0LW1hbmFnZS1yZXBvcnQiO2k6Mzc1O3M6MjQ6InNoaWZ0LW1hbmFnZS1idWxrLWRlbGV0ZSI7aTozNzY7czoxOToic2hpZnQtbWFuYWdlLWRlbGV0ZSI7aTozNzc7czoxNzoic2hpZnQtbWFuYWdlLWVkaXQiO2k6Mzc4O3M6MTY6InNoaWZ0LW1hbmFnZS1hZGQiO2k6Mzc5O3M6MTk6InNoaWZ0LW1hbmFnZS1hY2Nlc3MiO2k6MzgwO3M6MTI6InNoaWZ0LXJlcG9ydCI7aTozODE7czoxNzoic2hpZnQtYnVsay1kZWxldGUiO2k6MzgyO3M6MTI6InNoaWZ0LWRlbGV0ZSI7aTozODM7czoxMDoic2hpZnQtZWRpdCI7aTozODQ7czo5OiJzaGlmdC1hZGQiO2k6Mzg1O3M6MTI6InNoaWZ0LWFjY2VzcyI7aTozODY7czoxNzoiYXR0ZW5kYW5jZS1yZXBvcnQiO2k6Mzg3O3M6MjI6ImF0dGVuZGFuY2UtYnVsay1kZWxldGUiO2k6Mzg4O3M6MTc6ImF0dGVuZGFuY2UtZGVsZXRlIjtpOjM4OTtzOjE1OiJhdHRlbmRhbmNlLWVkaXQiO2k6MzkwO3M6MTQ6ImF0dGVuZGFuY2UtYWRkIjtpOjM5MTtzOjE3OiJhdHRlbmRhbmNlLWFjY2VzcyI7aTozOTI7czoyNDoiYXR0ZW5kYW5jZS1yZXBvcnQtYWNjZXNzIjtpOjM5MztzOjIxOiJ3ZWVrbHktaG9saWRheS1yZXBvcnQiO2k6Mzk0O3M6MjY6IndlZWtseS1ob2xpZGF5LWJ1bGstZGVsZXRlIjtpOjM5NTtzOjIxOiJ3ZWVrbHktaG9saWRheS1kZWxldGUiO2k6Mzk2O3M6MTk6IndlZWtseS1ob2xpZGF5LWVkaXQiO2k6Mzk3O3M6MTg6IndlZWtseS1ob2xpZGF5LWFkZCI7aTozOTg7czoyMToid2Vla2x5LWhvbGlkYXktYWNjZXNzIjtpOjM5OTtzOjE0OiJob2xpZGF5LXJlcG9ydCI7aTo0MDA7czoxOToiaG9saWRheS1idWxrLWRlbGV0ZSI7aTo0MDE7czoxNDoiaG9saWRheS1kZWxldGUiO2k6NDAyO3M6MTI6ImhvbGlkYXktZWRpdCI7aTo0MDM7czoxMToiaG9saWRheS1hZGQiO2k6NDA0O3M6MTQ6ImhvbGlkYXktYWNjZXNzIjtpOjQwNTtzOjE3OiJsZWF2ZS10eXBlLXJlcG9ydCI7aTo0MDY7czoyMjoibGVhdmUtdHlwZS1idWxrLWRlbGV0ZSI7aTo0MDc7czoxNzoibGVhdmUtdHlwZS1kZWxldGUiO2k6NDA4O3M6MTU6ImxlYXZlLXR5cGUtZWRpdCI7aTo0MDk7czoxNDoibGVhdmUtdHlwZS1hZGQiO2k6NDEwO3M6MTc6ImxlYXZlLXR5cGUtYWNjZXNzIjtpOjQxMTtzOjI1OiJsZWF2ZS1hcHBsaWNhdGlvbi1hcHByb3ZlIjtpOjQxMjtzOjI0OiJsZWF2ZS1hcHBsaWNhdGlvbi1yZXBvcnQiO2k6NDEzO3M6Mjk6ImxlYXZlLWFwcGxpY2F0aW9uLWJ1bGstZGVsZXRlIjtpOjQxNDtzOjI0OiJsZWF2ZS1hcHBsaWNhdGlvbi1kZWxldGUiO2k6NDE1O3M6MjI6ImxlYXZlLWFwcGxpY2F0aW9uLWVkaXQiO2k6NDE2O3M6MjE6ImxlYXZlLWFwcGxpY2F0aW9uLWFkZCI7aTo0MTc7czoyNDoibGVhdmUtYXBwbGljYXRpb24tYWNjZXNzIjt9czo5OiJ1c2VyX21lbnUiO086MjY6IlR5cGlDTVNcTmVzdGFibGVDb2xsZWN0aW9uIjo4OntzOjg6IgAqAHRvdGFsIjtpOjI5O3M6MTU6IgAqAHBhcmVudENvbHVtbiI7czo5OiJwYXJlbnRfaWQiO3M6MzM6IgAqAHJlbW92ZUl0ZW1zV2l0aE1pc3NpbmdBbmNlc3RvciI7YjoxO3M6MTQ6IgAqAGluZGVudENoYXJzIjtzOjg6IsKgwqDCoMKgIjtzOjE1OiIAKgBjaGlsZHJlbk5hbWUiO3M6NToiaXRlbXMiO3M6MTc6IgAqAHBhcmVudFJlbGF0aW9uIjtzOjY6InBhcmVudCI7czo4OiIA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ZXlUeXBlIjtzOjM6ImludCI7czoxMjoiaW5jcmVtZW50aW5nIjtiOjE7czo3OiIAKgB3aXRoIjthOjA6e31zOjEyOiIAKgB3aXRoQ291bnQiO2E6MDp7fXM6MTk6InByZXZlbnRzTGF6eUxvYWRpbmciO2I6MDtzOjEwOiIAKgBwZXJQYWdlIjtpOjE1O3M6NjoiZXhpc3RzIjtiOjE7czoxODoid2FzUmVjZW50bHlDcmVhdGVkIjtiOjA7czoyODoiACoAZXNjYXBlV2hlbkNhc3RpbmdUb1N0cmluZyI7YjowO3M6MTM6IgAqAGF0dHJpYnV0ZXMiO2E6MTI6e3M6MjoiaWQiO2k6OTE7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtzOjE6IjIiO3M6MTE6Im1vZHVsZV9uYW1lIjtzOjE2OiJNb2JpbGUgQmFuayBCb29rIjtzOjEzOiJkaXZpZGVyX3RpdGxlIjtOO3M6MTA6Imljb25fY2xhc3MiO047czozOiJ1cmwiO3M6MTY6Im1vYmlsZS1iYW5rLWJvb2siO3M6NToib3JkZXIiO2k6NDtzOjk6InBhcmVudF9pZCI7aTo4NztzOjY6InRhcmdldCI7TjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDIxLTAzLTI3IDAxOjAwOjAwIjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDIxLTAzLTI3IDAxOjAxOjQxIjt9czoxMToiACoAb3JpZ2luYWwiO2E6MTI6e3M6MjoiaWQiO2k6OTE7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtzOjE6IjIiO3M6MTE6Im1vZHVsZV9uYW1lIjtzOjE2OiJNb2JpbGUgQmFuayBCb29rIjtzOjEzOiJkaXZpZGVyX3RpdGxlIjtOO3M6MTA6Imljb25fY2xhc3MiO047czozOiJ1cmwiO3M6MTY6Im1vYmlsZS1iYW5rLWJvb2siO3M6NToib3JkZXIiO2k6NDtzOjk6InBhcmVudF9pZCI7aTo4NztzOjY6InRhcmdldCI7TjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDIxLTAzLTI3IDAxOjAwOjAwIjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDIxLTAzLTI3IDAx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VHlwZSI7czozOiJpbnQiO3M6MTI6ImluY3JlbWVudGluZyI7YjoxO3M6NzoiACoAd2l0aCI7YTowOnt9czoxMjoiACoAd2l0aENvdW50IjthOjA6e31zOjE5OiJwcmV2ZW50c0xhenlMb2FkaW5nIjtiOjA7czoxMDoiACoAcGVyUGFnZSI7aToxNTtzOjY6ImV4aXN0cyI7YjoxO3M6MTg6Indhc1JlY2VudGx5Q3JlYXRlZCI7YjowO3M6Mjg6IgAqAGVzY2FwZVdoZW5DYXN0aW5nVG9TdHJpbmciO2I6MDtzOjEzOiIAKgBhdHRyaWJ1dGVzIjthOjEyOntzOjI6ImlkIjtpOjIzMztzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO3M6MToiMiI7czoxMToibW9kdWxlX25hbWUiO3M6MTM6IkJhbGFuY2UgU2hlZXQiO3M6MTM6ImRpdmlkZXJfdGl0bGUiO047czoxMDoiaWNvbl9jbGFzcyI7TjtzOjM6InVybCI7czoxMzoiYmFsYW5jZS1zaGVldCI7czo1OiJvcmRlciI7aTo5O3M6OToicGFyZW50X2lkIjtpOjg3O3M6NjoidGFyZ2V0IjtzOjU6Il9zZWxmIjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDIxLTA5LTEzIDExOjIxOjQ5IjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDIxLTA5LTEzIDExOjIyOjA0Ijt9czoxMToiACoAb3JpZ2luYWwiO2E6MTI6e3M6MjoiaWQiO2k6MjMzO3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7czoxOiIyIjtzOjExOiJtb2R1bGVfbmFtZSI7czoxMzoiQmFsYW5jZSBTaGVldCI7czoxMzoiZGl2aWRlcl90aXRsZSI7TjtzOjEwOiJpY29uX2NsYXNzIjtOO3M6MzoidXJsIjtzOjEzOiJiYWxhbmNlLXNoZWV0IjtzOjU6Im9yZGVyIjtpOjk7czo5OiJwYXJlbnRfaWQiO2k6ODc7czo2OiJ0YXJnZXQiO3M6NToiX3NlbGYiO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjEtMDktMTMgMTE6MjE6NDkiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjEt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ACoAa2V5VHlwZSI7czozOiJpbnQiO3M6MTI6ImluY3JlbWVudGluZyI7YjoxO3M6NzoiACoAd2l0aCI7YTowOnt9czoxMjoiACoAd2l0aENvdW50IjthOjA6e31zOjE5OiJwcmV2ZW50c0xhenlMb2FkaW5nIjtiOjA7czoxMDoiACoAcGVyUGFnZSI7aToxNTtzOjY6ImV4aXN0cyI7YjoxO3M6MTg6Indhc1JlY2VudGx5Q3JlYXRlZCI7YjowO3M6Mjg6IgAqAGVzY2FwZVdoZW5DYXN0aW5nVG9TdHJpbmciO2I6MDtzOjEzOiIAKgBhdHRyaWJ1dGVzIjthOjEyOntzOjI6ImlkIjtpOjY0O3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7czoxOiIyIjtzOjExOiJtb2R1bGVfbmFtZSI7czoxNjoiQmFuayBUcmFuc2FjdGlvbiI7czoxMzoiZGl2aWRlcl90aXRsZSI7TjtzOjEwOiJpY29uX2NsYXNzIjtOO3M6MzoidXJsIjtzOjE2OiJiYW5rLXRyYW5zYWN0aW9uIjtzOjU6Im9yZGVyIjtpOjI7czo5OiJwYXJlbnRfaWQiO2k6NjI7czo2OiJ0YXJnZXQiO047czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyMS0wNy0xMyAxNDoxNzo1MCI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyMS0wNy0xMyAxNDoxODoyMyI7fXM6MTE6IgAqAG9yaWdpbmFsIjthOjEyOntzOjI6ImlkIjtpOjY0O3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7czoxOiIyIjtzOjExOiJtb2R1bGVfbmFtZSI7czoxNjoiQmFuayBUcmFuc2FjdGlvbiI7czoxMzoiZGl2aWRlcl90aXRsZSI7TjtzOjEwOiJpY29uX2NsYXNzIjtOO3M6MzoidXJsIjtzOjE2OiJiYW5rLXRyYW5zYWN0aW9uIjtzOjU6Im9yZGVyIjtpOjI7czo5OiJwYXJlbnRfaWQiO2k6NjI7czo2OiJ0YXJnZXQiO047czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyMS0wNy0xMyAxNDoxNzo1MCI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyMS0wNy0x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ACoAd2l0aCI7YTowOnt9czoxMjoiACoAd2l0aENvdW50IjthOjA6e31zOjE5OiJwcmV2ZW50c0xhenlMb2FkaW5nIjtiOjA7czoxMDoiACoAcGVyUGFnZSI7aToxNTtzOjY6ImV4aXN0cyI7YjoxO3M6MTg6Indhc1JlY2VudGx5Q3JlYXRlZCI7YjowO3M6Mjg6IgAqAGVzY2FwZVdoZW5DYXN0aW5nVG9TdHJpbmciO2I6MDtzOjEzOiIAKgBhdHRyaWJ1dGVzIjthOjEyOntzOjI6ImlkIjtpOjE5MztzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO3M6MToiMiI7czoxMToibW9kdWxlX25hbWUiO3M6MTc6IkNvbGxlY3Rpb24gUmVwb3J0IjtzOjEzOiJkaXZpZGVyX3RpdGxlIjtOO3M6MTA6Imljb25fY2xhc3MiO047czozOiJ1cmwiO3M6MTc6ImNvbGxlY3Rpb24tcmVwb3J0IjtzOjU6Im9yZGVyIjtpOjEyO3M6OToicGFyZW50X2lkIjtpOjE3OTtzOjY6InRhcmdldCI7czo1OiJfc2VsZiI7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyMS0wOS0wNiAxMDoxMzowOCI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyMi0xMC0yMyAxNjoxNDowNiI7fXM6MTE6IgAqAG9yaWdpbmFsIjthOjEyOntzOjI6ImlkIjtpOjE5MztzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO3M6MToiMiI7czoxMToibW9kdWxlX25hbWUiO3M6MTc6IkNvbGxlY3Rpb24gUmVwb3J0IjtzOjEzOiJkaXZpZGVyX3RpdGxlIjtOO3M6MTA6Imljb25fY2xhc3MiO047czozOiJ1cmwiO3M6MTc6ImNvbGxlY3Rpb24tcmVwb3J0IjtzOjU6Im9yZGVyIjtpOjEyO3M6OToicGFyZW50X2lkIjtpOjE3OTtzOjY6InRhcmdldCI7czo1OiJfc2VsZiI7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyMS0wOS0wNiAxMDoxMzowOCI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyMi0xMC0yMyAxNjoxNDowNiI7fXM6MTA6IgAq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', 1677924412);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES
(1, 'title', 'INSAF', NULL, NULL),
(2, 'email', 'mfbl2K20@gmail.com', NULL, NULL),
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
-- Table structure for table `shifts`
--

CREATE TABLE `shifts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `night_status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Day, 2=Night',
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `deletable` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=No, 2=Yes',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
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
(1, 'Rafiqul Islam Raton', 'Milon Oil Mills', '01711392747', 'milonaoac@gmail.com', 'Ullapara', '6760', 'Bankhua, Ullapara, Sirajganj', '1', 'Admin', 'Admin', '2022-12-07 13:25:40', '2022-12-07 14:28:20'),
(3, 'Md. Sumon (Lachcha)', 'Tonmoy Food Products', '01715745105', NULL, 'Bogura', NULL, 'Bagura', '1', 'Admin', 'Admin', '2022-12-07 13:33:05', '2022-12-07 15:09:43'),
(4, 'Md. Mamun', 'Premiaflex Plastic Ltd.', '8802-8878603-10', 'anisur@aci-bd.com', 'Tejgaon', '1208', '245 Tejgaon I/A, Dhaka-1208', '1', 'Admin', NULL, '2022-12-07 13:39:05', '2022-12-07 13:39:05'),
(5, 'Md. Mamun', 'Brather\'s Digital Packaging', '01712870237', 'brathersdigitalpackaging@gmail.com', 'Demra', '1360', '27, Paity Road, Demra, Dhaka-1360', '1', 'Admin', NULL, '2022-12-07 13:53:22', '2022-12-07 13:53:22'),
(6, 'Md. Mamun (New)', 'M/S Diganta Packaging Industries', '011000000001', NULL, 'Demra', '1360', 'Demra, Dhaka-1360', '1', 'Admin', NULL, '2022-12-07 13:55:47', '2022-12-07 13:55:47'),
(7, 'Md. Monir (Polycon)', 'Polycon Limited', '01718596611', NULL, 'Tejgaon', '1208', '19 (New), Tejgaon I/A, Dhaka-1208', '1', 'Admin', 'Admin', '2022-12-07 13:59:55', '2022-12-07 14:00:25'),
(8, 'Md. Munna (Jahanara Plastic)', 'Jahanara Plastic Products', '01674546330', 'jahanaraplastic@gmail.com', 'East Badda', '1212', '1869 East Badda, Gulshan, Dhaka-1212', '1', 'Admin', NULL, '2022-12-07 14:03:24', '2022-12-07 14:03:24'),
(9, 'Md. Nasir Khan (2L Container)', 'Md. Nasir Khan', '01818383543', NULL, 'Islambag', NULL, '56/4A, Sabera Begum Villa, West Islambag, Dhaka', '1', 'Admin', NULL, '2022-12-07 14:11:09', '2022-12-07 14:11:09'),
(10, 'Md. Mahbubur Rahman (PrintPlus)', 'Print Plus Enterprise', '01611030935', 'printplusent@gmail.com', 'Bangla Bazar', '100', '2/3, Paridas Road, Bangla Bazar, Dhaka-1100', '1', 'Admin', NULL, '2022-12-07 14:18:17', '2022-12-07 14:18:17'),
(11, 'Mr. Faruk', 'Aristo Corporation Ltd.', '01715279520', 'marketing@acl-cp.com', 'Banani', '1213', 'Plot # 76, Road # 12 & 17, Block E, Banani, Dhaka-1213', '1', 'Admin', NULL, '2022-12-07 14:23:24', '2022-12-07 14:23:24'),
(12, 'Md. Masum (Security Lock)', 'Masum Paper House', '01846207060', 'masumpaper@gmail.com', 'Armanitola', '1100', '104/1, K.P. Gosh Street, Armanitola, Dhaka-1100', '1', 'Admin', NULL, '2022-12-07 14:26:30', '2022-12-07 14:26:30'),
(13, 'Local Market', 'Local Market', '01000000000', NULL, 'Ullapara', '6760', 'Ullapara Bazar, Ullapara, Sirajganj', '1', 'Admin', NULL, '2022-12-07 14:28:05', '2022-12-07 14:28:05'),
(14, 'Md. Babu', 'M/S Daniesh Ali Tin Container Works', '01711054125', NULL, 'Kamrangir Char', '1211', '73, Takerhati, Nur Super Market, Kamrangir Char, Dhaka-1211', '1', 'Admin', NULL, '2022-12-07 14:31:57', '2022-12-07 14:31:57'),
(15, 'Sri Dev Dulal', 'M/S Priyal Traders', '01787680459', NULL, 'Dinajpur', NULL, 'Mirzapur Sadar, Dinajpur', '1', 'Admin', NULL, '2022-12-07 14:54:24', '2022-12-07 14:54:24');

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `chart_of_account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `warehouse_id` bigint(20) UNSIGNED DEFAULT NULL,
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
(1, 17, NULL, 'CH-011204220429', 'Inventory Transfer', '2022-12-01', 'Inventory transfer product damage cost 416', 0, 416, '2', '1', '1', 'Marjuk Nobi (Jitu)', NULL, '2022-12-01 21:09:22', '2022-12-01 21:09:22'),
(2, 313, 2, 'EXP-20221206123502503', 'Expense', '2022-12-02', 'Asset Expense EXP-20221206123502503', 3500, 0, '2', '1', '1', 'Admin', NULL, '2022-12-06 12:35:02', NULL),
(3, 23, 2, 'EXP-20221206123502503', 'Expense', '2022-12-02', 'Asset Expense EXP-20221206123502503', 0, 3500, '2', '1', '1', 'Admin', NULL, '2022-12-06 12:35:02', NULL),
(4, 10, 1, 'CH-061212221255', 'Inventory Transfer', '2022-12-06', 'Inventory transfer shipping cost 100', 100, 0, '2', '1', '1', 'Admin', NULL, '2022-12-06 13:03:03', '2022-12-06 13:03:03'),
(5, 276, NULL, '20003', 'INVOICE', '2022-12-01', 'Customer debit For Invoice No -  20003 Customer কামাল', 5900, 0, '2', '1', '1', 'Marjuk Nobi (Jitu)', NULL, '2022-12-06 13:16:36', NULL),
(6, 8, NULL, '20003', 'INVOICE', '2022-12-01', 'Sale Income For Invoice NO - 20003 Customer কামাল', 0, 5900, '2', '1', '1', 'Marjuk Nobi (Jitu)', NULL, '2022-12-06 13:16:36', NULL),
(7, 17, 2, '20003', 'INVOICE', '2022-12-01', 'Inventory Credit For Invoice No 20003', 0, 5900, '2', '1', '1', 'Marjuk Nobi (Jitu)', NULL, '2022-12-06 13:18:17', NULL),
(8, 276, 2, 'CR-221206701', 'CR', '2022-12-01', NULL, 0, 5000, '2', '1', '1', 'Marjuk Nobi (Jitu)', NULL, '2022-12-06 13:26:51', '2022-12-06 13:26:51'),
(9, 23, 2, 'CR-221206701', 'CR', '2022-12-01', 'Cash In Hand For কামাল', 5000, 0, '2', '1', '1', 'Marjuk Nobi (Jitu)', NULL, '2022-12-06 13:26:51', '2022-12-06 13:26:51'),
(10, 17, NULL, 'CH-071201220103', 'Inventory Transfer', '2022-12-07', 'Inventory transfer product damage cost 219.5', 0, 219.5, '2', '1', '1', 'Admin', NULL, '2022-12-07 13:06:22', '2022-12-07 13:06:22'),
(11, 325, 1, 'NB2S119SGM', 'PR Balance', '2022-12-07', 'Supplier credit For previous balance Rafiqul Islam Raton', 0, 4525430, '2', '1', '1', 'Admin', NULL, '2022-12-07 13:25:40', NULL),
(12, 17, 1, 'NB2S119SGM', 'PR Balance', '2022-12-07', 'Inventory debit for old purchase for Rafiqul Islam Raton', 4525430, 0, '2', '1', '1', 'Admin', NULL, '2022-12-07 13:25:40', NULL),
(15, 332, 1, '38D5GPCALY', 'PR Balance', '2022-12-07', 'Supplier credit For previous balance Md. Munna (Jahanara Plastic)', 0, 75403, '2', '1', '1', 'Admin', NULL, '2022-12-07 14:03:24', NULL),
(16, 17, 1, '38D5GPCALY', 'PR Balance', '2022-12-07', 'Inventory debit for old purchase for Md. Munna (Jahanara Plastic)', 75403, 0, '2', '1', '1', 'Admin', NULL, '2022-12-07 14:03:24', NULL),
(17, 334, 1, '3RSWL5NMDS', 'PR Balance', '2022-12-07', 'Supplier credit For previous balance Md. Mahbubur Rahman (PrintPlus)', 0, 134433, '2', '1', '1', 'Admin', NULL, '2022-12-07 14:18:17', NULL),
(18, 17, 1, '3RSWL5NMDS', 'PR Balance', '2022-12-07', 'Inventory debit for old purchase for Md. Mahbubur Rahman (PrintPlus)', 134433, 0, '2', '1', '1', 'Admin', NULL, '2022-12-07 14:18:17', NULL),
(19, 338, 1, 'LAI16NDM63', 'PR Balance', '2022-12-07', 'Supplier credit For previous balance Md. Babu', 0, 149475, '2', '1', '1', 'Admin', NULL, '2022-12-07 14:31:57', NULL),
(20, 17, 1, 'LAI16NDM63', 'PR Balance', '2022-12-07', 'Inventory debit for old purchase for Md. Babu', 149475, 0, '2', '1', '1', 'Admin', NULL, '2022-12-07 14:31:57', NULL),
(21, 339, 1, 'O3ZBX7T4ZL', 'PR Balance', '2022-12-07', 'Supplier credit For previous balance Sri Dev Dulal', 0, 125905, '2', '1', '1', 'Admin', NULL, '2022-12-07 14:54:24', NULL),
(22, 17, 1, 'O3ZBX7T4ZL', 'PR Balance', '2022-12-07', 'Inventory debit for old purchase for Sri Dev Dulal', 125905, 0, '2', '1', '1', 'Admin', NULL, '2022-12-07 14:54:24', NULL),
(23, 251, 1, 'PINV-1001', 'Purchase', '2022-11-15', 'SupplierMd. Sumon (Lachcha)', 0, 245500, '2', '1', '1', 'Admin', NULL, '2022-12-07 15:22:24', NULL),
(24, 17, 1, 'PINV-1001', 'Purchase', '2022-11-15', 'Inventory Debit For Supplier Md. Sumon (Lachcha)', 245500, 0, '2', '1', '1', 'Admin', NULL, '2022-12-07 15:22:24', NULL),
(25, 1, 1, 'PINV-1001', 'Purchase', '2022-11-15', 'Company Credit For Supplier Md. Sumon (Lachcha)', 245500, 0, '2', '1', '', 'Admin', NULL, '2022-12-07 15:22:24', NULL),
(26, 251, 1, 'PINV-1001', 'Purchase', '2022-11-15', 'SupplierMd. Sumon (Lachcha)', 245500, 0, '2', '1', '1', 'Admin', NULL, '2022-12-07 15:22:24', '2022-12-07 15:22:24'),
(27, 23, 1, 'PINV-1001', 'Purchase', '2022-11-15', 'Paid amount for SupplierMd. Sumon (Lachcha)', 245500, 0, '2', '1', '1', 'Admin', NULL, '2022-12-07 15:22:24', '2022-12-07 15:22:24'),
(28, 249, 1, 'PINV-1002', 'Purchase', '2022-12-07', 'SupplierRafiqul Islam Raton', 0, 23400, '2', '1', '1', 'Admin', NULL, '2022-12-07 15:41:48', NULL),
(29, 17, 1, 'PINV-1002', 'Purchase', '2022-12-07', 'Inventory Debit For Supplier Rafiqul Islam Raton', 23400, 0, '2', '1', '1', 'Admin', NULL, '2022-12-07 15:41:48', NULL),
(30, 1, 1, 'PINV-1002', 'Purchase', '2022-12-07', 'Company Credit For Supplier Rafiqul Islam Raton', 23400, 0, '2', '1', '', 'Admin', NULL, '2022-12-07 15:41:48', NULL),
(31, 249, 1, 'PINV-1003', 'Purchase', '2022-12-06', 'SupplierRafiqul Islam Raton', 0, 298116, '2', '1', '1', 'Admin', NULL, '2022-12-07 15:44:11', NULL),
(32, 17, 1, 'PINV-1003', 'Purchase', '2022-12-06', 'Inventory Debit For Supplier Rafiqul Islam Raton', 298116, 0, '2', '1', '1', 'Admin', NULL, '2022-12-07 15:44:11', NULL),
(33, 1, 1, 'PINV-1003', 'Purchase', '2022-12-06', 'Company Credit For Supplier Rafiqul Islam Raton', 298116, 0, '2', '1', '', 'Admin', NULL, '2022-12-07 15:44:11', NULL),
(34, 249, 1, 'PINV-1004', 'Purchase', '2022-12-07', 'SupplierRafiqul Islam Raton', 0, 6630, '2', '1', '1', 'Admin', NULL, '2022-12-07 15:46:01', NULL),
(35, 17, 1, 'PINV-1004', 'Purchase', '2022-12-07', 'Inventory Debit For Supplier Rafiqul Islam Raton', 6630, 0, '2', '1', '1', 'Admin', NULL, '2022-12-07 15:46:01', NULL),
(36, 1, 1, 'PINV-1004', 'Purchase', '2022-12-07', 'Company Credit For Supplier Rafiqul Islam Raton', 6630, 0, '2', '1', '', 'Admin', NULL, '2022-12-07 15:46:01', NULL),
(37, 340, 2, 'EXP-20221207163507543', 'Expense', '2022-12-06', 'Product Received Cost (Labour Cost) Expense EXP-20221207163507543', 2300, 0, '2', '1', '1', 'Admin', NULL, '2022-12-07 16:35:07', NULL),
(38, 23, 2, 'EXP-20221207163507543', 'Expense', '2022-12-06', 'Product Received Cost (Labour Cost) Expense EXP-20221207163507543', 0, 2300, '2', '1', '1', 'Admin', NULL, '2022-12-07 16:35:07', NULL),
(39, 314, NULL, '14744', 'INVOICE', '2022-12-01', 'Customer debit For Invoice No -  14744 Customer Fahim (ফাহিম)', 1875, 0, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-11 17:08:27', NULL),
(40, 8, NULL, '14744', 'INVOICE', '2022-12-01', 'Sale Income For Invoice NO - 14744 Customer Fahim (ফাহিম)', 0, 1875, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-11 17:08:27', NULL),
(41, 17, 2, '14744', 'INVOICE', '2022-12-01', 'Inventory Credit For Invoice No 14744', 0, 1875, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-11 17:09:20', NULL),
(42, 314, 2, 'CR-221212868', 'CR', '2022-12-12', 'Full Paid', 0, 1875, '2', '1', '1', 'Admin', NULL, '2022-12-12 11:15:52', '2022-12-12 11:15:52'),
(43, 23, 2, 'CR-221212868', 'CR', '2022-12-12', 'Cash In Hand For Fahim (ফাহিম)', 1875, 0, '2', '1', '1', 'Admin', NULL, '2022-12-12 11:15:52', '2022-12-12 11:15:52'),
(44, 276, 2, 'CR-221212921', 'CR', '2022-12-12', 'Full Paid', 0, 900, '2', '1', '1', 'Admin', NULL, '2022-12-12 11:16:45', '2022-12-12 11:16:45'),
(45, 23, 2, 'CR-221212921', 'CR', '2022-12-12', 'Cash In Hand For Kamal - কামাল', 900, 0, '2', '1', '1', 'Admin', NULL, '2022-12-12 11:16:45', '2022-12-12 11:16:45'),
(46, 315, NULL, '14745', 'INVOICE', '2022-12-01', 'Customer debit For Invoice No -  14745 Customer Mohashin( মহাসিন )', 510, 0, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 11:42:51', NULL),
(47, 8, NULL, '14745', 'INVOICE', '2022-12-01', 'Sale Income For Invoice NO - 14745 Customer Mohashin( মহাসিন )', 0, 510, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 11:42:51', NULL),
(48, 17, 1, '14745', 'INVOICE', '2022-12-01', 'Inventory Credit For Invoice No 14745', 0, 510, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 11:56:28', NULL),
(49, 315, 2, 'CR-221212638', 'CR', '2022-12-12', 'Full Paid', 0, 510, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 11:59:10', '2022-12-12 11:59:10'),
(50, 23, 2, 'CR-221212638', 'CR', '2022-12-12', 'Cash In Hand For Mohashin( মহাসিন )', 510, 0, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 11:59:10', '2022-12-12 11:59:10'),
(51, 318, NULL, '14749', 'INVOICE', '2022-12-01', 'Customer debit For Invoice No -  14749 Customer Bornoful( বনফুল )', 360, 0, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 12:01:32', NULL),
(52, 8, NULL, '14749', 'INVOICE', '2022-12-01', 'Sale Income For Invoice NO - 14749 Customer Bornoful( বনফুল )', 0, 360, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 12:01:32', NULL),
(53, 17, 2, '14749', 'INVOICE', '2022-12-01', 'Inventory Credit For Invoice No 14749', 0, 360, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 12:02:05', NULL),
(54, 318, 2, 'CR-221212453', 'CR', '2022-12-12', 'Full Paid', 0, 360, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 12:03:50', '2022-12-12 12:03:50'),
(55, 23, 2, 'CR-221212453', 'CR', '2022-12-12', 'Cash In Hand For Bornoful( বনফুল )', 360, 0, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 12:03:50', '2022-12-12 12:03:50'),
(56, 319, NULL, '14748', 'INVOICE', '2022-12-01', 'Customer debit For Invoice No -  14748 Customer Ma(মা )', 300, 0, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 12:25:26', NULL),
(57, 8, NULL, '14748', 'INVOICE', '2022-12-01', 'Sale Income For Invoice NO - 14748 Customer Ma(মা )', 0, 300, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 12:25:26', NULL),
(58, 17, 2, '14748', 'INVOICE', '2022-12-01', 'Inventory Credit For Invoice No 14748', 0, 300, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 12:25:45', NULL),
(59, 319, 2, 'CR-221212714', 'CR', '2022-12-01', 'Full Paid', 0, 300, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 12:29:30', '2022-12-12 12:29:30'),
(60, 23, 2, 'CR-221212714', 'CR', '2022-12-01', 'Cash In Hand For Ma(মা )', 300, 0, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 12:29:30', '2022-12-12 12:29:30'),
(61, 322, NULL, '14752', 'INVOICE', '2022-12-01', 'Customer debit For Invoice No -  14752 Customer Ruma 2(রুমা ২)', 4750, 0, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 12:32:04', NULL),
(62, 8, NULL, '14752', 'INVOICE', '2022-12-01', 'Sale Income For Invoice NO - 14752 Customer Ruma 2(রুমা ২)', 0, 4750, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 12:32:04', NULL),
(63, 17, 2, '14752', 'INVOICE', '2022-12-01', 'Inventory Credit For Invoice No 14752', 0, 4750, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 12:32:31', NULL),
(64, 322, 2, 'CR-221212636', 'CR', '2022-12-12', 'Full Paid', 0, 4750, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 12:35:58', '2022-12-12 12:35:58'),
(65, 23, 2, 'CR-221212636', 'CR', '2022-12-12', 'Cash In Hand For Ruma 2(রুমা ২)', 4750, 0, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 12:35:58', '2022-12-12 12:35:58'),
(66, 17, NULL, 'CH-121212221224', 'Inventory Transfer', '2022-12-12', 'Inventory transfer product damage cost 3329.7999999999997', 0, 3329.7999999999997, '2', '1', '1', 'Marjuk Nobi (Jitu)', NULL, '2022-12-12 12:37:16', '2022-12-12 12:37:16'),
(67, 316, NULL, '14746', 'INVOICE', '2022-12-01', 'Customer debit For Invoice No -  14746 Customer Imdad(ইমদাদ)', 5000, 0, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 12:41:26', NULL),
(68, 8, NULL, '14746', 'INVOICE', '2022-12-01', 'Sale Income For Invoice NO - 14746 Customer Imdad(ইমদাদ)', 0, 5000, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 12:41:26', NULL),
(69, 17, 2, '14746', 'INVOICE', '2022-12-01', 'Inventory Credit For Invoice No 14746', 0, 5000, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 12:41:42', NULL),
(70, 316, 2, 'CR-221212387', 'CR', '2022-12-12', 'Parial Payment', 0, 4000, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 12:42:50', '2022-12-12 12:42:50'),
(71, 23, 2, 'CR-221212387', 'CR', '2022-12-12', 'Cash In Hand For Imdad(ইমদাদ)', 4000, 0, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 12:42:50', '2022-12-12 12:42:50'),
(72, 320, NULL, '14750', 'INVOICE', '2022-12-01', 'Customer debit For Invoice No -  14750 Customer Alomgir( আলমগীর )', 1875, 0, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 12:48:38', NULL),
(73, 8, NULL, '14750', 'INVOICE', '2022-12-01', 'Sale Income For Invoice NO - 14750 Customer Alomgir( আলমগীর )', 0, 1875, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 12:48:38', NULL),
(74, 17, 2, '14750', 'INVOICE', '2022-12-01', 'Inventory Credit For Invoice No 14750', 0, 1875, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 12:49:06', NULL),
(75, 321, NULL, '14751', 'INVOICE', '2022-12-01', 'Customer debit For Invoice No -  14751 Customer Nuralom( নুর আলম )', 1794, 0, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 12:49:15', NULL),
(76, 8, NULL, '14751', 'INVOICE', '2022-12-01', 'Sale Income For Invoice NO - 14751 Customer Nuralom( নুর আলম )', 0, 1794, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 12:49:15', NULL),
(77, 17, 2, '14751', 'INVOICE', '2022-12-01', 'Inventory Credit For Invoice No 14751', 0, 1794, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 12:49:44', NULL),
(78, 321, 2, 'CR-221212853', 'CR', '2022-12-12', 'Parial Payment', 0, 1194, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 12:50:51', '2022-12-12 12:50:51'),
(79, 23, 2, 'CR-221212853', 'CR', '2022-12-12', 'Cash In Hand For Nuralom( নুর আলম )', 1194, 0, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 12:50:51', '2022-12-12 12:50:51'),
(80, 320, 2, 'CR-22121270', 'CR', '2022-12-12', 'Parial Payment', 0, 675, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 12:51:58', '2022-12-12 12:51:58'),
(81, 23, 2, 'CR-22121270', 'CR', '2022-12-12', 'Cash In Hand For Alomgir( আলমগীর )', 675, 0, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 12:51:58', '2022-12-12 12:51:58'),
(82, 317, NULL, '14747', 'INVOICE', '2022-12-01', 'Customer debit For Invoice No -  14747 Customer Shojib( সজীব)', 1140, 0, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 12:53:52', NULL),
(83, 8, NULL, '14747', 'INVOICE', '2022-12-01', 'Sale Income For Invoice NO - 14747 Customer Shojib( সজীব)', 0, 1140, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 12:53:52', NULL),
(84, 17, 2, '14747', 'INVOICE', '2022-12-01', 'Inventory Credit For Invoice No 14747', 0, 1140, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 12:54:10', NULL),
(85, 317, 2, 'CR-221212240', 'CR', '2022-12-12', 'Partial Payment', 0, 200, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 12:55:02', '2022-12-12 12:55:02'),
(86, 23, 2, 'CR-221212240', 'CR', '2022-12-12', 'Cash In Hand For Shojib( সজীব)', 200, 0, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 12:55:02', '2022-12-12 12:55:02'),
(87, 305, NULL, '14762', 'INVOICE', '2022-12-01', 'Customer debit For Invoice No -  14762 Customer Shakil(শাকিল আহমেদ)', 3500, 0, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 17:53:12', NULL),
(88, 8, NULL, '14762', 'INVOICE', '2022-12-01', 'Sale Income For Invoice NO - 14762 Customer Shakil(শাকিল আহমেদ)', 0, 3500, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 17:53:12', NULL),
(89, 17, 2, '14762', 'INVOICE', '2022-12-01', 'Inventory Credit For Invoice No 14762', 0, 3500, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 17:53:46', NULL),
(90, 305, 2, 'CR-22121292', 'CR', '2022-12-12', 'Full Paid', 0, 3500, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 17:54:22', '2022-12-12 17:54:22'),
(91, 23, 2, 'CR-22121292', 'CR', '2022-12-12', 'Cash In Hand For Shakil(শাকিল আহমেদ)', 3500, 0, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 17:54:22', '2022-12-12 17:54:22'),
(92, 307, NULL, '14757', 'INVOICE', '2022-12-01', 'Customer debit For Invoice No -  14757 Customer Imran(রোকুনোদ জামাল)', 510, 0, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 17:56:57', NULL),
(93, 8, NULL, '14757', 'INVOICE', '2022-12-01', 'Sale Income For Invoice NO - 14757 Customer Imran(রোকুনোদ জামাল)', 0, 510, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 17:56:57', NULL),
(94, 17, 2, '14757', 'INVOICE', '2022-12-01', 'Inventory Credit For Invoice No 14757', 0, 510, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 17:57:21', NULL),
(95, 307, 2, 'CR-221212908', 'CR', '2022-12-12', 'Full Paid', 0, 510, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 17:58:14', '2022-12-12 17:58:14'),
(96, 23, 2, 'CR-221212908', 'CR', '2022-12-12', 'Cash In Hand For Imran(রোকুনোদ জামাল)', 510, 0, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 17:58:14', '2022-12-12 17:58:14'),
(97, 309, NULL, '14755', 'INVOICE', '2022-12-01', 'Customer debit For Invoice No -  14755 Customer Hazrat shajalal(হযরত শাহজালাল', 900, 0, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 17:59:59', NULL),
(98, 8, NULL, '14755', 'INVOICE', '2022-12-01', 'Sale Income For Invoice NO - 14755 Customer Hazrat shajalal(হযরত শাহজালাল', 0, 900, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 17:59:59', NULL),
(99, 17, 2, '14755', 'INVOICE', '2022-12-01', 'Inventory Credit For Invoice No 14755', 0, 900, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 18:00:20', NULL),
(100, 309, 2, 'CR-221212218', 'CR', '2022-12-12', 'Full Paid', 0, 900, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 18:01:09', '2022-12-12 18:01:09'),
(101, 23, 2, 'CR-221212218', 'CR', '2022-12-12', 'Cash In Hand For Hazrat shajalal(হযরত শাহজালাল', 900, 0, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 18:01:09', '2022-12-12 18:01:09'),
(102, 310, NULL, '14760', 'INVOICE', '2022-12-01', 'Customer debit For Invoice No -  14760 Customer Harun(হারুন ইসলাম)', 672, 0, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 19:23:33', NULL),
(103, 8, NULL, '14760', 'INVOICE', '2022-12-01', 'Sale Income For Invoice NO - 14760 Customer Harun(হারুন ইসলাম)', 0, 672, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 19:23:33', NULL),
(104, 17, 2, '14760', 'INVOICE', '2022-12-01', 'Inventory Credit For Invoice No 14760', 0, 672, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 19:23:51', NULL),
(105, 310, 2, 'CR-221212264', 'CR', '2022-12-12', 'Full Paid', 0, 672, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 19:25:16', '2022-12-12 19:25:16'),
(106, 23, 2, 'CR-221212264', 'CR', '2022-12-12', 'Cash In Hand For Harun(হারুন ইসলাম)', 672, 0, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 19:25:16', '2022-12-12 19:25:16'),
(107, 311, NULL, '14759', 'INVOICE', '2022-12-01', 'Customer debit For Invoice No -  14759 Customer Mun mun (নাসির উদ্দীন)', 690, 0, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 19:27:38', NULL),
(108, 8, NULL, '14759', 'INVOICE', '2022-12-01', 'Sale Income For Invoice NO - 14759 Customer Mun mun (নাসির উদ্দীন)', 0, 690, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 19:27:38', NULL),
(109, 17, 2, '14759', 'INVOICE', '2022-12-01', 'Inventory Credit For Invoice No 14759', 0, 690, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 19:27:52', NULL),
(110, 311, 2, 'CR-221212393', 'CR', '2022-12-12', 'Full Paid', 0, 690, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 19:28:18', '2022-12-12 19:28:18'),
(111, 23, 2, 'CR-221212393', 'CR', '2022-12-12', 'Cash In Hand For Mun mun (নাসির উদ্দীন)', 690, 0, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 19:28:18', '2022-12-12 19:28:18'),
(112, 312, NULL, '14758', 'INVOICE', '2022-12-01', 'Customer debit For Invoice No -  14758 Customer Ali(খোকনুদ জামাল)', 1850, 0, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 19:30:57', NULL),
(113, 8, NULL, '14758', 'INVOICE', '2022-12-01', 'Sale Income For Invoice NO - 14758 Customer Ali(খোকনুদ জামাল)', 0, 1850, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 19:30:57', NULL),
(114, 17, 2, '14758', 'INVOICE', '2022-12-01', 'Inventory Credit For Invoice No 14758', 0, 1850, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 19:31:14', NULL),
(115, 312, 2, 'CR-221212232', 'CR', '2022-12-12', 'Full Paid', 0, 1850, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 19:32:00', '2022-12-12 19:32:00'),
(116, 23, 2, 'CR-221212232', 'CR', '2022-12-12', 'Cash In Hand For Ali(খোকনুদ জামাল)', 1850, 0, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-12 19:32:00', '2022-12-12 19:32:00'),
(117, 414, NULL, '14785', 'INVOICE', '2022-12-04', 'Customer debit For Invoice No -  14785 Customer Hasan(হাসান)', 4880, 0, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 15:15:10', NULL),
(118, 8, NULL, '14785', 'INVOICE', '2022-12-04', 'Sale Income For Invoice NO - 14785 Customer Hasan(হাসান)', 0, 4880, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 15:15:10', NULL),
(119, 17, 2, '14785', 'INVOICE', '2022-12-04', 'Inventory Credit For Invoice No 14785', 0, 4880, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 15:15:31', NULL),
(120, 414, 2, 'CR-221213187', 'CR', '2022-12-13', 'Partial Paid', 0, 1880, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 15:17:00', '2022-12-13 15:17:00'),
(121, 23, 2, 'CR-221213187', 'CR', '2022-12-13', 'Cash In Hand For Hasan(হাসান)', 1880, 0, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 15:17:00', '2022-12-13 15:17:00'),
(122, 353, NULL, '14780', 'INVOICE', '2022-12-04', 'Customer debit For Invoice No -  14780 Customer Shofiq(শফিক)', 810, 0, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 15:19:14', NULL),
(123, 8, NULL, '14780', 'INVOICE', '2022-12-04', 'Sale Income For Invoice NO - 14780 Customer Shofiq(শফিক)', 0, 810, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 15:19:14', NULL),
(124, 17, 2, '14780', 'INVOICE', '2022-12-04', 'Inventory Credit For Invoice No 14780', 0, 810, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 15:19:41', NULL),
(125, 353, 2, 'CR-22121337', 'CR', '2022-12-13', 'Full Paid', 0, 810, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 15:21:20', '2022-12-13 15:21:20'),
(126, 23, 2, 'CR-22121337', 'CR', '2022-12-13', 'Cash In Hand For Shofiq(শফিক)', 810, 0, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 15:21:20', '2022-12-13 15:21:20'),
(127, 354, NULL, '14779', 'INVOICE', '2022-12-04', 'Customer debit For Invoice No -  14779 Customer Raja Badsha( রাজা বাদশা )', 2940, 0, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 15:24:48', NULL),
(128, 8, NULL, '14779', 'INVOICE', '2022-12-04', 'Sale Income For Invoice NO - 14779 Customer Raja Badsha( রাজা বাদশা )', 0, 2940, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 15:24:48', NULL),
(129, 17, 2, '14779', 'INVOICE', '2022-12-04', 'Inventory Credit For Invoice No 14779', 0, 2940, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 15:25:15', NULL),
(130, 354, 2, 'CR-221213851', 'CR', '2022-12-13', 'Full Paid', 0, 2940, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 15:25:53', '2022-12-13 15:25:53'),
(131, 23, 2, 'CR-221213851', 'CR', '2022-12-13', 'Cash In Hand For Raja Badsha( রাজা বাদশা )', 2940, 0, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 15:25:53', '2022-12-13 15:25:53'),
(132, 355, NULL, '14778', 'INVOICE', '2022-12-04', 'Customer debit For Invoice No -  14778 Customer Iqbal( ইকবাল)', 3500, 0, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 15:28:08', NULL),
(133, 8, NULL, '14778', 'INVOICE', '2022-12-04', 'Sale Income For Invoice NO - 14778 Customer Iqbal( ইকবাল)', 0, 3500, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 15:28:08', NULL),
(134, 17, 2, '14778', 'INVOICE', '2022-12-04', 'Inventory Credit For Invoice No 14778', 0, 3500, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 15:28:24', NULL),
(135, 355, 2, 'CR-221213396', 'CR', '2022-12-13', 'Full Paid', 0, 3500, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 15:29:04', '2022-12-13 15:29:04'),
(136, 23, 2, 'CR-221213396', 'CR', '2022-12-13', 'Cash In Hand For Iqbal( ইকবাল)', 3500, 0, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 15:29:04', '2022-12-13 15:29:04'),
(137, 347, NULL, '14764', 'INVOICE', '2022-12-04', 'Customer debit For Invoice No -  14764 Customer Shulov(সুলভ)', 1104, 0, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 15:31:20', NULL),
(138, 8, NULL, '14764', 'INVOICE', '2022-12-04', 'Sale Income For Invoice NO - 14764 Customer Shulov(সুলভ)', 0, 1104, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 15:31:20', NULL),
(139, 17, 2, '14764', 'INVOICE', '2022-12-04', 'Inventory Credit For Invoice No 14764', 0, 1104, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 15:31:39', NULL),
(140, 347, 2, 'CR-2212134', 'CR', '2022-12-13', 'Full Paid', 0, 1104, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 15:32:16', '2022-12-13 15:32:16'),
(141, 23, 2, 'CR-2212134', 'CR', '2022-12-13', 'Cash In Hand For Shulov(সুলভ)', 1104, 0, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 15:32:16', '2022-12-13 15:32:16'),
(142, 348, NULL, '14763', 'INVOICE', '2022-12-04', 'Customer debit For Invoice No -  14763 Customer Khokhon(খোকন)', 4800, 0, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 15:35:12', NULL),
(143, 8, NULL, '14763', 'INVOICE', '2022-12-04', 'Sale Income For Invoice NO - 14763 Customer Khokhon(খোকন)', 0, 4800, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 15:35:12', NULL),
(144, 17, 2, '14763', 'INVOICE', '2022-12-04', 'Inventory Credit For Invoice No 14763', 0, 4800, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 15:35:31', NULL),
(145, 348, 2, 'CR-221213922', 'CR', '2022-12-13', 'Full Paid', 0, 4800, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 15:36:52', '2022-12-13 15:36:52'),
(146, 23, 2, 'CR-221213922', 'CR', '2022-12-13', 'Cash In Hand For Khokhon(খোকন)', 4800, 0, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 15:36:52', '2022-12-13 15:36:52'),
(147, 345, NULL, '14765', 'INVOICE', '2022-12-04', 'Customer debit For Invoice No -  14765 Customer Three Stare(থ্রী ষ্টার)', 480, 0, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 15:38:15', NULL),
(148, 8, NULL, '14765', 'INVOICE', '2022-12-04', 'Sale Income For Invoice NO - 14765 Customer Three Stare(থ্রী ষ্টার)', 0, 480, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 15:38:15', NULL),
(149, 17, 2, '14765', 'INVOICE', '2022-12-04', 'Inventory Credit For Invoice No 14765', 0, 480, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 15:38:33', NULL),
(150, 345, 2, 'CR-22121315', 'CR', '2022-12-13', 'Full Paid', 0, 480, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 15:39:03', '2022-12-13 15:39:03'),
(151, 23, 2, 'CR-22121315', 'CR', '2022-12-13', 'Cash In Hand For Three Stare(থ্রী ষ্টার)', 480, 0, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 15:39:03', '2022-12-13 15:39:03'),
(152, 342, NULL, '14768', 'INVOICE', '2022-12-04', 'Customer debit For Invoice No -  14768 Customer Monir(মনির)', 2234, 0, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 15:41:28', NULL),
(153, 8, NULL, '14768', 'INVOICE', '2022-12-04', 'Sale Income For Invoice NO - 14768 Customer Monir(মনির)', 0, 2234, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 15:41:28', NULL),
(154, 17, 2, '14768', 'INVOICE', '2022-12-04', 'Inventory Credit For Invoice No 14768', 0, 2234, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 15:41:51', NULL),
(155, 361, NULL, '14770', 'INVOICE', '2022-12-04', 'Customer debit For Invoice No -  14770 Customer Sattar( সাত্তার )', 14000, 0, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 15:43:53', NULL),
(156, 8, NULL, '14770', 'INVOICE', '2022-12-04', 'Sale Income For Invoice NO - 14770 Customer Sattar( সাত্তার )', 0, 14000, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 15:43:53', NULL),
(157, 17, 2, '14770', 'INVOICE', '2022-12-04', 'Inventory Credit For Invoice No 14770', 0, 14000, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 15:44:24', NULL),
(158, 361, 2, 'CR-22121356', 'CR', '2022-12-13', 'Full Paid', 0, 14000, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 15:44:54', '2022-12-13 15:44:54'),
(159, 23, 2, 'CR-22121356', 'CR', '2022-12-13', 'Cash In Hand For Sattar( সাত্তার )', 14000, 0, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 15:44:54', '2022-12-13 15:44:54'),
(160, 360, NULL, '14771', 'INVOICE', '2022-12-04', 'Customer debit For Invoice No -  14771 Customer Hakim( হাকিম )', 625, 0, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 15:46:25', NULL),
(161, 8, NULL, '14771', 'INVOICE', '2022-12-04', 'Sale Income For Invoice NO - 14771 Customer Hakim( হাকিম )', 0, 625, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 15:46:25', NULL),
(162, 17, 2, '14771', 'INVOICE', '2022-12-04', 'Inventory Credit For Invoice No 14771', 0, 625, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 15:46:43', NULL),
(163, 360, 2, 'CR-221213311', 'CR', '2022-12-13', 'Full Paid', 0, 625, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 15:47:17', '2022-12-13 15:47:17'),
(164, 23, 2, 'CR-221213311', 'CR', '2022-12-13', 'Cash In Hand For Hakim( হাকিম )', 625, 0, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 15:47:17', '2022-12-13 15:47:17'),
(165, 359, NULL, '14772', 'INVOICE', '2022-12-04', 'Customer debit For Invoice No -  14772 Customer Bickumpur(anower)', 300, 0, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 15:49:44', NULL),
(166, 8, NULL, '14772', 'INVOICE', '2022-12-04', 'Sale Income For Invoice NO - 14772 Customer Bickumpur(anower)', 0, 300, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 15:49:44', NULL),
(167, 17, 2, '14772', 'INVOICE', '2022-12-04', 'Inventory Credit For Invoice No 14772', 0, 300, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 15:50:16', NULL),
(168, 359, 2, 'CR-221213814', 'CR', '2022-12-13', 'Full Paid', 0, 300, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 15:50:55', '2022-12-13 15:50:55'),
(169, 23, 2, 'CR-221213814', 'CR', '2022-12-13', 'Cash In Hand For Bickumpur(anower)', 300, 0, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 15:50:55', '2022-12-13 15:50:55'),
(170, 358, NULL, '14773', 'INVOICE', '2022-12-04', 'Customer debit For Invoice No -  14773 Customer Faymeli( ফ্যামিলি )', 1150, 0, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 15:52:29', NULL),
(171, 8, NULL, '14773', 'INVOICE', '2022-12-04', 'Sale Income For Invoice NO - 14773 Customer Faymeli( ফ্যামিলি )', 0, 1150, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 15:52:29', NULL),
(172, 17, 2, '14773', 'INVOICE', '2022-12-04', 'Inventory Credit For Invoice No 14773', 0, 1150, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 15:52:55', NULL),
(173, 358, 2, 'CR-221213357', 'CR', '2022-12-13', 'Full Paid', 0, 1150, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 15:53:20', '2022-12-13 15:53:20'),
(174, 23, 2, 'CR-221213357', 'CR', '2022-12-13', 'Cash In Hand For Faymeli( ফ্যামিলি )', 1150, 0, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 15:53:20', '2022-12-13 15:53:20'),
(175, 357, NULL, '14774', 'INVOICE', '2022-12-04', 'Customer debit For Invoice No -  14774 Customer Almodina( আল মদিনা )', 488, 0, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 15:54:44', NULL),
(176, 8, NULL, '14774', 'INVOICE', '2022-12-04', 'Sale Income For Invoice NO - 14774 Customer Almodina( আল মদিনা )', 0, 488, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 15:54:44', NULL),
(177, 17, 2, '14774', 'INVOICE', '2022-12-04', 'Inventory Credit For Invoice No 14774', 0, 488, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 15:55:16', NULL),
(178, 357, 2, 'CR-221213386', 'CR', '2022-12-13', 'Full Paid', 0, 488, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 15:56:28', '2022-12-13 15:56:28'),
(179, 23, 2, 'CR-221213386', 'CR', '2022-12-13', 'Cash In Hand For Almodina( আল মদিনা )', 488, 0, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 15:56:28', '2022-12-13 15:56:28'),
(180, 350, NULL, '14783', 'INVOICE', '2022-12-04', 'Customer debit For Invoice No -  14783 Customer Ma(Kafrul মা )', 2400, 0, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 16:01:02', NULL),
(181, 8, NULL, '14783', 'INVOICE', '2022-12-04', 'Sale Income For Invoice NO - 14783 Customer Ma(Kafrul মা )', 0, 2400, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 16:01:02', NULL),
(182, 17, 2, '14783', 'INVOICE', '2022-12-04', 'Inventory Credit For Invoice No 14783', 0, 2400, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 16:01:30', NULL),
(183, 350, 2, 'CR-221213831', 'CR', '2022-12-13', 'Full Paid', 0, 2400, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 16:03:03', '2022-12-13 16:03:03'),
(184, 23, 2, 'CR-221213831', 'CR', '2022-12-13', 'Cash In Hand For Ma(Kafrul মা )', 2400, 0, '2', '1', '1', 'Sabbir Hossain (BABU)', NULL, '2022-12-13 16:03:03', '2022-12-13 16:03:03'),
(185, 0, NULL, 'SINV-230301893', 'INVOICE', '2023-03-01', 'Customer debit For Invoice No -  SINV-230301893 Customer Samsul islam', 47, 0, '2', '1', '1', 'Super Admin', NULL, '2023-03-04 07:18:20', NULL),
(186, 8, NULL, 'SINV-230301893', 'INVOICE', '2023-03-01', 'Sale Income For Invoice NO - SINV-230301893 Customer Samsul islam', 0, 47, '2', '1', '1', 'Super Admin', NULL, '2023-03-04 07:18:20', NULL),
(187, 22, NULL, 'SINV-230301893', 'INVOICE', '2023-03-01', 'Sale Total Tax For Invoice NO - SINV-230301893 Customer Samsul islam', 6, 0, '2', '1', '1', 'Super Admin', NULL, '2023-03-04 07:18:20', NULL),
(188, 0, NULL, 'SINV-230301893', 'INVOICE', '2023-03-01', 'Customer credit for Paid Amount For Customer Invoice NO- SINV-230301893 Customer- Samsul islam', 0, 47, '2', '1', '1', 'Super Admin', NULL, '2023-03-04 07:18:20', NULL),
(189, 2023, NULL, 'SINV-230301893', 'INVOICE', '2023-03-01', 'Cash in Hand in Sale for Invoice No - SINV-230301893 customer- Samsul islam', 47, 0, '2', '1', '', '1', NULL, '0000-00-00 00:00:00', NULL),
(190, 0, NULL, 'SINV-230304973', 'INVOICE', '2023-03-04', 'Customer debit For Invoice No -  SINV-230304973 Customer Samsul islam', 420, 0, '2', '1', '1', 'Super Admin', NULL, '2023-03-04 08:50:47', NULL),
(191, 8, NULL, 'SINV-230304973', 'INVOICE', '2023-03-04', 'Sale Income For Invoice NO - SINV-230304973 Customer Samsul islam', 0, 420, '2', '1', '1', 'Super Admin', NULL, '2023-03-04 08:50:47', NULL),
(192, 22, NULL, 'SINV-230304973', 'INVOICE', '2023-03-04', 'Sale Total Tax For Invoice NO - SINV-230304973 Customer Samsul islam', 30, 0, '2', '1', '1', 'Super Admin', NULL, '2023-03-04 08:50:47', NULL),
(193, 0, NULL, 'SINV-230304973', 'INVOICE', '2023-03-04', 'Customer credit for Paid Amount For Customer Invoice NO- SINV-230304973 Customer- Samsul islam', 0, 650, '2', '1', '1', 'Super Admin', NULL, '2023-03-04 08:50:47', NULL),
(194, 2023, NULL, 'SINV-230304973', 'INVOICE', '2023-03-04', 'Cash in Hand in Sale for Invoice No - SINV-230304973 customer- Samsul islam', 650, 0, '2', '1', '', '1', NULL, '0000-00-00 00:00:00', NULL),
(195, 17, 2, 'SINV-230304973', 'INVOICE', '2023-03-04', 'Inventory Credit For Invoice No SINV-230304973', 0, 80, '2', '1', '1', 'Super Admin', NULL, '2023-03-04 08:55:16', NULL),
(196, 17, 6, 'SINV-230304973', 'INVOICE', '2023-03-04', 'Inventory Credit For Invoice No SINV-230304973', 0, 160, '2', '1', '1', 'Super Admin', NULL, '2023-03-04 08:56:08', NULL),
(197, 415, 3, 'MI9S2WQBYA', 'PR Balance', '2023-03-04', 'Dealer Joyonto Kumar previous due 10000', 10000, 0, '2', '1', '1', 'Super Admin', NULL, '2023-03-04 09:05:12', NULL),
(198, 17, 3, 'MI9S2WQBYA', 'PR Balance', '2023-03-04', 'Inventory credit for old sale to Joyonto Kumar', 0, 10000, '2', '1', '1', 'Super Admin', NULL, '2023-03-04 09:05:12', NULL),
(199, 261, 3, 'A3RJHVZ7Q4', 'Advance', '2023-03-04', 'Dealer advance from Joyonto Kumar', 0, 1000, '2', '1', '1', 'Super Admin', NULL, '2023-03-04 09:05:50', NULL),
(200, 23, 3, 'A3RJHVZ7Q4', 'Advance', '2023-03-04', 'Cash in Hand For Joyonto Kumar', 1000, 0, '2', '1', '1', 'Super Admin', NULL, '2023-03-04 09:05:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transfers`
--

CREATE TABLE `transfers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `challan_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `to_warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `item` double(8,2) NOT NULL,
  `total_qty` double(8,2) NOT NULL,
  `receive_qty` double(8,2) NOT NULL DEFAULT '0.00',
  `damage_qty` double(8,2) NOT NULL DEFAULT '0.00',
  `shipping_cost` double DEFAULT NULL,
  `received_cost` bigint(20) DEFAULT NULL,
  `grand_total` double NOT NULL,
  `transfer_date` date NOT NULL,
  `driver_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dmobile_no` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfer_status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Transfered,2=Pending',
  `receiver_id` bigint(20) UNSIGNED NOT NULL,
  `receive_date` date DEFAULT NULL,
  `receive_status` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '3' COMMENT '1=Full Received,2=Partial,3=Pending',
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transfers`
--

INSERT INTO `transfers` (`id`, `challan_no`, `from_warehouse_id`, `to_warehouse_id`, `item`, `total_qty`, `receive_qty`, `damage_qty`, `shipping_cost`, `received_cost`, `grand_total`, `transfer_date`, `driver_name`, `dmobile_no`, `transfer_status`, `receiver_id`, `receive_date`, `receive_status`, `note`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'CH-011204220429', 1, 2, 8.00, 11235.00, 11215.00, 20.00, NULL, NULL, 1584740.85, '2022-12-01', 'Khalilul Rahman', '01725767217', '1', 40, '2022-12-01', '2', '1st Challan of Product from Factory to Mirpur Depo.', 'Admin', 'Admin', '2022-12-01 16:31:55', '2022-12-01 21:09:22'),
(2, 'CH-061212221255', 1, 2, 8.00, 4170.00, 4170.00, 0.00, 100, 100, 386454.3, '2022-12-06', 'Khalilul Rahman', '01725767217', '1', 40, '2022-12-06', '1', NULL, 'Admin', NULL, '2022-12-06 13:03:03', '2022-12-06 13:07:59'),
(3, 'CH-071201220103', 1, 2, 1.00, 14.00, 12.00, 2.00, NULL, NULL, 1536.5, '2022-12-07', 'Khalilul Rahman', '01725767217', '1', 2, '2022-12-07', '2', NULL, 'Admin', NULL, '2022-12-07 13:05:13', '2022-12-07 13:06:22'),
(4, 'CH-071201220118', 1, 2, 7.00, 36.00, 36.00, 0.00, NULL, NULL, 1342.02, '2022-12-07', 'Khalilul Rahman', '01725767217', '1', 2, '2022-12-07', '1', NULL, 'Admin', NULL, '2022-12-07 13:20:06', '2022-12-07 13:20:27'),
(5, 'CH-071204220427', 1, 2, 6.00, 6192.00, 6192.00, 0.00, NULL, NULL, 944871, '2022-12-06', 'Khalilul Rahman', '01725767217', '1', 40, '2022-12-11', '1', '2022-12-06 Night', 'Admin', 'Admin', '2022-12-07 16:31:43', '2022-12-11 12:56:05'),
(6, 'CH-121211221155', 1, 6, 1.00, 590.00, 590.00, 0.00, NULL, NULL, 12272, '2022-12-12', NULL, NULL, '1', 45, '2022-12-12', '1', NULL, 'Admin', NULL, '2022-12-12 11:57:17', '2022-12-12 11:58:23'),
(7, 'CH-121212221200', 1, 6, 1.00, 350.00, 350.00, 0.00, NULL, NULL, 7280, '2022-12-12', NULL, NULL, '1', 45, '2022-12-12', '1', NULL, 'Admin', NULL, '2022-12-12 12:02:29', '2022-12-12 12:03:03'),
(8, 'CH-121212221205', 6, 1, 1.00, 280.00, 280.00, 0.00, NULL, NULL, 5824, '2022-12-12', NULL, NULL, '1', 2, '2022-12-12', '1', NULL, 'Ismail Hossain', NULL, '2022-12-12 12:06:12', '2022-12-12 12:06:54'),
(9, 'CH-121212221208', 1, 6, 6.00, 603.00, 603.00, 0.00, NULL, NULL, 73739.25, '2022-12-12', NULL, NULL, '1', 45, '2022-12-12', '1', NULL, 'Admin', NULL, '2022-12-12 12:09:46', '2022-12-12 12:10:19'),
(10, 'CH-121212221210', 1, 6, 4.00, 289.00, 289.00, 0.00, NULL, NULL, 17032.25, '2022-12-12', NULL, NULL, '1', 45, '2022-12-12', '1', NULL, 'Admin', NULL, '2022-12-12 12:13:00', '2022-12-12 12:15:27'),
(11, 'CH-121212221224', 6, 2, 6.00, 757.00, 718.00, 39.00, NULL, NULL, 44441.31999999999, '2022-12-12', NULL, NULL, '1', 40, '2022-12-12', '2', NULL, 'Ismail Hossain', NULL, '2022-12-12 12:34:46', '2022-12-12 12:37:15');

-- --------------------------------------------------------

--
-- Table structure for table `transfer_products`
--

CREATE TABLE `transfer_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `transfer_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `transfer_qty` double NOT NULL,
  `receive_qty` double NOT NULL DEFAULT '0',
  `damage_qty` double NOT NULL DEFAULT '0',
  `unit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `net_unit_cost` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transfer_products`
--

INSERT INTO `transfer_products` (`id`, `transfer_id`, `product_id`, `transfer_qty`, `receive_qty`, `damage_qty`, `unit_id`, `net_unit_cost`, `total`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 6339, 6319, 20, 1, 20.8, 131851.2, '2022-12-01 16:31:55', '2022-12-01 21:09:22'),
(2, 1, 2, 2530, 2530, 0, 1, 55.83, 141249.9, '2022-12-01 16:31:55', '2022-12-01 21:09:22'),
(3, 1, 3, 905, 905, 0, 1, 103.5, 93667.5, '2022-12-01 16:31:55', '2022-12-01 21:09:22'),
(4, 1, 4, 982, 982, 0, 1, 199.56, 195967.92, '2022-12-01 16:31:55', '2022-12-01 21:09:22'),
(5, 1, 5, 33, 33, 0, 1, 388.01, 12804.33, '2022-12-01 16:31:55', '2022-12-01 21:09:22'),
(6, 1, 6, 190, 190, 0, 1, 960, 182400, '2022-12-01 16:31:55', '2022-12-01 21:09:22'),
(7, 1, 7, 16, 16, 0, 1, 1680, 26880, '2022-12-01 16:31:55', '2022-12-01 21:09:22'),
(8, 1, 8, 240, 240, 0, 1, 3333, 799920, '2022-12-01 16:31:55', '2022-12-01 21:09:22'),
(9, 2, 1, 20, 20, 0, 1, 20.8, 416, '2022-12-06 13:03:03', '2022-12-06 13:07:59'),
(10, 2, 30, 3200, 3200, 0, 1, 109.75, 351200, '2022-12-06 13:03:03', '2022-12-06 13:07:59'),
(11, 2, 31, 300, 300, 0, 1, 31.5, 9450, '2022-12-06 13:03:03', '2022-12-06 13:07:59'),
(12, 2, 32, 300, 300, 0, 1, 48, 14400, '2022-12-06 13:03:03', '2022-12-06 13:07:59'),
(13, 2, 33, 100, 100, 0, 1, 28.93, 2893, '2022-12-06 13:03:03', '2022-12-06 13:07:59'),
(14, 2, 34, 70, 70, 0, 1, 25.81, 1806.6999999999998, '2022-12-06 13:03:03', '2022-12-06 13:07:59'),
(15, 2, 35, 100, 100, 0, 1, 27.83, 2783, '2022-12-06 13:03:03', '2022-12-06 13:07:59'),
(16, 2, 36, 80, 80, 0, 1, 43.82, 3505.6, '2022-12-06 13:03:03', '2022-12-06 13:07:59'),
(17, 3, 30, 14, 12, 2, 1, 109.75, 1536.5, '2022-12-07 13:05:13', '2022-12-07 13:06:22'),
(18, 4, 30, 2, 2, 0, 1, 109.75, 219.5, '2022-12-07 13:20:06', '2022-12-07 13:20:27'),
(19, 4, 31, 7, 7, 0, 1, 31.5, 220.5, '2022-12-07 13:20:06', '2022-12-07 13:20:27'),
(20, 4, 32, 5, 5, 0, 1, 48, 240, '2022-12-07 13:20:06', '2022-12-07 13:20:27'),
(21, 4, 33, 18, 18, 0, 1, 28.93, 520.74, '2022-12-07 13:20:06', '2022-12-07 13:20:27'),
(22, 4, 34, 1, 1, 0, 1, 25.81, 25.81, '2022-12-07 13:20:06', '2022-12-07 13:20:27'),
(23, 4, 35, 1, 1, 0, 1, 27.83, 27.83, '2022-12-07 13:20:06', '2022-12-07 13:20:27'),
(24, 4, 36, 2, 2, 0, 1, 43.82, 87.64, '2022-12-07 13:20:06', '2022-12-07 13:20:27'),
(25, 5, 30, 5196, 5196, 0, 1, 109.75, 570261, '2022-12-07 16:31:43', '2022-12-11 12:56:05'),
(26, 5, 5, 240, 240, 0, 1, 393, 94320, '2022-12-07 16:31:43', '2022-12-11 12:56:05'),
(27, 5, 6, 240, 240, 0, 1, 971, 233040, '2022-12-07 16:31:43', '2022-12-11 12:56:05'),
(28, 5, 38, 500, 500, 0, 1, 31.15, 15575, '2022-12-07 16:31:43', '2022-12-11 12:56:05'),
(29, 5, 7, 15, 15, 0, 1, 1665, 24975, '2022-12-07 16:31:43', '2022-12-11 12:56:05'),
(30, 5, 37, 1, 1, 0, 1, 6700, 6700, '2022-12-07 16:31:43', '2022-12-11 12:56:05'),
(31, 6, 1, 590, 590, 0, 1, 20.8, 12272, '2022-12-12 11:57:17', '2022-12-12 11:58:23'),
(32, 7, 1, 350, 350, 0, 1, 20.8, 7280, '2022-12-12 12:02:29', '2022-12-12 12:03:03'),
(33, 8, 1, 280, 280, 0, 1, 20.8, 5824, '2022-12-12 12:06:12', '2022-12-12 12:06:54'),
(34, 9, 2, 377, 377, 0, 1, 55.83, 21047.91, '2022-12-12 12:09:46', '2022-12-12 12:10:19'),
(35, 9, 3, 153, 153, 0, 1, 103.5, 15835.5, '2022-12-12 12:09:46', '2022-12-12 12:10:19'),
(36, 9, 4, 35, 35, 0, 1, 199.56, 6984.6, '2022-12-12 12:09:46', '2022-12-12 12:10:19'),
(37, 9, 5, 24, 24, 0, 1, 388.01, 9312.24, '2022-12-12 12:09:46', '2022-12-12 12:10:19'),
(38, 9, 6, 11, 11, 0, 1, 960, 10560, '2022-12-12 12:09:46', '2022-12-12 12:10:19'),
(39, 9, 8, 3, 3, 0, 1, 3333, 9999, '2022-12-12 12:09:46', '2022-12-12 12:10:19'),
(40, 10, 30, 73, 73, 0, 1, 109.75, 8011.75, '2022-12-12 12:13:00', '2022-12-12 12:15:27'),
(41, 10, 32, 154, 154, 0, 1, 48, 7392, '2022-12-12 12:13:00', '2022-12-12 12:15:27'),
(42, 10, 35, 14, 14, 0, 1, 27.83, 389.62, '2022-12-12 12:13:00', '2022-12-12 12:15:27'),
(43, 10, 34, 48, 48, 0, 1, 25.81, 1238.8799999999999, '2022-12-12 12:13:00', '2022-12-12 12:15:27'),
(44, 11, 1, 250, 240, 10, 1, 20.8, 5200, '2022-12-12 12:34:46', '2022-12-12 12:37:15'),
(45, 11, 2, 320, 312, 8, 1, 55.83, 17865.6, '2022-12-12 12:34:46', '2022-12-12 12:37:15'),
(46, 11, 4, 35, 24, 11, 1, 199.56, 6984.6, '2022-12-12 12:34:46', '2022-12-12 12:37:15'),
(47, 11, 5, 24, 24, 0, 1, 388.01, 9312.24, '2022-12-12 12:34:46', '2022-12-12 12:37:15'),
(48, 11, 32, 80, 70, 10, 1, 48, 3840, '2022-12-12 12:34:46', '2022-12-12 12:37:15'),
(49, 11, 34, 48, 48, 0, 1, 25.81, 1238.8799999999999, '2022-12-12 12:34:46', '2022-12-12 12:37:15');

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `unit_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `base_unit` int(10) UNSIGNED DEFAULT NULL,
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
(14, 'Metric Ton', 'T', 2, '*', '1000', '1', 'Super Admin', 'Super Admin', '2022-03-07 13:48:59', '2022-03-07 13:52:45'),
(15, '1', 'pcs', 1, '*', '1', '1', 'Super Admin', NULL, '2022-11-24 06:14:32', '2022-11-24 06:14:32');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `role_id` bigint(20) UNSIGNED NOT NULL,
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
(1, NULL, 0, 1, 'Super Admin', 'SuperAdmin', 'superadmin@mail.com', '01521225987', NULL, '1', '$2y$10$oyBQnkvC8WZEQffhpEEsyeZPPqXEHmpaErfi62fsfyAw.UMwIzS/m', '1', '1', NULL, NULL, NULL, '2021-03-26 17:49:24', '2021-03-26 17:49:24'),
(2, NULL, 0, 2, 'Admin', 'Admin', 'admin@mail.com', '01711154960', NULL, '1', '$2y$10$opnxMmWrqtlHJMJFy1DpY.fIECVnMDoTkUcPBzUm1nRk/apMJqmsi', '1', '1', 'Admin', 'Admin', 'pzWZ3YwqnQ9GR5DN1eMOaUhW6AgWgkw8avOK87jo7ppTnea52jx4Ad61zc5n', '2021-03-26 17:49:24', '2022-10-29 13:35:49'),
(40, 2, 0, 43, 'Marjuk Nobi (Jitu)', 'jitu', 'marjuknobi@gmail.com', '01717222471', NULL, '1', '$2y$10$A3kdDhGzjWZLhRdd8rdYV.jRif4cg6TcdUZXX3.BqtwAcBXyM6b3K', '1', '2', 'Admin', 'Admin', 'NoISfRnI7mNLkzAISh1Q3DdKY2YSfDtPxvPQta4nBD2u44khybv3VCNRjAhU', '2022-11-26 16:21:21', '2022-11-30 21:57:30'),
(41, 2, 0, 43, 'Sabbir Hossain (BABU)', 'sabbir', 'sabbir@mfbl.com', '01322270610', NULL, '1', '$2y$10$3B1ZlO1PkLzYAfjDMKstNuZ9I1.cMC1BSBWNQJOCa8rvjvJCBZlCa', '1', '2', 'Admin', 'Admin', NULL, '2022-11-26 16:23:13', '2022-11-28 11:07:10'),
(42, 2, 40, 46, 'Abdul Hannan', 'abdulhannan', 'farhanahmedabir213@gmail.com', '+8801322270610', 'Mirpur-ASM-Abdul-Hannan-Photo-02-285599.jpg', '1', '$2y$10$7qH.rWrKBma3KJCgRqkqWOJl7bkh3y3CcXd5gUNM4HEKqRo6sNC42', '1', '2', 'Admin', 'Admin', 'VPWB5EJnYnzKxp7PN64timZ7ZH3OjovgkSK45lu0smF8NkD6Kh9QJF2Y2WPn', '2022-11-30 14:19:27', '2022-11-30 15:35:44'),
(43, 2, 0, 46, 'Rasel', 'rasel', NULL, '01200000', NULL, '1', '$2y$10$d2wOJJoQAuuvHebzwPvue.eK5pshkNyIL8tlT3cNQ4lCyMy.pY1n.', '1', '2', 'Admin', NULL, 'Y7CLNug0pPBjZx42n2yxa4ZI1Hva4C4S8Yl9OIeUxEu1QqAdb0eRAwQXeH8A', '2022-11-30 15:32:25', '2022-11-30 15:32:25'),
(44, 5, 0, 43, 'AKM Shahadat Hossain', 'akmshahdat', NULL, '01703 350024', NULL, '1', '$2y$10$fnW0iBErwd0/M1FEisSHN.HpgtSyFAKmILeV6SVACufIkeJjtb2zu', '1', '2', 'Admin', NULL, '0CQTS40on1lUVTikqgvci9mJQwC6asVu5JLolv1hTnVafZVe7xlIxWBWVPj3', '2022-12-06 14:08:44', '2022-12-06 14:08:44'),
(45, 6, 0, 47, 'Ismail Hossain', 'ismail', NULL, '01884846157', NULL, '1', '$2y$10$6m5hvKPpjb3P1bvadNpJlu6n3LdrHKRdVavnKyQ.DUIkEzb.ni8me', '1', '2', 'Admin', NULL, 'L8XGXpH50lWOgUXlEKDQYA1kcbGYuSSmBI703MiYeroYCvOT4lSJLR0J8joU', '2022-12-11 12:25:19', '2022-12-11 12:25:19');

-- --------------------------------------------------------

--
-- Table structure for table `warehouses`
--

CREATE TABLE `warehouses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `store_manager` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `district_id` bigint(20) UNSIGNED NOT NULL,
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
(1, 'Factory', 'Shorif', NULL, NULL, 'Bankhua, Ullapara, Sirajganj', 83, '1', '1', 'Super Admin', 'Admin', '2022-03-07 14:24:35', '2022-11-28 11:25:28'),
(2, 'Mirpur DEPO', NULL, NULL, NULL, '152, Ananda Bazar, West Shewrapara, Mirpur, Dhaka-1216', 2, '1', '1', 'Admin', 'Admin', '2022-03-07 15:14:10', '2022-11-28 11:26:47'),
(3, 'Chittagong DEPO', 'Shahadat Hossain', '+8801991234020', NULL, NULL, 47, '1', '1', 'Super Admin', 'Admin', '2022-03-22 10:24:21', '2022-11-28 11:24:02'),
(4, 'Noakhali DEPO', 'Md. Noman', '+8801818161976', NULL, 'Maijdi Bazar, Maijdi, Noakhali', 37, '1', '1', 'Super Admin', 'Admin', '2022-05-31 11:00:39', '2022-11-28 11:24:29'),
(5, 'Sylhet DEPO', NULL, NULL, NULL, NULL, 66, '1', '1', 'Admin', NULL, '2022-11-28 11:26:32', '2022-11-28 11:26:32'),
(6, 'Jatra Bari DEPO', 'Ismail Hossain', NULL, NULL, NULL, 2, '1', '1', 'Admin', 'Admin', '2022-11-28 11:27:30', '2022-12-11 12:19:01');

-- --------------------------------------------------------

--
-- Table structure for table `warehouse_material`
--

CREATE TABLE `warehouse_material` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `material_id` bigint(20) UNSIGNED NOT NULL,
  `qty` double(8,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `warehouse_material`
--

INSERT INTO `warehouse_material` (`id`, `warehouse_id`, `material_id`, `qty`, `created_at`, `updated_at`) VALUES
(6, 1, 91, 3590.12, '2022-12-01 13:18:40', '2022-12-12 10:29:52'),
(7, 1, 92, 3968.00, '2022-12-01 13:21:44', '2022-12-12 10:24:24'),
(8, 1, 93, 10789.00, '2022-12-01 13:31:14', '2022-12-12 10:24:24'),
(10, 1, 95, 6339.00, '2022-12-01 13:33:53', '2022-12-12 10:24:23'),
(11, 1, 96, 6339.00, '2022-12-01 13:35:36', '2022-12-12 10:24:23'),
(12, 1, 97, 133.00, '2022-12-01 13:37:39', '2022-12-12 10:24:23'),
(13, 1, 98, 6339.00, '2022-12-01 13:40:13', '2022-12-12 10:24:24'),
(14, 1, 99, 2530.00, '2022-12-01 14:37:33', '2022-12-12 10:24:23'),
(15, 1, 100, 106.00, '2022-12-01 14:43:24', '2022-12-12 10:24:24'),
(16, 1, 101, 2530.00, '2022-12-01 14:44:56', '2022-12-12 10:24:23'),
(17, 1, 102, 905.00, '2022-12-01 14:48:48', '2022-12-12 10:24:24'),
(18, 1, 103, 38.00, '2022-12-01 14:50:55', '2022-12-12 10:24:24'),
(19, 1, 104, 905.00, '2022-12-01 14:51:44', '2022-12-12 10:24:24'),
(20, 1, 105, 82.00, '2022-12-01 14:54:53', '2022-12-12 10:24:24'),
(21, 1, 106, 982.00, '2022-12-01 14:57:31', '2022-12-12 10:24:24'),
(22, 1, 107, 982.00, '2022-12-01 14:58:40', '2022-12-12 10:24:24'),
(23, 1, 108, 33.00, '2022-12-01 15:09:30', '2022-12-12 10:24:24'),
(24, 1, 109, 33.00, '2022-12-01 15:10:17', '2022-12-12 10:24:24'),
(25, 1, 110, 4.00, '2022-12-01 15:11:33', '2022-12-12 10:24:24'),
(26, 1, 111, 190.00, '2022-12-01 15:13:25', '2022-12-12 10:24:24'),
(27, 1, 112, 190.00, '2022-12-01 15:15:08', '2022-12-12 10:24:24'),
(30, 1, 115, 48.00, '2022-12-01 15:20:15', '2022-12-12 10:24:24'),
(32, 1, 117, 190.00, '2022-12-01 15:22:23', '2022-12-12 10:24:24'),
(33, 1, 118, 16.00, '2022-12-01 15:27:22', '2022-12-07 16:17:47'),
(35, 1, 120, 16.00, '2022-12-01 15:31:49', '2022-12-07 16:17:47'),
(36, 1, 121, 240.00, '2022-12-01 15:33:23', '2022-12-12 10:24:24'),
(37, 1, 122, 240.00, '2022-12-01 15:34:02', '2022-12-12 10:24:24'),
(38, 1, 123, 190.00, '2022-12-01 16:06:35', '2022-12-12 10:24:24'),
(39, 1, 124, 3214.00, '2022-12-04 16:50:49', '2022-12-12 10:58:28'),
(40, 1, 125, 3214.00, '2022-12-04 16:52:36', '2022-12-12 10:58:28'),
(41, 1, 126, 80.00, '2022-12-04 16:54:11', '2022-12-12 10:58:28'),
(42, 1, 127, 1910.00, '2022-12-04 17:04:37', '2022-12-07 16:17:47'),
(43, 1, 129, 307.00, '2022-12-04 17:07:06', '2022-12-07 16:17:47'),
(44, 1, 130, 13.00, '2022-12-04 17:09:50', '2022-12-07 16:17:47'),
(45, 1, 131, 152.50, '2022-12-04 17:11:58', '2022-12-12 10:58:28'),
(46, 1, 132, 305.00, '2022-12-04 17:12:58', '2022-12-12 10:58:28'),
(47, 1, 133, 22.00, '2022-12-04 17:14:11', '2022-12-12 10:58:28'),
(48, 1, 134, 0.00, '2022-12-04 17:24:10', '2022-12-05 13:55:16'),
(50, 1, 136, 0.00, '2022-12-04 17:47:59', '2022-12-05 13:55:16'),
(51, 1, 137, 2.84, '2022-12-04 17:49:49', '2022-12-12 10:58:28'),
(52, 1, 139, 4.04, '2022-12-04 17:54:50', '2022-12-12 10:58:28'),
(53, 1, 140, 101.00, '2022-12-04 17:55:50', '2022-12-12 10:58:28'),
(54, 1, 141, 0.00, '2022-12-04 17:59:23', '2022-12-05 13:55:16'),
(55, 1, 142, 0.00, '2022-12-04 18:04:59', '2022-12-05 13:55:16'),
(57, 1, 146, 290.00, '2022-12-04 18:48:31', '2022-12-12 10:58:28'),
(58, 1, 147, 0.00, '2022-12-04 18:49:38', '2022-12-05 13:55:16'),
(59, 1, 138, 71.00, '2022-12-04 18:51:33', '2022-12-12 10:58:28'),
(60, 1, 148, 0.00, '2022-12-04 19:00:40', '2022-12-05 13:55:16'),
(61, 1, 149, 3.00, '2022-12-04 19:01:51', '2022-12-12 10:58:28'),
(62, 1, 150, 4.00, '2022-12-04 19:02:39', '2022-12-12 10:58:28'),
(63, 1, 151, 0.00, '2022-12-04 19:04:18', '2022-12-04 19:04:18'),
(64, 1, 152, 0.00, '2022-12-04 19:05:44', '2022-12-05 13:55:16');

-- --------------------------------------------------------

--
-- Table structure for table `warehouse_product`
--

CREATE TABLE `warehouse_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `qty` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `warehouse_product`
--

INSERT INTO `warehouse_product` (`id`, `warehouse_id`, `product_id`, `qty`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 6327, '2022-12-01 14:29:53', '2022-12-12 12:06:54'),
(2, 1, 2, 2527, '2022-12-01 16:13:07', '2022-12-12 12:10:19'),
(3, 1, 3, 905, '2022-12-01 16:17:12', '2022-12-12 12:10:19'),
(4, 1, 4, 982, '2022-12-01 16:17:12', '2022-12-12 12:10:19'),
(5, 1, 5, 273, '2022-12-01 16:28:13', '2022-12-12 12:10:19'),
(6, 1, 6, 430, '2022-12-01 16:28:13', '2022-12-12 12:10:19'),
(7, 1, 7, 31, '2022-12-01 16:28:13', '2022-12-11 12:56:05'),
(8, 1, 8, 240, '2022-12-01 16:28:13', '2022-12-12 12:10:19'),
(9, 2, 1, 6358, '2022-12-01 21:09:22', '2022-12-13 15:41:51'),
(10, 2, 2, 2836, '2022-12-01 21:09:22', '2022-12-13 15:19:41'),
(11, 2, 3, 879, '2022-12-01 21:09:22', '2022-12-13 15:46:43'),
(12, 2, 4, 992, '2022-12-01 21:09:22', '2022-12-13 15:38:33'),
(13, 2, 5, 291, '2022-12-01 21:09:22', '2022-12-12 12:37:15'),
(14, 2, 6, 427, '2022-12-01 21:09:22', '2022-12-13 15:52:55'),
(15, 2, 7, 31, '2022-12-01 21:09:22', '2022-12-11 12:56:05'),
(16, 2, 8, 233, '2022-12-01 21:09:22', '2022-12-13 15:44:24'),
(17, 1, 30, 5196, '2022-12-06 12:46:29', '2022-12-12 12:15:27'),
(18, 1, 31, 0, '2022-12-06 12:46:29', '2022-12-07 13:20:27'),
(19, 1, 32, 0, '2022-12-06 12:46:29', '2022-12-12 12:15:27'),
(20, 1, 33, 0, '2022-12-06 12:54:32', '2022-12-07 13:20:27'),
(21, 1, 34, 0, '2022-12-06 12:54:32', '2022-12-12 12:15:27'),
(22, 1, 35, 0, '2022-12-06 12:54:32', '2022-12-12 12:15:27'),
(23, 1, 36, 0, '2022-12-06 12:54:32', '2022-12-07 13:20:27'),
(24, 2, 30, 8192, '2022-12-06 13:07:59', '2022-12-13 16:01:30'),
(25, 2, 31, 307, '2022-12-06 13:07:59', '2022-12-07 13:20:27'),
(26, 2, 32, 355, '2022-12-06 13:07:59', '2022-12-13 15:50:16'),
(27, 2, 33, 118, '2022-12-06 13:07:59', '2022-12-07 13:20:27'),
(28, 2, 34, 119, '2022-12-06 13:07:59', '2022-12-12 12:37:15'),
(29, 2, 35, 99, '2022-12-06 13:07:59', '2023-03-04 08:55:16'),
(30, 2, 36, 82, '2022-12-06 13:07:59', '2022-12-07 13:20:27'),
(31, 1, 38, 500, '2022-12-07 16:27:32', '2022-12-11 12:56:05'),
(32, 1, 37, 1, '2022-12-07 16:27:32', '2022-12-11 12:56:05'),
(33, 2, 38, 500, '2022-12-11 12:56:05', '2022-12-11 12:56:05'),
(34, 2, 37, 1, '2022-12-11 12:56:05', '2022-12-11 12:56:05'),
(35, 6, 1, 420, '2022-12-12 11:58:23', '2022-12-12 12:37:16'),
(36, 6, 2, 65, '2022-12-12 12:10:19', '2022-12-12 12:37:16'),
(37, 6, 3, 153, '2022-12-12 12:10:19', '2022-12-12 12:10:19'),
(38, 6, 4, 11, '2022-12-12 12:10:19', '2022-12-12 12:37:16'),
(39, 6, 5, 0, '2022-12-12 12:10:19', '2022-12-12 12:37:16'),
(40, 6, 6, 11, '2022-12-12 12:10:19', '2022-12-12 12:10:19'),
(41, 6, 8, 3, '2022-12-12 12:10:19', '2022-12-12 12:10:19'),
(42, 6, 30, 73, '2022-12-12 12:15:27', '2022-12-12 12:15:27'),
(43, 6, 32, 84, '2022-12-12 12:15:27', '2022-12-12 12:37:16'),
(44, 6, 35, 10, '2022-12-12 12:15:27', '2023-03-04 08:56:08'),
(45, 6, 34, 0, '2022-12-12 12:15:27', '2022-12-12 12:37:16');

--
-- Indexes for dumped tables
--

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
-- Indexes for table `employee_routes`
--
ALTER TABLE `employee_routes`
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
-- Indexes for table `salaries`
--
ALTER TABLE `salaries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `salaries_salarytable_type_salarytable_id_index` (`salarytable_type`,`salarytable_id`);

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
-- Indexes for table `shifts`
--
ALTER TABLE `shifts`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `a_s_ms`
--
ALTER TABLE `a_s_ms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `a_s_m_areas`
--
ALTER TABLE `a_s_m_areas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `a_s_m_monthly_targets`
--
ALTER TABLE `a_s_m_monthly_targets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `banks`
--
ALTER TABLE `banks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `chart_of_accounts`
--
ALTER TABLE `chart_of_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=416;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT for table `customer_groups`
--
ALTER TABLE `customer_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `daily_closings`
--
ALTER TABLE `daily_closings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `damages`
--
ALTER TABLE `damages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `damage_products`
--
ALTER TABLE `damage_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dealers`
--
ALTER TABLE `dealers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `dealer_deliveries`
--
ALTER TABLE `dealer_deliveries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dealer_delivery_products`
--
ALTER TABLE `dealer_delivery_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dealer_products`
--
ALTER TABLE `dealer_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `dealer_sales`
--
ALTER TABLE `dealer_sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dealer_sale_products`
--
ALTER TABLE `dealer_sale_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deliveries`
--
ALTER TABLE `deliveries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `delivery_products`
--
ALTER TABLE `delivery_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `employee_routes`
--
ALTER TABLE `employee_routes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `expense_items`
--
ALTER TABLE `expense_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leaves`
--
ALTER TABLE `leaves`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leave_application_manages`
--
ALTER TABLE `leave_application_manages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loans`
--
ALTER TABLE `loans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loan_categories`
--
ALTER TABLE `loan_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=723;

--
-- AUTO_INCREMENT for table `materials`
--
ALTER TABLE `materials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;

--
-- AUTO_INCREMENT for table `material_purchase`
--
ALTER TABLE `material_purchase`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;

--
-- AUTO_INCREMENT for table `mobile_banks`
--
ALTER TABLE `mobile_banks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=285;

--
-- AUTO_INCREMENT for table `module_role`
--
ALTER TABLE `module_role`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2034;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=732;

--
-- AUTO_INCREMENT for table `permission_role`
--
ALTER TABLE `permission_role`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4881;

--
-- AUTO_INCREMENT for table `productions`
--
ALTER TABLE `productions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `production_products`
--
ALTER TABLE `production_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `production_product_materials`
--
ALTER TABLE `production_product_materials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `product_material`
--
ALTER TABLE `product_material`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=183;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `purchase_payments`
--
ALTER TABLE `purchase_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `purchase_returns`
--
ALTER TABLE `purchase_returns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_return_materials`
--
ALTER TABLE `purchase_return_materials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `salaries`
--
ALTER TABLE `salaries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `salesmen`
--
ALTER TABLE `salesmen`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `salesmen_areas`
--
ALTER TABLE `salesmen_areas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `salesmen_monthly_targets`
--
ALTER TABLE `salesmen_monthly_targets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salesmen_product_commissions`
--
ALTER TABLE `salesmen_product_commissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `salesmen_product_targets`
--
ALTER TABLE `salesmen_product_targets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sale_products`
--
ALTER TABLE `sale_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `sale_returns`
--
ALTER TABLE `sale_returns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sale_return_products`
--
ALTER TABLE `sale_return_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `shifts`
--
ALTER TABLE `shifts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

--
-- AUTO_INCREMENT for table `transfers`
--
ALTER TABLE `transfers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `transfer_products`
--
ALTER TABLE `transfer_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `warehouses`
--
ALTER TABLE `warehouses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `warehouse_material`
--
ALTER TABLE `warehouse_material`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `warehouse_product`
--
ALTER TABLE `warehouse_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

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
-- Constraints for table `banks`
--
ALTER TABLE `banks`
  ADD CONSTRAINT `banks_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`);

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
