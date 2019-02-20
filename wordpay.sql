-- Adminer 4.7.0 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `api_keys`;
CREATE TABLE `api_keys` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `domain` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apply_vat` tinyint(4) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `banks`;
CREATE TABLE `banks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iban_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `swift_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `default` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `banks` (`id`, `company_id`, `user_id`, `bank_name`, `iban_number`, `swift_code`, `default`, `created_at`, `updated_at`) VALUES
(2,	2,	7,	'sbi',	'12444444',	'2225',	111,	'2019-02-19 04:35:58',	'2019-02-19 04:35:58'),
(3,	2,	7,	'sbi',	'12444444',	'2225',	111,	'2019-02-19 04:46:38',	'2019-02-19 04:46:38');

DROP TABLE IF EXISTS `cards`;
CREATE TABLE `cards` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `card_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expired_on` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cvc` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `default` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `cards` (`id`, `user_id`, `card_type`, `number`, `expired_on`, `cvc`, `first_name`, `last_name`, `address`, `city`, `state`, `postal_code`, `country`, `phone`, `default`, `created_at`, `updated_at`) VALUES
(3,	1,	'rupay',	'5555555555',	'12/02/2019',	'222',	'bibhash',	'kumar',	'noida',	'noida',	'delhi',	'824125',	'india',	'8804380394',	222,	'2019-02-18 09:45:10',	'2019-02-18 09:45:10'),
(5,	1,	'rupay',	'5555555555',	'12/02/2019',	'222',	'bibhash',	'kumar',	'noida',	'noida',	'delhi',	'824125',	'india',	'8804380394',	222,	'2019-02-18 09:46:06',	'2019-02-18 09:46:06'),
(6,	1,	'rupay',	'5555555555',	'12/02/2019',	'222',	'bibhash',	'kumar',	'noida',	'noida',	'delhi',	'824125',	'india',	'8804380394',	222,	'2019-02-18 09:46:52',	'2019-02-18 09:46:52'),
(7,	1,	'rupay',	'5555555555',	'12/02/2019',	'222',	'bibhash',	'kumar',	'noida',	'noida',	'delhi',	'824125',	'india',	'8804380394',	222,	'2019-02-18 09:48:01',	'2019-02-18 09:48:01'),
(8,	1,	'rupay',	'5555555555',	'12/02/2019',	'222',	'bibhash',	'kumar',	'noida',	'noida',	'delhi',	'824125',	'india',	'8804380394',	222,	'2019-02-18 09:51:36',	'2019-02-18 09:51:36'),
(9,	1,	'rupay',	'5555555555',	'12/02/2019',	'222',	'bibhash',	'kumar',	'noida',	'noida',	'delhi',	'824125',	'india',	'8804380394',	222,	'2019-02-18 10:05:56',	'2019-02-18 10:05:56'),
(10,	2122,	'rupay',	'22222222222',	'12/20',	'222',	'ramayan',	'kumar',	'gaya',	'city',	'delhi',	'824025',	'india',	'2222222222',	222,	'2019-02-19 02:02:08',	'2019-02-19 02:02:08'),
(11,	2,	'rupay',	'22222222222',	'12/20',	'222',	'ramayan',	'kumar',	'gaya',	'city',	'delhi',	'824025',	'india',	'2222222222',	222,	'2019-02-19 02:36:08',	'2019-02-19 02:36:08'),
(12,	2,	'rupayqqqqqqqqqqqqqqqqq',	'22222222222',	'12/20',	'222',	'ramayan',	'kumar',	'gaya',	'city',	'delhi',	'824025',	'india',	'2222222222',	222,	'2019-02-19 04:24:05',	'2019-02-19 04:24:05'),
(13,	2,	'rupayqqqqqqqqqqqqqqqqq',	'22222222222',	'12/20',	'222',	'ramayan',	'kumar',	'gaya',	'city',	'delhi',	'824025',	'india',	'2222222222',	222,	'2019-02-19 04:45:00',	'2019-02-19 04:45:00');

