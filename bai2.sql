-- Tạo database
CREATE DATABASE QuanLySinhVien;
GO

-- Sử dụng database
USE QuanLySinhVien;
GO

-- Tạo bảng LOP
CREATE TABLE LOP (
    MaLop CHAR(7),
    TenLop NVARCHAR(50),
    SiSo TINYINT,
    PRIMARY KEY (MaLop)
);

-- Tạo bảng MONHOC
CREATE TABLE MONHOC (
    MaMH CHAR(6),
    TenMH NVARCHAR(50),
    TCLT TINYINT,
    TCTH TINYINT,
    PRIMARY KEY (MaMH)
);

-- Tạo bảng SINHVIEN
CREATE TABLE SINHVIEN (
    MSSV CHAR(6),
    HoTen NVARCHAR(50),
    NTNS DATE,
    Phai BIT,
    MaLop CHAR(7),
    PRIMARY KEY (MSSV),
    FOREIGN KEY (MaLop) REFERENCES LOP(MaLop)
);

-- Tạo bảng DIEMSV
CREATE TABLE DIEMSV (
    MSSV CHAR(6),
    MaMH CHAR(6),
    Diem DECIMAL(3, 1),
    PRIMARY KEY (MSSV, MaMH),
    FOREIGN KEY (MSSV) REFERENCES SINHVIEN(MSSV),
    FOREIGN KEY (MaMH) REFERENCES MONHOC(MaMH)
);
GO

-- Chèn dữ liệu vào bảng LOP
INSERT INTO LOP (MaLop, TenLop, SiSo) VALUES
('18DTH01', N'CNTT Khóa 18, Lớp 1', 50),
('18DTH02', N'CNTT Khóa 18, Lớp 2', 45),
('19DTH01', N'CNTT Khóa 19, Lớp 1', 55),
('19DTH02', N'CNTT Khóa 19, Lớp 2', 50),
('19DTH03', N'CNTT Khóa 19, Lớp 3', 40);

-- Chèn dữ liệu vào bảng MONHOC
INSERT INTO MONHOC (MaMH, TenMH, TCLT, TCTH) VALUES
('COS201', N'Kỹ thuật lập trình', 2, 1),
('COS202', N'Lý thuyết đồ thị', 2, 1),
('COS203', N'CSDLvà quản trị CSDL', 3, 0),
('COS204', N'Phân tích thiết kế hệ thống', 3, 0),
('COS205', N'CSDL phần mềm', 3, 0);

-- Chèn dữ liệu vào bảng SINHVIEN
INSERT INTO SINHVIEN (MSSV, HoTen, NTNS, Phai, MaLop) VALUES
('170001', N'Lê Hoàng An', '12/10/1999', 1, '18DTH01'),
('180002', N'Nguyễn Thị Hòa Bình', '20/11/2000', 1, '18DTH01'),
('180003', N'Phạm Tường Châu', '07/06/2000', 0, '18DTH02'),
('180004', N'Trần Công Danh', '31/01/2000', 0, '19DTH01');

-- Chèn dữ liệu vào bảng DIEMSV
INSERT INTO DIEMSV (MSSV, MaMH, Diem) VALUES
('170001', 'COS201', 10),
('170001', 'COS202', 10),
('170001', 'COS203', 10),
('170001', 'COS204', 10),
('170001', 'COS205', 10),
('180002', 'COS201', 3.5),
('180002', 'COS202', 7),
('180003', 'COS201', 8.5),
('180003', 'COS202', 2),
('180003', 'COS203', 6.5),
('180004', 'COS201', 8),
('180004', 'COS204', NULL);

-- 1. Thêm một dòng vào bảng SINHVIEN với các giá trị
INSERT INTO SINHVIEN (MSSV, HoTen, NTNS, Phai, MaLop) VALUES
('190001', N'Đào Thị Tuyết Hoa', '08/03/2001', 0, '19DTH02');

-- 2. Hiển thị tên môn học "Lý thuyết đồ thị" trong bảng môn học
SELECT TenMH
FROM MONHOC
WHERE TenMH = N'Lý thuyết đồ thị';

-- 3. Hiển thị tên các môn học có thực hành
SELECT TenMH
FROM MONHOC
WHERE TCTH > 0;

-- 4. Hiển thị tên các môn học không có thực hành
SELECT TenMH
FROM MONHOC
WHERE TCTH = 0;

-- 5. In ra tên các môn học có số tiết lý thuyết lớn hơn 2
SELECT TenMH
FROM MONHOC
WHERE TCLT > 2;

-- 6. Liệt kê thông tin các sinh viên có điểm trung bình nhỏ hơn 7
SELECT SV.MSSV, SV.HoTen, AVG(D.Diem) AS DiemTB
FROM SINHVIEN SV
LEFT JOIN DIEMSV D ON SV.MSSV = D.MSSV
GROUP BY SV.MSSV, SV.HoTen
HAVING AVG(D.Diem) < 7 OR AVG(D.Diem) IS NULL;

