-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 02, 2017 at 03:31 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `indianrail`
--

-- --------------------------------------------------------

--
-- Table structure for table `chartsheet`
--

CREATE TABLE `chartsheet` (
  `cht_id` int(11) NOT NULL,
  `pkg_id` varchar(20) DEFAULT NULL,
  `destination_station_code` varchar(20) DEFAULT NULL,
  `train_no` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `chartsheet`
--

INSERT INTO `chartsheet` (`cht_id`, `pkg_id`, `destination_station_code`, `train_no`) VALUES
(1, 'ADI14032017001', 'BCT', 12010);

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `cid` int(11) NOT NULL,
  `cname` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`cid`, `cname`, `address`, `phone`, `email`) VALUES
(312, 'Sherlock', '221-B, Baker Street', 9773007248, 'sherlock@gmail.com'),
(313, 'Watson', '221-C, Caker Street', 9773919892, 'watson@gmail.com'),
(314, 'Sherlock', '221-B, Baker Street', 9773007248, 'sherlock@gmail.com'),
(315, 'Watson', '221-C, Caker Street', 9773919892, 'watson@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `lost_package`
--

CREATE TABLE `lost_package` (
  `lost_id` int(11) NOT NULL,
  `pkg_id` varchar(20) DEFAULT NULL,
  `lost_station` varchar(20) DEFAULT NULL,
  `source_station` varchar(20) DEFAULT NULL,
  `dest_station` varchar(20) DEFAULT NULL,
  `scale_transport_type` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lost_package`
--

INSERT INTO `lost_package` (`lost_id`, `pkg_id`, `lost_station`, `source_station`, `dest_station`, `scale_transport_type`) VALUES
(19, '1LTT201704021705161', 'ADI', 'LTT', 'BSB', 'L');

-- --------------------------------------------------------

--
-- Table structure for table `package_details`
--

CREATE TABLE `package_details` (
  `pkg_id` varchar(20) NOT NULL,
  `sender_cid` int(11) DEFAULT NULL,
  `receiver_cid` int(11) DEFAULT NULL,
  `src_station_code` varchar(20) DEFAULT NULL,
  `dest_station_code` varchar(20) DEFAULT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby_staffid` int(11) DEFAULT NULL,
  `payment_amount` int(11) DEFAULT NULL,
  `pkg_weight_grams` int(11) DEFAULT NULL,
  `pkg_type` varchar(20) DEFAULT NULL,
  `scale_transport_type` varchar(20) DEFAULT NULL,
  `via_destination` varchar(1000) NOT NULL,
  `compartment` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `package_details`
--

INSERT INTO `package_details` (`pkg_id`, `sender_cid`, `receiver_cid`, `src_station_code`, `dest_station_code`, `creation_date`, `createdby_staffid`, `payment_amount`, `pkg_weight_grams`, `pkg_type`, `scale_transport_type`, `via_destination`, `compartment`) VALUES
('1BDTS201704020515351', 292, 293, 'BDTS', 'UDZ', '2017-04-01 23:45:35', 1, 250, 4000, 'fragile', 'R', ',UDZ,VAPI,UDZ', NULL),
('1BDTS201704020843031', 296, 297, 'BDTS', 'UDZ', '2017-04-02 10:36:33', 1, 50, 50, 'fragile', 'R', ',UDZ', 'Front_LR'),
('1BSL201704020310251', 284, 285, 'BSL', 'PUNE', '2017-04-01 21:42:32', 1, 50, 1400, 'fragile', 'R', ',PUNE', 'Front_LR'),
('1CMY201704020653331', 294, 295, 'CMY', 'UDZ', '2017-04-02 01:23:33', 1, 100, 1400, 'fragile', 'P', ',UDZ', NULL),
('1DR201704020321441', 286, 287, 'DR', 'SWV', '2017-04-01 21:54:43', 1, 50, 1400, 'fragile', 'P', ',SWV', 'Front_LR'),
('1LTT201704021704171', 310, 311, 'LTT', 'BSB', '2017-04-02 11:34:17', 1, 50, 1400, 'fragile', 'L', ',BSB', NULL),
('1LTT201704021705161', 312, 313, 'LTT', 'BSB', '2017-04-02 11:37:14', 1, 50, 1400, 'fragile', 'L', ',BSB', 'Front_LR'),
('1LTT201704021826271', 314, 315, 'LTT', 'BSB', '2017-04-02 13:08:13', 1, 50, 1400, 'fragile', 'P', ',BSB', 'Front_LR'),
('AII201704012037471', 266, 267, 'AII', 'NDLS', '2017-04-01 15:07:47', 1, 50, 1000, 'fragile', 'L', ',NDLS', ''),
('BCT201704011706321', 248, 249, 'BCT', 'PBR', '2017-04-01 11:36:32', 1, 50, 1000, 'fragile', 'R ', ',PBR', '');

-- --------------------------------------------------------

--
-- Table structure for table `package_location`
--

CREATE TABLE `package_location` (
  `pl_id` int(11) NOT NULL,
  `location` varchar(20) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `Scheduled_arr` varchar(50) NOT NULL,
  `pkm_id` int(11) DEFAULT NULL,
  `delay` varchar(50) NOT NULL,
  `station_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `package_location`
--

INSERT INTO `package_location` (`pl_id`, `location`, `time`, `Scheduled_arr`, `pkm_id`, `delay`, `station_name`) VALUES
(103, 'KKB', '2017-04-02 15:50:00', '2017-04-02 00:35:00', 119, 'No delay', 'KARAK BEL'),
(104, 'KKB', '2017-04-02 15:50:00', '2017-04-02 00:35:00', 119, 'No delay', 'KARAK BEL'),
(105, 'KKB', '2017-04-02 15:50:00', '2017-04-02 00:35:00', 119, 'No delay', 'KARAK BEL'),
(106, 'KKB', '2017-04-02 15:50:00', '2017-04-02 00:35:00', 119, 'No delay', 'KARAK BEL'),
(107, 'KKB', '2017-04-02 15:50:00', '2017-04-02 00:35:00', 119, 'No delay', 'KARAK BEL'),
(108, 'KKB', '2017-04-02 15:50:00', '2017-04-02 00:35:00', 119, 'No delay', 'KARAK BEL'),
(109, 'KKB', '2017-04-02 15:50:00', '2017-04-02 00:35:00', 119, 'No delay', 'KARAK BEL'),
(110, 'MML', '2017-04-02 16:43:00', '2017-04-02 00:35:00', 120, 'No delay', 'MADAN MAHAL'),
(111, 'MML', '2017-04-02 16:43:00', '2017-04-02 00:35:00', 120, 'No delay', 'MADAN MAHAL'),
(112, 'MML', '2017-04-02 16:43:00', '2017-04-02 00:35:00', 120, 'No delay', 'MADAN MAHAL'),
(113, 'MML', '2017-04-02 16:43:00', '2017-04-02 00:35:00', 120, 'No delay', 'MADAN MAHAL'),
(114, 'MML', '2017-04-02 16:43:00', '2017-04-02 00:35:00', 120, 'No delay', 'MADAN MAHAL'),
(115, 'MML', '2017-04-02 16:43:00', '2017-04-02 00:35:00', 120, 'No delay', 'MADAN MAHAL'),
(116, 'MML', '2017-04-02 16:43:00', '2017-04-02 00:35:00', 120, 'No delay', 'MADAN MAHAL'),
(117, 'MML', '2017-04-02 16:43:00', '2017-04-02 00:35:00', 120, 'No delay', 'MADAN MAHAL'),
(118, 'MML', '2017-04-02 16:43:00', '2017-04-02 00:35:00', 120, 'No delay', 'MADAN MAHAL'),
(119, 'MML', '2017-04-02 16:43:00', '2017-04-02 00:35:00', 120, 'No delay', 'MADAN MAHAL'),
(120, 'JBP', '2017-04-02 17:19:00', '2017-04-02 00:35:00', 120, 'Delayed by 49 Min.', 'JABALPUR'),
(121, 'SHR', '2017-04-02 18:31:00', '2017-04-02 00:35:00', 121, 'No delay', 'SIHORA ROAD'),
(122, 'SHR', '2017-04-02 18:31:00', '2017-04-02 00:35:00', 121, 'No delay', 'SIHORA ROAD'),
(123, 'SHR', '2017-04-02 18:31:00', '2017-04-02 00:35:00', 121, 'No delay', 'SIHORA ROAD'),
(124, 'SHR', '2017-04-02 18:31:00', '2017-04-02 00:35:00', 121, 'No delay', 'SIHORA ROAD'),
(125, 'SHR', '2017-04-02 18:31:00', '2017-04-02 00:35:00', 121, 'No delay', 'SIHORA ROAD');

-- --------------------------------------------------------

--
-- Table structure for table `package_train_mapping`
--

CREATE TABLE `package_train_mapping` (
  `pkm_id` int(11) NOT NULL,
  `pkg_id` varchar(20) DEFAULT NULL,
  `train_no` int(11) DEFAULT NULL,
  `load_unload_status` varchar(1) DEFAULT NULL,
  `load_time` datetime DEFAULT NULL,
  `unload_time` datetime DEFAULT NULL,
  `load_station` varchar(10) DEFAULT NULL,
  `unload_station` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `package_train_mapping`
--

INSERT INTO `package_train_mapping` (`pkm_id`, `pkg_id`, `train_no`, `load_unload_status`, `load_time`, `unload_time`, `load_station`, `unload_station`) VALUES
(90, 'BCT201704012020241', NULL, 'P', NULL, NULL, NULL, NULL),
(101, '1BSL201704020310251', 11025, 'U', '2017-04-02 03:12:32', '2017-04-02 03:15:27', '', ''),
(119, '1LTT201704021601241', 12167, 'U', '2017-04-02 16:15:27', '2017-04-02 16:18:15', '', ''),
(120, '1LTT201704021705161', 12167, 'U', '2017-04-02 17:07:40', '2017-04-02 17:51:27', 'LTT', 'BSB'),
(121, '1LTT201704021826271', 12167, 'L', '2017-04-02 18:38:14', NULL, 'LTT', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staff_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) CHARACTER SET latin2 COLLATE latin2_czech_cs NOT NULL,
  `staff` varchar(20) NOT NULL,
  `staff_station_code` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staff_id`, `username`, `password`, `staff`, `staff_station_code`) VALUES
(1, 'shraddha', 'shraddha12345', 'receptionist', 'BH'),
(2, 'puja', 'puja12345', 'receptionist', 'ADI'),
(3, 'amit', 'amit12345', 'receptionist', 'JP'),
(4, 'ajay', 'ajay12345', 'receptionist', 'DLI'),
(5, 'rahul', 'rahul12345', 'receptionist', 'CDG'),
(6, 'rakesh', 'rakesh12345', 'loader_unloader', 'BCT'),
(7, 'john', 'john12345', 'loader_unloader', 'ADI'),
(8, 'eric', 'eric12345', 'loader_unloader', 'JP'),
(9, 'robert', 'robert12345', 'loader_unloader', 'DLI'),
(11, 'thompson', 'thompson12345', 'admin', 'BH'),
(12, 'bruce', 'bruce12345', 'receptionist', 'DJ');

-- --------------------------------------------------------

--
-- Table structure for table `stations`
--

CREATE TABLE `stations` (
  `station_code` varchar(20) NOT NULL,
  `station_name` varchar(20) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stations`
--

INSERT INTO `stations` (`station_code`, `station_name`, `state`) VALUES
('ADH', 'Andheri', 'Maharashtra'),
('ADI', 'Ahmedabad', 'Gujarat'),
('AII', 'Ajmer', 'Rajasthan'),
('ANND', 'Anand Junction', 'Gujarat'),
('BCT', 'Mumbai Central', 'Maharashtra'),
('BDTS', 'Bandra Terminus', 'Maharashtra'),
('BH', 'Bharuch Central', 'Gujarat'),
('BL', 'Valsad', 'Gujarat'),
('BNC', 'Banglore Cant', 'Banglore'),
('BRC', 'Vadodara Junction', 'Gujarat'),
('BSB', 'Varasani', 'Uttar Pradesh'),
('BSL', 'Bhusaval express', 'Maharashtra'),
('BVI', 'Borivali', 'Maharashtra'),
('CDG', 'Chandigarh', 'Chandigarh'),
('CMY', 'Chintamani', 'Karnataka'),
('DJ', 'Darjeeling', 'West Bengal'),
('DLI', 'Delhi', 'Delhi'),
('DR', 'Dadar', 'Maharashtra'),
('HWH', 'Howrah Jn', 'West Bengol'),
('JP', 'Jaipur	', 'Rajasthan'),
('LTT', 'Lokmanyatilak', 'Maharashtra'),
('MAS', 'Chennai Central', 'Tamil Nadu'),
('ND', 'Nadiad Junction', 'Gujarat'),
('NDLS', 'New Delhi', 'Delhi'),
('NVS', 'Navsari', 'Gujarat'),
('PBR', 'Porbandar', 'Gujarat'),
('PUNE', 'pune', 'Maharashtra'),
('RNC', 'Ranchi Junction', 'Jarkhand'),
('ST', 'Surat', 'Gujarat'),
('SWV', 'Sawantwadi Road', 'Maharashtra'),
('UDZ', 'Udaipur', 'Rajasthan'),
('VAPI', 'Vapi', 'Gujarat');

-- --------------------------------------------------------

--
-- Table structure for table `trains`
--

CREATE TABLE `trains` (
  `train_no` int(11) NOT NULL,
  `src_station_code` varchar(20) DEFAULT NULL,
  `dest_station_code` varchar(20) DEFAULT NULL,
  `depart_time` time DEFAULT NULL,
  `arrival_time` time DEFAULT NULL,
  `days` varchar(20) DEFAULT NULL,
  `flr_weight` double NOT NULL,
  `rlr_weight` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `trains`
--

INSERT INTO `trains` (`train_no`, `src_station_code`, `dest_station_code`, `depart_time`, `arrival_time`, `days`, `flr_weight`, `rlr_weight`) VALUES
(11003, 'DR', 'SWV', '00:05:00', '10:40:00', 'all', 1400, 0),
(11025, 'BSL', 'PUNE', '00:25:00', '12:05:00', 'all', 0, 0),
(12009, 'BCT', 'ADI', '06:25:00', '10:09:00', 'all', 0, 0),
(12010, 'ADI', 'BCT', '14:40:00', '21:20:00', 'all', 0, 0),
(12016, 'AII', 'NDLS', '15:45:00', '22:11:00', 'all', 1400, 2000),
(12019, 'HWH', 'RNC', '06:05:00', '13:10:00', 'all - sunday', 246, 0),
(12167, 'LTT', 'BSB', '00:35:00', '03:45:00', 'all', 1400, 0),
(12931, 'BCT', 'ADI', '14:20:00', '21:40:00', 'all', 0, 0),
(19215, 'BCT', 'PBR', '08:20:00', '17:50:00', 'all', 246, 0),
(22901, 'BDTS', 'UDZ', '23:25:00', '15:55:00', NULL, 1400, 0);

-- --------------------------------------------------------

--
-- Table structure for table `train_route`
--

CREATE TABLE `train_route` (
  `train_no` int(11) NOT NULL,
  `station_code` varchar(20) NOT NULL,
  `depart_time` time DEFAULT NULL,
  `arrival_time` time DEFAULT NULL,
  `stop_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `train_route`
--

INSERT INTO `train_route` (`train_no`, `station_code`, `depart_time`, `arrival_time`, `stop_time`) VALUES
(12009, 'ADI', '00:00:00', '12:45:00', 0),
(12009, 'ANND', '11:35:00', '11:33:00', 2),
(12009, 'BCT', '06:25:00', '00:00:00', 0),
(12009, 'BH', '10:11:00', '10:09:00', 2),
(12009, 'BRC', '11:07:00', '11:02:00', 5),
(12009, 'BVI', '06:59:00', '06:57:00', 2),
(12009, 'ND', '11:51:00', '11:49:00', 2),
(12009, 'ST', '09:36:00', '09:31:00', 5),
(12009, 'VAPI', '08:25:00', '08:23:00', 2),
(12010, 'ADI', '14:40:00', '00:00:00', 0),
(12010, 'ANND', '15:34:00', '15:32:00', 2),
(12010, 'BCT', '00:00:00', '21:20:00', 0),
(12010, 'BH', '16:59:00', '16:57:00', 2),
(12010, 'BRC', '16:16:00', '16:11:00', 5),
(12010, 'BVI', '20:37:00', '20:35:00', 2),
(12010, 'ND', '15:21:00', '15:19:00', 2),
(12010, 'ST', '17:58:00', '17:53:00', 5),
(12010, 'VAPI', '18:57:00', '18:55:00', 2),
(12931, 'ADI', '00:00:00', '21:40:00', 0),
(12931, 'ANND', '20:11:00', '20:09:00', 2),
(12931, 'BCT', '14:20:00', '00:00:00', 0),
(12931, 'BH', '18:40:00', '18:38:00', 2),
(12931, 'BL', '16:56:00', '16:54:00', 2),
(12931, 'BRC', '19:40:00', '19:35:00', 5),
(12931, 'BVI', '15:00:00', '14:58:00', 2),
(12931, 'ND', '20:28:00', '20:26:00', 2),
(12931, 'ST', '18:00:00', '17:55:00', 5),
(12931, 'VAPI', '16:30:00', '16:28:00', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chartsheet`
--
ALTER TABLE `chartsheet`
  ADD PRIMARY KEY (`cht_id`),
  ADD KEY `fk_pkg_id_chartsheet` (`pkg_id`),
  ADD KEY `fk_train_no_chartsheet` (`train_no`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `lost_package`
--
ALTER TABLE `lost_package`
  ADD PRIMARY KEY (`lost_id`),
  ADD UNIQUE KEY `pkg_id` (`pkg_id`);

--
-- Indexes for table `package_details`
--
ALTER TABLE `package_details`
  ADD PRIMARY KEY (`pkg_id`),
  ADD KEY `fk_createdby_staffid` (`createdby_staffid`),
  ADD KEY `fk_dest_station_code` (`dest_station_code`),
  ADD KEY `fk_receiver_cid` (`receiver_cid`),
  ADD KEY `fk_sender_cid` (`sender_cid`),
  ADD KEY `fk_src_station_code` (`src_station_code`);

--
-- Indexes for table `package_location`
--
ALTER TABLE `package_location`
  ADD PRIMARY KEY (`pl_id`),
  ADD KEY `fk_pkm_id` (`pkm_id`);

--
-- Indexes for table `package_train_mapping`
--
ALTER TABLE `package_train_mapping`
  ADD PRIMARY KEY (`pkm_id`),
  ADD KEY `fk_pkg_id` (`pkg_id`),
  ADD KEY `fk_train_no` (`train_no`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_id`);

--
-- Indexes for table `stations`
--
ALTER TABLE `stations`
  ADD PRIMARY KEY (`station_code`);

--
-- Indexes for table `trains`
--
ALTER TABLE `trains`
  ADD PRIMARY KEY (`train_no`);

--
-- Indexes for table `train_route`
--
ALTER TABLE `train_route`
  ADD PRIMARY KEY (`train_no`,`station_code`),
  ADD KEY `fk_station_code_route` (`station_code`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chartsheet`
--
ALTER TABLE `chartsheet`
  MODIFY `cht_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=316;
--
-- AUTO_INCREMENT for table `lost_package`
--
ALTER TABLE `lost_package`
  MODIFY `lost_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `package_location`
--
ALTER TABLE `package_location`
  MODIFY `pl_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;
--
-- AUTO_INCREMENT for table `package_train_mapping`
--
ALTER TABLE `package_train_mapping`
  MODIFY `pkm_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;
--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `staff_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `package_details`
--
ALTER TABLE `package_details`
  ADD CONSTRAINT `fk_createdby_staffid` FOREIGN KEY (`createdby_staffid`) REFERENCES `staff` (`staff_id`),
  ADD CONSTRAINT `fk_dest_station_code` FOREIGN KEY (`dest_station_code`) REFERENCES `stations` (`station_code`),
  ADD CONSTRAINT `fk_receiver_cid` FOREIGN KEY (`receiver_cid`) REFERENCES `contacts` (`cid`),
  ADD CONSTRAINT `fk_sender_cid` FOREIGN KEY (`sender_cid`) REFERENCES `contacts` (`cid`),
  ADD CONSTRAINT `fk_src_station_code` FOREIGN KEY (`src_station_code`) REFERENCES `stations` (`station_code`);

--
-- Constraints for table `package_location`
--
ALTER TABLE `package_location`
  ADD CONSTRAINT `fk_pkm_id` FOREIGN KEY (`pkm_id`) REFERENCES `package_train_mapping` (`pkm_id`);

--
-- Constraints for table `package_train_mapping`
--
ALTER TABLE `package_train_mapping`
  ADD CONSTRAINT `fk_pkg_id` FOREIGN KEY (`pkg_id`) REFERENCES `package_details` (`pkg_id`),
  ADD CONSTRAINT `fk_train_no` FOREIGN KEY (`train_no`) REFERENCES `trains` (`train_no`);

--
-- Constraints for table `train_route`
--
ALTER TABLE `train_route`
  ADD CONSTRAINT `fk_station_code_route` FOREIGN KEY (`station_code`) REFERENCES `stations` (`station_code`),
  ADD CONSTRAINT `fk_train_no_route` FOREIGN KEY (`train_no`) REFERENCES `trains` (`train_no`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
