-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 04, 2022 at 04:58 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_leave`
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
(4, 'devangi@gmail.com', 'Devangi@27');

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
(1, 'Finance', '2021-09-23'),
(2, 'HR', '2021-09-23'),
(4, 'Production', '2021-12-10'),
(5, 'Purchasing', '2021-12-10'),
(21, 'Marketing', '2021-12-30');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `empid` int(11) NOT NULL,
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
(5, 301, 'Komal Dave', 'Finance', 'Manager', 'komal@gmail.com', 'Komal@27', 'Female', '7201034608', '1999-01-29', 'Mumbai'),
(6, 302, 'Devangi Pabari', 'Finance', 'Manager', 'devangi2012@gmail.com', 'Devangi@27', 'Female', '7201034608', '1999-08-29', 'shanti niketan park 2'),
(8, 305, 'Mohini Parmar', 'IT', 'Manager', 'mohini@gmail.com', 'Mohini@27', 'Female', '7201034608', '1999-08-29', 'Baroda'),
(17, 101, 'Jatin Panchal', 'IT', 'Developer', 'jatin@gmail.com', 'Jatin@27', 'Male', '4578412451', '1999-11-27', 'Tulisivan, Surat.'),
(18, 102, 'Preet Chotaliya', 'HR', 'Accontant', 'preet@gmail.com', 'Preet@26', 'Male', '2345781245', '2003-01-01', 'Surat'),
(19, 103, 'Sejal Parmar', 'Purchasing', 'HR', 'sejal@gmail.com', 'Sejal@27', 'Female', '8754124512', '1999-05-03', 'Rajkot'),
(20, 204, 'Meenu Singh', 'Finance', 'Developer', 'meenu@gmail.com', 'Meenu@27', 'Female', '9547845714', '1998-01-30', 'UP');

-- --------------------------------------------------------

--
-- Table structure for table `leaves`
--

CREATE TABLE `leaves` (
  `leaveid` int(11) NOT NULL,
  `LeaveType` varchar(250) NOT NULL,
  `ToDate` varchar(120) NOT NULL,
  `FromDate` varchar(120) NOT NULL,
  `Description` varchar(500) NOT NULL,
  `PostingDate` date NOT NULL DEFAULT current_timestamp(),
  `Status` int(1) NOT NULL,
  `empid` int(11) DEFAULT NULL,
  `Attachement` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `leaves`
--

INSERT INTO `leaves` (`leaveid`, `LeaveType`, `ToDate`, `FromDate`, `Description`, `PostingDate`, `Status`, `empid`, `Attachement`) VALUES
(11, 'Casual Leave', '2021-12-20', '2021-12-16', 'Sister Marrige', '2021-12-05', -1, 101, 'download.png'),
(13, 'Casual Leave', '2021-12-13', '2021-12-09', 'Out of Station', '2021-12-05', 1, 101, 'download.png'),
(15, 'Annual Leave', '2021-12-15', '2021-12-13', 'For Personal Reason', '2021-12-10', 0, 102, 'download.png'),
(16, 'Privilege Leave (PL)', '2021-12-23', '2021-12-13', 'some reson', '2021-12-10', 0, 103, 'download.png'),
(17, 'Annual Leave', '2021-12-24', '2021-12-21', 'Approved Success', '2021-12-10', 1, 103, 'download.png'),
(24, 'Sick Leave (SL)', '2021-12-25', '2021-12-24', 'illness', '2021-12-12', 0, 101, 'download.png'),
(25, 'Sick Leave (SL)', '2021-12-25', '2021-12-24', 'illness', '2021-12-12', 0, 101, 'download.png'),
(26, 'Sick Leave (SL)', '2021-12-26', '2021-12-25', 'Corona ', '2021-12-13', 0, 101, 'download.png'),
(29, 'Early Leave', '2021-12-25', '2021-12-24', 'Based On Situation', '2021-12-14', 1, 101, 'null'),
(30, 'Sick Leave (SL)', '2021-12-25', '2021-12-24', 'Dengue', '2021-12-14', 0, 101, 'image.jpg'),
(31, 'Sick Leave (SL)', '2022-01-08', '2022-01-06', 'Malaria', '2021-12-30', 1, 204, 'Railway Complaint Analysis (2).pdf'),
(32, 'Annual Leave', '2022-01-09', '2022-01-04', 'For Some Reason', '2021-12-31', 0, 301, 'null'),
(33, 'Sick Leave (SL)', '2022-01-18', '2022-01-09', 'illness', '2021-12-31', -1, 301, 'Railway Complaint Analysis (2).pdf'),
(34, 'Early Leave', '2022-01-04', '2022-01-01', 'Medical Reason', '2021-12-31', 0, 305, 'null'),
(35, 'Early Leave', '2022-01-03', '2022-01-01', 'Approved', '2021-12-31', 1, 204, 'null'),
(37, 'Annual Leave', '2022-01-04', '2022-01-01', 'illness', '2021-12-31', -1, 101, 'null'),
(38, 'Sick Leave (SL)', '2022-01-09', '2022-01-04', 'illness', '2021-12-31', -1, 101, '');

-- --------------------------------------------------------

--
-- Table structure for table `leavetype`
--

CREATE TABLE `leavetype` (
  `id` int(11) NOT NULL,
  `LeaveType` varchar(200) DEFAULT NULL,
  `CreationDate` date NOT NULL,
  `days` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `leavetype`
--

INSERT INTO `leavetype` (`id`, `LeaveType`, `CreationDate`, `days`) VALUES
(1, 'Annual Leave', '2021-12-05', 1),
(2, 'Early Leave', '2021-12-05', 2),
(3, 'Sick Leave (SL)', '2021-12-30', 8);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `empid` (`empid`);

--
-- Indexes for table `leaves`
--
ALTER TABLE `leaves`
  ADD PRIMARY KEY (`leaveid`),
  ADD KEY `empid` (`empid`),
  ADD KEY `LeaveType` (`LeaveType`);

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
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `departmentId` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `leaves`
--
ALTER TABLE `leaves`
  MODIFY `leaveid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `leavetype`
--
ALTER TABLE `leavetype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
