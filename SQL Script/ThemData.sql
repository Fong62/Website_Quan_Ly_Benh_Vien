/***INSERT INTO BoPhan (MaBP, TenBoPhan) VALUES
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


INSERT INTO NhanVien (MaNV, HoTenNV, NgaySinh, GioiTinh, DiaChi, SDT, LoaiNhanVien, MaPB) VALUES
('BS001', N'Nguyễn Hoàng Phong', '1980-11-15', N'Nam', N'Hà Nội', '0987123456', 'PBKN'),
('BS002', N'Nguyễn Quang Ngọc', '1975-08-22', N'Nam', N'Hà Nội', '0912345678', 'PBKG'),
('BS003', N'Nguyễn Trần Gia Huy', '1982-03-30', N'Nam', N'Hà Nội', '0978123456', 'PBKNHI');


INSERT INTO BacSi (MaBS, TrinhDo) VALUES
('BS001', N'Tiến sĩ Y khoa'),
('BS002', N'Phó Giáo sư, Tiến sĩ'),
('BS003', N'Bác sĩ Chuyên khoa II');**/

--BoSng
EXEC TaoTaiKhoan_MaHoa N'PBQLNS12', N'NV001', N'QuanLyNhanSu', N'12345678', N'QuanLyNhanSu'
EXEC TaoTaiKhoan_MaHoa N'PBQLTV12', N'NV002', N'QuanLyTaiVu', N'12345678', N'QuanLyTaiVu'
EXEC TaoTaiKhoan_MaHoa N'PBQLCM12', N'NV003', N'QuanLyChuyenMon', N'12345678', N'QuanLyChuyenMon'
EXEC TaoTaiKhoan_MaHoa N'PBTT1234', N'NV004', N'TiepTan', N'12345678', N'TiepTan'
EXEC TaoTaiKhoan_MaHoa N'PBBS1234', N'BS001', N'BacSi', N'12345678', N'BacSi'
EXEC TaoTaiKhoan_MaHoa N'PBBS12345', N'BS002', N'BacSi', N'12345678', N'BacSi'
EXEC TaoTaiKhoan_MaHoa N'PBBS123456', N'BS003', N'BacSi', N'12345678', N'BacSi'
EXEC TaoTaiKhoan_MaHoa N'PBTV1234', N'NV005', N'TaiVu', N'12345678', N'TaiVu'
EXEC TaoTaiKhoan_MaHoa N'PBKT1234', N'NV006', N'KeToan', N'12345678', N'KeToan'
EXEC TaoTaiKhoan_MaHoa N'PBBT1234', N'NV007', N'BanThuoc', N'12345678', N'BanThuoc'