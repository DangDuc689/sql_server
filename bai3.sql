-- Tạo database
CREATE DATABASE QuanLyBongDa;
GO

-- Sử dụng database
USE QuanLyBongDa;
GO

-- Tạo bảng ThuocTinh (Thông tin thực thể)
CREATE TABLE ThuocTinh (
    MaDoi char(3),
    TenDoi nvarchar(50),
    MaTD char(2),
    Ngay date,
    Gio time,
    DoBanThang tinyint
);
GO

-- Tạo bảng Doi
CREATE TABLE Doi (
    MaDoi char(3) PRIMARY KEY,
    TenDoi varchar(50)
);
GO

-- Tạo bảng TranDau
CREATE TABLE TranDau (
    MaTD char(2) PRIMARY KEY,
    MaSan varchar(10),
    Ngay date,
    Gio time
);
GO

-- Tạo bảng CT_TranDau (Chi tiết trận đấu)
CREATE TABLE CT_TranDau (
    MaTD char(2),
    MaDoi char(3),
    SoBanThang tinyint,
    PRIMARY KEY (MaTD, MaDoi),
    FOREIGN KEY (MaTD) REFERENCES TranDau(MaTD),
    FOREIGN KEY (MaDoi) REFERENCES Doi(MaDoi)
);
GO

-- Chèn dữ liệu vào bảng Doi
INSERT INTO Doi (MaDoi, TenDoi) VALUES
('VN', N'Việt Nam'),
('LA', N'Lào'),
('TL', N'Thái Lan'),
('CPC', N'Campuchia');

-- Chèn dữ liệu vào bảng TranDau
INSERT INTO TranDau (MaTD, MaSan, Ngay, Gio) VALUES
('01', 'MOD', '2017-08-14', '15:00'),
('02', 'NAS', '2017-08-16', '17:00'),
('03', 'MOD', '2017-08-16', '15:00'),
('04', 'IMO', '2017-08-18', '19:00');

-- Chèn dữ liệu vào bảng CT_TranDau
INSERT INTO CT_TranDau (MaTD, MaDoi, SoBanThang) VALUES
('01', 'VN', 3),
('01', 'TL', 1),
('02', 'VN', 5),
('02', 'LA', 0),
('03', 'TL', 3),
('03', 'CPC', 3),
('04', 'TL', 2),
('04', 'LA', 0);
GO

-- Kiểm tra dữ liệu
SELECT * FROM Doi;
SELECT * FROM TranDau;
SELECT * FROM CT_TranDau;