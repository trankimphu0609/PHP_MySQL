-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 05, 2021 lúc 05:12 AM
-- Phiên bản máy phục vụ: 10.4.14-MariaDB
-- Phiên bản PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `final_doan_version`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brand`
--

CREATE TABLE `brand` (
  `idbr` int(255) UNSIGNED NOT NULL,
  `namebr` varchar(100) COLLATE utf8_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `brand`
--

INSERT INTO `brand` (`idbr`, `namebr`) VALUES
(1, 'adidas'),
(2, 'nike'),
(3, 'fila'),
(4, 'converse'),
(5, 'puma');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `discounting`
--

CREATE TABLE `discounting` (
  `id` int(255) UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `time_start` date NOT NULL,
  `time_end` date NOT NULL,
  `percent` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `discounting`
--

INSERT INTO `discounting` (`id`, `title`, `time_start`, `time_end`, `percent`) VALUES
(2, 'Khai trương shop', '2021-05-03', '2021-05-20', 50);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `informationorder`
--

CREATE TABLE `informationorder` (
  `idPackage` int(255) UNSIGNED NOT NULL,
  `idpr` int(255) UNSIGNED NOT NULL,
  `idsize` int(255) UNSIGNED NOT NULL,
  `qty` int(255) NOT NULL,
  `price` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `informationorder`
--

INSERT INTO `informationorder` (`idPackage`, `idpr`, `idsize`, `qty`, `price`) VALUES
(101, 2, 1, 4, 1000000),
(102, 2, 3, 3, 1000000),
(102, 4, 3, 3, 2000000),
(102, 15, 9, 1, 10000000),
(103, 2, 8, 3, 1000000),
(104, 14, 6, 3, 2500000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `informationorder_discounting`
--

CREATE TABLE `informationorder_discounting` (
  `idOrder` int(255) UNSIGNED NOT NULL,
  `idDiscounting` int(255) UNSIGNED NOT NULL,
  `idpr` int(255) UNSIGNED NOT NULL,
  `idsize` int(255) UNSIGNED NOT NULL,
  `price` int(255) NOT NULL,
  `qty` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `informationorder_discounting`
--

INSERT INTO `informationorder_discounting` (`idOrder`, `idDiscounting`, `idpr`, `idsize`, `price`, `qty`) VALUES
(101, 2, 3, 1, 1200000, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(255) UNSIGNED NOT NULL,
  `idUser` int(255) UNSIGNED NOT NULL,
  `datetime` datetime NOT NULL DEFAULT current_timestamp(),
  `total` int(255) NOT NULL,
  `delivery` int(10) NOT NULL,
  `total_discounting` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `idUser`, `datetime`, `total`, `delivery`, `total_discounting`) VALUES
(101, 11, '2021-05-15 13:19:08', 7600000, 1, 1800000),
(102, 9, '2021-05-15 13:45:27', 19000000, 1, 0),
(103, 11, '2021-05-16 05:50:39', 3000000, 0, 0),
(104, 11, '2021-05-16 10:28:08', 7500000, 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `idpr` int(255) UNSIGNED NOT NULL,
  `namepr` varchar(100) COLLATE utf8_vietnamese_ci NOT NULL,
  `idbr` int(255) UNSIGNED NOT NULL,
  `price` int(11) NOT NULL,
  `image` varchar(100) COLLATE utf8_vietnamese_ci NOT NULL,
  `counting_buy` int(11) NOT NULL DEFAULT 10
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`idpr`, `namepr`, `idbr`, `price`, `image`, `counting_buy`) VALUES
(2, 'CLIMACOOL VENTO SHOES', 1, 1000000, 'Climacool_Vento_Shoes_White_H67642_01_standard.jpg', 20),
(3, 'DAME 7 SHOES FINE CHINA', 1, 1200000, 'Dame_7_Shoes_Fine_China_White_FZ1102_01_standard.jpg', 24),
(4, 'HARDEN VOL. 5 FUTURENATURAL SHOES', 1, 2000000, 'Harden_Vol._5_Futurenatural_Shoes_Black_FZ1070_01_standard.jpg', 17),
(5, 'KAPTIR 2.0 SHOES', 1, 1500000, 'Kaptir_2.0_Shoes_Black_H00279_01_standard.jpg', 10),
(6, 'KAPTIR SUPER SHOES', 1, 3000000, 'Kaptir_Super_Shoes_Black_FZ2870_01_standard.jpg', 10),
(7, 'MULTIX SHOES', 1, 1000000, 'Multix_Shoes_Black_FZ3438_01_standard.jpg', 10),
(8, 'NMD_R1 PRIMEKNIT SHOES', 1, 1500000, 'NMD_R1_Primeknit_Shoes_White_FX6768_01_standard.jpg', 10),
(9, 'NMD_R1 SHOES', 1, 2200000, 'NMD_R1_Shoes_White_G55576_01_standard.jpg', 10),
(10, 'OZWEEGO SHOES', 1, 1700000, 'OZWEEGO_Shoes_Black_GV7379_01_standard.jpg', 10),
(11, 'PHARRELL WILLIAMS HU NMD SHOES', 1, 5000000, 'Pharrell_Williams_HU_NMD_Shoes_Black_GX2487_01_standard.jpg', 10),
(12, 'STAN SMITH SHOES', 1, 4500000, 'Stan_Smith_Shoes_White_FX5502_01_standard.jpg', 10),
(13, 'ULTRA4D SHOES', 1, 1100000, 'Ultra4D_Shoes_Black_FW7089_01_standard.jpg', 10),
(14, 'ULTRABOOST 4.0 DNA SHOES', 1, 2500000, 'Ultraboost_4.0_DNA_Shoes_Grey_H05259_01_standard.jpg', 23),
(15, 'ULTRABOOST 5.0 DNA SHOES', 1, 10000000, 'Ultraboost_5.0_DNA_Shoes_Red_H01014_01_standard.jpg', 11),
(16, 'ULTRABOOST 21 SHOES', 1, 7000000, 'Ultraboost_21_Shoes_White_FY0377_01_standard.jpg', 14),
(17, 'ZX 2K 4D SHOES', 1, 5000000, 'ZX_2K_4D_Shoes_White_FW2002_01_standard.jpg', 10),
(18, 'Chuck 70 “Peace Love Basketball”', 4, 6000000, 'chuck-70-peace-love-basketball-high-top-xhPKkV (1).jpg', 10),
(19, 'Chuck Taylor All Star Crater', 4, 5500000, 'chuck-taylor-all-star-crater-shoe-lfqt2X (1).jpg', 10),
(20, 'Converse Chuck Taylor All Star High Top', 4, 1200000, 'converse-chuck-taylor-all-star-high-top-shoe-xX439O (1).png', 10),
(21, 'Converse Chuck Taylor All Star High Top White', 4, 1500000, 'converse-chuck-taylor-all-star-high-top-unisex-shoe-xX439O (1).png', 10),
(22, 'Converse Custom Chuck Taylor All Star High Top', 4, 1300000, 'custom-converse-chuck-taylor-all-star-high-top (1).jpg', 19),
(23, 'Converse Custom Chuck Taylor All Star Low Top', 4, 1350000, 'custom-converse-chuck-taylor-all-star-low-top (1).jpg', 10),
(24, 'Converse x AMBUSH® Chuck 70 Fuzzy High Top', 4, 1500000, 'converse-x-ambush-chuck-70-fuzzy-high-top-shoe-bfhH23 (1).jpg', 10),
(25, 'Converse x AMBUSH® CTAS', 4, 1000000, 'converse-x-ambush-ctas-duck-boot-9CTkXr (2).jpg', 10),
(26, 'Converse x AMBUSH® CTAS Blue', 4, 1300000, 'converse-x-ambush-ctas-duck-boot-F9rrnK (2).jpg', 10),
(27, 'Roswell Rayguns Chuck 70', 4, 2000000, 'roswell-rayguns-chuck-70-shoe-h2twx5 (1).jpg', 10),
(28, 'Hallasan Premium', 3, 3000000, 'FILA_COM_XLarge-4RM01535_120_01_e.jpg', 10),
(29, 'Men\'s Expeditioner', 3, 1500000, 'FILA_COM_XLarge-1RM01547_702_01_e.jpg', 10),
(30, 'Men\'s Grant Hill 2 Festival', 3, 4300000, 'FILA_COM_XLarge-1BM00743_708_01_e.jpg', 10),
(31, 'Men\'s Hallasan', 3, 5000000, 'FILA_COM_XLarge-1RM01534_253_01_e.jpg', 10),
(32, 'Men\'s MB GID', 3, 4500000, 'FILA_COM_XLarge-1BM01099_047_01_e.jpg', 10),
(33, 'Men\'s T-1 Mid', 3, 5500000, 'FILA_COM_XLarge-1TM00074_702_01_e.jpg', 10),
(34, 'Men\'s Trigate', 3, 5000000, 'FILA_COM_XLarge-1RM01285_003_01_e.jpg', 10),
(35, 'Project 7 Curvelet', 3, 2000000, 'FILA_COM_XLarge-1RM01644_925_01_e.jpg', 10),
(36, 'Project 7 Interation Light', 3, 2200000, 'FILA_COM_XLarge-1RM01645_211_01_e.jpg', 10),
(37, 'Women\'s Amore Blue', 3, 3000000, 'FILA_COM_XLarge-5RM01532_421_01_e.jpg', 10),
(38, 'Women\'s Amore Red', 3, 3000000, 'FILA_COM_XLarge-5RM01532_611_01_e.jpg', 10),
(39, 'Women\'s Disruptor 2 X Ray Tracer', 3, 4000000, 'FILA_COM_XLarge-5FM00669_119_01_e.jpg', 10),
(40, 'Women\'s Disruptor Zero Cream', 3, 4000000, 'FILA_COM_XLarge-5XM01515_101_01_e.jpg', 10),
(41, 'Women\'s Expeditioner', 3, 3000000, 'FILA_COM_XLarge-5RM01238_103_01_e.jpg', 10),
(42, 'Women\'s FILA Orbit Zero Pink', 3, 1500000, 'FILA_COM_XLarge-5RM01566_661_01_e.jpg', 10),
(43, 'Women\'s Hallasan', 3, 2200000, 'FILA_COM_XLarge-5RM01541_117_01_e.jpg', 10),
(44, 'Women\'s Ray Tracer', 3, 1700000, 'FILA_COM_XLarge-5RM01572_152_01_e.jpg', 10),
(45, 'Women\'s Unit Blue', 3, 2000000, 'FILA_COM_XLarge-5XM01298_421_01_e.jpg', 10),
(46, 'Women\'s Unit Pink', 3, 2000000, 'FILA_COM_XLarge-5XM01298_669_01_e.jpg', 10),
(47, 'Jordan 6 Rings', 2, 10000000, 'jordan-6-rings-mens-shoe-X9HJw4 (1).png', 10),
(48, 'Jordan Max Aura 2', 2, 12000000, 'jordan-max-aura-2-mens-shoe-h9mJTc (1).png', 10),
(49, 'Jordan One Take II', 2, 12500000, 'jordan-one-take-ii-basketball-shoe-dcsGDx (1).png', 10),
(50, 'Jordan Why Not Zer0.4 Marathon', 2, 7500000, 'jordan-why-not-zer04-marathon-basketball-shoe-Kg2gX0 (1).png', 10),
(51, 'Jordan Zoom \'92', 2, 8000000, 'jordan-zoom-92-mens-shoe-HGMsj5 (1).png', 10),
(52, 'LeBron 18 Play for the Future', 2, 5000000, 'lebron-18-play-for-the-future-basketball-shoe-qfF6pd (1).jpg', 10),
(53, 'LeBron 18 WhiteBlackGold', 2, 5500000, 'lebron-18-white-black-gold-basketball-shoe-M6DgN2 (1).png', 10),
(54, 'Nike Air Max 90 G', 2, 2200000, 'air-max-90-g-golf-shoe-hxtVmz (1).png', 10),
(55, 'Nike Air Monarch IV', 2, 2500000, 'air-monarch-iv-mens-training-shoe-extra-wide-lPtRrS (1).png', 10),
(56, 'Nike Air Zoom Alphafly NEXT%', 2, 2500000, 'air-zoom-alphafly-next-mens-racing-shoe-2FN3N2 (1).png', 10),
(57, 'Nike Air Zoom BB NXT Sisterhood', 2, 2300000, 'air-zoom-bb-nxt-sisterhood-basketball-shoe-DkL3bs (1).png', 10),
(58, 'Nike Air Zoom Winflo 7', 2, 3000000, 'air-zoom-wio-7-mens-running-shoe-810FRg (1).jpg', 10),
(59, 'Nike Cosmic Unity', 2, 4500000, 'cosmic-unity-basketball-shoe-nDHKr4 (1).png', 10),
(60, 'Nike Fly.By Mid 2 NBK', 2, 4000000, 'flyby-mid-2-nbk-basketball-shoe-69B1LB (4).png', 10),
(61, 'Nike Savaleos', 2, 3500000, 'savaleos-weightlifting-shoe-zvPDl7 (1).png', 10),
(62, 'DISC Rebirth', 5, 5000000, 'DISC-Rebirth-Basketball-Shoes (1).jfif', 10),
(63, 'RS-DREAMER', 5, 5500000, 'RS-DREAMER-Basketball-Shoes (1).jfif', 10),
(27539, 'kietbaby', 1, 1000000, 'bye.jpg', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products_discounting`
--

