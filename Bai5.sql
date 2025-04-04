CREATE DATABASE QUANLYDUAN
GO

USE QUANLYDUAN
GO

CREATE TABLE NCC(
	MANCC VARCHAR(5) PRIMARY KEY,
	TEN NVARCHAR(40),
	HESO INT,
	THPHO NVARCHAR(20)
)
GO

CREATE TABLE DUAN(
	MADA VARCHAR(5) PRIMARY KEY,
	TEN NVARCHAR(40),
	THPHO NVARCHAR(20)
)
GO

CREATE TABLE VATTU(
	MAVT VARCHAR(5) PRIMARY KEY,
	TEN NVARCHAR(40),
	MAU NVARCHAR(15),
	TRLUONG FLOAT,
	THPHO NVARCHAR(20)
)
GO

CREATE TABLE CC(
	MANCC VARCHAR(5) NOT NULL,
	MAVT VARCHAR(5) NOT NULL,
	MADA VARCHAR(5) NOT NULL,
	SLUONG INT,
	CONSTRAINT PK_CC PRIMARY KEY (MANCC, MAVT, MADA) -- ĐỊNH NGHĨA KHÓA CHÍNH NGAY TRONG TABLE
)
GO 

-- ALTER TABLE CC ADD CONSTRAINT PK_CC PRIMARY KEY (MANCC, MAVT, MADA)
-- GO

INSERT INTO NCC(MANCC, TEN, HESO, THPHO) VALUES
('S1', N'SƠN', 20, N'TP.HCM'),
('S2', N'TRÂN', 10, N'HÀ NỘI'),
('S3', N'BÁCH', 30, N'HÀ NỘI'),
('S4', N'LẬP', 20, N'TP.HCM'),
('S5', N'ÁNH', 30, N'ĐÀ NẴNG')
GO

INSERT INTO DUAN(MADA, TEN, THPHO) VALUES
('J1', N'MÁY PHÂN LOẠI', N'HÀ NỘI'),
('J2', N'MÀN HÌNH', N'VIỆT TRÌ'),
('J3', N'OCR', N'ĐÀ NẴNG'),
('J4', N'BĂNG ĐIỀU KHIỂN', N'ĐÀ NẴNG'),
('J5', N'RAID', N'TP.HCM'),
('J6', N'EDS', N'HẢI PHÒNG'),
('J7', N'BẢNG TỪ', N'TP.HCM')
GO

INSERT INTO VATTU(MAVT, TEN, MAU, TRLUONG, THPHO) VALUES
('P1', N'ĐAI ỐC', N'ĐỎ', 12.0, N'TP.HCM'),
('P2', N'BÙ LON', N'XANH LÁ', 17.0, N'HÀ NỘI'),
('P3', N'ĐINH VÍT', N'XANH DƯƠNG', 17.0, N'HẢI PHÒNG'),
('P4', N'ĐINH VÍT', N'ĐỎ', 14.0, N'TP.HCM'),
('P5', N'CAM', N'XANH DƯƠNG', 12.0, N'HÀ NỘI'),
('P6', N'BÁNH RĂNG', N'ĐỎ', 19.0, N'TP.HCM')
GO

INSERT INTO CC(MANCC, MAVT, MADA, SLUONG) VALUES
('S1', 'P1', 'J1', 200),
('S1', 'P1', 'J4', 700),
('S2', 'P3', 'J1', 700),
('S2', 'P3', 'J2', 200),
('S2', 'P3', 'J3', 200),
('S2', 'P3', 'J4', 500),
('S2', 'P3', 'J5', 600),
('S2', 'P3', 'J6', 400),
('S2', 'P3', 'J7', 800),
('S2', 'P5', 'J2', 100),
('S3', 'P3', 'J1', 200),
('S3', 'P4', 'J2', 500),
('S4', 'P6', 'J3', 300),
('S4', 'P6', 'J7', 300),
('S5', 'P2', 'J2', 200),
('S5', 'P2', 'J4', 100),
('S5', 'P5', 'J5', 500),
('S5', 'P5', 'J7', 100),
('S5', 'P6', 'J2', 200),
('S5', 'P1', 'J4', 100),
('S5', 'P3', 'J4', 200),
('S5', 'P4', 'J4', 800),
('S5', 'P5', 'J4', 400),
('S5', 'P6', 'J4', 500)
GO

SELECT * FROM CC
SELECT * FROM DUAN
SELECT * FROM NCC
SELECT * FROM VATTU

-- CÂU LỆNH TRUY VẤN

