USE QLBV
go
---Procedure update
CREATE PROCEDURE sp_UpdateNhanVien
    @MaNV NVARCHAR(50),
    @HoTenNV NVARCHAR(100),
    @NgaySinh DATE,
    @GioiTinh NVARCHAR(10),
    @DiaChi NVARCHAR(100),
    @SDT NVARCHAR(20),
  
    @MaPB NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;
	--Luu ban ghi truoc khi update
    INSERT INTO Archive_NhanVien (MaNV, HoTenNV, NgaySinh, GioiTinh, DiaChi, SDT, MaPB)
    SELECT MaNV, HoTenNV, NgaySinh, GioiTinh, DiaChi, SDT, MaPB
    FROM NhanVien
    WHERE MaNV = @MaNV;

    -- update
    UPDATE NhanVien
    SET HoTenNV = @HoTenNV,
        NgaySinh = @NgaySinh,
        GioiTinh = @GioiTinh,
        DiaChi = @DiaChi,
        SDT = @SDT,
        
        MaPB = @MaPB
    WHERE MaNV = @MaNV;
END;
go

go
--procedure Add
CREATE PROCEDURE Sp_AddNV
    @MaNV NVARCHAR(50),
    @HoTenNV NVARCHAR(100),
    @NgaySinh DATE,
    @GioiTinh NVARCHAR(10),
    @DiaChi NVARCHAR(100),
    @SDT NVARCHAR(20),
    @MaPB NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;
    IF EXISTS (SELECT 1 FROM NhanVien WHERE MaNV = @MaNV)
    BEGIN
        RAISERROR('Mã nhân viên đã tồn tại.', 16, 1);
        RETURN;
    END
	
    INSERT INTO NhanVien (MaNV, HoTenNV, NgaySinh, GioiTinh, DiaChi, SDT, MaPB)
    VALUES (@MaNV, @HoTenNV, @NgaySinh, @GioiTinh, @DiaChi, @SDT, @MaPB);
END
go 
CREATE PROCEDURE Sp_AddBenhNhan
    @MaBN NVARCHAR(50),
    @HoTenBN NVARCHAR(100),
    @NgaySinh DATE,
    @DiaChi NVARCHAR(100),
    @SDT NVARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;
    IF EXISTS (SELECT 1 FROM BenhNhan WHERE MaBN = @MaBN)
    BEGIN
        RAISERROR('Mã bệnh nhân đã tồn tại.', 16, 1);
        RETURN;
    END

    INSERT INTO BenhNhan (MaBN, HoTenBN, NgaySinh, DiaChi, SDT)
    VALUES (@MaBN, @HoTenBN, @NgaySinh, @DiaChi, @SDT);
END
go
CREATE PROCEDURE Sp_AddBacSi
    @MaBS NVARCHAR(50),
    @TrinhDo NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;
    IF EXISTS (SELECT 1 FROM BacSi WHERE MaBS = @MaBS)
    BEGIN
        RAISERROR('Mã bác sĩ đã tồn tại.', 16, 1);
        RETURN;
    END

    INSERT INTO BacSi (MaBS, TrinhDo)
    VALUES (@MaBS, @TrinhDo);
END
go
CREATE PROCEDURE Sp_AddPhongBan
    @MaPB NVARCHAR(50),
    @MaBP NVARCHAR(50),
    @TenPhongBan NVARCHAR(100),
    @MoTa NVARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON;
    IF EXISTS (SELECT 1 FROM PhongBan WHERE MaPB = @MaPB)
    BEGIN
        RAISERROR('Mã phòng ban đã tồn tại.', 16, 1);
        RETURN;
    END

    INSERT INTO PhongBan (MaPB, MaBP, TenPhongBan, MoTa)
    VALUES (@MaPB, @MaBP, @TenPhongBan, @MoTa);
END
go 
CREATE PROCEDURE Sp_AddBoPhan
    @MaBP NVARCHAR(50),
    @TenBoPhan NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;
    IF EXISTS (SELECT 1 FROM BoPhan WHERE MaBP = @MaBP)
    BEGIN
        RAISERROR('Mã bộ phận đã tồn tại.', 16, 1);
        RETURN;
    END

    INSERT INTO BoPhan (MaBP, TenBoPhan)
    VALUES (@MaBP, @TenBoPhan);