CREATE TABLE `products_discounting` (
  `id` int(100) UNSIGNED NOT NULL,
  `idpr` int(255) UNSIGNED NOT NULL,
  `idDiscounting` int(255) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `products_discounting`
--

INSERT INTO `products_discounting` (`id`, `idpr`, `idDiscounting`) VALUES
(23, 22, 2),
(24, 23, 2),
(25, 24, 2),
(26, 25, 2),
(27, 26, 2),
(29, 3, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `size`
--

CREATE TABLE `size` (
  `idsize` int(255) UNSIGNED NOT NULL,
  `size` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `size`
--

INSERT INTO `size` (`idsize`, `size`) VALUES
(1, 35),
(2, 36),
(3, 37),
(4, 38),
(5, 39),
(6, 40),
(7, 41),
(8, 42),
(9, 43);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sizeshoe`
--

CREATE TABLE `sizeshoe` (
  `idpr` int(255) UNSIGNED NOT NULL,
  `idsize` int(255) UNSIGNED NOT NULL,
  `qty` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `sizeshoe`
--

INSERT INTO `sizeshoe` (`idpr`, `idsize`, `qty`) VALUES
(2, 1, 100),
(2, 2, 200),
(2, 3, 97),
(2, 4, 50),
(2, 5, 105),
(2, 6, 300),
(2, 7, 50),
(2, 8, 397),
(2, 9, 350),
(3, 1, 499),
(3, 2, 245),
(3, 3, 345),
(3, 4, 300),
(3, 5, 239),
(3, 6, 234),
(3, 7, 453),
(3, 8, 178),
(3, 9, 258),
(4, 1, 198),
(4, 2, 126),
(4, 3, 429),
(4, 4, 90),
(4, 5, 51),
(4, 6, 56),
(4, 7, 99),
(4, 8, 100),
(4, 9, 80),
(5, 1, 50),
(5, 2, 100),
(5, 3, 30),
(5, 4, 100),
(5, 5, 104),
(5, 6, 106),
(5, 7, 103),
(5, 8, 56),
(5, 9, 188),
(6, 1, 53),
(6, 2, 386),
(6, 3, 54),
(6, 4, 69),
(6, 5, 100),
(6, 6, 268),
(6, 7, 54),
(6, 8, 29),
(6, 9, 199),
(7, 1, 55),
(7, 2, 39),
(7, 3, 35),
(7, 4, 69),
(7, 5, 257),
(7, 6, 50),
(7, 7, 100),
(7, 8, 20),
(7, 9, 10),
(8, 1, 50),
(8, 2, 100),
(8, 3, 50),
(8, 4, 100),
(8, 5, 70),
(8, 6, 100),
(8, 7, 50),
(8, 8, 150),
(8, 9, 10),
(9, 1, 50),
(9, 2, 100),
(9, 3, 40),
(9, 4, 50),
(9, 5, 78),
(9, 6, 109),
(9, 7, 55),
(9, 8, 59),
(9, 9, 89),
(10, 1, 50),
(10, 2, 159),
(10, 3, 378),
(10, 4, 5),
(10, 5, 7),
(10, 6, 2),
(10, 7, 10),
(10, 8, 5),
(10, 9, 6),
(11, 1, 20),
(11, 2, 100),
(11, 3, 5),
(11, 4, 10),
(11, 5, 2),
(11, 6, 10),
(11, 7, 5),
(11, 8, 10),
(11, 9, 2),
(12, 1, 10),
(12, 2, 2),
(12, 3, 4),
(12, 4, 10),
(12, 5, 10),
(12, 6, 5),
(12, 7, 10),
(12, 8, 2),
(12, 9, 100),
(13, 1, 50),
(13, 2, 2),
(13, 3, 5),
(13, 4, 10),
(13, 5, 7),
(13, 6, 10),
(13, 7, 5),
(13, 8, 10),
(13, 9, 2),
(14, 1, 5),
(14, 2, 3),
(14, 3, 4),
(14, 4, -5),
(14, 5, 7),
(14, 6, 2),
(14, 7, 5),
(14, 8, 5),
(14, 9, 6),
(15, 1, 20),
(15, 2, 10),
(15, 3, 3),
(15, 4, 5),
(15, 5, 2),
(15, 6, 5),
(15, 7, 5),
(15, 8, 2),
(15, 9, 1),
(16, 1, 5),
(16, 2, 100),
(16, 3, 3),
(16, 4, 5),
(16, 5, 3),
(16, 6, 5),
(16, 7, 5),
(16, 8, 5),
(16, 9, 16),
(17, 1, 20),
(17, 2, 10),
(17, 3, 15),
(17, 4, 6),
(17, 5, 7),
(17, 6, 10),
(17, 7, 10),
(17, 8, 10),
(17, 9, 8),
(18, 1, 5),
(18, 2, 167),
(18, 3, 5),
(18, 4, 86),
(18, 5, 3),
(18, 6, 10),
(18, 7, 10),
(18, 8, 5),
(18, 9, 10),
(19, 1, 5),
(19, 2, 3),
(19, 3, 5),
(19, 4, 10),
(19, 5, 2),
(19, 6, 10),
(19, 7, 10),
(19, 8, 5),
(19, 9, 6),
(20, 1, 10),
(20, 2, 3),
(20, 3, 5),
(20, 4, 6),
(20, 5, 10),
(20, 6, 5),
(20, 7, 5),
(20, 8, 5),
(20, 9, 6),
(21, 1, 5),
(21, 2, 3),
(21, 3, 3),
(21, 4, 5),
(21, 5, 10),
(21, 6, 5),
(21, 7, 1),
(21, 8, 2),
(21, 9, 1),
(22, 1, 4),
(22, 2, 1),
(22, 3, 80),
(22, 4, 5),
(22, 5, 8),
(22, 6, 5),
(22, 7, 5),
(22, 8, 5),
(22, 9, 6),
(23, 1, 5),
(23, 2, 1),
(23, 3, 3),
(23, 4, 5),
(23, 5, 2),
(23, 6, 5),
(23, 7, 5),
(23, 8, 5),
(23, 9, 6),
(24, 1, 10),
(24, 2, 2),
(24, 3, 4),
(24, 4, 5),
(24, 5, 7),
(24, 6, 2),
(24, 7, 5),
(24, 8, 1),
(24, 9, 8),
(25, 1, 5),
(25, 2, 1),
(25, 3, 3),
(25, 4, 6),
(25, 5, 10),
(25, 6, 5),
(25, 7, 5),
(25, 8, 1),
(25, 9, 1),
(26, 1, 20),
(26, 2, 3),
(26, 3, 5),
(26, 4, 10),
(26, 5, 10),
(26, 6, 10),
(26, 7, 10),
(26, 8, 1),
(26, 9, 6),
(27, 1, 10),
(27, 2, 10),
(27, 3, 5),
(27, 4, 6),
(27, 5, 10),
(27, 6, 5),
(27, 7, 1),
(27, 8, 15),
(27, 9, 6),
(28, 1, 5),
(28, 2, 3),
(28, 3, 3),
(28, 4, 6),
(28, 5, 10),
(28, 6, 5),
(28, 7, 10),
(28, 8, 1),
(28, 9, 8),
(29, 1, 5),
(29, 2, 3),
(29, 3, 5),
(29, 4, 10),
(29, 5, 2),
(29, 6, 5),
(29, 7, 5),
(29, 8, 2),
(29, 9, 8),
(30, 1, 10),
(30, 2, 3),
(30, 3, 5),
(30, 4, 10),
(30, 5, 2),
(30, 6, 10),
(30, 7, 5),
(30, 8, 10),
(30, 9, 1),
(31, 1, 10),
(31, 2, 1),
(31, 3, 3),
(31, 4, 10),
(31, 5, 2),
(31, 6, 10),
(31, 7, 5),
(31, 8, 2),
(31, 9, 6),
(32, 1, 5),
(32, 2, 1),
(32, 3, 5),
(32, 4, 5),
(32, 5, 2),
(32, 6, 5),
(32, 7, 10),
(32, 8, 5),
(32, 9, 1),
(33, 1, 10),
(33, 2, 3),
(33, 3, 5),
(33, 4, 5),
(33, 5, 7),
(33, 6, 10),
(33, 7, 10),
(33, 8, 5),
(33, 9, 6),
(34, 1, 5),
(34, 2, 3),
(34, 3, 3),
(34, 4, 10),
(34, 5, 10),
(34, 6, 10),
(34, 7, 5),
(34, 8, 2),
(34, 9, 8),
(35, 1, 50),
(35, 2, 2),
(35, 3, 5),
(35, 4, 10),
(35, 5, 7),
(35, 6, 5),
(35, 7, 1),
(35, 8, 10),
(35, 9, 8),
(36, 1, 20),
(36, 2, 10),
(36, 3, 15),
(36, 4, 5),
(36, 5, 7),
(36, 6, 10),
(36, 7, 1),
(36, 8, 15),
(36, 9, 8),
(37, 1, 50),
(37, 2, 10),
(37, 3, 3),
(37, 4, 5),
(37, 5, 10),
(37, 6, 5),
(37, 7, 10),
(37, 8, 5),
(37, 9, 2),
(38, 1, 20),
(38, 2, 10),
(38, 3, 15),
(38, 4, 6),
(38, 5, 7),
(38, 6, 10),
(38, 7, 5),
(38, 8, 15),
(38, 9, 1),
(39, 1, 10),
(39, 2, 10),
(39, 3, 15),
(39, 4, 10),
(39, 5, 7),
(39, 6, 5),
(39, 7, 10),
(39, 8, 15),
(39, 9, 8),
(40, 1, 20),
(40, 2, 10),
(40, 3, 5),
(40, 4, 10),
(40, 5, 7),
(40, 6, 10),
(40, 7, 5),
(40, 8, 1),
(40, 9, 2),
(41, 1, 10),
(41, 2, 3),
(41, 3, 3),
(41, 4, 10),
(41, 5, 7),
(41, 6, 10),
(41, 7, 5),
(41, 8, 2),
(41, 9, 8),
(42, 1, 10),
(42, 2, 1),
(42, 3, 4),
(42, 4, 10),
(42, 5, 7),
(42, 6, 10),
(42, 7, 5),
(42, 8, 2),
(42, 9, 1),
(43, 1, 5),
(43, 2, 1),
(43, 3, 3),
(43, 4, 5),
(43, 5, 7),
(43, 6, 10),
(43, 7, 10),
(43, 8, 5),
(43, 9, 6),
(44, 1, 10),
(44, 2, 3),
(44, 3, 5),
(44, 4, 6),
(44, 5, 10),
(44, 6, 10),
(44, 7, 5),
(44, 8, 5),
(44, 9, 1),
(45, 1, 50),
(45, 2, 10),
(45, 3, 15),
(45, 4, 10),
(45, 5, 7),
(45, 6, 10),
(45, 7, 10),
(45, 8, 10),
(45, 9, 8),
(46, 1, 10),
(46, 2, 10),
(46, 3, 15),
(46, 4, 10),
(46, 5, 10),
(46, 6, 10),
(46, 7, 10),
(46, 8, 10),
(46, 9, 1),
(47, 1, 10),
(47, 2, 1),
(47, 3, 4),
(47, 4, 6),
(47, 5, 7),
(47, 6, 10),
(47, 7, 10),
(47, 8, 5),
(47, 9, 8),
(48, 1, 5),
(48, 2, 2),
(48, 3, 5),
(48, 4, 10),
(48, 5, 7),
(48, 6, 2),
(48, 7, 10),
(48, 8, 10),
(48, 9, 1),
(49, 1, 5),
(49, 2, 3),
(49, 3, 5),
(49, 4, 5),
(49, 5, 10),
(49, 6, 2),
(49, 7, 10),
(49, 8, 2),
(49, 9, 8),
(50, 1, 5),
(50, 2, 3),
(50, 3, 3),
(50, 4, 10),
(50, 5, 2),
(50, 6, 5),
(50, 7, 10),
(50, 8, 10),
(50, 9, 6),
(51, 1, 50),
(51, 2, 3),
(51, 3, 5),
(51, 4, 10),
(51, 5, 10),
(51, 6, 10),
(51, 7, 10),
(51, 8, 10),
(51, 9, 8),
(52, 1, 5),
(52, 2, 2),
(52, 3, 3),
(52, 4, 6),
(52, 5, 10),
(52, 6, 2),
(52, 7, 1),
(52, 8, 10),
(52, 9, 6),
(53, 1, 10),
(53, 2, 2),
(53, 3, 5),
(53, 4, 10),
(53, 5, 2),
(53, 6, 10),
(53, 7, 1),
(53, 8, 2),
(53, 9, 6),
(54, 1, 10),
(54, 2, 3),
(54, 3, 5),
(54, 4, 10),
(54, 5, 2),
(54, 6, 5),
(54, 7, 10),
(54, 8, 5),
(54, 9, 6),
(55, 1, 5),
(55, 2, 3),
(55, 3, 5),
(55, 4, 10),
(55, 5, 7),
(55, 6, 5),
(55, 7, 10),
(55, 8, 2),
(55, 9, 8),
(56, 1, 5),
(56, 2, 1),
(56, 3, 3),
(56, 4, 10),
(56, 5, 2),
(56, 6, 10),
(56, 7, 10),
(56, 8, 2),
(56, 9, 6),
(57, 1, 10),
(57, 2, 3),
(57, 3, 5),
(57, 4, 5),
(57, 5, 10),
(57, 6, 5),
(57, 7, 10),
(57, 8, 2),
(57, 9, 1),
(58, 1, 5),
(58, 2, 1),
(58, 3, 3),
(58, 4, 10),
(58, 5, 7),
(58, 6, 10),
(58, 7, 5),
(58, 8, 5),
(58, 9, 8),
(59, 1, 20),
(59, 2, 10),
(59, 3, 15),
(59, 4, 10),
(59, 5, 8),
(59, 6, 10),
(59, 7, 10),
(59, 8, 15),
(59, 9, 1),
(60, 1, 20),
(60, 2, 10),
(60, 3, 3),
(60, 4, 10),
(60, 5, 7),
(60, 6, 10),
(60, 7, 5),
(60, 8, 10),
(60, 9, 2),
(61, 1, 20),
(61, 2, 3),
(61, 3, 5),
(61, 4, 10),
(61, 5, 7),
(61, 6, 5),
(61, 7, 10),
(61, 8, 5),
(61, 9, 8),
(62, 1, 5),
(62, 2, 3),
(62, 3, 5),
(62, 4, 5),
(62, 5, 10),
(62, 6, 10),
(62, 7, 10),
(62, 8, 2),
(62, 9, 1),
(63, 1, 5),
(63, 2, 3),
(63, 3, 15),
(63, 4, 5),
(63, 5, 2),
(63, 6, 10),
(63, 7, 5),
(63, 8, 1),
(63, 9, 2),
(27539, 6, 40);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(255) UNSIGNED NOT NULL,
  `img` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL DEFAULT 'img/user/defaultavata.jpg',
  `username` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `dob` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `sex` tinyint(1) NOT NULL,
  `address` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `phone_number` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `admin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `img`, `username`, `password`, `firstname`, `lastname`, `email`, `dob`, `sex`, `address`, `phone_number`, `admin`) VALUES
(1, 'img/user/defaultavata.jpg', 'admin', '12345', 'nhan', 'le', 'lenhan0029@gmail.com', '2019-04-10', 0, 'tp hcm', '0123456789', 1),
(2, 'img/user/defaultavata.jpg', 'nhichap', '12345', 'Nhi', 'Nguyễn', 'nhichap123@gmail.com', '2019-04-25', 0, 'tp hcm', '0123456789', 1),
(4, 'img/user/defaultavata.jpg', 'kimphu', '12345', 'phú', 'Trần', 'trankimphu@yahoo.com', '2019-05-16', 1, '', '', 1),
(5, 'img/user/defaultavata.jpg', 'bakiet', '12345', 'Kiệt', 'Vũ', 'kietvu@yahoo.com', '0001-01-01', 1, '123', '123', 1),
(6, 'img/user/defaultavata.jpg', '1234', '1234', 'nhan', 'le minh', 'nhanleminh@yahoo.com', '2019-05-08', 1, '123', '123', 0),
(7, 'img/user/defaultavata.jpg', '123456789', '123456789', 'ok', 'ok', 'nhan83838@yahoo.com', '2019-05-30', 1, '123', '123', 0),
(8, 'img/user/defaultavata.jpg', 'helo', '123', 'hi', 'le minh', 'phukdkdk@yahoo.com', '2019-05-08', 1, '123', '012789', 0),
(9, 'img/user/defaultavata.jpg', 'nhiheo', '12345', 'nhi', 'chap', 'nhichap@gmail.com', '2001-02-01', 0, '123', '123456789', 0),
(10, 'img/user/defaultavata.jpg', 'Le Nhan', '123', 'Le', 'Nhan', 'lenhan0029@gmail.com', '2001-05-16', 1, '123', '123', 0),
(11, 'img/user/defaultavata.jpg', 'lenhan', '12345', 'Nhân', 'Lê', 'lenhan123@gmail.com', '2001-05-16', 1, '225 Trần Bình Trọng, Phường 4 quận 5 tp hcm', '0703242576', 0);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`idbr`);

--
-- Chỉ mục cho bảng `discounting`
--
ALTER TABLE `discounting`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `informationorder`
--
ALTER TABLE `informationorder`
  ADD PRIMARY KEY (`idPackage`,`idpr`,`idsize`),
  ADD KEY `idPackage` (`idPackage`,`idpr`,`idsize`),
  ADD KEY `idpr` (`idpr`),
  ADD KEY `idsize` (`idsize`);

--
-- Chỉ mục cho bảng `informationorder_discounting`
--
ALTER TABLE `informationorder_discounting`
  ADD PRIMARY KEY (`idOrder`,`idpr`,`idsize`),
  ADD KEY `idOrder` (`idOrder`,`idDiscounting`,`idpr`),
  ADD KEY `idDiscounting` (`idDiscounting`),
  ADD KEY `idsize` (`idsize`),
  ADD KEY `idpr` (`idpr`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUser` (`idUser`) USING BTREE;

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`idpr`),
  ADD KEY `idca` (`idbr`);

--
-- Chỉ mục cho bảng `products_discounting`
--
ALTER TABLE `products_discounting`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idProduct` (`idpr`),
  ADD KEY `idDiscounting` (`idDiscounting`);

--
-- Chỉ mục cho bảng `size`
--
ALTER TABLE `size`
  ADD PRIMARY KEY (`idsize`);

--
-- Chỉ mục cho bảng `sizeshoe`
--
ALTER TABLE `sizeshoe`
  ADD PRIMARY KEY (`idpr`,`idsize`),
  ADD KEY `idpr` (`idpr`,`idsize`),
  ADD KEY `idsize` (`idsize`),
  ADD KEY `idpr_2` (`idpr`,`idsize`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `brand`
--
ALTER TABLE `brand`
  MODIFY `idbr` int(255) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `discounting`
--
ALTER TABLE `discounting`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `informationorder`
--
ALTER TABLE `informationorder`
  MODIFY `idPackage` int(255) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `idpr` int(255) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27541;

--
-- AUTO_INCREMENT cho bảng `products_discounting`
--
ALTER TABLE `products_discounting`
  MODIFY `id` int(100) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT cho bảng `size`
--
ALTER TABLE `size`
  MODIFY `idsize` int(255) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `informationorder`
--
ALTER TABLE `informationorder`
  ADD CONSTRAINT `informationorder_ibfk_1` FOREIGN KEY (`idPackage`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `informationorder_ibfk_2` FOREIGN KEY (`idpr`) REFERENCES `product` (`idpr`),
  ADD CONSTRAINT `informationorder_ibfk_3` FOREIGN KEY (`idsize`) REFERENCES `size` (`idsize`);

--
-- Các ràng buộc cho bảng `informationorder_discounting`
--
ALTER TABLE `informationorder_discounting`
  ADD CONSTRAINT `informationorder_discounting_ibfk_1` FOREIGN KEY (`idOrder`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `informationorder_discounting_ibfk_2` FOREIGN KEY (`idDiscounting`) REFERENCES `discounting` (`id`),
  ADD CONSTRAINT `informationorder_discounting_ibfk_3` FOREIGN KEY (`idpr`) REFERENCES `sizeshoe` (`idpr`),
  ADD CONSTRAINT `informationorder_discounting_ibfk_4` FOREIGN KEY (`idsize`) REFERENCES `size` (`idsize`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`idbr`) REFERENCES `brand` (`idbr`);

--
-- Các ràng buộc cho bảng `products_discounting`
--
ALTER TABLE `products_discounting`
  ADD CONSTRAINT `products_discounting_ibfk_2` FOREIGN KEY (`idDiscounting`) REFERENCES `discounting` (`id`),
  ADD CONSTRAINT `products_discounting_ibfk_3` FOREIGN KEY (`idpr`) REFERENCES `product` (`idpr`);

--
-- Các ràng buộc cho bảng `sizeshoe`
--
ALTER TABLE `sizeshoe`
  ADD CONSTRAINT `sizeshoe_ibfk_1` FOREIGN KEY (`idsize`) REFERENCES `size` (`idsize`),
  ADD CONSTRAINT `sizeshoe_ibfk_2` FOREIGN KEY (`idpr`) REFERENCES `product` (`idpr`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
