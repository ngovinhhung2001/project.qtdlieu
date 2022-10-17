-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 17, 2022 at 03:58 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.0.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `projectqtdlieu`
--
CREATE DATABASE IF NOT EXISTS `projectqtdlieu` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `projectqtdlieu`;

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `sua_loaisanpham`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sua_loaisanpham` (IN `ma_loai` INT(10), IN `ten_loai` CHAR(50), IN `mota_loai` CHAR(100))   BEGIN
	UPDATE loaisanpham SET ten_loaisanpham = ten_loai, mota_loaisanpham = mota_loai where ma_loaisanpham = ma_loai;
END$$

DROP PROCEDURE IF EXISTS `sua_lohang`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sua_lohang` (IN `ngay` DATE)   BEGIN
	UPDATE lohang SET ngay_nhapvao = ngay where ma_lohang = ma_lo;
END$$

DROP PROCEDURE IF EXISTS `sua_sanpham`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sua_sanpham` (IN `ma` INT(10), IN `ten` CHAR(50), IN `donvi` CHAR(10), IN `mota` CHAR(100), IN `ma_loai` INT(10))   BEGIN
	UPDATE sanpham SET ten_sanpham = ten, donvi_sanpham = donvi, mota_sanpham = mota, ma_loaisanpham = ma_loai where ma_sanpham = ma;
END$$

DROP PROCEDURE IF EXISTS `them_loaisanpham`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `them_loaisanpham` (IN `ten_loai` CHAR(50), IN `mota_loai` VARCHAR(100))   BEGIN
	INSERT INTO loaisanpham(ten_loaisanpham, mota_loaisanpham) VALUES (ten_loai, mota_loai);
END$$

DROP PROCEDURE IF EXISTS `them_lohang`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `them_lohang` (IN `ngay` DATE)   BEGIN
	INSERT INTO lohang (ngay_nhapvao) VALUES (ngay);
END$$

DROP PROCEDURE IF EXISTS `them_lohangsanpham`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `them_lohangsanpham` (IN `ma_lo` INT, IN `ma_sp` INT, IN `gia` INT, IN `sl` INT)   BEGIN
	INSERT INTO `lohangsanpham` (`ma_lohang`, `ma_sanpham`,`gia_nhapvao`,`so_luong`) VALUES (ma_lo,ma_sp,gia, sl);
END$$

DROP PROCEDURE IF EXISTS `them_sanpham`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `them_sanpham` (IN `ten` CHAR(50), IN `donvi` CHAR(10), IN `mota` CHAR(100), IN `ma_loai` INT(10))   BEGIN
	INSERT INTO sanpham (ten_sanpham, donvi_sanpham, mota_sanpham, ma_loaisanpham) VALUES (ten, donvi, mota, ma_loai);
END$$

DROP PROCEDURE IF EXISTS `xoa_loaisanpham`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `xoa_loaisanpham` (IN `ma_loai` INT(10))   BEGIN
    DELETE FROM loaisanpham WHERE ma_loaisanpham = ma_loai;
END$$

DROP PROCEDURE IF EXISTS `xoa_lohang`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `xoa_lohang` (IN `ma_lo` INT(10))   BEGIN
    DELETE FROM lohang WHERE ma_lohang = ma_lo;
END$$

DROP PROCEDURE IF EXISTS `xoa_lohangsanpham`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `xoa_lohangsanpham` (IN `ma_lo` INT(10), IN `ma_sp` INT(10))   BEGIN
    DELETE FROM lohangsanpham WHERE ma_sanpham = ma_sp and ma_lohang=ma_lo;
END$$

DROP PROCEDURE IF EXISTS `xoa_sanpham`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `xoa_sanpham` (IN `ma` INT(10))   BEGIN
    DELETE FROM sanpham WHERE ma_sanpham = ma;
END$$

--
-- Functions
--
DROP FUNCTION IF EXISTS `tontai_loaisanpham`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `tontai_loaisanpham` (`ma_loai` INT(10)) RETURNS TINYINT(1)  BEGIN
	DECLARE d int;
    DECLARE result boolean;
	SET d = (SELECT COUNT(*) FROM loaisanpham WHERE ma_loaisanpham = ma_loai);
    IF d > 0 THEN SET result = true;
    ELSE SET result = false;
    END IF;
    RETURN result;
END$$

DROP FUNCTION IF EXISTS `tontai_lohang`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `tontai_lohang` (`ma_lo` INT(10)) RETURNS TINYINT(1)  BEGIN
	DECLARE d int;
    DECLARE result boolean;
	SET d = (SELECT COUNT(*) FROM lohang WHERE ma_lohang = ma_lo);
    IF d > 0 THEN SET result = true;
    ELSE SET result = false;
    END IF;
    RETURN result;
END$$

DROP FUNCTION IF EXISTS `tontai_sanpham`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `tontai_sanpham` (`ma` INT(10)) RETURNS TINYINT(1)  BEGIN
	DECLARE d int;
    DECLARE result boolean;
	SET d = (SELECT COUNT(*) FROM sanpham WHERE ma_sanpham = ma);
    IF d > 0 THEN SET result = true;
    ELSE SET result = false;
    END IF;
    RETURN result;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `loaisanpham`
--

DROP TABLE IF EXISTS `loaisanpham`;
CREATE TABLE `loaisanpham` (
  `ma_loaisanpham` int(10) NOT NULL,
  `ten_loaisanpham` varchar(50) NOT NULL,
  `mota_loaisanpham` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `loaisanpham`
--

INSERT INTO `loaisanpham` (`ma_loaisanpham`, `ten_loaisanpham`, `mota_loaisanpham`) VALUES
(1, 'Khăn giấy', 'Khăn giấy'),
(2, 'Bình nước', 'Bình nước');

-- --------------------------------------------------------

--
-- Table structure for table `lohang`
--

DROP TABLE IF EXISTS `lohang`;
CREATE TABLE `lohang` (
  `ma_lohang` int(10) NOT NULL,
  `ngay_nhapvao` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lohang`
