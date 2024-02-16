-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 16, 2024 at 09:40 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sad`
--

-- --------------------------------------------------------

--
-- Table structure for table `days`
--

CREATE TABLE `days` (
  `id` int(11) NOT NULL,
  `day` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `days`
--

INSERT INTO `days` (`id`, `day`) VALUES
(1, 'Monday'),
(2, 'Tuesday'),
(3, 'Wednesday'),
(4, 'Thursday'),
(5, 'Friday');

-- --------------------------------------------------------

--
-- Table structure for table `job`
--

CREATE TABLE `job` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `location_id` int(11) NOT NULL,
  `radiation_exposure` tinyint(3) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `job`
--

INSERT INTO `job` (`id`, `name`, `location_id`, `radiation_exposure`) VALUES
(1, 'Uranium rod polisher', 1, 100),
(2, 'Uranium rod polisher', 2, 100),
(3, 'Uranium rod polisher', 3, 100),
(4, 'Depleted uranium disposal', 1, 75),
(5, 'Depleted uranium disposal', 2, 75),
(6, 'Depleted uranium disposal', 3, 75),
(7, 'Change coolant', 1, 50),
(8, 'Change coolant', 2, 50),
(9, 'Change coolant', 3, 50),
(10, 'Clean decontamination unit', 4, 0),
(11, 'Manage reactors', 5, 0),
(12, 'Order uranium from Ebay', 5, 0),
(13, 'Decontamination', 4, -100);

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `required_clearance_level` smallint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`id`, `name`, `required_clearance_level`) VALUES
(1, 'Reactor 1', 2),
(2, 'Reactor 2', 2),
(3, 'Reactor 3', 2),
(4, 'Decontamination Unit', 1),
(5, 'Control Room', 3);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `age` tinyint(3) NOT NULL,
  `clearance_level` smallint(2) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `username`, `first_name`, `last_name`, `age`, `clearance_level`, `password`) VALUES
(1, 'bob', 'Bob', 'Jenkins', 35, 3, '1234'),
(2, '', 'Sam', 'Oskert', 57, 5, ''),
(3, '', 'Alex', 'Huggins', 21, 1, ''),
(4, '', 'Jenny', 'Bilblins', 28, 3, ''),
(5, '', 'Gerry', 'Burtinson', 32, 3, ''),
(6, '', 'Sally', 'Smithers', 31, 3, ''),
(7, '', 'Jeff', 'Alexson', 55, 5, '');

-- --------------------------------------------------------

--
-- Table structure for table `weeks`
--

CREATE TABLE `weeks` (
  `id` int(11) NOT NULL,
  `week_starts` date NOT NULL,
  `week_ends` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `weeks`
--

INSERT INTO `weeks` (`id`, `week_starts`, `week_ends`) VALUES
(1, '2018-12-31', '2019-01-04'),
(2, '2019-01-07', '2019-01-11'),
(3, '2019-01-14', '2019-01-18'),
(4, '2019-01-21', '2019-01-25'),
(5, '2019-01-28', '2019-02-01'),
(6, '2019-02-04', '2019-02-08'),
(7, '2019-02-11', '2019-02-15'),
(8, '2019-02-18', '2019-02-22'),
(9, '2019-02-25', '2019-03-01'),
(10, '2019-03-04', '2019-03-08'),
(11, '2019-03-11', '2019-03-15'),
(12, '2019-03-18', '2019-03-22'),
(13, '2019-03-25', '2019-03-29'),
(14, '2019-04-01', '2019-04-05'),
(15, '2019-04-08', '2019-04-12'),
(16, '2019-04-15', '2019-04-19'),
(17, '2019-04-22', '2019-04-26'),
(18, '2019-04-29', '2019-05-03'),
(19, '2019-05-06', '2019-05-10'),
(20, '2019-05-13', '2019-05-17'),
(21, '2019-05-20', '2019-05-24'),
(22, '2019-05-27', '2019-05-31'),
(23, '2019-06-03', '2019-06-07'),
(24, '2019-06-10', '2019-06-14'),
(25, '2019-06-17', '2019-06-21'),
(26, '2019-06-24', '2019-06-28'),
(27, '2019-07-01', '2019-07-05'),
(28, '2019-07-08', '2019-07-12'),
(29, '2019-07-15', '2019-07-19'),
(30, '2019-07-22', '2019-07-26'),
(31, '2019-07-29', '2019-08-02'),
(32, '2019-08-05', '2019-08-09'),
(33, '2019-08-12', '2019-08-16'),
(34, '2019-08-19', '2019-08-23'),
(35, '2019-08-26', '2019-08-30'),
(36, '2019-09-02', '2019-09-06'),
(37, '2019-09-09', '2019-09-13'),
(38, '2019-09-16', '2019-09-20'),
(39, '2019-09-23', '2019-09-27'),
(40, '2019-09-30', '2019-10-04'),
(41, '2019-10-07', '2019-10-11'),
(42, '2019-10-14', '2019-10-18'),
(43, '2019-10-21', '2019-10-25'),
(44, '2019-10-28', '2019-11-01'),
(45, '2019-11-04', '2019-11-08'),
(46, '2019-11-11', '2019-11-15'),
(47, '2019-11-18', '2019-11-22'),
(48, '2019-11-25', '2019-11-29'),
(49, '2019-12-02', '2019-12-06'),
(50, '2019-12-09', '2019-12-13'),
(51, '2019-12-16', '2019-12-20'),
(52, '2019-12-23', '2019-12-27');

-- --------------------------------------------------------

--
-- Table structure for table `work_schedule`
--

CREATE TABLE `work_schedule` (
  `id` int(11) NOT NULL,
  `week_id` int(11) NOT NULL,
  `day_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `work_schedule`
--

INSERT INTO `work_schedule` (`id`, `week_id`, `day_id`, `job_id`, `location_id`, `staff_id`) VALUES
(0, 1, 5, 7, 1, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `days`
--
ALTER TABLE `days`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`id`),
  ADD KEY `location_id` (`location_id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `weeks`
--
ALTER TABLE `weeks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `work_schedule`
--
ALTER TABLE `work_schedule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `week_id` (`week_id`),
  ADD KEY `day_id` (`day_id`),
  ADD KEY `job_id` (`job_id`),
  ADD KEY `location_id` (`location_id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `days`
--
ALTER TABLE `days`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `job`
--
ALTER TABLE `job`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `weeks`
--
ALTER TABLE `weeks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `job`
--
ALTER TABLE `job`
  ADD CONSTRAINT `job_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`);

--
-- Constraints for table `work_schedule`
--
ALTER TABLE `work_schedule`
  ADD CONSTRAINT `work_schedule_ibfk_1` FOREIGN KEY (`week_id`) REFERENCES `weeks` (`id`),
  ADD CONSTRAINT `work_schedule_ibfk_2` FOREIGN KEY (`day_id`) REFERENCES `days` (`id`),
  ADD CONSTRAINT `work_schedule_ibfk_3` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`),
  ADD CONSTRAINT `work_schedule_ibfk_4` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`),
  ADD CONSTRAINT `work_schedule_ibfk_5` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
