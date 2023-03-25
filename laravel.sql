-- phpMyAdmin SQL Dump
-- version 5.3.0-dev+20221219.e5e070c814
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th3 25, 2023 lúc 09:22 AM
-- Phiên bản máy phục vụ: 10.4.24-MariaDB
-- Phiên bản PHP: 8.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `laravel`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `password`, `createdAt`, `updatedAt`) VALUES
(2, 'Vuong', 'admin@gmail.com', 'admin', '2023-03-24 14:36:25', '2023-03-24 14:36:25');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill`
--

CREATE TABLE `bill` (
  `id` int(11) NOT NULL,
  `client` varchar(255) NOT NULL,
  `diachi` varchar(255) NOT NULL,
  `Totalprice` int(10) NOT NULL,
  `item` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `bill`
--

INSERT INTO `bill` (`id`, `client`, `diachi`, `Totalprice`, `item`, `status`, `created_at`, `updated_at`) VALUES
(2, 'vuong', '111', 30000, 'undefinedSản phẩm: ,xe đạp,số lượng: ,3', 1, '2023-03-24 01:24:52.000000', '2023-03-23 18:27:40'),
(3, 'bạn thành', 'nhà bạn thành', 171514, 'undefinedSản phẩm: ,lam on,số lượng: ,1Sản phẩm: ,sads,số lượng: ,1Sản phẩm: ,thu them,số lượng: ,1', 1, '2023-03-25 14:50:44.000000', '2023-03-25 07:52:44'),
(4, 'asd', 'asd', 151515, 'undefinedSản phẩm: ,thu them,số lượng: ,1', 1, '2023-03-25 14:52:59.000000', '2023-03-25 07:53:03'),
(5, 'them thang thanh', 'nha thang thanh', 303030, 'undefinedSản phẩm: ,thu them,số lượng: ,2', 1, '2023-03-25 14:54:24.000000', '2023-03-25 07:56:07');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cat_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `cat_name`, `created_at`) VALUES
(5, 'xe đạp đua', '2023-03-23 09:19:40'),
(8, 'xe địa hình', '2023-03-23 09:55:26'),
(9, 'xe đạp điện', '2023-03-23 09:55:40'),
(10, 'xe leo núi', '2023-03-23 13:22:26'),
(11, 'xe đường phố', '2023-03-25 06:34:41'),
(12, 'xe đạp thường', '2023-03-25 06:34:56');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_product` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `qty` int(10) NOT NULL,
  `cartqty` int(10) NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cat_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `name_product`, `price`, `qty`, `cartqty`, `image`, `created_at`, `updated_at`, `cat_id`) VALUES
(27, 'xe địa hình', 10.00, 10, 0, 'image_1679731230390.jpg', NULL, NULL, 8),
(28, 'xe địa hình 2', 4555.00, 55, 0, 'image_1679731263634.jpg', NULL, NULL, 8),
(29, 'xe đạp thường', 5000.00, 20, 0, 'image_1679731280882.jpg', NULL, NULL, 12),
(30, 'xe leo núi', 1000.00, 10, 0, 'image_1679731313242.jpg', NULL, NULL, 10);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `name`, `address`, `phone`, `createdAt`, `updatedAt`) VALUES
(1, 'vuong@gmail.com', '$2a$10$xBuBHZo0BABbXaaDP8KN/OFj37z4HoNYYFm7jqY1Nba6JKARCZv.6', 'DangNguyenvuong', 'TayNinh', '0967752920', '2023-03-24 13:33:36', '2023-03-24 14:02:02'),
(2, 'vuong1@gmail.com', '$2a$10$5PMgMHrqLUQf4nMzreydE.hfxquhEE0dUKlnb8.Aid6kDarfQvlIe', 'DangNguyenvuong', 'TayNinh', '0967752920', '2023-03-24 15:25:48', '2023-03-24 15:25:48'),
(3, 'vuong2@gmail.com', '$2a$10$smDi4aSrHhQOd5OuFHrvy.lIiC5IsDoS3jQeiI3T2nnlMaZabA1vi', 'vuong2', 'tây ninh', '1222544', '2023-03-24 15:26:43', '2023-03-24 15:26:43'),
(4, 'vuong3@gmail.com', '$2a$10$moIYg7rP5R.N68js0bgYnOTmWo.Ufo4kjq/0ukw6vPIMVYOeGHMpC', 'vuong2', 'châu thành', '3123123', '2023-03-25 04:01:09', '2023-03-25 04:01:09'),
(5, 'vuong4@gmail.com', '$2a$10$4I9hl.aLf8f2DVa1lBBBRe3f28x/YeO0/JkeTnAN4Lj07h64kp4sS', 'vuong', 'Châu thành', '123456', '2023-03-25 04:02:01', '2023-03-25 04:02:01');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_email_unique` (`email`);

--
-- Chỉ mục cho bảng `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_cat_id_foreign` (`cat_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `bill`
--
ALTER TABLE `bill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_cat_id_foreign` FOREIGN KEY (`cat_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
