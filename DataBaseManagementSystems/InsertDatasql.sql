USE QLDDH_NguyenDinhSang
GO

--Sửa lại những dữ liệu cũ
UPDATE HangHoa
SET SLCon = 75
WHERE MaHH = 'DM'

UPDATE HangHoa
SET SLCon = 40
WHERE MaHH = 'MQ'
GO

UPDATE KhachHang
SET DiaChi = N'Đà Nẵng', DienThoai = '0511.3246135'
WHERE MaKH = 'KH001'

UPDATE KhachHang
SET DiaChi = N'Quảng Nam'
WHERE MaKH = 'KH002'
GO

UPDATE DonDatHang
SET NgayDat = '2011-02-02'
WHERE MaDat = 'DH01'
GO

--Thêm dữ liệu
INSERT INTO HangHoa(MaHH, TenHH, DVT, SLCon, DonGiaHH)
VALUES('MG', N'Máy giặt SanYo', N'Cái', 10, 4700000)

INSERT INTO HangHoa(MaHH, TenHH, DVT, SLCon, DonGiaHH)
VALUES('TL', N'Tủ lạnh Hitachi', N'Cái', 50, 5500000)

INSERT INTO HangHoa(MaHH, TenHH, DVT, SLCon, DonGiaHH)
VALUES('TV', N'Tivi JVC 14WS', N'Cái', 33, 7800000)
GO

INSERT INTO KhachHang(MaKH, TenKH, DiaChi, DienThoai)
VALUES('KH003', N'Nguyễn Lan Anh',  N'Huế', '0988.148248')

INSERT INTO KhachHang(MaKH, TenKH, DiaChi, DienThoai)
VALUES('KH004', N'Công ty TNHH An Phước',  N'Đà Nẵng', '0511.6987789')

INSERT INTO KhachHang(MaKH, TenKH, DiaChi, DienThoai)
VALUES('KH005', N'Huỳnh Ngọc Trung',  N'Quảng Nam', '0905.888555')

INSERT INTO KhachHang(MaKH, TenKH, DiaChi)
VALUES('KH006', N'Cửa hàng Trung Tín',  N'Đà Nẵng')
GO

INSERT INTO LichSuGia(MaHH, NgayHL, DonGia)
VALUES('BU', '01-01-2011', 300000)

INSERT INTO LichSuGia(MaHH, NgayHL, DonGia)
VALUES('BU', '01-01-2012', 350000)

INSERT INTO LichSuGia(MaHH, NgayHL, DonGia)
VALUES('CD', '2011-01-06', 650000)

INSERT INTO LichSuGia(MaHH, NgayHL, DonGia)
VALUES('CD', '01-01-2012', 700000)

INSERT INTO LichSuGia(MaHH, NgayHL, DonGia)
VALUES('DM', '01-01-2011', 1000000)

INSERT INTO LichSuGia(MaHH, NgayHL, DonGia)
VALUES('DM', '01-01-2012', 1200000)

INSERT INTO LichSuGia(MaHH, NgayHL, DonGia)
VALUES('MG', '01-01-2011', 4700000)

INSERT INTO LichSuGia(MaHH, NgayHL, DonGia)
VALUES('MQ', '2011-01-06', 400000)

INSERT INTO LichSuGia(MaHH, NgayHL, DonGia)
VALUES('TL', '01-01-2011', 5000000)

INSERT INTO LichSuGia(MaHH, NgayHL, DonGia)
VALUES('TL', '01-01-2012', 5500000)

INSERT INTO LichSuGia(MaHH, NgayHL, DonGia)
VALUES('TV', '01-01-2012', 7800000)
GO

INSERT INTO DonDatHang(MaDat, NgayDat, MaKH, TinhTrang)
VALUES('DH02', '2011-02-12', 'KH003', 1)

INSERT INTO DonDatHang(MaDat, NgayDat, MaKH, TinhTrang)
VALUES('DH03', '2012-01-22', 'KH003', 1)

INSERT INTO DonDatHang(MaDat, NgayDat, MaKH, TinhTrang)
VALUES('DH04', '2012-03-22', 'KH002', 0)

INSERT INTO DonDatHang(MaDat, NgayDat, MaKH, TinhTrang)
VALUES('DH05', '2012-04-14', 'KH005', 1)

INSERT INTO DonDatHang(MaDat, NgayDat, MaKH, TinhTrang)
VALUES('DH06', '2012-08-05', 'KH003', 1)

INSERT INTO DonDatHang(MaDat, NgayDat, MaKH, TinhTrang)
VALUES('DH07', '2012-11-25', 'KH005', 0)
GO

INSERT INTO PhieuGiaoHang(MaGiao, NgayGiao, MaDat)
VALUES('GH01', '2011-02-02', 'DH01')

