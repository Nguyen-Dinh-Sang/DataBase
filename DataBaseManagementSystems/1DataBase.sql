USE QLDDH_NguyenDinhSang
GO
/*a Cài đặt CSDL: file CreateDataBase.sql*/

/*b Thêm ràng buộc duy nhất*/
ALTER TABLE HangHoa
ADD CONSTRAINT UniqueTenHH 
UNIQUE(TenHH)
GO

INSERT INTO HangHoa(MaHH, TenHH, DVT, SLCon, DonGiaHH)
VALUEs('BU', N'Bàn ủi Philip', N'Cái', 60, 350000)

INSERT INTO HangHoa(MaHH, TenHH, DVT, SLCon, DonGiaHH)
VALUEs('BU', N'Bàn ủi Philip', N'Cái', 60, 350000)
GO

SELECT *
FROM HangHoa
GO

/*c Thêm ràng buộc kiểm tra*/
ALTER TABLE HangHoa
ADD CONSTRAINT CheckSLCon
CHECK(SLCon >= 0)
GO

INSERT INTO HangHoa(MaHH, TenHH, DVT, SLCon, DonGiaHH)
VALUEs('CD', N'Nồi cơm điện Sharp', N'Cái', 100, 700000)

INSERT INTO HangHoa(MaHH, TenHH, DVT, SLCon, DonGiaHH)
VALUEs('DM', N'Đầu máy Sharp', N'Cái', 0, 1200000)

INSERT INTO HangHoa(MaHH, TenHH, DVT, SLCon, DonGiaHH)
VALUEs('MG', N'Máy giặt SanYo', N'Cái', -10, 4700000)

INSERT INTO HangHoa(MaHH, TenHH, DVT, SLCon, DonGiaHH)
VALUEs('MQ', N'Máy quat ASIA', N'Cái', -0, 400000)
GO

SELECT *
FROM HangHoa
GO

/*d Thêm ràng buộc mặc định*/
ALTER TABLE DonDatHang
ADD CONSTRAINT DefaultNgayDat
DEFAULT GETDATE() FOR NgayDat
GO

INSERT INTO KhachHang(MaKH, TenKH, DiaChi, DienThoai)
VALUES('KH001', N'Cửa hàng Phú Lộc', N'Đà Nẵng', '0511.3245135')

INSERT INTO DonDatHang(MaDat, MaKH, TinhTrang)
VALUES('DH01', 'KH001', 1)
GO

SELECT *
FROM DonDatHang
GO

/*e Xóa bảng KhachHang*/
DROP TABLE KhachHang
GO

--Không xóa được vì bảng KhachHang có ràng buộc khóa ngoại với bảng DonDatHang.
--Muốn xóa được thì phải xóa bảng DonDatHang trước rồi mới xóa bảng KhachHang.

/*f Xóa cột DiaChi bảng KhachHang, tạo lại có ràng buộc mặc định*/
ALTER TABLE KhachHang
DROP COLUMN DiaChi
GO

SELECT *
FROM KhachHang
GO

ALTER TABLE KhachHang
ADD DiaChi NVARCHAR(100) DEFAULT N'Đà Nẵng'
GO

INSERT INTO KhachHang(MaKH, TenKH, DienThoai)
VALUES('KH002', N'Cửa hàng Hoàng Gia', '0510.6333444')
GO

SELECT *
FROM KhachHang
GO

/*g Xóa khóa ngoại MaDat bảng PhieuGiaoHang, sau đó tạo lại*/
ALTER TABLE PhieuGiaoHang
DROP CONSTRAINT PhieuGiaoHang_DonDatHang
GO

ALTER TABLE PhieuGiaoHang
ADD CONSTRAINT PhieuGiaoHang_DonDatHang
FOREIGN KEY(MaDat)
REFERENCES dbo.DonDatHang(MaDat)
Go

/*h Nhập dữ liệu cho các bảng: file InsertData.sql*/