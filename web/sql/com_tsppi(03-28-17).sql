-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 28, 2017 at 03:54 PM
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
  `time_registered` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`account_num`, `account_type`, `username`, `password`, `first_name`, `last_name`, `email`, `account_status`, `time_registered`) VALUES
(1, 'client', 'client', 'e9e7bc6d99654544ec10ce7dc5f04084dd2973277b1b779e2cbaccfb0aa1dfb9', 'Sydney', 'Cruz', 'teragothice06@gmail.com', 1, '2017-03-26'),
(2, 'admin', 'admin', 'a80b5ba47535e717973684736e6c308a59e41f4eb8188471bf6cd7c0b9b24a22', 'Sydney', 'Cruz', 'san_chief06@yahoo.com', 1, '2017-03-26'),
(3, 'employee', 'emp1', '88681771bb9e95d83930b21898a739b10e8e3baac2fe42ee24492af691aec379', 'Alie', 'Cruz', 'sydneyrenei.cruz@uap.asia', 1, '2017-03-26'),
(4, 'employee', 'emp2', '88681771bb9e95d83930b21898a739b10e8e3baac2fe42ee24492af691aec379', 'Vincent', 'Arciga', 'teragoth06@gmail.com', 1, '2017-03-26'),
(5, 'employee', 'emp3', 'b347b3de01cca7dda84387d84917d1dcb0661283c59b81964b552f1ee75f29f4', 'Cris', 'Arciga', 'jasteen.reyes@uap.asia', 1, '2017-03-26'),
(6, 'client', 'teragothice06', 'e321f61779936151500e569355addf81ed0f9743b868833c23bc8abec1598093', 'Sydney', 'Cruz', 'sydney@uap.asia', 1, '2017-03-27'),
(7, 'client', 'test_account', 'a80b5ba47535e717973684736e6c308a59e41f4eb8188471bf6cd7c0b9b24a22', 'Sydney', 'Cruz', 'sydnefy@uap.asia', 0, '2017-03-27');

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
(1, 2);

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
(1, 1, 1, '09166030695'),
(2, 6, 1, '09166030695'),
(3, 7, 1, '09166030695');

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
(4, 'Indra', 'Davao', '1234567');

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
(4, 4, '16 Pres. Laurel St. Lifehomes', 'Rosario', 'NCR', 'Pasig', 1609, 'Philippines');

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
(1, 3, 2),
(2, 4, 1),
(3, 5, 3);

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `pm_id` int(11) NOT NULL,
  `total_amount` float NOT NULL,
  `invoice_status` enum('Pending','Approved','Rejected','Cancelled','Expired','Delivery','In Process') NOT NULL,
  `invoice_date` date NOT NULL,
  `verified` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`invoice_id`, `client_id`, `pm_id`, `total_amount`, `invoice_status`, `invoice_date`, `verified`) VALUES
(1, 1, 1, 84500, 'Cancelled', '2017-03-23', 0),
(2, 1, 1, 15000, 'Rejected', '2017-03-23', 1),
(3, 1, 1, 15500, 'Pending', '2017-03-23', 0),
(4, 1, 1, 500, 'Pending', '2017-03-23', 0),
(5, 1, 1, 8000, 'Pending', '2017-03-23', 0),
(6, 1, 1, 800, 'Pending', '2017-03-23', 0),
(7, 1, 1, 23800, 'Pending', '2017-03-23', 0),
(8, 1, 1, 8000, 'Pending', '2017-03-23', 0),
(9, 1, 1, 8000, 'Pending', '2017-03-23', 0);

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
(1, 1, 15, 20),
(2, 1, 2, 300),
(3, 1, 7, 300),
(4, 2, 2, 300),
(5, 3, 15, 20),
(6, 3, 2, 300),
(7, 4, 15, 20),
(8, 5, 1, 20),
(9, 6, 1, 2),
(10, 7, 1, 22),
(11, 7, 2, 300),
(12, 8, 1, 20),
(13, 9, 1, 20);

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
(1, 1, 'Laser Copy Paper', 'SIZE:                A4, LETTER & LEGAL\r\nPACKING:	500 Sheets/ream\r\nSUBSTANCE:	Sub 20 (70 gsm)\r\n	                Sub 24 ( 80 gsm)\r\n', 400, 10, 1),
(2, 2, 'Letter Envelope', '6 3/4XX & No.10xx', 50, 1299, 1),
(3, 5, 'Piggy', 'Fresh from makati', 666, 4000, 1),
(4, 2, 'Expanding Envelope', 'LEGAL', 500, 360, 1),
(5, 2, 'Peel & Seal Envelope', 'Legal', 666.34, 3624, 1),
(6, 2, 'Bill Envelope', 'With or Without Window\r\nCustomized', 543, 1005, 1),
(7, 3, 'Thermal Roll Paper', 'Customized', 230, 1493, 1),
(8, 4, 'File Folder', 'Letter and Legal\r\n11PTS and 14PTS', 190, 1000, 1),
(9, 5, 'Bookpaper', 'Imported Bookpaper', 324, 1500, 1),
(10, 5, 'Claycoated Board', 'Claycoated board', 433, 3233, 1),
(11, 5, 'Foldcote Board', 'Foldcote board', 434, 4000, 1),
(12, 5, 'Coated Two Side Paper (C2S)', 'Coated two side paper', 555, 430, 1),
(13, 5, 'Matte Coated', 'Matte coated', 230, 1598, 1),
(14, 6, 'Statement of Account', 'Customized corporate statement of account.\r\nIn Roll, Fanfold, and Cutsheet.', 3000, 1200, 1),
(15, 1, 'test', 'Test Product', 25, 45, 1),
(16, 1, 'test 1', 'Test product - removed blob in product db', 50, 100, 1);

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
  MODIFY `company_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `company_address`
--
ALTER TABLE `company_address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `invoice_item`
--
ALTER TABLE `invoice_item`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
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
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
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
