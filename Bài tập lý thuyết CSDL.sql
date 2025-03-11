﻿								-- BÀI TẬP THỰC HIỆN CÁC CÂU TRUY VẤN SQL
-- TẠO DATABASE
CREATE DATABASE QUANLYSINHVIEN;
USE QUANLYSINHVIEN;

-- TẠO BẢNG KHOA
CREATE TABLE KHOA (
    MAKHOA VARCHAR(10) PRIMARY KEY,
    TENKHOA NVARCHAR(100) NOT NULL,
    DIENTHOAI VARCHAR(15)
);

-- TẠO BẢNG SINHVIEN
CREATE TABLE SINHVIEN (
    MASV VARCHAR(10) PRIMARY KEY,
    HOTEN NVARCHAR(100) NOT NULL,
    NGAYSINH DATE,
    GIOITINH NVARCHAR(3) CHECK (GIOITINH IN (N'NAM', N'NỮ')),
    MAKHOA VARCHAR(10),
    FOREIGN KEY (MAKHOA) REFERENCES KHOA(MAKHOA)
);

-- TẠO BẢNG MONHOC
CREATE TABLE MONHOC (
    MAMH VARCHAR(10) PRIMARY KEY,
    TENMH NVARCHAR(100) NOT NULL,
    SOTINCHI INT CHECK (SOTINCHI > 0)
);

-- TẠO BẢNG KETQUA
CREATE TABLE KETQUA (
    MASV VARCHAR(10),
    MAMH VARCHAR(10),
    DIEM FLOAT CHECK (DIEM >= 0 AND DIEM <= 10),
    PRIMARY KEY (MASV, MAMH),
    FOREIGN KEY (MASV) REFERENCES SINHVIEN(MASV),
    FOREIGN KEY (MAMH) REFERENCES MONHOC(MAMH)
);

-- CHÈN DỮ LIỆU MẪU VÀO BẢNG KHOA
INSERT INTO KHOA (MAKHOA, TENKHOA, DIENTHOAI) VALUES
('CNTT', N'CÔNG NGHỆ THÔNG TIN', '0123456789'),
('KT', N'KINH TẾ', '0987654321'),
('NN', N'NGOẠI NGỮ', '0912345678');

-- CHÈN DỮ LIỆU MẪU VÀO BẢNG SINHVIEN
INSERT INTO SINHVIEN (MASV, HOTEN, NGAYSINH, GIOITINH, MAKHOA) VALUES
('SV001', N'NGUYỄN VĂN NAM', '2002-05-15', N'NAM', 'CNTT'),
('SV002', N'TRẦN THỊ HÀ', '2003-08-20', N'NỮ', 'KT'),
('SV003', N'LÊ VĂN ĐẠT', '2002-12-01', N'NAM', 'NN'),
('SV004', N'PHẠM THỊ LINH', '2003-03-10', N'NỮ', 'CNTT');

-- CHÈN DỮ LIỆU MẪU VÀO BẢNG MONHOC
INSERT INTO MONHOC (MAMH, TENMH, SOTINCHI) VALUES
('MH001', N'CƠ SỞ DỮ LIỆU', 3),
('MH002', N'LẬP TRÌNH JAVA', 4),
('MH003', N'KINH TẾ VI MÔ', 3),
('MH004', N'TIẾNG ANH CƠ BẢN', 2);

-- CHÈN DỮ LIỆU MẪU VÀO BẢNG KETQUA
INSERT INTO KETQUA (MASV, MAMH, DIEM) VALUES
('SV001', 'MH001', 8.5),
('SV001', 'MH002', 7.0),
('SV002', 'MH003', 6.5),
('SV003', 'MH004', 9.0),
('SV004', 'MH001', 8.0),
('SV004', 'MH002', 7.5);

-- CÁC CÂU LỆNH TRUY VẤN

-- 1. SQL SELECT
SELECT HOTEN, NGAYSINH FROM SINHVIEN;

-- 2. SQL SELECT DISTINCT
SELECT DISTINCT MAKHOA FROM SINHVIEN;

-- 3. SQL WHERE
SELECT HOTEN FROM SINHVIEN WHERE MAKHOA = 'CNTT';

-- 4. SQL ORDER BY
SELECT HOTEN, NGAYSINH FROM SINHVIEN ORDER BY NGAYSINH ASC;

-- 5. SQL AND
SELECT HOTEN FROM SINHVIEN WHERE MAKHOA = 'CNTT' AND GIOITINH = N'NAM';

-- 6. SQL OR
SELECT HOTEN FROM SINHVIEN WHERE MAKHOA = 'CNTT' OR MAKHOA = 'KT';

-- 7. SQL NOT
SELECT HOTEN FROM SINHVIEN WHERE MAKHOA NOT IN ('NN');

-- 8. SQL INSERT INTO
INSERT INTO SINHVIEN (MASV, HOTEN, NGAYSINH, GIOITINH, MAKHOA)
VALUES ('SV005', N'HOÀNG VĂN LONG', '2002-07-25', N'NAM', 'KT');

