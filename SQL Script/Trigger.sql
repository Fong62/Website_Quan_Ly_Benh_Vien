Use QLBV
go

CREATE TRIGGER trg_Audit_PhieuNhapThuoc
ON PhieuNhapThuoc
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    -- INSERT
    INSERT INTO Audit_Log (TableName, ActionType, RecordID, PerformedBy)
    SELECT 'PhieuNhapThuoc', 'INSERT', MaPhieuNhap, SYSTEM_USER
    FROM INSERTED
    WHERE NOT EXISTS (SELECT 1 FROM DELETED WHERE DELETED.MaPhieuNhap = INSERTED.MaPhieuNhap);

    -- UPDATE
    INSERT INTO Audit_Log (TableName, ActionType, RecordID, PerformedBy)
    SELECT 'PhieuNhapThuoc', 'UPDATE', MaPhieuNhap, SYSTEM_USER
    FROM INSERTED
    WHERE EXISTS (SELECT 1 FROM DELETED WHERE DELETED.MaPhieuNhap = INSERTED.MaPhieuNhap);

    -- DELETE
    INSERT INTO Audit_Log (TableName, ActionType, RecordID, PerformedBy)
    SELECT 'PhieuNhapThuoc', 'DELETE', MaPhieuNhap, SYSTEM_USER
    FROM DELETED
    WHERE NOT EXISTS (SELECT 1 FROM INSERTED WHERE INSERTED.MaPhieuNhap = DELETED.MaPhieuNhap);
END

go

CREATE TRIGGER trg_Audit_TaiKhoan_InsertUpdate
ON TaiKhoan
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Ghi nhận INSERT
    INSERT INTO Audit_Log (TableName, ActionType, RecordID, PerformedBy)
    SELECT 'TaiKhoan', 'INSERT', MaTK, SYSTEM_USER
    FROM INSERTED
    WHERE NOT EXISTS (
        SELECT 1 FROM DELETED WHERE DELETED.MaTK = INSERTED.MaTK
    );

    -- Ghi nhận UPDATE
    INSERT INTO Audit_Log (TableName, ActionType, RecordID, PerformedBy)
    SELECT 'TaiKhoan', 'UPDATE', MaTK, SYSTEM_USER
    FROM INSERTED
    WHERE EXISTS (
        SELECT 1 FROM DELETED WHERE DELETED.MaTK = INSERTED.MaTK
    );
END;

IF OBJECT_ID('TR_BenhNhan_Delete', 'TR') IS NOT NULL
    DROP TRIGGER TR_BenhNhan_Delete;
GO
CREATE TRIGGER TR_BenhNhan_Delete
ON BenhNhan
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO BenhNhan_Archive (MaBN, HoTenBN, NgaySinh, DiaChi, SDT, ArchiveDate, ActionType)
    SELECT MaBN, HoTenBN, NgaySinh, DiaChi, SDT, GETDATE(), 'DELETE'
    FROM DELETED;

    INSERT INTO Audit_Log (TableName, ActionType, RecordID, PerformedBy)
    SELECT 'BenhNhan', 'DELETE', MaBN, SYSTEM_USER
    FROM DELETED;
END
GO

--trigger delete

CREATE TRIGGER TR_BoPhan_Delete
ON BoPhan
AFTER DELETE
AS
BEGIN
    
    INSERT INTO BoPhan_Archive (MaBP, TenBoPhan, ArchiveDate, ActionType)
    SELECT MaBP, TenBoPhan, GETDATE(), 'DELETE'
    FROM DELETED;

    INSERT INTO Audit_Log (TableName, ActionType, RecordID, ActionTime, PerformedBy)
    SELECT 'BoPhan', 'DELETE', MaBP, GETDATE(), SYSTEM_USER
    FROM DELETED;
END;

GO
CREATE TRIGGER TR_PhongBan_Delete
ON PhongBan
AFTER DELETE
AS
BEGIN
   
    INSERT INTO PhongBan_Archive (MaPB, MaBP, TenPhongBan, MoTa, ArchiveDate, ActionType)
    SELECT MaPB, MaBP, TenPhongBan, MoTa, GETDATE(), 'DELETE'
    FROM DELETED;

    INSERT INTO Audit_Log (TableName, ActionType, RecordID, ActionTime, PerformedBy)
    SELECT 'PhongBan', 'DELETE', MaPB, GETDATE(), SYSTEM_USER
    FROM DELETED;
END;

GO
CREATE TRIGGER TR_NhanVien_Delete
ON NhanVien
AFTER DELETE
AS
BEGIN
    
    INSERT INTO Archive_NhanVien (MaNV, HoTenNV, NgaySinh, GioiTinh, DiaChi, SDT, MaPB, ArchivedAt, ArchiveID)
    SELECT MaNV, HoTenNV, NgaySinh, GioiTinh, DiaChi, SDT, MaPB, GETDATE(), 'DELETE'
    FROM DELETED;

    INSERT INTO Audit_Log (TableName, ActionType, RecordID, ActionTime, PerformedBy)
    SELECT 'NhanVien', 'DELETE', MaNV, GETDATE(), SYSTEM_USER
    FROM DELETED;
