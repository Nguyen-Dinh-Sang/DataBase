USE QLDDH_NguyenDinhSang
GO

--a
CREATE VIEW DoanhSoGiaoHang_6Thang
AS
	SELECT hh.MaHH, hh.TenHH, SUM(ctgh.SLGiao * ctgh.DonGiaGiao) AS TongTien
	FROM (PhieuGiaoHang AS pgh INNER JOIN ChiTietGiaoHang AS ctgh
							   ON pgh.MaGiao = ctgh.MaGiao) INNER JOIN HangHoa AS hh
														    ON hh.MaHH = ctgh.MaHH
	WHERE MONTH(pgh.NgayGiao) BETWEEN 1 AND 6
		  AND YEAR(pgh.NgayGiao) = 2012
	GROUP BY hh.MaHH, TenHH
GO

SELECT *
FROM DoanhSoGiaoHang_6Thang
GO

--b
CREATE VIEW SoLuongDatLonNhat_2012
AS
	SELECT hh.MaHH, hh.TenHH, sld.TongSoLuongDat
	FROM HangHoa AS hh INNER JOIN (SELECT TOP 1 ctdh.MaHH, SUM(ctdh.SLDat) AS TongSoLuongDat
								   FROM DonDatHang AS ddh INNER JOIN ChiTietDatHang AS ctdh
														  ON ddh.MaDat = ctdh.MaDat
								   WHERE YEAR(ddh.NgayDat) = '2012'
								   GROUP BY ctdh.MaHH
								   ORDER BY TongSoLuongDat DESC) AS sld
					    ON hh.MaHH = sld.MaHH
GO

SELECT *
FROM SoLuongDatLonNhat_2012
GO

--c
CREATE VIEW KhachHangDaNang
AS
	SELECT *
	FROM KhachHang AS kh
	WHERE kh.DiaChi = N'Đà Nẵng'
	WITH CHECK OPTION
GO

SELECT *
FROM KhachHangDaNang
GO

INSERT INTO KhachHangDaNang(MaKH, TenKH, DiaChi, DienThoai)
VALUES('KH007', N'Khách hàng mới 1', N'Đà Nẵng', '0345.225651')

INSERT INTO KhachHangDaNang(MaKH, TenKH, DiaChi, DienThoai)
VALUES('KH008', N'Khách hàng mới 2', N'Quảng Nam', '0345.225651')
GO

SELECT *
FROM KhachHangDaNang
GO

SELECT *
FROM KhachHang
GO
	/*Trường hợp này khách hàng có địa chỉ Đà Nẵng được thêm vào view KhachHangDaNang và bảng KhachHang
	  vì thỏa mãn điều kiện của view KhachHangDaNang
	  Còn khi khách hàng có địa chỉ Quảng nam thì không được thêm vì không thỏa mãn điều kiện của view*/