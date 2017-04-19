-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 19, 2017 at 04:50 PM
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
(19, 'admin', 'admin', 'e9e7bc6d99654544ec10ce7dc5f04084dd2973277b1b779e2cbaccfb0aa1dfb9', 'Sydney', 'Cruz', 'icetera06@gmail.com', 1, NULL, '2017-04-18'),
(20, 'employee', 'emp1', 'b347b3de01cca7dda84387d84917d1dcb0661283c59b81964b552f1ee75f29f4', 'Jasteen', 'Reyes', 'jasteen.reyes@uap.asia', 0, NULL, '2017-04-18'),
(21, 'employee', 'emp2', '55aded98cba9c30053e9a03c97f24bc68f20e3a56cb83c9bc6821ca50ef3fabd', 'Samuel', 'Partosa', 'sydneyrenei.cruz@uap.asia', 1, NULL, '2017-04-18'),
(22, 'employee', 'emp2', '9357708851ad97c02bfb1eb3792478e9a9ad8f420c661228b78c60af766d284b', 'Samuel', 'Partosa', 'samuel.partosa@gmail.com', 1, NULL, '2017-04-18'),
(23, 'employee', 'emp3', 'e9e7bc6d99654544ec10ce7dc5f04084dd2973277b1b779e2cbaccfb0aa1dfb9', 'Sydney', 'Cruz', 'sydneyrenei.cruz@uap.asia', 1, NULL, '2017-04-18'),
(25, 'client', 'client', 'b347b3de01cca7dda84387d84917d1dcb0661283c59b81964b552f1ee75f29f4', 'Client', 'Test', 'teragothice06@gmail.com', 1, NULL, '2017-04-18'),
(26, 'client', 'client2', '47e75faa97d8e1a8aabac371d96f8dd518a28a18307c2271ee17801a8092eca0', 'Sydney', 'Cruz', 'sydneyrenei@uap.asia', 1, NULL, '2017-04-19'),
(27, 'employee', 'emp4', 'b347b3de01cca7dda84387d84917d1dcb0661283c59b81964b552f1ee75f29f4', 'Samuel', 'Partosa', 'samuel@gmail.com', 1, NULL, '2017-04-19'),
(28, 'employee', 'emp4', 'b347b3de01cca7dda84387d84917d1dcb0661283c59b81964b552f1ee75f29f4', 'Samuel', 'Partosa', 'samuel@gmail.com', 1, NULL, '2017-04-19');

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
(4, 19);

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
(10, 25, 2, '09166030695'),
(11, 26, 1, '09166030695');

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
(2, 'Indra', 'Ortigas', '1234552'),
(3, 'Meralco', 'Davao', '1234567'),
(4, 'Indra', 'Davao', '1234567'),
(5, 'Indra', 'Pasig', '1234567'),
(6, 'Meralco', 'Pasig', '1234567');

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
(1, 1, '17 Pres. Laurel St.', '', 'NCR', 'Pasig', 1609, 'Philippines'),
(2, 2, '20 Loop', '', 'NCR', 'Pasig', 1239, 'Philippines'),
(3, 3, '17 Pres. Laurel St.', 'Rosario', 'NCR', 'Pasig', 1609, 'Philippines'),
(4, 4, '16 Pres. Laurel St. Lifehomes', 'Rosario', 'NCR', 'Pasig', 1609, 'Philippines'),
(5, 5, '17 Pres. Laurel St. Lifehomes subd.', 'Rosario', 'NCR', 'Pasig', 1609, 'Philippines'),
(6, 6, '123', '', 'f', 'r', 123, 'ph');

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
(7, 20, 3),
(8, 21, 2),
(9, 22, 2),
(10, 23, 3),
(11, 27, 1),
(12, 28, 1);

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
  `invoice_status` enum('Pending','Approved','Rejected','Cancelled','Expired','Delivery','In Process') NOT NULL,
  `invoice_date` date NOT NULL,
  `verified` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`invoice_id`, `client_id`, `pm_id`, `tracking_id`, `total_amount`, `invoice_status`, `invoice_date`, `verified`) VALUES
