-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 20, 2022 at 09:08 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `upwork_test`
--

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `image` text NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '0=not available,1=availab;e',
  `E_USER_ID` int(11) NOT NULL,
  `E_DATE_TIME` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `description`, `image`, `status`, `E_USER_ID`, `E_DATE_TIME`) VALUES
(1, 'Iphone XII', 'IPhone best selling phone', 'iphone.jpg', 1, 1, '2022-06-20 17:58:30'),
(2, 'Samsung A30', 'Samsung Amoled Screen Mobile with 8 gb ram and 64 gb space', 'samsung.jpg', 1, 1, '2022-06-20 17:58:30'),
(3, 'Iphone X', 'Iphone x 2 gb 32 gb ', 'iphone.jpg', 0, 1, '2022-06-20 18:01:36'),
(4, 'Samsung A10', 'Samsung A10 with 4 Gb ram and 64 gb Storage', 'samsung.jpg', 1, 1, '2022-06-20 18:02:19'),
(5, 'Vivo s1 pro', 'Vivo s1 pro with 8 gb ram and 128 gb storage', 'vivo.jpg', 0, 1, '2022-06-20 18:02:19'),
(6, 'MI 10', 'Xiomi M1 8 gb with 256 gb ', 'mi.jpg', 1, 1, '2022-06-20 19:44:09');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `user_fullname` varchar(250) NOT NULL,
  `user_name` varchar(250) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_password` text NOT NULL,
  `user_active` tinyint(1) NOT NULL COMMENT '0=not verified, 1 = verified'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `user_fullname`, `user_name`, `user_email`, `user_password`, `user_active`) VALUES
(1, 'Babar Ali', 'babarali7', 'babar_ali009@hotmail.com', '56f46611dfa80d0eead602cbb3f6dcee', 1),
(2, 'Qaisar Ali', 'qaisarali31', 'qaisarali@gmail.com', 'e0afeb835e66d6e6b9548cce6c547ed7', 1),
(3, 'Shams', 'shams', 'shams@gmail.com', 'shams', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users_products`
--

CREATE TABLE `users_products` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `product_price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users_products`
--

INSERT INTO `users_products` (`id`, `user_id`, `product_id`, `product_quantity`, `product_price`) VALUES
(1, 1, 1, 3, 100),
(2, 1, 2, 2, 120),
(3, 2, 2, 7, 120),
(4, 2, 3, 4, 300);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_products`
--
ALTER TABLE `users_products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users_products`
--
ALTER TABLE `users_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
