-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for onlineshop
CREATE DATABASE IF NOT EXISTS `onlineshop` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `onlineshop`;

-- Dumping structure for table onlineshop.customers
CREATE TABLE IF NOT EXISTS `customers` (
  `CustomerID` int NOT NULL,
  `FirstName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `LastName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Address` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `City` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `County` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `PostalCode` int NOT NULL,
  `Country` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table onlineshop.customers: ~10 rows (approximately)
INSERT INTO `customers` (`CustomerID`, `FirstName`, `LastName`, `Address`, `City`, `County`, `PostalCode`, `Country`) VALUES
	(1, 'Bianca', 'Nistor', 'Str. Verde, nr. 8, bloc 66', 'Timișoara', 'Timiș', 300287, 'România'),
	(2, 'Alexandru', 'Marica', 'Str. Vasile Lucaci nr. 18, bloc B8', 'Timișoara', 'Timiș', 300045, 'România'),
	(3, 'Anemari', 'Moraru', 'Str. Trandafirilor, nr. 41', 'Giroc', 'Timiș', 307220, 'România'),
	(4, 'Cosmin', 'Agache', 'Str. Peco, nr. 1', 'Botoșani', 'Botoșani', 710014, 'România'),
	(5, 'Marco', 'Petcov', 'Bulevar kralja Petra I ', 'Novi Sad', 'Vojvodina', 220131, 'Serbia'),
	(6, 'Daiana', 'Gherasim', 'Aleea Iazului, nr. 31', 'Târgu Jiu', 'Gorj', 210101, 'România'),
	(7, 'Evelina', 'Vladimirovna', 'Str. Constructorilor 13', 'Chișinău', 'Chișinău', 2059, 'Republica Moldova'),
	(8, 'Jan', 'Dobrican', 'Aleea Bradisului 108', 'București, Sector 6', 'Ilfov', 62238, 'România'),
	(9, 'Melania', 'Marian', 'Aleea Neptun 6B', 'Arad', 'Arad', 310388, 'România'),
	(10, 'George', 'Străuț', 'Strada Principală 66', 'Cenei', 'Timiș', 307100, 'România');

-- Dumping structure for table onlineshop.products
CREATE TABLE IF NOT EXISTS `products` (
  `ProductID` int NOT NULL,
  `ProductName` varchar(50) NOT NULL,
  `Price` varchar(50) NOT NULL DEFAULT '',
  `StocNumber` int DEFAULT NULL,
  PRIMARY KEY (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table onlineshop.products: ~11 rows (approximately)
INSERT INTO `products` (`ProductID`, `ProductName`, `Price`, `StocNumber`) VALUES
	(2016, 'T-Shirt', '50 RON', 93),
	(2017, 'Blouse', '79,99 RON', 40),
	(2018, 'Jeans', '130 RON', 100),
	(2019, 'Dress', '150 RON', 54),
	(2020, 'Pants', '99,90 RON', 78),
	(2021, 'Jacket', '300 RON', 42),
	(2022, 'Suit', '600 RON', 30),
	(2023, 'Sweater', '89,90 RON', 56),
	(2024, 'Skirt', '100 RON', 39),
	(2025, 'Shorts', '139,90 RON', 83),
	(2026, 'Swimsuit', '140 RON', 74),
	(2027, 'Pajama', '55 RON', 61);

-- Dumping structure for table onlineshop.purchase
CREATE TABLE IF NOT EXISTS `purchase` (
  `TransactionID` int NOT NULL,
  `CustomerID` int NOT NULL,
  `ProductID` int NOT NULL,
  `PurchaseDate` date DEFAULT NULL,
  PRIMARY KEY (`TransactionID`),
  KEY `CustomerID` (`CustomerID`),
  KEY `ProductID` (`ProductID`),
  CONSTRAINT `purchase_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`),
  CONSTRAINT `purchase_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table onlineshop.purchase: ~8 rows (approximately)
INSERT INTO `purchase` (`TransactionID`, `CustomerID`, `ProductID`, `PurchaseDate`) VALUES
	(61287, 7, 2019, '2022-09-08'),
	(61288, 3, 2018, '2022-09-10'),
	(61289, 1, 2026, '2022-09-11'),
	(61290, 5, 2022, '2022-09-12'),
	(61291, 9, 2025, '2022-09-13'),
	(61292, 2, 2017, '2022-09-15'),
	(61293, 8, 2024, '2022-09-15'),
	(61294, 4, 2027, '2022-09-15'),
	(61295, 6, 2026, '2022-09-16'),
	(61296, 10, 2021, '2022-09-16');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
