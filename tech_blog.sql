-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 10, 2023 at 09:45 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tech_blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sno` int(50) NOT NULL,
  `name` text NOT NULL,
  `phone_num` varchar(50) NOT NULL,
  `mes` text NOT NULL,
  `date` datetime DEFAULT current_timestamp(),
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno`, `name`, `phone_num`, `mes`, `date`, `email`) VALUES
(1, 'first post', '123456789', 'first post', '2023-09-07 17:36:21', 'firstpost@gmail.com'),
(2, 'Ankur Bansal', '09997844467', 'rgedf', NULL, 'ankurbansal153@gmail.com'),
(3, 'Ankur Bansal', '09997844467', 'sdfsdfsdfsd', '2023-09-07 18:19:08', 'ankurbansal153@gmail.com'),
(4, 'Ankur Bansal', '09997844467', 'sdfsfsdfsdf', '2023-09-07 20:06:47', 'ankurbansal153@gmail.com'),
(5, 'Ankur Bansal', '09997844467', 'sdfsdfsd', '2023-09-07 20:07:38', 'ankurbansal153@gmail.com'),
(6, 'Ankur Bansal', '09997844467', 'sdfsdf', '2023-09-07 20:08:31', 'ankurbansal153@gmail.com'),
(7, 'Ankur Bansal', '09997844467', '58455', '2023-09-07 20:09:39', 'ankurbansal153@gmail.com'),
(8, 'Ankur Bansal', '09997844467', 'sdfsdfsd', '2023-09-07 20:11:10', 'ankurbansal153@gmail.com'),
(9, 'Ankur Bansal', '09997844467', 'sdfsdfsdf', '2023-09-07 20:12:13', 'ankurbansal153@gmail.com'),
(10, 'Ankur Bansal', '09997844467', 'sdfsdfsdfsd', '2023-09-07 20:13:11', 'ankurbansal153@gmail.com'),
(11, 'Ankur Bansal', '09997844467', 'dfgdfgdfgdf', '2023-09-07 20:17:00', 'ankurbansal153@gmail.com'),
(12, 'Ankur Bansal', '09997844467', 'fgzdfsd', '2023-09-07 20:25:09', 'ankurbansal153@gmail.com'),
(13, 'Ankur Bansal', '09997844467', 'fvsxdfsxd', '2023-09-07 20:26:12', 'ankurbansal153@gmail.com'),
(14, 'Ankur Bansal', '09997844467', 'message', '2023-09-07 20:27:57', 'ankurbansal153@gmail.com'),
(15, 'Ankur Bansal', '09997844467', 'sdfsdfsdefsdf', '2023-09-07 20:30:18', 'ankurbansal153@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(11) NOT NULL,
  `title` text NOT NULL,
  `tagline` text NOT NULL,
  `slug` varchar(25) NOT NULL,
  `content` text NOT NULL,
  `img_file` varchar(12) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `tagline`, `slug`, `content`, `img_file`, `date`) VALUES