END
go
CREATE PROCEDURE Sp_AddCaTruc
    @MaCT NVARCHAR(50),
    @ThoiGianBT DATETIME,
    @ThoiGianKT DATETIME,
    @NVtruc NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;
    IF EXISTS (SELECT 1 FROM CaTruc WHERE MaCT = @MaCT)
    BEGIN
        RAISERROR('Mã ca trực đã tồn tại.', 16, 1);
        RETURN;
    END

    INSERT INTO CaTruc (MaCT, ThoiGianBT, ThoiGianKT, NVtruc)
    VALUES (@MaCT, @ThoiGianBT, @ThoiGianKT, @NVtruc);
END
---qtr
---Doi voi bang Luong va bang tai khoan co cac thuoc tinh can ma hoa, da co procedure trong file encrypted.sql
---it qtr
go
CREATE PROCEDURE Sp_AddPhieuKham
    @MaPK NVARCHAR(50),
    @TrieuChung NVARCHAR(100),
    @NgayKham DATE,
    @NguoiKham NVARCHAR(50),
    @BacSi NVARCHAR(50),
	@MaSoKham int
AS
BEGIN
    SET NOCOUNT ON;
    IF EXISTS (SELECT 1 FROM PhieuKhamBenh WHERE MaPK = @MaPK)
    BEGIN
        RAISERROR('Mã phiếu khám đã tồn tại.', 16, 1);
        RETURN;
    END

    INSERT INTO PhieuKhamBenh (MaPK, TrieuChung, NgayKham, NguoiKham, BacSi, MaSoKham)
    VALUES (@MaPK, @TrieuChung, @NgayKham, @NguoiKham, @BacSi, @MaSoKham);
END
go
CREATE PROCEDURE Sp_AddChiTietPhieuKham
    @MaPK NVARCHAR(50),
    @MaTT NVARCHAR(50),
    @SoTien DECIMAL(10,2),
    @TTThanhToan NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;
    IF EXISTS (SELECT 1 FROM ChiTietPhieuKham WHERE MaPK = @MaPK AND MaTT = @MaTT)
    BEGIN
        RAISERROR('Chi tiết phiếu khám đã tồn tại.', 16, 1);
        RETURN;
    END

    INSERT INTO ChiTietPhieuKham (MaPK, MaTT, SoTien, TTThanhToan)
    VALUES (@MaPK, @MaTT, @SoTien, @TTThanhToan);
END
go
CREATE PROCEDURE Sp_AddThuTuc
    @MaThuTuc NVARCHAR(50),
    @TenTuc NVARCHAR(100),
    @DonGia DECIMAL(10,2)
AS
BEGIN
    SET NOCOUNT ON;
    IF EXISTS (SELECT 1 FROM ThuTuc WHERE MaThuTuc = @MaThuTuc)
    BEGIN
        RAISERROR('Mã thủ tục đã tồn tại.', 16, 1);
        RETURN;
    END

    INSERT INTO ThuTuc (MaThuTuc, TenTuc, DonGia)
    VALUES (@MaThuTuc, @TenTuc, @DonGia);
END
go
CREATE PROCEDURE Sp_AddToaThuoc
    @MaToaThuoc NVARCHAR(50),
    @MaBacSi NVARCHAR(50),
    @NgayKe DATE,
    @TongTien DECIMAL(10,2),
	@MaPk NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;
    IF EXISTS (SELECT 1 FROM ToaThuoc WHERE MaToaThuoc = @MaToaThuoc)
    BEGIN
        RAISERROR('Mã toa thuốc đã tồn tại.', 16, 1);
        RETURN;
    END

    INSERT INTO ToaThuoc (MaToaThuoc, MaBacSi, NgayKe, TongTien, MaPk)
    VALUES (@MaToaThuoc, @MaBacSi, @NgayKe, @TongTien, @MaPk);
END
go
CREATE PROCEDURE Sp_AddChiTietToaThuoc
    @MaToaThuoc NVARCHAR(50),
    @MaThuoc NVARCHAR(50),
    @SoLuong NVARCHAR(50),
    @LieuDung NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;
    IF EXISTS (SELECT 1 FROM ChiTietToaThuoc WHERE MaToaThuoc = @MaToaThuoc AND MaThuoc = @MaThuoc)
    BEGIN
        RAISERROR('Chi tiết toa thuốc đã tồn tại.', 16, 1);
        RETURN;
    END

    INSERT INTO ChiTietToaThuoc (MaToaThuoc, MaThuoc, SoLuong, LieuDung)
    VALUES (@MaToaThuoc, @MaThuoc, @SoLuong, @LieuDung);
