-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Počítač: localhost:3306
-- Vytvořeno: Sob 02. pro 2023, 15:03
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
(63, NULL, '2023-11-29 14:47:39'),
(64, NULL, '2023-11-29 14:48:09'),
(65, NULL, '2023-11-29 14:54:20'),
(66, NULL, '2023-11-29 14:54:39'),
(67, NULL, '2023-11-29 14:55:49'),
(68, NULL, '2023-11-29 14:55:52'),
(69, NULL, '2023-11-29 14:56:08'),
(70, NULL, '2023-11-29 14:56:13'),
(71, NULL, '2023-11-29 14:56:21'),
(72, NULL, '2023-11-29 14:56:27'),
(73, NULL, '2023-11-29 14:56:37'),
(74, NULL, '2023-11-30 14:51:38'),
(75, NULL, '2023-11-30 14:51:56'),
(76, NULL, '2023-11-30 15:59:09'),
(77, NULL, '2023-11-30 15:59:35'),
(78, NULL, '2023-11-30 16:10:26'),
(79, NULL, '2023-11-30 16:10:37'),
(80, NULL, '2023-11-30 16:11:27'),
(81, NULL, '2023-11-30 16:13:06'),
(82, NULL, '2023-11-30 16:13:07'),
(83, NULL, '2023-11-30 16:30:59'),
(84, NULL, '2023-11-30 16:40:37'),
(85, NULL, '2023-11-30 16:40:39'),
(86, NULL, '2023-11-30 16:40:42'),
(87, NULL, '2023-11-30 16:40:44'),
(88, NULL, '2023-11-30 16:40:46'),
(89, NULL, '2023-11-30 16:40:49'),
(90, NULL, '2023-11-30 16:40:51'),
(91, NULL, '2023-11-30 16:40:58'),
(92, NULL, '2023-11-30 16:40:58'),
(93, NULL, '2023-11-30 16:41:03'),
(94, NULL, '2023-11-30 16:41:04'),
(95, NULL, '2023-11-30 16:41:11'),
(96, NULL, '2023-11-30 16:41:13'),
(97, NULL, '2023-11-30 16:41:14'),
(98, NULL, '2023-11-30 16:41:16'),
(99, NULL, '2023-11-30 16:41:17'),
(100, NULL, '2023-11-30 16:41:19'),
(101, NULL, '2023-11-30 16:41:20'),
(102, NULL, '2023-11-30 16:44:47'),
(103, NULL, '2023-11-30 16:44:50'),
(104, NULL, '2023-11-30 16:44:55'),
(105, NULL, '2023-11-30 16:44:58'),
(106, NULL, '2023-11-30 16:45:00'),
(107, NULL, '2023-11-30 16:45:02'),
(108, NULL, '2023-11-30 16:45:05'),
(109, NULL, '2023-11-30 17:02:37'),
(110, NULL, '2023-11-30 17:04:58'),
(111, NULL, '2023-11-30 17:05:03'),
(112, NULL, '2023-11-30 17:17:39'),
(113, NULL, '2023-11-30 17:18:00'),
(114, NULL, '2023-11-30 17:38:45'),
(115, NULL, '2023-11-30 17:38:49'),
(116, NULL, '2023-11-30 17:38:50'),
(117, NULL, '2023-11-30 17:38:51'),
(118, NULL, '2023-11-30 17:54:05'),
(119, NULL, '2023-11-30 17:54:11'),
(120, NULL, '2023-11-30 17:54:17'),
(121, NULL, '2023-11-30 17:54:20'),
(122, NULL, '2023-11-30 17:54:22'),
(123, NULL, '2023-11-30 17:54:31'),
(124, NULL, '2023-11-30 17:54:33'),
(125, NULL, '2023-11-30 17:59:02'),
(126, NULL, '2023-11-30 17:59:04'),
(127, NULL, '2023-11-30 17:59:23'),
(128, NULL, '2023-11-30 17:59:25'),
(129, NULL, '2023-11-30 18:08:30'),
(130, NULL, '2023-11-30 18:11:39'),
(131, NULL, '2023-11-30 18:11:47'),
(132, NULL, '2023-11-30 18:11:50'),
(133, NULL, '2023-11-30 18:12:07'),
(134, NULL, '2023-11-30 18:12:10'),
(135, NULL, '2023-11-30 18:12:11'),
(136, NULL, '2023-11-30 18:12:14'),
(137, NULL, '2023-12-01 13:39:17'),
(138, NULL, '2023-12-01 14:44:22'),
(139, NULL, '2023-12-01 20:04:32'),
(140, NULL, '2023-12-01 20:05:24'),
(141, NULL, '2023-12-01 20:05:50'),
(142, NULL, '2023-12-01 20:08:08'),
(143, NULL, '2023-12-01 20:09:36'),
(144, NULL, '2023-12-01 20:11:37'),
(145, NULL, '2023-12-01 20:17:24'),
(146, NULL, '2023-12-01 20:35:09'),
(147, NULL, '2023-12-01 20:39:39'),
(148, NULL, '2023-12-01 20:39:41'),
(149, NULL, '2023-12-01 20:42:52'),
(150, NULL, '2023-12-01 20:43:00'),
(151, NULL, '2023-12-01 20:43:01'),
(152, NULL, '2023-12-01 20:43:03'),
(153, NULL, '2023-12-01 20:43:04'),
(154, NULL, '2023-12-01 20:43:08'),
(155, NULL, '2023-12-01 20:50:24'),
(156, NULL, '2023-12-01 20:50:28'),
(157, NULL, '2023-12-01 20:50:30'),
(158, NULL, '2023-12-01 21:23:55'),
(159, NULL, '2023-12-01 21:29:36'),
(160, NULL, '2023-12-01 21:29:37'),
(161, NULL, '2023-12-01 21:29:39'),
(162, NULL, '2023-12-01 21:29:42'),
(163, NULL, '2023-12-01 21:29:47'),
(164, NULL, '2023-12-01 21:29:51'),
(165, NULL, '2023-12-01 21:29:56'),
(166, NULL, '2023-12-01 21:29:57'),
(167, NULL, '2023-12-01 21:34:15'),
(168, NULL, '2023-12-01 21:34:22'),
(169, NULL, '2023-12-01 21:34:24'),
(170, NULL, '2023-12-01 21:34:26'),
(171, NULL, '2023-12-01 21:34:28'),
(172, NULL, '2023-12-02 10:38:01'),
(173, NULL, '2023-12-02 10:38:03'),
(174, NULL, '2023-12-02 10:38:21'),
(175, NULL, '2023-12-02 10:38:37'),
(176, NULL, '2023-12-02 10:39:07'),
(177, NULL, '2023-12-02 10:39:10'),
(178, 1, '2023-12-02 12:21:09'),
(179, NULL, '2023-12-02 12:21:19'),
(180, NULL, '2023-12-02 12:21:24'),
(181, NULL, '2023-12-02 12:21:29'),
(182, NULL, '2023-12-02 12:21:31'),
(183, NULL, '2023-12-02 12:21:32'),
(184, NULL, '2023-12-02 12:21:35'),
(185, NULL, '2023-12-02 12:21:36'),
(186, NULL, '2023-12-02 12:21:37'),
(187, NULL, '2023-12-02 12:21:40'),
(188, NULL, '2023-12-02 12:21:42'),
(189, NULL, '2023-12-02 12:21:42'),
(190, NULL, '2023-12-02 12:22:25'),
(191, NULL, '2023-12-02 12:47:27'),
(192, NULL, '2023-12-02 12:47:42'),
(193, NULL, '2023-12-02 12:47:44'),
(194, NULL, '2023-12-02 12:47:59'),
(195, NULL, '2023-12-02 12:48:00'),
(196, NULL, '2023-12-02 12:48:02'),
(197, NULL, '2023-12-02 12:48:06'),
(198, NULL, '2023-12-02 12:48:08'),
(199, NULL, '2023-12-02 12:48:09'),
(200, NULL, '2023-12-02 12:48:10'),
(201, NULL, '2023-12-02 12:48:11'),
(202, NULL, '2023-12-02 12:48:12'),
(203, NULL, '2023-12-02 12:48:13'),
(204, NULL, '2023-12-02 12:48:15'),
(205, NULL, '2023-12-02 12:48:16'),
(206, NULL, '2023-12-02 12:48:17'),
(207, NULL, '2023-12-02 12:48:20'),
(208, NULL, '2023-12-02 12:48:20'),
(209, NULL, '2023-12-02 12:48:23'),
(210, NULL, '2023-12-02 12:48:26'),
(211, NULL, '2023-12-02 12:48:26'),
(212, NULL, '2023-12-02 14:02:24'),
(213, NULL, '2023-12-02 14:02:27'),
(214, NULL, '2023-12-02 14:02:29'),
(215, NULL, '2023-12-02 14:02:34'),
(216, NULL, '2023-12-02 14:02:36'),
(217, NULL, '2023-12-02 14:02:41'),
(218, NULL, '2023-12-02 14:02:42'),
(219, NULL, '2023-12-02 14:02:46'),
(220, NULL, '2023-12-02 14:02:48'),
(221, NULL, '2023-12-02 14:02:50'),
(222, NULL, '2023-12-02 14:02:53'),
(223, NULL, '2023-12-02 14:02:56'),
(224, NULL, '2023-12-02 14:02:59'),
(225, NULL, '2023-12-02 14:03:02'),
(226, NULL, '2023-12-02 14:03:03'),
(227, NULL, '2023-12-02 14:03:06');

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
(24, 'admin', 'Admin:Product', '', 'allow'),
(12, 'admin', 'Category', '', 'allow'),
(23, 'admin', 'Product', '', 'allow'),
(28, 'authenticated', 'Admin:Product', '', 'allow'),
(38, 'authenticated', 'Front:About', '', 'allow'),
(36, 'authenticated', 'Front:Contact', '', 'allow'),
(4, 'authenticated', 'Front:Error', '', 'allow'),
(5, 'authenticated', 'Front:Error4xx', '', 'allow'),
(6, 'authenticated', 'Front:Homepage', '', 'allow'),
(34, 'authenticated', 'Front:Product', '', 'allow'),
(9, 'authenticated', 'Front:User', 'login', 'allow'),
(10, 'authenticated', 'Front:User', 'logout', 'allow'),
(27, 'authenticated', 'Product', '', 'allow'),
(26, 'guest', 'Admin:Product', '', 'allow'),
(37, 'guest', 'Front:About', '', 'allow'),
(35, 'guest', 'Front:Contact', '', 'allow'),
(1, 'guest', 'Front:Error', '', 'allow'),
(2, 'guest', 'Front:Error4xx', '', 'allow'),
(3, 'guest', 'Front:Homepage', '', 'allow'),
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
  `available` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci COMMENT='Tabulka s nabízenými produkty';