INSERT INTO PhieuGiaoHang(MaGiao, NgayGiao, MaDat)
VALUES('GH02', '2011-02-15', 'DH02')

INSERT INTO PhieuGiaoHang(MaGiao, NgayGiao, MaDat)
VALUES('GH03', '2012-01-23', 'DH03')

INSERT INTO PhieuGiaoHang(MaGiao, NgayGiao, MaDat)
VALUES('GH05', '2012-04-20', 'DH05')

INSERT INTO PhieuGiaoHang(MaGiao, NgayGiao, MaDat)
VALUES('GH06', '2012-08-05', 'DH06')
GO

INSERT INTO ChiTietDatHang(MaDat, MaHH, SLDat)
VALUES('DH01', 'BU', 15)

INSERT INTO ChiTietDatHang(MaDat, MaHH, SLDat)
VALUES('DH01', 'DM', 10)

INSERT INTO ChiTietDatHang(MaDat, MaHH, SLDat)
VALUES('DH01', 'TL', 4)

INSERT INTO ChiTietDatHang(MaDat, MaHH, SLDat)
VALUES('DH02', 'BU', 20)

INSERT INTO ChiTietDatHang(MaDat, MaHH, SLDat)
VALUES('DH02', 'TL', 3)

INSERT INTO ChiTietDatHang(MaDat, MaHH, SLDat)
VALUES('DH03', 'MG', 8)

INSERT INTO ChiTietDatHang(MaDat, MaHH, SLDat)
VALUES('DH04', 'TL', 5)

INSERT INTO ChiTietDatHang(MaDat, MaHH, SLDat)
VALUES('DH04', 'TV', 5)

INSERT INTO ChiTietDatHang(MaDat, MaHH, SLDat)
VALUES('DH05', 'BU', 12)

INSERT INTO ChiTietDatHang(MaDat, MaHH, SLDat)
VALUES('DH05', 'DM', 15)

INSERT INTO ChiTietDatHang(MaDat, MaHH, SLDat)
VALUES('DH05', 'MG', 6)

INSERT INTO ChiTietDatHang(MaDat, MaHH, SLDat)
VALUES('DH05', 'TL', 5)

INSERT INTO ChiTietDatHang(MaDat, MaHH, SLDat)
VALUES('DH06', 'BU', 30)

INSERT INTO ChiTietDatHang(MaDat, MaHH, SLDat)
VALUES('DH06', 'MG', 7)
GO

INSERT INTO ChiTietGiaoHang(MaGiao, MaHH, SLGiao, DonGiaGiao)
VALUES('GH01', 'BU', 15, 300000)

INSERT INTO ChiTietGiaoHang(MaGiao, MaHH, SLGiao, DonGiaGiao)
VALUES('GH01', 'DM', 10, 1000000)

INSERT INTO ChiTietGiaoHang(MaGiao, MaHH, SLGiao, DonGiaGiao)
VALUES('GH01', 'TL', 4, 5000000)

INSERT INTO ChiTietGiaoHang(MaGiao, MaHH, SLGiao, DonGiaGiao)
VALUES('GH02', 'BU', 10, 300000)

INSERT INTO ChiTietGiaoHang(MaGiao, MaHH, SLGiao, DonGiaGiao)
VALUES('GH03', 'MG', 8, 4700000)

INSERT INTO ChiTietGiaoHang(MaGiao, MaHH, SLGiao, DonGiaGiao)
VALUES('GH05', 'BU', 12, 350000)

INSERT INTO ChiTietGiaoHang(MaGiao, MaHH, SLGiao, DonGiaGiao)
VALUES('GH05', 'DM', 15, 1200000)

INSERT INTO ChiTietGiaoHang(MaGiao, MaHH, SLGiao, DonGiaGiao)
VALUES('GH05', 'MG', 5, 4700000)

INSERT INTO ChiTietGiaoHang(MaGiao, MaHH, SLGiao, DonGiaGiao)
VALUES('GH05', 'TL', 5, 5500000)

INSERT INTO ChiTietGiaoHang(MaGiao, MaHH, SLGiao, DonGiaGiao)
VALUES('GH06', 'BU', 20, 350000)

INSERT INTO ChiTietGiaoHang(MaGiao, MaHH, SLGiao, DonGiaGiao)
VALUES('GH06', 'MG', 7, 4700000)
GO
--Kiểm tra kết quả
SELECT *
FROM HangHoa

SELECT *
FROM KhachHang

SELECT *
FROM LichSuGia

SELECT *
FROM DonDatHang

SELECT *
FROM PhieuGiaoHang

SELECT *
FROM ChiTietDatHang

SELECT *
FROM ChiTietGiaoHang
GO