END
go
CREATE PROCEDURE Sp_AddThuoc
    @MaThuoc NVARCHAR(50),
    @TenThuoc NVARCHAR(100),
    @DonVi NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;
    IF EXISTS (SELECT 1 FROM Thuoc WHERE MaThuoc = @MaThuoc)
    BEGIN
        RAISERROR('Mã thuốc đã tồn tại.', 16, 1);
        RETURN;
    END

    INSERT INTO Thuoc (MaThuoc, TenThuoc, DonVi)
    VALUES (@MaThuoc, @TenThuoc, @DonVi);
END
go
CREATE PROCEDURE Sp_AddPhieuNhapThuoc
    @MaPhieuNhap NVARCHAR(50),
    @NgayNhap DATE,
    @NhaCungCap NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;
    IF EXISTS (SELECT 1 FROM PhieuNhapThuoc WHERE MaPhieuNhap = @MaPhieuNhap)
    BEGIN
        RAISERROR('Mã phiếu nhập đã tồn tại.', 16, 1);
        RETURN;
    END

    INSERT INTO PhieuNhapThuoc (MaPhieuNhap, NgayNhap, NhaCungCap)
    VALUES (@MaPhieuNhap, @NgayNhap, @NhaCungCap);
END
go
CREATE PROCEDURE Sp_AddChiTietPhieuNhap
    @MaPhieuNhap NVARCHAR(50),
    @MaThuoc NVARCHAR(50),
    @SoLuong INT,
    @GiaNhap DECIMAL(10,2),
    @HanSuDung DATE
AS
BEGIN
    SET NOCOUNT ON;
    IF EXISTS (SELECT 1 FROM ChiTietPhieuNhap WHERE MaPhieuNhap = @MaPhieuNhap AND MaThuoc = @MaThuoc)
    BEGIN
        RAISERROR('Chi tiết phiếu nhập đã tồn tại.', 16, 1);
        RETURN;
    END

    INSERT INTO ChiTietPhieuNhap (MaPhieuNhap, MaThuoc, SoLuong, GiaNhap, HanSuDung)
    VALUES (@MaPhieuNhap, @MaThuoc, @SoLuong, @GiaNhap, @HanSuDung);
END
go
CREATE PROCEDURE Sp_AddGiaBanThuoc
    @MaThuoc NVARCHAR(50),
    @NgayApDung DATE,
    @GiaBan DECIMAL(10,2)
AS
BEGIN
    SET NOCOUNT ON;
    IF EXISTS (SELECT 1 FROM GiaBanThuoc WHERE MaThuoc = @MaThuoc AND NgayApDung = @NgayApDung)
    BEGIN
        RAISERROR('Giá bán đã tồn tại cho thuốc và ngày áp dụng này.', 16, 1);
        RETURN;
    END

    INSERT INTO GiaBanThuoc (MaThuoc, NgayApDung, GiaBan)
    VALUES (@MaThuoc, @NgayApDung, @GiaBan);
END
go
--Tu doan nay xuong la procedure Delete
USE QLBV
go
CREATE PROCEDURE Delete_NhanVien
    @MaNV NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRANSACTION;

    INSERT INTO Archive_NhanVien
    (
        MaNV, HoTenNV, NgaySinh, GioiTinh, DiaChi, SDT, MaPB, ArchivedAt, ArchiveID
    )
    SELECT 
        MaNV, HoTenNV, NgaySinh, GioiTinh, DiaChi, SDT, MaPB, GETDATE(), 'DELETE'
    FROM NhanVien
    WHERE MaNV = @MaNV;

    DELETE FROM NhanVien WHERE MaNV = @MaNV;
    COMMIT TRANSACTION;
END
go
CREATE PROCEDURE Delete_BenhNhan
    @MaBN NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRANSACTION;

    INSERT INTO BenhNhan_Archive
    (
        MaBN, HoTenBN, NgaySinh, DiaChi, SDT, ArchiveDate, ActionType
    )
    SELECT 
        MaBN, HoTenBN, NgaySinh, DiaChi, SDT, GETDATE(), 'DELETE'
    FROM BenhNhan
    WHERE MaBN = @MaBN;

    DELETE FROM BenhNhan WHERE MaBN = @MaBN;

    COMMIT TRANSACTION;
END
go
CREATE PROCEDURE Delete_BacSi
    @MaBS NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRANSACTION;

    INSERT INTO BacSi_Archive
    (
        MaBS, TrinhDo, ArchiveDate, ActionType
    )
    SELECT 
        MaBS, TrinhDo, GETDATE(), 'DELETE'
    FROM BacSi
    WHERE MaBS = @MaBS;

    DELETE FROM BacSi WHERE MaBS = @MaBS;

    COMMIT TRANSACTION;
