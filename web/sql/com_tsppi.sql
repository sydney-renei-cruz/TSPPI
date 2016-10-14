-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 29, 2016 at 03:50 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `com_tsppi`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `account_num` int(10) NOT NULL,
  `username` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `account_type_id` int(10) NOT NULL,
  `account_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`account_num`, `username`, `password`, `first_name`, `last_name`, `email`, `account_type_id`, `account_status`) VALUES
(1, 'admin', 'e9e7bc6d99654544ec10ce7dc5f04084dd2973277b1b779e2cbaccfb0aa1dfb9', 'Sydney', 'Cruz', 'sydney_renei.cruz@uap.asia', 2, 1),
(3, 'admin2', 'e321f61779936151500e569355addf81ed0f9743b868833c23bc8abec1598093', 'admin', 'password', 'admin@yahoo.com', 2, 1),
(4, 'client', '47e75faa97d8e1a8aabac371d96f8dd518a28a18307c2271ee17801a8092eca0', 'client', 'password', 'client@yahoo.com', 3, 1),
(5, 'employee1', '55aded98cba9c30053e9a03c97f24bc68f20e3a56cb83c9bc6821ca50ef3fabd', 'employee', 'password', 'employee@yahoo.com', 1, 1),
(6, 'employee2', 'e9e7bc6d99654544ec10ce7dc5f04084dd2973277b1b779e2cbaccfb0aa1dfb9', 'employee2', 'password', 'employee2@yahoo.com', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(10) NOT NULL,
  `account_num` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `account_num`) VALUES
(5, 1),
(6, 3);

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `client_id` int(10) NOT NULL,
  `account_num` int(10) NOT NULL,
  `mobile` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `telephone` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`client_id`, `account_num`, `mobile`, `telephone`, `address`) VALUES
(1, 4, '09166030695', '1234567', 'Hello');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `account_num` int(10) NOT NULL,
  `employee_id` int(10) NOT NULL,
  `job_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`account_num`, `employee_id`, `job_id`) VALUES
(5, 1, 1),
(6, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `job_position`
--

CREATE TABLE `job_position` (
  `job_id` int(10) NOT NULL,
  `job_type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `job_position`
--

INSERT INTO `job_position` (`job_id`, `job_type`) VALUES
(1, 'Vice President'),
(2, 'Inventory Officer');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `product_detail` varchar(255) NOT NULL,
  `msrp` float NOT NULL,
  `stock` int(11) NOT NULL,
  `for_sale` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `category_id`, `product_name`, `product_detail`, `msrp`, `stock`, `for_sale`) VALUES
(12, 1, 'Laser Copy Paper', 'SIZE: A4, LETTER & LEGAL\r\nPACKING: 500 Sheets/ream\r\nSUBSTANCE: Sub 20 (70 gsm) or Sub 24 ( 80 gsm)\r\n\r\n', 20, 20, 0),
(13, 2, 'Letter Envelope', '6 3/4XX & No.10xx', 20, 1, 0),
(14, 2, 'Document Envelope', 'Letter and Legal\r\n150# & 200#', 20, 1, 0),
(15, 2, 'Expanding Envelope', 'LEGAL\r\n', 20, 1, 0),
(16, 2, 'Peel & Seal Envelope', 'Legal', 20, 1, 0),
(17, 2, 'Bill Envelope  ', 'With or without window\r\nCustomized', 20, 1, 0),
(18, 3, 'Customized', 'Customized Thermal Paper', 20, 1, 0),
(19, 4, 'File Folder', 'LETTER & LEGAL\r\n11 PTS& 14 PTS\r\n', 20, 1, 0),
(20, 5, 'book paper imported', 'Book Paper', 20, 1, 0),
(21, 5, 'Claycoated Board', 'claycoated board', 20, 1, 0),
(22, 5, 'Matt Coated', 'matt coated', 20, 1, 0),
(23, 6, 'Statement of Account', 'Corporate Customized in Roll, fanfold, and cut sheet', 20, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

CREATE TABLE `product_category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_category`
--

INSERT INTO `product_category` (`category_id`, `category_name`) VALUES
(1, 'Cutsize Paper'),
(2, 'Envelopes'),
(3, 'Thermal Rolls'),
(4, 'Folders'),
(5, 'Printing and Packaging Paper'),
(6, 'Computer Forms');

-- --------------------------------------------------------

--
-- Table structure for table `type_of_account`
--

CREATE TABLE `type_of_account` (
  `account_type_id` int(10) NOT NULL,
  `account_type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `type_of_account`
--

INSERT INTO `type_of_account` (`account_type_id`, `account_type`) VALUES
(1, 'employee'),
(2, 'admin'),
(3, 'client');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`account_num`),
  ADD KEY `account_type_id` (`account_type_id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD KEY `account_num` (`account_num`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`client_id`),
  ADD KEY `account_num` (`account_num`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`),
  ADD KEY `account_num` (`account_num`),
  ADD KEY `job_id` (`job_id`);

--
-- Indexes for table `job_position`
--
ALTER TABLE `job_position`
  ADD PRIMARY KEY (`job_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `fk_category_id` (`category_id`);

--
-- Indexes for table `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `type_of_account`
--
ALTER TABLE `type_of_account`
  ADD PRIMARY KEY (`account_type_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `account_num` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `client_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `employee_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `job_position`
--
ALTER TABLE `job_position`
  MODIFY `job_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `product_category`
--
ALTER TABLE `product_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `type_of_account`
--
ALTER TABLE `type_of_account`
  MODIFY `account_type_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`account_num`) REFERENCES `account` (`account_num`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`account_num`) REFERENCES `account` (`account_num`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_category_id` FOREIGN KEY (`category_id`) REFERENCES `product_category` (`category_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
