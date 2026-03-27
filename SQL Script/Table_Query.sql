Use QLBV

CREATE TABLE BenhNhan (
    MaBN NVARCHAR(50) PRIMARY KEY,
    HoTenBN NVARCHAR(100),
    NgaySinh DATE,
    DiaChi NVARCHAR(100),
    SDT NVARCHAR(20),
);

CREATE TABLE BoPhan (
    MaBP NVARCHAR(50) PRIMARY KEY,
    TenBoPhan NVARCHAR(100)
);

CREATE TABLE PhongBan (
    MaPB NVARCHAR(50) PRIMARY KEY,
	MaBP NVARCHAR(50),
    TenPhongBan NVARCHAR(100),
    MoTa NVARCHAR(MAX),
	Foreign key (MaBP) references BoPhan(MaBP)
);

CREATE TABLE NhanVien (
    MaNV NVARCHAR(50) PRIMARY KEY,
    HoTenNV NVARCHAR(100),
    NgaySinh DATE,
    GioiTinh NVARCHAR(10),
    DiaChi NVARCHAR(100),
    SDT NVARCHAR(20),
    LoaiNhanVien NVARCHAR(100),
    MaPB NVARCHAR(50),
    FOREIGN KEY (MaPB) REFERENCES PhongBan(MaPB)
);

CREATE TABLE BacSi (
    MaBS NVARCHAR(50) PRIMARY KEY,
    TrinhDo NVARCHAR(100)
	FOREIGN KEY (MaBS) REFERENCES NhanVien(MaNV)
);

CREATE TABLE CaTruc (
    MaCT NVARCHAR(50) PRIMARY KEY,
    ThoiGianBT DATETIME,
    ThoiGianKT DATETIME,
	NVtruc NVARCHAR(50),
	Foreign key (NVtruc) references NhanVien(MaNV)
);

CREATE TABLE Luong (
    MaLuong NVARCHAR(50) PRIMARY KEY,
    MaNV NVARCHAR(50),
    Thang INT,
    Nam INT,
    LuongCoBan varbinary(255),
    PhuCap DECIMAL(10,2),
    NgayCong INT,
    TongLuong DECIMAL(20,2),
    FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV)
);

CREATE TABLE TaiKhoan (
    MaTK NVARCHAR(50) PRIMARY KEY,
    MaNV NVARCHAR(50) UNIQUE,
    TenDN NVARCHAR(50),
    MK VARBINARY(255),
    LoaiTK NVARCHAR(50),
    FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV)
);

CREATE TABLE PhieuKhamBenh (
    MaPK NVARCHAR(50) PRIMARY KEY,
    MaSoKham INT,
    TrieuChung NVARCHAR(100),
    NgayKham DATE,
    NguoiKham NVARCHAR(50),
    Bacsi NVARCHAR(50),
    FOREIGN KEY (Bacsi) REFERENCES BacSi(MaBS),
    FOREIGN KEY (NguoiKham) REFERENCES BenhNhan(MaBN)
);

CREATE TABLE SoKhamBenh (
    MaSoKham INT IDENTITY PRIMARY KEY,
    MaBN NVARCHAR(50),
    MaPK NVARCHAR(50),
    CONSTRAINT FK_SoKhamBenh_BenhNhan FOREIGN KEY (MaBN) REFERENCES BenhNhan(MaBN),
    CONSTRAINT FK_SoKhamBenh_PhieuKham FOREIGN KEY (MaPK) REFERENCES PhieuKhamBenh(MaPK)
);

CREATE TABLE ThuTuc (
    MaThuTuc NVARCHAR(50) PRIMARY KEY,
    TenTuc NVARCHAR(100),
    DonGia DECIMAL(10,2),
);

CREATE TABLE ChiTietPhieuKham (
    MaPK NVARCHAR(50),
	MaTT NVARCHAR(50),
    SoTien DECIMAL(10,2),
    TTThanhToan NVARCHAR(100),
    FOREIGN KEY (MaPK) REFERENCES PhieuKhamBenh(MaPK),
	FOREIGN KEY (MaTT) REFERENCES ThuTuc(MaThuTuc)
);


CREATE TABLE ToaThuoc (
    MaToaThuoc NVARCHAR(50) PRIMARY KEY,
	MaBacSi NVARCHAR(50),
    NgayKe DATE,
    TongTien DECIMAL(10,2),
	FOREIGN KEY (MaBacSi) REFERENCES BacSi(MaBS)
);


CREATE TABLE Thuoc (
    MaThuoc NVARCHAR(50) PRIMARY KEY,
    TenThuoc NVARCHAR(100),
    DonVi NVARCHAR(100),
);

CREATE TABLE ChiTietToaThuoc --can audit toa thuoc
(
    MaToaThuoc NVARCHAR(50),
	MaThuoc NVARCHAR(50),
    SoLuong NVARCHAR(50),
    LieuDung NVARCHAR(100),
    FOREIGN KEY (MaToaThuoc) REFERENCES ToaThuoc(MaToaThuoc),
	FOREIGN KEY (MaThuoc) REFERENCES Thuoc(MaThuoc)
);

CREATE TABLE PhieuNhapThuoc (
    MaPhieuNhap NVARCHAR(50) PRIMARY KEY,
    NgayNhap DATE,
    NhaCungCap NVARCHAR(100)
);

CREATE TABLE ChiTietPhieuNhap (
    MaPhieuNhap NVARCHAR(50),
    MaThuoc NVARCHAR(50),
    SoLuong INT,
    GiaNhap DECIMAL(10,2),
    HanSuDung DATE,
    PRIMARY KEY (MaPhieuNhap, MaThuoc),
    FOREIGN KEY (MaPhieuNhap) REFERENCES PhieuNhapThuoc(MaPhieuNhap),
    FOREIGN KEY (MaThuoc) REFERENCES Thuoc(MaThuoc)
);

CREATE TABLE GiaBanThuoc (
    MaThuoc NVARCHAR(50),
    NgayApDung DATE,
    GiaBan DECIMAL(10,2),
    PRIMARY KEY (MaThuoc, NgayApDung),
    FOREIGN KEY (MaThuoc) REFERENCES Thuoc(MaThuoc)
);



--Table dung de auditing
CREATE TABLE Audit_Log (
    ID INT IDENTITY PRIMARY KEY,
    TableName NVARCHAR(100),
    ActionType NVARCHAR(10),
    RecordID NVARCHAR(50),
    ActionTime DATETIME DEFAULT GETDATE(),
    PerformedBy NVARCHAR(100)
);