END;

GO
CREATE TRIGGER TR_BacSi_Delete
ON BacSi
AFTER DELETE
AS
BEGIN
    
    INSERT INTO BacSi_Archive (MaBS, TrinhDo, ArchiveDate, ActionType)
    SELECT MaBS, TrinhDo, GETDATE(), 'DELETE'
    FROM DELETED;

    INSERT INTO Audit_Log (TableName, ActionType, RecordID, ActionTime, PerformedBy)
    SELECT 'BacSi', 'DELETE', MaBS, GETDATE(), SYSTEM_USER
    FROM DELETED;
END;

GO
CREATE TRIGGER TR_CaTruc_Delete
ON CaTruc
AFTER DELETE
AS
BEGIN
    INSERT INTO CaTruc_Archive (MaCT, ThoiGianBT, ThoiGianKT, NVtruc, ArchiveDate, ActionType)
    SELECT MaCT, ThoiGianBT, ThoiGianKT, NVtruc, GETDATE(), 'DELETE'
    FROM DELETED;

    INSERT INTO Audit_Log (TableName, ActionType, RecordID, ActionTime, PerformedBy)
    SELECT 'CaTruc', 'DELETE', MaCT, GETDATE(), SYSTEM_USER
    FROM DELETED;
END;

GO
CREATE TRIGGER TR_Luong_Delete
ON Luong
AFTER DELETE
AS
BEGIN
    INSERT INTO Luong_Archive (
        MaLuong, MaNV, Thang, Nam, LuongCoBan, PhuCap, NgayCong, TongLuong, ArchiveDate, ActionType
    )
    SELECT 
        MaLuong, MaNV, Thang, Nam, LuongCoBan, PhuCap, NgayCong, TongLuong, GETDATE(), 'DELETE'
    FROM deleted;

    INSERT INTO Audit_Log (TableName, ActionType, RecordID, ActionTime, PerformedBy)
    SELECT 'Luong', 'DELETE', MaLuong, GETDATE(), SYSTEM_USER
    FROM deleted;
END;

GO
CREATE TRIGGER TR_TaiKhoan_Delete
ON TaiKhoan
AFTER DELETE
AS
BEGIN
    
    INSERT INTO TaiKhoan_Archive (
        MaTK, MaNV, TenDN, MK, ArchiveDate, ActionType
    )
    SELECT 
        MaTK, MaNV, TenDN, MK, GETDATE(), 'DELETE'
    FROM deleted;
	
    INSERT INTO Audit_Log (
        TableName, ActionType, RecordID, ActionTime, PerformedBy
    )
    SELECT 
        'TaiKhoan', 'DELETE', MaTK, GETDATE(), SYSTEM_USER
    FROM deleted;
END;

GO
CREATE TRIGGER trg_Delete_PhieuKhamBenh
ON PhieuKhamBenh
FOR DELETE
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO PhieuKhamBenh_Archive (MaPK, TrieuChung, NgayKham, NguoiKham, Bacsi, ActionType)
    SELECT MaPK, TrieuChung, NgayKham, NguoiKham, Bacsi, 'DELETE'
    FROM deleted;

    INSERT INTO Audit_Log (TableName, ActionType)
    VALUES ('PhieuKhamBenh', 'DELETE');
END;

GO
CREATE TRIGGER trg_Delete_SoKhamBenh
ON SoKhamBenh
FOR DELETE
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO SoKhamBenh_Archive (MaSoKham, MaBN, MaPK, ActionType)
    SELECT MaSoKham, MaBN, MaPK, 'DELETE'
    FROM deleted;

    INSERT INTO Audit_Log (TableName, ActionType, RecordID, PerformedBy)
    SELECT 'SoKhamBenh', 'DELETE', MaSoKham, SYSTEM_USER
    FROM deleted;
END;

GO
CREATE TRIGGER trg_Delete_ThuTuc
ON ThuTuc
FOR DELETE
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO ThuTuc_Archive (MaThuTuc, TenTuc, DonGia, ActionType)
    SELECT MaThuTuc, TenTuc, DonGia, 'DELETE'
    FROM deleted;

    INSERT INTO Audit_Log (TableName, ActionType, RecordID, PerformedBy)
    SELECT 'ThuTuc', 'DELETE', MaThuTuc, SYSTEM_USER
    FROM deleted;
END;

