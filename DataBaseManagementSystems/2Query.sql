USE QLDDH_TenSinhVien
GO

--a
SELECT hh.TenHH, ctgh.SLGiao, ctgh.DonGiaGiao
FROM ChiTietGiaoHang AS ctgh INNER JOIN HangHoa AS hh ON ctgh.MaHH = hh.MaHH
WHERE ctgh.MaGiao IN (SELECT MaGiao
					  FROM PhieuGiaoHang
					  WHERE MaDat = 'DH01')
GO

--b
SELECT ddh.MaDat, ddh.NgayDat, kh.TenKH
FROM KhachHang AS kh INNER JOIN DonDatHang AS ddh ON kh.MaKH = ddh.MaKH
WHERE ddh.TinhTrang = 0
GO

--c
SELECT HangHoa.TenHH, HangHoa.DonGiaHH
FROM HangHoa
WHERE HangHoa.DonGiaHH = (SELECT MAX(DonGiaHH)
						  FROM HangHoa)
GO

--d
SELECT kh.MaKH, kh.TenKH, ISNULL(khsld.SoLuongDat,0) AS SoLuongDat
FROM KhachHang AS kh FULL OUTER JOIN (SELECT Makh, COUNT(MaKH) AS SoLuongDat
									  FROM DonDatHang 
									  GROUP BY MaKH) AS khsld
						  ON kh.MaKH = khsld.MaKH
GO

--e
SELECT pgh.MaGiao, pgh.NgayGiao, SUM(ctgh.SLGiao * ctgh.DonGiaGiao) AS TongTien
FROM PhieuGiaoHang AS pgh INNER JOIN ChiTietGiaoHang AS ctgh ON pgh.MaGiao = ctgh.MaGiao
WHERE YEAR(pgh.NgayGiao) = '2012'
GROUP BY pgh.MaGiao, pgh.NgayGiao
GO

--f
SELECT kh.MaKH, kh.TenKH, ISNULL(khsld.SoLuongDat,0) AS SoLuongDat
FROM KhachHang AS kh FULL OUTER JOIN (SELECT Makh, COUNT(MaKH) AS SoLuongDat
									  FROM DonDatHang 
									  GROUP BY MaKH) AS khsld
						  ON kh.MaKH = khsld.MaKH
WHERE khsld.SoLuongDat >= 2
GO

--g
SELECT hh.MaHH, hh.TenHH, mhsll.SoLuongGiao
FROM HangHoa AS hh INNER JOIN (SELECT TOP 1 MaHH, SUM(SLGiao) AS SoLuongGiao
							   FROM ChiTietGiaoHang
							   GROUP BY MaHH
							   ORDER BY SoLuongGiao DESC) AS mhsll
				   ON hh.MaHH = mhsll.MaHH
GO

--h
UPDATE HangHoa
SET SLCon = SLCon + 10
WHERE MaHH like 'M%'
GO

--i
SELECT * INTO HangHoa_copy FROM HangHoa
GO

ALTER TABLE LichSuGia
NOCHECK CONSTRAINT LichSuGia_HangHoa
GO

DELETE
FROM HangHoa
WHERE MaHH NOT IN (SELECT MaHH
				   FROM ChiTietDatHang)
GO

INSERT INTO HangHoa SELECT *
					FROM HangHoa_copy
					WHERE MaHH NOT IN (SELECT MaHH
									   FROM HangHoa)
GO

ALTER TABLE LichSuGia
CHECK CONSTRAINT LichSuGia_HangHoa
GO

--j
UPDATE KhachHang
SET DienThoai = '0345.225651'
WHERE MaKH = 'KH006'
GO

--k
UPDATE DonDatHang
SET TinhTrang = NULL
GO

--l
ALTER TABLE ChiTietGiaoHang
ADD ThanhTien INT
GO

UPDATE ChiTietGiaoHang
SET ThanhTien = SLGiao * DonGiaGiao
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