USE QLBV
go
CREATE PROCEDURE ThemLuong_MaHoa
    @MaLuong NVARCHAR(50),
    @MaNV NVARCHAR(50),
    @Thang INT,
    @Nam INT,
    @LuongCoBan NVARCHAR(50),
    @PhuCap DECIMAL(10,2),
    @NgayCong INT,
    @TongLuong DECIMAL(20,2)
AS
BEGIN
    INSERT INTO Luong (
        MaLuong, MaNV, Thang, Nam, LuongCoBan, PhuCap, NgayCong, TongLuong
    )
    VALUES (
        @MaLuong,
        @MaNV,
        @Thang,
        @Nam,
        ENCRYPTBYPASSPHRASE(@MaNV, @LuongCoBan), 
        @PhuCap,
        @NgayCong,
        @TongLuong
    )
END
go
CREATE PROCEDURE sp_UpdateLuong_MaHoa
    @MaLuong NVARCHAR(50),
    @MaNV NVARCHAR(50),
    @Thang INT,
    @Nam INT,
    @LuongCoBan NVARCHAR(50),
    @PhuCap DECIMAL(10,2),
    @NgayCong INT,
    @TongLuong DECIMAL(20,2)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Luong_Archive(
        MaLuong, MaNV, Thang, Nam, LuongCoBan, PhuCap, NgayCong, TongLuong, ArchiveDate, ActionType
    )
    SELECT
        MaLuong, MaNV, Thang, Nam, LuongCoBan, PhuCap, NgayCong, TongLuong, GETDATE(), 'UPDATE'
    FROM Luong
    WHERE MaLuong = @MaLuong;

    UPDATE Luong
    SET
        MaNV = @MaNV,
        Thang = @Thang,
        Nam = @Nam,
        LuongCoBan = ENCRYPTBYPASSPHRASE(@MaNV, @LuongCoBan),
        PhuCap = @PhuCap,
        NgayCong = @NgayCong,
        TongLuong = @TongLuong
    WHERE MaLuong = @MaLuong;
END;

go
CREATE PROCEDURE XemLuong_GiaiMa
    @MaNV NVARCHAR(50)
AS
BEGIN
    SELECT
        MaLuong,
        MaNV,
        Thang,
        Nam,
        CAST(DECRYPTBYPASSPHRASE(MaNV, LuongCoBan) AS NVARCHAR(50)) AS LuongCoBan,
        PhuCap,
        NgayCong,
        TongLuong
    FROM Luong
    WHERE MaNV = @MaNV;
END
go
CREATE PROCEDURE TaoTaiKhoan_MaHoa
    @MaTK NVARCHAR(50),
    @MaNV NVARCHAR(50),
    @TenDN NVARCHAR(50),
    @MatKhau NVARCHAR(255),
    @LoaiTK NVARCHAR(50)
AS
BEGIN
    INSERT INTO TaiKhoan (
        MaTK, MaNV, TenDN, MK, LoaiTK
    )
    VALUES (
        @MaTK,
        @MaNV,
        @TenDN,
        ENCRYPTBYPASSPHRASE(@MaNV, @MatKhau), 
        @LoaiTK
    )
END
go
CREATE PROCEDURE sp_UpdateTaiKhoan_MaHoa
    @MaTK NVARCHAR(50),
    @MaNV NVARCHAR(50),
    @TenDN NVARCHAR(50),
    @MatKhau NVARCHAR(255),
    @LoaiTK NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO TaiKhoan_Archive(
        MaTK, MaNV, TenDN, MK, LoaiTK, ArchiveDate, ActionType
    )
    SELECT 
        MaTK, MaNV, TenDN, MK, LoaiTK, GETDATE(), 'UPDATE'
    FROM TaiKhoan
    WHERE MaTK = @MaTK;

    UPDATE TaiKhoan
    SET
        MaNV = @MaNV,
        TenDN = @TenDN,
        MK = ENCRYPTBYPASSPHRASE(@MaNV, @MatKhau),
        LoaiTK = @LoaiTK
    WHERE MaTK = @MaTK;
END
GO



