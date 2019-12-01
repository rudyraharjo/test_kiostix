-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               5.7.24 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             9.5.0.5332
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table _bukumasadepan.author
CREATE TABLE IF NOT EXISTS `author` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bio` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table _bukumasadepan.author: ~5 rows (approximately)
DELETE FROM `author`;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` (`id`, `name`, `bio`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Bambang Opsar', 'Bio', '2019-11-29 17:36:44', '2019-11-29 17:36:44', NULL),
	(2, 'Didit Darmadi', 'Bio', '2019-11-29 17:36:44', '2019-11-29 17:36:44', NULL),
	(3, 'Rudy Raharjo', 'Bio', '2019-12-01 18:02:07', '2019-12-01 18:39:41', NULL),
	(4, 'Anisa update', 'Bawel update', '2019-12-01 18:32:21', '2019-12-01 18:39:32', NULL),
	(5, 'Saya', 'Cups', '2019-12-01 18:32:33', '2019-12-01 18:39:21', '2019-12-01 18:39:21');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;

-- Dumping structure for table _bukumasadepan.books
CREATE TABLE IF NOT EXISTS `books` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_categorybook` int(11) NOT NULL DEFAULT '1',
  `author` int(11) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table _bukumasadepan.books: ~4 rows (approximately)
DELETE FROM `books`;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` (`id`, `id_categorybook`, `author`, `name`, `pic`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 2, 2, 'Buku Satu update', 'http://localhost/bukumasadepan/public/uploads/book/bukupertama-1575115692-569962997.jpg', 'keterangan Update', '2019-11-30 19:08:12', '2019-12-01 08:41:16', '2019-12-01 08:41:16'),
	(2, 1, 1, 'Buku kedua', 'http://localhost/bukumasadepan/public/uploads/book/bukukedua-1575164247-602317830.jpg', 'Deskripsi', '2019-12-01 08:37:27', '2019-12-01 08:37:27', NULL),
	(3, 1, 2, 'Nama Buku', 'http://localhost/bukumasadepan/public/uploads/book/namabuku-1575200526-1342213505.jpg', 'Keterangan', '2019-12-01 18:42:06', '2019-12-01 18:42:31', NULL),
	(4, 1, 1, 'Test', 'http://localhost/bukumasadepan/public/uploads/book/test-1575203447-1844303359.jpg', 'Kete', '2019-12-01 19:30:47', '2019-12-01 19:30:47', NULL);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;

-- Dumping structure for table _bukumasadepan.book_categories
CREATE TABLE IF NOT EXISTS `book_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table _bukumasadepan.book_categories: ~8 rows (approximately)
DELETE FROM `book_categories`;
/*!40000 ALTER TABLE `book_categories` DISABLE KEYS */;
INSERT INTO `book_categories` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Ilmu Pengetahuan Sosial', '2019-11-29 17:36:45', '2019-12-01 09:56:22', NULL),
	(2, 'Hukum', '2019-11-29 17:36:45', '2019-12-01 09:56:15', NULL),
	(3, 'Bimbingan Konseling', '2019-12-01 08:53:22', '2019-12-01 09:56:50', NULL),
	(4, 'Ilmu Pengetahuan Alam', '2019-12-01 08:56:33', '2019-12-01 09:55:43', NULL),
	(5, 'Story', '2019-12-01 09:06:18', '2019-12-01 09:55:08', NULL),
	(6, 'Example', '2019-12-01 09:57:38', '2019-12-01 10:04:00', '2019-12-01 10:04:00'),
	(7, 'Example Kategori Update', '2019-12-01 17:56:51', '2019-12-01 17:57:03', '2019-12-01 17:57:03'),
	(8, 'Buku Kocak', '2019-12-01 18:41:36', '2019-12-01 18:41:41', '2019-12-01 18:41:41');
/*!40000 ALTER TABLE `book_categories` ENABLE KEYS */;

-- Dumping structure for table _bukumasadepan.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table _bukumasadepan.failed_jobs: ~0 rows (approximately)
DELETE FROM `failed_jobs`;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Dumping structure for table _bukumasadepan.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table _bukumasadepan.migrations: ~12 rows (approximately)
DELETE FROM `migrations`;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
	(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
	(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
	(6, '2016_06_01_000004_create_oauth_clients_table', 1),
	(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
	(8, '2019_08_19_000000_create_failed_jobs_table', 1),
	(9, '2019_10_03_155901_create_books_table', 1),
	(10, '2019_10_10_155702_create_book_categories_table', 1),
	(11, '2019_10_14_223323_create_permission_tables', 1),
	(12, '2019_11_29_144654_create_author_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table _bukumasadepan.model_has_permissions
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table _bukumasadepan.model_has_permissions: ~0 rows (approximately)
DELETE FROM `model_has_permissions`;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;

-- Dumping structure for table _bukumasadepan.model_has_roles
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` int(10) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table _bukumasadepan.model_has_roles: ~2 rows (approximately)
DELETE FROM `model_has_roles`;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
	(2, 'App\\User', 1),
	(1, 'App\\User', 2);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;

-- Dumping structure for table _bukumasadepan.oauth_access_tokens
CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table _bukumasadepan.oauth_access_tokens: ~3 rows (approximately)
DELETE FROM `oauth_access_tokens`;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
	('664614d747f81020885b9c960656b1b049e94fde585a3e19c34de477674a3fc3a15dc430a6e17b26', 1, 2, NULL, '["super-admin"]', 0, '2019-11-29 17:42:18', '2019-11-29 17:42:18', '2020-11-29 17:42:18'),
	('aca4a5abbd8b94ae6b6691d7a881ce39e279146a1623c7791af5584cfc2a5bc7e3f9180ee03c4ca6', 1, 2, NULL, '["super-admin"]', 0, '2019-11-29 17:39:04', '2019-11-29 17:39:04', '2020-11-29 17:39:04'),
	('c5b266b04d1d3e28779bc2f3b26a3c142f1afbf09154adb3894291efed519d2376dc495e54504219', 1, 2, NULL, '["super-admin"]', 0, '2019-12-01 17:55:51', '2019-12-01 17:55:51', '2020-12-01 17:55:51');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;

-- Dumping structure for table _bukumasadepan.oauth_auth_codes
CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table _bukumasadepan.oauth_auth_codes: ~0 rows (approximately)
DELETE FROM `oauth_auth_codes`;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;

-- Dumping structure for table _bukumasadepan.oauth_clients
CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table _bukumasadepan.oauth_clients: ~2 rows (approximately)
DELETE FROM `oauth_clients`;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
	(1, NULL, 'BukuMasaDepan Personal Access Client', 'jd6r4rZqh02HLR4AXlpsOcho5rY7aUK84aXwjAAG', 'http://localhost', 1, 0, 0, '2019-11-29 17:37:00', '2019-11-29 17:37:00'),
	(2, NULL, 'BukuMasaDepan Password Grant Client', 'P3IYeCWzsFGNl9aqN1eB4E6I3Ub3yVg7wyjVRpNE', 'http://localhost', 0, 1, 0, '2019-11-29 17:37:00', '2019-11-29 17:37:00');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;

-- Dumping structure for table _bukumasadepan.oauth_personal_access_clients
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table _bukumasadepan.oauth_personal_access_clients: ~1 rows (approximately)
DELETE FROM `oauth_personal_access_clients`;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
	(1, 1, '2019-11-29 17:37:00', '2019-11-29 17:37:00');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;

-- Dumping structure for table _bukumasadepan.oauth_refresh_tokens
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table _bukumasadepan.oauth_refresh_tokens: ~3 rows (approximately)
DELETE FROM `oauth_refresh_tokens`;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
	('0a996331615a4aba440e9d31cc81241796b2e003f771af82ed3729d263c5e902d084ac37040e1868', 'c5b266b04d1d3e28779bc2f3b26a3c142f1afbf09154adb3894291efed519d2376dc495e54504219', 0, '2020-12-01 17:55:51'),
	('2b42d53dfe6ee6bcb923deae644d2820c550092b5bb28cb24adca3e43b59cff9b9824d805913c08f', 'aca4a5abbd8b94ae6b6691d7a881ce39e279146a1623c7791af5584cfc2a5bc7e3f9180ee03c4ca6', 0, '2020-11-29 17:39:04'),
	('619421d056c0e2b90abf14294b954774f80099c500820fa7d9c9873ffee36bc2f9820560243a0d9d', '664614d747f81020885b9c960656b1b049e94fde585a3e19c34de477674a3fc3a15dc430a6e17b26', 0, '2020-11-29 17:42:18');
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;

-- Dumping structure for table _bukumasadepan.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table _bukumasadepan.password_resets: ~0 rows (approximately)
DELETE FROM `password_resets`;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table _bukumasadepan.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table _bukumasadepan.permissions: ~12 rows (approximately)
DELETE FROM `permissions`;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
	(1, 'create master', 'web', '2019-11-29 17:36:42', '2019-11-29 17:36:42'),
	(2, 'read master', 'web', '2019-11-29 17:36:42', '2019-11-29 17:36:42'),
	(3, 'update master', 'web', '2019-11-29 17:36:42', '2019-11-29 17:36:42'),
	(4, 'delete master', 'web', '2019-11-29 17:36:42', '2019-11-29 17:36:42'),
	(5, 'create transaction', 'web', '2019-11-29 17:36:42', '2019-11-29 17:36:42'),
	(6, 'read transaction', 'web', '2019-11-29 17:36:42', '2019-11-29 17:36:42'),
	(7, 'update transaction', 'web', '2019-11-29 17:36:43', '2019-11-29 17:36:43'),
	(8, 'delete transaction', 'web', '2019-11-29 17:36:43', '2019-11-29 17:36:43'),
	(9, 'create utilities', 'web', '2019-11-29 17:36:43', '2019-11-29 17:36:43'),
	(10, 'read utilities', 'web', '2019-11-29 17:36:43', '2019-11-29 17:36:43'),
	(11, 'update utilities', 'web', '2019-11-29 17:36:43', '2019-11-29 17:36:43'),
	(12, 'delete utilities', 'web', '2019-11-29 17:36:43', '2019-11-29 17:36:43');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- Dumping structure for table _bukumasadepan.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table _bukumasadepan.roles: ~2 rows (approximately)
DELETE FROM `roles`;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
	(1, 'admin', 'web', '2019-11-29 17:36:43', '2019-11-29 17:36:43'),
	(2, 'super-admin', 'web', '2019-11-29 17:36:43', '2019-11-29 17:36:43');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Dumping structure for table _bukumasadepan.role_has_permissions
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table _bukumasadepan.role_has_permissions: ~20 rows (approximately)
DELETE FROM `role_has_permissions`;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1),
	(5, 1),
	(6, 1),
	(7, 1),
	(8, 1),
	(1, 2),
	(2, 2),
	(3, 2),
	(4, 2),
	(5, 2),
	(6, 2),
	(7, 2),
	(8, 2),
	(9, 2),
	(10, 2),
	(11, 2),
	(12, 2);
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;

-- Dumping structure for table _bukumasadepan.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table _bukumasadepan.users: ~2 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `pic`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Rudy Raharjo', 'rraharjo.rudy@gmail.com', NULL, NULL, '$2y$10$A7Ga32GQ1XWa6f4HUlw32e5cR7FSJifIEDmjZbOu0bWOvgPhL9.s.', NULL, '2019-11-29 17:36:44', '2019-11-29 17:36:44', NULL),
	(2, 'Anisa Ismiati', 'anisismi@gmail.com', NULL, NULL, '$2y$10$M0o675B8ggDv8q5zpeN13OVdRZCMxIzuPLYsz6VAfuli3IpzWwmNe', NULL, '2019-11-29 17:36:44', '2019-11-29 17:36:44', NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