-- 9. SQL NULL VALUES
SELECT HOTEN FROM SINHVIEN WHERE NGAYSINH IS NOT NULL;

-- 10. SQL UPDATE
UPDATE SINHVIEN SET GIOITINH = N'NỮ' WHERE MASV = 'SV001';

-- 11. SQL DELETE
DELETE FROM KETQUA WHERE DIEM < 5.0;

-- 12. SQL SELECT TOP
SELECT TOP 2 HOTEN FROM SINHVIEN;

-- 13. SQL AGGREGATE FUNCTIONS
SELECT COUNT(*) AS TONGSV FROM SINHVIEN;

-- 14. SQL MIN AND MAX
SELECT MIN(DIEM) AS DIEMTHAPNHAT, MAX(DIEM) AS DIEMCAONHAT FROM KETQUA;

-- 15. SQL COUNT
SELECT MAKHOA, COUNT(*) AS SOSV FROM SINHVIEN GROUP BY MAKHOA;

-- 16. SQL SUM
SELECT MASV, SUM(DIEM) AS TONGDIEM FROM KETQUA GROUP BY MASV;

-- 17. SQL AVG
SELECT MASV, AVG(DIEM) AS DIEMTB FROM KETQUA GROUP BY MASV;

-- 18. SQL LIKE
SELECT HOTEN FROM SINHVIEN WHERE HOTEN LIKE N'NGUYỄN%';

-- 19. SQL WILDCARDS
SELECT HOTEN FROM SINHVIEN WHERE HOTEN LIKE N'% THỊ %';

-- 20. SQL IN
SELECT HOTEN FROM SINHVIEN WHERE MAKHOA IN ('CNTT', 'KT');

-- 21. SQL BETWEEN
SELECT MASV, DIEM FROM KETQUA WHERE DIEM BETWEEN 7.0 AND 9.0;

-- 22. SQL ALIASES
SELECT SV.HOTEN AS TENSINHVIEN, K.TENKHOA AS TENKHOA
FROM SINHVIEN SV
JOIN KHOA K ON SV.MAKHOA = K.MAKHOA;

-- 23. SQL JOIN 
SELECT SV.HOTEN, K.TENKHOA, KQ.DIEM
FROM SINHVIEN SV
JOIN KHOA K ON SV.MAKHOA = K.MAKHOA
JOIN KETQUA KQ ON SV.MASV = KQ.MASV;

-- 24. SQL INNER JOIN
SELECT SV.HOTEN, K.TENKHOA
FROM SINHVIEN SV
INNER JOIN KHOA K ON SV.MAKHOA = K.MAKHOA;

-- 25. SQL LEFT JOIN
SELECT SV.HOTEN, KQ.DIEM
FROM SINHVIEN SV
LEFT JOIN KETQUA KQ ON SV.MASV = KQ.MASV;

-- 26. SQL RIGHT JOIN
SELECT KQ.DIEM, MH.TENMH
FROM KETQUA KQ
RIGHT JOIN MONHOC MH ON KQ.MAMH = MH.MAMH;

-- 27. SQL FULL JOIN
SELECT SV.HOTEN, KQ.DIEM
FROM SINHVIEN SV
FULL OUTER JOIN KETQUA KQ ON SV.MASV = KQ.MASV;

-- 28. SQL SELF JOIN
SELECT A.HOTEN AS SINHVIEN, B.HOTEN AS HUONGDAN
FROM SINHVIEN A
JOIN SINHVIEN B ON A.MASV = B.MASV;

-- 29. SQL UNION
SELECT HOTEN FROM SINHVIEN WHERE MAKHOA = 'CNTT'
UNION
SELECT HOTEN FROM SINHVIEN WHERE MAKHOA = 'KT';

-- 30. SQL GROUP BY
SELECT MAKHOA, COUNT(*) AS SOSV
FROM SINHVIEN
GROUP BY MAKHOA;

-- 31. SQL HAVING
SELECT MASV, AVG(DIEM) AS DIEMTB
FROM KETQUA
GROUP BY MASV
HAVING AVG(DIEM) > 7.0;

-- 32. SQL EXISTS
SELECT HOTEN
FROM SINHVIEN SV
WHERE EXISTS (
    SELECT * FROM KETQUA KQ WHERE KQ.MASV = SV.MASV AND KQ.DIEM > 8.0
);

-- 33. SQL ANY, ALL
-- SQL ANY
SELECT HOTEN
FROM SINHVIEN SV
WHERE MASV = ANY (
    SELECT MASV FROM KETQUA WHERE DIEM > 7.0
);

-- SQL ALL
SELECT HOTEN
FROM SINHVIEN SV
WHERE MASV IN (
    SELECT MASV FROM KETQUA WHERE DIEM > ALL (SELECT DIEM FROM KETQUA WHERE DIEM < 8.0)
);