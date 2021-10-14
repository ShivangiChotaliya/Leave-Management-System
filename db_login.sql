-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 26, 2021 at 03:52 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_login`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(10) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'admin@gmail.com', 'Shivangi@27'),
(3, 'devangi', 'devangi');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `departmentId` int(3) NOT NULL,
  `departmentName` varchar(30) DEFAULT NULL,
  `creation_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`departmentId`, `departmentName`, `creation_date`) VALUES
(1, 'IT', '2021-09-23'),
(5, 'R&D', '2021-09-23'),
(6, 'Finance', '2021-09-23'),
(7, 'HR', '2021-09-23');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `empid` varchar(10) NOT NULL,
  `empname` varchar(50) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `position` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(10) DEFAULT NULL,
  `gender` varchar(7) DEFAULT NULL,
  `mobile` varchar(12) DEFAULT NULL,
  `dob` varchar(11) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `empid`, `empname`, `department`, `position`, `email`, `password`, `gender`, `mobile`, `dob`, `address`) VALUES
(1, '1', 'devangi', 'IT', 'Manager', 'krunalpabari2012@gmail.com', 'devangi123', 'Male', '7201034608', '1999-08-29', 'shanti niketan park 2'),
(4, '2', 'krunal', 'Finance', 'Developer', 'krunalpabari2012@gmail.com', 'Devangi', 'Male', '7201034608', '1999-08-29', 'shanti niketan park 2'),
(5, '4', 'shivangi', 'Finance', 'Manager', 'krunalpabari2012@gmail.com', '123', 'Male', '7201034608', '1999-01-29', 'shanti niketan park 2'),
(6, '5', 'devangi', 'Finance', 'Manager', 'krunalpabari2012@gmail.com', '29081999', 'Female', '7201034608', '1999-08-29', 'shanti niketan park 2'),
(8, '10', 'mohini', 'IT', 'Manager', 'krunalpabari2012@gmail.com', '29081999', 'Female', '7201034608', '1999-08-29', 'shanti niketan park 2'),
(10, '1', 'devangi', 'IT', 'Manager', 'krunalpabari2012@gmail.com', '29081999', 'Male', '7201034608', '1999-08-29', 'shanti niketan park 2'),
(11, '1', 'devangi', 'IT', 'Manager', 'krunalpabari2012@gmail.com', '29081999', 'Male', '7201034608', '1999-08-29', 'shanti niketan park 2'),
(12, '12', 'shubham', 'Sales', 'Manager', 'krunalpabari2012@gmail.com', '123', 'Male', '7201034608', '1999-08-29', 'shanti niketan park 2'),
(13, '15', 'mansi', 'Research & Development', 'Manager', 'krunalpabari2012@gmail.com', '123', 'Female', '7201034608', '1999-08-29', 'shanti niketan park 2'),
(14, '20', 'hello', 'Finance', 'Manager', 'krunalpabari2012@gmail.com', '123', 'Female', '7201034608', '1999-08-29', 'shanti niketan park 2'),
(15, '8', 'mohini', 'Finance', 'Manager', 'krunalpabari2012@gmail.com', '123', 'Female', '7201034608', '1999-08-29', 'shanti niketan park 2'),
(16, '10', 'devangi', 'IT', 'Developer', 'krunalpabari2012@gmail.com', 'Devangi29@', 'Female', '7201034608', '1999-08-29', 'shanti niketan park 2');

-- --------------------------------------------------------

--
-- Table structure for table `leaves`
--

CREATE TABLE `leaves` (
  `id` int(11) NOT NULL,
  `LeaveType` varchar(110) NOT NULL,
  `ToDate` varchar(120) NOT NULL,
  `FromDate` varchar(120) NOT NULL,
  `Description` mediumtext NOT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `Status` int(1) NOT NULL,
  `empid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `leaves`
--

INSERT INTO `leaves` (`id`, `LeaveType`, `ToDate`, `FromDate`, `Description`, `PostingDate`, `Status`, `empid`) VALUES
(1, 'Casual', '30/09/2021', '29/09/2021', 'Hello', '2021-09-25 18:30:00', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `leavetype`
--

CREATE TABLE `leavetype` (
  `id` int(11) NOT NULL,
  `LeaveType` varchar(200) DEFAULT NULL,
  `CreationDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `leavetype`
--

INSERT INTO `leavetype` (`id`, `LeaveType`, `CreationDate`) VALUES
(1, 'Casual', '2021-09-26');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`departmentId`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leaves`
--
ALTER TABLE `leaves`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leavetype`
--
ALTER TABLE `leavetype`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `departmentId` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `leaves`
--
ALTER TABLE `leaves`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `leavetype`
--
ALTER TABLE `leavetype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
