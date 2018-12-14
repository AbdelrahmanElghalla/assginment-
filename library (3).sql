-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 14, 2018 at 09:31 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `FullName` varchar(100) DEFAULT NULL,
  `AdminEmail` varchar(120) DEFAULT NULL,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `FullName`, `AdminEmail`, `UserName`, `Password`) VALUES
(1, 'Abdelrahman Elghalla', 'abdoo.osama2013@gmail.com', 'admin', 'e10adc3949ba59abbe56e057f20f883e');

-- --------------------------------------------------------

--
-- Table structure for table `edtion`
--

CREATE TABLE `edtion` (
  `edtion_id` int(11) NOT NULL,
  `edtion_name` text,
  `tblbooks_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `format`
--

CREATE TABLE `format` (
  `format_id` int(11) NOT NULL,
  `format_name` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblauthors`
--

CREATE TABLE `tblauthors` (
  `id` int(11) NOT NULL,
  `AuthorName` varchar(159) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdationDate` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblauthors`
--

INSERT INTO `tblauthors` (`id`, `AuthorName`, `creationDate`, `UpdationDate`) VALUES
(13, 'Aymen2', '2018-12-13 19:36:51', NULL),
(14, 'Ahmed Elsaid', '2018-12-13 22:04:27', NULL),
(15, 'fsod', '2018-12-14 11:19:27', NULL),
(16, 'yasser', '2018-12-14 11:56:00', NULL),
(17, 'yasser2', '2018-12-14 12:04:05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblauthors_has_tblbooks`
--

CREATE TABLE `tblauthors_has_tblbooks` (
  `tblauthors_id` int(11) NOT NULL,
  `tblbooks_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblbooks`
--

CREATE TABLE `tblbooks` (
  `id` int(11) NOT NULL,
  `BookName` varchar(255) DEFAULT NULL,
  `CatId` int(11) DEFAULT NULL,
  `AuthorId` int(11) DEFAULT NULL,
  `ISBNNumber` int(11) DEFAULT NULL,
  `BookPrice` int(11) DEFAULT NULL,
  `date_publish` date DEFAULT NULL,
  `UpdationDate` timestamp NULL DEFAULT NULL,
  `number_of_pages` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblbooks`
--

INSERT INTO `tblbooks` (`id`, `BookName`, `CatId`, `AuthorId`, `ISBNNumber`, `BookPrice`, `date_publish`, `UpdationDate`, `number_of_pages`) VALUES
(8, 'way to be guzel', 13, 13, 132364597, 52368, NULL, NULL, 0),
(9, 'Way to sharmta', 14, 14, 0, 2147483647, NULL, NULL, 0),
(10, 'asfsf', 13, 14, 1234569, 20, NULL, NULL, 0),
(11, '556', 13, 15, 123645, 50, NULL, NULL, 0),
(12, 'sido', 14, 13, 1234569, 20, NULL, NULL, 105),
(13, '123554', 14, 13, 12365, 50, NULL, NULL, 105);

-- --------------------------------------------------------

--
-- Table structure for table `tblbooks_has_format`
--

CREATE TABLE `tblbooks_has_format` (
  `tblbooks_id` int(11) NOT NULL,
  `format_format_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblcategory`
--

CREATE TABLE `tblcategory` (
  `id` int(11) NOT NULL,
  `CategoryName` varchar(150) DEFAULT NULL,
  `Status` int(1) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdationDate` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcategory`
--

INSERT INTO `tblcategory` (`id`, `CategoryName`, `Status`, `CreationDate`, `UpdationDate`) VALUES
(13, 'math', 1, '2018-12-13 19:36:27', NULL),
(14, 'Action', 1, '2018-12-13 22:04:11', NULL),
(15, 'ols', 1, '2018-12-14 11:19:16', NULL),
(16, 'movesk5', 1, '2018-12-14 11:55:31', NULL),
(18, 'saysat', 1, '2018-12-14 12:14:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblcategory_has_tblbooks`
--

CREATE TABLE `tblcategory_has_tblbooks` (
  `tblcategory_id` int(11) NOT NULL,
  `tblbooks_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `edtion`
--
ALTER TABLE `edtion`
  ADD PRIMARY KEY (`edtion_id`,`tblbooks_id`),
  ADD KEY `fk_edtion_tblbooks1_idx` (`tblbooks_id`);

--
-- Indexes for table `format`
--
ALTER TABLE `format`
  ADD PRIMARY KEY (`format_id`);

--
-- Indexes for table `tblauthors`
--
ALTER TABLE `tblauthors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblauthors_has_tblbooks`
--
ALTER TABLE `tblauthors_has_tblbooks`
  ADD PRIMARY KEY (`tblauthors_id`,`tblbooks_id`),
  ADD KEY `fk_tblauthors_has_tblbooks_tblbooks1_idx` (`tblbooks_id`),
  ADD KEY `fk_tblauthors_has_tblbooks_tblauthors1_idx` (`tblauthors_id`);

--
-- Indexes for table `tblbooks`
--
ALTER TABLE `tblbooks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblbooks_has_format`
--
ALTER TABLE `tblbooks_has_format`
  ADD PRIMARY KEY (`tblbooks_id`,`format_format_id`),
  ADD KEY `fk_tblbooks_has_format_format1_idx` (`format_format_id`),
  ADD KEY `fk_tblbooks_has_format_tblbooks1_idx` (`tblbooks_id`);

--
-- Indexes for table `tblcategory`
--
ALTER TABLE `tblcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcategory_has_tblbooks`
--
ALTER TABLE `tblcategory_has_tblbooks`
  ADD PRIMARY KEY (`tblcategory_id`,`tblbooks_id`),
  ADD KEY `fk_tblcategory_has_tblbooks_tblbooks1_idx` (`tblbooks_id`),
  ADD KEY `fk_tblcategory_has_tblbooks_tblcategory_idx` (`tblcategory_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `edtion`
--
ALTER TABLE `edtion`
  MODIFY `edtion_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `format`
--
ALTER TABLE `format`
  MODIFY `format_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblauthors`
--
ALTER TABLE `tblauthors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tblbooks`
--
ALTER TABLE `tblbooks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tblcategory`
--
ALTER TABLE `tblcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `edtion`
--
ALTER TABLE `edtion`
  ADD CONSTRAINT `fk_edtion_tblbooks1` FOREIGN KEY (`tblbooks_id`) REFERENCES `tblbooks` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tblauthors_has_tblbooks`
--
ALTER TABLE `tblauthors_has_tblbooks`
  ADD CONSTRAINT `fk_tblauthors_has_tblbooks_tblauthors1` FOREIGN KEY (`tblauthors_id`) REFERENCES `tblauthors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tblauthors_has_tblbooks_tblbooks1` FOREIGN KEY (`tblbooks_id`) REFERENCES `tblbooks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tblbooks_has_format`
--
ALTER TABLE `tblbooks_has_format`
  ADD CONSTRAINT `fk_tblbooks_has_format_format1` FOREIGN KEY (`format_format_id`) REFERENCES `format` (`format_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tblbooks_has_format_tblbooks1` FOREIGN KEY (`tblbooks_id`) REFERENCES `tblbooks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tblcategory_has_tblbooks`
--
ALTER TABLE `tblcategory_has_tblbooks`
  ADD CONSTRAINT `fk_tblcategory_has_tblbooks_tblbooks1` FOREIGN KEY (`tblbooks_id`) REFERENCES `tblbooks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tblcategory_has_tblbooks_tblcategory` FOREIGN KEY (`tblcategory_id`) REFERENCES `tblcategory` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