--

INSERT INTO `lohang` (`ma_lohang`, `ngay_nhapvao`) VALUES
(1, '2022-10-11'),
(2, '2022-10-11'),
(3, '2022-10-11');

-- --------------------------------------------------------

--
-- Table structure for table `lohangsanpham`
--

DROP TABLE IF EXISTS `lohangsanpham`;
CREATE TABLE `lohangsanpham` (
  `ma_lohang` int(10) NOT NULL,
  `ma_sanpham` int(10) NOT NULL,
  `gia_nhapvao` int(10) NOT NULL,
  `so_luong` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sanpham`
--

DROP TABLE IF EXISTS `sanpham`;
CREATE TABLE `sanpham` (
  `ma_sanpham` int(10) NOT NULL,
  `ten_sanpham` varchar(50) NOT NULL,
  `donvi_sanpham` varchar(10) NOT NULL,
  `mota_sanpham` varchar(100) NOT NULL,
  `ma_loaisanpham` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sanpham`
--

INSERT INTO `sanpham` (`ma_sanpham`, `ten_sanpham`, `donvi_sanpham`, `mota_sanpham`, `ma_loaisanpham`) VALUES
(1, 'Khăn giấy cầu vòng', 'Gói', 'Khăn giấy', 1),
(2, 'Khăn giấy gấu trúc', 'Gói', 'Khăn giấy', 1),
(3, 'Bình thủy bình tinh', 'Bình', 'Bình nước', 2),
(4, 'Bình thủy giữ nhiệt', 'Bình', 'Bình nước', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `loaisanpham`
--
ALTER TABLE `loaisanpham`
  ADD PRIMARY KEY (`ma_loaisanpham`);

--
-- Indexes for table `lohang`
--
ALTER TABLE `lohang`
  ADD PRIMARY KEY (`ma_lohang`);

--
-- Indexes for table `lohangsanpham`
--
ALTER TABLE `lohangsanpham`
  ADD KEY `ma_lohang` (`ma_lohang`),
  ADD KEY `ma_sanpham` (`ma_sanpham`);

--
-- Indexes for table `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`ma_sanpham`),
  ADD KEY `ma_loaisanpham` (`ma_loaisanpham`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `loaisanpham`
--
ALTER TABLE `loaisanpham`
  MODIFY `ma_loaisanpham` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `lohang`
--
ALTER TABLE `lohang`
  MODIFY `ma_lohang` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `ma_sanpham` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `lohangsanpham`
--
ALTER TABLE `lohangsanpham`
  ADD CONSTRAINT `lohangsanpham_ibfk_1` FOREIGN KEY (`ma_lohang`) REFERENCES `lohang` (`ma_lohang`),
  ADD CONSTRAINT `lohangsanpham_ibfk_2` FOREIGN KEY (`ma_sanpham`) REFERENCES `sanpham` (`ma_sanpham`);

--
-- Constraints for table `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `sanpham_ibfk_1` FOREIGN KEY (`ma_loaisanpham`) REFERENCES `loaisanpham` (`ma_loaisanpham`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