END
go
CREATE PROCEDURE Delete_PhongBan
    @MaPB NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRANSACTION;

    INSERT INTO PhongBan_Archive
    (
        MaPB, MaBP, TenPhongBan, MoTa, ArchiveDate, ActionType
    )
    SELECT 
        MaPB, MaBP, TenPhongBan, MoTa, GETDATE(), 'DELETE'
    FROM PhongBan
    WHERE MaPB = @MaPB;

    DELETE FROM PhongBan WHERE MaPB = @MaPB;

    COMMIT TRANSACTION;
END
go
CREATE PROCEDURE Delete_BoPhan
    @MaBP NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRANSACTION;

    INSERT INTO BoPhan_Archive
    (
        MaBP, TenBoPhan, ArchiveDate, ActionType
    )
    SELECT 
        MaBP, TenBoPhan, GETDATE(), 'DELETE'
    FROM BoPhan
    WHERE MaBP = @MaBP;

    DELETE FROM BoPhan WHERE MaBP = @MaBP;

    COMMIT TRANSACTION;
END
go
CREATE PROCEDURE Delete_CaTruc
    @MaCT NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRANSACTION;

    INSERT INTO CaTruc_Archive
    (
        MaCT, ThoiGianBT, ThoiGianKT, NVtruc, ArchiveDate, ActionType
    )
    SELECT 
        MaCT, ThoiGianBT, ThoiGianKT, NVtruc, GETDATE(), 'DELETE'
    FROM CaTruc
    WHERE MaCT = @MaCT;

    DELETE FROM CaTruc WHERE MaCT = @MaCT;

    COMMIT TRANSACTION;
END
go
CREATE PROCEDURE Delete_Luong
    @MaLuong NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRANSACTION;

    INSERT INTO Luong_Archive
    (
        MaLuong, MaNV, Thang, Nam, LuongCoBan, PhuCap, NgayCong, TongLuong, ArchiveDate, ActionType
    )
    SELECT 
        MaLuong, MaNV, Thang, Nam, LuongCoBan, PhuCap, NgayCong, TongLuong, GETDATE(), 'DELETE'
    FROM Luong
    WHERE MaLuong = @MaLuong;

    DELETE FROM Luong WHERE MaLuong = @MaLuong;

    COMMIT TRANSACTION;
END
go
CREATE PROCEDURE Delete_TaiKhoan
    @MaTK NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRANSACTION;

    INSERT INTO TaiKhoan_Archive
    (
        MaTK, MaNV, TenDN, MK, LoaiTK, ArchiveDate, ActionType
    )
    SELECT 
        MaTK, MaNV, TenDN, MK, LoaiTK, GETDATE(), 'DELETE'
    FROM TaiKhoan
    WHERE MaTK = @MaTK;

    DELETE FROM TaiKhoan WHERE MaTK = @MaTK;

    COMMIT TRANSACTION;
END
go
CREATE PROCEDURE Delete_PhieuKhamBenh
    @MaPK NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRANSACTION;

    INSERT INTO PhieuKhamBenh_Archive
    (
        MaPK, TrieuChung, NgayKham, NguoiKham, Bacsi, ArchiveDate, ActionType
    )
    SELECT 
        MaPK, TrieuChung, NgayKham, NguoiKham, Bacsi, GETDATE(), 'DELETE'
    FROM PhieuKhamBenh
    WHERE MaPK = @MaPK;

    DELETE FROM PhieuKhamBenh WHERE MaPK = @MaPK;

    COMMIT TRANSACTION;
END
go
CREATE PROCEDURE Delete_ChiTietPhieuKham
    @MaPK NVARCHAR(50),
    @MaTT NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRANSACTION;

    INSERT INTO  ChiTietPhieuKham_Archive
    (
        MaPK, MaTT, SoTien, TTThanhToan, ArchiveDate, ActionType
    )
    SELECT 
        MaPK, MaTT, SoTien, TTThanhToan, GETDATE(), 'DELETE'
    FROM ChiTietPhieuKham
    WHERE MaPK = @MaPK AND MaTT = @MaTT;

    DELETE FROM ChiTietPhieuKham WHERE MaPK = @MaPK AND MaTT = @MaTT;

    COMMIT TRANSACTION;
END
go
CREATE PROCEDURE Delete_ThuTuc
    @MaThuTuc NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRANSACTION;

    INSERT INTO ThuTuc_Archive
    (
        MaThuTuc, TenTuc, DonGia, ArchiveDate, ActionType
    )
    SELECT 
        MaThuTuc, TenTuc, DonGia, GETDATE(), 'DELETE'
    FROM ThuTuc
    WHERE MaThuTuc = @MaThuTuc;

    DELETE FROM ThuTuc WHERE MaThuTuc = @MaThuTuc;

    COMMIT TRANSACTION;
