-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 16, 2022 lúc 05:59 AM
-- Phiên bản máy phục vụ: 10.4.24-MariaDB
-- Phiên bản PHP: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `projectqtdlieu`
--

DELIMITER $$
--
-- Thủ tục
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `sua_loaisanpham` (IN `ma_loai` INT(10), IN `ten_loai` CHAR(50), IN `mota_loai` CHAR(100))   BEGIN
	UPDATE loaisanpham SET ten_loaisanpham = ten_loai, mota_loaisanpham = mota_loai where ma_loaisanpham = ma_loai;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `them_loaisanpham` (IN `ten_loai` CHAR(50), IN `mota_loai` VARCHAR(100))   BEGIN
	INSERT INTO loaisanpham(ten_loaisanpham, mota_loaisanpham) VALUES (ten_loai, mota_loai);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `xoa_loaisanpham` (IN `ma_loai` INT(10))   BEGIN
	DECLARE flag boolean;
    SET flag = tontai_loaisanpham(ma_loai);
    IF flag = 1 THEN
    	DELETE FROM loaisanpham WHERE ma_loaisanpham = ma_loai;
    END IF;
END$$

--
-- Các hàm
--
CREATE DEFINER=`root`@`localhost` FUNCTION `tontai_loaisanpham` (`ma_loai` INT(10)) RETURNS TINYINT(1)  BEGIN
	DECLARE d int;
    DECLARE result boolean;
	SET d = (SELECT COUNT(*) FROM loaisanpham WHERE ma_loaisanpham = ma_loai);
    IF d > 0 THEN SET result = true;
    ELSE SET result = false;
    END IF;
    RETURN result;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loaisanpham`
--

CREATE TABLE `loaisanpham` (
  `ma_loaisanpham` int(10) NOT NULL,
  `ten_loaisanpham` varchar(50) NOT NULL,
  `mota_loaisanpham` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `loaisanpham`
--

INSERT INTO `loaisanpham` (`ma_loaisanpham`, `ten_loaisanpham`, `mota_loaisanpham`) VALUES
(1, 'Khăn giấy', 'Khăn giấy'),
(2, 'Bình nước', 'Bình nước');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lohang`
--

CREATE TABLE `lohang` (
  `ma_lohang` int(10) NOT NULL,
  `ngay_nhapvao` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `lohang`
--

INSERT INTO `lohang` (`ma_lohang`, `ngay_nhapvao`) VALUES
(1, '2022-10-11');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

CREATE TABLE `sanpham` (
  `ma_sanpham` int(10) NOT NULL,
  `ten_sanpham` varchar(50) NOT NULL,
  `donvi_sanpham` varchar(10) NOT NULL,
  `mota_sanpham` varchar(100) NOT NULL,
  `ma_loaisanpham` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`ma_sanpham`, `ten_sanpham`, `donvi_sanpham`, `mota_sanpham`, `ma_loaisanpham`) VALUES
(1, 'Khăn giấy cầu vòng', 'Gói', 'Khăn giấy', 1),
(2, 'Khăn giấy gấu trúc', 'Gói', 'Khăn giấy', 1),
(3, 'Bình thủy bình tinh', 'Bình', 'Bình nước', 2),
(4, 'Bình thủy giữ nhiệt', 'Bình', 'Bình nước', 2);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `loaisanpham`
--
ALTER TABLE `loaisanpham`
  ADD PRIMARY KEY (`ma_loaisanpham`);

--
-- Chỉ mục cho bảng `lohang`
--
ALTER TABLE `lohang`
  ADD PRIMARY KEY (`ma_lohang`);

--
-- Chỉ mục cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`ma_sanpham`),
  ADD KEY `ma_loaisanpham` (`ma_loaisanpham`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `loaisanpham`
--
ALTER TABLE `loaisanpham`
  MODIFY `ma_loaisanpham` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `lohang`
--
ALTER TABLE `lohang`
  MODIFY `ma_lohang` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `ma_sanpham` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `sanpham_ibfk_1` FOREIGN KEY (`ma_loaisanpham`) REFERENCES `loaisanpham` (`ma_loaisanpham`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
