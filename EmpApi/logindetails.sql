-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 11, 2023 at 05:27 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `logindetails`
--

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `e_id` varchar(255) NOT NULL,
  `e_name` varchar(255) NOT NULL,
  `e_ctype` varchar(255) NOT NULL,
  `hrs_spent` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`e_id`, `e_name`, `e_ctype`, `hrs_spent`) VALUES
('emp1', 'John Doe', 'Developer', 100),
('emp2', 'Jane Smith', 'Manager', 120),
('emp3', 'Michael Johnson', 'Designer', 80);

-- --------------------------------------------------------

--
-- Table structure for table `empproject`
--

CREATE TABLE `empproject` (
  `e_id` varchar(255) NOT NULL,
  `p_id` varchar(255) NOT NULL,
  `hrs_spent` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `empproject`
--

INSERT INTO `empproject` (`e_id`, `p_id`, `hrs_spent`) VALUES
('emp1', 'proj1', 50),
('emp2', 'proj2', 60),
('emp3', 'proj3', 40);

-- --------------------------------------------------------

--
-- Table structure for table `jobclass`
--

CREATE TABLE `jobclass` (
  `ctype` varchar(255) NOT NULL,
  `hrly_rate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jobclass`
--

INSERT INTO `jobclass` (`ctype`, `hrly_rate`) VALUES
('Designer', 30),
('Developer', 25),
('Manager', 40);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `uname` varchar(255) NOT NULL,
  `pword` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`uname`, `pword`) VALUES
('emp1', 'password1'),
('emp2', 'password2'),
('emp3', 'password3');

-- --------------------------------------------------------

--
-- Table structure for table `projectdetails`
--

CREATE TABLE `projectdetails` (
  `p_id` varchar(255) NOT NULL,
  `p_name` varchar(255) NOT NULL,
  `p_lead` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `projectdetails`
--

INSERT INTO `projectdetails` (`p_id`, `p_name`, `p_lead`) VALUES
('proj1', 'Project A', 'emp1'),
('proj2', 'Project B', 'emp2'),
('proj3', 'Project C', 'emp3');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`e_id`);

--
-- Indexes for table `empproject`
--
ALTER TABLE `empproject`
  ADD PRIMARY KEY (`e_id`,`p_id`),
  ADD KEY `p_id` (`p_id`);

--
-- Indexes for table `jobclass`
--
ALTER TABLE `jobclass`
  ADD PRIMARY KEY (`ctype`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`uname`);

--
-- Indexes for table `projectdetails`
--
ALTER TABLE `projectdetails`
  ADD PRIMARY KEY (`p_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `empproject`
--
ALTER TABLE `empproject`
  ADD CONSTRAINT `empproject_ibfk_1` FOREIGN KEY (`e_id`) REFERENCES `employee` (`e_id`),
  ADD CONSTRAINT `empproject_ibfk_2` FOREIGN KEY (`p_id`) REFERENCES `projectdetails` (`p_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
