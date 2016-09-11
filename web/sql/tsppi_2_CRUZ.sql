-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 11, 2016 at 05:23 PM
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
  `mobile` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `telephone` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `account_type_id` int(10) NOT NULL,
  `account_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`account_num`, `username`, `password`, `first_name`, `last_name`, `email`, `mobile`, `telephone`, `address`, `account_type_id`, `account_status`) VALUES
(77, 'admin', 'b347b3de01cca7dda84387d84917d1dcb0661283c59b81964b552f1ee75f29f4', 'Sydney', 'Cruz', 'sydney-renei.rey.cruz@hpe.com', '09166030695', '1234567', 'Pasig city', 2, 1),
(78, 'rosalie_cruz', 'd9e351515aafc2cc7d368d4a43a5327b68e5661a9478c30cb528405a361760fe', 'rosalie', 'arciga', 'alie_cms@yahoo.com', '0917800540', '1234568', 'dsadsa', 1, 1),
(79, 'employee2', '55aded98cba9c30053e9a03c97f24bc68f20e3a56cb83c9bc6821ca50ef3fabd', 'Roda', 'Cruz', 'roda@yahoo.com', '09166030695', '1234567', 'Paco Manila', 1, 1),
(80, 'client', '9357708851ad97c02bfb1eb3792478e9a9ad8f420c661228b78c60af766d284b', 'Sydney', 'Cruz', 'sydneyrenei.cruz@uap.asia', '09166030695', '1234567', 'Pasig city', 3, 1),
(81, 'Tera06', '8b1948fbd8461c22aa9b712e971f60b866674ea4016f2533de69ce49497bb991', 'sydney', 'cruz', 'sydneyrenei.cruz@uap.asia', '09166030695', '1234567', 'Pasig', 3, 1),
(82, 'client2', '47e75faa97d8e1a8aabac371d96f8dd518a28a18307c2271ee17801a8092eca0', 'client', '2', 'cl@yahoo.com', '09166030695', '1234567', 'dsa', 3, 1);

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
(8, 77);

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `client_id` int(10) NOT NULL,
  `account_num` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`client_id`, `account_num`) VALUES
(1, 80),
(2, 81),
(3, 82);

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
(78, 17, 1),
(79, 18, 2);

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
  `product_name` varchar(50) NOT NULL,
  `product_detail` varchar(255) NOT NULL,
  `msrp` float NOT NULL,
  `stock` int(11) NOT NULL,
  `for_sale` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `product_detail`, `msrp`, `stock`, `for_sale`) VALUES
(5, 'product1', 'dsadas', 5.5, 2, 0),
(6, 'product2', 'dsa', 5.5, 1, 0);

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
  ADD PRIMARY KEY (`product_id`);

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
  MODIFY `account_num` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;
--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `client_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `employee_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `job_position`
--
ALTER TABLE `job_position`
  MODIFY `job_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
