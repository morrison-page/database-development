-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 25, 2019 at 11:19 PM
-- Server version: 10.1.37-MariaDB-0+deb9u1
-- PHP Version: 7.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `533Fish`
--

-- --------------------------------------------------------

--
-- Table structure for table `weeks`
--

CREATE TABLE `weeks` (
  `id` int(11) NOT NULL,
  `week_starts` date NOT NULL,
  `week_ends` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `weeks`
--
ALTER TABLE `weeks`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `weeks`
--
ALTER TABLE `weeks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
