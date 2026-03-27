INSERT INTO BoPhan (MaBP, TenBoPhan) VALUES
('BPQL', N'Bộ phận quản lý'),
('BPTTDP', N'Bộ phận tiếp tân và điều phối'),
('BPDT', N'Bộ phận điều trị'),
('BPTV', N'Bộ phận tài vụ'),
('BPKT', N'Bộ phận kế toán'),
('BPDNT', N'Bộ phận dược – nhà thuốc');

INSERT INTO PhongBan (MaPB, MaBP, TenPhongBan, MoTa) VALUES
-- Bộ phận quản lý
('PBQLNS', 'BPQL', N'Phòng quản lý tài nguyên nhân sự', NULL),
('PBQLTV', 'BPQL', N'Phòng quản lý tài vụ', NULL),
('PBQLCM', 'BPQL', N'Phòng quản lý chuyên môn', NULL),

-- Bộ phận tiếp tân và điều phối
('PBTTDP', 'BPTTDP', N'Phòng tiếp tân và điều phối', NULL),

-- Bộ phận điều trị
('PBKN', 'BPDT', N'Phòng khoa nội', NULL),
('PBKG', 'BPDT', N'Phòng khoa ngoại', NULL),
('PBKNHI', 'BPDT', N'Phòng khoa nhi', NULL),

-- Bộ phận tài vụ
('PBTTV', 'BPTV', N'Phòng tài vụ', NULL),

-- Bộ phận kế toán
('PBKT', 'BPKT', N'Phòng kế toán', NULL),

-- Bộ phận dược – nhà thuốc
('PBBT', 'BPDNT', N'Phòng bán thuốc', NULL);

INSERT INTO ThuTuc (MaThuTuc, TenTuc, DonGia) VALUES
('TT001', N'Khám tổng quát', 150000.00),
('TT002', N'Xét nghiệm máu', 80000.00),
('TT003', N'Chụp X-quang phổi', 120000.00),
('TT004', N'Siêu âm bụng tổng quát', 200000.00),
('TT005', N'Đo điện tim (ECG)', 100000.00),
('TT006', N'Khám tai mũi họng', 90000.00),
('TT007', N'Nội soi dạ dày', 350000.00),
('TT008', N'Xét nghiệm nước tiểu', 50000.00),
('TT009', N'Tiêm ngừa cúm', 70000.00),
('TT010', N'Khám chuyên khoa tim mạch', 250000.00);

INSERT INTO Thuoc (MaThuoc, TenThuoc, DonVi) VALUES
('TH001', N'Paracetamol 500mg', N'Vỉ'),
('TH002', N'Amoxicillin 500mg', N'Vỉ'),
('TH003', N'Vitamin C 500mg', N'Vỉ'),
('TH004', N'Ibuprofen 200mg', N'Vỉ'),
('TH005', N'Loratadine 10mg', N'Vỉ'),
('TH006', N'Omeprazole 20mg', N'Vỉ'),
('TH007', N'Salbutamol 2mg', N'Vỉ'),
('TH008', N'Cefixime 200mg', N'Vỉ'),
('TH009', N'Metronidazole 250mg', N'Vỉ'),
('TH010', N'Dextromethorphan 15mg', N'Vỉ');

INSERT INTO GiaBanThuoc (MaThuoc, NgayApDung, GiaBan) VALUES
('TH001', '2025-05-01', 15000),
('TH002', '2025-05-01', 35000),
('TH003', '2025-05-01', 20000),
('TH004', '2025-05-01', 18000),
('TH005', '2025-05-01', 22000),
('TH006', '2025-05-01', 28000),
('TH007', '2025-05-01', 16000),
('TH008', '2025-05-01', 40000),
('TH009', '2025-05-01', 25000),
('TH010', '2025-05-01', 19000);


INSERT INTO NhanVien (MaNV, HoTenNV, NgaySinh, GioiTinh, DiaChi, SDT, MaPB) VALUES
('BS.85.0001', N'Nguyễn Hoàng Phong', '1980-11-15', N'Nam', N'Hà Nội', '0987123456', 'PBKN'),
('BS.88.0002', N'Nguyễn Quang Ngọc', '1975-08-22', N'Nam', N'Hà Nội', '0912345678', 'PBKG'),
('BS.95.1475', N'Nguyễn Trần Gia Huy', '1982-03-30', N'Nam', N'Hà Nội', '0978123456', 'PBKNHI'),
('DS.91.6541', N'Trần Thị Z', '1992-05-12', N'Nữ', N'Hà Nội', '0978123456', 'PBBT');


INSERT INTO NhanVien (MaNV, HoTenNV, NgaySinh, GioiTinh, DiaChi, SDT, MaPB) VALUES
('TV.80.1456', N'Lê Nguyễn Minh Hoàng', '1990-11-20', N'Nam', N'Hà Nội', '0987123456', 'PBTTV')

INSERT INTO NhanVien (MaNV, HoTenNV, NgaySinh, GioiTinh, DiaChi, SDT, MaPB) VALUES
('TT.00.3456', N'Quách Tuấn Anh', '2000-11-20', N'Nam', N'Hà Nội', '047893456', 'PBTTDP'),
('NS.95.6841', N'Đặng Thị Thu Trang', '1995-11-20', N'Nam', N'Hà Nội', '079236841', 'PBQLNS'),
('KT.90.8980', N'Phan Võ Anh Hào', '1990-03-25', N'Nam', N'Hà Nội', '036478980', 'PBKT');


INSERT INTO BacSi (MaBS, TrinhDo) VALUES
('BS.85.0001', N'Tiến sĩ Y khoa'),
('BS.88.0002', N'Phó Giáo sư, Tiến sĩ'),
('BS.95.1475', N'Bác sĩ Chuyên khoa II');

EXEC TaoTaiKhoan_MaHoa
    @MaTK = 'TK001',
    @MaNV = 'BS.85.0001',
    @TenDN = 'qlpk',
    @MatKhau = '20032003'


EXEC TaoTaiKhoan_MaHoa
    @MaTK = 'TK002',
    @MaNV = 'DS.91.6541',
    @TenDN = 'qlthuoc',
    @MatKhau = '20032003'



EXEC TaoTaiKhoan_MaHoa
    @MaTK = 'TK003',
    @MaNV = 'TV.80.1456',
    @TenDN = 'qltaivu',
    @MatKhau = '20032003'



EXEC TaoTaiKhoan_MaHoa
    @MaTK = 'TK004',
    @MaNV = 'NS.95.6841',
    @TenDN = 'qlns',
    @MatKhau = '20032003'



EXEC TaoTaiKhoan_MaHoa
    @MaTK = 'TK005',
    @MaNV = 'TT.00.3456',
    @TenDN = 'qltieptan',
    @MatKhau = '20032003'


EXEC TaoTaiKhoan_MaHoa
    @MaTK = 'TK006',
    @MaNV = 'KT.90.8980',
    @TenDN = 'qlluong',
    @MatKhau = '20032003'