-- 7. In ra 2 học sinh có sinh nhật (bảng sinh viên) gần nhất
SELECT TOP 2 MSSV, HoTen, NTNS
FROM SINHVIEN
ORDER BY NTNS DESC;

-- 8. In danh sách SV theo thứ tự: MSSV, Họ tên SV, Ngày sinh, Phái (Nam/Nữ)
SELECT MSSV, HoTen, NTNS, 
       CASE Phai WHEN 1 THEN N'Nam' ELSE N'Nữ' END AS Phai
FROM SINHVIEN
ORDER BY MSSV;

-- 9. Cho biết thông tin sinh viên có tuổi ≥ 20, thông tin gồm: Họ tên sinh viên, Ngày sinh, Tuổi
SELECT HoTen, NTNS, DATEDIFF(YEAR, NTNS, GETDATE()) AS Tuoi
FROM SINHVIEN
WHERE DATEDIFF(YEAR, NTNS, GETDATE()) >= 20;

-- 10. Liệt kê tên các môn học SV đã dự thi nhưng chưa có điểm
SELECT DISTINCT M.TenMH
FROM MONHOC M
JOIN DIEMSV D ON M.MaMH = D.MaMH
WHERE D.Diem IS NULL;

-- 11. Liệt kê thông tin SV có mã số 170001. Hiển thị: MSSV, HoTen, TenMH, Diem
SELECT SV.MSSV, SV.HoTen, M.TenMH, D.Diem
FROM SINHVIEN SV
JOIN DIEMSV D ON SV.MSSV = D.MSSV
JOIN MONHOC M ON D.MaMH = M.MaMH
WHERE SV.MSSV = '170001';

-- 12. Liệt kê tên sinh viên nào môn học nào sv đó đang kỳ vọng điểm trên 7 điểm
SELECT SV.HoTen, M.TenMH
FROM SINHVIEN SV
JOIN DIEMSV D ON SV.MSSV = D.MSSV
JOIN MONHOC M ON D.MaMH = M.MaMH
WHERE D.Diem IS NULL OR D.Diem < 7;

-- 13. Liệt kê tên môn học có số lượng SV đăng ký học đạt số điểm
SELECT M.TenMH, COUNT(D.MSSV) AS SoLuongSV
FROM MONHOC M
LEFT JOIN DIEMSV D ON M.MaMH = D.MaMH
GROUP BY M.TenMH;

-- 14. Liệt kê tên SV và điểm trung bình của SV đó
SELECT SV.HoTen, AVG(D.Diem) AS DiemTB
FROM SINHVIEN SV
LEFT JOIN DIEMSV D ON SV.MSSV = D.MSSV
GROUP BY SV.HoTen;

-- 15. Liệt kê tên sinh viên đạt điểm cao nhất của môn học "Kỹ thuật lập trình"
SELECT TOP 1 WITH TIES SV.HoTen, D.Diem
FROM SINHVIEN SV
JOIN DIEMSV D ON SV.MSSV = D.MSSV
JOIN MONHOC M ON D.MaMH = M.MaMH
WHERE M.TenMH = N'Kỹ thuật lập trình'
ORDER BY D.Diem DESC;

-- 16. Liệt kê tên SV có điểm trung bình cao nhất
SELECT TOP 1 WITH TIES SV.HoTen, AVG(D.Diem) AS DiemTB
FROM SINHVIEN SV
LEFT JOIN DIEMSV D ON SV.MSSV = D.MSSV
GROUP BY SV.HoTen
ORDER BY DiemTB DESC;

-- 17. Liệt kê tên SV chưa học môn "Toán rời rạc"
SELECT SV.HoTen
FROM SINHVIEN SV
LEFT JOIN DIEMSV D ON SV.MSSV = D.MSSV
LEFT JOIN MONHOC M ON D.MaMH = M.MaMH
WHERE M.TenMH != N'Toán rời rạc' OR M.TenMH IS NULL
GROUP BY SV.HoTen;

-- 18. Cho biết sinh viên có năm sinh cùng với sinh viên tên "Danh"
SELECT SV.HoTen, SV.NTNS
FROM SINHVIEN SV
WHERE SV.NTNS = (SELECT NTNS FROM SINHVIEN WHERE HoTen LIKE N'%Danh');

-- 19. Cho biết thông tin sinh viên với tổng số sinh viên nữ
SELECT COUNT(*) AS SoSVNu
FROM SINHVIEN
WHERE Phai = 0;

-- 20. Cho biết danh sách các sinh viên tốt nhất môn
SELECT TOP 1 WITH TIES SV.HoTen, M.TenMH, D.Diem
FROM SINHVIEN SV
JOIN DIEMSV D ON SV.MSSV = D.MSSV
JOIN MONHOC M ON D.MaMH = M.MaMH
ORDER BY D.Diem DESC;

