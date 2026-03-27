USE QLBV
go
CREATE TABLE SoKhamBenh_Archive (
    MaSoKham NVARCHAR(50),
    MaBN NVARCHAR(50),
    MaPK NVARCHAR(50),
    ArchiveDate DATETIME DEFAULT GETDATE(),    
    ActionType NVARCHAR(10)                    
);
go
CREATE TABLE Archive_NhanVien (
    ArchiveID INT IDENTITY PRIMARY KEY,
    MaNV NVARCHAR(50),
    HoTenNV NVARCHAR(100),
    NgaySinh DATE,
    GioiTinh NVARCHAR(10),
    DiaChi NVARCHAR(100),
    SDT NVARCHAR(20),
    LoaiNhanVien NVARCHAR(100),
    MaPB NVARCHAR(50),
    ArchivedAt DATETIME DEFAULT GETDATE()
);
go
CREATE TABLE BenhNhan_Archive (
    MaBN NVARCHAR(50),
    HoTenBN NVARCHAR(100),
    NgaySinh DATE,
    DiaChi NVARCHAR(100),
    SDT NVARCHAR(20),
    ArchiveDate DATETIME DEFAULT GETDATE(),
    ActionType NVARCHAR(10)
);
go
CREATE TABLE BacSi_Archive (
    MaBS NVARCHAR(50),
    TrinhDo NVARCHAR(100),
    ArchiveDate DATETIME DEFAULT GETDATE(),
    ActionType NVARCHAR(10)
);
go
CREATE TABLE PhongBan_Archive (
    MaPB NVARCHAR(50),
    MaBP NVARCHAR(50),
    TenPhongBan NVARCHAR(100),
    MoTa NVARCHAR(MAX),
    ArchiveDate DATETIME DEFAULT GETDATE(),
    ActionType NVARCHAR(10)
);

CREATE TABLE BoPhan_Archive (
    MaBP NVARCHAR(50),
    TenBoPhan NVARCHAR(100),
    ArchiveDate DATETIME DEFAULT GETDATE(),
    ActionType NVARCHAR(10)
);

CREATE TABLE CaTruc_Archive (
    MaCT NVARCHAR(50),
    ThoiGianBT DATETIME,
    ThoiGianKT DATETIME,
    NVtruc NVARCHAR(50),
    ArchiveDate DATETIME DEFAULT GETDATE(),
    ActionType NVARCHAR(10)
);

CREATE TABLE Luong_Archive (
    MaLuong NVARCHAR(50),
    MaNV NVARCHAR(50),
    Thang INT,
    Nam INT,
    LuongCoBan VARBINARY(255),
    PhuCap DECIMAL(10,2),
    NgayCong INT,
    TongLuong DECIMAL(20,2),
    ArchiveDate DATETIME DEFAULT GETDATE(),
    ActionType NVARCHAR(10)
);

CREATE TABLE TaiKhoan_Archive (
    MaTK NVARCHAR(50),
    MaNV NVARCHAR(50),
    TenDN NVARCHAR(50),
    MK VARBINARY(255),
    LoaiTK NVARCHAR(50),
    ArchiveDate DATETIME DEFAULT GETDATE(),
    ActionType NVARCHAR(10)
);

CREATE TABLE PhieuKhamBenh_Archive (
    MaPK NVARCHAR(50) PRIMARY KEY,
    TrieuChung NVARCHAR(100),
    NgayKham DATE,
	NguoiKham NVARCHAR(50),
	Bacsi NVARCHAR(50),
    ArchiveDate DATETIME DEFAULT GETDATE(),
    ActionType NVARCHAR(10)
);

CREATE TABLE ChiTietPhieuKham_Archive (
    MaPK NVARCHAR(50),
    MaTT NVARCHAR(50),
    SoTien DECIMAL(10,2),
    TTThanhToan NVARCHAR(100),
    ArchiveDate DATETIME DEFAULT GETDATE(),
    ActionType NVARCHAR(10)
);

CREATE TABLE ThuTuc_Archive (
    MaThuTuc NVARCHAR(50),
    TenTuc NVARCHAR(100),
    DonGia DECIMAL(10,2),
    ArchiveDate DATETIME DEFAULT GETDATE(),
    ActionType NVARCHAR(10)
);

CREATE TABLE ToaThuoc_Archive (
    MaToaThuoc NVARCHAR(50),
    MaBacSi NVARCHAR(50),
    NgayKe DATE,
    TongTien DECIMAL(10,2),
    ArchiveDate DATETIME DEFAULT GETDATE(),
    ActionType NVARCHAR(10)
);

CREATE TABLE ChiTietToaThuoc_Archive (
    MaToaThuoc NVARCHAR(50),
    MaThuoc NVARCHAR(50),
    SoLuong NVARCHAR(50),
    LieuDung NVARCHAR(100),
    ArchiveDate DATETIME DEFAULT GETDATE(),
    ActionType NVARCHAR(10)
);

CREATE TABLE Thuoc_Archive (
    MaThuoc NVARCHAR(50),
    TenThuoc NVARCHAR(100),
    DonVi NVARCHAR(100),
    ArchiveDate DATETIME DEFAULT GETDATE(),
    ActionType NVARCHAR(10)
);

CREATE TABLE PhieuNhapThuoc_Archive (
    MaPhieuNhap NVARCHAR(50),
    NgayNhap DATE,
    NhaCungCap NVARCHAR(100),
    ArchiveDate DATETIME DEFAULT GETDATE(),
    ActionType NVARCHAR(10)
);

CREATE TABLE ChiTietPhieuNhap_Archive (
    MaPhieuNhap NVARCHAR(50),
    MaThuoc NVARCHAR(50),
    SoLuong INT,
    GiaNhap DECIMAL(10,2),
    HanSuDung DATE,
    ArchiveDate DATETIME DEFAULT GETDATE(),
    ActionType NVARCHAR(10)
);

CREATE TABLE GiaBanThuoc_Archive (
    MaThuoc NVARCHAR(50),
    NgayApDung DATE,
    GiaBan DECIMAL(10,2),
    ArchiveDate DATETIME DEFAULT GETDATE(),
    ActionType NVARCHAR(10)
);


/*select * from Archive_NhanVien --Test khi chay archivetable vi archive table ko hien trong db
select * from BenhNhan_Archive
select * from BacSi_Archive
select * from PhongBan_Archive
select * from BoPhan_Archive
select * from CaTruc_Archive
select * from PhieuKhamBenh_Archive
select * from ChiTietPhieuKham_Archive
select * from ThuTuc_Archive
select * from ToaThuoc_Archive
select * from ChiTietToaThuoc_Archive
select * from Thuoc_Archive
select * from PhieuNhapThuoc_Archive
select * from ChiTietPhieuNhap_Archive
select * from GiaBanThuoc_Archive
*/
