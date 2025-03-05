-- Tạo cơ sở dữ liệu DIALYVN
CREATE DATABASE DIALYVN;
GO

-- Chuyển sang sử dụng cơ sở dữ liệu DIALYVN
USE DIALYVN;
GO

-- Tạo bảng TINH_TP: Lưu trữ thông tin các tỉnh/thành phố
CREATE TABLE TINH_TP (
    MA_T_TP VARCHAR(3) PRIMARY KEY,   -- Mã tỉnh/thành phố (3 ký tự)
    TEN_T_TP NVARCHAR(20),            -- Tên tỉnh/thành phố
    DT FLOAT,                         -- Diện tích (km²)
    DS BIGINT,                        -- Dân số
    MIEN NVARCHAR(10)                 -- Miền (Bắc, Trung, Nam)
);
GO

-- Thêm dữ liệu vào bảng TINH_TP (62 tỉnh/thành phố hiện tại)
INSERT INTO TINH_TP (MA_T_TP, TEN_T_TP, DT, DS, MIEN) VALUES
('AG', N'An Giang', 3406, 2142709, N'Nam'),
('BR', N'Bà Rịa - Vũng Tàu', 1982, 996682, N'Nam'),
('BC', N'Bắc Cạn', 4857, 293826, N'Bắc'),
('BG', N'Bắc Giang', 3823, 1554131, N'Bắc'),
('BL', N'Bạc Liêu', 2526, 856518, N'Nam'),
('BN', N'Bắc Ninh', 808, 1024472, N'Bắc'),
('BT', N'Bến Tre', 2322, 1255946, N'Nam'),
('BDI', N'Bình Định', 6025, 1486465, N'Trung'),
('BD', N'Bình Dương', 2696, 1481550, N'Nam'),
('BP', N'Bình Phước', 6857, 873598, N'Nam'),
('BTH', N'Bình Thuận', 7828, 1167023, N'Trung'),
('CM', N'Cà Mau', 5202, 1206938, N'Nam'),
('CT', N'Cần Thơ', 1390, 1188435, N'Nam'),
('CB', N'Cao Bằng', 6691, 507183, N'Bắc'),
('DN', N'Đà Nẵng', 1256, 887435, N'Trung'),
('DL', N'Đắk Lắk', 13085, 1733624, N'Trung'),
('DNO', N'Đắk Nông', 6515, 489392, N'Trung'),
('DB', N'Điện Biên', 9560, 490306, N'Bắc'),
('DNA', N'Đồng Nai', 5895, 2486154, N'Nam'),
('DT', N'Đồng Tháp', 3246, 1666467, N'Nam'),
('GL', N'Gia Lai', 15495, 1274412, N'Trung'),
('HG', N'Hà Giang', 7884, 724537, N'Bắc'),
('HNA', N'Hà Nam', 852, 784045, N'Bắc'),
('HN', N'Hà Nội', 3334.47, 6451909, N'Bắc'),
('HT', N'Hà Tây', 2193, 2047000, N'Bắc'),
('HTI', N'Hà Tĩnh', 6055.70, 1227554, N'Trung'),
('HD', N'Hải Dương', 1648, 1705059, N'Bắc'),
('HP', N'Hải Phòng', 1526, 1837173, N'Bắc'),
('HAG', N'Hậu Giang', 1608, 757300, N'Nam'),
('HB', N'Hòa Bình', 4663, 785217, N'Bắc'),
('HY', N'Hưng Yên', 923, 1127903, N'Bắc'),
('KH', N'Khánh Hòa', 5198, 1157604, N'Trung'),
('KG', N'Kiên Giang', 6268, 1688248, N'Nam'),
('KT', N'Kon Tum', 9615, 430133, N'Trung'),
('LC', N'Lai Châu', 9059, 370502, N'Bắc'),
('LD', N'Lâm Đồng', 9765, 1187574, N'Trung'),
('LS', N'Lạng Sơn', 8305, 732515, N'Bắc'),
('LCA', N'Lào Cai', 6357, 614595, N'Bắc'),
('LA', N'Long An', 4491, 1436066, N'Nam'),
('ND', N'Nam Định', 1641, 1817105, N'Bắc'),
('NA', N'Nghệ An', 16487, 3113055, N'Trung'),
('NB', N'Ninh Bình', 1384, 898999, N'Bắc'),
('NT', N'Ninh Thuận', 3360, 564993, N'Trung'),
('PT', N'Phú Thọ', 3520, 1316389, N'Bắc'),
('PY', N'Phú Yên', 5045, 862231, N'Trung'),
('QB', N'Quảng Bình', 8051.80, 846924, N'Trung'),
('QN', N'Quảng Nam', 10407, 1422319, N'Trung'),
('QNG', N'Quảng Ngãi', 5138, 1216773, N'Trung'),
('QNI', N'Quảng Ninh', 5900, 1144988, N'Bắc'),
('QT', N'Quảng Trị', 4745.70, 597985, N'Trung'),
('ST', N'Sóc Trăng', 3223, 1292853, N'Nam'),
('SL', N'Sơn La', 14055, 1076055, N'Bắc'),
('TN', N'Tây Ninh', 4030, 1066513, N'Nam'),
('TB', N'Thái Bình', 1570, 1781842, N'Bắc'),
('TNG', N'Thái Nguyên', 3543, 1123116, N'Bắc'),
('TH', N'Thanh Hóa', 11116, 3400595, N'Bắc'),
('TTH', N'Thừa Thiên Huế', 5053.99, 1087579, N'Trung'),
('TG', N'Tiền Giang', 2367, 1672271, N'Nam'),
('HCM', N'TP Hồ Chí Minh', 2095, 8999469, N'Nam'),
('TV', N'Trà Vinh', 2215, 1003012, N'Nam'),
('TQ', N'Tuyên Quang', 5868, 724821, N'Bắc'),
('VL', N'Vĩnh Long', 1475, 1024707, N'Nam'),
('VP', N'Vĩnh Phúc', 1371, 999786, N'Bắc'),
('YB', N'Yên Bái', 6883, 740387, N'Bắc');
GO