GO
CREATE TRIGGER trg_ChiTietPhieuKham_Delete
ON ChiTietPhieuKham
FOR DELETE
AS
BEGIN
    INSERT INTO ChiTietPhieuKham_Archive (MaPK, MaTT, SoTien, TTThanhToan, ArchiveDate, ActionType)
    SELECT MaPK, MaTT, SoTien, TTThanhToan, GETDATE(), 'DELETE'
    FROM DELETED;

    INSERT INTO Audit_Log (TableName, ActionType, RecordID, ActionTime, PerformedBy)
    SELECT 'ChiTietPhieuKham', 'DELETE', MaPK + '-' + MaTT, GETDATE(), SYSTEM_USER
    FROM DELETED;
END;

GO
CREATE TRIGGER trg_ToaThuoc_Delete
ON ToaThuoc
FOR DELETE
AS
BEGIN
    INSERT INTO ToaThuoc_Archive (MaToaThuoc, MaPK, MaBacSi, NgayKe, TongTien, ArchiveDate, ActionType)
    SELECT MaToaThuoc, MaPK, MaBacSi, NgayKe, TongTien, GETDATE(), 'DELETE'
    FROM DELETED;

    INSERT INTO Audit_Log (TableName, ActionType, RecordID, ActionTime, PerformedBy)
    SELECT 'ToaThuoc', 'DELETE', MaToaThuoc, GETDATE(), SYSTEM_USER
    FROM DELETED;
END;

GO
//***
CREATE TRIGGER trg_Thuoc_Delete
ON Thuoc
FOR DELETE
AS
BEGIN
    INSERT INTO Thuoc_Archive (MaThuoc, TenThuoc, DonVi, HanSuDung, ArchiveDate, ActionType)
    SELECT MaThuoc, TenThuoc, DonVi, HanSuDung, GETDATE(), 'DELETE'
    FROM DELETED;

    INSERT INTO Audit_Log (TableName, ActionType, RecordID, ActionTime, PerformedBy)
    SELECT 'Thuoc', 'DELETE', MaThuoc, GETDATE(), SYSTEM_USER
    FROM DELETED;
END;
***//
GO
CREATE TRIGGER trg_Delete_ChiTietToaThuoc
ON ChiTietToaThuoc
AFTER DELETE
AS
BEGIN
    INSERT INTO ChiTietToaThuoc_Archive (MaToaThuoc, MaThuoc, SoLuong, LieuDung, ActionType)
    SELECT MaToaThuoc, MaThuoc, SoLuong, LieuDung, 'DELETE'
    FROM deleted;

    INSERT INTO Audit_Log (TableName, ActionType, RecordID, PerformedBy)
    SELECT 'ChiTietToaThuoc', 'DELETE', MaToaThuoc + '-' + MaThuoc, SYSTEM_USER
    FROM deleted;
END;

GO
CREATE TRIGGER trg_Delete_ChiTietPhieuNhap
ON ChiTietPhieuNhap
AFTER DELETE
AS
BEGIN
    INSERT INTO ChiTietPhieuNhap_Archive (MaPhieuNhap, MaThuoc, SoLuong, GiaNhap, HanSuDung, ActionType)
    SELECT MaPhieuNhap, MaThuoc, SoLuong, GiaNhap, HanSuDung, 'DELETE'
    FROM deleted;

    INSERT INTO Audit_Log (TableName, ActionType, RecordID, PerformedBy)
    SELECT 'ChiTietPhieuNhap', 'DELETE', MaPhieuNhap + '-' + MaThuoc, SYSTEM_USER
    FROM deleted;
END;

GO
CREATE TRIGGER trg_Delete_GiaBanThuoc
ON GiaBanThuoc
AFTER DELETE
AS
BEGIN
    
    INSERT INTO GiaBanThuoc_Archive (MaThuoc, NgayApDung, GiaBan, ActionType)
    SELECT MaThuoc, NgayApDung, GiaBan, 'DELETE'
    FROM deleted;

    INSERT INTO Audit_Log (TableName, ActionType, RecordID, PerformedBy)
    SELECT 
        'GiaBanThuoc',
        'DELETE',
        MaThuoc + '-' + CONVERT(NVARCHAR, NgayApDung, 23),
        SYSTEM_USER
    FROM deleted;
END;

GO
CREATE TRIGGER trg_Thuoc_Delete
ON Thuoc
FOR DELETE
AS
BEGIN
    INSERT INTO Thuoc_Archive (MaThuoc, TenThuoc, DonVi, ArchiveDate, ActionType)
    SELECT MaThuoc, TenThuoc, DonVi, GETDATE(), 'DELETE'
    FROM DELETED;

    INSERT INTO Audit_Log (TableName, ActionType, RecordID, ActionTime, PerformedBy)
    SELECT 'Thuoc', 'DELETE', MaThuoc, GETDATE(), SYSTEM_USER
    FROM DELETED;
END;