DROP TABLE IF EXISTS `companies`;
CREATE TABLE `companies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vat_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `companies` (`id`, `name`, `email`, `vat_number`, `address`, `city`, `state`, `postal_code`, `country_id`, `phone`, `created_at`, `updated_at`) VALUES
(1,	'bibhash',	'info@xyz.com',	'1231231231231',	'Burari1',	'New Delhi1',	'Delhi1',	'1100841',	'121',	'88265609291',	'2019-02-17 18:30:00',	'2019-02-19 05:08:57'),
(2,	'XYZ1',	'info@xyz.com1',	'1231231231231',	'Burari1',	'New Delhi1',	'Delhi1',	'1100841',	'121',	'88265609291',	'2019-02-18 05:12:01',	NULL),
(3,	'XYZ1',	'info@xyz.com1',	'1231231231231',	'Burari1',	'New Delhi1',	'Delhi1',	'1100841',	'121',	'88265609291',	'2019-02-18 05:14:12',	NULL),
(4,	'XYZ1',	'info@xyz.com1',	'1231231231231',	'Burari1',	'New Delhi1',	'Delhi1',	'1100841',	'121',	'88265609291',	'2019-02-18 05:14:25',	NULL),
(5,	'XYZ1',	'info@xyz.com1',	'1231231231231',	'Burari1',	'New Delhi1',	'Delhi1',	'1100841',	'121',	'88265609291',	'2019-02-18 07:50:56',	NULL),
(6,	'XYZ1',	'info@xyz.com1',	'1231231231231',	'Burari1',	'New Delhi1',	'Delhi1',	'1100841',	'121',	'88265609291',	'2019-02-18 07:59:53',	NULL),
(7,	'XYZ1',	'info@xyz.com1',	'1231231231231',	'Burari1',	'New Delhi1',	'Delhi1',	'1100841',	'121',	'88265609291',	'2019-02-18 08:29:27',	NULL),
(8,	'XYZ1',	'info@xyz.com1',	'1231231231231',	'Burari1',	'New Delhi1',	'Delhi1',	'1100841',	'121',	'88265609291',	'2019-02-18 08:44:03',	NULL),
(9,	'XYZ1',	'info@xyz.com1',	'1231231231231',	'Burari1',	'New Delhi1',	'Delhi1',	'1100841',	'121',	'88265609291',	'2019-02-18 09:01:42',	NULL),
(10,	'XYZ1',	'info@xyz.com1',	'1231231231231',	'Burari1',	'New Delhi1',	'Delhi1',	'1100841',	'121',	'88265609291',	'2019-02-18 09:09:24',	NULL),
(11,	'XYZ1',	'info@xyz.com1',	'1231231231231',	'Burari1',	'New Delhi1',	'Delhi1',	'1100841',	'121',	'88265609291',	'2019-02-18 09:12:46',	NULL),
(12,	'XYZ1',	'info@xyz.com1',	'1231231231231',	'Burari1',	'New Delhi1',	'Delhi1',	'1100841',	'121',	'88265609291',	'2019-02-18 10:06:38',	NULL),
(13,	'XYZ1y',	'info@xyz.com1',	'1231231231231',	'Burari1',	'New Delhi1',	'Delhi1',	'1100841',	'121',	'88265609291',	'2019-02-19 01:02:36',	NULL),
(14,	'XYZ1y',	'info@xyz.com1',	'1231231231231',	'Burari1',	'New Delhi1',	'Delhi1',	'1100841',	'121',	'88265609291',	'2019-02-19 01:05:52',	NULL),
(15,	'XYZ1y',	'info@xyz.com1',	'1231231231231',	'Burari1',	'New Delhi1',	'Delhi1',	'1100841',	'121',	'88265609291',	'2019-02-19 01:05:58',	NULL),
(16,	'XYZ1',	'info@xyz.com1',	'1231231231231',	'Burari1',	'New Delhi1',	'Delhi1',	'1100841',	'121',	'88265609291',	'2019-02-19 01:26:15',	NULL),
(17,	'XYZ1',	'info@xyz.com1',	'1231231231231',	'Burari1',	'New Delhi1',	'Delhi1',	'1100841',	'121',	'88265609291',	'2019-02-19 01:26:24',	NULL),
(18,	'XYZ1',	'info@xyz.com1',	'1231231231231',	'Burari1',	'New Delhi1',	'Delhi1',	'1100841',	'121',	'88265609291',	'2019-02-19 01:27:27',	NULL),
(19,	'XYZy',	'info@xyz.com1',	'1231231231231',	'Burari1',	'New Delhi1',	'Delhi1',	'1100841',	'121',	'88265609291',	'2019-02-19 01:33:06',	NULL),
(20,	'XYZi',	'info@xyz.com1',	'1231231231231',	'Burari1',	'New Delhi1',	'Delhi1',	'1100841',	'121',	'88265609291',	'2019-02-19 01:34:45',	NULL),
(21,	'XYZi',	'info@xyz.com1',	'1231231231231',	'Burari1',	'New Delhi1',	'Delhi1',	'1100841',	'121',	'88265609291',	'2019-02-19 01:51:33',	NULL),
(22,	'XYZi',	'info@xyz.com1',	'1231231231231',	'Burari1',	'New Delhi1',	'Delhi1',	'1100841',	'121',	'88265609291',	'2019-02-19 02:02:53',	NULL),
(23,	'bibhash',	'info@xyz.com1',	'1231231231231',	'Burari1',	'New Delhi1',	'Delhi1',	'1100841',	'121',	'88265609291',	'2019-02-19 02:03:18',	NULL),
(24,	'bibhash',	'info@xyz.com1',	'1231231231231',	'Burari1',	'New Delhi1',	'Delhi1',	'1100841',	'121',	'88265609291',	'2019-02-19 02:05:59',	NULL),
(25,	'bibhash',	'info@xyz.com1',	'1231231231231',	'Burari1',	'New Delhi1',	'Delhi1',	'1100841',	'121',	'88265609291',	'2019-02-19 02:11:42',	NULL);

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1,	'2014_10_12_000000_create_users_table',	1),
(2,	'2014_10_12_100000_create_password_resets_table',	1),
(3,	'2016_06_01_000001_create_oauth_auth_codes_table',	1),
(4,	'2016_06_01_000002_create_oauth_access_tokens_table',	1),
(5,	'2016_06_01_000003_create_oauth_refresh_tokens_table',	1),
(6,	'2016_06_01_000004_create_oauth_clients_table',	1),
(7,	'2016_06_01_000005_create_oauth_personal_access_clients_table',	1),
(8,	'2019_02_16_155127_cards',	1),
(9,	'2019_02_17_062615_create_api_keys',	1),
(10,	'2019_02_17_075330_create_company',	2),
(11,	'2019_02_17_082459_add_company_in_user',	2),
(14,	'2019_02_18_100050_add_vat_in_api_keys',	3),
(15,	'2019_02_18_122820_create_bank_table',	4);

DROP TABLE IF EXISTS `oauth_access_tokens`;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('0dc52be5adaee92de78d7880e1446cacebe3a9417c075941239da0cb694215d949528f4c933013c9',	1,	1,	'wordpay',	'[]',	0,	'2019-02-18 07:20:20',	'2019-02-18 07:20:20',	'2020-02-18 12:50:20'),
('363c856571d729d977f48a91e5fbdd6f10caf2d2d1f25a0402c22b07179fbf53ab8ffd4843fdd19e',	1,	1,	'wordpay',	'[]',	0,	'2019-02-17 02:19:56',	'2019-02-17 02:19:56',	'2020-02-17 07:49:56'),
('488ae8e6bf7210a44c3e7bf181564d508f396354e090653bdc83c34590d9327b994973c387b17f2c',	1,	1,	'wordpay',	'[]',	0,	'2019-02-18 07:48:48',	'2019-02-18 07:48:48',	'2020-02-18 13:18:48'),
('5838c1e1e0c9d89fc479c404a029b8b7dc46788f61ae81ad612a7dc02c2f29c9d6794cdb90729c0f',	1,	1,	'wordpay',	'[]',	0,	'2019-02-17 01:42:43',	'2019-02-17 01:42:43',	'2020-02-17 07:12:43'),
('589b47cef23829bada4ce2fca841e770dfb2b463dff4f9b2e3f7df1370463f630cae96f82c0ba5d4',	1,	1,	'wordpay',	'[]',	0,	'2019-02-17 01:43:53',	'2019-02-17 01:43:53',	'2020-02-17 07:13:53'),
('70c4d93e3eec052d1f5935a2088a15bef8e2abf476f1089eebe4fcc065b1b69876f32be318bc100c',	1,	1,	'wordpay',	'[]',	0,	'2019-02-17 01:38:53',	'2019-02-17 01:38:53',	'2020-02-17 07:08:53'),
('795390d213dc89dacd40c05823bed675d33717e2d7bf1af930ed690cca03c17470f987a3db59d58c',	1,	1,	'wordpay',	'[]',	0,	'2019-02-17 02:06:13',	'2019-02-17 02:06:13',	'2020-02-17 07:36:13'),
('93efdcbdc12512bea53d9524eb390bea7d2a447689d5eae6b8a53f65d2b4d7302fa5a791fb20496d',	1,	1,	'wordpay',	'[]',	0,	'2019-02-18 05:49:12',	'2019-02-18 05:49:12',	'2020-02-18 11:19:12'),
('9f55f00155a1c6df87b21a0142d8a44a465fc7792b272af04e362b4521fcb2ed2e71d96150e82e4f',	2,	1,	'wordpay',	'[]',	0,	'2019-02-17 01:40:31',	'2019-02-17 01:40:31',	'2020-02-17 07:10:31'),
('b8a2054fc62ab26f71ebfc409a3dcc814f9347ebb1713825802e420f1b0c4b45e90879fee10e97cf',	1,	1,	'wordpay',	'[]',	0,	'2019-02-17 02:13:28',	'2019-02-17 02:13:28',	'2020-02-17 07:43:28'),
('c89181fcb324902a594556a6ee95ae8ec7fe6a7ab6127c23c838746c4234d80a8822f0a2a7a55182',	1,	1,	'wordpay',	'[]',	0,	'2019-02-17 01:43:33',	'2019-02-17 01:43:33',	'2020-02-17 07:13:33'),
('d2d64fb37f0bb56ccec6f522e5795a0b7100300990d64dfb99027fcdf473ebb159bed62d802dd32c',	NULL,	1,	'wordpay',	'[]',	0,	'2019-02-17 01:39:49',	'2019-02-17 01:39:49',	'2020-02-17 07:09:49'),
('dc531443cc83dfb94635b70a263ae12a05ae7879c5c7d2bb4266621d10551d45f179090a6768e05e',	1,	1,	'wordpay',	'[]',	0,	'2019-02-17 02:08:53',	'2019-02-17 02:08:53',	'2020-02-17 07:38:53'),
('e4942c20b79955c56d28f23d885e8b9087afa86230ac71580a5639d7be3635aa088bea994e8ddc4f',	1,	1,	'wordpay',	'[]',	0,	'2019-02-17 02:09:43',	'2019-02-17 02:09:43',	'2020-02-17 07:39:43'),
('fd023346cd2225f5d42159c8ac0919783f6007b1a65dff2728ce766af6e64d02443242e4f279d83d',	1,	1,	'wordpay',	'[]',	0,	'2019-02-17 01:41:38',	'2019-02-17 01:41:38',	'2020-02-17 07:11:38');

DROP TABLE IF EXISTS `oauth_auth_codes`;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `oauth_clients`;
CREATE TABLE `oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1,	NULL,	'Laravel Personal Access Client',	'c9maMb3oGcoj3IVi060uO8FQNY2hX2Jl5jcp83N3',	'http://localhost',	1,	0,	0,	'2019-02-17 01:38:36',	'2019-02-17 01:38:36'),
(2,	NULL,	'Laravel Password Grant Client',	'HhJbLqewM1fnmmZkCTSJwljLtyPgqJsohJxe6BDp',	'http://localhost',	0,	1,	0,	'2019-02-17 01:38:36',	'2019-02-17 01:38:36');

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1,	1,	'2019-02-17 01:38:36',	'2019-02-17 01:38:36');

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_type` enum('user','media','admin') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `users` (`id`, `user_type`, `first_name`, `last_name`, `email`, `account_id`, `password`, `address`, `city`, `state`, `postal_code`, `country_id`, `company_id`, `phone`, `remember_token`, `created_at`, `updated_at`) VALUES
(1,	'user',	'Ramayan',	'prasad',	'ram.developer89@gmail.com',	'467-QBN5AF',	'$2y$10$cKzOWLcPf/SWJ4Hrx77wA.5543tS2DRmGoeEWfm1IR3oPgVDDo1QG',	'Burari',	'New Delhi',	'Delhi',	'110084',	11,	25,	'8826560929',	NULL,	'2019-02-17 01:43:33',	'2019-02-19 02:11:42');

-- 2019-02-19 16:05:01