-- Tạo bảng BIENGIOI: Lưu thông tin tỉnh giáp biên giới quốc gia
CREATE TABLE BIENGIOI (
    NUOC NVARCHAR(15),                -- Quốc gia giáp ranh (CPC, Lào, TQ...)
    MA_T_TP VARCHAR(3),              -- Mã tỉnh/thành phố giáp biên giới
    CONSTRAINT FK_BIENGIOI_TINH_TP FOREIGN KEY (MA_T_TP) REFERENCES TINH_TP(MA_T_TP)
);
GO

-- Thêm dữ liệu vào bảng BIENGIOI
-- Dữ liệu bao gồm quốc gia và mã tỉnh giáp ranh
INSERT INTO BIENGIOI (NUOC, MA_T_TP) VALUES
(N'CPC', 'AG'), (N'CPC', 'DL'), (N'CPC', 'DT'), (N'CPC', 'GL'), (N'CPC', 'KG'),
(N'CPC', 'LA'), (N'CPC', 'BP'), (N'CPC', 'TN'), (N'LAO', 'GL'), (N'LAO', 'LC'), (N'LAO', 'NT'),
(N'LAO', 'BT'), (N'TQ', 'CB'), (N'TQ', 'LC');
GO

-- Tạo bảng LANGGIENG: Lưu thông tin tỉnh/thành phố giáp ranh nhau
CREATE TABLE LANGGIENG (
    MA_T_TP VARCHAR(3),              -- Mã tỉnh/thành phố
    LG VARCHAR(3),                   -- Mã tỉnh/thành phố láng giềng
    CONSTRAINT FK_LANGGIENG_MA_T_TP FOREIGN KEY (MA_T_TP) REFERENCES TINH_TP(MA_T_TP),
    CONSTRAINT FK_LANGGIENG_LG FOREIGN KEY (LG) REFERENCES TINH_TP(MA_T_TP)
);
GO

-- Thêm dữ liệu vào bảng LANGGIENG
-- Bao gồm cặp mã tỉnh và tỉnh láng giềng tương ứng
INSERT INTO LANGGIENG (MA_T_TP, LG) VALUES
('AG', 'DT'), ('AG', 'CT'), ('AG', 'KG'),
('BR', 'HCM'), ('BR', 'BTH'),('BR', 'DNA'),
('DNA', 'BTH'), ('DNA', 'BR'), ('DNA', 'HCM'),
('BD', 'TN'), ('BD', 'DNA'), ('BD', 'BP'), ('BD', 'HCM'),
('BP', 'DL'), ('BP', 'BD'), ('BP', 'LD'), ('BP', 'DNA'),
('BL', 'KG'), ('BL', 'CT'), ('BL', 'CM'), ('BL', 'ST'),
('BT', 'TG'), ('BT', 'VL'), ('BT', 'TV'), ('BT', 'HCM'),
('CM', 'KG'), ('CM', 'BL'),
('CT', 'AG'), ('CT', 'DT'), ('CT', 'VL'), ('CT', 'KG'), ('CT', 'BL'), ('CT', 'ST'),
('DT', 'AG'), ('DT', 'LA'), ('DT', 'TG'),
('HAG', 'CT'), ('HAG', 'ST'), ('HAG', 'VL'), ('HAG', 'KG'),
('LA', 'TN'), ('LA', 'TG'), ('LA', 'DT'), ('LA', 'HCM'),
('HCM', 'BD'), ('HCM', 'TN'), ('HCM', 'DNA'), ('HCM', 'BR'), ('HCM', 'LA'), ('HCM', 'TG'),
('TG', 'LA'), ('TG', 'DT'), ('TG', 'BT'), ('TG', 'VL'),
('TN', 'BD'), ('TN', 'BP'), ('TN', 'LA'), ('TN', 'HCM'),
('BTH', 'DNA');
GO