-- 21. Cho biết MSSV, Họ tên SV đạt học vụ với điều kiện đạt 3 môn
SELECT SV.MSSV, SV.HoTen
FROM SINHVIEN SV
JOIN DIEMSV D ON SV.MSSV = D.MSSV
GROUP BY SV.MSSV, SV.HoTen
HAVING COUNT(CASE WHEN D.Diem >= 5 THEN 1 END) >= 3;

-- 22. In danh sách sinh viên có điểm môn "Kỹ thuật lập trình" cao nhất theo từng lớp
SELECT SV.MSSV, SV.HoTen, D.Diem, L.MaLop
FROM SINHVIEN SV
JOIN DIEMSV D ON SV.MSSV = D.MSSV
JOIN MONHOC M ON D.MaMH = M.MaMH
JOIN LOP L ON SV.MaLop = L.MaLop
WHERE M.TenMH = N'Kỹ thuật lập trình'
AND D.Diem = (SELECT MAX(Diem) FROM DIEMSV D2 JOIN MONHOC M2 ON D2.MaMH = M2.MaMH WHERE M2.TenMH = N'Kỹ thuật lập trình');

-- 23. In danh sách sinh viên có điểm cao nhất theo từng môn, từng lớp
SELECT SV.MSSV, SV.HoTen, M.TenMH, D.Diem, L.MaLop
FROM SINHVIEN SV
JOIN DIEMSV D ON SV.MSSV = D.MSSV
JOIN MONHOC M ON D.MaMH = M.MaMH
JOIN LOP L ON SV.MaLop = L.MaLop
WHERE D.Diem = (
    SELECT MAX(D2.Diem)
    FROM DIEMSV D2
    JOIN SINHVIEN SV2 ON D2.MSSV = SV2.MSSV
    JOIN LOP L2 ON SV2.MaLop = L2.MaLop
    WHERE SV2.MaLop = SV.MaLop AND D2.MaMH = D.MaMH
);

-- 24. Cho biết thông tin sinh viên đạt điểm cao nhất của từng môn
SELECT SV.MSSV, SV.HoTen, M.TenMH, D.Diem
FROM SINHVIEN SV
JOIN DIEMSV D ON SV.MSSV = D.MSSV
JOIN MONHOC M ON D.MaMH = M.MaMH
WHERE D.Diem = (
    SELECT MAX(D2.Diem)
    FROM DIEMSV D2
    WHERE D2.MaMH = D.MaMH
);

-- 25. Cho biết MSSV, Họ tên SV chưa đăng ký học môn nào
SELECT SV.MSSV, SV.HoTen
FROM SINHVIEN SV
LEFT JOIN DIEMSV D ON SV.MSSV = D.MSSV
WHERE D.MSSV IS NULL;

-- 26. Danh sách sinh viên có tất cả các điểm đều 10
SELECT SV.MSSV, SV.HoTen
FROM SINHVIEN SV
JOIN DIEMSV D ON SV.MSSV = D.MSSV
GROUP BY SV.MSSV, SV.HoTen
HAVING MIN(D.Diem) = 10 AND MAX(D.Diem) = 10;

-- 27. Đếm số sinh viên nam, nữ theo từng lớp
SELECT L.MaLop, L.TenLop,
       SUM(CASE WHEN SV.Phai = 1 THEN 1 ELSE 0 END) AS SoNam,
       SUM(CASE WHEN SV.Phai = 0 THEN 1 ELSE 0 END) AS SoNu
FROM LOP L
LEFT JOIN SINHVIEN SV ON L.MaLop = SV.MaLop
GROUP BY L.MaLop, L.TenLop;

-- 28. Cho biết thông tin sinh viên đạt học tốt các môn nhưng không rớt môn nào
SELECT SV.MSSV, SV.HoTen
FROM SINHVIEN SV
JOIN DIEMSV D ON SV.MSSV = D.MSSV
GROUP BY SV.MSSV, SV.HoTen
HAVING MIN(D.Diem) >= 5;

-- 29. Xóa tất cả thông tin sinh viên chưa dự thi môn nào
DELETE SV
FROM SINHVIEN SV
LEFT JOIN DIEMSV D ON SV.MSSV = D.MSSV
WHERE D.MSSV IS NULL;

-- 30. Cho biết thông tin môn đạt được tốt các sinh viên đang kỳ vọng
SELECT M.TenMH, COUNT(D.MSSV) AS SoLuongSV
FROM MONHOC M
LEFT JOIN DIEMSV D ON M.MaMH = D.MaMH
WHERE D.Diem IS NULL OR D.Diem < 7
GROUP BY M.TenMH;
GO