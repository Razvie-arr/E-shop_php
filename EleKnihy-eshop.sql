-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Počítač: localhost:3306
-- Vytvořeno: Pon 08. led 2024, 22:55
-- Verze serveru: 10.5.19-MariaDB-0+deb11u2
-- Verze PHP: 8.1.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `bret04`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `cart`
--

CREATE TABLE `cart` (
                        `cart_id` int(11) NOT NULL,
                        `user_id` int(11) DEFAULT NULL,
                        `last_modified` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `cart`
--

INSERT INTO `cart` (`cart_id`, `user_id`, `last_modified`) VALUES
                                                               (880, NULL, '2024-01-05 20:29:09'),
                                                               (881, NULL, '2024-01-05 20:29:14'),
                                                               (882, NULL, '2024-01-05 20:29:16'),
                                                               (883, NULL, '2024-01-05 20:29:17'),
                                                               (884, NULL, '2024-01-05 20:29:22'),
                                                               (885, NULL, '2024-01-06 20:12:24'),
                                                               (886, NULL, '2024-01-06 20:12:37'),
                                                               (887, NULL, '2024-01-06 20:12:43'),
                                                               (888, NULL, '2024-01-06 20:12:48'),
                                                               (889, NULL, '2024-01-06 20:12:51'),
                                                               (890, NULL, '2024-01-06 22:26:44'),
                                                               (891, NULL, '2024-01-06 22:26:47'),
                                                               (892, NULL, '2024-01-06 22:26:48'),
                                                               (893, NULL, '2024-01-06 22:26:50'),
                                                               (894, NULL, '2024-01-06 22:26:52'),
                                                               (895, NULL, '2024-01-06 22:26:53'),
                                                               (896, NULL, '2024-01-06 22:27:01'),
                                                               (897, NULL, '2024-01-06 22:27:04'),
                                                               (898, NULL, '2024-01-06 22:27:15'),
                                                               (899, NULL, '2024-01-06 22:27:18'),
                                                               (900, NULL, '2024-01-06 22:27:25'),
                                                               (901, NULL, '2024-01-06 22:27:27'),
                                                               (902, NULL, '2024-01-06 22:27:28'),
                                                               (903, NULL, '2024-01-07 20:08:35'),
                                                               (904, NULL, '2024-01-07 20:52:44'),
                                                               (905, NULL, '2024-01-07 20:52:52'),
                                                               (906, NULL, '2024-01-07 21:46:52'),
                                                               (907, NULL, '2024-01-07 21:47:01'),
                                                               (908, NULL, '2024-01-07 21:47:04'),
                                                               (909, NULL, '2024-01-07 21:47:08'),
                                                               (910, NULL, '2024-01-07 21:47:11'),
                                                               (912, NULL, '2024-01-07 22:54:48'),
                                                               (913, NULL, '2024-01-07 22:54:50'),
                                                               (914, NULL, '2024-01-07 22:54:52'),
                                                               (915, NULL, '2024-01-07 22:54:54'),
                                                               (916, NULL, '2024-01-08 11:42:20'),
                                                               (917, NULL, '2024-01-08 11:42:23'),
                                                               (918, 3, '2024-01-08 18:17:45'),
                                                               (919, NULL, '2024-01-08 11:42:27'),
                                                               (920, NULL, '2024-01-08 11:42:38'),
                                                               (921, NULL, '2024-01-08 11:42:47'),
                                                               (922, NULL, '2024-01-08 11:42:57'),
                                                               (923, NULL, '2024-01-08 12:06:34'),
                                                               (924, NULL, '2024-01-08 12:06:36'),
                                                               (925, NULL, '2024-01-08 13:54:01'),
                                                               (926, NULL, '2024-01-08 13:54:02'),
                                                               (927, NULL, '2024-01-08 13:54:04'),
                                                               (928, NULL, '2024-01-08 13:54:09'),
                                                               (929, NULL, '2024-01-08 13:54:12'),
                                                               (930, NULL, '2024-01-08 13:54:13'),
                                                               (931, NULL, '2024-01-08 13:54:14'),
                                                               (932, NULL, '2024-01-08 13:54:16'),
                                                               (933, NULL, '2024-01-08 13:54:17'),
                                                               (934, NULL, '2024-01-08 13:54:19'),
                                                               (935, NULL, '2024-01-08 13:54:20'),
                                                               (936, NULL, '2024-01-08 13:54:22'),
                                                               (937, NULL, '2024-01-08 13:54:25'),
                                                               (938, NULL, '2024-01-08 13:54:28'),
                                                               (939, NULL, '2024-01-08 13:54:28'),
                                                               (940, NULL, '2024-01-08 16:42:36'),
                                                               (941, NULL, '2024-01-08 16:42:38'),
                                                               (942, NULL, '2024-01-08 17:09:41'),
                                                               (943, NULL, '2024-01-08 17:09:46'),
                                                               (944, NULL, '2024-01-08 17:10:12'),
                                                               (945, NULL, '2024-01-08 17:10:15'),
                                                               (946, NULL, '2024-01-08 17:10:24'),
                                                               (947, NULL, '2024-01-08 17:10:26'),
                                                               (948, NULL, '2024-01-08 17:13:46'),
                                                               (949, NULL, '2024-01-08 17:14:19'),
                                                               (950, NULL, '2024-01-08 17:14:21'),
                                                               (951, NULL, '2024-01-08 17:23:01'),
                                                               (952, NULL, '2024-01-08 17:23:03'),
                                                               (953, NULL, '2024-01-08 17:23:37'),
                                                               (954, NULL, '2024-01-08 17:24:12'),
                                                               (955, NULL, '2024-01-08 17:33:07'),
                                                               (956, NULL, '2024-01-08 18:05:22'),
                                                               (957, NULL, '2024-01-08 18:05:24'),
                                                               (958, NULL, '2024-01-08 18:05:28'),
                                                               (959, NULL, '2024-01-08 18:07:43'),
                                                               (960, NULL, '2024-01-08 18:09:59'),
                                                               (961, NULL, '2024-01-08 18:10:00'),
                                                               (962, NULL, '2024-01-08 18:10:00'),
                                                               (963, NULL, '2024-01-08 18:10:15'),
                                                               (964, NULL, '2024-01-08 18:10:16'),
                                                               (965, NULL, '2024-01-08 18:10:18'),
                                                               (966, NULL, '2024-01-08 18:10:19'),
                                                               (967, NULL, '2024-01-08 18:10:20'),
                                                               (968, NULL, '2024-01-08 18:10:24'),
                                                               (969, NULL, '2024-01-08 18:10:25'),
                                                               (970, NULL, '2024-01-08 18:10:38'),
                                                               (971, NULL, '2024-01-08 18:10:40'),
                                                               (972, NULL, '2024-01-08 18:10:41'),
                                                               (973, NULL, '2024-01-08 18:10:48'),
                                                               (974, NULL, '2024-01-08 18:10:55'),
                                                               (975, NULL, '2024-01-08 18:11:07'),
                                                               (976, NULL, '2024-01-08 18:11:08'),
                                                               (977, NULL, '2024-01-08 18:11:11'),
                                                               (978, NULL, '2024-01-08 18:11:12'),
                                                               (979, NULL, '2024-01-08 18:11:15'),
                                                               (980, NULL, '2024-01-08 18:11:17'),
                                                               (981, NULL, '2024-01-08 18:11:19'),
                                                               (982, NULL, '2024-01-08 18:11:27'),
                                                               (983, NULL, '2024-01-08 18:11:28'),
                                                               (984, NULL, '2024-01-08 18:11:28'),
                                                               (985, NULL, '2024-01-08 18:11:30'),
                                                               (986, NULL, '2024-01-08 18:11:32'),
                                                               (987, 4, '2024-01-08 18:13:02'),
                                                               (988, NULL, '2024-01-08 18:13:03'),
                                                               (989, NULL, '2024-01-08 18:13:05'),
                                                               (990, NULL, '2024-01-08 18:13:13'),
                                                               (991, NULL, '2024-01-08 18:13:13'),
                                                               (992, NULL, '2024-01-08 18:13:15'),
                                                               (993, NULL, '2024-01-08 18:13:16'),
                                                               (994, NULL, '2024-01-08 18:13:17'),
                                                               (995, NULL, '2024-01-08 18:13:45'),
                                                               (996, NULL, '2024-01-08 18:13:46'),
                                                               (997, NULL, '2024-01-08 18:13:48'),
                                                               (998, NULL, '2024-01-08 18:13:48'),
                                                               (999, NULL, '2024-01-08 18:13:50'),
                                                               (1000, NULL, '2024-01-08 18:13:50'),
                                                               (1001, NULL, '2024-01-08 18:13:51'),
                                                               (1002, NULL, '2024-01-08 18:13:52'),
                                                               (1003, NULL, '2024-01-08 18:13:53'),
                                                               (1004, NULL, '2024-01-08 18:13:55'),
                                                               (1005, NULL, '2024-01-08 18:13:57'),
                                                               (1006, NULL, '2024-01-08 18:14:00'),
                                                               (1007, NULL, '2024-01-08 18:14:02'),
                                                               (1008, NULL, '2024-01-08 18:14:04'),
                                                               (1009, NULL, '2024-01-08 18:14:05'),
                                                               (1010, NULL, '2024-01-08 18:14:06'),
                                                               (1011, NULL, '2024-01-08 18:14:07'),
                                                               (1012, NULL, '2024-01-08 18:14:20'),
                                                               (1013, NULL, '2024-01-08 18:14:23'),
                                                               (1014, NULL, '2024-01-08 18:14:28'),
                                                               (1015, NULL, '2024-01-08 18:14:30'),
                                                               (1016, NULL, '2024-01-08 18:14:31'),
                                                               (1017, NULL, '2024-01-08 18:14:33'),
                                                               (1018, NULL, '2024-01-08 18:14:34'),
                                                               (1019, NULL, '2024-01-08 18:14:37'),
                                                               (1020, NULL, '2024-01-08 18:14:39'),
                                                               (1021, NULL, '2024-01-08 18:14:41'),
                                                               (1022, NULL, '2024-01-08 18:14:45'),
                                                               (1023, NULL, '2024-01-08 18:14:47'),
                                                               (1024, NULL, '2024-01-08 18:14:49'),
                                                               (1025, NULL, '2024-01-08 18:14:49'),
                                                               (1026, NULL, '2024-01-08 18:14:50'),
                                                               (1027, NULL, '2024-01-08 18:14:56'),
                                                               (1028, NULL, '2024-01-08 18:14:56'),
                                                               (1029, NULL, '2024-01-08 18:14:57'),
                                                               (1030, NULL, '2024-01-08 18:14:57'),
                                                               (1031, NULL, '2024-01-08 18:14:57'),
                                                               (1032, NULL, '2024-01-08 18:15:00'),
                                                               (1033, NULL, '2024-01-08 18:15:07'),
                                                               (1034, NULL, '2024-01-08 18:17:23'),
                                                               (1035, NULL, '2024-01-08 20:16:37'),
                                                               (1036, NULL, '2024-01-08 20:16:44'),
                                                               (1038, NULL, '2024-01-08 20:17:32'),
                                                               (1039, NULL, '2024-01-08 20:17:34'),
                                                               (1040, NULL, '2024-01-08 20:17:36'),
                                                               (1041, NULL, '2024-01-08 20:17:37'),
                                                               (1042, NULL, '2024-01-08 20:17:41'),
                                                               (1043, NULL, '2024-01-08 20:17:42'),
                                                               (1044, NULL, '2024-01-08 20:17:43'),
                                                               (1045, NULL, '2024-01-08 20:17:44'),
                                                               (1046, NULL, '2024-01-08 20:17:50'),
                                                               (1047, NULL, '2024-01-08 20:17:55'),
                                                               (1048, NULL, '2024-01-08 20:17:57'),
                                                               (1049, 1, '2024-01-08 20:18:31'),
                                                               (1050, NULL, '2024-01-08 20:18:35');

-- --------------------------------------------------------

--
-- Struktura tabulky `cart_item`
--

CREATE TABLE `cart_item` (
                             `cart_item_id` int(11) NOT NULL,
                             `product_id` int(11) NOT NULL,
                             `cart_id` int(11) NOT NULL,
                             `count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `cart_item`
--

INSERT INTO `cart_item` (`cart_item_id`, `product_id`, `cart_id`, `count`) VALUES
                                                                               (31, 3, 889, 1),
                                                                               (32, 7, 902, 1),
                                                                               (33, 3, 905, 1),
                                                                               (35, 3, 915, 1),
                                                                               (36, 2, 918, 2),
                                                                               (38, 6, 1049, 1);

-- --------------------------------------------------------

--
-- Struktura tabulky `category`
--

CREATE TABLE `category` (
                            `category_id` smallint(5) UNSIGNED NOT NULL,
                            `title` varchar(100) NOT NULL,
                            `description` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci COMMENT='Kategorie poznámek';

--
-- Vypisuji data pro tabulku `category`
--

INSERT INTO `category` (`category_id`, `title`, `description`) VALUES
                                                                   (1, 'Amazon Kindle', 'Čtečka knih Amazon Kindle vám umožní vzít si celou domácí knihovnu s sebou na cesty, a to vše v jediném lehoučkém kompaktním zařízení. Celou sbírku svých oblíbených titulů tak můžete nosit stále u sebe, čímž odpadá těžké rozhodování, kterou knihu přibalit do již přeplněných zavazadel. '),
                                                                   (2, 'PocketBook', 'Pokud se chystáte pořídit Ebook čtečky PocketBook, je zde pár aspektů, které pomohou ke zvolení toho správného produktu.'),
                                                                   (3, 'S podsvíceným displejem', 'Čtečky knih s podsvíceným displejem.'),
                                                                   (4, 'Příslušenství', 'Příslušenství ke čtečkám elektronických knih.');

-- --------------------------------------------------------

--
-- Struktura tabulky `forgotten_password`
--

CREATE TABLE `forgotten_password` (
                                      `forgotten_password_id` int(11) NOT NULL,
                                      `user_id` int(11) NOT NULL,
                                      `code` varchar(50) NOT NULL,
                                      `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `forgotten_password`
--

INSERT INTO `forgotten_password` (`forgotten_password_id`, `user_id`, `code`, `created`) VALUES
    (2, 1, '8fq8eluobd', '2023-12-25 16:03:17');

-- --------------------------------------------------------

--
-- Struktura tabulky `objednavka`
--

CREATE TABLE `objednavka` (
                              `objednavka_id` int(11) NOT NULL,
                              `user_id` int(11) DEFAULT NULL,
                              `objednavka_date` timestamp NOT NULL DEFAULT current_timestamp(),
                              `objednavka_name` varchar(40) NOT NULL,
                              `objednavka_email` varchar(255) NOT NULL,
                              `objednavka_address` varchar(512) NOT NULL,
                              `objednavka_phone` int(11) NOT NULL,
                              `paid` tinyint(1) NOT NULL DEFAULT 0,
                              `objednavka_price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `objednavka`
--

INSERT INTO `objednavka` (`objednavka_id`, `user_id`, `objednavka_date`, `objednavka_name`, `objednavka_email`, `objednavka_address`, `objednavka_phone`, `paid`, `objednavka_price`) VALUES
                                                                                                                                                                                          (2, NULL, '2024-01-08 12:16:17', 'Vlad Biastinov', 'vladikbyastinov@gmail.com', 'as', 123123, 0, NULL),
                                                                                                                                                                                          (3, NULL, '2024-01-08 20:17:02', 'test', 'tomas.brezina73@seznam.cz', 'te', 3223, 0, NULL);

-- --------------------------------------------------------

--
-- Struktura tabulky `objednavka_item`
--

CREATE TABLE `objednavka_item` (
                                   `objednavka_item_id` int(11) NOT NULL,
                                   `product_id` int(11) NOT NULL,
                                   `objednavka_id` int(11) NOT NULL,
                                   `count` int(11) NOT NULL,
                                   `objednavka_item_price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `permission`
--

CREATE TABLE `permission` (
                              `permission_id` int(11) NOT NULL,
                              `role_id` varchar(50) NOT NULL,
                              `resource_id` varchar(50) NOT NULL,
                              `action` varchar(100) NOT NULL,
                              `type` set('allow','deny') NOT NULL DEFAULT 'allow'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `permission`
--

INSERT INTO `permission` (`permission_id`, `role_id`, `resource_id`, `action`, `type`) VALUES
                                                                                           (22, 'admin', 'Admin:Category', '', 'allow'),
                                                                                           (21, 'admin', 'Admin:Dashboard', '', 'allow'),
                                                                                           (46, 'admin', 'Admin:Order', '', 'allow'),
                                                                                           (24, 'admin', 'Admin:Product', '', 'allow'),
                                                                                           (45, 'admin', 'Admin:User', '', 'allow'),
                                                                                           (12, 'admin', 'Category', '', 'allow'),
                                                                                           (23, 'admin', 'Product', '', 'allow'),
                                                                                           (38, 'authenticated', 'Front:About', '', 'allow'),
                                                                                           (39, 'authenticated', 'Front:Cart', '', 'allow'),
                                                                                           (36, 'authenticated', 'Front:Contact', '', 'allow'),
                                                                                           (4, 'authenticated', 'Front:Error', '', 'allow'),
                                                                                           (5, 'authenticated', 'Front:Error4xx', '', 'allow'),
                                                                                           (6, 'authenticated', 'Front:Homepage', '', 'allow'),
                                                                                           (41, 'authenticated', 'Front:Order', '', 'allow'),
                                                                                           (34, 'authenticated', 'Front:Product', '', 'allow'),
                                                                                           (9, 'authenticated', 'Front:User', 'login', 'allow'),
                                                                                           (10, 'authenticated', 'Front:User', 'logout', 'allow'),
                                                                                           (27, 'authenticated', 'Product', '', 'allow'),
                                                                                           (37, 'guest', 'Front:About', '', 'allow'),
                                                                                           (40, 'guest', 'Front:Cart', '', 'allow'),
                                                                                           (35, 'guest', 'Front:Contact', '', 'allow'),
                                                                                           (1, 'guest', 'Front:Error', '', 'allow'),
                                                                                           (2, 'guest', 'Front:Error4xx', '', 'allow'),
                                                                                           (3, 'guest', 'Front:Homepage', '', 'allow'),
                                                                                           (42, 'guest', 'Front:Order', '', 'allow'),
                                                                                           (33, 'guest', 'Front:Product', '', 'allow'),
                                                                                           (15, 'guest', 'Front:User', 'facebookLogin', 'allow'),
                                                                                           (13, 'guest', 'Front:User', 'forgottenPassword', 'allow'),
                                                                                           (7, 'guest', 'Front:User', 'login', 'allow'),
                                                                                           (8, 'guest', 'Front:User', 'logout', 'allow'),
                                                                                           (11, 'guest', 'Front:User', 'register', 'allow'),
                                                                                           (14, 'guest', 'Front:User', 'renewPassword', 'allow'),
                                                                                           (25, 'guest', 'Product', '', 'allow');

-- --------------------------------------------------------

--
-- Struktura tabulky `product`
--

CREATE TABLE `product` (
                           `product_id` int(11) NOT NULL,
                           `category_id` smallint(5) UNSIGNED DEFAULT NULL,
                           `title` varchar(100) NOT NULL,
                           `url` varchar(100) NOT NULL,
                           `description` text NOT NULL,
                           `price` decimal(10,2) NOT NULL,
                           `photo_extension` varchar(10) NOT NULL,
                           `recommend` tinyint(1) NOT NULL DEFAULT 0,
                           `stock` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci COMMENT='Tabulka s nabízenými produkty';

--
-- Vypisuji data pro tabulku `product`
--

INSERT INTO `product` (`product_id`, `category_id`, `title`, `url`, `description`, `price`, `photo_extension`, `recommend`, `stock`) VALUES
                                                                                                                                         (2, 2, 'PocketBook 700 Era Stardust Silver', 'pocketbook700', 'Elektronická čtečka knih - 7\" podsvícený dotykový E Ink displej, rozlišení Full HD 1680 × 1264, vnitřní paměť 16 GB, WiFi a Bluetooth, bez paměťové karty, konektor USB-C, 1700mAh baterie, reproduktor součástí, s možností přehrávání hudby, s webovým prohlížečem, stupeň krytí IPX8', '4499.00', 'jpeg', 1, 4),
                                                                                                                                         (3, 3, 'ONYX BOOX PAGE, černá, 7\", 32GB', 'onyxbookpage', 'Elektronická čtečka knih - 7\" podsvícený dotykový E Ink displej, rozlišení Full HD 1680 × 1264, vnitřní paměť 32 GB, WiFi a Bluetooth, micro SD a micro SDHC paměťová karta, konektor USB-C, 2300mAh baterie, reproduktor, mikrofon součástí, s možností přehrávání hudby, s webovým prohlížečem.', '6499.00', 'jpeg', 1, 10),
                                                                                                                                         (4, 3, 'ONYX BOOX TAB MINI C, černá, 7,8\", 64GB', 'onyxbooktab', 'Elektronická čtečka knih - 7,8\" podsvícený dotykový E Ink displej, rozlišení QHD 1872 × 1404, vnitřní paměť 64 GB, WiFi a Bluetooth, bez paměťové karty, konektor USB-C, 5000mAh baterie, reproduktor, mikrofon a stylus součástí, s možností přehrávání hudby, s webovým prohlížečem.', '10990.00', 'jpeg', 0, 6),
                                                                                                                                         (5, 2, 'PocketBook 743C InkPad Color 2 Moon Silver, stříbrný', 'pocketbook743c', 'Elektronická čtečka knih - 7,80\" podsvícený dotykový E Ink displej, rozlišení QHD 1872 × 1404, vnitřní paměť 31,25 GB, WiFi a Bluetooth, bez paměťové karty, konektor USB-C, 2900mAh baterie, reproduktor součástí, s možností přehrávání hudby, s webovým prohlížečem, stupeň krytí IPX8.', '7499.00', 'jpeg', 1, 2),
                                                                                                                                         (6, 1, 'Amazon Kindle Paperwhite 5 2021 32GB Signature Edition (bez reklamy)', 'amazonkindlepaperwhite2021', 'Elektronická čtečka knih - 6,8\" podsvícený dotykový displej, vnitřní paměť 32 GB, WiFi a Bluetooth, bez paměťové karty, konektor USB-C, stupeň krytí IPX8.', '4990.00', 'jpeg', 0, 3),
                                                                                                                                         (7, 1, 'Amazon Kindle 2022, 16GB, černý, bez reklam', 'amazonkindle2022', 'Elektronická čtečka knih - 6\" podsvícený dotykový E Ink displej, rozlišení Full HD 1448 × 1072, vnitřní paměť 15,625 GB, WiFi a Bluetooth, bez paměťové karty, konektor USB-C, 1040mAh baterie', '2990.00', 'jpeg', 1, 1),
                                                                                                                                         (8, 4, 'FIXED GaN s 2xUSB-C a USB výstupem podpora PD 65W bílá', 'fixedgan65w', 'Nabíječka do sítě - s podporou rychlého nabíjení, celkový výkon 65 W (1× USB-C až 45 W, 1× USB-C až 45 W, 1× USB-A až 15 W), technologie USB Power Delivery, Qualcomm Quick Charge 3.0 a Qualcomm Quick Charge 4.0+, přepěťová a podpěťová ochrana, indikace nabíjení, regulace teploty, s technologií GaN, pro Android a iPhone.', '700.00', 'jpeg', 0, 2),
                                                                                                                                         (9, 4, 'Apple USB 5W napájecí adaptér', 'appleadapter', 'Nabíječka do sítě pro jakékoliv modely iPhone a iPad. Bez napájecího kabelu.', '199.00', 'jpeg', 0, 0);

-- --------------------------------------------------------

--
-- Struktura tabulky `resource`
--

CREATE TABLE `resource` (
    `resource_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci COMMENT='Tabulka obsahující seznam zdrojů';

--
-- Vypisuji data pro tabulku `resource`
--

INSERT INTO `resource` (`resource_id`) VALUES
                                           ('Admin:Category'),
                                           ('Admin:Dashboard'),
                                           ('Admin:Error4xx'),
                                           ('Admin:Order'),
                                           ('Admin:Product'),
                                           ('Admin:User'),
                                           ('Category'),
                                           ('Front:About'),
                                           ('Front:Cart'),
                                           ('Front:Contact'),
                                           ('Front:Error'),
                                           ('Front:Error4xx'),
                                           ('Front:Homepage'),
                                           ('Front:Order'),
                                           ('Front:Product'),
                                           ('Front:User'),
                                           ('Product'),
                                           ('User');

-- --------------------------------------------------------

--
-- Struktura tabulky `role`
--

CREATE TABLE `role` (
    `role_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `role`
--

INSERT INTO `role` (`role_id`) VALUES
                                   ('admin'),
                                   ('authenticated'),
                                   ('guest');

-- --------------------------------------------------------

--
-- Struktura tabulky `user`
--

CREATE TABLE `user` (
                        `user_id` int(11) NOT NULL,
                        `name` varchar(40) NOT NULL,
                        `email` varchar(255) NOT NULL,
                        `facebook_id` varchar(100) DEFAULT NULL,
                        `role_id` varchar(50) DEFAULT NULL,
                        `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci COMMENT='Tabulka s daty uživatelů';

--
-- Vypisuji data pro tabulku `user`
--

INSERT INTO `user` (`user_id`, `name`, `email`, `facebook_id`, `role_id`, `password`) VALUES
                                                                                          (1, 'test', 'test@vse.cz', NULL, 'admin', '$2y$10$xJYPkow4DuysC3nh6X0O3.GNqK5G1R1FAWL2s8MmfflntTWaPH3tm'),
                                                                                          (3, 'Vlad Biastinov', 'vladikbyastinov@gmail.com', NULL, 'admin', '$2y$10$cYXA2k7gll/DFfcPMXERxek1rT1xa84VurSb0Y2vSclXVkrEn82MG'),
                                                                                          (4, 'Vlad Biastinov Authenticated', 'biav01@vse.cz', NULL, 'authenticated', '$2y$10$42fI1288Pf1Cq0Bx5ktBpeBtc.J2Ymm60HVJf6ke/1N06dJmXzRn2');

--
-- Indexy pro exportované tabulky
--

--
-- Indexy pro tabulku `cart`
--
ALTER TABLE `cart`
    ADD PRIMARY KEY (`cart_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexy pro tabulku `cart_item`
--
ALTER TABLE `cart_item`
    ADD PRIMARY KEY (`cart_item_id`),
  ADD UNIQUE KEY `product_id` (`product_id`,`cart_id`),
  ADD KEY `cart_id` (`cart_id`);

--
-- Indexy pro tabulku `category`
--
ALTER TABLE `category`
    ADD PRIMARY KEY (`category_id`);

--
-- Indexy pro tabulku `forgotten_password`
--
ALTER TABLE `forgotten_password`
    ADD PRIMARY KEY (`forgotten_password_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexy pro tabulku `objednavka`
--
ALTER TABLE `objednavka`
    ADD PRIMARY KEY (`objednavka_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexy pro tabulku `objednavka_item`
--
ALTER TABLE `objednavka_item`
    ADD PRIMARY KEY (`objednavka_item_id`),
  ADD UNIQUE KEY `product_id` (`product_id`,`objednavka_id`),
  ADD KEY `objednavka_id` (`objednavka_id`);

--
-- Indexy pro tabulku `permission`
--
ALTER TABLE `permission`
    ADD PRIMARY KEY (`permission_id`),
  ADD UNIQUE KEY `role_id` (`role_id`,`resource_id`,`action`,`type`),
  ADD KEY `permission_ibfk_1` (`resource_id`);

--
-- Indexy pro tabulku `product`
--
ALTER TABLE `product`
    ADD PRIMARY KEY (`product_id`),
  ADD UNIQUE KEY `url` (`url`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `stock` (`stock`);

--
-- Indexy pro tabulku `resource`
--
ALTER TABLE `resource`
    ADD PRIMARY KEY (`resource_id`);

--
-- Indexy pro tabulku `role`
--
ALTER TABLE `role`
    ADD PRIMARY KEY (`role_id`);

--
-- Indexy pro tabulku `user`
--
ALTER TABLE `user`
    ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `facebook_id` (`facebook_id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `cart`
--
ALTER TABLE `cart`
    MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1051;

--
-- AUTO_INCREMENT pro tabulku `cart_item`
--
ALTER TABLE `cart_item`
    MODIFY `cart_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT pro tabulku `category`
--
ALTER TABLE `category`
    MODIFY `category_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pro tabulku `forgotten_password`
--
ALTER TABLE `forgotten_password`
    MODIFY `forgotten_password_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pro tabulku `objednavka`
--
ALTER TABLE `objednavka`
    MODIFY `objednavka_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pro tabulku `objednavka_item`
--
ALTER TABLE `objednavka_item`
    MODIFY `objednavka_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT pro tabulku `permission`
--
ALTER TABLE `permission`
    MODIFY `permission_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT pro tabulku `product`
--
ALTER TABLE `product`
    MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pro tabulku `user`
--
ALTER TABLE `user`
    MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `cart`
--
ALTER TABLE `cart`
    ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Omezení pro tabulku `cart_item`
--
ALTER TABLE `cart_item`
    ADD CONSTRAINT `cart_item_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_item_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Omezení pro tabulku `forgotten_password`
--
ALTER TABLE `forgotten_password`
    ADD CONSTRAINT `forgotten_password_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Omezení pro tabulku `objednavka_item`
--
ALTER TABLE `objednavka_item`
    ADD CONSTRAINT `objednavka_item_ibfk_1` FOREIGN KEY (`objednavka_id`) REFERENCES `objednavka` (`objednavka_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `objednavka_item_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Omezení pro tabulku `permission`
--
ALTER TABLE `permission`
    ADD CONSTRAINT `permission_ibfk_1` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`resource_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permission_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Omezení pro tabulku `product`
--
ALTER TABLE `product`
    ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE SET NULL;

--
-- Omezení pro tabulku `user`
--
ALTER TABLE `user`
    ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
