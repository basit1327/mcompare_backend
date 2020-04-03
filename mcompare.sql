-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 03, 2020 at 08:37 AM
-- Server version: 10.1.35-MariaDB
-- PHP Version: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mcompare`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '0 mean not verified \\n1 mean verified'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`id`, `name`, `email`, `password`, `status`) VALUES
(1, 'basit', 'abc@mail.com', '827ccb0eea8a706c4c34a16891f84e7b', 1),
(4, 'asd asdas', 'admin@mail.com', '47bce5c74f589f4867dbd57e9ca9f808', 1),
(5, 'Efsol Inc', 'test@mail.com', '202cb962ac59075b964b07152d234b70', 1);

-- --------------------------------------------------------

--
-- Table structure for table `market`
--

CREATE TABLE `market` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `image` varchar(145) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '0 mean deleted\n1 mean active'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `market`
--

INSERT INTO `market` (`id`, `name`, `city`, `description`, `image`, `status`) VALUES
(1, 'Aswaq.com', 'Riyadah', 'We at Aswaq.com are always looking to achieve the best online shopping experience. We offer you a warranty policy for the products that will be considered under warranty in order to provide a manufacturer guarantee for a number of categories from the', 'https://dzppdanjv9s1e.cloudfront.net/static/main/img/EN-logo.svg', 1),
(2, 'Sauq.com', 'Riyadah', 'Welcome to Souq.com – the Middle East’s online marketplace.', 'https://cf1.s3.souqcdn.com/public/style/img/en/souqAmazon-logo-v2.png', 1),
(3, 'Awok.com', 'Abu Dhabi', 'Awok is an e-commerce company headquartered in Dubai, U.A.E. The company sells items such as Fashion Apparel, Fashion accessories, Kitchenware, Home Appliances, Mobiles, Cameras, Health and Beauty Products. ', 'https://s5c.awokcdn.com/bitrix/templates/awok-lang/images/header/awok-online-shopping-logo.png', 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `price` double DEFAULT '0',
  `rating` double DEFAULT '3',
  `market_id` int(10) UNSIGNED NOT NULL,
  `image` varchar(150) DEFAULT 'placeholder.png',
  `status` tinyint(1) DEFAULT '1' COMMENT '0 mean deleted\n1 mean active',
  `added_date` varchar(15) DEFAULT NULL COMMENT 'timestamp',
  `sale_count` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `rating`, `market_id`, `image`, `status`, `added_date`, `sale_count`) VALUES
(1, 'Safeguard Liquid Hand Soap Wash Lemon Fresh 2', 120, 5, 1, 'https://static-01.daraz.pk/original/8b3c21e5d7c0f2f14736126ca70bfd02.jpg', 1, '1585318225705', 0),
(2, 'Dettol Liquid Handwash 250ml-Original', 250, 4.5, 1, 'https://static-01.daraz.pk/p/b7873439bbf6a357c73a1ffe17a61cf5.jpg', 1, '1585318225705', 0),
(3, 'Hemani Tea Tree Oil 30ml', 270, 4, 1, 'https://static-01.daraz.pk/original/3ba9099ae2ae79a8c207cf663942f65e.jpg', 1, '1585318225705', 0),
(4, 'Prowax - Professional Hair Removal Wax Heater', 949, 5, 1, 'https://static-01.daraz.pk/p/8df2aab159ce2bf8d1a7d5e39d6b2ed7.jpg', 1, '1585318225705', 0),
(5, 'Tea Tree Essential Oil 100% Pure & Natural - ', 550, 3.5, 1, 'https://static-01.daraz.pk/original/d51f49bbf452dc781b6eb90dd3d8fd2f.jpg', 1, '1585318225705', 0),
(6, 'Km 1720-Electric Shaver & Trimmer', 772, 4, 1, 'https://static-01.daraz.pk/original/3bd0cff6041643fa2d0a94aac207d42f.jpg', 1, '1585318225705', 0),
(7, 'Hemani Pure Natural Coconut Oil 400ml', 580, 4.5, 1, 'https://static-01.daraz.pk/p/15b7e59d482a9c55fef0075d5bd3fe9e.jpg', 1, '1585318225705', 0),
(8, 'Philips HP6420/00 - Satinelle Epilator for Wo', 3000, 5, 1, 'https://static-01.daraz.pk/p/ceaa5659187ba407626312d6824a4926.jpg', 1, '1585318225705', 0),
(9, 'Dettol Liquid Handwash Pump 150ml-Original', 190, 4, 1, 'https://static-01.daraz.pk/p/33c18a4c2e38f11c69e710af9be8e6f1.jpg', 1, '1585318225705', 0),
(10, 'Hemani Sweet Almond Oil 30ml', 175, 3, 1, 'https://static-01.daraz.pk/original/ddf242b057b71b753e4320c55e0c18a1.jpg', 1, '1585318225705', 0),
(11, 'Hair Remover Spray -100ml', 190, 3.5, 1, 'https://static-01.daraz.pk/original/2a98a1b96b21bb0195e5a7ef75c28a93.jpg', 1, '1585318225705', 0),
(12, 'Safeguard Liquid Hand Soap Wash Lemon Fresh 2', 110, 5, 2, 'https://static-01.daraz.pk/original/8b3c21e5d7c0f2f14736126ca70bfd02.jpg', 1, '1585318225705', 0),
(13, 'Dettol Liquid Handwash 250ml-Original', 260, 4.5, 2, 'https://static-01.daraz.pk/p/b7873439bbf6a357c73a1ffe17a61cf5.jpg', 1, '1585318225705', 0),
(14, 'Hemani Tea Tree Oil 30ml', 300, 4, 2, 'https://static-01.daraz.pk/original/3ba9099ae2ae79a8c207cf663942f65e.jpg', 1, '1585318225705', 0),
(15, 'Prowax - Professional Hair Removal Wax Heater', 935, 5, 2, 'https://static-01.daraz.pk/p/8df2aab159ce2bf8d1a7d5e39d6b2ed7.jpg', 1, '1585318225705', 0),
(16, 'Tea Tree Essential Oil 100% Pure & Natural - ', 480, 3.5, 2, 'https://static-01.daraz.pk/original/d51f49bbf452dc781b6eb90dd3d8fd2f.jpg', 1, '1585318225705', 0),
(17, 'Dettol Liquid Handwash 250ml-Original', 200, 4.5, 3, 'https://static-01.daraz.pk/p/b7873439bbf6a357c73a1ffe17a61cf5.jpg', 1, '1585318225705', 0),
(18, 'Hemani Tea Tree Oil 30ml', 250, 4, 3, 'https://static-01.daraz.pk/original/3ba9099ae2ae79a8c207cf663942f65e.jpg', 1, '1585318225705', 0),
(19, 'Prowax - Professional Hair Removal Wax Heater', 1000, 5, 3, 'https://static-01.daraz.pk/p/8df2aab159ce2bf8d1a7d5e39d6b2ed7.jpg', 1, '1585318225705', 0),
(20, 'Tea Tree Essential Oil 100% Pure & Natural - ', 560, 3.5, 3, 'https://static-01.daraz.pk/original/d51f49bbf452dc781b6eb90dd3d8fd2f.jpg', 1, '1585318225705', 0),
(21, 'Km 1720-Electric Shaver & Trimmer', 760, 4, 3, 'https://static-01.daraz.pk/original/3bd0cff6041643fa2d0a94aac207d42f.jpg', 1, '1585318225705', 0),
(22, 'Hemani Pure Natural Coconut Oil 400ml', 550, 4.5, 3, 'https://static-01.daraz.pk/p/15b7e59d482a9c55fef0075d5bd3fe9e.jpg', 1, '1585318225705', 0),
(23, 'NESTLÉ KOKO KRUNCH Cereals 500g', 680, 5, 2, 'https://static-01.daraz.pk/p/ce3ca55bc9c43a4b359991bfb1d0b3ca.jpg', 1, '1585318225705', 0),
(24, 'Hemani Honey With Ginseng 250gm', 410, 4.5, 2, 'https://static-01.daraz.pk/original/691049b875d2a7629d22567e95bd9103.jpg', 1, '1585318225705', 0),
(25, 'NESTLE KOKO KRUNCH - 170g', 380, 4, 2, 'https://static-01.daraz.pk/p/61ffd9f762e84970a73bb47ef319fdb5.jpg', 1, '1585318225705', 0),
(26, 'MILO Breakfast Cereal - 330g', 190, 5, 2, 'https://static-01.daraz.pk/p/14a422f7531cfad5720c46cd9a1b3812.jpg', 1, '1585318225705', 0),
(27, 'Barley Porridge 500gm', 380, 3.5, 2, 'https://static-01.daraz.pk/original/e6fd060f4377bd96ab2f982a291c64f2.jpg', 1, '1585318225705', 0),
(28, 'NESTLÉ MILO Cereals - 170g', 320, 4, 2, 'https://static-01.daraz.pk/p/d5876669fd8ff990c23fe62656eba08f.jpg', 1, '1585318225705', 0),
(29, 'Young Chicken Spread 500ml', 860, 4.5, 2, 'https://static-01.daraz.pk/p/19bfe53b2ede47e1d69144ec04575826.jpg', 1, '1585318225705', 0),
(30, 'Fruit Full Pineapple Jam - 430gm', 342, 5, 2, 'https://static-01.daraz.pk/original/7e46572ea974941401aa6e421f56c0ad.jpg', 1, '1585318225705', 0),
(31, 'Chocolaty Spread 600g', 36, 4, 2, 'https://static-01.daraz.pk/p/1a37504c47fbf136d65cd06def7f8757.jpg', 1, '1585318225705', 0),
(32, 'Doller SP-10 rainbow ink pens', 374, 3, 2, 'https://static-01.daraz.pk/p/b36d700cdd2907ad6b655d8fed3f44d9.jpg', 1, '1585318225705', 0),
(33, 'Corn Flakes 375g', 405, 3.5, 2, 'https://static-01.daraz.pk/p/7a23ee95f66a74d882c36d0440a34cae.jpg', 1, '1585318225705', 0),
(34, 'Apple Jam 1KG Economy Pack', 374, 5, 2, 'https://static-01.daraz.pk/original/3770c4efb9bf21362aec96a40435a416.jpg', 1, '1585318225705', 0),
(35, 'NESTLÉ KOKO KRUNCH Cereals 500g', 660, 4.5, 3, 'https://static-01.daraz.pk/p/ce3ca55bc9c43a4b359991bfb1d0b3ca.jpg', 1, '1585318225705', 0),
(36, 'Hemani Honey With Ginseng 250gm', 400, 4, 3, 'https://static-01.daraz.pk/original/691049b875d2a7629d22567e95bd9103.jpg', 1, '1585318225705', 0),
(37, 'NESTLE KOKO KRUNCH - 170g', 400, 5, 3, 'https://static-01.daraz.pk/p/61ffd9f762e84970a73bb47ef319fdb5.jpg', 1, '1585318225705', 0),
(38, 'MILO Breakfast Cereal - 330g', 200, 3.5, 1, 'https://static-01.daraz.pk/p/14a422f7531cfad5720c46cd9a1b3812.jpg', 1, '1585318225705', 0),
(39, 'Barley Porridge 500gm', 385, 4.5, 3, 'https://static-01.daraz.pk/original/e6fd060f4377bd96ab2f982a291c64f2.jpg', 1, '1585318225705', 0),
(40, 'NESTLÉ MILO Cereals - 170g', 310, 4, 3, 'https://static-01.daraz.pk/p/d5876669fd8ff990c23fe62656eba08f.jpg', 1, '1585318225705', 0),
(41, 'Doller SP-10 rainbow ink pens', 370, 5, 1, 'https://static-01.daraz.pk/p/b36d700cdd2907ad6b655d8fed3f44d9.jpg', 1, '1585318225705', 0),
(42, 'Corn Flakes 375g', 400, 3.5, 1, 'https://static-01.daraz.pk/p/7a23ee95f66a74d882c36d0440a34cae.jpg', 1, '1585318225705', 0),
(43, 'Apple Jam 1KG Economy Pack', 380, 4, 1, 'https://static-01.daraz.pk/original/3770c4efb9bf21362aec96a40435a416.jpg', 1, '1585318225705', 0),
(44, 'NESTLÉ KOKO KRUNCH Cereals 500g', 660, 4.5, 1, 'https://static-01.daraz.pk/p/ce3ca55bc9c43a4b359991bfb1d0b3ca.jpg', 1, '1585318225705', 0),
(45, 'Hemani Honey With Ginseng 250gm', 400, 3, 1, 'https://static-01.daraz.pk/original/691049b875d2a7629d22567e95bd9103.jpg', 1, '1585318225705', 0),
(46, 'NESTLE KOKO KRUNCH - 170g', 400, 4, 1, 'https://static-01.daraz.pk/p/61ffd9f762e84970a73bb47ef319fdb5.jpg', 1, '1585318225705', 0),
(47, 'Barley Porridge 500gm', 385, 5, 1, 'https://static-01.daraz.pk/original/e6fd060f4377bd96ab2f982a291c64f2.jpg', 1, '1585318225705', 0),
(48, 'NESTLÉ MILO Cereals - 170g', 310, 4.5, 1, 'https://static-01.daraz.pk/p/d5876669fd8ff990c23fe62656eba08f.jpg', 1, '1585318225705', 0),
(49, 'Swing - 12SP - Blue', 9222, 4, 2, 'https://static-01.daraz.pk/original/2e307dd65bc8ed5fced5c4ef14231e64.jpg', 1, '1585318225705', 0),
(50, 'Pack of 5 - Breast Milk Storage Cups - 180 ml', 1650, 5, 2, 'https://static-01.daraz.pk/original/7bdf1a6d2c6b2af80d07d7c0b3f1c3ff.jpg', 1, '1585318225705', 0),
(51, '3 in 1 - Electric Sterilizer - White', 15813, 3.5, 2, 'https://static-01.daraz.pk/original/8910df1455266e53acc8c73d2f890cfa.jpg', 1, '1585318225705', 0),
(52, 'Disposable Breast Pads Pk60 (Day)', 2398, 4.5, 2, 'https://static-01.daraz.pk/original/2f1b3e2b135c1509f0b920af8ae3466b.jpg', 1, '1585318225705', 0),
(53, 'Handkerchief Bathing Towel Cute Microfiber Sm', 1424, 4, 2, 'https://static-01.daraz.pk/original/a1024ec8e641e3a481a0fed049911cc5.jpg', 1, '1585318225705', 0),
(54, 'Natural Single Elec.Breast Pump', 33688, 5, 2, 'https://static-01.daraz.pk/original/c7bf53afa119c7b6162aaac8d1accb83.jpg', 1, '1585318225705', 0),
(55, '3D Bath Rug Pattern Rug Seashell Bath Mat Fla', 1404, 3.5, 2, 'https://static-01.daraz.pk/p/8bb1dbdaaaded22216ed5486b517616c.jpg', 1, '1585318225705', 0),
(56, 'Johnson Baby Baby Powder Blossom 200Gm', 184, 4, 2, 'https://static-01.daraz.pk/p/f94cee0db0a1fb1c46162eb68764fa73.jpg', 1, '1585318225705', 0),
(57, 'Kids Boys Girl Cotton Socks Cartoon Cute Bear', 779, 4.5, 2, 'https://static-01.daraz.pk/p/6b367e0b580058527c542842d04e1edc.jpg', 1, '1585318225705', 0),
(58, 'Johnson Baby Baby Bedtime Powder 500Gm', 375, 3, 2, 'https://static-01.daraz.pk/p/53824ab1ebc0d6dc13b38028b5aa927c.jpg', 1, '1585318225705', 0),
(59, 'Automatic Toothpaste Dispenser Family Toothbr', 350, 4, 2, 'https://static-01.daraz.pk/p/mdc/acab263cf9a58215d4bf811ae4164f31.jpg', 1, '1585318225705', 0),
(60, '3 in 1 - Electric Sterilizer - White', 15810, 3.5, 1, 'https://static-01.daraz.pk/original/8910df1455266e53acc8c73d2f890cfa.jpg', 1, '1585318225705', 0),
(61, 'Disposable Breast Pads Pk60 (Day)', 2400, 4.5, 1, 'https://static-01.daraz.pk/original/2f1b3e2b135c1509f0b920af8ae3466b.jpg', 1, '1585318225705', 0),
(62, 'Handkerchief Bathing Towel Cute Microfiber Sm', 1440, 4, 1, 'https://static-01.daraz.pk/original/a1024ec8e641e3a481a0fed049911cc5.jpg', 1, '1585318225705', 0),
(63, 'Natural Single Elec.Breast Pump', 33700, 5, 1, 'https://static-01.daraz.pk/original/c7bf53afa119c7b6162aaac8d1accb83.jpg', 1, '1585318225705', 0),
(64, '3D Bath Rug Pattern Rug Seashell Bath Mat Fla', 1420, 3.5, 1, 'https://static-01.daraz.pk/p/8bb1dbdaaaded22216ed5486b517616c.jpg', 1, '1585318225705', 0),
(65, 'Johnson Baby Baby Powder Blossom 200Gm', 150, 4, 1, 'https://static-01.daraz.pk/p/f94cee0db0a1fb1c46162eb68764fa73.jpg', 1, '1585318225705', 0),
(66, 'Johnson Baby Baby Bedtime Powder 500Gm', 380, 3, 3, 'https://static-01.daraz.pk/p/53824ab1ebc0d6dc13b38028b5aa927c.jpg', 1, '1585318225705', 0),
(67, 'Automatic Toothpaste Dispenser Family Toothbr', 350, 4, 3, 'https://static-01.daraz.pk/p/mdc/acab263cf9a58215d4bf811ae4164f31.jpg', 1, '1585318225705', 0),
(68, '3 in 1 - Electric Sterilizer - White', 15800, 3.5, 3, 'https://static-01.daraz.pk/original/8910df1455266e53acc8c73d2f890cfa.jpg', 1, '1585318225705', 0),
(69, 'Disposable Breast Pads Pk60 (Day)', 2390, 4.5, 3, 'https://static-01.daraz.pk/original/2f1b3e2b135c1509f0b920af8ae3466b.jpg', 1, '1585318225705', 0),
(70, 'Adify Black Rubber Sole Casual Shoes for Men', 720, 4.5, 1, 'https://static-01.daraz.pk/original/90a56e00eb233d4a3f7d3e39e4b0de4e.jpg', 1, '1585318225705', 0),
(71, 'Black Artificial Leather Loafers for Men', 780, 4, 1, 'https://static-01.daraz.pk/original/d8f0e84974d1317f06e222801a68f223.jpg', 1, '1585318225705', 0),
(72, 'Brown Leather Snake Textured Shoes for Men', 899, 5, 1, 'https://static-01.daraz.pk/original/23e3f677bcd31086ca349dd04edf9ff3.jpg', 1, '1585318225705', 0),
(73, 'Peshawari Chappal Bold Brown Kaptan Kheri For', 3000, 3.5, 1, 'https://static-01.daraz.pk/original/22a15c6623806f1afcab73c8369c092d.jpg', 1, '1585318225705', 0),
(74, 'BL6-11-Black Leather Dress Shoe', 9000, 4, 1, 'https://static-01.daraz.pk/original/ecf8ed2594a03a3523b2c3c9d71c65cf.jpg', 1, '1585318225705', 0),
(75, '80-02-Black Color Leather Dress Shoe For Men', 7000, 3, 1, 'https://static-01.daraz.pk/original/ecaea9d661ac7ddcdfb9e36c882d5e9a.jpg', 1, '1585318225705', 0),
(76, 'Blue jeans lace shoes for Men - blue jeans sh', 7000, 4, 1, 'https://static-01.daraz.pk/original/39b034a4a4a43c0994849f422863956d.jpg', 1, '1585318225705', 0),
(77, 'Coffee Leather Roman Sandals For Men', 2721, 5, 1, 'https://static-01.daraz.pk/p/00a5d7cffb5283b5bc1d4b5da4b418b0.jpg', 1, '1585318225705', 0),
(78, 'Black Pu Leather Tassel Shoes For Men - IN69', 4000, 3.5, 1, 'https://static-01.daraz.pk/original/de9765909eb236dd9def64f1f70c6c46.jpg', 1, '1585318225705', 0),
(79, 'Browm Pu Leather Oxford Tassel Shoes For Men ', 3900, 4.5, 1, 'https://static-01.daraz.pk/original/86085d0a7c4d03859ad8fc9fe7e32b27.jpg', 1, '1585318225705', 0),
(80, 'Brown Leather Snake Textured Shoes for Men', 950, 5, 2, 'https://static-01.daraz.pk/original/23e3f677bcd31086ca349dd04edf9ff3.jpg', 1, '1585318225705', 0),
(81, 'Peshawari Chappal Bold Brown Kaptan Kheri For', 3200, 3.5, 2, 'https://static-01.daraz.pk/original/22a15c6623806f1afcab73c8369c092d.jpg', 1, '1585318225705', 0),
(82, 'BL6-11-Black Leather Dress Shoe', 8900, 4, 2, 'https://static-01.daraz.pk/original/ecf8ed2594a03a3523b2c3c9d71c65cf.jpg', 1, '1585318225705', 0),
(83, '80-02-Black Color Leather Dress Shoe For Men', 7500, 3, 2, 'https://static-01.daraz.pk/original/ecaea9d661ac7ddcdfb9e36c882d5e9a.jpg', 1, '1585318225705', 0),
(84, 'Blue jeans lace shoes for Men - blue jeans sh', 6800, 4, 2, 'https://static-01.daraz.pk/original/39b034a4a4a43c0994849f422863956d.jpg', 1, '1585318225705', 0),
(85, 'Coffee Leather Roman Sandals For Men', 2700, 5, 2, 'https://static-01.daraz.pk/p/00a5d7cffb5283b5bc1d4b5da4b418b0.jpg', 1, '1585318225705', 0),
(86, 'Black Pu Leather Tassel Shoes For Men - IN69', 3999, 3.5, 2, 'https://static-01.daraz.pk/original/de9765909eb236dd9def64f1f70c6c46.jpg', 1, '1585318225705', 0),
(87, '80-02-Black Color Leather Dress Shoe For Men', 7100, 3, 3, 'https://static-01.daraz.pk/original/ecaea9d661ac7ddcdfb9e36c882d5e9a.jpg', 1, '1585318225705', 0),
(88, 'Blue jeans lace shoes for Men - blue jeans sh', 6900, 4, 3, 'https://static-01.daraz.pk/original/39b034a4a4a43c0994849f422863956d.jpg', 1, '1585318225705', 0),
(89, 'Coffee Leather Roman Sandals For Men', 2120, 5, 3, 'https://static-01.daraz.pk/p/00a5d7cffb5283b5bc1d4b5da4b418b0.jpg', 1, '1585318225705', 0),
(90, 'Black Pu Leather Tassel Shoes For Men - IN69', 3999, 3.5, 3, 'https://static-01.daraz.pk/original/de9765909eb236dd9def64f1f70c6c46.jpg', 1, '1585318225705', 0),
(91, 'Browm Pu Leather Oxford Tassel Shoes For Men ', 3900, 4.5, 3, 'https://static-01.daraz.pk/original/86085d0a7c4d03859ad8fc9fe7e32b27.jpg', 1, '1585318225705', 0),
(92, 'Brown Leather Snake Textured Shoes for Men', 950, 5, 3, 'https://static-01.daraz.pk/original/23e3f677bcd31086ca349dd04edf9ff3.jpg', 1, '1585318225705', 0),
(93, 'Peshawari Chappal Bold Brown Kaptan Kheri For', 3100, 3.5, 3, 'https://static-01.daraz.pk/original/22a15c6623806f1afcab73c8369c092d.jpg', 1, '1585318225705', 0),
(94, 'BL6-11-Black Leather Dress Shoe', 8800, 4, 3, 'https://static-01.daraz.pk/original/ecf8ed2594a03a3523b2c3c9d71c65cf.jpg', 1, '1585318225705', 0),
(95, '80-02-Black Color Leather Dress Shoe For Men', 7500, 3, 3, 'https://static-01.daraz.pk/original/ecaea9d661ac7ddcdfb9e36c882d5e9a.jpg', 1, '1585318225705', 0),
(96, 'Blue jeans lace shoes for Men - blue jeans sh', 6800, 4, 3, 'https://static-01.daraz.pk/original/39b034a4a4a43c0994849f422863956d.jpg', 1, '1585318225705', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `market`
--
ALTER TABLE `market`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_market_id_FK` (`market_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `market`
--
ALTER TABLE `market`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `product_market_id_FK` FOREIGN KEY (`market_id`) REFERENCES `market` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
