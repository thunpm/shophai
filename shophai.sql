drop database shophai;

create database shophai;

use shophai;

-- khách hàng
create table KhachHang (
	MaKH varchar(10) not null,
    TenDangNhap nvarchar(50) not null,
    MatKhau nvarchar(50) not null,
    HoTen nvarchar(50),
    SoDienThoai varchar(12),
    Email varchar(50),
    GioiTinh nvarchar(50),
    NgaySinh date,
    
    primary key (MaKH)
);

-- địa chỉ khách hàng
create table DiaChi (
	MaDC varchar(10) not null,
    MaKH varchar(10) not null,
    Tinh nvarchar(500),
    Huyen nvarchar(500),
    Xa nvarchar(500),
    SoNha nvarchar(500),
    GhiChu nvarchar(500),
    MacDinh bit default(0), -- có phải địa chỉ giao hàng mặc định?
    
    primary key (MaDC),
    foreign key (MaKH) references KhachHang (MaKH)
);

-- danh mục
CREATE TABLE DanhMuc (
	MaDM VARCHAR(10) PRIMARY KEY,
	TenDM NVARCHAR(500) NOT NULL
);

-- loại sản phẩm
CREATE TABLE TheLoai (
	MaTL VARCHAR(10) PRIMARY KEY not null,
	TenTL NVARCHAR(500),
	MaDM VARCHAR(10) not null,
    
	FOREIGN KEY (MaDM) REFERENCES DanhMuc (MaDM)
);

-- sản phẩm
CREATE TABLE SanPham (
	MaSP VARCHAR(10) PRIMARY KEY,
	TenSP NVARCHAR(500) NOT NULL,
	MoTa text, -- mô tả thông số kĩ thuật
    SoLuongCo int,
    SoLuongBan int,
	Gia float NOT NULL,
	KhuyenMai float NOT NULL,
	MaTL VARCHAR(10) NOT NULL,
    
	FOREIGN KEY (MaTL) REFERENCES TheLoai (MaTL)
);

create table DacTinhSanPham ( -- đặc tính sản phẩm như là màu sắc, thương hiệu, ram, ổ cứng, ...
	MaDT varchar(10) not null,
    MaSP varchar(10) not null,
    TenDT nvarchar(500),
    ChiTietDT nvarchar(500),
    
    primary key (MaDT),
    foreign key (MaDT) references SanPham (MaSP)
);

-- ảnh sản phẩm
create table HinhAnh (
	MaHinh varchar(10) not null,
	MaSP varchar(10) not null,
    TenHinh varchar(500),
    
	primary key (MaHinh),
	foreign key (MaSP) references SanPham (MaSP) on delete cascade
);

-- đánh giá sản phẩm
create table DanhGia (
	MaDG varchar(10) not null,
    MaSP varchar(10) not null,
    MaKH varchar(10) not null,
    DanhGia int,
    NhanXet nvarchar(1000),

	primary key (MaDG),
    foreign key (MaSP) references SanPham (MaSP),
    foreign key (MaKH) references KhachHang (MaKH)
);

-- giỏ hàng
create table GioHang (
	MaSP varchar(10) not null,
	MaKH varchar(10) not null,
	SoLuong int,
	primary key (MaSP, MaKH),
	foreign key (MaSP) references SanPham (MaSP) on delete cascade,
	foreign key (MaKH) references KhachHang (MaKH) on delete cascade
);

-- hóa đơn
create table HoaDon (
	MaHD varchar(10) not null,
	MaKH varchar(10) not null,
	NgayLap datetime,
	primary key (MaHD),
	foreign key (MaKH) references KhachHang (MaKH) on delete cascade
);

-- chi tiết hóa đơn
create table ChiTietHoaDon (
	MaHD varchar(10) not null,
	MaSP varchar(10) not null,
	SoLuong int,
	Gia float,
	KhuyenMai float,
	primary key (MaHD, MaSP),
	foreign key (MaHD) references HoaDon (MaHD) on delete cascade,
	foreign key (MaSP) references SanPham (MaSP) on delete cascade
);

-- admin
create table Admin (
	MaAD varchar(10) not null,
	TenDangNhap nvarchar(50) not null,
    MatKhau nvarchar(50) not null,
    HoTen nvarchar(50),
    
    primary key (MaAD)
);

-- tin tức
CREATE TABLE TinTuc (
	MaTT varchar(10) not null,
	TieuDe nvarchar(500),
	TomTat nvarchar(500),
	NgayDang datetime,
	MaAD varchar(10) not null, -- id admin đăng bài
	NoiDung nvarchar(10000),
	TrangThai bit default(1), -- hiển thị hay ẩn

	primary key (MaTT),
	foreign key (MaAD) references Admin (MaAD)
);

insert KhachHang (MaKH, TenDangNhap, MatKhau, HoTen, SoDienThoai)
values
	('KH001', 'thu', '123', N'Nguyễn Phan Minh Thư', '0898154428'),
    ('KH002', 'doraemon', '123', N'Lê Trần Hoàng Lan', '0898154429'),
    ('KH003', 'ahihi', '123', N'Huỳnh Văn Phong', '0898154430'),
    ('KH004', 'vananh', '123', N'Nguyễn Vân Anh', '0898154431'),
    ('KH005', 'cam', '123', N'Huỳnh Thị Bích Cảm', '0898154432'),
    ('KH006', 'ngan', '123', N'Trần Thị Ngân', '0898154433'),
    ('KH007', 'duong', '123', N'Võ Thùy Dương', '0898154434');
    