(2, 'Complete Information About the Indian Stock Market', 'Indian Stock Market', 'complete-information-abou', 'Complete Information About the Indian Stock Market\r\nThe Indian stock market, often referred to as the Bombay Stock Exchange (BSE) and the National Stock Exchange (NSE), is a dynamic and ever-evolving financial landscape. It plays a pivotal role in India\'s economy, attracting both domestic and international investors. In this comprehensive article, we will delve into the nitty-gritty details of the Indian stock market, exploring its history, functioning, key players, and the factors that influence its performance.\r\n\r\nUnderstanding the Basics\r\nBefore we dive into the complexities of the Indian stock market, let\'s start with the fundamentals.\r\n\r\n1. What is a Stock Market?\r\nAt its core, a stock market is a place where investors buy and sell shares of publicly listed companies. These shares represent ownership in the company and are traded among investors.\r\n\r\n2. History of the Indian Stock Market\r\nThe Indian stock market has a rich history that dates back to the early 19th century. It started with the establishment of the BSE in 1875. Over the years, it has grown to become one of the world\'s largest stock exchanges.\r\n\r\nKey Players in the Indian Stock Market\r\nTo understand the Indian stock market comprehensively, it\'s essential to know the key entities that contribute to its functioning.\r\n\r\n3. Stock Exchanges\r\nThe BSE and NSE are the two primary stock exchanges in India. They provide a platform for the trading of stocks, bonds, and other financial instruments.\r\n\r\n4. Regulators\r\nSEBI (Securities and Exchange Board of India) is the regulatory body that oversees the Indian stock market. It ensures fair practices and investor protection.\r\n\r\n5. Stockbrokers\r\nStockbrokers act as intermediaries between investors and the stock exchange. They execute buy and sell orders on behalf of clients.\r\n\r\n6. Investors\r\nThe Indian stock market attracts a diverse range of investors, including retail investors, institutional investors, and foreign investors.\r\n\r\nHow Does the Indian Stock Market Work?\r\nNow that we have an overview of the key players, let\'s dive deeper into how the Indian stock market operates.\r\n\r\n7. Listing and IPOs\r\nCompanies seeking to raise capital through the stock market go through an Initial Public Offering (IPO) process. Once listed, their shares can be traded.\r\n\r\n8. Trading Mechanism\r\nStock trading in India happens electronically, with orders matched through computerized systems. The market operates on a T+2 settlement cycle.\r\n\r\n9. Indices\r\nIndices like the Sensex (BSE) and Nifty (NSE) track the performance of select stocks and provide a snapshot of the market\'s health.\r\n\r\nFactors Influencing the Indian Stock Market\r\nThe Indian stock market\'s performance is influenced by various factors, and staying informed about these is crucial for investors.\r\n\r\n10. Economic Indicators\r\nEconomic indicators such as GDP growth, inflation rates, and industrial production have a significant impact on the stock market.\r\n\r\n11. Corporate Earnings\r\nThe financial performance of companies directly affects their stock prices. Positive earnings reports often lead to bullish trends.\r\n\r\n12. Global Events\r\nInternational events, such as geopolitical tensions and economic developments in major economies, can ripple through the Indian stock market.\r\n\r\nConclusion\r\nIn conclusion, the Indian stock market is a dynamic ecosystem that provides opportunities for investors to grow their wealth. Understanding its basics, key players, operations, and the factors influencing its performance is essential for anyone looking to navigate this complex yet rewarding financial landscape. Whether you\'re a seasoned investor or a beginner, staying informed and making informed decisions is the key to success in the Indian stock market. Happy investing!', 'market.jpg', '2023-09-09 19:23:16'),
(3, 'Ankur Bansal', 'Mr.Bansal', 'ankurbansal', 'ankur bansal', 'market.jpg', '2023-09-10 08:01:15'),
(4, 'Ankur Bansal', 'Mr.Bansal', 'ankurbansal', 'ankur bansal1', 'market.jpg', '2023-09-10 08:01:15'),
(5, 'Ankur Bansal', 'Mr.Bansal', 'ankurbansal', 'ankur bansal2', 'market.jpg', '2023-09-10 08:01:15'),
(6, 'Ankur Bansal', 'Mr.Bansal', 'ankurbansal', 'ankur bansal3', 'market.jpg', '2023-09-10 08:01:15'),
(7, 'Ankur Bansal', 'Mr.Bansal', 'ankurbansal', 'ankur bansal4', 'market.jpg', '2023-09-10 08:01:15'),
(8, 'Ankur Bansal', 'Mr.Bansal', 'ankurbansal', 'ankur bansal5', 'market.jpg', '2023-09-10 08:01:15'),
(9, 'Ankur Bansal', 'Mr.Bansal', 'ankurbansal', 'ankur bansal6', 'market.jpg', '2023-09-10 08:01:15'),
(10, 'Ankur Bansal', 'Mr.Bansal', 'ankurbansal', 'ankur bansal7', 'market.jpg', '2023-09-10 08:01:15'),
(11, 'Ankur Bansal', 'Mr.Bansal', 'ankurbansal', 'ankur bansal8', 'market.jpg', '2023-09-10 08:01:15'),
(12, 'Ankur Bansal', 'Mr.Bansal', 'ankurbansal', 'ankur bansal', 'market.jpg', '2023-09-10 08:01:15'),
(13, 'Ankur Bansal', 'Mr.Bansal', 'ankurbansal', 'ankur bansal9', 'market.jpg', '2023-09-10 08:01:15'),
(14, 'Ankur Bansal', 'Mr.Bansal', 'ankurbansal', 'ankur bansal10', 'market.jpg', '2023-09-10 08:01:15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sno` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
