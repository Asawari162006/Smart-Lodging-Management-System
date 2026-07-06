-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 30, 2026 at 06:58 PM
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
-- Database: `ramkrishna_new`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `BookingID` int(255) NOT NULL,
  `BookingDate` date NOT NULL,
  `CheckinDate` date NOT NULL,
  `CheckOutDate` date NOT NULL,
  `GuestID` int(255) NOT NULL,
  `RoomNo` int(255) NOT NULL,
  `Adult` int(255) NOT NULL,
  `Child` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`BookingID`, `BookingDate`, `CheckinDate`, `CheckOutDate`, `GuestID`, `RoomNo`, `Adult`, `Child`) VALUES
(5, '2025-01-23', '2025-01-20', '2025-01-25', 2, 101, 2, 1),
(6, '2025-01-23', '2025-01-20', '2025-01-25', 3, 101, 2, 1),
(7, '2025-02-03', '2025-02-03', '2025-02-04', 4, 1, 2, 0),
(8, '2025-02-03', '2025-02-04', '2025-02-07', 5, 2, 2, 0),
(9, '2025-02-04', '2025-02-04', '2025-02-05', 10, 1, 2, 0),
(10, '2025-02-04', '2025-02-04', '2025-02-05', 11, 1, 2, 0),
(11, '2025-02-04', '2025-02-05', '2025-02-06', 12, 1, 2, 2),
(12, '2025-02-04', '2025-02-05', '2025-02-06', 13, 1, 2, 2),
(13, '2025-02-04', '2025-02-05', '2025-02-06', 14, 1, 2, 2),
(14, '2025-02-04', '2025-02-05', '2025-02-06', 15, 1, 2, 2),
(15, '2025-02-04', '2025-02-06', '2025-02-07', 16, 1, 2, 2),
(16, '2025-02-04', '2025-02-06', '2025-02-07', 17, 1, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `corporate_client`
--

CREATE TABLE `corporate_client` (
  `CompanyID` int(255) NOT NULL,
  `Companyname` varchar(255) NOT NULL,
  `Companyaddress` varchar(255) NOT NULL,
  `gstin` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `Emp_id` int(255) NOT NULL,
  `EmpFName` varchar(255) NOT NULL,
  `EmpLName` varchar(255) NOT NULL,
  `EmpModule` varchar(255) NOT NULL,
  `EmpDesignation` varchar(255) NOT NULL,
  `EmpContactNo` int(255) NOT NULL,
  `EmpEmail` varchar(255) NOT NULL,
  `EmpAddress` varchar(255) NOT NULL,
  `EmpJoiningDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `guest`
--

CREATE TABLE `guest` (
  `GuestId` int(255) NOT NULL,
  `GuestFName` varchar(255) NOT NULL,
  `GuestLName` varchar(255) NOT NULL,
  `GuestContactNo` int(10) NOT NULL,
  `GuestEmail` varchar(255) NOT NULL,
  `GuestAddress` varchar(255) NOT NULL,
  `GuestCity` varchar(255) NOT NULL,
  `CompanyID` int(255) DEFAULT NULL,
  `GuestType` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `guest`
--

INSERT INTO `guest` (`GuestId`, `GuestFName`, `GuestLName`, `GuestContactNo`, `GuestEmail`, `GuestAddress`, `GuestCity`, `CompanyID`, `GuestType`) VALUES
(1, 'John', 'Doe', 1234567890, 'johndoe@example.com', '123 Main St, Cityville', 'Cityville', NULL, ''),
(2, 'John', 'Doe', 1234567890, 'johndoe@example.com', '123 Main St, Cityville', 'Cityville', NULL, ''),
(3, 'John', 'Doe', 1234567890, 'johndoe@example.com', '123 Main St, Cityville', 'Cityville', NULL, ''),
(4, 'surekha', 'powar', 2147483647, 'surekha@gmail.com', 'bindu chouk,kolhapur', 'kolhapur', NULL, ''),
(5, 'archita', 'thakur', 2147483647, 'archita@gmail.com', 'nale chouk,kalamba', 'kolhapur', NULL, ''),
(16, 'abc', 'xyz', 2147483647, 'abc@gmail.com', 'bindu chouk,kolhapur', 'kolhapur', NULL, ''),
(17, 'abc', 'xyz', 2147483647, 'abc@gmail.com', 'bindu chouk,kolhapur', 'kolhapur', NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `PaymentID` int(255) NOT NULL,
  `PaymentMethod` varchar(255) NOT NULL,
  `PaymentAmount` int(255) NOT NULL,
  `BookingID` int(255) NOT NULL,
  `PaymentStatus` varchar(255) NOT NULL,
  `PaymentDate` datetime NOT NULL DEFAULT current_timestamp(),
  `razorpay_payment_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`PaymentID`, `PaymentMethod`, `PaymentAmount`, `BookingID`, `PaymentStatus`, `PaymentDate`, `razorpay_payment_id`) VALUES
(1, 'Credit Card', 1500, 4, 'Completed', '0000-00-00 00:00:00', NULL),
(2, 'Credit Card', 1500, 5, 'Completed', '2025-01-23 23:27:06', NULL),
(3, 'Credit Card', 1500, 6, 'Completed', '2025-01-23 23:58:32', NULL),
(4, 'Razorpay', 3025, 7, 'Success', '2025-02-03 20:12:23', NULL),
(5, 'Razorpay', 12486, 8, 'Success', '2025-02-03 21:06:00', NULL),
(6, 'netbanking', 3025, 9, 'Pending', '2025-02-04 15:29:58', 'pay_PrZRwrIJ5W8V7V'),
(7, 'netbanking', 3025, 10, 'Pending', '2025-02-04 15:30:23', 'pay_PrZRwrIJ5W8V7V'),
(8, 'netbanking', 3025, 11, 'Pending', '2025-02-04 15:50:14', 'pay_Prc8CZ9XzXvuBc'),
(9, 'netbanking', 3025, 12, 'Pending', '2025-02-04 15:50:24', 'pay_Prc8CZ9XzXvuBc'),
(10, 'netbanking', 3025, 13, 'Pending', '2025-02-04 15:53:13', 'pay_Prc8CZ9XzXvuBc'),
(11, 'netbanking', 3025, 14, 'Pending', '2025-02-04 16:00:37', 'pay_Prc8CZ9XzXvuBc'),
(12, 'netbanking', 3025, 15, 'Pending', '2025-02-04 16:09:00', 'pay_PrcS07V352dfnZ'),
(13, 'netbanking', 3025, 16, 'Pending', '2025-02-04 16:24:28', 'pay_PrcS07V352dfnZ');

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `room_no` int(255) NOT NULL,
  `room_category` varchar(255) NOT NULL,
  `price` int(255) NOT NULL,
  `availability_status` varchar(255) NOT NULL,
  `capacity` int(255) NOT NULL,
  `features` varchar(1000) NOT NULL,
  `floor_no` int(255) NOT NULL,
  `policies` varchar(255) NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`room_no`, `room_category`, `price`, `availability_status`, `capacity`, `features`, `floor_no`, `policies`, `updated_at`) VALUES
