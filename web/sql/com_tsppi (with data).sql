-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 25, 2017 at 07:41 AM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 7.0.5

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
  `account_num` int(11) NOT NULL,
  `account_type` enum('admin','employee','client') NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `account_status` tinyint(1) NOT NULL,
  `forgot` varchar(100) DEFAULT NULL,
  `time_registered` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`account_num`, `account_type`, `username`, `password`, `first_name`, `last_name`, `email`, `account_status`, `forgot`, `time_registered`) VALUES
(1, 'admin', 'admin', 'e9e7bc6d99654544ec10ce7dc5f04084dd2973277b1b779e2cbaccfb0aa1dfb9', 'tera', 'cruz', 'sydneyrenei.cruz@uap.asia', 1, NULL, '2017-04-22'),
(2, 'employee', 'emp1', '3b8acb3590e0674f5718c4fe2fdc7d2a6bbb8b1187b115f65f27623d5541c287', 'Sydney', 'Cruz', 'sydneyrenei.cruz@uap.asia', 1, 'd5a4e3cb298ade121809490aa0866781491a117b60b7ec2f5637d10e1a1fb266', '2017-04-22'),
(3, 'employee', 'emp2', 'b347b3de01cca7dda84387d84917d1dcb0661283c59b81964b552f1ee75f29f4', 'John', 'Doe', 'sydneyrenei.cruz@uap.asia', 1, 'd5a4e3cb298ade121809490aa0866781491a117b60b7ec2f5637d10e1a1fb266', '2017-04-22'),
(4, 'employee', 'emp3', 'a80b5ba47535e717973684736e6c308a59e41f4eb8188471bf6cd7c0b9b24a22', 'Justin', 'Triviani', 'sydneyrenei.cruz@uap.asia', 1, NULL, '2017-04-22'),
(5, 'client', 'client', 'b347b3de01cca7dda84387d84917d1dcb0661283c59b81964b552f1ee75f29f4', 'Sydney', 'Cruz', 'sydneyrenei.cruz@uap.asia', 1, NULL, '2017-04-22'),
(6, 'client', 'Loki_Odinson', 'e9e7bc6d99654544ec10ce7dc5f04084dd2973277b1b779e2cbaccfb0aa1dfb9', 'Loki', 'Odinson', 'loki.odinson@gmail.com', 1, NULL, '2017-04-23'),
(7, 'client', 'hilopack', 'b347b3de01cca7dda84387d84917d1dcb0661283c59b81964b552f1ee75f29f4', 'Vita', 'Maxima', 'vita.maxima@gmail.com', 0, NULL, '2017-04-25');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `account_num` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `account_num`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `client_id` int(11) NOT NULL,
  `account_num` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `mobile` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`client_id`, `account_num`, `company_id`, `mobile`) VALUES
(1, 5, 1, '09166030695'),
(2, 6, 2, '09166030695'),
(3, 7, 2, '09178005411');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `company_id` int(11) NOT NULL,
  `company_name` varchar(50) NOT NULL,
  `company_branch` varchar(50) NOT NULL,
  `company_telephone` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`company_id`, `company_name`, `company_branch`, `company_telephone`) VALUES
(1, 'Meralco', 'Ortigas', '1234567'),
(2, 'Indra', 'Ortigas', '1234567');

-- --------------------------------------------------------

--
-- Table structure for table `company_address`
--

CREATE TABLE `company_address` (
  `address_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `street_line1` varchar(255) NOT NULL,
  `street_line2` varchar(255) DEFAULT NULL,
  `spr` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `postal_code` int(11) NOT NULL,
  `country` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company_address`
--

INSERT INTO `company_address` (`address_id`, `company_id`, `street_line1`, `street_line2`, `spr`, `city`, `postal_code`, `country`) VALUES
(1, 1, '1', '2', '3', 'pasig', 1609, 'Philippines'),
(2, 2, '17 pres. laurel', 'gfdmg', 'NCR', 'Pasig', 1609, 'Philippines');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL,
  `account_num` int(11) NOT NULL,
  `job_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employee_id`, `account_num`, `job_id`) VALUES
(1, 2, 1),
(2, 3, 3),
(3, 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `pm_id` int(11) NOT NULL,
  `tracking_id` varchar(100) NOT NULL,
  `total_amount` float NOT NULL,
  `invoice_status` enum('Pending','Approved','Rejected','Canceled','Expired','Delivery','In Process') DEFAULT NULL,
  `invoice_date` date NOT NULL,
  `verified` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`invoice_id`, `client_id`, `pm_id`, `tracking_id`, `total_amount`, `invoice_status`, `invoice_date`, `verified`) VALUES
(1, 1, 1, 'TSPPIINVREQ-553771', 15000, 'Canceled', '2017-04-23', 0),
(2, 1, 1, 'TSPPIINVREQ-980812', 91998, 'Delivery', '2017-04-23', 1),
(3, 2, 1, 'TSPPIINVREQ-067753', 23000, 'Delivery', '2017-04-23', 1);

-- --------------------------------------------------------

--
-- Table structure for table `invoice_item`
--

