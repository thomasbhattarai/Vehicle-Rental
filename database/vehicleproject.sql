-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 11, 2024 at 12:26 PM
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
-- Database: `vehicleproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `ADMIN_ID` varchar(255) NOT NULL,
  `ADMIN_PASSWORD` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`ADMIN_ID`, `ADMIN_PASSWORD`) VALUES
('ADMIN', 'ADMIN');

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `BOOK_ID` int(11) NOT NULL,
  `VEHICLE_ID` int(11) NOT NULL,
  `EMAIL` varchar(255) NOT NULL,
  `BOOK_PLACE` varchar(255) NOT NULL,
  `BOOK_DATE` date NOT NULL,
  `DURATION` int(11) NOT NULL,
  `PHONE_NUMBER` bigint(20) NOT NULL,
  `DESTINATION` varchar(255) NOT NULL,
  `RETURN_DATE` date NOT NULL,
  `PRICE` int(11) NOT NULL,
  `BOOK_STATUS` varchar(255) NOT NULL DEFAULT 'UNDER PROCESSING'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`BOOK_ID`, `VEHICLE_ID`, `EMAIL`, `BOOK_PLACE`, `BOOK_DATE`, `DURATION`, `PHONE_NUMBER`, `DESTINATION`, `RETURN_DATE`, `PRICE`, `BOOK_STATUS`) VALUES
(72, 2, 'ram@gmail.com', 'kathmandu', '2024-11-11', 3, 9841502866, 'bhaktapur', '2024-11-28', 21000, 'RETURNED'),
(73, 3, 'ram@gmail.com', 'kathmandu', '2024-11-11', 6, 9841502866, 'bhaktapur', '2024-11-27', 18000, 'APPROVED'),
(74, 2, 'ram@gmail.com', 'kathmandu', '2024-11-11', 1, 9841502866, 'bhaktapur', '2024-11-21', 7000, 'UNDER PROCESSING');

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `VEHICLE_ID` int(11) NOT NULL,
  `VEHICLE_NAME` varchar(255) NOT NULL,
  `VEHICLE_TYPE` varchar(255) NOT NULL,
  `FUEL_TYPE` varchar(255) NOT NULL,
  `CAPACITY` int(11) NOT NULL,
  `PRICE` int(11) NOT NULL,
  `VEHICLE_IMG` varchar(255) NOT NULL,
  `AVAILABLE` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`VEHICLE_ID`, `VEHICLE_NAME`,`VEHICLE_TYPE`, `FUEL_TYPE`, `CAPACITY`, `PRICE`, `VEHICLE_IMG`, `AVAILABLE`) VALUES
(2, 'LAMBORGINI','Car', 'DEISEL', 6, 7000, 'lamborghini.webp', 'Y'),
(3, 'PORSCHE','Car', 'GAS', 4, 3000, 'porsche.jpg', 'N'),
(20, 'SWIFT','Car', 'DEISEL', 22, 1000, 'IMG-6239c94ea8a4a0.51789849.jpg', 'Y'),
(21, 'Harley Davidson', 'Motorbike', 'Petrol', 2, 500, 'harley_davidson.jpg', 'Y'),
(22, 'Yamaha R15', 'Motorbike', 'Petrol', 2, 200, 'yamaha_r15.jpg', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `FED_ID` int(11) NOT NULL,
  `EMAIL` varchar(255) NOT NULL,
  `COMMENT` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`FED_ID`, `EMAIL`, `COMMENT`) VALUES
(11, 'ram@gmail.com', 'fsdafsadfasf');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `PAY_ID` int(11) NOT NULL,
  `BOOK_ID` int(11) NOT NULL,
  `CARD_NO` varchar(255) NOT NULL,
  `EXP_DATE` varchar(255) NOT NULL,
  `CVV` int(11) NOT NULL,
  `PRICE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`PAY_ID`, `BOOK_ID`, `CARD_NO`, `EXP_DATE`, `CVV`, `PRICE`) VALUES
(26, 72, '123456789', '1-2', 555, 21000),
(27, 73, '1555555', '3', 999, 18000),
(28, 74, '1234567890123455', '11111', 222, 7000);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `FNAME` varchar(255) NOT NULL,
  `LNAME` varchar(255) NOT NULL,
  `EMAIL` varchar(255) NOT NULL,
  `LIC_NUM` varchar(255) NOT NULL,
  `PHONE_NUMBER` bigint(11) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `GENDER` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`FNAME`, `LNAME`, `EMAIL`, `LIC_NUM`, `PHONE_NUMBER`, `PASSWORD`, `GENDER`) VALUES
('hello', 'there', 'ram@gmail.com', '7777', 9841502866, 'f4bd9049fce4157a55551da9a966015c', 'male');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ADMIN_ID`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`BOOK_ID`),
  ADD KEY `VEHICLE_ID` (`VEHICLE_ID`),
  ADD KEY `EMAIL` (`EMAIL`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`VEHICLE_ID`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`FED_ID`),
  ADD KEY `TEST` (`EMAIL`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`PAY_ID`),
  ADD UNIQUE KEY `BOOK_ID` (`BOOK_ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`EMAIL`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `BOOK_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `VEHICLE_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `FED_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `PAY_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`VEHICLE_ID`) REFERENCES `vehicles` (`VEHICLE_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`EMAIL`) REFERENCES `users` (`EMAIL`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `TEST` FOREIGN KEY (`EMAIL`) REFERENCES `users` (`EMAIL`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`BOOK_ID`) REFERENCES `booking` (`BOOK_ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
