USE QLDDH_TenSinhVien
GO

--a
ALTER TABLE PhieuGiaoHang
ADD TongTien MONEY
GO

DECLARE @MaGiao VARCHAR(10), @TongTien MONEY
DECLARE CursorPhieuGiaoHang CURSOR
FORWARD_ONLY FOR SELECT MaGiao
				 FROM PhieuGiaoHang

OPEN CursorPhieuGiaoHang

FETCH NEXT FROM CursorPhieuGiaoHang INTO @MaGiao

WHILE @@FETCH_STATUS = 0
BEGIN
	SELECT @TongTien = SUM(SLGiao * DonGiaGiao)
	FROM ChiTietGiaoHang
	WHERE MaGiao = @MaGiao

	PRINT N'Đang cập nhật phiếu giao hàng: ' + @MaGiao

	UPDATE PhieuGiaoHang
	SET TongTien = @TongTien
	WHERE MaGiao = @MaGiao

	FETCH NEXT FROM CursorPhieuGiaoHang INTO @MaGiao
END

CLOSE CursorPhieuGiaoHang
DEALLOCATE CursorPhieuGiaoHang
GO

SELECT *
FROM PhieuGiaoHang
GO

--b
ALTER TABLE KhachHang
ADD Thuong_2012 MONEY
GO

DECLARE @MaKhachHang VARCHAR(10), @TienThuong MONEY, @TongTien MONEY, @MayGiat INT, @MuaHang2011 INT, @MuaHang2012 INT
DECLARE CursorKhachHang CURSOR
FORWARD_ONLY FOR SELECT MaKH
				 FROM KhachHang

OPEN CursorKhachHang

FETCH NEXT FROM CursorKhachHang INTO @MaKhachHang

WHILE @@FETCH_STATUS = 0
BEGIN
	SET @TienThuong = 0

	SELECT @TongTien = SUM(pgh.TongTien)
	FROM DonDatHang AS ddh INNER JOIN PhieuGiaoHang AS pgh
						   ON ddh.MaDat = pgh.MaDat
	WHERE YEAR(ddh.NgayDat) = '2012' AND ddh.MaKH = @MaKhachHang

	IF @TongTien > 50000000
	BEGIN
		PRINT N'Tổng tiền trong năm 2012 lớn hơn 50 triệu: ' + CAST(@TongTien AS VARCHAR)
		SET @TienThuong = 3000000
		GOTO UpdateTienThuong
	END

	SET @MayGiat = 0
	SELECT @MayGiat = COUNT(ctgh.MaHH)
	FROM (DonDatHang AS ddh INNER JOIN PhieuGiaoHang AS pgh
							ON ddh.MaDat = pgh.MaDat) INNER JOIN ChiTietGiaoHang AS ctgh
													  ON pgh.MaGiao = ctgh.MaGiao
	WHERE ctgh.MaHH = 'MG' AND ddh.MaKH = @MaKhachHang

	IF @TongTien > 35000000 AND @MayGiat > 0
	BEGIN
		PRINT N'Tổng tiền trong năm 2012 lớn hơn 35 triệu và có mua Máy Giặt: ' + CAST(@TongTien AS VARCHAR)
		SET @TienThuong = 2000000
		GOTO UpdateTienThuong
	END

	SET @MuaHang2011 = 0
	SET @MuaHang2012 = 0

	SELECT @MuaHang2011 = COUNT(MaKH)
	FROM DonDatHang
	WHERE MaKH = @MaKhachHang AND YEAR(NgayDat) = '2011'

	SELECT @MuaHang2012 = COUNT(MaKH)
	FROM DonDatHang
	WHERE MaKH = @MaKhachHang AND YEAR(NgayDat) = '2012'
	
	IF @MuaHang2011 > 0 AND @MuaHang2012 > 0
	BEGIN
		PRINT N'Mua hàng trong năm 2011: ' + CAST(@MuaHang2011 AS VARCHAR) + N'\Mua hàng 2012: ' + CAST(@MuaHang2012 AS VARCHAR)
		SET @TienThuong = 1000000
		GOTO UpdateTienThuong
	END

	UpdateTienThuong:

	PRINT N'Đang cập nhật tiền thưởng khách hàng: ' + @MaKhachHang + N'\Tiền thưởng ' + CAST(@TienThuong AS VARCHAR)

	UPDATE KhachHang
	SET Thuong_2012 = @TienThuong
	WHERE MaKH = @MaKhachHang

	FETCH NEXT FROM CursorKhachHang INTO @MaKhachHang
END

CLOSE CursorKhachHang
DEALLOCATE CursorKhachHang
GO

SELECT *
FROM KhachHang
GO

--c
DECLARE @MaHangHoa VARCHAR(10), @DonGiaMoi MONEY, @DonGiaCu MONEY
DECLARE CursorHangHoa CURSOR 
FORWARD_ONLY FOR SELECT MaHH 
				 FROM HangHoa

OPEN CursorHangHoa

FETCH NEXT FROM CursorHangHoa INTo @MaHangHoa
WHILE @@FETCH_STATUS = 0
BEGIN
	SET @DonGiaMoi = 0
	SET @DonGiaCu = 0

	SELECT @DonGiaCu = DonGiaHH
	FROM HangHoa
	WHERE MaHH = @MaHangHoa

	SET @DonGiaMoi = @DonGiaCu * 1.1

	PRINT N'Mã hàng hóa: ' + @MaHangHoa + N'\Đơn giá cũ: ' + CAST(@DonGiaCu AS VARCHAR)
	
	UPDATE HangHoa
	SET DonGiaHH = @DonGiaMoi
	WHERE MaHH = @MaHangHoa
	
	PRINT N'Update lịch sử giá: ' + @MaHangHoa + N'\Đơn giá mới: ' + CAST(@DonGiaMoi AS VARCHAR)
	INSERT LichSuGia
	VALUES (@MaHangHoa, '2013-01-01', @DonGiaCu)

	FETCH NEXT FROM CursorHangHoa INTO @MaHangHoa
END

CLOSE CursorHangHoa
DEALLOCATE CursorHangHoa
GO

SELECT *
FROM HangHoa

SELECT *
FROM LichSuGia