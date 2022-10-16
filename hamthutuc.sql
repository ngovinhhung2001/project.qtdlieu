DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `tontai_loaisanpham`(`ma_loai` INT(10)) RETURNS tinyint(1)
BEGIN
	DECLARE d int;
    DECLARE result boolean;
	SET d = (SELECT COUNT(*) FROM loaisanpham WHERE ma_loaisanpham = ma_loai);
    IF d > 0 THEN SET result = true;
    ELSE SET result = false;
    END IF;
    RETURN result;
END$$
DELIMITER ;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sua_loaisanpham`(IN `ma_loai` INT(10), IN `ten_loai` CHAR(50), IN `mota_loai` CHAR(100))
BEGIN
	UPDATE loaisanpham SET ten_loaisanpham = ten_loai, mota_loaisanpham = mota_loai where ma_loaisanpham = ma_loai;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `them_loaisanpham`(IN ten_loai char(50), IN mota_loai varchar(100))
BEGIN
	INSERT INTO loaisanpham(ten_loaisanpham, mota_loaisanpham) VALUES (ten_loai, mota_loai);
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `xoa_loaisanpham`(IN ma_loai int(10))
BEGIN
	DECLARE flag boolean;
    SET flag = tontai_loaisanpham(ma_loai);
    IF flag = 1 THEN
    	DELETE FROM loaisanpham WHERE ma_loaisanpham = ma_loai;
    END IF;
END$$
DELIMITER ;