CREATE TABLE `invoice_item` (
  `item_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `item_quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice_item`
--

INSERT INTO `invoice_item` (`item_id`, `invoice_id`, `product_id`, `item_quantity`) VALUES
(1, 1, 2, 300),
(2, 2, 11, 999),
(3, 2, 4, 300),
(4, 3, 5, 1000),
(5, 3, 7, 300),
(6, 3, 9, 300);

-- --------------------------------------------------------

--
-- Table structure for table `invoice_pm`
--

CREATE TABLE `invoice_pm` (
  `pm_id` int(11) NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `show_method` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice_pm`
--

INSERT INTO `invoice_pm` (`pm_id`, `payment_method`, `show_method`) VALUES
(1, 'Cash on Delivery', 0);

-- --------------------------------------------------------

--
-- Table structure for table `job_position`
--

CREATE TABLE `job_position` (
  `job_id` int(11) NOT NULL,
  `job_type` varchar(50) NOT NULL,
  `management_score` tinyint(1) NOT NULL,
  `inventory_score` tinyint(1) NOT NULL,
  `sales_score` tinyint(1) NOT NULL,
  `show_job` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `job_position`
--

INSERT INTO `job_position` (`job_id`, `job_type`, `management_score`, `inventory_score`, `sales_score`, `show_job`) VALUES
(1, 'Vice President', 1, 0, 0, 1),
(2, 'Inventory Officer', 0, 1, 0, 1),
(3, 'Sales Officer', 0, 0, 1, 1);

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
(1, 1, 'Laser Copy Paper', 'SIZE	                A4, LETTER & LEGAL\r\nPACKING	        500 Sheets/ream\r\nSUBSTANCE	Sub 20 (70 gsm)\r\n	                Sub 24 ( 80 gsm)', 50.2, 300, 1),
(2, 2, 'letter envelope', '6 3/4XX & No.10xx', 50, 1000, 1),
(3, 2, 'Ang pao', 'Chinese Envelope\r\n\r\nThis item is per piece.', 2, 1000, 1),
(4, 6, 'Computer Stationery', 'Custom Printed in Roll Form (Max. Diameter 50")\r\n\r\nThis item is sold per box.', 300, 0, 1),
(5, 2, 'Booklet Envelope', 'This item is sold per piece.', 5, 0, 1),
(6, 2, 'Customized Envelope', 'Please contact us for the customization process.\r\n\r\nThis item is sold per piece.', 5, 1000, 1),
(7, 5, 'Uncoated Wood Free Paper', 'Made for printing.\r\n\r\nThis item is sold per piece.', 30, 700, 1),
(8, 5, 'Matte Coated Paper', 'Made for printing\r\n\r\nThis item is sold per piece.', 50, 1000, 1),
(9, 6, 'Panfold Computer Stationery', 'This itme is sold per bundle.', 30, 700, 1),
(10, 4, 'File Folder', 'This item is sold per piece.', 5, 1000, 1),
(11, 2, 'Bill Envelope', 'Can be customized, either with or without window.\r\n\r\nThis item is sold per piece.', 2, 1, 1),
(12, 5, 'Clay-coated Board', 'This item is sold per piece.', 30, 1000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

CREATE TABLE `product_category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(50) NOT NULL,
  `show_category` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_category`
--

INSERT INTO `product_category` (`category_id`, `category_name`, `show_category`) VALUES
(1, 'Cutsize Paper', 0),
(2, 'Envelopes', 0),
(3, 'Thermal Rolls', 0),
(4, 'Folders', 0),
(5, 'Printing and Packaging Paper', 0),
(6, 'Computer Forms', 0);

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `service_id` int(11) NOT NULL,
  `service_name` varchar(50) NOT NULL,
  `service_description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`service_id`, `service_name`, `service_description`) VALUES
(1, 'Slitting', 'Customized size'),
(2, 'Paper Production', 'If you want to know more about how we create the listed items in products page, kindly inquire for this service.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`account_num`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD KEY `admin_account` (`account_num`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`client_id`),
  ADD KEY `client_account` (`account_num`),
  ADD KEY `client_company` (`company_id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`company_id`);

--
-- Indexes for table `company_address`
--
ALTER TABLE `company_address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `mailing_address_id` (`company_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`),
  ADD KEY `employee_account` (`account_num`),
  ADD KEY `employee_position` (`job_id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_id`),
  ADD KEY `client_invoice` (`client_id`),
  ADD KEY `invoice_payment_method` (`pm_id`);

--
-- Indexes for table `invoice_item`
--
ALTER TABLE `invoice_item`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `invoice_pm`
--
ALTER TABLE `invoice_pm`
  ADD PRIMARY KEY (`pm_id`);

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
  ADD KEY `product_category_id` (`category_id`);

--
-- Indexes for table `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`service_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `account_num` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `client_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `company_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `company_address`
--
ALTER TABLE `company_address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `invoice_item`
--
ALTER TABLE `invoice_item`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `invoice_pm`
--
ALTER TABLE `invoice_pm`
  MODIFY `pm_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `job_position`
--
ALTER TABLE `job_position`
  MODIFY `job_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `product_category`
--
ALTER TABLE `product_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`account_num`) REFERENCES `account` (`account_num`) ON DELETE CASCADE;

--
-- Constraints for table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_account` FOREIGN KEY (`account_num`) REFERENCES `account` (`account_num`) ON DELETE CASCADE,
  ADD CONSTRAINT `client_company` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`);

--
-- Constraints for table `company_address`
--
ALTER TABLE `company_address`
  ADD CONSTRAINT `mailing_address_id` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`) ON DELETE CASCADE;

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_account` FOREIGN KEY (`account_num`) REFERENCES `account` (`account_num`) ON DELETE CASCADE,
  ADD CONSTRAINT `employee_position` FOREIGN KEY (`job_id`) REFERENCES `job_position` (`job_id`);

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `client_invoice` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `invoice_payment_method` FOREIGN KEY (`pm_id`) REFERENCES `invoice_pm` (`pm_id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_category_id` FOREIGN KEY (`category_id`) REFERENCES `product_category` (`category_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