-- Truy vấn kiểm tra dữ liệu 

-- 1.a) Có diện tích >= 5000 Km²:
SELECT TEN_T_TP, DS
FROM TINH_TP
WHERE DT >= 5000;


-- 1.b) Có diện tích >= [input]:
DECLARE @DienTich FLOAT = 4000; -- Thay 4000 bằng giá trị nhập
SELECT TEN_T_TP, DS
FROM TINH_TP
WHERE DT >= @DienTich;


-- 2. Xuất ra tên tỉnh, TP cùng với diện tích của tỉnh, TP:
SELECT TEN_T_TP, DT
FROM TINH_TP;


-- 3. Thuộc miền Bắc:
SELECT TEN_T_TP
FROM TINH_TP
WHERE MIEN = N'Bắc';


-- 4. Thuộc miền [input]:
DECLARE @Mien NVARCHAR(10) = N'Nam'; -- Thay bằng miền nhập
SELECT TEN_T_TP
FROM TINH_TP
WHERE MIEN = @Mien;

-- 5. Xuất ra các tỉnh, TP biên giới thuộc miền [input]:
DECLARE @Mien NVARCHAR(10) = N'Bắc'; -- Thay bằng miền nhập
SELECT T.TEN_T_TP
FROM TINH_TP T
JOIN BIENGIOI B ON T.MA_T_TP = B.MA_T_TP
WHERE T.MIEN = @Mien;

-- 6. Diện tích trung bình của các tỉnh, TP:
SELECT AVG(DT) AS DIEN_TICH_TRUNG_BINH
FROM TINH_TP;


-- 7. Tỉnh, TP có diện tích > 7000 Km²:
SELECT TEN_T_TP
FROM TINH_TP
WHERE DT > 7000;


-- 8. Dân số cùng tên tỉnh miền Bắc:
SELECT TEN_T_TP, DS
FROM TINH_TP
WHERE MIEN = N'Bắc';


-- 9. Mã nước biên giới các tỉnh miền Nam:
SELECT DISTINCT B.NUOC
FROM BIENGIOI B
JOIN TINH_TP T ON B.MA_T_TP = T.MA_T_TP
WHERE T.MIEN = N'Nam';


-- 10. Diện tích trung bình (sử dụng hàm):
SELECT AVG(DT) AS DIEN_TICH_TRUNG_BINH
FROM TINH_TP;


-- 11. Mật độ dân số (DS/DT) cùng với tên tỉnh, TP:
SELECT TEN_T_TP, (DS/DT) AS MAT_DO_DAN_SO
FROM TINH_TP;


-- 12. Các tỉnh, TP láng giềng Long An:
SELECT T2.TEN_T_TP
FROM LANGGIENG L
JOIN TINH_TP T1 ON L.MA_T_TP = T1.MA_T_TP
JOIN TINH_TP T2 ON L.LG = T2.MA_T_TP
WHERE T1.TEN_T_TP = N'Long An';


-- 13. Số lượng tỉnh, TP giáp với CPC:
SELECT COUNT(DISTINCT MA_T_TP) AS SO_TINH_GIAP_CPC
FROM BIENGIOI
WHERE NUOC = N'CPC';


-- 14. Tỉnh, TP có diện tích lớn nhất:
SELECT TOP 1 TEN_T_TP, DT
FROM TINH_TP
ORDER BY DT DESC;


-- 15. Tỉnh, TP có mật độ dân số đông nhất:
SELECT TOP 1 TEN_T_TP, (DS/DT) AS MAT_DO
FROM TINH_TP
ORDER BY (DS/DT) DESC;


