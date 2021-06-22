-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 22, 2021 at 12:47 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kursudb`
--

-- --------------------------------------------------------

--
-- Table structure for table `autoriai`
--

CREATE TABLE `autoriai` (
  `ID` int(5) NOT NULL,
  `Vardas` text COLLATE utf8_lithuanian_ci NOT NULL,
  `Pavarde` text COLLATE utf8_lithuanian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Dumping data for table `autoriai`
--

INSERT INTO `autoriai` (`ID`, `Vardas`, `Pavarde`) VALUES
(1, 'Jonas', 'Jonaitis'),
(2, 'Petras', 'Petraitis'),
(3, 'Antanas', 'Antanaitis'),
(4, 'Ieva', 'Ievaite');

-- --------------------------------------------------------

--
-- Table structure for table `komentarai`
--

CREATE TABLE `komentarai` (
  `komentaroID` int(5) NOT NULL,
  `komentaras` text COLLATE utf8_lithuanian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kursai`
--

CREATE TABLE `kursai` (
  `kursoID` int(5) NOT NULL,
  `kursoPavadinimas` text COLLATE utf8_lithuanian_ci NOT NULL,
  `kursoAprasas` text COLLATE utf8_lithuanian_ci NOT NULL,
  `detalusAprasas` text COLLATE utf8_lithuanian_ci NOT NULL,
  `kursoIkelimoData` date NOT NULL DEFAULT current_timestamp(),
  `kursoNuotrauka` varchar(250) COLLATE utf8_lithuanian_ci NOT NULL,
  `kursoKaina` decimal(10,0) NOT NULL,
  `kursoAutorius` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Dumping data for table `kursai`
--

INSERT INTO `kursai` (`kursoID`, `kursoPavadinimas`, `kursoAprasas`, `detalusAprasas`, `kursoIkelimoData`, `kursoNuotrauka`, `kursoKaina`, `kursoAutorius`) VALUES
(1, 'PHP pagrindai', 'Lorem ipsum dolor sit ame', 'Lorem ipsum dolor sit ameLorem ipsum dolor sit ameLorem ipsum dolor sit ame', '0000-00-00', 'images/php.jpg', '500', 1),
(2, 'HTML CSS ivadas', 'Lorem ipsum dolor sit ame', 'Lorem ipsum dolor sit ameLorem ipsum dolor sit ameLorem ipsum dolor sit ame', '0000-00-00', 'images/css.jpg', '500', 2),
(3, 'Pazintis su GIT', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'Lorem ipsum dolor sit amet, consectetur adipiscing elitLorem ipsum dolor sit amet, consectetur adipiscing elit', '0000-00-00', 'images/git.jpg', '200', 3),
(4, 'JavaScript Zaliems ', 'Lorem ipsum dolor sit amet', 'Lorem ipsum dolor sit ametLorem ipsum dolor sit ametLorem ipsum dolor sit amet', '0000-00-00', 'images/js.jpg', '600', 4);

-- --------------------------------------------------------

--
-- Table structure for table `reitingas`
--

CREATE TABLE `reitingas` (
  `kursoID` int(5) NOT NULL,
  `reitingas` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `autoriai`
--
ALTER TABLE `autoriai`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `komentarai`
--
ALTER TABLE `komentarai`
  ADD PRIMARY KEY (`komentaroID`);

--
-- Indexes for table `kursai`
--
ALTER TABLE `kursai`
  ADD PRIMARY KEY (`kursoID`),
  ADD KEY `kursoAutorius` (`kursoAutorius`);

--
-- Indexes for table `reitingas`
--
ALTER TABLE `reitingas`
  ADD KEY `kursoID` (`kursoID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `komentarai`
--
ALTER TABLE `komentarai`
  ADD CONSTRAINT `komentarai_ibfk_1` FOREIGN KEY (`komentaroID`) REFERENCES `kursai` (`kursoID`);

--
-- Constraints for table `kursai`
--
ALTER TABLE `kursai`
  ADD CONSTRAINT `kursai_ibfk_1` FOREIGN KEY (`kursoAutorius`) REFERENCES `autoriai` (`ID`);

--
-- Constraints for table `reitingas`
--
ALTER TABLE `reitingas`
  ADD CONSTRAINT `reitingas_ibfk_1` FOREIGN KEY (`kursoID`) REFERENCES `kursai` (`kursoID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
