-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 20, 2026 at 07:11 AM
-- Server version: 8.0.45-0ubuntu0.22.04.1
-- PHP Version: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `frenly`
--

-- --------------------------------------------------------

--
-- Table structure for table `ActiveChat`
--

CREATE TABLE `ActiveChat` (
  `id` int NOT NULL,
  `userId` int NOT NULL,
  `chatId` int NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Admin`
--

CREATE TABLE `Admin` (
  `id` int NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `full_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `otp` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fcm_token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bankIdToggle` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Admin`
--

INSERT INTO `Admin` (`id`, `email`, `phone_no`, `full_name`, `password`, `otp`, `fcm_token`, `token`, `bankIdToggle`) VALUES
(1, 'frenly@yopmail.com', '12345678', 'Admin', '$2b$10$9gzasya9GY1qTCOpU3wA1.CbCVdSlJllI5k37WpUAcmKtxiuGRb9G', NULL, NULL, 'Uik7gYH_D4RhfNDGqO3YugrpNrk', 0);

-- --------------------------------------------------------

--
-- Table structure for table `Blog`
--

CREATE TABLE `Blog` (
  `id` int NOT NULL,
  `body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userId` int NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `numberOfLikes` int NOT NULL DEFAULT '0',
  `numberOfShares` int NOT NULL DEFAULT '0',
  `numberOfComments` int NOT NULL DEFAULT '0',
  `numberOfSaves` int NOT NULL DEFAULT '0',
  `fileKey` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Blog`
--

INSERT INTO `Blog` (`id`, `body`, `title`, `tags`, `city`, `image_url`, `country`, `userId`, `createdAt`, `updatedAt`, `numberOfLikes`, `numberOfShares`, `numberOfComments`, `numberOfSaves`, `fileKey`) VALUES
(2, 'Test Blog 1', 'Blog', NULL, NULL, 'https://frenly.s3.us-east-1.amazonaws.com/1779257214880_avtar.svg', NULL, 16, '2026-05-20 06:06:54.939', '2026-05-20 06:06:54.939', 1, 0, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `BlogComment`
--

CREATE TABLE `BlogComment` (
  `id` int NOT NULL,
  `content` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blogId` int NOT NULL,
  `createByUserId` int NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `numberOfLikes` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Category`
--

CREATE TABLE `Category` (
  `id` int NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `createByUserId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Category`
--

INSERT INTO `Category` (`id`, `name`, `createByUserId`) VALUES
(1, 'Test', 24),
(2, 'New', 22),
(5, 'My Save', 16);

-- --------------------------------------------------------

--
-- Table structure for table `Chat`
--

CREATE TABLE `Chat` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastMessageId` int DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Chat`
--

INSERT INTO `Chat` (`id`, `name`, `lastMessageId`, `createdAt`, `updatedAt`) VALUES
(1, 'One on one chat', 145, '2026-05-12 06:10:14.680', '2026-05-12 06:10:14.680'),
(2, 'One on one chat', NULL, '2026-05-14 13:25:08.186', '2026-05-14 13:25:08.186'),
(3, 'One on one chat', 144, '2026-05-14 18:23:07.332', '2026-05-14 18:23:07.332'),
(4, 'One on one chat', 178, '2026-05-14 18:23:07.338', '2026-05-14 18:23:07.338'),
(5, 'One on one chat', NULL, '2026-05-18 06:23:20.553', '2026-05-18 06:23:20.553'),
(6, 'One on one chat', NULL, '2026-05-18 07:20:58.979', '2026-05-18 07:20:58.979'),
(22, 'One on one chat', 227, '2026-05-19 06:05:15.966', '2026-05-19 06:05:15.966'),
(25, 'One on one chat', 177, '2026-05-19 09:58:24.169', '2026-05-19 09:58:24.169'),
(26, 'One on one chat', NULL, '2026-05-19 12:38:41.303', '2026-05-19 12:38:41.303'),
(27, 'One on one chat', NULL, '2026-05-19 12:38:41.304', '2026-05-19 12:38:41.304'),
(28, 'One on one chat', NULL, '2026-05-19 13:13:09.592', '2026-05-19 13:13:09.592'),
(29, 'One on one chat', NULL, '2026-05-19 13:13:09.603', '2026-05-19 13:13:09.603'),
(30, 'One on one chat', NULL, '2026-05-20 05:57:59.986', '2026-05-20 05:57:59.986'),
(31, 'One on one chat', 226, '2026-05-20 05:57:59.989', '2026-05-20 05:57:59.989'),
(32, 'One on one chat', 224, '2026-05-20 06:27:40.389', '2026-05-20 06:27:40.389');

-- --------------------------------------------------------

--
-- Table structure for table `ChatMessage`
--

CREATE TABLE `ChatMessage` (
  `id` int NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `senderId` int NOT NULL,
  `chatId` int NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `isLink` int NOT NULL DEFAULT '0',
  `isLinkId` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isUrl` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `seen` tinyint(1) NOT NULL DEFAULT '0',
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `attachmentType` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachmentUrl` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `durationSeconds` int DEFAULT NULL,
  `fileKey` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fileSize` int DEFAULT NULL,
  `mimeType` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumbnailUrl` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ChatMessage`
--

INSERT INTO `ChatMessage` (`id`, `content`, `senderId`, `chatId`, `createdAt`, `updatedAt`, `isLink`, `isLinkId`, `isUrl`, `seen`, `is_read`, `attachmentType`, `attachmentUrl`, `durationSeconds`, `fileKey`, `fileSize`, `mimeType`, `thumbnailUrl`) VALUES
(8, 'pijhtb', 16, 1, '2026-05-12 13:38:11.503', '2026-05-12 13:38:11.503', 0, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 'heyy', 16, 1, '2026-05-12 13:38:47.443', '2026-05-12 13:38:47.443', 0, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 'kanobhxhxh', 16, 1, '2026-05-12 13:39:00.584', '2026-05-12 13:39:00.584', 0, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 'Hello', 16, 1, '2026-05-12 13:40:03.545', '2026-05-12 13:40:03.545', 0, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 'heyy', 16, 1, '2026-05-12 13:40:21.112', '2026-05-12 13:40:21.112', 0, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 'atcyc', 17, 1, '2026-05-12 13:41:20.632', '2026-05-12 13:41:20.632', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 'jvuv', 16, 1, '2026-05-12 13:41:28.429', '2026-05-12 13:41:28.429', 0, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 'ucc', 17, 1, '2026-05-12 13:41:33.753', '2026-05-12 13:41:33.753', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 'Hello', 16, 1, '2026-05-12 13:41:39.629', '2026-05-12 13:41:39.629', 0, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, 'Cgxxh', 16, 1, '2026-05-12 13:42:04.182', '2026-05-12 13:42:04.182', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, 'hello', 17, 1, '2026-05-12 13:51:30.849', '2026-05-12 13:51:30.849', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 'heyy', 16, 1, '2026-05-12 13:51:35.677', '2026-05-12 13:51:35.677', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 'hdbdg', 17, 1, '2026-05-12 13:51:40.592', '2026-05-12 13:51:40.592', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, 'ucjcjvigig', 16, 1, '2026-05-12 13:51:43.748', '2026-05-12 13:51:43.748', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, 'ughvhv', 17, 1, '2026-05-12 13:51:47.032', '2026-05-12 13:51:47.032', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, 'cujjc', 16, 1, '2026-05-12 13:51:51.649', '2026-05-12 13:51:51.649', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, 'heyy', 16, 1, '2026-05-12 14:06:32.172', '2026-05-12 14:06:32.172', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, 'heyy', 17, 1, '2026-05-12 14:06:42.933', '2026-05-12 14:06:42.933', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(26, 'geyfyx', 17, 1, '2026-05-12 14:06:49.625', '2026-05-12 14:06:49.625', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(27, 'chhf', 16, 1, '2026-05-12 14:06:55.966', '2026-05-12 14:06:55.966', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(28, 'Heyy', 16, 1, '2026-05-13 06:25:11.253', '2026-05-13 06:25:11.253', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(29, 'heyy', 17, 1, '2026-05-13 06:25:55.629', '2026-05-13 06:25:55.629', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(30, 'Heyy', 16, 1, '2026-05-13 07:30:02.041', '2026-05-13 07:30:02.041', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(31, 'tbbt', 16, 1, '2026-05-13 12:22:04.876', '2026-05-13 12:22:04.876', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(32, 'file', 16, 1, '2026-05-13 13:10:00.113', '2026-05-13 13:10:00.113', 0, NULL, NULL, 0, 0, 'gif', 'https://frenly.s3.us-east-1.amazonaws.com/1778677799998_image_picker_2CD114AB-8012-4CA9-8D23-D983121632AE-1893-000000C1CEC835A1.gif', NULL, '1778677799998_image_picker_2CD114AB-8012-4CA9-8D23-D983121632AE-1893-000000C1CEC835A1.gif', 244957, 'image/gif', NULL),
(33, 'file', 16, 1, '2026-05-13 13:10:12.864', '2026-05-13 13:10:12.864', 0, NULL, NULL, 0, 0, 'image', 'https://frenly.s3.us-east-1.amazonaws.com/1778677812807_CAP_BD07082C-FA9D-46FA-BCEA-F10DDFB3D9CE.jpg', NULL, '1778677812807_CAP_BD07082C-FA9D-46FA-BCEA-F10DDFB3D9CE.jpg', 67199, 'image/jpeg', NULL),
(34, 'file', 16, 1, '2026-05-13 13:10:40.699', '2026-05-13 13:10:40.699', 0, NULL, NULL, 0, 0, 'gif', 'https://frenly.s3.us-east-1.amazonaws.com/1778677840536_1778677838214.gif', NULL, '1778677840536_1778677838214.gif', 1177071, 'image/gif', NULL),
(35, 'fffghd', 16, 1, '2026-05-13 13:11:24.526', '2026-05-13 13:11:24.526', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(36, 'heyy', 17, 1, '2026-05-13 13:11:48.229', '2026-05-13 13:11:48.229', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(37, 'yvuv', 17, 1, '2026-05-13 13:11:54.001', '2026-05-13 13:11:54.001', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(38, 'h ubu', 17, 1, '2026-05-13 13:12:14.259', '2026-05-13 13:12:14.259', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(39, 'h h j', 17, 1, '2026-05-13 13:13:13.389', '2026-05-13 13:13:13.389', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(40, 'gsgs', 17, 1, '2026-05-14 06:02:53.950', '2026-05-14 06:02:53.950', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(41, 'Hell', 16, 1, '2026-05-14 06:03:41.205', '2026-05-14 06:03:41.205', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(42, 'Hello', 17, 1, '2026-05-14 06:48:39.183', '2026-05-14 06:48:39.183', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(43, 'YEAH', 16, 1, '2026-05-14 06:51:47.269', '2026-05-14 06:51:47.269', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(44, 'Hello', 17, 1, '2026-05-14 06:52:31.509', '2026-05-14 06:52:31.509', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(45, 'Heyyyy', 16, 1, '2026-05-14 06:53:02.972', '2026-05-14 06:53:02.972', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(46, 'hello', 16, 1, '2026-05-14 06:53:22.952', '2026-05-14 06:53:22.952', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(47, 'Hello', 17, 1, '2026-05-14 08:18:06.312', '2026-05-14 08:18:06.312', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(48, 'jvjvj', 16, 1, '2026-05-14 08:18:45.900', '2026-05-14 08:18:45.900', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(49, 'cufuc', 17, 1, '2026-05-14 08:22:54.618', '2026-05-14 08:22:54.618', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(50, 'cjcifjfhfk', 16, 1, '2026-05-14 08:23:14.067', '2026-05-14 08:23:14.067', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(51, 'Hell', 16, 1, '2026-05-14 08:23:51.293', '2026-05-14 08:23:51.293', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(52, 'jffj', 17, 1, '2026-05-14 08:29:36.117', '2026-05-14 08:29:36.117', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(53, 'cuufuf', 16, 1, '2026-05-14 08:29:44.687', '2026-05-14 08:29:44.687', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(54, 'Heyyy', 16, 1, '2026-05-14 09:19:23.149', '2026-05-14 09:19:23.149', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(55, 'heyyy', 17, 1, '2026-05-14 09:19:37.870', '2026-05-14 09:19:37.870', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(56, 'Heyy', 17, 1, '2026-05-14 09:19:47.808', '2026-05-14 09:19:47.808', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(57, 'hcyyff', 17, 1, '2026-05-14 09:20:07.381', '2026-05-14 09:20:07.381', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(58, 'cyccyy', 16, 1, '2026-05-14 09:20:40.262', '2026-05-14 09:20:40.262', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(59, 'gdhs', 17, 1, '2026-05-14 09:21:36.090', '2026-05-14 09:21:36.090', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(60, 'Hello', 17, 1, '2026-05-14 09:22:15.585', '2026-05-14 09:22:15.585', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(61, 'Hello', 16, 1, '2026-05-14 09:22:30.037', '2026-05-14 09:22:30.037', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(62, 'Hello', 17, 1, '2026-05-14 09:24:02.159', '2026-05-14 09:24:02.159', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(63, 'hey', 16, 1, '2026-05-14 09:24:07.920', '2026-05-14 09:24:07.920', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(64, 'Heyy', 16, 1, '2026-05-14 09:24:33.527', '2026-05-14 09:24:33.527', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(65, 'ub', 17, 1, '2026-05-14 09:26:08.140', '2026-05-14 09:26:08.140', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(66, 'Heyy', 16, 1, '2026-05-14 09:33:06.556', '2026-05-14 09:33:06.556', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(67, 'Heyy', 17, 1, '2026-05-14 09:33:15.339', '2026-05-14 09:33:15.339', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(68, 'Hello', 17, 1, '2026-05-14 09:33:53.610', '2026-05-14 09:33:53.610', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(69, 'Heyy', 16, 1, '2026-05-14 10:43:06.689', '2026-05-14 10:43:06.689', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(70, 'hcuf', 17, 1, '2026-05-14 10:43:22.400', '2026-05-14 10:43:22.400', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(71, 'hchx', 17, 1, '2026-05-14 10:43:37.465', '2026-05-14 10:43:37.465', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(72, 'Heyy', 16, 1, '2026-05-14 10:43:57.090', '2026-05-14 10:43:57.090', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(73, 'hello', 16, 1, '2026-05-14 11:17:24.787', '2026-05-14 11:17:24.787', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(74, ',ugfuy', 16, 1, '2026-05-14 11:17:41.381', '2026-05-14 11:17:41.381', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(75, 'Heyy', 17, 1, '2026-05-14 11:17:59.319', '2026-05-14 11:17:59.319', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(76, 'heyy', 16, 1, '2026-05-14 11:19:41.503', '2026-05-14 11:19:41.503', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(77, 'hell', 16, 1, '2026-05-14 11:19:48.042', '2026-05-14 11:19:48.042', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(78, 'hell', 16, 1, '2026-05-14 11:20:09.940', '2026-05-14 11:20:09.940', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(79, 'hchcu', 17, 1, '2026-05-14 11:20:20.771', '2026-05-14 11:20:20.771', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(80, 'uvuv', 17, 1, '2026-05-14 11:20:43.324', '2026-05-14 11:20:43.324', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(81, 'hvcu', 17, 1, '2026-05-14 11:20:52.524', '2026-05-14 11:20:52.524', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(82, 'hdhs', 16, 1, '2026-05-14 11:21:23.558', '2026-05-14 11:21:23.558', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(83, 'ufydy', 17, 1, '2026-05-14 11:21:32.226', '2026-05-14 11:21:32.226', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(84, 'ufycy', 17, 1, '2026-05-14 11:22:28.959', '2026-05-14 11:22:28.959', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(85, 'ychcu', 17, 1, '2026-05-14 11:22:35.025', '2026-05-14 11:22:35.025', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(86, 'gccg', 17, 1, '2026-05-14 11:23:56.946', '2026-05-14 11:23:56.946', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(87, 'Hello', 17, 1, '2026-05-14 11:40:39.530', '2026-05-14 11:40:39.530', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(88, 'Hii', 16, 1, '2026-05-14 11:41:04.847', '2026-05-14 11:41:04.847', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(89, 'fhddu', 16, 1, '2026-05-14 11:41:12.676', '2026-05-14 11:41:12.676', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(90, 'Heyyy', 17, 1, '2026-05-14 11:43:29.177', '2026-05-14 11:43:29.177', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(91, 'hdugsvegs', 17, 1, '2026-05-14 11:43:43.256', '2026-05-14 11:43:43.256', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(92, 'heyy', 16, 1, '2026-05-14 11:44:23.728', '2026-05-14 11:44:23.728', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(93, 'Heyy', 17, 1, '2026-05-14 11:44:33.784', '2026-05-14 11:44:33.784', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(94, 'Heygdvdgru', 17, 1, '2026-05-14 11:45:38.304', '2026-05-14 11:45:38.304', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(95, 'jfjf', 16, 1, '2026-05-14 11:48:58.654', '2026-05-14 11:48:58.654', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(96, 'ufufufu', 17, 1, '2026-05-14 11:49:11.752', '2026-05-14 11:49:11.752', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(97, 'Kayfiyi', 16, 1, '2026-05-14 11:49:29.167', '2026-05-14 11:49:29.167', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(98, 'chfu', 16, 1, '2026-05-14 11:58:38.840', '2026-05-14 11:58:38.840', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(99, 'pritanshu k', 17, 1, '2026-05-14 12:03:19.521', '2026-05-14 12:03:19.521', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100, 'dh', 16, 1, '2026-05-14 12:03:38.567', '2026-05-14 12:03:38.567', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(101, 'hfhd', 16, 1, '2026-05-14 12:28:54.872', '2026-05-14 12:28:54.872', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(102, 'xhzh', 16, 1, '2026-05-14 12:49:12.452', '2026-05-14 12:49:12.452', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(103, 'bkbkvjvjcjvjvjvhchc', 17, 1, '2026-05-14 12:49:19.203', '2026-05-14 12:49:19.203', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(104, 'hcuxxu', 17, 1, '2026-05-14 12:49:24.188', '2026-05-14 12:49:24.188', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(105, 'jcjf', 16, 1, '2026-05-14 12:52:59.342', '2026-05-14 12:52:59.342', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(106, 'duyufu', 16, 1, '2026-05-14 12:53:07.233', '2026-05-14 12:53:07.233', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(107, 'chchcb', 17, 1, '2026-05-14 12:53:22.581', '2026-05-14 12:53:22.581', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(108, 'VC VC', 17, 1, '2026-05-14 12:53:48.826', '2026-05-14 12:53:48.826', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(109, 'ufufuf', 17, 1, '2026-05-14 12:54:01.431', '2026-05-14 12:54:01.431', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(110, 'ycuxuf', 16, 1, '2026-05-14 12:54:55.595', '2026-05-14 12:54:55.595', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(111, 'cycycuc', 16, 1, '2026-05-14 12:55:10.585', '2026-05-14 12:55:10.585', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(112, 'ufudh', 16, 1, '2026-05-14 12:55:19.848', '2026-05-14 12:55:19.848', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(113, 'vjfjfj', 16, 1, '2026-05-14 13:01:11.499', '2026-05-14 13:01:11.499', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(114, 'cucug', 16, 1, '2026-05-14 13:04:37.982', '2026-05-14 13:04:37.982', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(115, 'vuucchg h', 17, 1, '2026-05-14 13:05:13.339', '2026-05-14 13:05:13.339', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(116, 'bobi m', 17, 1, '2026-05-14 13:05:28.721', '2026-05-14 13:05:28.721', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(117, 'uvucu', 16, 1, '2026-05-14 13:05:37.098', '2026-05-14 13:05:37.098', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(118, 'ycycu', 16, 1, '2026-05-14 13:06:07.638', '2026-05-14 13:06:07.638', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(119, 'ivivib', 17, 1, '2026-05-14 13:06:27.317', '2026-05-14 13:06:27.317', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(120, 'uvuv', 17, 1, '2026-05-14 13:06:42.153', '2026-05-14 13:06:42.153', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(121, 'uvuvuv', 17, 1, '2026-05-14 13:07:00.580', '2026-05-14 13:07:00.580', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(122, 'jcjv', 17, 1, '2026-05-14 13:10:37.359', '2026-05-14 13:10:37.359', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(123, 'xhhdh', 16, 1, '2026-05-14 13:10:46.767', '2026-05-14 13:10:46.767', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(135, 'tja', 1, 3, '2026-05-14 18:23:11.911', '2026-05-14 18:23:11.911', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(136, '..', 1, 3, '2026-05-14 18:25:52.173', '2026-05-14 18:25:52.173', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(137, 'tar 100 år att ladda upp en bild någon ny bottleneck', 1, 3, '2026-05-14 18:25:58.695', '2026-05-14 18:25:58.695', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(138, 'file', 1, 3, '2026-05-14 18:26:56.892', '2026-05-14 18:26:56.892', 0, NULL, NULL, 0, 0, 'image', 'https://frenly.s3.us-east-1.amazonaws.com/1778783216743_1000015566.jpg', NULL, '1778783216743_1000015566.jpg', 3390544, 'image/jpeg', NULL),
(139, 'file', 1, 3, '2026-05-14 18:29:11.493', '2026-05-14 18:29:11.493', 0, NULL, NULL, 0, 0, 'image', 'https://frenly.s3.us-east-1.amazonaws.com/1778783351311_1000015564.jpg', NULL, '1778783351311_1000015564.jpg', 4611849, 'image/jpeg', NULL),
(140, 'file', 1, 3, '2026-05-14 18:31:37.481', '2026-05-14 18:31:37.481', 0, NULL, NULL, 0, 0, 'image', 'https://frenly.s3.us-east-1.amazonaws.com/1778783497236_1000015557.jpg', NULL, '1778783497236_1000015557.jpg', 4246675, 'image/jpeg', NULL),
(141, 'file', 1, 3, '2026-05-14 18:35:35.022', '2026-05-14 18:35:35.022', 0, NULL, NULL, 0, 0, 'image', 'https://frenly.s3.us-east-1.amazonaws.com/1778783734907_1000015551.jpg', NULL, '1778783734907_1000015551.jpg', 1058728, 'image/jpeg', NULL),
(142, 'funkar', 15, 3, '2026-05-15 17:25:11.314', '2026-05-15 17:25:11.314', 0, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(143, 'file', 15, 3, '2026-05-15 17:25:35.467', '2026-05-15 17:25:35.467', 0, NULL, NULL, 1, 1, 'image', 'https://frenly.s3.us-east-1.amazonaws.com/1778865935411_CAP_C5B4D1FA-5763-4275-ACD8-EB0B52B8CEC7.jpg', NULL, '1778865935411_CAP_C5B4D1FA-5763-4275-ACD8-EB0B52B8CEC7.jpg', 103280, 'image/jpeg', NULL),
(144, 'file', 1, 3, '2026-05-17 19:05:48.360', '2026-05-17 19:05:48.360', 0, NULL, NULL, 0, 0, 'image', 'https://frenly.s3.us-east-1.amazonaws.com/1779044748188_1000015638.jpg', NULL, '1779044748188_1000015638.jpg', 2802079, 'image/jpeg', NULL),
(145, 'Heyy', 16, 1, '2026-05-18 09:54:44.591', '2026-05-18 09:54:44.591', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(174, 'hii', 23, 25, '2026-05-19 09:58:30.580', '2026-05-19 09:58:30.580', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(175, 'Heyy', 22, 25, '2026-05-19 10:21:23.280', '2026-05-19 10:21:23.280', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(176, 'Hello', 22, 25, '2026-05-19 10:21:52.531', '2026-05-19 10:21:52.531', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(177, 'Helloww', 22, 25, '2026-05-19 10:22:15.076', '2026-05-19 10:22:15.076', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(178, 'tja', 1, 4, '2026-05-19 12:42:34.968', '2026-05-19 12:42:34.968', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(179, 'Hiii', 24, 22, '2026-05-19 13:01:47.318', '2026-05-19 13:01:47.318', 0, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(180, 'hello', 24, 22, '2026-05-19 13:15:55.887', '2026-05-19 13:15:55.887', 0, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(181, 'file', 24, 22, '2026-05-19 13:16:01.014', '2026-05-19 13:16:01.014', 0, NULL, NULL, 1, 1, 'audio', 'https://frenly.s3.us-east-1.amazonaws.com/1779196560927_audio_1779196551789.m4a', 5, '1779196560927_audio_1779196551789.m4a', 146345, 'audio/mp4', NULL),
(182, 'file', 24, 22, '2026-05-19 13:16:31.387', '2026-05-19 13:16:31.387', 0, NULL, NULL, 1, 1, 'image', 'https://frenly.s3.us-east-1.amazonaws.com/1779196591302_image_picker_518FB6B5-CC64-4E75-B4A6-C1196E8CB2A4-13885-000003B588F37781.png', NULL, '1779196591302_image_picker_518FB6B5-CC64-4E75-B4A6-C1196E8CB2A4-13885-000003B588F37781.png', 344114, 'image/png', NULL),
(183, 'file', 24, 22, '2026-05-19 13:16:45.914', '2026-05-19 13:16:45.914', 0, NULL, NULL, 1, 1, 'video', 'https://frenly.s3.us-east-1.amazonaws.com/1779196605742_image_picker_4A9F51BA-BD45-430F-8948-18644F00C5C7-13885-000003B5952DE514IMG_2460E91B4DCC-4F78-4F77-9620-BD09A30C2D37.mp4', NULL, '1779196605742_image_picker_4A9F51BA-BD45-430F-8948-18644F00C5C7-13885-000003B5952DE514IMG_2460E91B4DCC-4F78-4F77-9620-BD09A30C2D37.mp4', 1186881, 'video/mp4', NULL),
(184, 'file', 24, 22, '2026-05-19 13:16:52.143', '2026-05-19 13:16:52.143', 0, NULL, NULL, 1, 1, 'gif', 'https://frenly.s3.us-east-1.amazonaws.com/1779196612065_1779196610021.gif', NULL, '1779196612065_1779196610021.gif', 162279, 'image/gif', NULL),
(185, 'file', 24, 22, '2026-05-19 13:17:12.044', '2026-05-19 13:17:12.044', 0, NULL, NULL, 1, 1, 'image', 'https://frenly.s3.us-east-1.amazonaws.com/1779196631956_CAP_E9D20AB3-B817-4C4F-918F-F57D29736B55.jpg', NULL, '1779196631956_CAP_E9D20AB3-B817-4C4F-918F-F57D29736B55.jpg', 92977, 'image/jpeg', NULL),
(186, 'file', 24, 22, '2026-05-19 13:17:32.808', '2026-05-19 13:17:32.808', 0, NULL, NULL, 1, 1, 'image', 'https://frenly.s3.us-east-1.amazonaws.com/1779196652745_CAP_86FCE9AF-83D9-42B1-A9AC-A5CE2160A616.jpg', NULL, '1779196652745_CAP_86FCE9AF-83D9-42B1-A9AC-A5CE2160A616.jpg', 69609, 'image/jpeg', NULL),
(187, '😃😃😃😃😃😃😃😃😃😃😃😃😃😃😃😃😃😃😃😃😃😃😃😃😃😃😃😃😃😃😃😃😃😃😃☯️☯️☯️☯️☯️☯️😃😃😃♌️😆☯️🌴🌴♌️♌️☯️♌️', 24, 22, '2026-05-19 13:17:53.905', '2026-05-19 13:17:53.905', 0, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(188, 'Delat inlägg av vwaagaard', 24, 22, '2026-05-19 13:20:28.940', '2026-05-19 13:20:28.940', 1, '1', 'https://frenly.s3.us-east-1.amazonaws.com/1778422396109_image_cropper_1778422363041.jpg', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(189, 'Delat inlägg av Charls11', 24, 22, '2026-05-19 13:22:54.088', '2026-05-19 13:22:54.088', 1, '2', 'https://frenly.s3.us-east-1.amazonaws.com/1778758939158_image_cropper_5D4FA650-3884-4206-A306-EEC7368D5580-3587-0000016244E8F1F8.jpg', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(190, 'Delat inlägg av Charls11', 24, 22, '2026-05-19 13:23:19.399', '2026-05-19 13:23:19.399', 1, '2', 'https://frenly.s3.us-east-1.amazonaws.com/1778758939158_image_cropper_5D4FA650-3884-4206-A306-EEC7368D5580-3587-0000016244E8F1F8.jpg', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(191, 'hellooi', 22, 22, '2026-05-19 13:23:53.260', '2026-05-19 13:23:53.260', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(192, 'file', 22, 22, '2026-05-19 13:24:32.978', '2026-05-19 13:24:32.978', 0, NULL, NULL, 0, 0, 'image', 'https://frenly.s3.us-east-1.amazonaws.com/1779197072914_CAP1550609158336776592.jpg', NULL, '1779197072914_CAP1550609158336776592.jpg', 125598, 'image/jpeg', NULL),
(193, 'file', 24, 22, '2026-05-19 13:24:44.266', '2026-05-19 13:24:44.266', 0, NULL, NULL, 1, 1, 'image', 'https://frenly.s3.us-east-1.amazonaws.com/1779197084131_CAP_53D9D5A0-B636-456C-8523-373142C16D11.jpg', NULL, '1779197084131_CAP_53D9D5A0-B636-456C-8523-373142C16D11.jpg', 71980, 'image/jpeg', NULL),
(194, 'file', 24, 22, '2026-05-19 13:25:19.208', '2026-05-19 13:25:19.208', 0, NULL, NULL, 1, 1, 'audio', 'https://frenly.s3.us-east-1.amazonaws.com/1779197119141_audio_1779197116155.m4a', 0, '1779197119141_audio_1779197116155.m4a', 67964, 'audio/mp4', NULL),
(195, 'file', 24, 22, '2026-05-19 13:25:19.780', '2026-05-19 13:25:19.780', 0, NULL, NULL, 1, 1, 'audio', 'https://frenly.s3.us-east-1.amazonaws.com/1779197119700_audio_1779197103822.m4a', 10, '1779197119700_audio_1779197103822.m4a', 219638, 'audio/mp4', NULL),
(196, 'file', 24, 22, '2026-05-19 13:25:21.398', '2026-05-19 13:25:21.398', 0, NULL, NULL, 1, 1, 'gif', 'https://frenly.s3.us-east-1.amazonaws.com/1779197121275_1779197097963.gif', NULL, '1779197121275_1779197097963.gif', 5313719, 'image/gif', NULL),
(197, 'dhgx to', 22, 22, '2026-05-19 13:25:48.448', '2026-05-19 13:25:48.448', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(198, 'hdhd', 22, 22, '2026-05-19 13:25:51.164', '2026-05-19 13:25:51.164', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(199, 'k kbobovig', 24, 22, '2026-05-19 13:26:28.081', '2026-05-19 13:26:28.081', 0, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(200, 'kvjvcicici', 24, 22, '2026-05-19 13:26:31.789', '2026-05-19 13:26:31.789', 0, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(201, '😇☺️🛐🖤🖤🥰', 24, 22, '2026-05-19 13:26:46.317', '2026-05-19 13:26:46.317', 0, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(202, 'hii', 22, 31, '2026-05-20 05:58:08.541', '2026-05-20 05:58:08.541', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(203, 'Hiiii', 16, 31, '2026-05-20 05:58:17.832', '2026-05-20 05:58:17.832', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(204, 'file', 16, 31, '2026-05-20 05:58:27.867', '2026-05-20 05:58:27.867', 0, NULL, NULL, 0, 0, 'gif', 'https://frenly.s3.us-east-1.amazonaws.com/1779256707771_1779256705303.gif', NULL, '1779256707771_1779256705303.gif', 162279, 'image/gif', NULL),
(205, 'file', 22, 31, '2026-05-20 05:58:28.954', '2026-05-20 05:58:28.954', 0, NULL, NULL, 0, 0, 'audio', 'https://frenly.s3.us-east-1.amazonaws.com/1779256708916_audio_1779256700702.m4a', 5, '1779256708916_audio_1779256700702.m4a', 90224, 'audio/mp4', NULL),
(206, 'file', 22, 31, '2026-05-20 05:58:52.024', '2026-05-20 05:58:52.024', 0, NULL, NULL, 0, 0, 'image', 'https://frenly.s3.us-east-1.amazonaws.com/1779256731954_1000019256.jpg', NULL, '1779256731954_1000019256.jpg', 344459, 'image/jpeg', NULL),
(207, 'file', 16, 31, '2026-05-20 05:58:52.435', '2026-05-20 05:58:52.435', 0, NULL, NULL, 0, 0, 'video', 'https://frenly.s3.us-east-1.amazonaws.com/1779256732303_VID_2026-05-20%2011-28-40794341747.mp4', NULL, '1779256732303_VID_2026-05-20 11-28-40794341747.mp4', 3719889, 'video/mp4', NULL),
(208, 'file', 16, 31, '2026-05-20 05:59:05.902', '2026-05-20 05:59:05.902', 0, NULL, NULL, 0, 0, 'image', 'https://frenly.s3.us-east-1.amazonaws.com/1779256745841_1000001780.jpg', NULL, '1779256745841_1000001780.jpg', 98926, 'image/jpeg', NULL),
(209, 'file', 16, 31, '2026-05-20 05:59:17.961', '2026-05-20 05:59:17.961', 0, NULL, NULL, 0, 0, 'audio', 'https://frenly.s3.us-east-1.amazonaws.com/1779256757890_audio_1779256748057.m4a', 6, '1779256757890_audio_1779256748057.m4a', 83480, 'audio/mp4', NULL),
(210, 'file', 22, 31, '2026-05-20 05:59:27.522', '2026-05-20 05:59:27.522', 0, NULL, NULL, 0, 0, 'gif', 'https://frenly.s3.us-east-1.amazonaws.com/1779256767450_1779256764941.gif', NULL, '1779256767450_1779256764941.gif', 374551, 'image/gif', NULL),
(211, 'dhdhshd', 16, 31, '2026-05-20 05:59:28.824', '2026-05-20 05:59:28.824', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(212, 'hdbsbd', 16, 31, '2026-05-20 05:59:35.575', '2026-05-20 05:59:35.575', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(213, 'hdbd', 16, 31, '2026-05-20 05:59:37.214', '2026-05-20 05:59:37.214', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(214, 'bdbbs', 16, 31, '2026-05-20 05:59:39.586', '2026-05-20 05:59:39.586', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(215, 'rhbdhsh', 16, 31, '2026-05-20 05:59:42.552', '2026-05-20 05:59:42.552', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(216, 'fhdbs', 16, 31, '2026-05-20 05:59:47.314', '2026-05-20 05:59:47.314', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(217, 'hsbaba', 16, 31, '2026-05-20 05:59:49.390', '2026-05-20 05:59:49.390', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(218, 'hdhhd', 22, 31, '2026-05-20 05:59:49.459', '2026-05-20 05:59:49.459', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(219, 'Heyy', 24, 22, '2026-05-20 06:24:25.158', '2026-05-20 06:24:25.158', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(220, 'ehsgsh', 16, 32, '2026-05-20 06:27:56.874', '2026-05-20 06:27:56.874', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(221, 'file', 16, 32, '2026-05-20 06:27:58.110', '2026-05-20 06:27:58.110', 0, NULL, NULL, 0, 0, 'audio', 'https://frenly.s3.us-east-1.amazonaws.com/1779258478047_audio_1779258472566.m4a', 2, '1779258478047_audio_1779258472566.m4a', 38061, 'audio/mp4', NULL),
(222, 'hcjdufi', 24, 32, '2026-05-20 06:31:01.325', '2026-05-20 06:31:01.325', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(223, 'Heyy', 22, 31, '2026-05-20 06:31:32.619', '2026-05-20 06:31:32.619', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(224, 'hdhdbd', 16, 32, '2026-05-20 06:31:50.406', '2026-05-20 06:31:50.406', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(225, 'hehdhs', 16, 31, '2026-05-20 06:32:04.162', '2026-05-20 06:32:04.162', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(226, 'Heyy', 22, 31, '2026-05-20 06:32:20.756', '2026-05-20 06:32:20.756', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(227, 'Skicka en vlogg av Will007', 24, 22, '2026-05-20 07:10:15.288', '2026-05-20 07:10:15.288', 3, '1', 'https://frenly.s3.us-east-1.amazonaws.com/1779256905043_VID_2026-05-20%2011-31-32-1088935205.mp4', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `CommentPost`
--

CREATE TABLE `CommentPost` (
  `id` int NOT NULL,
  `content` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postId` int NOT NULL,
  `createByUserId` int NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `numberOfLikes` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `CommentPost`
--

INSERT INTO `CommentPost` (`id`, `content`, `postId`, `createByUserId`, `createdAt`, `updatedAt`, `numberOfLikes`) VALUES
(1, 'riktigt fult', 1, 15, '2026-05-11 18:41:36.697', '2026-05-11 18:41:36.697', 0),
(4, 'Nice 👍', 3, 22, '2026-05-20 06:00:52.004', '2026-05-20 06:00:52.004', 0),
(5, 'sbhsv', 4, 22, '2026-05-20 06:15:31.959', '2026-05-20 06:15:31.959', 0);

-- --------------------------------------------------------

--
-- Table structure for table `CommentVlog`
--

CREATE TABLE `CommentVlog` (
  `id` int NOT NULL,
  `content` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vlogId` int NOT NULL,
  `createByUserId` int NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `numberOfLikes` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `CommentVlog`
--

INSERT INTO `CommentVlog` (`id`, `content`, `vlogId`, `createByUserId`, `createdAt`, `updatedAt`, `numberOfLikes`) VALUES
(1, 'nice', 1, 24, '2026-05-20 07:10:35.157', '2026-05-20 07:10:35.157', 0),
(2, 'h', 1, 24, '2026-05-20 07:10:52.040', '2026-05-20 07:10:52.040', 0);

-- --------------------------------------------------------

--
-- Table structure for table `Follow`
--

CREATE TABLE `Follow` (
  `id` int NOT NULL,
  `followerId` int NOT NULL,
  `followingId` int NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `status` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Follow`
--

INSERT INTO `Follow` (`id`, `followerId`, `followingId`, `createdAt`, `updatedAt`, `status`) VALUES
(1, 2, 1, '2026-04-30 21:48:53.216', '2026-04-30 21:48:53.216', 1),
(2, 1, 2, '2026-05-10 14:09:57.560', '2026-05-10 14:09:57.560', 1),
(3, 15, 1, '2026-05-11 18:41:55.103', '2026-05-11 18:41:55.103', 1),
(4, 1, 15, '2026-05-11 18:44:35.559', '2026-05-11 18:44:35.559', 1),
(7, 17, 16, '2026-05-12 11:04:44.105', '2026-05-12 11:04:44.105', 1),
(8, 16, 17, '2026-05-12 11:04:48.797', '2026-05-12 11:04:48.797', 1),
(21, 21, 16, '2026-05-18 11:29:11.073', '2026-05-18 11:29:11.073', 1),
(22, 16, 21, '2026-05-18 11:29:19.178', '2026-05-18 11:29:19.178', 1),
(23, 23, 22, '2026-05-18 12:07:22.053', '2026-05-18 12:07:22.053', 1),
(24, 22, 23, '2026-05-18 12:07:34.742', '2026-05-18 12:07:34.742', 1),
(25, 24, 22, '2026-05-19 06:03:36.494', '2026-05-19 06:03:36.494', 1),
(26, 22, 24, '2026-05-19 06:03:43.454', '2026-05-19 06:03:43.454', 1),
(28, 24, 24, '2026-05-19 13:14:49.544', '2026-05-19 13:14:49.544', 1),
(30, 24, 17, '2026-05-19 13:23:08.429', '2026-05-19 13:23:08.429', 1),
(31, 16, 22, '2026-05-20 05:57:43.083', '2026-05-20 05:57:43.083', 1),
(32, 22, 16, '2026-05-20 05:57:48.196', '2026-05-20 05:57:48.196', 1),
(38, 16, 24, '2026-05-20 06:34:35.615', '2026-05-20 06:34:35.615', 1),
(39, 24, 16, '2026-05-20 06:54:29.182', '2026-05-20 06:54:29.182', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Notification`
--

CREATE TABLE `Notification` (
  `id` int NOT NULL,
  `byUserId` int DEFAULT NULL,
  `toUserId` int NOT NULL,
  `isRead` tinyint(1) NOT NULL DEFAULT '0',
  `content` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` json DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `followStatus` int NOT NULL DEFAULT '0',
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `byAdminId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Notification`
--

INSERT INTO `Notification` (`id`, `byUserId`, `toUserId`, `isRead`, `content`, `data`, `createdAt`, `updatedAt`, `followStatus`, `type`, `byAdminId`) VALUES
(1, 2, 1, 0, 'André Lickhammer is now following you', '{}', '2026-04-30 21:48:53.237', '2026-04-30 21:48:53.237', 0, 'followAccept', NULL),
(2, 1, 2, 0, 'Viktor waagaard is now following you', '{}', '2026-05-10 14:09:57.591', '2026-05-10 14:09:57.591', 0, 'followAccept', NULL),
(3, 15, 1, 0, 'Andreas Sundström Edland liked  your post', '{\"id\": 1, \"image_url\": \"https://frenly.s3.us-east-1.amazonaws.com/1778422396109_image_cropper_1778422363041.jpg\"}', '2026-05-11 18:41:17.869', '2026-05-11 18:41:17.869', 0, 'post', NULL),
(4, 15, 1, 0, 'Andreas Sundström Edland commented on your post', '{\"id\": 1, \"image_url\": \"https://frenly.s3.us-east-1.amazonaws.com/1778422396109_image_cropper_1778422363041.jpg\"}', '2026-05-11 18:41:36.714', '2026-05-11 18:41:36.714', 0, 'post', NULL),
(5, 15, 1, 0, 'Andreas Sundström Edland is now following you', '{}', '2026-05-11 18:41:55.132', '2026-05-11 18:41:55.132', 0, 'followAccept', NULL),
(6, 1, 15, 0, 'Viktor waagaard is now following you', '{}', '2026-05-11 18:44:35.593', '2026-05-11 18:44:35.593', 0, 'followAccept', NULL),
(12, 17, 16, 0, 'Charls Xavier is now following you', '{}', '2026-05-12 11:04:44.134', '2026-05-12 11:04:44.134', 0, 'followAccept', NULL),
(13, 16, 17, 0, 'Will Smith is now following you', '{}', '2026-05-12 11:04:48.831', '2026-05-12 11:04:48.831', 0, 'followAccept', NULL),
(15, 16, 17, 0, 'Will Smith sent you a message', '{\"chatId\": 1}', '2026-05-12 13:38:11.525', '2026-05-12 13:38:11.525', 0, NULL, NULL),
(16, 16, 17, 0, 'Will Smith sent you a message', '{\"chatId\": 1}', '2026-05-12 13:38:47.462', '2026-05-12 13:38:47.462', 0, NULL, NULL),
(17, 16, 17, 0, 'Will Smith sent you a message', '{\"chatId\": 1}', '2026-05-12 13:39:00.598', '2026-05-12 13:39:00.598', 0, NULL, NULL),
(18, 16, 17, 0, 'Will Smith sent you a message', '{\"chatId\": 1}', '2026-05-12 13:40:03.567', '2026-05-12 13:40:03.567', 0, NULL, NULL),
(19, 16, 17, 0, 'Will Smith sent you a message', '{\"chatId\": 1}', '2026-05-12 13:40:21.131', '2026-05-12 13:40:21.131', 0, NULL, NULL),
(20, 17, 16, 0, 'Charls Xavier sent you a message', '{\"chatId\": 1}', '2026-05-12 13:41:20.650', '2026-05-12 13:41:20.650', 0, NULL, NULL),
(21, 17, 16, 0, 'Charls Xavier sent you a message', '{\"chatId\": 1}', '2026-05-12 13:41:33.771', '2026-05-12 13:41:33.771', 0, NULL, NULL),
(22, 16, 17, 0, 'Will Smith sent you a message', '{\"chatId\": 1}', '2026-05-12 13:42:04.195', '2026-05-12 13:42:04.195', 0, NULL, NULL),
(23, 17, 16, 0, 'Charls Xavier sent you a message', '{\"chatId\": 1}', '2026-05-12 13:51:30.868', '2026-05-12 13:51:30.868', 0, NULL, NULL),
(24, 16, 17, 0, 'Will Smith sent you a message', '{\"chatId\": 1}', '2026-05-12 13:51:35.692', '2026-05-12 13:51:35.692', 0, NULL, NULL),
(25, 17, 16, 0, 'Charls Xavier sent you a message', '{\"chatId\": 1}', '2026-05-12 13:51:40.609', '2026-05-12 13:51:40.609', 0, NULL, NULL),
(26, 16, 17, 0, 'Will Smith sent you a message', '{\"chatId\": 1}', '2026-05-12 13:51:43.764', '2026-05-12 13:51:43.764', 0, NULL, NULL),
(27, 17, 16, 0, 'Charls Xavier sent you a message', '{\"chatId\": 1}', '2026-05-12 13:51:47.048', '2026-05-12 13:51:47.048', 0, NULL, NULL),
(28, 16, 17, 0, 'Will Smith sent you a message', '{\"chatId\": 1}', '2026-05-12 13:51:51.671', '2026-05-12 13:51:51.671', 0, NULL, NULL),
(29, 16, 17, 0, 'Will Smith sent you a message', '{\"chatId\": 1}', '2026-05-12 14:06:32.187', '2026-05-12 14:06:32.187', 0, NULL, NULL),
(30, 17, 16, 0, 'Charls Xavier sent you a message', '{\"chatId\": 1}', '2026-05-12 14:06:42.951', '2026-05-12 14:06:42.951', 0, NULL, NULL),
(31, 17, 16, 0, 'Charls Xavier sent you a message', '{\"chatId\": 1}', '2026-05-12 14:06:49.638', '2026-05-12 14:06:49.638', 0, NULL, NULL),
(32, 16, 17, 0, 'Will Smith sent you a message', '{\"chatId\": 1}', '2026-05-12 14:06:55.979', '2026-05-12 14:06:55.979', 0, NULL, NULL),
(34, 16, 17, 0, 'Will Smith sent you a message', '{\"chatId\": 1}', '2026-05-13 06:25:11.269', '2026-05-13 06:25:11.269', 0, NULL, NULL),
(35, 17, 16, 0, 'Charls Xavier sent you a message', '{\"chatId\": 1}', '2026-05-13 06:25:55.643', '2026-05-13 06:25:55.643', 0, NULL, NULL),
(36, 16, 17, 0, 'Will Smith sent you a message', '{\"chatId\": 1}', '2026-05-13 07:30:02.059', '2026-05-13 07:30:02.059', 0, NULL, NULL),
(37, 16, 17, 0, 'Will Smith sent you a message', '{\"chatId\": 1}', '2026-05-13 12:22:04.890', '2026-05-13 12:22:04.890', 0, NULL, NULL),
(38, 16, 17, 0, 'Will Smith sent you a message', '{\"chatId\": 1}', '2026-05-13 13:10:00.135', '2026-05-13 13:10:00.135', 0, NULL, NULL),
(39, 16, 17, 0, 'Will Smith sent you a message', '{\"chatId\": 1}', '2026-05-13 13:10:12.882', '2026-05-13 13:10:12.882', 0, NULL, NULL),
(40, 16, 17, 0, 'Will Smith sent you a message', '{\"chatId\": 1}', '2026-05-13 13:10:40.712', '2026-05-13 13:10:40.712', 0, NULL, NULL),
(41, 16, 17, 0, 'Will Smith sent you a message', '{\"chatId\": 1}', '2026-05-13 13:11:24.539', '2026-05-13 13:11:24.539', 0, NULL, NULL),
(42, 17, 16, 0, 'Charls Xavier sent you a message', '{\"chatId\": 1}', '2026-05-13 13:11:48.246', '2026-05-13 13:11:48.246', 0, NULL, NULL),
(43, 17, 16, 0, 'Charls Xavier sent you a message', '{\"chatId\": 1}', '2026-05-13 13:11:54.019', '2026-05-13 13:11:54.019', 0, NULL, NULL),
(44, 17, 16, 0, 'Charls Xavier sent you a message', '{\"chatId\": 1}', '2026-05-13 13:12:14.276', '2026-05-13 13:12:14.276', 0, NULL, NULL),
(45, 17, 16, 0, 'Charls Xavier sent you a message', '{\"chatId\": 1}', '2026-05-13 13:13:13.402', '2026-05-13 13:13:13.402', 0, NULL, NULL),
(46, 17, 16, 0, 'Charls Xavier sent you a message', '{\"chatId\": 1}', '2026-05-14 06:02:53.968', '2026-05-14 06:02:53.968', 0, NULL, NULL),
(47, 16, 17, 0, 'Will Smith sent you a message', '{\"chatId\": 1}', '2026-05-14 06:03:41.220', '2026-05-14 06:03:41.220', 0, NULL, NULL),
(48, 17, 16, 0, 'Charls Xavier sent you a message', '{\"chatId\": 1}', '2026-05-14 06:48:39.201', '2026-05-14 06:48:39.201', 0, NULL, NULL),
(49, 16, 17, 0, 'Will Smith sent you a message', '{\"chatId\": 1}', '2026-05-14 06:51:47.285', '2026-05-14 06:51:47.285', 0, NULL, NULL),
(50, 17, 16, 0, 'Charls Xavier sent you a message', '{\"chatId\": 1}', '2026-05-14 06:52:31.526', '2026-05-14 06:52:31.526', 0, NULL, NULL),
(51, 16, 17, 0, 'Will Smith sent you a message', '{\"chatId\": 1}', '2026-05-14 06:53:02.989', '2026-05-14 06:53:02.989', 0, NULL, NULL),
(52, 16, 17, 0, 'Will Smith sent you a message', '{\"chatId\": 1}', '2026-05-14 06:53:22.969', '2026-05-14 06:53:22.969', 0, NULL, NULL),
(53, 17, 16, 0, 'Charls Xavier skickade ett meddelande till dig', '{\"chatId\": 1}', '2026-05-14 08:18:06.334', '2026-05-14 08:18:06.334', 0, NULL, NULL),
(54, 16, 17, 0, 'Will Smith sent you a message', '{\"chatId\": 1}', '2026-05-14 08:18:45.917', '2026-05-14 08:18:45.917', 0, NULL, NULL),
(55, 17, 16, 0, 'Charls Xavier skickade ett meddelande till dig', '{\"chatId\": 1}', '2026-05-14 08:22:54.635', '2026-05-14 08:22:54.635', 0, NULL, NULL),
(56, 16, 17, 0, 'Will Smith sent you a message', '{\"chatId\": 1}', '2026-05-14 08:23:14.087', '2026-05-14 08:23:14.087', 0, NULL, NULL),
(57, 16, 17, 0, 'Will Smith skickade ett meddelande till dig', '{\"chatId\": 1}', '2026-05-14 08:23:51.310', '2026-05-14 08:23:51.310', 0, NULL, NULL),
(58, 17, 16, 0, 'Charls Xavier skickade ett meddelande till dig', '{\"chatId\": 1}', '2026-05-14 08:29:36.138', '2026-05-14 08:29:36.138', 0, NULL, NULL),
(59, 16, 17, 0, 'Will Smith skickade ett meddelande till dig', '{\"chatId\": 1}', '2026-05-14 08:29:44.704', '2026-05-14 08:29:44.704', 0, NULL, NULL),
(60, 16, 17, 0, 'Will Smith skickade ett meddelande till dig', '{\"chatId\": 1}', '2026-05-14 09:19:23.186', '2026-05-14 09:19:23.186', 0, NULL, NULL),
(61, 17, 16, 0, 'Charls Xavier skickade ett meddelande till dig', '{\"chatId\": 1}', '2026-05-14 09:19:37.896', '2026-05-14 09:19:37.896', 0, NULL, NULL),
(62, 17, 16, 0, 'Charls Xavier skickade ett meddelande till dig', '{\"chatId\": 1}', '2026-05-14 09:19:47.835', '2026-05-14 09:19:47.835', 0, NULL, NULL),
(63, 17, 16, 0, 'Charls Xavier skickade ett meddelande till dig', '{\"chatId\": 1}', '2026-05-14 09:20:07.418', '2026-05-14 09:20:07.418', 0, NULL, NULL),
(64, 16, 17, 0, 'Will Smith sent you a message', '{\"chatId\": 1}', '2026-05-14 09:20:40.286', '2026-05-14 09:20:40.286', 0, NULL, NULL),
(65, 17, 16, 0, 'Charls Xavier sent you a message', '{\"chatId\": 1}', '2026-05-14 09:21:36.118', '2026-05-14 09:21:36.118', 0, NULL, NULL),
(66, 17, 16, 0, 'Charls Xavier sent you a message', '{\"chatId\": 1}', '2026-05-14 09:22:15.610', '2026-05-14 09:22:15.610', 0, NULL, NULL),
(67, 16, 17, 0, 'Will Smith sent you a message', '{\"chatId\": 1}', '2026-05-14 09:22:30.059', '2026-05-14 09:22:30.059', 0, NULL, NULL),
(68, 17, 16, 0, 'Charls Xavier sent you a message', '{\"chatId\": 1}', '2026-05-14 09:24:02.184', '2026-05-14 09:24:02.184', 0, NULL, NULL),
(69, 16, 17, 0, 'Will Smith sent you a message', '{\"chatId\": 1}', '2026-05-14 09:24:07.945', '2026-05-14 09:24:07.945', 0, NULL, NULL),
(70, 16, 17, 0, 'Will Smith skickade ett meddelande till dig', '{\"chatId\": 1}', '2026-05-14 09:24:33.551', '2026-05-14 09:24:33.551', 0, NULL, NULL),
(71, 17, 16, 0, 'Charls Xavier sent you a message', '{\"chatId\": 1}', '2026-05-14 09:26:08.173', '2026-05-14 09:26:08.173', 0, NULL, NULL),
(72, 16, 17, 0, 'Will Smith skickade ett meddelande till dig', '{\"chatId\": 1}', '2026-05-14 09:33:06.585', '2026-05-14 09:33:06.585', 0, NULL, NULL),
(73, 17, 16, 0, 'Charls Xavier sent you a message', '{\"chatId\": 1}', '2026-05-14 09:33:15.361', '2026-05-14 09:33:15.361', 0, NULL, NULL),
(74, 17, 16, 0, 'Charls Xavier skickade ett meddelande till dig', '{\"chatId\": 1}', '2026-05-14 09:33:53.626', '2026-05-14 09:33:53.626', 0, NULL, NULL),
(75, 16, 17, 0, 'Will Smith skickade ett meddelande till dig', '{\"chatId\": 1}', '2026-05-14 10:43:06.712', '2026-05-14 10:43:06.712', 0, NULL, NULL),
(76, 17, 16, 0, 'Charls Xavier skickade ett meddelande till dig', '{\"chatId\": 1}', '2026-05-14 10:43:22.418', '2026-05-14 10:43:22.418', 0, NULL, NULL),
(77, 17, 16, 0, 'Charls Xavier sent you a message', '{\"chatId\": 1}', '2026-05-14 10:43:37.482', '2026-05-14 10:43:37.482', 0, NULL, NULL),
(78, 16, 17, 0, 'Will Smith sent you a message', '{\"chatId\": 1}', '2026-05-14 10:43:57.105', '2026-05-14 10:43:57.105', 0, NULL, NULL),
(79, 16, 17, 0, 'Will Smith sent you a message', '{\"chatId\": 1}', '2026-05-14 11:17:24.810', '2026-05-14 11:17:24.810', 0, NULL, NULL),
(80, 16, 17, 0, 'Will Smith sent you a message', '{\"chatId\": 1}', '2026-05-14 11:17:41.394', '2026-05-14 11:17:41.394', 0, NULL, NULL),
(81, 17, 16, 0, 'Charls Xavier sent you a message', '{\"chatId\": 1}', '2026-05-14 11:17:59.337', '2026-05-14 11:17:59.337', 0, NULL, NULL),
(82, 16, 17, 0, 'Will Smith sent you a message', '{\"chatId\": 1}', '2026-05-14 11:19:41.518', '2026-05-14 11:19:41.518', 0, NULL, NULL),
(83, 16, 17, 0, 'Will Smith sent you a message', '{\"chatId\": 1}', '2026-05-14 11:19:48.060', '2026-05-14 11:19:48.060', 0, NULL, NULL),
(84, 16, 17, 0, 'Will Smith sent you a message', '{\"chatId\": 1}', '2026-05-14 11:20:09.954', '2026-05-14 11:20:09.954', 0, NULL, NULL),
(85, 17, 16, 0, 'Charls Xavier sent you a message', '{\"chatId\": 1}', '2026-05-14 11:20:20.785', '2026-05-14 11:20:20.785', 0, NULL, NULL),
(86, 17, 16, 0, 'Charls Xavier sent you a message', '{\"chatId\": 1}', '2026-05-14 11:20:43.338', '2026-05-14 11:20:43.338', 0, NULL, NULL),
(87, 17, 16, 0, 'Charls Xavier sent you a message', '{\"chatId\": 1}', '2026-05-14 11:20:52.540', '2026-05-14 11:20:52.540', 0, NULL, NULL),
(88, 16, 17, 0, 'Will Smith sent you a message', '{\"chatId\": 1}', '2026-05-14 11:21:23.572', '2026-05-14 11:21:23.572', 0, NULL, NULL),
(89, 17, 16, 0, 'Charls Xavier sent you a message', '{\"chatId\": 1}', '2026-05-14 11:21:32.244', '2026-05-14 11:21:32.244', 0, NULL, NULL),
(90, 17, 16, 0, 'Charls Xavier sent you a message', '{\"chatId\": 1}', '2026-05-14 11:22:28.972', '2026-05-14 11:22:28.972', 0, NULL, NULL),
(91, 17, 16, 0, 'Charls Xavier sent you a message', '{\"chatId\": 1}', '2026-05-14 11:22:35.041', '2026-05-14 11:22:35.041', 0, NULL, NULL),
(92, 17, 16, 0, 'Charls Xavier skickade ett meddelande till dig', '{\"chatId\": 1}', '2026-05-14 11:23:56.961', '2026-05-14 11:23:56.961', 0, NULL, NULL),
(93, 17, 16, 0, 'Charls Xavier skickade ett meddelande till dig', '{\"chatId\": 1}', '2026-05-14 11:40:39.551', '2026-05-14 11:40:39.551', 0, NULL, NULL),
(94, 16, 17, 0, 'Will Smith skickade ett meddelande till dig', '{\"chatId\": 1}', '2026-05-14 11:41:04.862', '2026-05-14 11:41:04.862', 0, NULL, NULL),
(95, 16, 17, 0, 'Will Smith skickade ett meddelande till dig', '{\"chatId\": 1}', '2026-05-14 11:41:12.692', '2026-05-14 11:41:12.692', 0, NULL, NULL),
(96, 16, 17, 0, 'Will Smith gillade ditt inlagg', '{\"id\": 2, \"image_url\": \"https://frenly.s3.us-east-1.amazonaws.com/1778758939158_image_cropper_5D4FA650-3884-4206-A306-EEC7368D5580-3587-0000016244E8F1F8.jpg\"}', '2026-05-14 11:42:46.765', '2026-05-14 11:42:46.765', 0, 'post', NULL),
(97, 16, 17, 0, 'Will Smith gillade ditt inlagg', '{\"id\": 2, \"image_url\": \"https://frenly.s3.us-east-1.amazonaws.com/1778758939158_image_cropper_5D4FA650-3884-4206-A306-EEC7368D5580-3587-0000016244E8F1F8.jpg\"}', '2026-05-14 11:43:05.194', '2026-05-14 11:43:05.194', 0, 'post', NULL),
(98, 17, 16, 0, 'Charls Xavier skickade ett meddelande till dig', '{\"chatId\": 1}', '2026-05-14 11:43:29.192', '2026-05-14 11:43:29.192', 0, NULL, NULL),
(99, 17, 16, 0, 'Charls Xavier skickade ett meddelande till dig', '{\"chatId\": 1}', '2026-05-14 11:43:43.272', '2026-05-14 11:43:43.272', 0, NULL, NULL),
(100, 16, 17, 0, 'Will Smith sent you a message', '{\"chatId\": 1}', '2026-05-14 11:44:23.743', '2026-05-14 11:44:23.743', 0, NULL, NULL),
(101, 17, 16, 0, 'Charls Xavier sent you a message', '{\"chatId\": 1}', '2026-05-14 11:44:33.802', '2026-05-14 11:44:33.802', 0, NULL, NULL),
(102, 17, 16, 0, 'Charls Xavier sent you a message', '{\"chatId\": 1}', '2026-05-14 11:45:38.321', '2026-05-14 11:45:38.321', 0, NULL, NULL),
(103, 16, 17, 0, 'Will Smith sent you a message', '{\"chatId\": 1}', '2026-05-14 11:48:58.678', '2026-05-14 11:48:58.678', 0, NULL, NULL),
(104, 17, 16, 0, 'Charls Xavier sent you a message', '{\"chatId\": 1}', '2026-05-14 11:49:11.768', '2026-05-14 11:49:11.768', 0, NULL, NULL),
(105, 16, 17, 0, 'Will Smith sent you a message', '{\"chatId\": 1}', '2026-05-14 11:49:29.185', '2026-05-14 11:49:29.185', 0, NULL, NULL),
(106, 16, 17, 0, 'Will Smith sent you a message', '{\"chatId\": 1}', '2026-05-14 11:58:38.860', '2026-05-14 11:58:38.860', 0, NULL, NULL),
(107, 17, 16, 0, 'Charls Xavier sent you a message', '{\"chatId\": 1}', '2026-05-14 12:03:19.544', '2026-05-14 12:03:19.544', 0, NULL, NULL),
(108, 16, 17, 0, 'Will Smith sent you a message', '{\"chatId\": 1}', '2026-05-14 12:03:38.583', '2026-05-14 12:03:38.583', 0, NULL, NULL),
(109, 16, 17, 0, 'Will Smith sent you a message', '{\"chatId\": 1}', '2026-05-14 12:28:54.894', '2026-05-14 12:28:54.894', 0, NULL, NULL),
(110, 16, 17, 0, 'Will Smith sent you a message', '{\"chatId\": 1}', '2026-05-14 12:49:12.473', '2026-05-14 12:49:12.473', 0, NULL, NULL),
(111, 17, 16, 0, 'Charls Xavier sent you a message', '{\"chatId\": 1}', '2026-05-14 12:49:19.220', '2026-05-14 12:49:19.220', 0, NULL, NULL),
(112, 17, 16, 0, 'Charls Xavier sent you a message', '{\"chatId\": 1}', '2026-05-14 12:49:24.203', '2026-05-14 12:49:24.203', 0, NULL, NULL),
(113, 16, 17, 0, 'Will Smith sent you a message', '{\"chatId\": 1}', '2026-05-14 12:52:59.360', '2026-05-14 12:52:59.360', 0, NULL, NULL),
(114, 16, 17, 0, 'Will Smith sent you a message', '{\"chatId\": 1}', '2026-05-14 12:53:07.247', '2026-05-14 12:53:07.247', 0, NULL, NULL),
(115, 17, 16, 0, 'Charls Xavier sent you a message', '{\"chatId\": 1}', '2026-05-14 12:53:22.598', '2026-05-14 12:53:22.598', 0, NULL, NULL),
(116, 17, 16, 0, 'Charls Xavier sent you a message', '{\"chatId\": 1}', '2026-05-14 12:53:48.840', '2026-05-14 12:53:48.840', 0, NULL, NULL),
(117, 17, 16, 0, 'Charls Xavier sent you a message', '{\"chatId\": 1}', '2026-05-14 12:54:01.451', '2026-05-14 12:54:01.451', 0, NULL, NULL),
(118, 16, 17, 0, 'Will Smith sent you a message', '{\"chatId\": 1}', '2026-05-14 12:54:55.610', '2026-05-14 12:54:55.610', 0, NULL, NULL),
(119, 16, 17, 0, 'Will Smith sent you a message', '{\"chatId\": 1}', '2026-05-14 12:55:10.606', '2026-05-14 12:55:10.606', 0, NULL, NULL),
(120, 16, 17, 0, 'Will Smith sent you a message', '{\"chatId\": 1}', '2026-05-14 12:55:19.864', '2026-05-14 12:55:19.864', 0, NULL, NULL),
(121, 16, 17, 0, 'Will Smith sent you a message', '{\"chatId\": 1}', '2026-05-14 13:01:11.526', '2026-05-14 13:01:11.526', 0, NULL, NULL),
(122, 16, 17, 0, 'Will Smith sent you a message', '{\"chatId\": 1}', '2026-05-14 13:04:38.000', '2026-05-14 13:04:38.000', 0, NULL, NULL),
(123, 17, 16, 0, 'Charls Xavier sent you a message', '{\"chatId\": 1}', '2026-05-14 13:05:13.357', '2026-05-14 13:05:13.357', 0, NULL, NULL),
(124, 17, 16, 0, 'Charls Xavier sent you a message', '{\"chatId\": 1}', '2026-05-14 13:05:28.736', '2026-05-14 13:05:28.736', 0, NULL, NULL),
(125, 16, 17, 0, 'Will Smith sent you a message', '{\"chatId\": 1}', '2026-05-14 13:05:37.114', '2026-05-14 13:05:37.114', 0, NULL, NULL),
(126, 16, 17, 0, 'Will Smith sent you a message', '{\"chatId\": 1}', '2026-05-14 13:06:07.657', '2026-05-14 13:06:07.657', 0, NULL, NULL),
(127, 17, 16, 0, 'Charls Xavier sent you a message', '{\"chatId\": 1}', '2026-05-14 13:06:27.335', '2026-05-14 13:06:27.335', 0, NULL, NULL),
(128, 17, 16, 0, 'Charls Xavier sent you a message', '{\"chatId\": 1}', '2026-05-14 13:06:42.168', '2026-05-14 13:06:42.168', 0, NULL, NULL),
(129, 17, 16, 0, 'Charls Xavier sent you a message', '{\"chatId\": 1}', '2026-05-14 13:07:00.597', '2026-05-14 13:07:00.597', 0, NULL, NULL),
(130, 17, 16, 0, 'Charls Xavier sent you a message', '{\"chatId\": 1}', '2026-05-14 13:10:37.374', '2026-05-14 13:10:37.374', 0, NULL, NULL),
(131, 16, 17, 0, 'Will Smith sent you a message', '{\"chatId\": 1}', '2026-05-14 13:10:46.784', '2026-05-14 13:10:46.784', 0, NULL, NULL),
(145, 1, 15, 0, 'Viktor waagaard skickade ett meddelande till dig', '{\"chatId\": 3}', '2026-05-14 18:23:11.931', '2026-05-14 18:23:11.931', 0, NULL, NULL),
(146, 1, 15, 0, 'Viktor waagaard skickade ett meddelande till dig', '{\"chatId\": 3}', '2026-05-14 18:25:52.191', '2026-05-14 18:25:52.191', 0, NULL, NULL),
(147, 1, 15, 0, 'Viktor waagaard skickade ett meddelande till dig', '{\"chatId\": 3}', '2026-05-14 18:25:58.710', '2026-05-14 18:25:58.710', 0, NULL, NULL),
(148, 1, 15, 0, 'Viktor waagaard skickade ett meddelande till dig', '{\"chatId\": 3}', '2026-05-14 18:26:56.910', '2026-05-14 18:26:56.910', 0, NULL, NULL),
(149, 1, 15, 0, 'Viktor waagaard skickade ett meddelande till dig', '{\"chatId\": 3}', '2026-05-14 18:29:11.506', '2026-05-14 18:29:11.506', 0, NULL, NULL),
(150, 1, 15, 0, 'Viktor waagaard skickade ett meddelande till dig', '{\"chatId\": 3}', '2026-05-14 18:31:37.503', '2026-05-14 18:31:37.503', 0, NULL, NULL),
(151, 1, 15, 0, 'Viktor waagaard skickade ett meddelande till dig', '{\"chatId\": 3}', '2026-05-14 18:35:35.036', '2026-05-14 18:35:35.036', 0, NULL, NULL),
(152, 15, 1, 0, 'Andreas Sundström Edland skickade ett meddelande till dig', '{\"chatId\": 3}', '2026-05-15 17:25:11.336', '2026-05-15 17:25:11.336', 0, NULL, NULL),
(153, 15, 1, 0, 'Andreas Sundström Edland skickade ett meddelande till dig', '{\"chatId\": 3}', '2026-05-15 17:25:35.483', '2026-05-15 17:25:35.483', 0, NULL, NULL),
(154, 1, 15, 0, 'Viktor waagaard skickade ett meddelande till dig', '{\"chatId\": 3}', '2026-05-17 19:05:48.381', '2026-05-17 19:05:48.381', 0, NULL, NULL),
(156, 17, 19, 0, 'Charls Xavier foljer dig nu', '{}', '2026-05-18 06:23:25.853', '2026-05-18 06:23:25.853', 0, 'followAccept', NULL),
(158, 16, 19, 0, 'Will Smith foljer dig nu', '{}', '2026-05-18 06:27:08.083', '2026-05-18 06:27:08.083', 0, 'followAccept', NULL),
(159, 16, 17, 0, 'Will Smith sent you a message', '{\"chatId\": 1}', '2026-05-18 09:54:44.610', '2026-05-18 09:54:44.610', 0, NULL, NULL),
(160, 17, 18, 0, 'Charls Xavier foljer dig nu', '{}', '2026-05-18 10:23:25.943', '2026-05-18 10:23:25.943', 0, 'followAccept', NULL),
(164, 21, 16, 0, 'Tony Stark  sent you a message', '{\"chatId\": 8}', '2026-05-18 11:25:21.486', '2026-05-18 11:25:21.486', 0, NULL, NULL),
(165, 21, 16, 0, 'Tony Stark  is now following you', '{}', '2026-05-18 11:29:11.099', '2026-05-18 11:29:11.099', 0, 'followAccept', NULL),
(166, 16, 21, 0, 'Will Smith foljer dig nu', '{}', '2026-05-18 11:29:19.208', '2026-05-18 11:29:19.208', 0, 'followAccept', NULL),
(167, 16, 21, 0, 'Will Smith skickade ett meddelande till dig', '{\"chatId\": 9}', '2026-05-18 11:39:56.300', '2026-05-18 11:39:56.300', 0, NULL, NULL),
(168, 23, 22, 0, 'Billa Bahadur  foljer dig nu', '{}', '2026-05-18 12:07:22.086', '2026-05-18 12:07:22.086', 0, 'followAccept', NULL),
(169, 22, 23, 0, 'Steve Rogger foljer dig nu', '{}', '2026-05-18 12:07:34.770', '2026-05-18 12:07:34.770', 0, 'followAccept', NULL),
(170, 23, 22, 0, 'Billa Bahadur  skickade ett meddelande till dig', '{\"chatId\": 10}', '2026-05-18 12:07:53.136', '2026-05-18 12:07:53.136', 0, NULL, NULL),
(171, 22, 23, 0, 'Steve Rogger skickade ett meddelande till dig', '{\"chatId\": 10}', '2026-05-18 12:08:02.119', '2026-05-18 12:08:02.119', 0, NULL, NULL),
(172, 23, 22, 0, 'Billa Bahadur  skickade ett meddelande till dig', '{\"chatId\": 11}', '2026-05-18 12:13:37.081', '2026-05-18 12:13:37.081', 0, NULL, NULL),
(173, 23, 22, 0, 'Billa Bahadur  skickade ett meddelande till dig', '{\"chatId\": 11}', '2026-05-18 12:21:46.350', '2026-05-18 12:21:46.350', 0, NULL, NULL),
(174, 22, 23, 0, 'Steve Rogger skickade ett meddelande till dig', '{\"chatId\": 12}', '2026-05-18 12:23:17.955', '2026-05-18 12:23:17.955', 0, NULL, NULL),
(175, 22, 23, 0, 'Steve Rogger skickade ett meddelande till dig', '{\"chatId\": 12}', '2026-05-18 12:24:24.512', '2026-05-18 12:24:24.512', 0, NULL, NULL),
(176, 22, 23, 0, 'Steve Rogger skickade ett meddelande till dig', '{\"chatId\": 12}', '2026-05-18 12:25:51.325', '2026-05-18 12:25:51.325', 0, NULL, NULL),
(177, 23, 22, 0, 'Billa Bahadur  skickade ett meddelande till dig', '{\"chatId\": 12}', '2026-05-18 12:26:00.547', '2026-05-18 12:26:00.547', 0, NULL, NULL),
(178, 23, 22, 0, 'Billa Bahadur  skickade ett meddelande till dig', '{\"chatId\": 13}', '2026-05-18 13:03:32.431', '2026-05-18 13:03:32.431', 0, NULL, NULL),
(179, 23, 22, 0, 'Billa Bahadur  skickade ett meddelande till dig', '{\"chatId\": 15}', '2026-05-18 13:25:55.876', '2026-05-18 13:25:55.876', 0, NULL, NULL),
(180, 23, 22, 0, 'Billa Bahadur  skickade ett meddelande till dig', '{\"chatId\": 16}', '2026-05-18 13:36:00.053', '2026-05-18 13:36:00.053', 0, NULL, NULL),
(181, 23, 22, 0, 'Billa Bahadur  skickade ett meddelande till dig', '{\"chatId\": 17}', '2026-05-18 13:36:52.064', '2026-05-18 13:36:52.064', 0, NULL, NULL),
(182, 23, 22, 0, 'Billa Bahadur  skickade ett meddelande till dig', '{\"chatId\": 18}', '2026-05-18 13:41:30.712', '2026-05-18 13:41:30.712', 0, NULL, NULL),
(183, 22, 23, 0, 'Steve Rogger skickade ett meddelande till dig', '{\"chatId\": 19}', '2026-05-18 13:44:28.040', '2026-05-18 13:44:28.040', 0, NULL, NULL),
(184, 24, 22, 0, 'Jack Willingly  foljer dig nu', '{}', '2026-05-19 06:03:36.529', '2026-05-19 06:03:36.529', 0, 'followAccept', NULL),
(185, 22, 24, 0, 'Steve Rogger foljer dig nu', '{}', '2026-05-19 06:03:43.485', '2026-05-19 06:03:43.485', 0, 'followAccept', NULL),
(186, 24, 22, 0, 'Jack Willingly  skickade ett meddelande till dig', '{\"chatId\": 20}', '2026-05-19 06:04:07.185', '2026-05-19 06:04:07.185', 0, NULL, NULL),
(187, 23, 22, 0, 'Billa Bahadur  skickade ett meddelande till dig', '{\"chatId\": 21}', '2026-05-19 09:47:35.636', '2026-05-19 09:47:35.636', 0, NULL, NULL),
(188, 22, 23, 0, 'Steve Rogger skickade ett meddelande till dig', '{\"chatId\": 21}', '2026-05-19 09:48:08.421', '2026-05-19 09:48:08.421', 0, NULL, NULL),
(189, 22, 23, 0, 'Steve Rogger skickade ett meddelande till dig', '{\"chatId\": 21}', '2026-05-19 09:48:24.071', '2026-05-19 09:48:24.071', 0, NULL, NULL),
(190, 22, 23, 0, 'Steve Rogger skickade ett meddelande till dig', '{\"chatId\": 21}', '2026-05-19 09:48:24.373', '2026-05-19 09:48:24.373', 0, NULL, NULL),
(191, 23, 22, 0, 'Billa Bahadur  skickade ett meddelande till dig', '{\"chatId\": 21}', '2026-05-19 09:48:34.798', '2026-05-19 09:48:34.798', 0, NULL, NULL),
(192, 23, 22, 0, 'Billa Bahadur  skickade ett meddelande till dig', '{\"chatId\": 21}', '2026-05-19 09:48:48.418', '2026-05-19 09:48:48.418', 0, NULL, NULL),
(193, 22, 23, 0, 'Steve Rogger skickade ett meddelande till dig', '{\"chatId\": 21}', '2026-05-19 09:49:00.291', '2026-05-19 09:49:00.291', 0, NULL, NULL),
(194, 22, 23, 0, 'Steve Rogger skickade ett meddelande till dig', '{\"chatId\": 21}', '2026-05-19 09:49:06.215', '2026-05-19 09:49:06.215', 0, NULL, NULL),
(195, 23, 22, 0, 'Billa Bahadur  skickade ett meddelande till dig', '{\"chatId\": 23}', '2026-05-19 09:55:22.413', '2026-05-19 09:55:22.413', 0, NULL, NULL),
(196, 23, 22, 0, 'Billa Bahadur  skickade ett meddelande till dig', '{\"chatId\": 23}', '2026-05-19 09:55:28.181', '2026-05-19 09:55:28.181', 0, NULL, NULL),
(197, 23, 22, 0, 'Billa Bahadur  skickade ett meddelande till dig', '{\"chatId\": 24}', '2026-05-19 09:56:31.367', '2026-05-19 09:56:31.367', 0, NULL, NULL),
(198, 23, 22, 0, 'Billa Bahadur  skickade ett meddelande till dig', '{\"chatId\": 25}', '2026-05-19 09:58:30.595', '2026-05-19 09:58:30.595', 0, NULL, NULL),
(199, 23, 17, 0, 'Billa Bahadur  liked your post', '{\"id\": 2, \"image_url\": \"https://frenly.s3.us-east-1.amazonaws.com/1778758939158_image_cropper_5D4FA650-3884-4206-A306-EEC7368D5580-3587-0000016244E8F1F8.jpg\"}', '2026-05-19 10:12:53.452', '2026-05-19 10:12:53.452', 0, 'post', NULL),
(200, 22, 23, 0, 'Steve Rogger skickade ett meddelande till dig', '{\"chatId\": 25}', '2026-05-19 10:21:23.302', '2026-05-19 10:21:23.302', 0, NULL, NULL),
(201, 22, 23, 0, 'Steve Rogger skickade ett meddelande till dig', '{\"chatId\": 25}', '2026-05-19 10:21:52.547', '2026-05-19 10:21:52.547', 0, NULL, NULL),
(202, 22, 23, 0, 'Steve Rogger skickade ett meddelande till dig', '{\"chatId\": 25}', '2026-05-19 10:22:15.094', '2026-05-19 10:22:15.094', 0, NULL, NULL),
(203, 1, 15, 0, 'Viktor waagaard skickade ett meddelande till dig', '{\"chatId\": 4}', '2026-05-19 12:42:34.990', '2026-05-19 12:42:34.990', 0, NULL, NULL),
(205, 24, 24, 0, 'Jack Willingly  foljer dig nu', '{}', '2026-05-19 13:14:49.575', '2026-05-19 13:14:49.575', 0, 'followAccept', NULL),
(206, 24, 22, 0, 'Jack Willingly  skickade ett meddelande till dig', '{\"chatId\": 22}', '2026-05-19 13:16:45.975', '2026-05-19 13:16:45.975', 0, NULL, NULL),
(207, 24, 22, 0, 'Jack Willingly  skickade ett meddelande till dig', '{\"chatId\": 22}', '2026-05-19 13:16:52.158', '2026-05-19 13:16:52.158', 0, NULL, NULL),
(208, 24, 1, 0, 'Jack Willingly  gillade ditt inlagg', '{\"id\": 1, \"image_url\": \"https://frenly.s3.us-east-1.amazonaws.com/1778422396109_image_cropper_1778422363041.jpg\"}', '2026-05-19 13:19:00.504', '2026-05-19 13:19:00.504', 0, 'post', NULL),
(209, 24, 1, 0, 'Jack Willingly  gillade ditt inlagg', '{\"id\": 1, \"image_url\": \"https://frenly.s3.us-east-1.amazonaws.com/1778422396109_image_cropper_1778422363041.jpg\"}', '2026-05-19 13:19:01.599', '2026-05-19 13:19:01.599', 0, 'post', NULL),
(210, 24, 22, 0, 'Jack Willingly  skickade ett meddelande till dig', '{\"chatId\": 22}', '2026-05-19 13:20:28.962', '2026-05-19 13:20:28.962', 0, NULL, NULL),
(211, 24, 17, 0, 'Jack Willingly  commented on your post', '{\"id\": 2, \"image_url\": \"https://frenly.s3.us-east-1.amazonaws.com/1778758939158_image_cropper_5D4FA650-3884-4206-A306-EEC7368D5580-3587-0000016244E8F1F8.jpg\"}', '2026-05-19 13:21:16.968', '2026-05-19 13:21:16.968', 0, 'post', NULL),
(212, 24, 17, 0, 'Jack Willingly  commented on your post', '{\"id\": 2, \"image_url\": \"https://frenly.s3.us-east-1.amazonaws.com/1778758939158_image_cropper_5D4FA650-3884-4206-A306-EEC7368D5580-3587-0000016244E8F1F8.jpg\"}', '2026-05-19 13:21:41.664', '2026-05-19 13:21:41.664', 0, 'post', NULL),
(213, 22, 17, 0, 'Steve Rogger liked your post', '{\"id\": 2, \"image_url\": \"https://frenly.s3.us-east-1.amazonaws.com/1778758939158_image_cropper_5D4FA650-3884-4206-A306-EEC7368D5580-3587-0000016244E8F1F8.jpg\"}', '2026-05-19 13:22:24.841', '2026-05-19 13:22:24.841', 0, 'post', NULL),
(214, 24, 17, 0, 'Jack Willingly  liked your post', '{\"id\": 2, \"image_url\": \"https://frenly.s3.us-east-1.amazonaws.com/1778758939158_image_cropper_5D4FA650-3884-4206-A306-EEC7368D5580-3587-0000016244E8F1F8.jpg\"}', '2026-05-19 13:22:29.326', '2026-05-19 13:22:29.326', 0, 'post', NULL),
(215, 24, 17, 0, 'Jack Willingly  liked your post', '{\"id\": 2, \"image_url\": \"https://frenly.s3.us-east-1.amazonaws.com/1778758939158_image_cropper_5D4FA650-3884-4206-A306-EEC7368D5580-3587-0000016244E8F1F8.jpg\"}', '2026-05-19 13:22:32.608', '2026-05-19 13:22:32.608', 0, 'post', NULL),
(217, 24, 17, 0, 'Jack Willingly  is now following you', '{}', '2026-05-19 13:23:08.462', '2026-05-19 13:23:08.462', 0, 'followAccept', NULL),
(218, 22, 24, 0, 'Steve Rogger skickade ett meddelande till dig', '{\"chatId\": 22}', '2026-05-19 13:23:53.279', '2026-05-19 13:23:53.279', 0, NULL, NULL),
(219, 22, 24, 0, 'Steve Rogger skickade ett meddelande till dig', '{\"chatId\": 22}', '2026-05-19 13:24:32.993', '2026-05-19 13:24:32.993', 0, NULL, NULL),
(220, 22, 24, 0, 'Steve Rogger skickade ett meddelande till dig', '{\"chatId\": 22}', '2026-05-19 13:25:48.466', '2026-05-19 13:25:48.466', 0, NULL, NULL),
(221, 22, 24, 0, 'Steve Rogger skickade ett meddelande till dig', '{\"chatId\": 22}', '2026-05-19 13:25:51.178', '2026-05-19 13:25:51.178', 0, NULL, NULL),
(222, 16, 22, 0, 'Will Smith foljer dig nu', '{}', '2026-05-20 05:57:43.113', '2026-05-20 05:57:43.113', 0, 'followAccept', NULL),
(223, 22, 16, 0, 'Steve Rogger is now following you', '{}', '2026-05-20 05:57:48.227', '2026-05-20 05:57:48.227', 0, 'followAccept', NULL),
(224, 22, 16, 0, 'Steve Rogger sent you a message', '{\"chatId\": 31}', '2026-05-20 05:58:08.558', '2026-05-20 05:58:08.558', 0, NULL, NULL),
(225, 16, 22, 0, 'Will Smith skickade ett meddelande till dig', '{\"chatId\": 31}', '2026-05-20 05:58:17.845', '2026-05-20 05:58:17.845', 0, NULL, NULL),
(226, 16, 22, 0, 'Will Smith skickade ett meddelande till dig', '{\"chatId\": 31}', '2026-05-20 05:58:27.884', '2026-05-20 05:58:27.884', 0, NULL, NULL),
(227, 22, 16, 0, 'Steve Rogger sent you a message', '{\"chatId\": 31}', '2026-05-20 05:58:28.970', '2026-05-20 05:58:28.970', 0, NULL, NULL),
(228, 22, 16, 0, 'Steve Rogger sent you a message', '{\"chatId\": 31}', '2026-05-20 05:58:52.038', '2026-05-20 05:58:52.038', 0, NULL, NULL),
(229, 16, 22, 0, 'Will Smith skickade ett meddelande till dig', '{\"chatId\": 31}', '2026-05-20 05:58:52.503', '2026-05-20 05:58:52.503', 0, NULL, NULL),
(230, 16, 22, 0, 'Will Smith skickade ett meddelande till dig', '{\"chatId\": 31}', '2026-05-20 05:59:05.916', '2026-05-20 05:59:05.916', 0, NULL, NULL),
(231, 16, 22, 0, 'Will Smith skickade ett meddelande till dig', '{\"chatId\": 31}', '2026-05-20 05:59:17.977', '2026-05-20 05:59:17.977', 0, NULL, NULL),
(232, 22, 16, 0, 'Steve Rogger sent you a message', '{\"chatId\": 31}', '2026-05-20 05:59:27.543', '2026-05-20 05:59:27.543', 0, NULL, NULL),
(233, 16, 22, 0, 'Will Smith skickade ett meddelande till dig', '{\"chatId\": 31}', '2026-05-20 05:59:28.837', '2026-05-20 05:59:28.837', 0, NULL, NULL),
(234, 16, 22, 0, 'Will Smith skickade ett meddelande till dig', '{\"chatId\": 31}', '2026-05-20 05:59:35.590', '2026-05-20 05:59:35.590', 0, NULL, NULL),
(235, 16, 22, 0, 'Will Smith skickade ett meddelande till dig', '{\"chatId\": 31}', '2026-05-20 05:59:37.231', '2026-05-20 05:59:37.231', 0, NULL, NULL),
(236, 16, 22, 0, 'Will Smith skickade ett meddelande till dig', '{\"chatId\": 31}', '2026-05-20 05:59:39.599', '2026-05-20 05:59:39.599', 0, NULL, NULL),
(237, 16, 22, 0, 'Will Smith skickade ett meddelande till dig', '{\"chatId\": 31}', '2026-05-20 05:59:42.566', '2026-05-20 05:59:42.566', 0, NULL, NULL),
(238, 16, 22, 0, 'Will Smith skickade ett meddelande till dig', '{\"chatId\": 31}', '2026-05-20 05:59:47.329', '2026-05-20 05:59:47.329', 0, NULL, NULL),
(239, 16, 22, 0, 'Will Smith skickade ett meddelande till dig', '{\"chatId\": 31}', '2026-05-20 05:59:49.402', '2026-05-20 05:59:49.402', 0, NULL, NULL),
(240, 22, 16, 0, 'Steve Rogger sent you a message', '{\"chatId\": 31}', '2026-05-20 05:59:49.474', '2026-05-20 05:59:49.474', 0, NULL, NULL),
(241, 22, 16, 0, 'Steve Rogger liked your post', '{\"id\": 3, \"image_url\": \"https://frenly.s3.us-east-1.amazonaws.com/1779256829056_image_cropper_1779256808185.jpg\"}', '2026-05-20 06:00:39.877', '2026-05-20 06:00:39.877', 0, 'post', NULL),
(242, 22, 16, 0, 'Steve Rogger commented on your post', '{\"id\": 3, \"image_url\": \"https://frenly.s3.us-east-1.amazonaws.com/1779256829056_image_cropper_1779256808185.jpg\"}', '2026-05-20 06:00:52.025', '2026-05-20 06:00:52.025', 0, 'post', NULL),
(243, 22, 16, 0, 'Steve Rogger liked your vlog', '{\"id\": 1, \"video_url\": \"https://frenly.s3.us-east-1.amazonaws.com/1779256905043_VID_2026-05-20%2011-31-32-1088935205.mp4\", \"thumbnail_url\": null}', '2026-05-20 06:02:02.671', '2026-05-20 06:02:02.671', 0, 'vlog', NULL),
(244, 22, 16, 0, 'Steve Rogger liked your blog', '{\"id\": 1, \"image_url\": null}', '2026-05-20 06:02:53.627', '2026-05-20 06:02:53.627', 0, 'blog', NULL),
(245, 22, 16, 0, 'Steve Rogger liked your blog', '{\"id\": 2, \"image_url\": \"https://frenly.s3.us-east-1.amazonaws.com/1779257214880_avtar.svg\"}', '2026-05-20 06:08:07.239', '2026-05-20 06:08:07.239', 0, 'blog', NULL),
(246, 22, 16, 0, 'Steve Rogger liked your post', '{\"id\": 4, \"image_url\": \"https://frenly.s3.us-east-1.amazonaws.com/1779257680711_image_cropper_1779257656290.jpg\"}', '2026-05-20 06:15:16.632', '2026-05-20 06:15:16.632', 0, 'post', NULL),
(247, 22, 16, 0, 'Steve Rogger commented on your post', '{\"id\": 4, \"image_url\": \"https://frenly.s3.us-east-1.amazonaws.com/1779257680711_image_cropper_1779257656290.jpg\"}', '2026-05-20 06:15:31.980', '2026-05-20 06:15:31.980', 0, 'post', NULL),
(248, 24, 22, 0, 'Jack Willingly  skickade ett meddelande till dig', '{\"chatId\": 22}', '2026-05-20 06:24:25.176', '2026-05-20 06:24:25.176', 0, NULL, NULL),
(249, 24, 16, 0, 'Jack Willingly  is now following you', '{}', '2026-05-20 06:24:48.992', '2026-05-20 06:24:48.992', 0, 'followAccept', NULL),
(253, 16, 24, 0, 'Will Smith foljer dig nu', '{}', '2026-05-20 06:27:34.383', '2026-05-20 06:27:34.383', 0, 'followAccept', NULL),
(254, 16, 24, 0, 'Will Smith skickade ett meddelande till dig', '{\"chatId\": 32}', '2026-05-20 06:27:56.890', '2026-05-20 06:27:56.890', 0, NULL, NULL),
(255, 16, 24, 0, 'Will Smith skickade ett meddelande till dig', '{\"chatId\": 32}', '2026-05-20 06:27:58.132', '2026-05-20 06:27:58.132', 0, NULL, NULL),
(256, 24, 16, 0, 'Jack Willingly  sent you a message', '{\"chatId\": 32}', '2026-05-20 06:31:01.345', '2026-05-20 06:31:01.345', 0, NULL, NULL),
(257, 22, 16, 0, 'Steve Rogger sent you a message', '{\"chatId\": 31}', '2026-05-20 06:31:32.637', '2026-05-20 06:31:32.637', 0, NULL, NULL),
(258, 16, 24, 0, 'Will Smith skickade ett meddelande till dig', '{\"chatId\": 32}', '2026-05-20 06:31:50.422', '2026-05-20 06:31:50.422', 0, NULL, NULL),
(259, 16, 22, 0, 'Will Smith skickade ett meddelande till dig', '{\"chatId\": 31}', '2026-05-20 06:32:04.179', '2026-05-20 06:32:04.179', 0, NULL, NULL),
(260, 22, 16, 0, 'Steve Rogger sent you a message', '{\"chatId\": 31}', '2026-05-20 06:32:20.774', '2026-05-20 06:32:20.774', 0, NULL, NULL),
(261, 16, 1, 0, 'Will Smith gillade ditt inlagg', '{\"id\": 1, \"image_url\": \"https://frenly.s3.us-east-1.amazonaws.com/1778422396109_image_cropper_1778422363041.jpg\"}', '2026-05-20 06:33:05.553', '2026-05-20 06:33:05.553', 0, 'post', NULL),
(262, 16, 24, 0, 'Will Smith foljer dig nu', '{}', '2026-05-20 06:34:35.649', '2026-05-20 06:34:35.649', 0, 'followAccept', NULL),
(263, 24, 16, 0, 'Jack Willingly  is now following you', '{}', '2026-05-20 06:54:29.218', '2026-05-20 06:54:29.218', 0, 'followAccept', NULL),
(264, 24, 16, 0, 'Jack Willingly  liked your vlog', '{\"id\": 1, \"video_url\": \"https://frenly.s3.us-east-1.amazonaws.com/1779256905043_VID_2026-05-20%2011-31-32-1088935205.mp4\", \"thumbnail_url\": null}', '2026-05-20 07:09:03.159', '2026-05-20 07:09:03.159', 0, 'vlog', NULL),
(265, 24, 16, 0, 'Jack Willingly  liked your vlog', '{\"id\": 1, \"video_url\": \"https://frenly.s3.us-east-1.amazonaws.com/1779256905043_VID_2026-05-20%2011-31-32-1088935205.mp4\", \"thumbnail_url\": null}', '2026-05-20 07:09:07.699', '2026-05-20 07:09:07.699', 0, 'vlog', NULL),
(266, 24, 22, 0, 'Jack Willingly  sent you a message', '{\"chatId\": 22}', '2026-05-20 07:10:15.310', '2026-05-20 07:10:15.310', 0, NULL, NULL),
(267, 24, 16, 0, 'Jack Willingly  commented on your vlog', '{\"id\": 1, \"video_url\": \"https://frenly.s3.us-east-1.amazonaws.com/1779256905043_VID_2026-05-20%2011-31-32-1088935205.mp4\", \"thumbnail_url\": null}', '2026-05-20 07:10:35.166', '2026-05-20 07:10:35.166', 0, 'vlog', NULL),
(268, 24, 16, 0, 'Jack Willingly  commented on your vlog', '{\"id\": 1, \"video_url\": \"https://frenly.s3.us-east-1.amazonaws.com/1779256905043_VID_2026-05-20%2011-31-32-1088935205.mp4\", \"thumbnail_url\": null}', '2026-05-20 07:10:52.053', '2026-05-20 07:10:52.053', 0, 'vlog', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Post`
--

CREATE TABLE `Post` (
  `id` int NOT NULL,
  `caption` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userId` int NOT NULL,
  `numberOfLikes` int NOT NULL DEFAULT '0',
  `numberOfShares` int NOT NULL DEFAULT '0',
  `numberOfComments` int NOT NULL DEFAULT '0',
  `numberOfSaves` int NOT NULL DEFAULT '0',
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `fileKey` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Post`
--

INSERT INTO `Post` (`id`, `caption`, `image_url`, `userId`, `numberOfLikes`, `numberOfShares`, `numberOfComments`, `numberOfSaves`, `createdAt`, `updatedAt`, `fileKey`, `location`) VALUES
(1, 'För evigt AIK #aik', 'https://frenly.s3.us-east-1.amazonaws.com/1778422396109_image_cropper_1778422363041.jpg', 1, 2, 1, 1, 0, '2026-05-10 14:13:16.193', '2026-05-10 14:13:16.193', '1778422396109_image_cropper_1778422363041.jpg', 'Svinninge, Sweden'),
(2, 'My Car', 'https://frenly.s3.us-east-1.amazonaws.com/1778758939158_image_cropper_5D4FA650-3884-4206-A306-EEC7368D5580-3587-0000016244E8F1F8.jpg', 17, 4, 2, 0, 2, '2026-05-14 11:42:19.246', '2026-05-14 11:42:19.246', '1778758939158_image_cropper_5D4FA650-3884-4206-A306-EEC7368D5580-3587-0000016244E8F1F8.jpg', 'Indore, Madhya Pradesh, India'),
(3, 'Test image 1', 'https://frenly.s3.us-east-1.amazonaws.com/1779256829056_image_cropper_1779256808185.jpg', 16, 2, 0, 1, 0, '2026-05-20 06:00:29.116', '2026-05-20 06:00:29.116', '1779256829056_image_cropper_1779256808185.jpg', 'Mumbai, Maharashtra, India'),
(4, 'Test Images ', 'https://frenly.s3.us-east-1.amazonaws.com/1779257680711_image_cropper_1779257656290.jpg', 16, 2, 0, 1, 1, '2026-05-20 06:14:40.807', '2026-05-20 06:14:40.807', '1779257680711_image_cropper_1779257656290.jpg', 'Indore, Madhya Pradesh, India'),
(5, 'bdb', 'https://frenly.s3.us-east-1.amazonaws.com/1779257979917_image_cropper_1779257972578.jpg', 16, 0, 0, 0, 0, '2026-05-20 06:19:40.007', '2026-05-20 06:19:40.007', '1779257979917_image_cropper_1779257972578.jpg', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `PrivacyPolicy`
--

CREATE TABLE `PrivacyPolicy` (
  `id` int NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ReactBlog`
--

CREATE TABLE `ReactBlog` (
  `id` int NOT NULL,
  `blogId` int NOT NULL,
  `createByUserId` int NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ReactBlog`
--

INSERT INTO `ReactBlog` (`id`, `blogId`, `createByUserId`, `createdAt`, `updatedAt`) VALUES
(2, 2, 22, '2026-05-20 06:08:07.216', '2026-05-20 06:08:07.216');

-- --------------------------------------------------------

--
-- Table structure for table `ReactBlogComment`
--

CREATE TABLE `ReactBlogComment` (
  `id` int NOT NULL,
  `BlogCommentId` int NOT NULL,
  `createByUserId` int NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ReactCommentPost`
--

CREATE TABLE `ReactCommentPost` (
  `id` int NOT NULL,
  `CommentPostId` int NOT NULL,
  `createByUserId` int NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ReactCommentPost`
--

INSERT INTO `ReactCommentPost` (`id`, `CommentPostId`, `createByUserId`, `createdAt`, `updatedAt`) VALUES
(2, 5, 16, '2026-05-20 06:15:47.167', '2026-05-20 06:15:47.167');

-- --------------------------------------------------------

--
-- Table structure for table `ReactCommentVlog`
--

CREATE TABLE `ReactCommentVlog` (
  `id` int NOT NULL,
  `CommentVlogId` int NOT NULL,
  `createByUserId` int NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ReactCommentVlog`
--

INSERT INTO `ReactCommentVlog` (`id`, `CommentVlogId`, `createByUserId`, `createdAt`, `updatedAt`) VALUES
(1, 1, 24, '2026-05-20 07:10:37.909', '2026-05-20 07:10:37.909');

-- --------------------------------------------------------

--
-- Table structure for table `ReactPost`
--

CREATE TABLE `ReactPost` (
  `id` int NOT NULL,
  `postId` int NOT NULL,
  `createByUserId` int NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ReactPost`
--

INSERT INTO `ReactPost` (`id`, `postId`, `createByUserId`, `createdAt`, `updatedAt`) VALUES
(1, 1, 15, '2026-05-11 18:41:17.848', '2026-05-11 18:41:17.848'),
(3, 2, 16, '2026-05-14 11:43:05.169', '2026-05-14 11:43:05.169'),
(4, 2, 17, '2026-05-14 11:45:16.879', '2026-05-14 11:45:16.879'),
(5, 2, 23, '2026-05-19 10:12:53.425', '2026-05-19 10:12:53.425'),
(7, 1, 24, '2026-05-19 13:19:01.575', '2026-05-19 13:19:01.575'),
(8, 2, 22, '2026-05-19 13:22:24.816', '2026-05-19 13:22:24.816'),
(11, 3, 22, '2026-05-20 06:00:39.854', '2026-05-20 06:00:39.854'),
(12, 4, 22, '2026-05-20 06:15:16.607', '2026-05-20 06:15:16.607'),
(13, 3, 16, '2026-05-20 06:18:05.207', '2026-05-20 06:18:05.207'),
(14, 4, 16, '2026-05-20 06:18:08.490', '2026-05-20 06:18:08.490');

-- --------------------------------------------------------

--
-- Table structure for table `ReactVlog`
--

CREATE TABLE `ReactVlog` (
  `id` int NOT NULL,
  `vlogId` int NOT NULL,
  `createByUserId` int NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ReactVlog`
--

INSERT INTO `ReactVlog` (`id`, `vlogId`, `createByUserId`, `createdAt`, `updatedAt`) VALUES
(1, 1, 22, '2026-05-20 06:02:02.651', '2026-05-20 06:02:02.651'),
(3, 1, 24, '2026-05-20 07:09:07.683', '2026-05-20 07:09:07.683');

-- --------------------------------------------------------

--
-- Table structure for table `ReportBlog`
--

CREATE TABLE `ReportBlog` (
  `id` int NOT NULL,
  `reportedByUserId` int NOT NULL,
  `reportedToBlogId` int NOT NULL,
  `reason` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ReportPost`
--

CREATE TABLE `ReportPost` (
  `id` int NOT NULL,
  `reportedByUserId` int NOT NULL,
  `reportedToPostId` int NOT NULL,
  `reason` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ReportPost`
--

INSERT INTO `ReportPost` (`id`, `reportedByUserId`, `reportedToPostId`, `reason`, `createdAt`, `updatedAt`) VALUES
(1, 24, 1, 'i wanna report ', '2026-05-19 13:20:18.257', '2026-05-19 13:20:18.257');

-- --------------------------------------------------------

--
-- Table structure for table `ReportUser`
--

CREATE TABLE `ReportUser` (
  `id` int NOT NULL,
  `reportedByUserId` int NOT NULL,
  `reportedToUserId` int NOT NULL,
  `reason` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ReportVlog`
--

CREATE TABLE `ReportVlog` (
  `id` int NOT NULL,
  `reportedByUserId` int NOT NULL,
  `reportedToVlogId` int NOT NULL,
  `reason` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `SaveBlog`
--

CREATE TABLE `SaveBlog` (
  `id` int NOT NULL,
  `blogId` int NOT NULL,
  `saveByUserId` int NOT NULL,
  `categoryId` int DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `SavePost`
--

CREATE TABLE `SavePost` (
  `id` int NOT NULL,
  `postId` int NOT NULL,
  `saveByUserId` int NOT NULL,
  `categoryId` int DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `SavePost`
--

INSERT INTO `SavePost` (`id`, `postId`, `saveByUserId`, `categoryId`, `createdAt`, `updatedAt`) VALUES
(2, 2, 24, 1, '2026-05-19 13:22:04.254', '2026-05-19 13:22:04.254'),
(8, 4, 16, 4, '2026-05-20 06:20:49.656', '2026-05-20 06:20:49.656'),
(13, 2, 16, 0, '2026-05-20 07:10:34.813', '2026-05-20 07:10:34.813');

-- --------------------------------------------------------

--
-- Table structure for table `SaveUser`
--

CREATE TABLE `SaveUser` (
  `id` int NOT NULL,
  `userId` int NOT NULL,
  `saveByUserId` int NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `SaveVlog`
--

CREATE TABLE `SaveVlog` (
  `id` int NOT NULL,
  `vlogId` int NOT NULL,
  `saveByUserId` int NOT NULL,
  `categoryId` int DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `TermsAndConditions`
--

CREATE TABLE `TermsAndConditions` (
  `id` int NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `UnreadCount`
--

CREATE TABLE `UnreadCount` (
  `id` int NOT NULL,
  `userId` int NOT NULL,
  `chatId` int NOT NULL,
  `unreadCount` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `UnreadCount`
--

INSERT INTO `UnreadCount` (`id`, `userId`, `chatId`, `unreadCount`) VALUES
(3, 1, 1, 0),
(4, 16, 1, 0),
(5, 17, 1, 4),
(8, 1, 3, 0),
(9, 15, 3, 1),
(10, 1, 4, 0),
(29, 22, 25, 0),
(30, 23, 25, 3),
(31, 15, 4, 1),
(32, 22, 22, 2),
(33, 24, 22, 0),
(34, 16, 31, 1),
(35, 22, 31, 0),
(36, 24, 32, 1),
(37, 16, 32, 0);

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE `User` (
  `id` int NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `personalNumber` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `full_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bio` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `handle` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fcm_token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_photo_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `act_token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isVerified` tinyint(1) NOT NULL DEFAULT '0',
  `numberOfFollower` int NOT NULL DEFAULT '0',
  `numberOfFollowing` int NOT NULL DEFAULT '0',
  `city` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `numberOfSaves` int NOT NULL DEFAULT '0',
  `isOnline` int NOT NULL DEFAULT '0',
  `lastSeen` datetime(3) DEFAULT NULL,
  `isPrivate` tinyint(1) NOT NULL DEFAULT '0',
  `coverfileKey` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fileKey` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `User`
--

INSERT INTO `User` (`id`, `email`, `personalNumber`, `password`, `full_name`, `bio`, `handle`, `fcm_token`, `avatar_url`, `cover_photo_url`, `token`, `act_token`, `isVerified`, `numberOfFollower`, `numberOfFollowing`, `city`, `country`, `createdAt`, `updatedAt`, `numberOfSaves`, `isOnline`, `lastSeen`, `isPrivate`, `coverfileKey`, `fileKey`, `status`) VALUES
(1, 'Viktor.waagaard@gmail.com', '199101220334', '$2b$10$Vwr4ywxuBhjivHXt5gIfB.Kw4qzI/DRLIrekwvVisyLksuAq0/T1C', 'Viktor waagaard', NULL, 'vwaagaard', 'fqlpDV7cQSmg2y6pD2gNt2:APA91bFyKE_RCLUd_OmJvwJYr6PR9R5MClm8Dsnz1y50YK5wtTHqoKvpaRI57i3F-5lNwE79AyHfi-O19HWG0tCVgLHjMAKJuYRW_3YYzbDGocqoubWscfI', NULL, NULL, 'LPa4suqK3AgE9Mqn-4Qbs21QS3I', 'c10364b3866fdfcf7cb7f251eb1c5065', 1, 2, 2, 'Unknown', 'Sweden', '2026-04-29 09:41:12.793', '2026-04-29 09:41:12.793', 0, 0, '2026-05-19 13:33:23.525', 0, NULL, NULL, 1),
(2, 'alickhammer@gmail.com', '199205062418', '$2b$10$53D9h96fZCTeJGAsOhInCumuaJCe2NndyOezysh85DXAdsOiwUdUm', 'André Lickhammer', NULL, 'lickhammer', 'ceCL9oX6Qb22J3VNMc3WWM:APA91bHZNlHXBbpVA0cUzxUq_shXdG0bMe40zYVZEdReLSWSTluPna-GPQVcgC7cSJlTp757DvPWjyzxmgRQ7DnF_Y4gVcGxKZ92H8E_Yh5AIxG0XZmUTuM', NULL, NULL, NULL, '46d596abf6ad32ca377f618c083ac109', 1, 1, 1, 'Unknown', 'Sweden', '2026-04-29 15:23:05.054', '2026-04-29 15:23:05.054', 0, 0, '2026-04-30 21:49:42.177', 0, NULL, NULL, 1),
(15, 'Andreas.sundstrom.edland@hotmail.com', '199801097750', '$2b$10$Wl1O.KwZ/.rNlNk4KjeOEeZ9z6VoOebPbbpB2xMa37W0H7S/0Vbqa', 'Andreas Sundström Edland', 'Nummer 2', 'Andreas.Edland', 'dCPfSIojRExgjtbysPkFJA:APA91bFeLjZFb3dYbqqnHj6Sgxn37Bn_8wxlZKmgJaI9t9bhRFqbhqYglekvDgZyV7176jchuTOBLlwUffRLXLYuKtWO4z5STR_zKKAa4evwX_4GRROS6jI', 'https://frenly.s3.us-east-1.amazonaws.com/1778524989701_avtar.svg', 'https://frenly.s3.us-east-1.amazonaws.com/1778524989765_avtar.svg', NULL, NULL, 1, 1, 1, 'Unknown', 'Sweden', '2026-05-11 18:40:22.722', '2026-05-11 18:40:22.722', 0, 0, '2026-05-15 17:27:29.550', 0, '1778524989765_avtar.svg', '1778524989701_avtar.svg', 1),
(16, 'will@yopmail.com', NULL, '$2b$10$ORAqtC8Dmwa0tJ8g/DJVDOt1rWQ38lq4KC0e3LL1sSOolin8/ZKcS', 'Will Smith', 'I’m Will', 'Will007', 'fTdhagJzS0udDHHOUJ3PiW:APA91bG7cEo-6p-IB7aU7cckm0R5R2yUJ891gz2QoGYqIvL_wrssBGK6n7RK0em7AKrbro1zcDrlpz3YsNGGKzoJuHCWSxFQnBFhEuK6yRvbGs8zTZ520U0', 'https://frenly.s3.us-east-1.amazonaws.com/1779257399459_avtar.svg', 'https://frenly.s3.us-east-1.amazonaws.com/1779257399499_avtar.svg', NULL, NULL, 1, 6, 6, 'Unknown', 'India', '2026-05-12 11:02:41.533', '2026-05-12 11:02:41.533', 0, 1, NULL, 0, '1779257399499_avtar.svg', '1779257399459_avtar.svg', 1),
(17, 'charls@yopmail.com', NULL, '$2b$10$Prli/EjnKD7KbKwHZ/QLx.7feOEDoAFQwtkEqFNEUru3ksjjqTwoy', 'Charls Xavier', NULL, 'Charls11', 'eCe9qSceRYO4pjhFAhDhAc:APA91bH4anu7RaWobq2EQTvmAh0074sgYP_UUp-gkN7atJwbu7DWLeoM142yXFmShjIYNUPPvNqvmlAEFgRrhggNGRxFnp_zASBPvqCYNy7Vbdel02shmlg', NULL, NULL, NULL, NULL, 1, 4, 3, 'Unknown', 'India', '2026-05-12 11:04:10.735', '2026-05-12 11:04:10.735', 0, 0, '2026-05-18 11:38:30.412', 0, NULL, NULL, 1),
(20, 'mohameddddlaaaz@gmail.com', NULL, '$2b$10$6yLy7mmRu.OzrsXIAvr3X.wORuwyYBPQbjscODTQ1YNKuVMHQ2RiO', 'mohamed', NULL, 'lazreg', NULL, NULL, NULL, NULL, '6e828d1c5e089e34a798dc57ed1cb25d', 0, 0, 0, NULL, NULL, '2026-05-16 18:22:49.654', '2026-05-16 18:22:49.654', 0, 0, NULL, 0, NULL, NULL, 1),
(21, 'tony1@yopmail.com', NULL, '$2b$10$oAm.N6g33IG.d9tZn3GNReefVucwSRhrFkbzhgyrtTzyin0vBgDlC', 'Tony Stark ', NULL, 'Tony@1', 'eCe9qSceRYO4pjhFAhDhAc:APA91bH4anu7RaWobq2EQTvmAh0074sgYP_UUp-gkN7atJwbu7DWLeoM142yXFmShjIYNUPPvNqvmlAEFgRrhggNGRxFnp_zASBPvqCYNy7Vbdel02shmlg', NULL, NULL, NULL, NULL, 1, 1, 1, 'Unknown', 'India', '2026-05-18 10:49:37.480', '2026-05-18 10:49:37.480', 0, 0, '2026-05-19 13:28:55.105', 0, NULL, NULL, 1),
(22, 'steve@yopmail.com', NULL, '$2b$10$YFT3K2QtgRAMV2qbPVLulurYfoY5C0kOpzA2axl9uP6WEYB64Li1u', 'Steve Rogger', NULL, 'Steve@1', 'eCe9qSceRYO4pjhFAhDhAc:APA91bH4anu7RaWobq2EQTvmAh0074sgYP_UUp-gkN7atJwbu7DWLeoM142yXFmShjIYNUPPvNqvmlAEFgRrhggNGRxFnp_zASBPvqCYNy7Vbdel02shmlg', NULL, NULL, NULL, NULL, 1, 3, 3, 'Unknown', 'India', '2026-05-18 12:03:35.995', '2026-05-18 12:03:35.995', 0, 0, '2026-05-20 07:10:36.229', 0, NULL, NULL, 1),
(23, 'billa@yopmail.com', NULL, '$2b$10$Nkzsk5bOI3vs9jJukhXEAehgAMoL7tvg/pOvi6kknZMv77s9pwNM2', 'Billa Bahadur ', NULL, 'Billa', 'eCe9qSceRYO4pjhFAhDhAc:APA91bH4anu7RaWobq2EQTvmAh0074sgYP_UUp-gkN7atJwbu7DWLeoM142yXFmShjIYNUPPvNqvmlAEFgRrhggNGRxFnp_zASBPvqCYNy7Vbdel02shmlg', NULL, NULL, NULL, NULL, 1, 1, 1, 'Unknown', 'India', '2026-05-18 12:06:00.654', '2026-05-18 12:06:00.654', 0, 0, '2026-05-19 13:28:55.080', 0, NULL, NULL, 1),
(24, 'jack@yopmail.com', NULL, '$2b$10$YmDcWPAtuaHtyRVI8ZOJ0OdviHJ.b5lEdyO.n/epMTex/.ltv4z.u', 'Jack Willingly ', NULL, 'Jack@00', 'fl7hdZWbp0o1phpuAxAbfJ:APA91bFCoz99Xwemx6B7qqZpgU0kXu2vz39ourAaZMcZyc59GE2OpmThiun2eDDt0QkANuEDOVZG-iIZwDvJK3VweTfqaNVqTi3LpneY3m8NtAnMuHfDaOk', NULL, NULL, NULL, NULL, 1, 4, 5, 'Unknown', 'India', '2026-05-19 06:02:33.454', '2026-05-19 06:02:33.454', 0, 1, NULL, 0, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `UserBlocked`
--

CREATE TABLE `UserBlocked` (
  `id` int NOT NULL,
  `userId` int NOT NULL,
  `userBlockedId` int NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `UserSetting`
--

CREATE TABLE `UserSetting` (
  `id` int NOT NULL,
  `lastSeen` tinyint(1) NOT NULL DEFAULT '1',
  `userId` int NOT NULL,
  `commentsAllowed` tinyint(1) NOT NULL DEFAULT '1',
  `chatNotification` tinyint(1) NOT NULL DEFAULT '1',
  `feedNotification` tinyint(1) NOT NULL DEFAULT '1',
  `language` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sv',
  `hideLikes` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `UserSetting`
--

INSERT INTO `UserSetting` (`id`, `lastSeen`, `userId`, `commentsAllowed`, `chatNotification`, `feedNotification`, `language`, `hideLikes`) VALUES
(1, 1, 1, 1, 1, 1, 'sv', 0),
(2, 1, 2, 1, 1, 1, 'sv', 0),
(8, 1, 15, 1, 1, 1, 'sv', 0),
(9, 0, 16, 1, 1, 1, 'en', 1),
(10, 1, 17, 1, 1, 1, 'en', 0),
(13, 1, 20, 1, 1, 1, 'sv', 0),
(14, 1, 21, 1, 1, 1, 'sv', 0),
(15, 1, 22, 1, 1, 1, 'en', 0),
(16, 1, 23, 1, 1, 1, 'sv', 0),
(17, 1, 24, 1, 1, 1, 'sv', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ViewVlog`
--

CREATE TABLE `ViewVlog` (
  `id` int NOT NULL,
  `vlogId` int NOT NULL,
  `viewByUserId` int NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ViewVlog`
--

INSERT INTO `ViewVlog` (`id`, `vlogId`, `viewByUserId`, `createdAt`, `updatedAt`) VALUES
(1, 1, 22, '2026-05-20 06:01:54.423', '2026-05-20 06:01:54.423'),
(2, 1, 24, '2026-05-20 07:09:01.066', '2026-05-20 07:09:01.066');

-- --------------------------------------------------------

--
-- Table structure for table `Vlog`
--

CREATE TABLE `Vlog` (
  `id` int NOT NULL,
  `title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_url` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `thumbnail_url` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `userId` int NOT NULL,
  `numberOfLikes` int NOT NULL DEFAULT '0',
  `numberOfShares` int NOT NULL DEFAULT '0',
  `numberOfComments` int NOT NULL DEFAULT '0',
  `numberOfSaves` int NOT NULL DEFAULT '0',
  `numberOfViews` int NOT NULL DEFAULT '0',
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `fileKey` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `thumbnailfileKey` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `location` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Vlog`
--

INSERT INTO `Vlog` (`id`, `title`, `description`, `video_url`, `thumbnail_url`, `userId`, `numberOfLikes`, `numberOfShares`, `numberOfComments`, `numberOfSaves`, `numberOfViews`, `createdAt`, `updatedAt`, `fileKey`, `thumbnailfileKey`, `location`) VALUES
(1, 'Video ', 'Test video 1', 'https://frenly.s3.us-east-1.amazonaws.com/1779256905043_VID_2026-05-20%2011-31-32-1088935205.mp4', NULL, 16, 2, 1, 2, 0, 2, '2026-05-20 06:01:45.184', '2026-05-20 06:01:45.184', '1779256905043_VID_2026-05-20 11-31-32-1088935205.mp4', NULL, 'Jim Corbett National Park, Uttarakhand, India');

-- --------------------------------------------------------

--
-- Table structure for table `_participants`
--

CREATE TABLE `_participants` (
  `A` int NOT NULL,
  `B` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `_participants`
--

INSERT INTO `_participants` (`A`, `B`) VALUES
(3, 1),
(4, 1),
(26, 1),
(27, 1),
(26, 2),
(27, 2),
(3, 15),
(4, 15),
(1, 16),
(6, 16),
(28, 16),
(29, 16),
(30, 16),
(31, 16),
(32, 16),
(1, 17),
(5, 17),
(28, 21),
(29, 21),
(22, 22),
(25, 22),
(30, 22),
(31, 22),
(25, 23),
(22, 24),
(32, 24);

-- --------------------------------------------------------

--
-- Table structure for table `_prisma_migrations`
--

CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `checksum` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `logs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `applied_steps_count` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ActiveChat`
--
ALTER TABLE `ActiveChat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ActiveChat_userId_fkey` (`userId`),
  ADD KEY `ActiveChat_chatId_fkey` (`chatId`);

--
-- Indexes for table `Admin`
--
ALTER TABLE `Admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Admin_email_key` (`email`),
  ADD UNIQUE KEY `Admin_phone_no_key` (`phone_no`);

--
-- Indexes for table `Blog`
--
ALTER TABLE `Blog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Blog_userId_fkey` (`userId`);

--
-- Indexes for table `BlogComment`
--
ALTER TABLE `BlogComment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `BlogComment_blogId_fkey` (`blogId`),
  ADD KEY `BlogComment_createByUserId_fkey` (`createByUserId`);

--
-- Indexes for table `Category`
--
ALTER TABLE `Category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Category_createByUserId_fkey` (`createByUserId`);

--
-- Indexes for table `Chat`
--
ALTER TABLE `Chat`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Chat_lastMessageId_key` (`lastMessageId`);

--
-- Indexes for table `ChatMessage`
--
ALTER TABLE `ChatMessage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ChatMessage_senderId_fkey` (`senderId`),
  ADD KEY `ChatMessage_chatId_fkey` (`chatId`);

--
-- Indexes for table `CommentPost`
--
ALTER TABLE `CommentPost`
  ADD PRIMARY KEY (`id`),
  ADD KEY `CommentPost_postId_fkey` (`postId`),
  ADD KEY `CommentPost_createByUserId_fkey` (`createByUserId`);

--
-- Indexes for table `CommentVlog`
--
ALTER TABLE `CommentVlog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `CommentVlog_vlogId_fkey` (`vlogId`),
  ADD KEY `CommentVlog_createByUserId_fkey` (`createByUserId`);

--
-- Indexes for table `Follow`
--
ALTER TABLE `Follow`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Follow_followerId_fkey` (`followerId`),
  ADD KEY `Follow_followingId_fkey` (`followingId`);

--
-- Indexes for table `Notification`
--
ALTER TABLE `Notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Notification_byUserId_fkey` (`byUserId`),
  ADD KEY `Notification_byAdminId_fkey` (`byAdminId`);

--
-- Indexes for table `Post`
--
ALTER TABLE `Post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Post_userId_fkey` (`userId`);

--
-- Indexes for table `PrivacyPolicy`
--
ALTER TABLE `PrivacyPolicy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ReactBlog`
--
ALTER TABLE `ReactBlog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ReactBlog_blogId_fkey` (`blogId`),
  ADD KEY `ReactBlog_createByUserId_fkey` (`createByUserId`);

--
-- Indexes for table `ReactBlogComment`
--
ALTER TABLE `ReactBlogComment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ReactBlogComment_BlogCommentId_fkey` (`BlogCommentId`),
  ADD KEY `ReactBlogComment_createByUserId_fkey` (`createByUserId`);

--
-- Indexes for table `ReactCommentPost`
--
ALTER TABLE `ReactCommentPost`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ReactCommentPost_CommentPostId_fkey` (`CommentPostId`),
  ADD KEY `ReactCommentPost_createByUserId_fkey` (`createByUserId`);

--
-- Indexes for table `ReactCommentVlog`
--
ALTER TABLE `ReactCommentVlog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ReactCommentVlog_CommentVlogId_fkey` (`CommentVlogId`),
  ADD KEY `ReactCommentVlog_createByUserId_fkey` (`createByUserId`);

--
-- Indexes for table `ReactPost`
--
ALTER TABLE `ReactPost`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ReactPost_postId_fkey` (`postId`),
  ADD KEY `ReactPost_createByUserId_fkey` (`createByUserId`);

--
-- Indexes for table `ReactVlog`
--
ALTER TABLE `ReactVlog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ReactVlog_vlogId_fkey` (`vlogId`),
  ADD KEY `ReactVlog_createByUserId_fkey` (`createByUserId`);

--
-- Indexes for table `ReportBlog`
--
ALTER TABLE `ReportBlog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ReportBlog_reportedToBlogId_fkey` (`reportedToBlogId`),
  ADD KEY `ReportBlog_reportedByUserId_fkey` (`reportedByUserId`);

--
-- Indexes for table `ReportPost`
--
ALTER TABLE `ReportPost`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ReportPost_reportedToPostId_fkey` (`reportedToPostId`),
  ADD KEY `ReportPost_reportedByUserId_fkey` (`reportedByUserId`);

--
-- Indexes for table `ReportUser`
--
ALTER TABLE `ReportUser`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ReportUser_reportedToUserId_fkey` (`reportedToUserId`);

--
-- Indexes for table `ReportVlog`
--
ALTER TABLE `ReportVlog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ReportVlog_reportedToVlogId_fkey` (`reportedToVlogId`),
  ADD KEY `ReportVlog_reportedByUserId_fkey` (`reportedByUserId`);

--
-- Indexes for table `SaveBlog`
--
ALTER TABLE `SaveBlog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `SaveBlog_blogId_fkey` (`blogId`),
  ADD KEY `SaveBlog_saveByUserId_fkey` (`saveByUserId`);

--
-- Indexes for table `SavePost`
--
ALTER TABLE `SavePost`
  ADD PRIMARY KEY (`id`),
  ADD KEY `SavePost_postId_fkey` (`postId`),
  ADD KEY `SavePost_saveByUserId_fkey` (`saveByUserId`);

--
-- Indexes for table `SaveUser`
--
ALTER TABLE `SaveUser`
  ADD PRIMARY KEY (`id`),
  ADD KEY `SaveUser_userId_fkey` (`userId`),
  ADD KEY `SaveUser_saveByUserId_fkey` (`saveByUserId`);

--
-- Indexes for table `SaveVlog`
--
ALTER TABLE `SaveVlog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `SaveVlog_vlogId_fkey` (`vlogId`),
  ADD KEY `SaveVlog_saveByUserId_fkey` (`saveByUserId`);

--
-- Indexes for table `TermsAndConditions`
--
ALTER TABLE `TermsAndConditions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `UnreadCount`
--
ALTER TABLE `UnreadCount`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userId_chatId_unique` (`userId`,`chatId`),
  ADD KEY `UnreadCount_chatId_fkey` (`chatId`);

--
-- Indexes for table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `User_email_key` (`email`),
  ADD UNIQUE KEY `User_handle_key` (`handle`),
  ADD UNIQUE KEY `User_personalNumber_key` (`personalNumber`);

--
-- Indexes for table `UserBlocked`
--
ALTER TABLE `UserBlocked`
  ADD PRIMARY KEY (`id`),
  ADD KEY `UserBlocked_userBlockedId_fkey` (`userBlockedId`);

--
-- Indexes for table `UserSetting`
--
ALTER TABLE `UserSetting`
  ADD PRIMARY KEY (`id`),
  ADD KEY `UserSetting_userId_fkey` (`userId`);

--
-- Indexes for table `ViewVlog`
--
ALTER TABLE `ViewVlog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ViewVlog_vlogId_fkey` (`vlogId`),
  ADD KEY `ViewVlog_viewByUserId_fkey` (`viewByUserId`);

--
-- Indexes for table `Vlog`
--
ALTER TABLE `Vlog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Vlog_userId_fkey` (`userId`);

--
-- Indexes for table `_participants`
--
ALTER TABLE `_participants`
  ADD UNIQUE KEY `_participants_AB_unique` (`A`,`B`),
  ADD KEY `_participants_B_index` (`B`);

--
-- Indexes for table `_prisma_migrations`
--
ALTER TABLE `_prisma_migrations`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ActiveChat`
--
ALTER TABLE `ActiveChat`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Admin`
--
ALTER TABLE `Admin`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Blog`
--
ALTER TABLE `Blog`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `BlogComment`
--
ALTER TABLE `BlogComment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Category`
--
ALTER TABLE `Category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Chat`
--
ALTER TABLE `Chat`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `ChatMessage`
--
ALTER TABLE `ChatMessage`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=228;

--
-- AUTO_INCREMENT for table `CommentPost`
--
ALTER TABLE `CommentPost`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `CommentVlog`
--
ALTER TABLE `CommentVlog`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Follow`
--
ALTER TABLE `Follow`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `Notification`
--
ALTER TABLE `Notification`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=269;

--
-- AUTO_INCREMENT for table `Post`
--
ALTER TABLE `Post`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `PrivacyPolicy`
--
ALTER TABLE `PrivacyPolicy`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ReactBlog`
--
ALTER TABLE `ReactBlog`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ReactBlogComment`
--
ALTER TABLE `ReactBlogComment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ReactCommentPost`
--
ALTER TABLE `ReactCommentPost`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ReactCommentVlog`
--
ALTER TABLE `ReactCommentVlog`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ReactPost`
--
ALTER TABLE `ReactPost`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `ReactVlog`
--
ALTER TABLE `ReactVlog`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ReportBlog`
--
ALTER TABLE `ReportBlog`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ReportPost`
--
ALTER TABLE `ReportPost`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ReportUser`
--
ALTER TABLE `ReportUser`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ReportVlog`
--
ALTER TABLE `ReportVlog`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `SaveBlog`
--
ALTER TABLE `SaveBlog`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `SavePost`
--
ALTER TABLE `SavePost`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `SaveUser`
--
ALTER TABLE `SaveUser`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `SaveVlog`
--
ALTER TABLE `SaveVlog`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `TermsAndConditions`
--
ALTER TABLE `TermsAndConditions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `UnreadCount`
--
ALTER TABLE `UnreadCount`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `User`
--
ALTER TABLE `User`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `UserBlocked`
--
ALTER TABLE `UserBlocked`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `UserSetting`
--
ALTER TABLE `UserSetting`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `ViewVlog`
--
ALTER TABLE `ViewVlog`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Vlog`
--
ALTER TABLE `Vlog`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ActiveChat`
--
ALTER TABLE `ActiveChat`
  ADD CONSTRAINT `ActiveChat_chatId_fkey` FOREIGN KEY (`chatId`) REFERENCES `Chat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ActiveChat_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Blog`
--
ALTER TABLE `Blog`
  ADD CONSTRAINT `Blog_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `BlogComment`
--
ALTER TABLE `BlogComment`
  ADD CONSTRAINT `BlogComment_blogId_fkey` FOREIGN KEY (`blogId`) REFERENCES `Blog` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `BlogComment_createByUserId_fkey` FOREIGN KEY (`createByUserId`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Category`
--
ALTER TABLE `Category`
  ADD CONSTRAINT `Category_createByUserId_fkey` FOREIGN KEY (`createByUserId`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Chat`
--
ALTER TABLE `Chat`
  ADD CONSTRAINT `Chat_lastMessageId_fkey` FOREIGN KEY (`lastMessageId`) REFERENCES `ChatMessage` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `ChatMessage`
--
ALTER TABLE `ChatMessage`
  ADD CONSTRAINT `ChatMessage_chatId_fkey` FOREIGN KEY (`chatId`) REFERENCES `Chat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ChatMessage_senderId_fkey` FOREIGN KEY (`senderId`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `CommentPost`
--
ALTER TABLE `CommentPost`
  ADD CONSTRAINT `CommentPost_createByUserId_fkey` FOREIGN KEY (`createByUserId`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `CommentPost_postId_fkey` FOREIGN KEY (`postId`) REFERENCES `Post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `CommentVlog`
--
ALTER TABLE `CommentVlog`
  ADD CONSTRAINT `CommentVlog_createByUserId_fkey` FOREIGN KEY (`createByUserId`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `CommentVlog_vlogId_fkey` FOREIGN KEY (`vlogId`) REFERENCES `Vlog` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Follow`
--
ALTER TABLE `Follow`
  ADD CONSTRAINT `Follow_followerId_fkey` FOREIGN KEY (`followerId`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Follow_followingId_fkey` FOREIGN KEY (`followingId`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Notification`
--
ALTER TABLE `Notification`
  ADD CONSTRAINT `Notification_byAdminId_fkey` FOREIGN KEY (`byAdminId`) REFERENCES `Admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Notification_byUserId_fkey` FOREIGN KEY (`byUserId`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Post`
--
ALTER TABLE `Post`
  ADD CONSTRAINT `Post_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ReactBlog`
--
ALTER TABLE `ReactBlog`
  ADD CONSTRAINT `ReactBlog_blogId_fkey` FOREIGN KEY (`blogId`) REFERENCES `Blog` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ReactBlog_createByUserId_fkey` FOREIGN KEY (`createByUserId`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ReactBlogComment`
--
ALTER TABLE `ReactBlogComment`
  ADD CONSTRAINT `ReactBlogComment_BlogCommentId_fkey` FOREIGN KEY (`BlogCommentId`) REFERENCES `BlogComment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ReactBlogComment_createByUserId_fkey` FOREIGN KEY (`createByUserId`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ReactCommentPost`
--
ALTER TABLE `ReactCommentPost`
  ADD CONSTRAINT `ReactCommentPost_CommentPostId_fkey` FOREIGN KEY (`CommentPostId`) REFERENCES `CommentPost` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ReactCommentPost_createByUserId_fkey` FOREIGN KEY (`createByUserId`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ReactCommentVlog`
--
ALTER TABLE `ReactCommentVlog`
  ADD CONSTRAINT `ReactCommentVlog_CommentVlogId_fkey` FOREIGN KEY (`CommentVlogId`) REFERENCES `CommentVlog` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ReactCommentVlog_createByUserId_fkey` FOREIGN KEY (`createByUserId`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ReactPost`
--
ALTER TABLE `ReactPost`
  ADD CONSTRAINT `ReactPost_createByUserId_fkey` FOREIGN KEY (`createByUserId`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ReactPost_postId_fkey` FOREIGN KEY (`postId`) REFERENCES `Post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ReactVlog`
--
ALTER TABLE `ReactVlog`
  ADD CONSTRAINT `ReactVlog_createByUserId_fkey` FOREIGN KEY (`createByUserId`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ReactVlog_vlogId_fkey` FOREIGN KEY (`vlogId`) REFERENCES `Vlog` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ReportBlog`
--
ALTER TABLE `ReportBlog`
  ADD CONSTRAINT `ReportBlog_reportedByUserId_fkey` FOREIGN KEY (`reportedByUserId`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ReportBlog_reportedToBlogId_fkey` FOREIGN KEY (`reportedToBlogId`) REFERENCES `Blog` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ReportPost`
--
ALTER TABLE `ReportPost`
  ADD CONSTRAINT `ReportPost_reportedByUserId_fkey` FOREIGN KEY (`reportedByUserId`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ReportPost_reportedToPostId_fkey` FOREIGN KEY (`reportedToPostId`) REFERENCES `Post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ReportUser`
--
ALTER TABLE `ReportUser`
  ADD CONSTRAINT `ReportUser_reportedToUserId_fkey` FOREIGN KEY (`reportedToUserId`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ReportVlog`
--
ALTER TABLE `ReportVlog`
  ADD CONSTRAINT `ReportVlog_reportedByUserId_fkey` FOREIGN KEY (`reportedByUserId`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ReportVlog_reportedToVlogId_fkey` FOREIGN KEY (`reportedToVlogId`) REFERENCES `Vlog` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `SaveBlog`
--
ALTER TABLE `SaveBlog`
  ADD CONSTRAINT `SaveBlog_blogId_fkey` FOREIGN KEY (`blogId`) REFERENCES `Blog` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `SaveBlog_saveByUserId_fkey` FOREIGN KEY (`saveByUserId`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `SavePost`
--
ALTER TABLE `SavePost`
  ADD CONSTRAINT `SavePost_postId_fkey` FOREIGN KEY (`postId`) REFERENCES `Post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `SavePost_saveByUserId_fkey` FOREIGN KEY (`saveByUserId`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `SaveUser`
--
ALTER TABLE `SaveUser`
  ADD CONSTRAINT `SaveUser_saveByUserId_fkey` FOREIGN KEY (`saveByUserId`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `SaveUser_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `SaveVlog`
--
ALTER TABLE `SaveVlog`
  ADD CONSTRAINT `SaveVlog_saveByUserId_fkey` FOREIGN KEY (`saveByUserId`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `SaveVlog_vlogId_fkey` FOREIGN KEY (`vlogId`) REFERENCES `Vlog` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `UnreadCount`
--
ALTER TABLE `UnreadCount`
  ADD CONSTRAINT `UnreadCount_chatId_fkey` FOREIGN KEY (`chatId`) REFERENCES `Chat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `UnreadCount_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `UserBlocked`
--
ALTER TABLE `UserBlocked`
  ADD CONSTRAINT `UserBlocked_userBlockedId_fkey` FOREIGN KEY (`userBlockedId`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `UserSetting`
--
ALTER TABLE `UserSetting`
  ADD CONSTRAINT `UserSetting_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ViewVlog`
--
ALTER TABLE `ViewVlog`
  ADD CONSTRAINT `ViewVlog_viewByUserId_fkey` FOREIGN KEY (`viewByUserId`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ViewVlog_vlogId_fkey` FOREIGN KEY (`vlogId`) REFERENCES `Vlog` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Vlog`
--
ALTER TABLE `Vlog`
  ADD CONSTRAINT `Vlog_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `_participants`
--
ALTER TABLE `_participants`
  ADD CONSTRAINT `_participants_A_fkey` FOREIGN KEY (`A`) REFERENCES `Chat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_participants_B_fkey` FOREIGN KEY (`B`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