END
go
CREATE PROCEDURE Delete_ToaThuoc
    @MaToaThuoc NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRANSACTION;

    INSERT INTO ToaThuoc_Archive
    (
        MaToaThuoc, MaBacSi, NgayKe, TongTien, ArchiveDate, ActionType
    )
    SELECT 
        MaToaThuoc, MaBacSi, NgayKe, TongTien, GETDATE(), 'DELETE'
    FROM ToaThuoc
    WHERE MaToaThuoc = @MaToaThuoc;

    DELETE FROM ToaThuoc WHERE MaToaThuoc = @MaToaThuoc;

    COMMIT TRANSACTION;
END
go
CREATE PROCEDURE Delete_ChiTietToaThuoc
    @MaToaThuoc NVARCHAR(50),
    @MaThuoc NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRANSACTION;

    INSERT INTO ChiTietToaThuoc_Archive
    (
        MaToaThuoc, MaThuoc, SoLuong, LieuDung, ArchiveDate, ActionType
    )
    SELECT 
        MaToaThuoc, MaThuoc, SoLuong, LieuDung, GETDATE(), 'DELETE'
    FROM ChiTietToaThuoc
    WHERE MaToaThuoc = @MaToaThuoc AND MaThuoc = @MaThuoc;

    DELETE FROM ChiTietToaThuoc WHERE MaToaThuoc = @MaToaThuoc AND MaThuoc = @MaThuoc;

    COMMIT TRANSACTION;
END
go
CREATE PROCEDURE Delete_Thuoc
    @MaThuoc NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRANSACTION;

    INSERT INTO Thuoc_Archive
    (
        MaThuoc, TenThuoc, DonVi, ArchiveDate, ActionType
    )
    SELECT 
        MaThuoc, TenThuoc, DonVi, GETDATE(), 'DELETE'
    FROM Thuoc
    WHERE MaThuoc = @MaThuoc;

	DELETE FROM GiaBanThuoc where MaThuoc = @MaThuoc;
    DELETE FROM Thuoc WHERE MaThuoc = @MaThuoc;

    COMMIT TRANSACTION;
END
go
CREATE PROCEDURE Delete_PhieuNhapThuoc
    @MaPhieuNhap NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRANSACTION;

    INSERT INTO PhieuNhapThuoc_Archive
    (
        MaPhieuNhap, NgayNhap, NhaCungCap, ArchiveDate, ActionType
    )
    SELECT 
        MaPhieuNhap, NgayNhap, NhaCungCap, GETDATE(), 'DELETE'
    FROM PhieuNhapThuoc
    WHERE MaPhieuNhap = @MaPhieuNhap;

    DELETE FROM PhieuNhapThuoc WHERE MaPhieuNhap = @MaPhieuNhap;

    COMMIT TRANSACTION;
END
go
CREATE PROCEDURE Delete_ChiTietPhieuNhap
    @MaPhieuNhap NVARCHAR(50),
    @MaThuoc NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRANSACTION;

    INSERT INTO ChiTietPhieuNhap_Archive
    (
        MaPhieuNhap, MaThuoc, SoLuong, GiaNhap, HanSuDung, ArchiveDate, ActionType
    )
    SELECT 
        MaPhieuNhap, MaThuoc, SoLuong, GiaNhap, HanSuDung, GETDATE(), 'DELETE'
    FROM ChiTietPhieuNhap
    WHERE MaPhieuNhap = @MaPhieuNhap AND MaThuoc = @MaThuoc;

    DELETE FROM ChiTietPhieuNhap WHERE MaPhieuNhap = @MaPhieuNhap AND MaThuoc = @MaThuoc;

    COMMIT TRANSACTION;
END
go
CREATE PROCEDURE Delete_GiaBanThuoc
    @MaThuoc NVARCHAR(50),
    @NgayApDung DATE
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRANSACTION;

    INSERT INTO GiaBanThuoc_Archive
    (
        MaThuoc, NgayApDung, GiaBan, ArchiveDate, ActionType
    )
    SELECT 
        MaThuoc, NgayApDung, GiaBan, GETDATE(), 'DELETE'
    FROM GiaBanThuoc
    WHERE MaThuoc = @MaThuoc AND NgayApDung = @NgayApDung;

    DELETE FROM GiaBanThuoc WHERE MaThuoc = @MaThuoc AND NgayApDung = @NgayApDung;

    COMMIT TRANSACTION;
END
go
--end procedure delete