insert DanhMuc (MaDM, TenDM)
values
	('DM01', N'Điện thoại'),
    ('DM02', N'Máy tính bảng'),
    ('DM03', N'Laptop'),
    ('DM04', N'Phụ kiện');
    
 insert TheLoai (MaTL, TenTL, MaDM)
 values
	('LSP001', 'Samsung', 'DM01'),
    ('LSP002', 'Xiaomi', 'DM01'),
    ('LSP003', 'Vsmart', 'DM01'),
    ('LSP004', 'Apple', 'DM01'),
    ('LSP005', 'OPPO', 'DM01'),
    ('LSP006', 'Vivo', 'DM01'),
    ('LSP007', 'Realme', 'DM01'),
    ('LSP008', 'Nokia', 'DM01'),
    ('LSP009', 'Samsung', 'DM02'),
    ('LSP010', 'Lenovo', 'DM02'),
    ('LSP011', 'Apple', 'DM02'),
	('LSP012', 'Xiaomi', 'DM02'),
    ('LSP013', 'Asus', 'DM03'),
    ('LSP014', 'Acer', 'DM03'),
    ('LSP015', 'Levono', 'DM03'),
    ('LSP016', 'Apple', 'DM03'),
    ('LSP017', 'Dell', 'DM03'),
    ('LSP018', 'HP', 'DM03'),
    ('LSP019', 'Sạc dự phòng', 'DM04'),
    ('LSP020', 'USB - Ổ cứng', 'DM04'),
    ('LSP021', 'Tai nghe', 'DM04'),
    ('LSP022', 'Bàn phím', 'DM04'),
    ('LSP023', 'Loa', 'DM04'),
    ('LSP024', 'Chuột', 'DM04'),
    ('LSP025', 'Balo - Túi xách', 'DM04');

insert SanPham (MaSP, TenSP, MoTa, SoLuongCo, SoLuongBan, Gia, KhuyenMai, MaTL)
values
	('SP001', 'Samsung Galaxy Z Fold3 5G 256GB', 'Với một màn hình gập, Samsung Galaxy Z Fold3 5G đã giải quyết bài toán đưa màn hình lớn lên một chiếc điện thoại di động. Trong trạng thái gập, Galaxy Z Fold3 5G thậm chí còn nhỏ hơn một chiếc smartphone thông thường, dễ dàng cho vào túi xách, túi quần, sử dụng bằng một tay. </br> Còn khi bạn mở màn hình gập, mọi thứ sẽ trở nên sống động hơn bao giờ hết với kích thước lớn tới 7,6 inch. Hơn nữa, đây còn là màn hình tỉ lệ vuông, cho diện tích sử dụng lớn gấp đôi so với smartphone thông thường.', 100, 0, 40990000, 1000000, 'LSP001'),
	('SP002', 'Samsung Galaxy Z Fold3 5G 256GB', 'Với một màn hình gập, Samsung Galaxy Z Fold3 5G đã giải quyết bài toán đưa màn hình lớn lên một chiếc điện thoại di động. Trong trạng thái gập, Galaxy Z Fold3 5G thậm chí còn nhỏ hơn một chiếc smartphone thông thường, dễ dàng cho vào túi xách, túi quần, sử dụng bằng một tay. </br> Còn khi bạn mở màn hình gập, mọi thứ sẽ trở nên sống động hơn bao giờ hết với kích thước lớn tới 7,6 inch. Hơn nữa, đây còn là màn hình tỉ lệ vuông, cho diện tích sử dụng lớn gấp đôi so với smartphone thông thường.', 100, 0, 40990000, 1000000, 'LSP001');

insert HinhAnh (MaHinh, MaSP, TenHinh)
values
	('HA001', 'SP001', 'samsung-galaxy-z-fold3-5g-1.jpg');
    
insert DacTinhSanPham (MaDT, MaSP, TenDT, ChiTietDT)
values 
	('DT001', 'SP001', 'Màn hình', '7.6"'),
    ('DT002', 'SP001', 'RAM', '12GB'),
    ('DT003', 'SP001', 'Bộ nhớ trong', '256GB'),
    ('DT004', 'SP001', 'CPU', 'Snapdragon 888'),
    ('DT005', 'SP001', 'Xuất xứ', 'Việt Nam/Trung Quốc'),
    ('DT006', 'SP001', 'Thời gian ra mắt', '08/2021');
    
-- 1. Tạo khung nhìn hiển thị các sản phẩm thuộc danh mục 'Điện thoại'.
-- 2. Tạo thủ tục xóa khách hàng, sao cho thông tin về sổ địa chỉ của khách hàng đó cũng bị xóa theo.
-- 3. Tạo thủ tục hiển thị tất cả sản phẩm theo thứ tự n. Với n là tham số đầu vào, nhận các giá trị "moi nhat",
-- "cu nhat", "gia cao", "gia thap".
-- 4. Tạo thủ tục hiển thị sản phẩm không bán được trong x tháng vừa qua. Với x là số nguyên tham số đầu vào.
-- 5. Tạo hàm trả về bảng kết quả gồm MaSP, TenSP, SoLuongDaBan, TongTienThu của tháng x trong năm hiện tại. 
-- Với x là tham số đầu vào, nhận các giá trị từ 1 đến 12.
-- 6. Tạo hàm trả về bảng tất cả sản phẩm thuộc loại x và có mức giá trong khoảng [a, b]. Với x, a và b là tham số đầu vào của hàm.
-- 7. Tạo hàm trả về doanh thu trong khoảng thời gian x và y. Với x và y là tham số đầu vào.
-- 8. Tạo trigger kiểm tra việc thêm mới khách hàng, với điều kiện tên đăng nhập và số điện thoại không được trùng lại.
-- 9. Tạo trigger kiểm tra việc xóa hóa đơn, với điều kiện chỉ cho xóa các hóa đơn có trạng thái "da huy".




    
    
    
	