-- 16. Tỉnh, TP giáp hai nước khác nhau:
SELECT B.MA_T_TP, T.TEN_T_TP
FROM BIENGIOI B
JOIN TINH_TP T ON B.MA_T_TP = T.MA_T_TP
GROUP BY B.MA_T_TP, T.TEN_T_TP
HAVING COUNT(DISTINCT B.NUOC) = 2;


-- 17. Danh sách các miền cùng tỉnh, TP:
SELECT MIEN, STRING_AGG(TEN_T_TP, ', ') AS DS_TINH
FROM TINH_TP
GROUP BY MIEN;


-- 18. Tỉnh, TP có nhiều láng giềng nhất:
SELECT TOP 1 T.TEN_T_TP, COUNT(L.LG) AS SO_LANG_GIENG
FROM LANGGIENG L
JOIN TINH_TP T ON L.MA_T_TP = T.MA_T_TP
GROUP BY T.TEN_T_TP
ORDER BY SO_LANG_GIENG DESC;

-- 19. Tỉnh, TP có diện tích nhỏ hơn trung bình cả nước:
SELECT TEN_T_TP, DT
FROM TINH_TP
WHERE DT < (SELECT AVG(DT) FROM TINH_TP);


-- 20. Tỉnh, TP giáp miền 'Nam' nhưng không thuộc miền Nam:
SELECT DISTINCT T1.TEN_T_TP
FROM LANGGIENG L
JOIN TINH_TP T1 ON L.MA_T_TP = T1.MA_T_TP
JOIN TINH_TP T2 ON L.LG = T2.MA_T_TP
WHERE T2.MIEN = N'Nam' AND T1.MIEN <> N'Nam';



-- 21. Tỉnh, TP có diện tích lớn hơn tất cả láng giềng:
SELECT T1.TEN_T_TP
FROM TINH_TP T1
WHERE NOT EXISTS (
    SELECT 1
    FROM LANGGIENG L
    JOIN TINH_TP T2 ON L.LG = T2.MA_T_TP
    WHERE L.MA_T_TP = T1.MA_T_TP AND T2.DT >= T1.DT
);


-- 22. Đi từ TP HCM xuyên qua 3 tỉnh khác nhau không lặp:
WITH DI_CHUYEN AS (
    SELECT L1.LG AS TINH1, L2.LG AS TINH2, L3.LG AS TINH3
    FROM LANGGIENG L1
    JOIN LANGGIENG L2 ON L1.LG = L2.MA_T_TP AND L2.LG <> 'HCM'
    JOIN LANGGIENG L3 ON L2.LG = L3.MA_T_TP AND L3.LG <> L1.MA_T_TP
    WHERE L1.MA_T_TP = 'HCM'
)
SELECT * FROM DI_CHUYEN;



-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


CREATE DATABASE DIALYVN_0525
GO

USE DIALYVN_0525
GO

CREATE TABLE TINH_TP(
	MA_T_TP VARCHAR(3) PRIMARY KEY,
	TEN_T_TP NVARCHAR(20),
	DT FLOAT, 
	DS BIGINT,
	MIEN NVARCHAR(10)
)
GO

CREATE TABLE BIENGIOI(
	NUOC NVARCHAR(15) NOT NULL,
	MA_T_TP VARCHAR(3) NOT NULL
)
GO

-- ALTER TABLE BIENGIOI ALTER COLUMN NUOC NVARCHAR(15) NOT NULL
-- ALTER TABLE BIENGIOI ALTER COLUMN MA_T_TP VARCHAR(3) NOT NULL
-- GO

ALTER TABLE BIENGIOI ADD CONSTRAINT PK_BG PRIMARY KEY (NUOC, MA_T_TP),
						 CONSTRAINT FK_BG_TTP FOREIGN KEY (MA_T_TP) REFERENCES TINH_TP(MA_T_TP)
GO

CREATE TABLE LANGGIENG(
	MA_T_TP VARCHAR(3),
	LG VARCHAR(3)
)
GO

ALTER TABLE LANGGIENG ALTER COLUMN MA_T_TP VARCHAR(3) NOT NULL
ALTER TABLE LANGGIENG ALTER COLUMN LG VARCHAR(3) NOT NULL
GO

ALTER TABLE LANGGIENG ADD CONSTRAINT PK_LG PRIMARY KEY (MA_T_TP, LG),
						 CONSTRAINT FK_LG_TTP01 FOREIGN KEY (MA_T_TP) REFERENCES TINH_TP(MA_T_TP),
						 CONSTRAINT FK_LG_TTP02 FOREIGN KEY (LG) REFERENCES TINH_TP(MA_T_TP)
GO