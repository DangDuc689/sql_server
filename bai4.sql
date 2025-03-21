

INSERT INTO CHUYENBAY (MACB, GADI, GADEN, DODAI, GIODI, GIODEN, CHIPHI, MAMB)
VALUES 
('VN431', 'SGN', 'CAH', 3693, '05:55', '06:55', 236, 747),
('VN320', 'SGN', 'DAD', 2798, '06:00', '07:10', 221, 737),
('VN464', 'SGN', 'DLI', 2002, '07:20', '08:05', 225, 340),
('VN216', 'SGN', 'DIN', 4170, '10:30', '14:20', 262, 757),
('VN280', 'SGN', 'HPH', 11979, '06:00', '08:00', 1279, 777),
('VN254', 'SGN', 'HUI', 8765, '18:40', '20:00', 781, 767),
('VN338', 'SGN', 'BMV', 4081, '15:25', '16:25', 375, 320),
('VN440', 'SGN', 'BMV', 4081, '18:30', '19:30', 426, 319),
('VN651', 'DAD', 'SGN', 2798, '19:30', '08:00', 221, 727),
('VN276', 'DAD', 'CXR', 1283, '09:00', '12:00', 203, 154),
('VN374', 'HAN', 'VII', 510, '11:40', '13:25', 120, 747),
('VN375', 'VII', 'CXR', 752, '14:15', '16:00', 181, 737),
('VN269', 'HAN', 'CXR', 1262, '14:10', '15:50', 202, 340),
('VN315', 'HAN', 'DAD', 134, '11:45', '13:00', 112, 757),
('VN317', 'HAN', 'UIH', 827, '15:00', '16:15', 190, 777),
('VN741', 'HAN', 'PXU', 395, '06:30', '08:30', 120, 767),
('VN474', 'PXU', 'PQC', 1586, '08:40', '11:20', 102, 747),
('VN476', 'UIH', 'PQC', 485, '09:15', '11:50', 117, 777)
GO

INSERT INTO MAYBAY (MAMB, LOAI, TAMBAY)
VALUES 
(747, 'Boeing 747 - 400', 13488),
(737, 'Boeing 737 - 800', 5413),
(340, 'Airbus A340 - 300', 11392),
(757, 'Boeing 757 - 300', 6416),
(777, 'Boeing 777 - 300', 10306),
(767, 'Boeing 767 - 400ER', 10360),
(320, 'Airbus A320', 4168),
(319, 'Airbus A319', 2888),
(727, 'Boeing 727', 2406),
(154, 'Tupolev 154', 6565)
GO

INSERT INTO NHANVIEN (MANV, TEN, LUONG)
VALUES 
('242518965', N'Trần Văn Sơn', 120433),
('141582651', N'Đoàn Thị Mai', 178345),
('011564812', N'Tôn Văn Quý', 153972),
('567354612', N'Quan Cẩm Ly', 256481),
('552455318', N'La Quế', 101745),
('550156548', N'Nguyễn Thị Cẩm', 205187),
('390487451', N'Lê Văn Luật', 212156),
('274878974', N'Mai Quốc Minh', 99890),
('254099823', N'Nguyễn Thị Quỳnh', 24450),
('356187925', N'Nguyễn Vinh Bảo', 44740),
('355548984', N'Trần Thị Hoài An', 212156),
('310454876', N'Tạ Văn Đồ', 212156),
('489456522', N'Nguyễn Thị Quý Linh', 127984),
('489221823', N'Bùi Quốc Chinh', 23980),
('548977562', N'Lê Văn Quý', 84476),
('310454877', N'Trần Văn Hạo', 33546),
('142519864', N'Nguyễn Thị Xuân Đào', 227489),
('269734834', N'Trương Tuấn Anh', 289950),
('287321212', N'Đường Văn Minh', 48090),
('552455348', N'Bùi Thị Dung', 92013),
('248965255', N'Trần Thị Ba', 43723),
('159542516', N'Lê Văn Kỳ', 48250),
('348121549', N'Nguyễn Văn Thanh', 32899),
('574489457', N'Bùi Văn Lập', 20)
GO

INSERT INTO CHUNGNHAN (MANV, MAMB)
VALUES 
('567354612', 747),
('567354612', 737),
('567354612', 757),
('567354612', 777),
('567354612', 767),
('567354612', 727),
('567354612', 340),
('552455318', 737),
('552455318', 319),
('552455318', 747),
('552455318', 767),
('390487451', 340),
('390487451', 320),
('390487451', 319),
('274878974', 757),
('274878974', 767),
('355548984', 154),
('310454876', 154),
('142519864', 747),
('142519864', 757),
('142519864', 777),
('142519864', 767),
('142519864', 737),
('142519864', 340),
('142519864', 320),
('269734834', 747),
('269734834', 737),
('269734834', 340),
('269734834', 757),
('269734834', 777),
('269734834', 767),
('269734834', 320),
('269734834', 319),
('269734834', 727),
('269734834', 154),
('242518965', 737),
('242518965', 757),
('141582651', 737),
('141582651', 757),
('141582651', 767),
('011564812', 737),
('011564812', 757),
('574489457', 154);