(12, 10, 1, 'TSPPIINVREQ-TXNHH12', 1500, 'Cancelled', '2017-04-18', 0),
(13, 10, 1, 'TSPPIINVREQ-3422013', 15000, 'Expired', '2017-04-19', 0),
(14, 10, 1, 'TSPPIINVREQ-2868314', 15000, 'Delivery', '2017-04-19', 1),
(15, 10, 1, 'TSPPIINVREQ-9633315', 199902, 'Rejected', '2017-04-19', 1),
(16, 10, 1, 'TSPPIINVREQ-9957816', 57000, 'Delivery', '2017-04-19', 1),
(17, 10, 2, 'TSPPIINVREQ-8222517', 230000, 'Rejected', '2017-04-19', 1),
(18, 10, 1, 'TSPPIINVREQ-9001018', 199902, 'Pending', '2017-04-19', 0),
(19, 11, 1, 'TSPPIINVREQ-0425119', 66500, 'Pending', '2017-04-19', 0),
(20, 11, 1, 'TSPPIINVREQ-6909920', 72000, 'Pending', '2017-04-19', 0),
(21, 11, 1, 'TSPPIINVREQ-5059921', 15000, 'Pending', '2017-04-19', 0),
(22, 11, 1, 'TSPPIINVREQ-6696222', 230000, 'Pending', '2017-04-19', 0);

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
(18, 12, 4, 3),
(19, 13, 4, 30),
(20, 14, 2, 300),
(21, 15, 5, 300),
(22, 16, 8, 300),
(23, 17, 7, 1000),
(24, 18, 5, 300),
(25, 19, 8, 350),
(26, 20, 8, 300),
(27, 20, 2, 300),
(28, 21, 2, 300),
(29, 22, 7, 1000);

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
(1, 'Cash on Delivery', 0),
(2, 'Credit Card', 0),
(3, 'Debit Card', 0);

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
(1, 'Inventory Officer', 0, 1, 0, 1),
(2, 'Sales Officer', 0, 0, 1, 1),
(3, 'Vice President', 1, 0, 0, 1);

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
(1, 1, 'Laser Copy Paper', 'SIZE:                A4, LETTER & LEGAL\r\nPACKING:	500 Sheets/ream\r\nSUBSTANCE:	Sub 20 (70 gsm)\r\n	                Sub 24 ( 80 gsm)\r\n', 400, 1, 1),
(2, 2, 'Letter Envelope', '6 3/4XX & No.10xx', 50, 199, 1),
(3, 5, 'Piggy', 'Fresh from makati', 666, 4000, 1),
(4, 2, 'Expanding Envelope', 'LEGAL', 500, 30, 1),
(5, 2, 'Peel & Seal Envelope', 'Legal', 666.34, 3324, 1),
(6, 2, 'Bill Envelope', 'With or Without Window\r\nCustomized', 543, 705, 1),
(7, 3, 'Thermal Roll Paper', 'Customized', 230, 493, 1),
(8, 4, 'File Folder', 'Letter and Legal\r\n11PTS and 14PTS', 190, 50, 1),
(9, 5, 'Bookpaper', 'Imported Bookpaper', 324, 1500, 1),
(10, 5, 'Claycoated Board', 'Claycoated board', 433, 3233, 1),
(11, 5, 'Foldcote Board', 'Foldcote board', 434, 4000, 1),
(12, 5, 'Coated Two Side Paper (C2S)', 'Coated two side paper', 555, 430, 1),
(13, 5, 'Matte Coated', 'Matte coated', 230, 1598, 1),
(14, 6, 'Statement of Account', 'Customized corporate statement of account.\r\nIn Roll, Fanfold, and Cutsheet.', 3000, 1200, 1),
(15, 1, 'test', 'Test Product', 25, 45, 1),
(16, 1, 'test 1', 'Test product - removed blob in product db', 50, 100, 1),
(17, 1, 'test', 'heg', 50, 10000, 0);

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
(1, 'Meditation', 'Don''t judge, just meditate'),
(2, 'Cramming', 'That''s what students are best for');

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
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`client_id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`company_id`);

--
-- Indexes for table `company_address`
--
ALTER TABLE `company_address`
  ADD PRIMARY KEY (`address_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_id`);

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
  ADD PRIMARY KEY (`product_id`);

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
  MODIFY `account_num` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `client_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `company_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `company_address`
--
ALTER TABLE `company_address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `invoice_item`
--
ALTER TABLE `invoice_item`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `invoice_pm`
--
ALTER TABLE `invoice_pm`
  MODIFY `pm_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `job_position`
--
ALTER TABLE `job_position`
  MODIFY `job_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
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
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