(1, 'Standard', 1544, 'Available', 2, 'Discover the ultimate luxury getaway for couples in the cozy wooden cabin 001. Nestled deep in a lush, picturesque forest, this enchanting cabin offers a perfect blend of seclusion, serenity, and intimacy. The soothing sounds of nature and the fresh, crisp air make it an idyllic escape from the hustle and bustle of everyday life.', 1, 'No Smoking, No Pets', '2025-01-02 06:34:39'),
(2, 'Deluxe', 2168, 'Available', 2, 'A modern and stylish deluxe room featuring elegant furnishings and top-notch amenities. Relax in the plush queen-size bed, enjoy a private balcony with stunning views, and take advantage of complimentary WiFi, AC, and a flat-screen TV. Perfect for business or leisure travelers.', 2, 'No Smoking', '2025-01-02 06:36:38'),
(3, 'Suite', 4000, 'Avaliable', 5, 'Spacious and well-appointed, the family suite is designed to cater to all your family\'s needs. It features two bedrooms, a living area, and a fully-equipped kitchenette. Children will love the cozy bunk beds, while parents can relax on the king-size bed with fine linens. Enjoy WiFi, a flat-screen TV, and complimentary toiletries.', 3, 'No Smoking', '2025-01-02 06:38:35');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`BookingID`);

--
-- Indexes for table `corporate_client`
--
ALTER TABLE `corporate_client`
  ADD PRIMARY KEY (`CompanyID`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`Emp_id`);

--
-- Indexes for table `guest`
--
ALTER TABLE `guest`
  ADD PRIMARY KEY (`GuestId`),
  ADD KEY `guest_ibfk_1` (`CompanyID`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`PaymentID`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`room_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `BookingID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `corporate_client`
--
ALTER TABLE `corporate_client`
  MODIFY `CompanyID` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `Emp_id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `guest`
--
ALTER TABLE `guest`
  MODIFY `GuestId` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `PaymentID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `room_no` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `guest`
--
ALTER TABLE `guest`
  ADD CONSTRAINT `guest_ibfk_1` FOREIGN KEY (`CompanyID`) REFERENCES `corporate_client` (`CompanyID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
