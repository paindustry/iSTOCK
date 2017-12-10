-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 10 Des 2017 pada 07.52
-- Versi Server: 10.1.21-MariaDB
-- PHP Version: 7.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `istock`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `backups`
--

CREATE TABLE `backups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `file_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `backup_size` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `departments`
--

CREATE TABLE `departments` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tags` varchar(1000) COLLATE utf8_unicode_ci NOT NULL DEFAULT '[]',
  `color` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `departments`
--

INSERT INTO `departments` (`id`, `name`, `tags`, `color`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Administration', '[]', '#000', NULL, '2017-11-23 20:57:41', '2017-11-23 20:57:41');

-- --------------------------------------------------------

--
-- Struktur dari tabel `employees`
--

CREATE TABLE `employees` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `designation` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `gender` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Male',
  `mobile` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mobile2` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dept` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `city` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `about` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date_birth` date NOT NULL DEFAULT '1990-01-01',
  `date_hire` date NOT NULL,
  `date_left` date NOT NULL DEFAULT '1990-01-01',
  `salary_cur` decimal(15,3) NOT NULL DEFAULT '0.000',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `employees`
--

INSERT INTO `employees` (`id`, `name`, `designation`, `gender`, `mobile`, `mobile2`, `email`, `dept`, `city`, `address`, `about`, `date_birth`, `date_hire`, `date_left`, `salary_cur`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Super Admin', 'Male', '8888888888', '', 'admin@admin.com', 1, 'Pune', 'Karve nagar, Pune 411030', 'About user / biography', '2017-11-24', '2017-11-24', '2017-11-24', '0.000', NULL, '2017-11-23 20:57:54', '2017-11-23 20:57:54'),
(2, 'Manager', 'Manager', 'Male', '99999999999', '', 'manager@manager.com', 1, '', '', '', '1990-01-01', '1970-01-01', '1990-01-01', '0.000', NULL, '2017-11-23 22:44:18', '2017-11-23 22:44:18'),
(3, 'Pemilik', 'Pemilik', 'Male', '99999999999', '', 'pemilik@pemilik.com', 1, '', '', '', '1990-01-01', '1970-01-01', '1990-01-01', '0.000', NULL, '2017-11-23 22:45:24', '2017-11-23 22:45:24');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategoris`
--

CREATE TABLE `kategoris` (
  `id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `nama_kategori` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mark_up` double(15,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `kategoris`
--

INSERT INTO `kategoris` (`id`, `deleted_at`, `created_at`, `updated_at`, `nama_kategori`, `mark_up`) VALUES
(1, '2017-12-09 01:16:24', '2017-12-08 23:58:15', '2017-12-09 01:16:24', 'baju', 10.00),
(2, '2017-12-09 00:49:18', '2017-12-09 00:24:40', '2017-12-09 00:49:18', 'Jubah', 40.00),
(3, '2017-12-09 01:23:04', '2017-12-09 01:02:09', '2017-12-09 01:23:04', 'FE2000', 70.00),
(4, NULL, '2017-12-09 01:37:43', '2017-12-09 22:33:59', 'Baju', 60.00),
(5, NULL, '2017-12-09 01:50:57', '2017-12-09 22:34:59', 'Celana', 60.00);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kodbars`
--

CREATE TABLE `kodbars` (
  `id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `kode_barang` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `nama_barang` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tanggal_masuk` date NOT NULL DEFAULT '1970-01-01',
  `harga_beli` double(15,2) NOT NULL DEFAULT '0.00',
  `harga_jual` double(15,2) NOT NULL,
  `kategori_barang` int(10) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `kodbars`
--

INSERT INTO `kodbars` (`id`, `deleted_at`, `created_at`, `updated_at`, `kode_barang`, `nama_barang`, `tanggal_masuk`, `harga_beli`, `harga_jual`, `kategori_barang`) VALUES
(21, NULL, '2017-12-09 07:17:44', '2017-12-09 07:17:44', 'BJ_001', 'Baju Astronot', '2017-12-09', 10000.00, 11000.00, 4),
(22, NULL, '2017-12-09 13:28:55', '2017-12-09 13:28:55', 'BJ_002', 'Kaos TURN BACK CRIME', '2017-12-10', 19000.00, 20900.00, 4),
(23, NULL, '2017-12-09 18:46:36', '2017-12-09 18:47:01', 'BJ_003', 'Baju Koko', '2017-12-10', 12000.00, 13200.00, 4),
(24, NULL, '2017-12-09 21:15:23', '2017-12-09 21:15:23', 'CLN_004', 'Celana Jeans', '2017-12-10', 40000.00, 44000.00, 5),
(25, NULL, '2017-12-09 22:35:25', '2017-12-09 22:35:25', '3112', '3ds', '2017-12-10', 200.00, 320.00, 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `laporans`
--

CREATE TABLE `laporans` (
  `id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `kode_barang` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `jumlah_penjualan` int(10) UNSIGNED NOT NULL,
  `total_harga` double(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `laporans`
--

INSERT INTO `laporans` (`id`, `deleted_at`, `created_at`, `updated_at`, `kode_barang`, `jumlah_penjualan`, `total_harga`) VALUES
(21, NULL, NULL, NULL, 21, 48266, 555059000.00),
(22, NULL, NULL, NULL, 22, 1184, 25870400.00),
(23, NULL, NULL, NULL, 23, 56, 772800.00),
(24, NULL, NULL, NULL, 24, 0, 0.00),
(25, NULL, NULL, NULL, 25, 0, 0.00);

-- --------------------------------------------------------

--
-- Struktur dari tabel `la_configs`
--

CREATE TABLE `la_configs` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `section` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `la_configs`
--

INSERT INTO `la_configs` (`id`, `key`, `section`, `value`, `created_at`, `updated_at`) VALUES
(1, 'sitename', '', 'iSTOCK', '2017-11-23 20:57:44', '2017-12-09 22:33:10'),
(2, 'sitename_part1', '', 'iSTOCK', '2017-11-23 20:57:44', '2017-12-09 22:33:10'),
(3, 'sitename_part2', '', '9B', '2017-11-23 20:57:44', '2017-12-09 22:33:10'),
(4, 'sitename_short', '', '', '2017-11-23 20:57:44', '2017-12-09 22:33:10'),
(5, 'site_description', '', 'Sistem Managemen Stock', '2017-11-23 20:57:44', '2017-12-09 22:33:10'),
(6, 'sidebar_search', '', '0', '2017-11-23 20:57:44', '2017-12-09 22:33:10'),
(7, 'show_messages', '', '0', '2017-11-23 20:57:44', '2017-12-09 22:33:11'),
(8, 'show_notifications', '', '0', '2017-11-23 20:57:44', '2017-12-09 22:33:11'),
(9, 'show_tasks', '', '0', '2017-11-23 20:57:44', '2017-12-09 22:33:11'),
(10, 'show_rightsidebar', '', '0', '2017-11-23 20:57:44', '2017-12-09 22:33:11'),
(11, 'skin', '', 'skin-green', '2017-11-23 20:57:44', '2017-12-09 22:33:10'),
(12, 'layout', '', 'fixed', '2017-11-23 20:57:44', '2017-12-09 22:33:10'),
(13, 'default_email', '', '', '2017-11-23 20:57:44', '2017-12-09 22:33:10');

-- --------------------------------------------------------

--
-- Struktur dari tabel `la_menus`
--

CREATE TABLE `la_menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'fa-cube',
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'module',
  `parent` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `hierarchy` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `la_menus`
--

INSERT INTO `la_menus` (`id`, `name`, `url`, `icon`, `type`, `parent`, `hierarchy`, `created_at`, `updated_at`) VALUES
(2, 'Users', 'users', 'fa-group', 'module', 1, 0, '2017-11-23 20:57:40', '2017-11-23 20:57:40'),
(4, 'Departments', 'departments', 'fa-tags', 'module', 1, 0, '2017-11-23 20:57:40', '2017-11-23 20:57:40'),
(5, 'Employees', 'employees', 'fa-group', 'module', 1, 0, '2017-11-23 20:57:40', '2017-11-23 20:57:40'),
(6, 'Roles', 'roles', 'fa-user-plus', 'module', 1, 0, '2017-11-23 20:57:41', '2017-11-23 20:57:41'),
(8, 'Permissions', 'permissions', 'fa-magic', 'module', 1, 0, '2017-11-23 20:57:41', '2017-11-23 20:57:41'),
(27, 'Pemesanan', 'pemesanans', 'fa-cart-plus', 'custom', 0, 0, '2017-12-09 22:52:09', '2017-12-09 22:52:24'),
(28, 'Laporan', 'laporans', 'fa-building-o', 'custom', 0, 0, '2017-12-09 22:52:51', '2017-12-09 22:52:51'),
(29, 'Stock', 'stocks', 'fa-cubes', 'custom', 0, 0, '2017-12-09 22:53:21', '2017-12-09 22:53:21'),
(30, 'Penjualan', 'penjualans', 'fa-dollar', 'custom', 0, 0, '2017-12-09 22:53:41', '2017-12-09 23:00:17'),
(31, 'Kode Barang', 'kodbars', 'fa-database', 'custom', 0, 0, '2017-12-09 22:54:05', '2017-12-09 22:54:05'),
(32, 'Kategori Barang', 'kategoris', 'fa-tags', 'custom', 0, 0, '2017-12-09 22:54:26', '2017-12-09 22:54:26');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_05_26_050000_create_modules_table', 1),
('2014_05_26_055000_create_module_field_types_table', 1),
('2014_05_26_060000_create_module_fields_table', 1),
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1),
('2014_12_01_000000_create_uploads_table', 1),
('2016_05_26_064006_create_departments_table', 1),
('2016_05_26_064007_create_employees_table', 1),
('2016_05_26_064446_create_roles_table', 1),
('2016_07_05_115343_create_role_user_table', 1),
('2016_07_06_140637_create_organizations_table', 1),
('2016_07_07_134058_create_backups_table', 1),
('2016_07_07_134058_create_menus_table', 1),
('2016_09_10_163337_create_permissions_table', 1),
('2016_09_10_163520_create_permission_role_table', 1),
('2016_09_22_105958_role_module_fields_table', 1),
('2016_09_22_110008_role_module_table', 1),
('2016_10_06_115413_create_la_configs_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `modules`
--

CREATE TABLE `modules` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name_db` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `view_col` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `controller` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `fa_icon` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'fa-cube',
  `is_gen` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `modules`
--

INSERT INTO `modules` (`id`, `name`, `label`, `name_db`, `view_col`, `model`, `controller`, `fa_icon`, `is_gen`, `created_at`, `updated_at`) VALUES
(1, 'Users', 'Users', 'users', 'name', 'User', 'UsersController', 'fa-group', 1, '2017-11-23 20:57:17', '2017-11-23 20:57:45'),
(2, 'Uploads', 'Uploads', 'uploads', 'name', 'Upload', 'UploadsController', 'fa-files-o', 1, '2017-11-23 20:57:19', '2017-11-23 20:57:45'),
(3, 'Departments', 'Departments', 'departments', 'name', 'Department', 'DepartmentsController', 'fa-tags', 1, '2017-11-23 20:57:20', '2017-11-23 20:57:45'),
(4, 'Employees', 'Employees', 'employees', 'name', 'Employee', 'EmployeesController', 'fa-group', 1, '2017-11-23 20:57:21', '2017-11-23 20:57:45'),
(5, 'Roles', 'Roles', 'roles', 'name', 'Role', 'RolesController', 'fa-user-plus', 1, '2017-11-23 20:57:23', '2017-11-23 20:57:45'),
(6, 'Organizations', 'Organizations', 'organizations', 'name', 'Organization', 'OrganizationsController', 'fa-university', 1, '2017-11-23 20:57:28', '2017-11-23 20:57:45'),
(7, 'Backups', 'Backups', 'backups', 'name', 'Backup', 'BackupsController', 'fa-hdd-o', 1, '2017-11-23 20:57:30', '2017-11-23 20:57:45'),
(8, 'Permissions', 'Permissions', 'permissions', 'name', 'Permission', 'PermissionsController', 'fa-magic', 1, '2017-11-23 20:57:31', '2017-11-23 20:57:45'),
(9, 'Kodbars', 'Kodbars', 'kodbars', 'kode_barang', 'Kodbar', 'KodbarsController', 'fa-database', 1, '2017-11-23 20:58:34', '2017-11-23 21:00:38'),
(10, 'Stocks', 'Stocks', 'stocks', 'kode_barang', 'Stock', 'StocksController', 'fa-cubes', 1, '2017-11-23 21:03:24', '2017-11-23 21:05:15'),
(11, 'Penjualans', 'Penjualans', 'penjualans', 'kode_barang', 'Penjualan', 'PenjualansController', 'fa-dollar', 1, '2017-11-23 21:07:57', '2017-11-23 21:11:15'),
(16, 'Laporans', 'Laporans', 'laporans', 'kode_barang', 'Laporan', 'LaporansController', 'fa-building-o', 1, '2017-11-23 22:47:42', '2017-11-23 22:54:23'),
(19, 'Kategoris', 'Kategoris', 'kategoris', 'nama_kategori', 'Kategori', 'KategorisController', 'fa-tags', 1, '2017-12-08 23:49:27', '2017-12-08 23:50:45'),
(26, 'Pemesanans', 'Pemesanans', 'pemesanans', 'kode_barang', 'Pemesanan', 'PemesanansController', 'fa-cart-plus', 1, '2017-12-09 05:42:01', '2017-12-09 05:50:01');

-- --------------------------------------------------------

--
-- Struktur dari tabel `module_fields`
--

CREATE TABLE `module_fields` (
  `id` int(10) UNSIGNED NOT NULL,
  `colname` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `module` int(10) UNSIGNED NOT NULL,
  `field_type` int(10) UNSIGNED NOT NULL,
  `unique` tinyint(1) NOT NULL DEFAULT '0',
  `defaultvalue` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `minlength` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `maxlength` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `popup_vals` text COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `module_fields`
--

INSERT INTO `module_fields` (`id`, `colname`, `label`, `module`, `field_type`, `unique`, `defaultvalue`, `minlength`, `maxlength`, `required`, `popup_vals`, `sort`, `created_at`, `updated_at`) VALUES
(1, 'name', 'Name', 1, 16, 0, '', 5, 250, 1, '', 0, '2017-11-23 20:57:17', '2017-11-23 20:57:17'),
(2, 'context_id', 'Context', 1, 13, 0, '0', 0, 0, 0, '', 0, '2017-11-23 20:57:17', '2017-11-23 20:57:17'),
(3, 'email', 'Email', 1, 8, 1, '', 0, 250, 0, '', 0, '2017-11-23 20:57:17', '2017-11-23 20:57:17'),
(4, 'password', 'Password', 1, 17, 0, '', 6, 250, 1, '', 0, '2017-11-23 20:57:17', '2017-11-23 20:57:17'),
(5, 'type', 'User Type', 1, 7, 0, 'Employee', 0, 0, 0, '[\"Employee\",\"Client\"]', 0, '2017-11-23 20:57:18', '2017-11-23 20:57:18'),
(6, 'name', 'Name', 2, 16, 0, '', 5, 250, 1, '', 0, '2017-11-23 20:57:19', '2017-11-23 20:57:19'),
(7, 'path', 'Path', 2, 19, 0, '', 0, 250, 0, '', 0, '2017-11-23 20:57:19', '2017-11-23 20:57:19'),
(8, 'extension', 'Extension', 2, 19, 0, '', 0, 20, 0, '', 0, '2017-11-23 20:57:19', '2017-11-23 20:57:19'),
(9, 'caption', 'Caption', 2, 19, 0, '', 0, 250, 0, '', 0, '2017-11-23 20:57:19', '2017-11-23 20:57:19'),
(10, 'user_id', 'Owner', 2, 7, 0, '1', 0, 0, 0, '@users', 0, '2017-11-23 20:57:19', '2017-11-23 20:57:19'),
(11, 'hash', 'Hash', 2, 19, 0, '', 0, 250, 0, '', 0, '2017-11-23 20:57:19', '2017-11-23 20:57:19'),
(12, 'public', 'Is Public', 2, 2, 0, '0', 0, 0, 0, '', 0, '2017-11-23 20:57:19', '2017-11-23 20:57:19'),
(13, 'name', 'Name', 3, 16, 1, '', 1, 250, 1, '', 0, '2017-11-23 20:57:20', '2017-11-23 20:57:20'),
(14, 'tags', 'Tags', 3, 20, 0, '[]', 0, 0, 0, '', 0, '2017-11-23 20:57:20', '2017-11-23 20:57:20'),
(15, 'color', 'Color', 3, 19, 0, '', 0, 50, 1, '', 0, '2017-11-23 20:57:20', '2017-11-23 20:57:20'),
(16, 'name', 'Name', 4, 16, 0, '', 5, 250, 1, '', 0, '2017-11-23 20:57:21', '2017-11-23 20:57:21'),
(17, 'designation', 'Designation', 4, 19, 0, '', 0, 50, 1, '', 0, '2017-11-23 20:57:21', '2017-11-23 20:57:21'),
(18, 'gender', 'Gender', 4, 18, 0, 'Male', 0, 0, 1, '[\"Male\",\"Female\"]', 0, '2017-11-23 20:57:21', '2017-11-23 20:57:21'),
(19, 'mobile', 'Mobile', 4, 14, 0, '', 10, 20, 1, '', 0, '2017-11-23 20:57:21', '2017-11-23 20:57:21'),
(20, 'mobile2', 'Alternative Mobile', 4, 14, 0, '', 10, 20, 0, '', 0, '2017-11-23 20:57:21', '2017-11-23 20:57:21'),
(21, 'email', 'Email', 4, 8, 1, '', 5, 250, 1, '', 0, '2017-11-23 20:57:21', '2017-11-23 20:57:21'),
(22, 'dept', 'Department', 4, 7, 0, '0', 0, 0, 1, '@departments', 0, '2017-11-23 20:57:21', '2017-11-23 20:57:21'),
(23, 'city', 'City', 4, 19, 0, '', 0, 50, 0, '', 0, '2017-11-23 20:57:21', '2017-11-23 20:57:21'),
(24, 'address', 'Address', 4, 1, 0, '', 0, 1000, 0, '', 0, '2017-11-23 20:57:21', '2017-11-23 20:57:21'),
(25, 'about', 'About', 4, 19, 0, '', 0, 0, 0, '', 0, '2017-11-23 20:57:21', '2017-11-23 20:57:21'),
(26, 'date_birth', 'Date of Birth', 4, 4, 0, '1990-01-01', 0, 0, 0, '', 0, '2017-11-23 20:57:21', '2017-11-23 20:57:21'),
(27, 'date_hire', 'Hiring Date', 4, 4, 0, 'date(\'Y-m-d\')', 0, 0, 0, '', 0, '2017-11-23 20:57:21', '2017-11-23 20:57:21'),
(28, 'date_left', 'Resignation Date', 4, 4, 0, '1990-01-01', 0, 0, 0, '', 0, '2017-11-23 20:57:21', '2017-11-23 20:57:21'),
(29, 'salary_cur', 'Current Salary', 4, 6, 0, '0.0', 0, 2, 0, '', 0, '2017-11-23 20:57:21', '2017-11-23 20:57:21'),
(30, 'name', 'Name', 5, 16, 1, '', 1, 250, 1, '', 0, '2017-11-23 20:57:23', '2017-11-23 20:57:23'),
(31, 'display_name', 'Display Name', 5, 19, 0, '', 0, 250, 1, '', 0, '2017-11-23 20:57:23', '2017-11-23 20:57:23'),
(32, 'description', 'Description', 5, 21, 0, '', 0, 1000, 0, '', 0, '2017-11-23 20:57:23', '2017-11-23 20:57:23'),
(33, 'parent', 'Parent Role', 5, 7, 0, '1', 0, 0, 0, '@roles', 0, '2017-11-23 20:57:23', '2017-11-23 20:57:23'),
(34, 'dept', 'Department', 5, 7, 0, '1', 0, 0, 0, '@departments', 0, '2017-11-23 20:57:23', '2017-11-23 20:57:23'),
(35, 'name', 'Name', 6, 16, 1, '', 5, 250, 1, '', 0, '2017-11-23 20:57:28', '2017-11-23 20:57:28'),
(36, 'email', 'Email', 6, 8, 1, '', 0, 250, 0, '', 0, '2017-11-23 20:57:28', '2017-11-23 20:57:28'),
(37, 'phone', 'Phone', 6, 14, 0, '', 0, 20, 0, '', 0, '2017-11-23 20:57:28', '2017-11-23 20:57:28'),
(38, 'website', 'Website', 6, 23, 0, 'http://', 0, 250, 0, '', 0, '2017-11-23 20:57:28', '2017-11-23 20:57:28'),
(39, 'assigned_to', 'Assigned to', 6, 7, 0, '0', 0, 0, 0, '@employees', 0, '2017-11-23 20:57:28', '2017-11-23 20:57:28'),
(40, 'connect_since', 'Connected Since', 6, 4, 0, 'date(\'Y-m-d\')', 0, 0, 0, '', 0, '2017-11-23 20:57:28', '2017-11-23 20:57:28'),
(41, 'address', 'Address', 6, 1, 0, '', 0, 1000, 1, '', 0, '2017-11-23 20:57:28', '2017-11-23 20:57:28'),
(42, 'city', 'City', 6, 19, 0, '', 0, 250, 1, '', 0, '2017-11-23 20:57:28', '2017-11-23 20:57:28'),
(43, 'description', 'Description', 6, 21, 0, '', 0, 1000, 0, '', 0, '2017-11-23 20:57:28', '2017-11-23 20:57:28'),
(44, 'profile_image', 'Profile Image', 6, 12, 0, '', 0, 250, 0, '', 0, '2017-11-23 20:57:28', '2017-11-23 20:57:28'),
(45, 'profile', 'Company Profile', 6, 9, 0, '', 0, 250, 0, '', 0, '2017-11-23 20:57:28', '2017-11-23 20:57:28'),
(46, 'name', 'Name', 7, 16, 1, '', 0, 250, 1, '', 0, '2017-11-23 20:57:30', '2017-11-23 20:57:30'),
(47, 'file_name', 'File Name', 7, 19, 1, '', 0, 250, 1, '', 0, '2017-11-23 20:57:30', '2017-11-23 20:57:30'),
(48, 'backup_size', 'File Size', 7, 19, 0, '0', 0, 10, 1, '', 0, '2017-11-23 20:57:30', '2017-11-23 20:57:30'),
(49, 'name', 'Name', 8, 16, 1, '', 1, 250, 1, '', 0, '2017-11-23 20:57:31', '2017-11-23 20:57:31'),
(50, 'display_name', 'Display Name', 8, 19, 0, '', 0, 250, 1, '', 0, '2017-11-23 20:57:31', '2017-11-23 20:57:31'),
(51, 'description', 'Description', 8, 21, 0, '', 0, 1000, 0, '', 0, '2017-11-23 20:57:31', '2017-11-23 20:57:31'),
(52, 'kode_barang', 'Kode Barang', 9, 19, 1, '', 0, 256, 1, '', 0, '2017-11-23 20:58:53', '2017-11-23 20:58:53'),
(53, 'nama_barang', 'Nama Barang', 9, 19, 0, '', 0, 256, 1, '', 0, '2017-11-23 20:59:12', '2017-11-23 20:59:12'),
(54, 'tanggal_masuk', 'Tanggal Masuk', 9, 4, 0, '', 0, 0, 1, '', 0, '2017-11-23 20:59:34', '2017-11-23 20:59:34'),
(55, 'harga_beli', 'Harga Beli', 9, 3, 0, '', 0, 11, 1, '', 0, '2017-11-23 20:59:50', '2017-11-23 20:59:50'),
(56, 'harga_jual', 'Harga Jual', 9, 3, 0, '', 0, 11, 0, '', 0, '2017-11-23 21:00:09', '2017-11-23 21:00:09'),
(57, 'kode_barang', 'Kode Barang', 10, 7, 0, '', 0, 0, 1, '@kodbars', 0, '2017-11-23 21:03:48', '2017-11-23 21:03:48'),
(58, 'jumlah_barang', 'Jumlah Barang', 10, 13, 0, '', 0, 11, 1, '', 0, '2017-11-23 21:04:10', '2017-11-23 21:04:10'),
(59, 'harga_total', 'Harga Total', 10, 3, 0, '', 0, 11, 0, '', 0, '2017-11-23 21:04:38', '2017-11-24 02:30:29'),
(60, 'kode_barang', 'Kode Barang', 11, 7, 0, '', 0, 0, 0, '@kodbars', 0, '2017-11-23 21:08:25', '2017-11-23 21:08:25'),
(61, 'jumlah_barang', 'Jumlah Barang', 11, 13, 0, '', 0, 11, 1, '', 0, '2017-11-23 21:08:44', '2017-11-23 21:08:44'),
(62, 'tanggal_penjualan', 'Tanggal Penjualan', 11, 4, 0, '', 0, 0, 1, '', 0, '2017-11-23 21:09:09', '2017-11-23 21:09:09'),
(69, 'kode_barang', 'Kode Barang', 16, 7, 0, '', 0, 0, 1, '@kodbars', 0, '2017-11-23 22:48:12', '2017-11-23 22:52:15'),
(82, 'nama_kategori', 'Nama Kategori', 19, 19, 0, '', 0, 256, 1, '', 0, '2017-12-08 23:49:53', '2017-12-08 23:49:53'),
(83, 'mark_up', 'Mark Up', 19, 3, 0, '', 1, 100, 0, '', 0, '2017-12-08 23:50:36', '2017-12-09 00:42:32'),
(84, 'kategori_barang', 'Kategori Barang', 9, 7, 0, '', 0, 0, 1, '@kategoris', 0, '2017-12-08 23:57:06', '2017-12-08 23:57:06'),
(105, 'kategori', 'Kategori', 10, 7, 0, '', 0, 0, 1, '@kategoris', 0, '2017-12-09 05:19:51', '2017-12-09 05:19:51'),
(107, 'kode_barang', 'Kode Barang', 26, 7, 0, '', 0, 0, 1, '@kodbars', 0, '2017-12-09 05:42:24', '2017-12-09 05:42:24'),
(108, 'jumlah_barang', 'Jumlah Barang', 26, 13, 0, '', 0, 11, 1, '', 0, '2017-12-09 05:43:05', '2017-12-09 05:43:05'),
(109, 'tanggal_pemesanan', 'Tanggal Pemesanan', 26, 4, 0, '', 0, 0, 1, '', 0, '2017-12-09 05:43:55', '2017-12-09 05:43:55'),
(110, 'kategori_barang', 'Kategori Barang', 26, 7, 0, '', 0, 0, 0, '@kategoris', 0, '2017-12-09 05:45:26', '2017-12-09 05:45:26'),
(111, 'harga_pemesanan', 'Harga Pemesanan', 26, 3, 0, '', 0, 11, 0, '', 0, '2017-12-09 05:46:29', '2017-12-09 05:46:29'),
(112, 'status', 'Status', 26, 18, 0, 'Belum Di Setujui', 0, 0, 0, '[\"Tidak Di Setujui\",\"Telah Di Setujui\"]', 0, '2017-12-09 05:49:57', '2017-12-09 10:04:37'),
(113, 'jumlah_penjualan', 'Jumlah Penjualan', 16, 13, 0, '', 0, 11, 0, '', 0, '2017-12-09 06:07:08', '2017-12-09 06:08:04'),
(114, 'total_harga', 'Total Harga', 16, 3, 0, '', 0, 11, 0, '', 0, '2017-12-09 06:08:59', '2017-12-09 06:08:59'),
(118, 'total_harga', 'Total Harga', 11, 13, 0, '', 0, 11, 0, '', 0, '2017-12-09 07:31:07', '2017-12-09 07:31:07');

-- --------------------------------------------------------

--
-- Struktur dari tabel `module_field_types`
--

CREATE TABLE `module_field_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `module_field_types`
--

INSERT INTO `module_field_types` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Address', '2017-11-23 20:57:14', '2017-11-23 20:57:14'),
(2, 'Checkbox', '2017-11-23 20:57:14', '2017-11-23 20:57:14'),
(3, 'Currency', '2017-11-23 20:57:14', '2017-11-23 20:57:14'),
(4, 'Date', '2017-11-23 20:57:15', '2017-11-23 20:57:15'),
(5, 'Datetime', '2017-11-23 20:57:15', '2017-11-23 20:57:15'),
(6, 'Decimal', '2017-11-23 20:57:15', '2017-11-23 20:57:15'),
(7, 'Dropdown', '2017-11-23 20:57:15', '2017-11-23 20:57:15'),
(8, 'Email', '2017-11-23 20:57:15', '2017-11-23 20:57:15'),
(9, 'File', '2017-11-23 20:57:15', '2017-11-23 20:57:15'),
(10, 'Float', '2017-11-23 20:57:15', '2017-11-23 20:57:15'),
(11, 'HTML', '2017-11-23 20:57:15', '2017-11-23 20:57:15'),
(12, 'Image', '2017-11-23 20:57:15', '2017-11-23 20:57:15'),
(13, 'Integer', '2017-11-23 20:57:15', '2017-11-23 20:57:15'),
(14, 'Mobile', '2017-11-23 20:57:15', '2017-11-23 20:57:15'),
(15, 'Multiselect', '2017-11-23 20:57:15', '2017-11-23 20:57:15'),
(16, 'Name', '2017-11-23 20:57:15', '2017-11-23 20:57:15'),
(17, 'Password', '2017-11-23 20:57:15', '2017-11-23 20:57:15'),
(18, 'Radio', '2017-11-23 20:57:15', '2017-11-23 20:57:15'),
(19, 'String', '2017-11-23 20:57:15', '2017-11-23 20:57:15'),
(20, 'Taginput', '2017-11-23 20:57:15', '2017-11-23 20:57:15'),
(21, 'Textarea', '2017-11-23 20:57:15', '2017-11-23 20:57:15'),
(22, 'TextField', '2017-11-23 20:57:15', '2017-11-23 20:57:15'),
(23, 'URL', '2017-11-23 20:57:15', '2017-11-23 20:57:15'),
(24, 'Files', '2017-11-23 20:57:15', '2017-11-23 20:57:15');

-- --------------------------------------------------------

--
-- Struktur dari tabel `organizations`
--

CREATE TABLE `organizations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `website` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'http://',
  `assigned_to` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `connect_since` date NOT NULL,
  `address` varchar(1000) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `city` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `profile_image` int(11) NOT NULL,
  `profile` int(11) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pemesanans`
--

CREATE TABLE `pemesanans` (
  `id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `kode_barang` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `jumlah_barang` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `tanggal_pemesanan` date NOT NULL DEFAULT '1970-01-01',
  `kategori_barang` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `harga_pemesanan` double(15,2) NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Belum Di Setujui'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `pemesanans`
--

INSERT INTO `pemesanans` (`id`, `deleted_at`, `created_at`, `updated_at`, `kode_barang`, `jumlah_barang`, `tanggal_pemesanan`, `kategori_barang`, `harga_pemesanan`, `status`) VALUES
(3, '2017-12-09 10:04:03', '2017-12-09 10:03:53', '2017-12-09 10:04:03', 21, 67, '2017-12-10', 1, 670000.00, 'Tidak Di Setujui'),
(4, NULL, '2017-12-09 10:05:09', '2017-12-09 10:05:09', 21, 56, '2017-12-10', 1, 0.00, 'Belum Di Setujui');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjualans`
--

CREATE TABLE `penjualans` (
  `id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `kode_barang` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `jumlah_barang` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `tanggal_penjualan` date NOT NULL DEFAULT '1970-01-01',
  `total_harga` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `penjualans`
--

INSERT INTO `penjualans` (`id`, `deleted_at`, `created_at`, `updated_at`, `kode_barang`, `jumlah_barang`, `tanggal_penjualan`, `total_harga`) VALUES
(14, NULL, '2017-12-09 07:41:54', '2017-12-09 14:25:57', 21, 209, '2017-12-09', 2403500),
(15, NULL, '2017-12-09 13:29:22', '2017-12-09 13:29:22', 21, 54, '2017-12-10', 621000),
(16, NULL, '2017-12-09 13:29:50', '2017-12-09 13:29:50', 22, 32, '2017-12-10', 368000),
(17, NULL, '2017-12-09 13:30:22', '2017-12-09 13:30:22', 22, 10, '2017-12-10', 115000),
(18, NULL, '2017-12-09 13:34:55', '2017-12-09 13:34:55', 22, 23, '2017-12-10', 264500),
(19, NULL, '2017-12-09 13:42:59', '2017-12-09 13:42:59', 21, 24, '2017-12-10', 276000),
(20, NULL, '2017-12-09 13:46:27', '2017-12-09 13:46:27', 21, 45, '2017-12-10', 517500),
(21, NULL, '2017-12-09 13:50:28', '2017-12-09 13:50:28', 21, 14, '2017-12-10', 161000),
(22, NULL, '2017-12-09 15:57:56', '2017-12-09 15:57:56', 22, 12, '2017-12-10', 138000),
(23, NULL, '2017-12-09 15:58:58', '2017-12-09 15:58:58', 22, 34, '2017-12-10', 391000),
(24, NULL, '2017-12-09 15:59:49', '2017-12-09 15:59:49', 22, 78, '2017-12-10', 897000),
(25, NULL, '2017-12-09 16:00:45', '2017-12-09 16:00:45', 22, 8, '2017-12-10', 92000),
(26, NULL, '2017-12-09 16:03:15', '2017-12-09 16:03:15', 21, 7, '2017-12-10', 80500),
(27, NULL, '2017-12-09 16:12:16', '2017-12-09 16:12:16', 21, 22, '2017-12-10', 253000),
(28, NULL, '2017-12-09 16:18:32', '2017-12-09 16:18:32', 21, 56, '2017-12-10', 644000),
(29, NULL, '2017-12-09 16:24:15', '2017-12-09 16:24:15', 21, 66, '2017-12-10', 759000),
(30, NULL, '2017-12-09 16:24:39', '2017-12-09 16:24:39', 21, 55, '2017-12-10', 632500),
(31, NULL, '2017-12-09 16:27:01', '2017-12-09 16:27:01', 22, 121, '2017-12-10', 1391500),
(32, NULL, '2017-12-09 16:28:07', '2017-12-09 16:28:07', 22, 121, '2017-12-10', 1391500),
(33, NULL, '2017-12-09 16:28:41', '2017-12-09 16:28:41', 22, 333, '2017-12-10', 3829500),
(34, NULL, '2017-12-09 16:34:30', '2017-12-09 16:34:30', 21, 121, '2017-12-10', 1391500),
(35, NULL, '2017-12-09 16:37:15', '2017-12-09 16:37:15', 21, 43, '2017-12-10', 494500),
(36, NULL, '2017-12-09 16:37:41', '2017-12-09 16:37:41', 21, 13, '2017-12-10', 149500),
(37, NULL, '2017-12-09 16:38:26', '2017-12-09 16:38:26', 21, 2342, '2017-12-10', 26933000),
(38, NULL, '2017-12-09 16:40:14', '2017-12-09 16:40:14', 21, 88, '2017-12-10', 1012000),
(39, NULL, '2017-12-09 16:41:28', '2017-12-09 16:41:28', 22, 78, '2017-12-10', 897000),
(40, NULL, '2017-12-09 16:43:15', '2017-12-09 16:43:15', 21, 88, '2017-12-10', 1012000),
(41, NULL, '2017-12-09 16:43:32', '2017-12-09 16:43:32', 21, 77, '2017-12-10', 885500),
(42, NULL, '2017-12-09 16:44:22', '2017-12-09 16:44:22', 21, 121, '2017-12-10', 1391500),
(43, NULL, '2017-12-09 16:44:47', '2017-12-09 16:44:47', 21, 21, '2017-12-10', 241500),
(44, NULL, '2017-12-09 16:45:45', '2017-12-09 16:45:45', 21, 23423, '2017-12-10', 269364500),
(45, NULL, '2017-12-09 16:46:47', '2017-12-09 16:46:47', 21, 3, '2017-12-10', 34500),
(46, NULL, '2017-12-09 16:48:06', '2017-12-09 16:48:06', 21, 432, '2017-12-10', 4968000),
(47, NULL, '2017-12-09 16:51:49', '2017-12-09 16:51:49', 21, 121, '2017-12-10', 1391500),
(48, NULL, '2017-12-09 16:55:19', '2017-12-09 16:55:19', 21, 2313, '2017-12-10', 26599500),
(49, NULL, '2017-12-09 16:56:06', '2017-12-09 16:56:06', 21, 1231, '2017-12-10', 14156500),
(50, NULL, '2017-12-09 16:58:08', '2017-12-09 16:58:08', 21, 324, '2017-12-10', 3726000),
(51, NULL, '2017-12-09 17:02:04', '2017-12-09 17:02:04', 21, 342, '2017-12-10', 3933000),
(52, NULL, '2017-12-09 17:03:07', '2017-12-09 17:03:07', 21, 234, '2017-12-10', 2691000),
(53, NULL, '2017-12-09 17:03:48', '2017-12-09 17:03:48', 21, 2, '2017-12-10', 23000),
(54, NULL, '2017-12-09 17:04:44', '2017-12-09 17:04:44', 21, 24, '2017-12-10', 276000),
(55, NULL, '2017-12-09 17:05:09', '2017-12-09 17:05:09', 21, 234, '2017-12-10', 2691000),
(56, NULL, '2017-12-09 17:09:32', '2017-12-09 17:09:32', 21, 24, '2017-12-10', 276000),
(57, NULL, '2017-12-09 17:12:09', '2017-12-09 17:12:09', 21, 234, '2017-12-10', 2691000),
(58, NULL, '2017-12-09 17:12:30', '2017-12-09 17:12:30', 21, 1323, '2017-12-10', 15214500),
(59, NULL, '2017-12-09 17:14:06', '2017-12-09 17:14:06', 21, 123, '2017-12-10', 1414500),
(60, NULL, '2017-12-09 17:14:22', '2017-12-09 17:14:22', 21, 12, '2017-12-10', 138000),
(61, NULL, '2017-12-09 17:15:23', '2017-12-09 17:15:23', 21, 123, '2017-12-10', 1414500),
(62, NULL, '2017-12-09 17:17:01', '2017-12-09 17:17:01', 21, 23, '2017-12-10', 264500),
(63, NULL, '2017-12-09 17:18:00', '2017-12-09 17:18:00', 21, 6687, '2017-12-10', 76900500),
(64, NULL, '2017-12-09 17:21:22', '2017-12-09 17:21:22', 21, 767, '2017-12-10', 8820500),
(65, NULL, '2017-12-09 17:23:09', '2017-12-09 17:23:09', 21, 121, '2017-12-10', 1391500),
(66, NULL, '2017-12-09 17:23:40', '2017-12-09 17:23:40', 21, 88, '2017-12-10', 1012000),
(67, NULL, '2017-12-09 17:25:53', '2017-12-09 17:25:53', 21, 66, '2017-12-10', 759000),
(68, NULL, '2017-12-09 17:27:31', '2017-12-09 17:27:31', 21, 77, '2017-12-10', 885500),
(69, NULL, '2017-12-09 17:30:51', '2017-12-09 17:30:51', 21, 2, '2017-12-10', 23000),
(70, NULL, '2017-12-09 17:31:09', '2017-12-09 17:31:09', 21, 21, '2017-12-10', 241500),
(71, NULL, '2017-12-09 17:31:32', '2017-12-09 17:31:32', 21, 2342, '2017-12-10', 26933000),
(72, NULL, '2017-12-09 17:33:44', '2017-12-09 17:33:44', 21, 123, '2017-12-10', 1414500),
(73, NULL, '2017-12-09 17:46:11', '2017-12-09 17:46:11', 21, 999, '2017-12-10', 11488500),
(74, NULL, '2017-12-09 17:46:38', '2017-12-09 17:46:38', 21, 808, '2017-12-10', 9292000),
(75, NULL, '2017-12-09 17:48:33', '2017-12-09 17:48:33', 21, 687, '2017-12-10', 7900500),
(76, NULL, '2017-12-09 17:53:12', '2017-12-09 17:53:12', 21, 88, '2017-12-10', 1012000),
(77, NULL, '2017-12-09 18:02:22', '2017-12-09 18:02:22', 21, 234, '2017-12-10', 2691000),
(78, NULL, '2017-12-09 18:04:59', '2017-12-09 18:04:59', 21, 88, '2017-12-10', 1012000),
(79, NULL, '2017-12-09 18:05:26', '2017-12-09 18:05:26', 21, 98, '2017-12-10', 1127000),
(80, NULL, '2017-12-09 18:06:07', '2017-12-09 18:06:07', 21, 212, '2017-12-10', 2438000),
(81, NULL, '2017-12-09 18:06:34', '2017-12-09 18:06:34', 21, 123, '2017-12-10', 1414500),
(82, NULL, '2017-12-09 18:07:41', '2017-12-09 18:07:41', 21, 423, '2017-12-10', 4864500),
(83, NULL, '2017-12-09 18:08:23', '2017-12-09 18:08:23', 21, 123, '2017-12-10', 1414500),
(84, NULL, '2017-12-09 18:09:00', '2017-12-09 18:09:00', 22, 123, '2017-12-10', 1414500),
(85, NULL, '2017-12-09 18:09:36', '2017-12-09 18:09:36', 22, 121, '2017-12-10', 1391500),
(86, NULL, '2017-12-09 18:48:19', '2017-12-09 18:48:19', 23, 56, '2017-12-10', 644000),
(87, NULL, '2017-12-09 22:06:16', '2017-12-09 22:06:16', 21, 78, '2017-12-15', 897000),
(88, NULL, '2017-12-09 22:22:48', '2017-12-09 22:22:48', 22, 90, '2017-12-10', 1035000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `display_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'ADMIN_PANEL', 'Admin Panel', 'Admin Panel Permission', NULL, '2017-11-23 20:57:44', '2017-11-23 20:57:44');

-- --------------------------------------------------------

--
-- Struktur dari tabel `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(1, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `display_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `parent` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `dept` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `parent`, `dept`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'SUPER_ADMIN', 'Super Admin', 'Full Access Role', 1, 1, NULL, '2017-11-23 20:57:41', '2017-11-23 20:57:41'),
(2, 'MANAGER', 'Manager', '', 2, 1, NULL, '2017-11-23 22:42:19', '2017-11-23 22:42:50'),
(3, 'PEMILIK', 'Pemilik', '', 3, 1, NULL, '2017-11-23 22:43:08', '2017-11-23 22:43:18');

-- --------------------------------------------------------

--
-- Struktur dari tabel `role_module`
--

CREATE TABLE `role_module` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `module_id` int(10) UNSIGNED NOT NULL,
  `acc_view` tinyint(1) NOT NULL,
  `acc_create` tinyint(1) NOT NULL,
  `acc_edit` tinyint(1) NOT NULL,
  `acc_delete` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `role_module`
--

INSERT INTO `role_module` (`id`, `role_id`, `module_id`, `acc_view`, `acc_create`, `acc_edit`, `acc_delete`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, 1, 1, '2017-11-23 20:57:41', '2017-11-23 20:57:41'),
(2, 1, 2, 1, 1, 1, 1, '2017-11-23 20:57:41', '2017-11-23 20:57:41'),
(3, 1, 3, 1, 1, 1, 1, '2017-11-23 20:57:42', '2017-11-23 20:57:42'),
(4, 1, 4, 1, 1, 1, 1, '2017-11-23 20:57:42', '2017-11-23 20:57:42'),
(5, 1, 5, 1, 1, 1, 1, '2017-11-23 20:57:43', '2017-11-23 20:57:43'),
(6, 1, 6, 1, 1, 1, 1, '2017-11-23 20:57:43', '2017-11-23 20:57:43'),
(7, 1, 7, 1, 1, 1, 1, '2017-11-23 20:57:43', '2017-11-23 20:57:43'),
(8, 1, 8, 1, 1, 1, 1, '2017-11-23 20:57:44', '2017-11-23 20:57:44'),
(9, 1, 9, 1, 1, 1, 1, '2017-11-23 21:00:26', '2017-11-23 21:00:26'),
(10, 1, 10, 1, 1, 1, 1, '2017-11-23 21:04:59', '2017-11-23 21:04:59'),
(11, 1, 11, 1, 1, 0, 0, '2017-11-23 21:11:15', '2017-11-23 21:11:15'),
(15, 2, 1, 0, 0, 0, 0, '2017-11-23 22:42:19', '2017-11-23 22:42:19'),
(16, 2, 2, 0, 0, 0, 0, '2017-11-23 22:42:19', '2017-11-23 22:42:19'),
(17, 2, 3, 0, 0, 0, 0, '2017-11-23 22:42:19', '2017-11-23 22:42:19'),
(18, 2, 4, 0, 0, 0, 0, '2017-11-23 22:42:19', '2017-11-23 22:42:19'),
(19, 2, 5, 0, 0, 0, 0, '2017-11-23 22:42:20', '2017-11-23 22:42:20'),
(20, 2, 6, 0, 0, 0, 0, '2017-11-23 22:42:20', '2017-11-23 22:42:20'),
(21, 2, 7, 0, 0, 0, 0, '2017-11-23 22:42:20', '2017-11-23 22:42:20'),
(22, 2, 8, 0, 0, 0, 0, '2017-11-23 22:42:20', '2017-11-23 22:42:20'),
(23, 2, 9, 1, 1, 1, 1, '2017-11-23 22:42:21', '2017-11-23 22:42:21'),
(24, 2, 10, 1, 1, 1, 1, '2017-11-23 22:42:21', '2017-11-23 22:42:21'),
(25, 2, 11, 1, 1, 0, 0, '2017-11-23 22:42:21', '2017-11-23 22:42:21'),
(28, 3, 1, 0, 0, 0, 0, '2017-11-23 22:43:08', '2017-11-23 22:43:08'),
(29, 3, 2, 0, 0, 0, 0, '2017-11-23 22:43:08', '2017-11-23 22:43:08'),
(30, 3, 3, 0, 0, 0, 0, '2017-11-23 22:43:08', '2017-11-23 22:43:08'),
(31, 3, 4, 0, 0, 0, 0, '2017-11-23 22:43:09', '2017-11-23 22:43:09'),
(32, 3, 5, 0, 0, 0, 0, '2017-11-23 22:43:09', '2017-11-23 22:43:09'),
(33, 3, 6, 0, 0, 0, 0, '2017-11-23 22:43:09', '2017-11-23 22:43:09'),
(34, 3, 7, 0, 0, 0, 0, '2017-11-23 22:43:10', '2017-11-23 22:43:10'),
(35, 3, 8, 0, 0, 0, 0, '2017-11-23 22:43:10', '2017-11-23 22:43:10'),
(36, 3, 9, 0, 0, 0, 0, '2017-11-23 22:43:10', '2017-11-23 22:43:10'),
(37, 3, 10, 0, 0, 0, 0, '2017-11-23 22:43:10', '2017-11-23 22:43:10'),
(38, 3, 11, 0, 0, 0, 0, '2017-11-23 22:43:10', '2017-11-23 22:43:10'),
(41, 1, 16, 1, 0, 0, 0, '2017-11-23 22:54:23', '2017-11-23 22:54:23'),
(48, 2, 16, 1, 0, 0, 0, '2017-11-24 01:21:29', '2017-11-24 01:21:29'),
(49, 3, 16, 1, 0, 0, 0, '2017-11-24 01:21:29', '2017-11-24 01:21:29'),
(50, 1, 19, 1, 1, 1, 1, '2017-12-08 23:50:45', '2017-12-08 23:50:45'),
(51, 2, 19, 1, 1, 1, 1, '2017-12-09 00:44:30', '2017-12-09 00:44:30'),
(52, 3, 19, 0, 0, 0, 0, '2017-12-09 00:44:30', '2017-12-09 00:44:30'),
(56, 1, 26, 1, 1, 1, 1, '2017-12-09 05:50:01', '2017-12-09 05:50:01'),
(57, 2, 26, 1, 1, 1, 1, '2017-12-09 05:51:34', '2017-12-09 05:51:34'),
(58, 3, 26, 1, 0, 1, 0, '2017-12-09 05:51:34', '2017-12-09 05:51:34');

-- --------------------------------------------------------

--
-- Struktur dari tabel `role_module_fields`
--

CREATE TABLE `role_module_fields` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `field_id` int(10) UNSIGNED NOT NULL,
  `access` enum('invisible','readonly','write') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `role_module_fields`
--

INSERT INTO `role_module_fields` (`id`, `role_id`, `field_id`, `access`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'write', '2017-11-23 20:57:41', '2017-11-23 20:57:41'),
(2, 1, 2, 'write', '2017-11-23 20:57:41', '2017-11-23 20:57:41'),
(3, 1, 3, 'write', '2017-11-23 20:57:41', '2017-11-23 20:57:41'),
(4, 1, 4, 'write', '2017-11-23 20:57:41', '2017-11-23 20:57:41'),
(5, 1, 5, 'write', '2017-11-23 20:57:41', '2017-11-23 20:57:41'),
(6, 1, 6, 'write', '2017-11-23 20:57:41', '2017-11-23 20:57:41'),
(7, 1, 7, 'write', '2017-11-23 20:57:41', '2017-11-23 20:57:41'),
(8, 1, 8, 'write', '2017-11-23 20:57:41', '2017-11-23 20:57:41'),
(9, 1, 9, 'write', '2017-11-23 20:57:41', '2017-11-23 20:57:41'),
(10, 1, 10, 'write', '2017-11-23 20:57:41', '2017-11-23 20:57:41'),
(11, 1, 11, 'write', '2017-11-23 20:57:41', '2017-11-23 20:57:41'),
(12, 1, 12, 'write', '2017-11-23 20:57:41', '2017-11-23 20:57:41'),
(13, 1, 13, 'write', '2017-11-23 20:57:42', '2017-11-23 20:57:42'),
(14, 1, 14, 'write', '2017-11-23 20:57:42', '2017-11-23 20:57:42'),
(15, 1, 15, 'write', '2017-11-23 20:57:42', '2017-11-23 20:57:42'),
(16, 1, 16, 'write', '2017-11-23 20:57:42', '2017-11-23 20:57:42'),
(17, 1, 17, 'write', '2017-11-23 20:57:42', '2017-11-23 20:57:42'),
(18, 1, 18, 'write', '2017-11-23 20:57:42', '2017-11-23 20:57:42'),
(19, 1, 19, 'write', '2017-11-23 20:57:42', '2017-11-23 20:57:42'),
(20, 1, 20, 'write', '2017-11-23 20:57:42', '2017-11-23 20:57:42'),
(21, 1, 21, 'write', '2017-11-23 20:57:42', '2017-11-23 20:57:42'),
(22, 1, 22, 'write', '2017-11-23 20:57:42', '2017-11-23 20:57:42'),
(23, 1, 23, 'write', '2017-11-23 20:57:42', '2017-11-23 20:57:42'),
(24, 1, 24, 'write', '2017-11-23 20:57:42', '2017-11-23 20:57:42'),
(25, 1, 25, 'write', '2017-11-23 20:57:42', '2017-11-23 20:57:42'),
(26, 1, 26, 'write', '2017-11-23 20:57:42', '2017-11-23 20:57:42'),
(27, 1, 27, 'write', '2017-11-23 20:57:42', '2017-11-23 20:57:42'),
(28, 1, 28, 'write', '2017-11-23 20:57:42', '2017-11-23 20:57:42'),
(29, 1, 29, 'write', '2017-11-23 20:57:42', '2017-11-23 20:57:42'),
(30, 1, 30, 'write', '2017-11-23 20:57:43', '2017-11-23 20:57:43'),
(31, 1, 31, 'write', '2017-11-23 20:57:43', '2017-11-23 20:57:43'),
(32, 1, 32, 'write', '2017-11-23 20:57:43', '2017-11-23 20:57:43'),
(33, 1, 33, 'write', '2017-11-23 20:57:43', '2017-11-23 20:57:43'),
(34, 1, 34, 'write', '2017-11-23 20:57:43', '2017-11-23 20:57:43'),
(35, 1, 35, 'write', '2017-11-23 20:57:43', '2017-11-23 20:57:43'),
(36, 1, 36, 'write', '2017-11-23 20:57:43', '2017-11-23 20:57:43'),
(37, 1, 37, 'write', '2017-11-23 20:57:43', '2017-11-23 20:57:43'),
(38, 1, 38, 'write', '2017-11-23 20:57:43', '2017-11-23 20:57:43'),
(39, 1, 39, 'write', '2017-11-23 20:57:43', '2017-11-23 20:57:43'),
(40, 1, 40, 'write', '2017-11-23 20:57:43', '2017-11-23 20:57:43'),
(41, 1, 41, 'write', '2017-11-23 20:57:43', '2017-11-23 20:57:43'),
(42, 1, 42, 'write', '2017-11-23 20:57:43', '2017-11-23 20:57:43'),
(43, 1, 43, 'write', '2017-11-23 20:57:43', '2017-11-23 20:57:43'),
(44, 1, 44, 'write', '2017-11-23 20:57:43', '2017-11-23 20:57:43'),
(45, 1, 45, 'write', '2017-11-23 20:57:43', '2017-11-23 20:57:43'),
(46, 1, 46, 'write', '2017-11-23 20:57:43', '2017-11-23 20:57:43'),
(47, 1, 47, 'write', '2017-11-23 20:57:43', '2017-11-23 20:57:43'),
(48, 1, 48, 'write', '2017-11-23 20:57:43', '2017-11-23 20:57:43'),
(49, 1, 49, 'write', '2017-11-23 20:57:44', '2017-11-23 20:57:44'),
(50, 1, 50, 'write', '2017-11-23 20:57:44', '2017-11-23 20:57:44'),
(51, 1, 51, 'write', '2017-11-23 20:57:44', '2017-11-23 20:57:44'),
(52, 1, 52, 'write', '2017-11-23 20:58:53', '2017-11-23 20:58:53'),
(53, 1, 53, 'write', '2017-11-23 20:59:12', '2017-11-23 20:59:12'),
(54, 1, 54, 'write', '2017-11-23 20:59:34', '2017-11-23 20:59:34'),
(55, 1, 55, 'write', '2017-11-23 20:59:51', '2017-11-23 20:59:51'),
(56, 1, 56, 'readonly', '2017-11-23 21:00:09', '2017-11-23 21:00:09'),
(57, 1, 57, 'write', '2017-11-23 21:03:49', '2017-11-23 21:03:49'),
(58, 1, 58, 'write', '2017-11-23 21:04:10', '2017-11-23 21:04:10'),
(59, 1, 59, 'readonly', '2017-11-23 21:04:39', '2017-11-23 21:04:39'),
(60, 1, 60, 'write', '2017-11-23 21:08:26', '2017-11-23 21:08:26'),
(61, 1, 61, 'write', '2017-11-23 21:08:44', '2017-11-23 21:08:44'),
(62, 1, 62, 'write', '2017-11-23 21:09:10', '2017-11-23 21:09:10'),
(69, 2, 1, 'readonly', '2017-11-23 22:42:19', '2017-11-23 22:42:19'),
(70, 2, 2, 'readonly', '2017-11-23 22:42:19', '2017-11-23 22:42:19'),
(71, 2, 3, 'readonly', '2017-11-23 22:42:19', '2017-11-23 22:42:19'),
(72, 2, 4, 'readonly', '2017-11-23 22:42:19', '2017-11-23 22:42:19'),
(73, 2, 5, 'readonly', '2017-11-23 22:42:19', '2017-11-23 22:42:19'),
(74, 2, 6, 'readonly', '2017-11-23 22:42:19', '2017-11-23 22:42:19'),
(75, 2, 7, 'readonly', '2017-11-23 22:42:19', '2017-11-23 22:42:19'),
(76, 2, 8, 'readonly', '2017-11-23 22:42:19', '2017-11-23 22:42:19'),
(77, 2, 9, 'readonly', '2017-11-23 22:42:19', '2017-11-23 22:42:19'),
(78, 2, 10, 'readonly', '2017-11-23 22:42:19', '2017-11-23 22:42:19'),
(79, 2, 11, 'readonly', '2017-11-23 22:42:19', '2017-11-23 22:42:19'),
(80, 2, 12, 'readonly', '2017-11-23 22:42:19', '2017-11-23 22:42:19'),
(81, 2, 13, 'readonly', '2017-11-23 22:42:19', '2017-11-23 22:42:19'),
(82, 2, 14, 'readonly', '2017-11-23 22:42:19', '2017-11-23 22:42:19'),
(83, 2, 15, 'readonly', '2017-11-23 22:42:19', '2017-11-23 22:42:19'),
(84, 2, 16, 'readonly', '2017-11-23 22:42:19', '2017-11-23 22:42:19'),
(85, 2, 17, 'readonly', '2017-11-23 22:42:19', '2017-11-23 22:42:19'),
(86, 2, 18, 'readonly', '2017-11-23 22:42:19', '2017-11-23 22:42:19'),
(87, 2, 19, 'readonly', '2017-11-23 22:42:19', '2017-11-23 22:42:19'),
(88, 2, 20, 'readonly', '2017-11-23 22:42:19', '2017-11-23 22:42:19'),
(89, 2, 21, 'readonly', '2017-11-23 22:42:19', '2017-11-23 22:42:19'),
(90, 2, 22, 'readonly', '2017-11-23 22:42:19', '2017-11-23 22:42:19'),
(91, 2, 23, 'readonly', '2017-11-23 22:42:19', '2017-11-23 22:42:19'),
(92, 2, 24, 'readonly', '2017-11-23 22:42:19', '2017-11-23 22:42:19'),
(93, 2, 25, 'readonly', '2017-11-23 22:42:19', '2017-11-23 22:42:19'),
(94, 2, 26, 'readonly', '2017-11-23 22:42:19', '2017-11-23 22:42:19'),
(95, 2, 27, 'readonly', '2017-11-23 22:42:19', '2017-11-23 22:42:19'),
(96, 2, 28, 'readonly', '2017-11-23 22:42:19', '2017-11-23 22:42:19'),
(97, 2, 29, 'readonly', '2017-11-23 22:42:19', '2017-11-23 22:42:19'),
(98, 2, 30, 'readonly', '2017-11-23 22:42:20', '2017-11-23 22:42:20'),
(99, 2, 31, 'readonly', '2017-11-23 22:42:20', '2017-11-23 22:42:20'),
(100, 2, 32, 'readonly', '2017-11-23 22:42:20', '2017-11-23 22:42:20'),
(101, 2, 33, 'readonly', '2017-11-23 22:42:20', '2017-11-23 22:42:20'),
(102, 2, 34, 'readonly', '2017-11-23 22:42:20', '2017-11-23 22:42:20'),
(103, 2, 35, 'readonly', '2017-11-23 22:42:20', '2017-11-23 22:42:20'),
(104, 2, 36, 'readonly', '2017-11-23 22:42:20', '2017-11-23 22:42:20'),
(105, 2, 37, 'readonly', '2017-11-23 22:42:20', '2017-11-23 22:42:20'),
(106, 2, 38, 'readonly', '2017-11-23 22:42:20', '2017-11-23 22:42:20'),
(107, 2, 39, 'readonly', '2017-11-23 22:42:20', '2017-11-23 22:42:20'),
(108, 2, 40, 'readonly', '2017-11-23 22:42:20', '2017-11-23 22:42:20'),
(109, 2, 41, 'readonly', '2017-11-23 22:42:20', '2017-11-23 22:42:20'),
(110, 2, 42, 'readonly', '2017-11-23 22:42:20', '2017-11-23 22:42:20'),
(111, 2, 43, 'readonly', '2017-11-23 22:42:20', '2017-11-23 22:42:20'),
(112, 2, 44, 'readonly', '2017-11-23 22:42:20', '2017-11-23 22:42:20'),
(113, 2, 45, 'readonly', '2017-11-23 22:42:20', '2017-11-23 22:42:20'),
(114, 2, 46, 'readonly', '2017-11-23 22:42:20', '2017-11-23 22:42:20'),
(115, 2, 47, 'readonly', '2017-11-23 22:42:20', '2017-11-23 22:42:20'),
(116, 2, 48, 'readonly', '2017-11-23 22:42:20', '2017-11-23 22:42:20'),
(117, 2, 49, 'readonly', '2017-11-23 22:42:20', '2017-11-23 22:42:20'),
(118, 2, 50, 'readonly', '2017-11-23 22:42:20', '2017-11-23 22:42:20'),
(119, 2, 51, 'readonly', '2017-11-23 22:42:20', '2017-11-23 22:42:20'),
(120, 2, 52, 'write', '2017-11-23 22:42:21', '2017-11-23 22:42:21'),
(121, 2, 53, 'write', '2017-11-23 22:42:21', '2017-11-23 22:42:21'),
(122, 2, 54, 'write', '2017-11-23 22:42:21', '2017-11-23 22:42:21'),
(123, 2, 55, 'write', '2017-11-23 22:42:21', '2017-11-23 22:42:21'),
(124, 2, 56, 'write', '2017-11-23 22:42:21', '2017-11-23 22:42:21'),
(125, 2, 57, 'write', '2017-11-23 22:42:21', '2017-11-23 22:42:21'),
(126, 2, 58, 'write', '2017-11-23 22:42:21', '2017-11-23 22:42:21'),
(127, 2, 59, 'readonly', '2017-11-23 22:42:21', '2017-11-23 22:42:21'),
(128, 2, 60, 'write', '2017-11-23 22:42:21', '2017-11-23 22:42:21'),
(129, 2, 61, 'write', '2017-11-23 22:42:21', '2017-11-23 22:42:21'),
(130, 2, 62, 'write', '2017-11-23 22:42:21', '2017-11-23 22:42:21'),
(135, 3, 1, 'readonly', '2017-11-23 22:43:08', '2017-11-23 22:43:08'),
(136, 3, 2, 'readonly', '2017-11-23 22:43:08', '2017-11-23 22:43:08'),
(137, 3, 3, 'readonly', '2017-11-23 22:43:08', '2017-11-23 22:43:08'),
(138, 3, 4, 'readonly', '2017-11-23 22:43:08', '2017-11-23 22:43:08'),
(139, 3, 5, 'readonly', '2017-11-23 22:43:08', '2017-11-23 22:43:08'),
(140, 3, 6, 'readonly', '2017-11-23 22:43:08', '2017-11-23 22:43:08'),
(141, 3, 7, 'readonly', '2017-11-23 22:43:08', '2017-11-23 22:43:08'),
(142, 3, 8, 'readonly', '2017-11-23 22:43:08', '2017-11-23 22:43:08'),
(143, 3, 9, 'readonly', '2017-11-23 22:43:08', '2017-11-23 22:43:08'),
(144, 3, 10, 'readonly', '2017-11-23 22:43:08', '2017-11-23 22:43:08'),
(145, 3, 11, 'readonly', '2017-11-23 22:43:08', '2017-11-23 22:43:08'),
(146, 3, 12, 'readonly', '2017-11-23 22:43:08', '2017-11-23 22:43:08'),
(147, 3, 13, 'readonly', '2017-11-23 22:43:08', '2017-11-23 22:43:08'),
(148, 3, 14, 'readonly', '2017-11-23 22:43:08', '2017-11-23 22:43:08'),
(149, 3, 15, 'readonly', '2017-11-23 22:43:08', '2017-11-23 22:43:08'),
(150, 3, 16, 'readonly', '2017-11-23 22:43:09', '2017-11-23 22:43:09'),
(151, 3, 17, 'readonly', '2017-11-23 22:43:09', '2017-11-23 22:43:09'),
(152, 3, 18, 'readonly', '2017-11-23 22:43:09', '2017-11-23 22:43:09'),
(153, 3, 19, 'readonly', '2017-11-23 22:43:09', '2017-11-23 22:43:09'),
(154, 3, 20, 'readonly', '2017-11-23 22:43:09', '2017-11-23 22:43:09'),
(155, 3, 21, 'readonly', '2017-11-23 22:43:09', '2017-11-23 22:43:09'),
(156, 3, 22, 'readonly', '2017-11-23 22:43:09', '2017-11-23 22:43:09'),
(157, 3, 23, 'readonly', '2017-11-23 22:43:09', '2017-11-23 22:43:09'),
(158, 3, 24, 'readonly', '2017-11-23 22:43:09', '2017-11-23 22:43:09'),
(159, 3, 25, 'readonly', '2017-11-23 22:43:09', '2017-11-23 22:43:09'),
(160, 3, 26, 'readonly', '2017-11-23 22:43:09', '2017-11-23 22:43:09'),
(161, 3, 27, 'readonly', '2017-11-23 22:43:09', '2017-11-23 22:43:09'),
(162, 3, 28, 'readonly', '2017-11-23 22:43:09', '2017-11-23 22:43:09'),
(163, 3, 29, 'readonly', '2017-11-23 22:43:09', '2017-11-23 22:43:09'),
(164, 3, 30, 'readonly', '2017-11-23 22:43:09', '2017-11-23 22:43:09'),
(165, 3, 31, 'readonly', '2017-11-23 22:43:09', '2017-11-23 22:43:09'),
(166, 3, 32, 'readonly', '2017-11-23 22:43:09', '2017-11-23 22:43:09'),
(167, 3, 33, 'readonly', '2017-11-23 22:43:09', '2017-11-23 22:43:09'),
(168, 3, 34, 'readonly', '2017-11-23 22:43:09', '2017-11-23 22:43:09'),
(169, 3, 35, 'readonly', '2017-11-23 22:43:09', '2017-11-23 22:43:09'),
(170, 3, 36, 'readonly', '2017-11-23 22:43:09', '2017-11-23 22:43:09'),
(171, 3, 37, 'readonly', '2017-11-23 22:43:09', '2017-11-23 22:43:09'),
(172, 3, 38, 'readonly', '2017-11-23 22:43:09', '2017-11-23 22:43:09'),
(173, 3, 39, 'readonly', '2017-11-23 22:43:09', '2017-11-23 22:43:09'),
(174, 3, 40, 'readonly', '2017-11-23 22:43:09', '2017-11-23 22:43:09'),
(175, 3, 41, 'readonly', '2017-11-23 22:43:09', '2017-11-23 22:43:09'),
(176, 3, 42, 'readonly', '2017-11-23 22:43:09', '2017-11-23 22:43:09'),
(177, 3, 43, 'readonly', '2017-11-23 22:43:09', '2017-11-23 22:43:09'),
(178, 3, 44, 'readonly', '2017-11-23 22:43:09', '2017-11-23 22:43:09'),
(179, 3, 45, 'readonly', '2017-11-23 22:43:09', '2017-11-23 22:43:09'),
(180, 3, 46, 'readonly', '2017-11-23 22:43:10', '2017-11-23 22:43:10'),
(181, 3, 47, 'readonly', '2017-11-23 22:43:10', '2017-11-23 22:43:10'),
(182, 3, 48, 'readonly', '2017-11-23 22:43:10', '2017-11-23 22:43:10'),
(183, 3, 49, 'readonly', '2017-11-23 22:43:10', '2017-11-23 22:43:10'),
(184, 3, 50, 'readonly', '2017-11-23 22:43:10', '2017-11-23 22:43:10'),
(185, 3, 51, 'readonly', '2017-11-23 22:43:10', '2017-11-23 22:43:10'),
(186, 3, 52, 'readonly', '2017-11-23 22:43:10', '2017-11-23 22:43:10'),
(187, 3, 53, 'readonly', '2017-11-23 22:43:10', '2017-11-23 22:43:10'),
(188, 3, 54, 'readonly', '2017-11-23 22:43:10', '2017-11-23 22:43:10'),
(189, 3, 55, 'readonly', '2017-11-23 22:43:10', '2017-11-23 22:43:10'),
(190, 3, 56, 'readonly', '2017-11-23 22:43:10', '2017-11-23 22:43:10'),
(191, 3, 57, 'readonly', '2017-11-23 22:43:10', '2017-11-23 22:43:10'),
(192, 3, 58, 'readonly', '2017-11-23 22:43:10', '2017-11-23 22:43:10'),
(193, 3, 59, 'readonly', '2017-11-23 22:43:10', '2017-11-23 22:43:10'),
(194, 3, 60, 'readonly', '2017-11-23 22:43:10', '2017-11-23 22:43:10'),
(195, 3, 61, 'readonly', '2017-11-23 22:43:10', '2017-11-23 22:43:10'),
(196, 3, 62, 'readonly', '2017-11-23 22:43:10', '2017-11-23 22:43:10'),
(201, 1, 69, 'write', '2017-11-23 22:48:14', '2017-11-23 22:48:14'),
(230, 2, 69, 'write', '2017-11-24 01:21:29', '2017-11-24 01:21:29'),
(233, 3, 69, 'readonly', '2017-11-24 01:21:29', '2017-11-24 01:21:29'),
(236, 1, 82, 'write', '2017-12-08 23:49:53', '2017-12-08 23:49:53'),
(237, 1, 83, 'write', '2017-12-08 23:50:37', '2017-12-08 23:50:37'),
(238, 1, 84, 'write', '2017-12-08 23:57:42', '2017-12-08 23:57:42'),
(239, 2, 82, 'write', '2017-12-09 00:44:30', '2017-12-09 00:44:30'),
(240, 2, 83, 'write', '2017-12-09 00:44:30', '2017-12-09 00:44:30'),
(241, 3, 82, 'invisible', '2017-12-09 00:44:30', '2017-12-09 00:44:30'),
(242, 3, 83, 'invisible', '2017-12-09 00:44:30', '2017-12-09 00:44:30'),
(263, 1, 105, 'readonly', '2017-12-09 05:19:56', '2017-12-09 05:19:56'),
(265, 1, 107, 'write', '2017-12-09 05:42:26', '2017-12-09 05:42:26'),
(266, 1, 108, 'write', '2017-12-09 05:43:07', '2017-12-09 05:43:07'),
(267, 1, 109, 'write', '2017-12-09 05:43:55', '2017-12-09 05:43:55'),
(268, 1, 110, 'readonly', '2017-12-09 05:45:28', '2017-12-09 05:45:28'),
(269, 1, 111, 'readonly', '2017-12-09 05:46:30', '2017-12-09 05:46:30'),
(270, 1, 112, 'write', '2017-12-09 05:49:57', '2017-12-09 05:49:57'),
(271, 2, 107, 'write', '2017-12-09 05:51:34', '2017-12-09 05:51:34'),
(272, 2, 108, 'write', '2017-12-09 05:51:34', '2017-12-09 05:51:34'),
(273, 2, 109, 'write', '2017-12-09 05:51:34', '2017-12-09 05:51:34'),
(274, 2, 110, 'readonly', '2017-12-09 05:51:34', '2017-12-09 05:51:34'),
(275, 2, 111, 'readonly', '2017-12-09 05:51:34', '2017-12-09 05:51:34'),
(276, 2, 112, 'readonly', '2017-12-09 05:51:34', '2017-12-09 05:51:34'),
(277, 3, 107, 'readonly', '2017-12-09 05:51:34', '2017-12-09 05:51:34'),
(278, 3, 108, 'readonly', '2017-12-09 05:51:34', '2017-12-09 05:51:34'),
(279, 3, 109, 'readonly', '2017-12-09 05:51:34', '2017-12-09 05:51:34'),
(280, 3, 110, 'readonly', '2017-12-09 05:51:34', '2017-12-09 05:51:34'),
(281, 3, 111, 'readonly', '2017-12-09 05:51:34', '2017-12-09 05:51:34'),
(282, 3, 112, 'write', '2017-12-09 05:51:34', '2017-12-09 05:51:34'),
(283, 1, 113, 'write', '2017-12-09 06:07:08', '2017-12-09 06:07:08'),
(284, 1, 114, 'write', '2017-12-09 06:08:59', '2017-12-09 06:08:59'),
(288, 1, 118, 'readonly', '2017-12-09 07:31:08', '2017-12-09 07:31:08'),
(289, 2, 118, 'readonly', '2017-12-09 07:31:47', '2017-12-09 07:31:47'),
(290, 3, 118, 'invisible', '2017-12-09 07:31:47', '2017-12-09 07:31:47'),
(291, 2, 84, 'readonly', '2017-12-09 21:04:42', '2017-12-09 21:04:42'),
(292, 3, 84, 'invisible', '2017-12-09 21:04:42', '2017-12-09 21:04:42'),
(293, 2, 105, 'readonly', '2017-12-09 21:05:02', '2017-12-09 21:05:02'),
(294, 3, 105, 'invisible', '2017-12-09 21:05:02', '2017-12-09 21:05:02'),
(295, 2, 113, 'write', '2017-12-09 21:06:40', '2017-12-09 21:06:40'),
(296, 2, 114, 'readonly', '2017-12-09 21:06:40', '2017-12-09 21:06:40'),
(297, 3, 113, 'invisible', '2017-12-09 21:06:40', '2017-12-09 21:06:40'),
(298, 3, 114, 'invisible', '2017-12-09 21:06:40', '2017-12-09 21:06:40');

-- --------------------------------------------------------

--
-- Struktur dari tabel `role_user`
--

CREATE TABLE `role_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `role_user`
--

INSERT INTO `role_user` (`id`, `role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 2, 2, NULL, NULL),
(3, 3, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `rumus`
--

CREATE TABLE `rumus` (
  `single_ex` float NOT NULL,
  `double_ex` float NOT NULL,
  `at` float NOT NULL,
  `bt` float NOT NULL,
  `rekomendasi` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rumus`
--

INSERT INTO `rumus` (`single_ex`, `double_ex`, `at`, `bt`, `rekomendasi`) VALUES
(0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `stocks`
--

CREATE TABLE `stocks` (
  `id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `kode_barang` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `jumlah_barang` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `harga_total` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `kategori` int(10) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `stocks`
--

INSERT INTO `stocks` (`id`, `deleted_at`, `created_at`, `updated_at`, `kode_barang`, `jumlah_barang`, `harga_total`, `kategori`) VALUES
(1, NULL, '2017-12-09 22:00:41', '2017-12-09 22:00:41', 21, 20, '230000', 1),
(2, NULL, '2017-12-09 22:01:53', '2017-12-09 22:01:53', 22, 90, '1035000', 1),
(3, '2017-12-09 23:31:06', '2017-12-09 23:31:01', '2017-12-09 23:31:06', 21, 0, '0', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `uploads`
--

CREATE TABLE `uploads` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `path` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `extension` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `caption` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `hash` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `public` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `context_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `email` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Employee',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `context_id`, `email`, `password`, `type`, `remember_token`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'admin', 1, 'admin@admin.com', '$2y$10$oAPa2tgJHF1T9spCGGYH1ObbEicesxmakBxgbB5b5GomfzthfUH32', 'Employee', 'M029XK0QxAgLjUFpfEZe5odUliO8WmagM8Ij35Kwp9L0U2r2nTl1pAZuUZlO', NULL, '2017-11-23 20:57:54', '2017-12-09 23:31:58'),
(2, 'Manager', 2, 'manager@manager.com', '$2y$10$oAPa2tgJHF1T9spCGGYH1ObbEicesxmakBxgbB5b5GomfzthfUH32', 'Employee', 'n9xVkukj2MeATOnrl1RySQE9V9F5DyQ60CSBRaRQyZ1phB6nDDoj2ftSe8wg', NULL, '2017-11-23 22:44:18', '2017-12-09 22:48:37'),
(3, 'Pemilik', 3, 'pemilik@pemilik.com', '$2y$10$NAaDKLtbOa12XSyOcm.u.ekXlt4j9XpK/17iPLxDm7uW0clmK8QtS', 'Employee', '25thBwx73q1WZOESIuB4p6mqloIqmEXsSYtUEd046dog5AR3QTywLyDXin6Z', NULL, '2017-11-23 22:45:25', '2017-12-09 10:05:41');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `backups`
--
ALTER TABLE `backups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `backups_name_unique` (`name`),
  ADD UNIQUE KEY `backups_file_name_unique` (`file_name`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `departments_name_unique` (`name`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employees_email_unique` (`email`),
  ADD KEY `employees_dept_foreign` (`dept`);

--
-- Indexes for table `kategoris`
--
ALTER TABLE `kategoris`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kodbars`
--
ALTER TABLE `kodbars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `laporans`
--
ALTER TABLE `laporans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `laporans_kode_barang_foreign` (`kode_barang`);

--
-- Indexes for table `la_configs`
--
ALTER TABLE `la_configs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `la_menus`
--
ALTER TABLE `la_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `module_fields`
--
ALTER TABLE `module_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `module_fields_module_foreign` (`module`),
  ADD KEY `module_fields_field_type_foreign` (`field_type`);

--
-- Indexes for table `module_field_types`
--
ALTER TABLE `module_field_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `organizations`
--
ALTER TABLE `organizations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `organizations_name_unique` (`name`),
  ADD UNIQUE KEY `organizations_email_unique` (`email`),
  ADD KEY `organizations_assigned_to_foreign` (`assigned_to`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `pemesanans`
--
ALTER TABLE `pemesanans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pemesanans_kode_barang_foreign` (`kode_barang`),
  ADD KEY `pemesanans_kategori_barang_foreign` (`kategori_barang`);

--
-- Indexes for table `penjualans`
--
ALTER TABLE `penjualans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `penjualans_kode_barang_foreign` (`kode_barang`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`),
  ADD KEY `roles_parent_foreign` (`parent`),
  ADD KEY `roles_dept_foreign` (`dept`);

--
-- Indexes for table `role_module`
--
ALTER TABLE `role_module`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_module_role_id_foreign` (`role_id`),
  ADD KEY `role_module_module_id_foreign` (`module_id`);

--
-- Indexes for table `role_module_fields`
--
ALTER TABLE `role_module_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_module_fields_role_id_foreign` (`role_id`),
  ADD KEY `role_module_fields_field_id_foreign` (`field_id`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`),
  ADD KEY `role_user_user_id_foreign` (`user_id`);

--
-- Indexes for table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stocks_kode_barang_foreign` (`kode_barang`),
  ADD KEY `stocks_kategori_foreign` (`kategori`);

--
-- Indexes for table `uploads`
--
ALTER TABLE `uploads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uploads_user_id_foreign` (`user_id`);

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
-- AUTO_INCREMENT for table `backups`
--
ALTER TABLE `backups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `kategoris`
--
ALTER TABLE `kategoris`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `kodbars`
--
ALTER TABLE `kodbars`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `laporans`
--
ALTER TABLE `laporans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `la_configs`
--
ALTER TABLE `la_configs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `la_menus`
--
ALTER TABLE `la_menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `module_fields`
--
ALTER TABLE `module_fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;
--
-- AUTO_INCREMENT for table `module_field_types`
--
ALTER TABLE `module_field_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `organizations`
--
ALTER TABLE `organizations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pemesanans`
--
ALTER TABLE `pemesanans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `penjualans`
--
ALTER TABLE `penjualans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;
--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `role_module`
--
ALTER TABLE `role_module`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;
--
-- AUTO_INCREMENT for table `role_module_fields`
--
ALTER TABLE `role_module_fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=299;
--
-- AUTO_INCREMENT for table `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `stocks`
--
ALTER TABLE `stocks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `uploads`
--
ALTER TABLE `uploads`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_dept_foreign` FOREIGN KEY (`dept`) REFERENCES `departments` (`id`);

--
-- Ketidakleluasaan untuk tabel `laporans`
--
ALTER TABLE `laporans`
  ADD CONSTRAINT `laporans_kode_barang_foreign` FOREIGN KEY (`kode_barang`) REFERENCES `kodbars` (`id`);

--
-- Ketidakleluasaan untuk tabel `module_fields`
--
ALTER TABLE `module_fields`
  ADD CONSTRAINT `module_fields_field_type_foreign` FOREIGN KEY (`field_type`) REFERENCES `module_field_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `module_fields_module_foreign` FOREIGN KEY (`module`) REFERENCES `modules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `organizations`
--
ALTER TABLE `organizations`
  ADD CONSTRAINT `organizations_assigned_to_foreign` FOREIGN KEY (`assigned_to`) REFERENCES `employees` (`id`);

--
-- Ketidakleluasaan untuk tabel `pemesanans`
--
ALTER TABLE `pemesanans`
  ADD CONSTRAINT `pemesanans_kategori_barang_foreign` FOREIGN KEY (`kategori_barang`) REFERENCES `kategoris` (`id`),
  ADD CONSTRAINT `pemesanans_kode_barang_foreign` FOREIGN KEY (`kode_barang`) REFERENCES `kodbars` (`id`);

--
-- Ketidakleluasaan untuk tabel `penjualans`
--
ALTER TABLE `penjualans`
  ADD CONSTRAINT `penjualans_kode_barang_foreign` FOREIGN KEY (`kode_barang`) REFERENCES `kodbars` (`id`);

--
-- Ketidakleluasaan untuk tabel `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `roles_dept_foreign` FOREIGN KEY (`dept`) REFERENCES `departments` (`id`),
  ADD CONSTRAINT `roles_parent_foreign` FOREIGN KEY (`parent`) REFERENCES `roles` (`id`);

--
-- Ketidakleluasaan untuk tabel `role_module`
--
ALTER TABLE `role_module`
  ADD CONSTRAINT `role_module_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_module_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `role_module_fields`
--
ALTER TABLE `role_module_fields`
  ADD CONSTRAINT `role_module_fields_field_id_foreign` FOREIGN KEY (`field_id`) REFERENCES `module_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_module_fields_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `stocks`
--
ALTER TABLE `stocks`
  ADD CONSTRAINT `stocks_kategori_foreign` FOREIGN KEY (`kategori`) REFERENCES `kategoris` (`id`),
  ADD CONSTRAINT `stocks_kode_barang_foreign` FOREIGN KEY (`kode_barang`) REFERENCES `kodbars` (`id`);

--
-- Ketidakleluasaan untuk tabel `uploads`
--
ALTER TABLE `uploads`
  ADD CONSTRAINT `uploads_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
