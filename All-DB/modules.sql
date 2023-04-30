-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 30, 2023 at 05:49 AM
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
-- Database: `insaf`
--

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
(87, 1, '2', 'Report', NULL, 'fas fa-file-signature', NULL, 12, 74, NULL, '2021-03-26 18:58:02', '2023-04-20 08:08:40'),
(88, 1, '2', 'Cash Book', NULL, NULL, 'cash-book', 1, 87, NULL, '2021-03-26 18:58:53', '2021-03-26 19:01:24'),
(89, 1, '2', 'Inventory Ledger', NULL, NULL, 'inventory-ledger', 2, 87, NULL, '2021-03-26 18:59:21', '2021-03-26 19:01:25'),
(90, 1, '2', 'Bank Book', NULL, NULL, 'bank-book', 3, 87, NULL, '2021-03-26 18:59:42', '2021-03-26 19:01:30'),
(91, 1, '2', 'Mobile Bank Book', NULL, NULL, 'mobile-bank-book', 4, 87, NULL, '2021-03-26 19:00:00', '2021-03-26 19:01:41'),
(92, 1, '2', 'General Ledger', NULL, NULL, 'general-ledger', 1, 179, NULL, '2021-03-26 19:00:23', '2023-04-30 05:48:13'),
(93, 1, '2', 'Trial Balance', NULL, NULL, 'trial-balance', 5, 87, NULL, '2021-03-26 19:00:42', '2023-04-30 05:48:13'),
(94, 1, '2', 'Profit Loss', NULL, NULL, 'profit-loss', 6, 87, NULL, '2021-03-26 19:01:03', '2023-04-30 05:48:13'),
(95, 1, '2', 'Cash Flow', NULL, NULL, 'cash-flow', 7, 87, NULL, '2021-03-26 19:01:21', '2023-04-30 05:48:13'),
(96, 1, '2', 'HRM', NULL, 'fas fa-users', NULL, 14, NULL, NULL, '2021-04-03 10:54:02', '2023-04-20 08:08:40'),
(126, 1, '2', 'Production Finish Goods', NULL, NULL, 'finish-goods', 3, 33, '_self', '2021-08-12 12:56:32', '2021-10-17 09:51:28'),
(179, 1, '2', 'Report', NULL, 'fas fa-file-signature', NULL, 18, NULL, NULL, '2021-09-06 04:06:13', '2023-04-20 08:08:40'),
(183, 1, '2', 'Sales Report', NULL, NULL, 'sales-report', 3, 179, '_self', '2021-09-06 04:07:55', '2023-04-30 05:48:13'),
(196, 1, '2', 'Material Stock Alert Report', NULL, NULL, 'material-stock-alert-report', 4, 179, '_self', '2021-09-06 04:14:40', '2023-04-30 05:48:13'),
(203, 1, '2', 'Manage Debit Voucher', NULL, NULL, 'debit-voucher', 7, 74, '_self', '2021-09-07 09:55:31', '2023-04-20 08:08:39'),
(204, 1, '2', 'Manage Credit Voucher', NULL, NULL, 'credit-voucher', 8, 74, '_self', '2021-09-07 09:56:13', '2023-04-20 08:08:39'),
(233, 1, '2', 'Balance Sheet', NULL, NULL, 'balance-sheet', 8, 87, '_self', '2021-09-13 05:21:49', '2023-04-30 05:48:13'),
(234, 1, '2', 'Sale', NULL, 'fab fa-opencart', NULL, 7, NULL, '_self', '2021-09-22 08:55:19', '2023-04-20 08:08:39'),
(236, 1, '2', 'Manage Sale', NULL, NULL, 'sale', 1, 234, '_self', '2021-09-22 09:18:29', '2022-05-25 07:18:48'),
(237, 1, '2', 'Sale Return', NULL, NULL, 'sale-return', 3, 51, '_self', '2021-09-23 04:37:37', '2021-09-23 04:37:49'),
(238, 1, '2', 'Product Stock Alert Report', NULL, NULL, 'product-stock-alert-report', 5, 179, '_self', '2021-09-23 06:59:01', '2023-04-30 05:48:13'),
(241, 1, '2', 'Manage Salesmen Payment', NULL, NULL, 'salesmen-payment', 3, 74, NULL, '2021-10-03 09:56:32', '2022-05-31 05:38:25'),
(247, 1, '2', 'Material Stock Ledger', NULL, NULL, 'material-stock-ledger', 4, 15, NULL, '2021-10-07 06:54:47', '2022-11-23 07:08:26'),
(250, 1, '2', 'Transfer Inventory', NULL, 'fas fa-exchange-alt', NULL, 9, NULL, NULL, '2022-03-23 06:34:04', '2023-04-20 08:08:39'),
(251, 1, '2', 'Transfer Inventory Form', NULL, NULL, 'transfer-inventory/create', 1, 250, '_self', '2022-03-23 06:34:34', '2022-03-23 06:35:06'),
(252, 1, '2', 'Manage Transfer Inventory', NULL, NULL, 'transfer-inventory', 2, 250, '_self', '2022-03-23 06:35:00', '2022-03-23 06:35:10'),
(253, 1, '2', 'Dealer', NULL, 'fas fa-user', NULL, 21, NULL, NULL, '2022-04-04 03:46:46', '2023-04-20 08:08:40'),
(254, 1, '2', 'Add Dealer', NULL, NULL, 'dealer/add', 1, 253, '_self', '2022-04-04 03:47:09', '2022-04-04 03:47:30'),
(255, 1, '2', 'Manage Dealer', NULL, NULL, 'dealer', 2, 253, '_self', '2022-04-04 03:47:26', '2022-04-04 03:47:35'),
(256, 1, '2', 'Dealer Ledger', NULL, NULL, 'dealer-ledger', 3, 253, '_self', '2022-04-04 03:48:44', '2022-04-04 03:49:23'),
(257, 1, '2', 'Dealer Advance', NULL, NULL, 'dealer-advance', 4, 253, '_self', '2022-04-04 03:49:07', '2022-04-04 03:49:28'),
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
(311, 1, '2', 'Due Report', NULL, NULL, 'due-report', 2, 179, '_self', '2023-04-29 06:19:34', '2023-04-30 05:48:13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `modules_menu_id_foreign` (`menu_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=312;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