--
-- Vypisuji data pro tabulku `product`
--

INSERT INTO `product` (`product_id`, `category_id`, `title`, `url`, `description`, `price`, `photo_extension`, `available`) VALUES
(2, NULL, 'PocketBook 700 Era Stardust Silver', 'pocketbook700', 'Elektronická čtečka knih - 7\" podsvícený dotykový E Ink displej, rozlišení Full HD 1680 × 1264, vnitřní paměť 16 GB, WiFi a Bluetooth, bez paměťové karty, konektor USB-C, 1700mAh baterie, reproduktor součástí, s možností přehrávání hudby, s webovým prohlížečem, stupeň krytí IPX8', '4499.00', 'jpeg', 1),
(3, NULL, 'ONYX BOOX PAGE, černá, 7\", 32GB', 'onyxbookpage', 'Elektronická čtečka knih - 7\" podsvícený dotykový E Ink displej, rozlišení Full HD 1680 × 1264, vnitřní paměť 32 GB, WiFi a Bluetooth, micro SD a micro SDHC paměťová karta, konektor USB-C, 2300mAh baterie, reproduktor, mikrofon součástí, s možností přehrávání hudby, s webovým prohlížečem.', '6499.00', 'jpeg', 1),
(4, NULL, 'ONYX BOOX TAB MINI C, černá, 7,8\", 64GB', 'onyxbooktab', 'Elektronická čtečka knih - 7,8\" podsvícený dotykový E Ink displej, rozlišení QHD 1872 × 1404, vnitřní paměť 64 GB, WiFi a Bluetooth, bez paměťové karty, konektor USB-C, 5000mAh baterie, reproduktor, mikrofon a stylus součástí, s možností přehrávání hudby, s webovým prohlížečem.', '10990.00', 'jpeg', 1),
(5, NULL, 'PocketBook 743C InkPad Color 2 Moon Silver, stříbrný', 'pocketbook743c', 'Elektronická čtečka knih - 7,80\" podsvícený dotykový E Ink displej, rozlišení QHD 1872 × 1404, vnitřní paměť 31,25 GB, WiFi a Bluetooth, bez paměťové karty, konektor USB-C, 2900mAh baterie, reproduktor součástí, s možností přehrávání hudby, s webovým prohlížečem, stupeň krytí IPX8.', '7499.00', 'jpeg', 1),
(6, NULL, 'Amazon Kindle Paperwhite 5 2021 32GB Signature Edition (bez reklamy)', 'amazonkindlepaperwhite2021', 'Elektronická čtečka knih - 6,8\" podsvícený dotykový displej, vnitřní paměť 32 GB, WiFi a Bluetooth, bez paměťové karty, konektor USB-C, stupeň krytí IPX8.', '4990.00', 'jpeg', 1),
(7, NULL, 'Amazon Kindle 2022, 16GB, černý, bez reklam', 'amazonkindle2022', 'Elektronická čtečka knih - 6\" podsvícený dotykový E Ink displej, rozlišení Full HD 1448 × 1072, vnitřní paměť 15,625 GB, WiFi a Bluetooth, bez paměťové karty, konektor USB-C, 1040mAh baterie', '2990.00', 'jpeg', 1),
(8, NULL, 'FIXED GaN s 2xUSB-C a USB výstupem podpora PD 65W bílá', 'fixedgan65w', 'Nabíječka do sítě - s podporou rychlého nabíjení, celkový výkon 65 W (1× USB-C až 45 W, 1× USB-C až 45 W, 1× USB-A až 15 W), technologie USB Power Delivery, Qualcomm Quick Charge 3.0 a Qualcomm Quick Charge 4.0+, přepěťová a podpěťová ochrana, indikace nabíjení, regulace teploty, s technologií GaN, pro Android a iPhone.', '700.00', 'jpeg', 1),
(9, NULL, 'Apple USB 5W napájecí adaptér', 'appleadapter', 'Nabíječka do sítě pro jakékoliv modely iPhone a iPad. Bez napájecího kabelu.', '199.00', 'jpeg', 1);

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
('Admin:Product'),
('Category'),
('Front:About'),
('Front:Contact'),
('Front:Error'),
('Front:Error4xx'),
('Front:Homepage'),
('Front:Product'),
('Front:User'),
('Product');

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
(1, 'test', 'test@vse.cz', NULL, 'admin', '$2y$10$xJYPkow4DuysC3nh6X0O3.GNqK5G1R1FAWL2s8MmfflntTWaPH3tm');

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
  ADD KEY `available` (`available`);

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
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=228;

--
-- AUTO_INCREMENT pro tabulku `cart_item`
--
ALTER TABLE `cart_item`
  MODIFY `cart_item_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pro tabulku `category`
--
ALTER TABLE `category`
  MODIFY `category_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pro tabulku `forgotten_password`
--
ALTER TABLE `forgotten_password`
  MODIFY `forgotten_password_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pro tabulku `permission`
--
ALTER TABLE `permission`
  MODIFY `permission_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT pro tabulku `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pro tabulku `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
