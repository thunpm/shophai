drop database if exists shophai;

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
    foreign key (MaSP) references SanPham (MaSP)
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
	foreign key (MaSP) references SanPham (MaSP),
	foreign key (MaKH) references KhachHang (MaKH)
);

-- hóa đơn
create table HoaDon (
	MaHD varchar(10) not null,
	MaKH varchar(10) not null,
	NgayLap datetime,
	primary key (MaHD),
	foreign key (MaKH) references KhachHang (MaKH)
);

-- chi tiết hóa đơn
create table ChiTietHoaDon (
	MaHD varchar(10) not null,
	MaSP varchar(10) not null,
	SoLuong int,
	Gia float,
	KhuyenMai float,
	primary key (MaHD, MaSP),
	foreign key (MaHD) references HoaDon (MaHD),
	foreign key (MaSP) references SanPham (MaSP)
);

-- admin
create table Admin (
	MaAD varchar(10) not null,
	TenDangNhap nvarchar(50) not null,
    MatKhau nvarchar(50) not null,
    HoTen nvarchar(50),
    
    primary key (MaAD)
);

-- danh mục tin tức
create table DanhMucTin(
	MaDMT VARCHAR(10) PRIMARY KEY,
	TenDM NVARCHAR(500) NOT NULL
);

-- tin tức
CREATE TABLE TinTuc (
	MaTT varchar(10) not null,
	TieuDe nvarchar(500),
	TomTat nvarchar(500),
	NgayDang date,
	MaAD varchar(10) not null, -- id admin đăng bài
	NoiDung text,
    MaDMT VARCHAR(10) not null,
	Anh varchar(100),
	TrangThai bit default(1), -- hiển thị hay ẩn

	primary key (MaTT),
	foreign key (MaDMT) references DanhMucTin (MaDMT),
	foreign key (MaAD) references Admin (MaAD)
);

-- insert KhachHang
insert KhachHang (MaKH, TenDangNhap, MatKhau, HoTen, SoDienThoai) 
values
	('KH001', 'thu', '123', N'Nguyễn Phan Minh Thư', '0898154428'),
    ('KH002', 'doraemon', '123', N'Lê Trần Hoàng Lan', '0898154429'),
    ('KH003', 'ahihi', '123', N'Huỳnh Văn Phong', '0898154430'),
    ('KH004', 'vananh', '123', N'Nguyễn Vân Anh', '0898154431'),
    ('KH005', 'cam', '123', N'Huỳnh Thị Bích Cảm', '0898154432'),
    ('KH006', 'ngan', '123', N'Trần Thị Ngân', '0898154433'),
    ('KH007', 'duong', '123', N'Võ Thùy Dương', '0898154434');

-- insert diachi
INSERT INTO DiaChi( MaDC, MaKH,Tinh, Huyen,Xa,SoNha, GhiChu, MacDinh)
VALUES
(   'DC001', 'KH001', N'Quảng Nam',   N'Điện Bàn',  N'Xa1',   N'Số nhà 12', N'ghi chú 1',   NULL   ),
(   'DC002', 'KH006', N'Quảng Nam',   N'Thăng Bình',  N'Xa2',   N'Số nhà 10', N'ghi chú 2',   NULL   ),
(   'DC003', 'KH004', N'Đà nãng',   N'Liên Chiểu',  N'Hòa Khánh',   N'Số 124', N'ghi chú 3',   NULL   ),
(   'DC004', 'KH002', N'Quảng Ngãi',   N'Đức Phổ',  N'Xa3',   N'Số 111', N'ghi chú 4',   NULL   ),
(   'DC001', 'KH001', N'Đà Nẵng',   N'Cẩm Lệ',  N'Xa4',   N'Số nhà 11', N'ghi chú 5',   NULL   );

-- insert DanhMuc    
insert DanhMuc (MaDM, TenDM)
values
	('DM01', N'Điện thoại'),
    ('DM02', N'Máy tính bảng'),
    ('DM03', N'Laptop'),
    ('DM04', N'Phụ kiện');

-- insert TheLoai
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

-- insert SanPham
insert SanPham (MaSP, TenSP, MoTa, SoLuongCo, SoLuongBan, Gia, KhuyenMai, MaTL)
values
	('SP001', 'Samsung Galaxy Z Fold3 5G 256GB', 'Với một màn hình gập, Samsung Galaxy Z Fold3 5G đã giải quyết bài toán đưa màn hình lớn lên một chiếc điện thoại di động. Trong trạng thái gập, Galaxy Z Fold3 5G thậm chí còn nhỏ hơn một chiếc smartphone thông thường, dễ dàng cho vào túi xách, túi quần, sử dụng bằng một tay. </br> Còn khi bạn mở màn hình gập, mọi thứ sẽ trở nên sống động hơn bao giờ hết với kích thước lớn tới 7,6 inch. Hơn nữa, đây còn là màn hình tỉ lệ vuông, cho diện tích sử dụng lớn gấp đôi so với smartphone thông thường.', 100, 0, 41990000, 1000000, 'LSP001'),
	('SP002', 'Samsung Galaxy S21 Ultra 128GB', 'Thiết kế Samsung Galaxy S21 Ultra là sự hội tụ giữa những đường nét phá cách và giá trị nguyên bản. Nổi bật nhất chính là cụm camera kích thước cực lớn, cho thấy điểm nhấn của chiếc S21 Ultra năm nay là khả năng nhiếp ảnh. Toàn thân máy đều có màu đen mờ nguyên bản, đơn giản nhưng rất sang trọng và lịch lãm. Nếu bạn thích sự nổi bật và thời trang hơn, có thể chọn màu bạc ngẫu hứng với vẻ đẹp sắc sảo.', 100, 0, 30990000, 9000000, 'LSP001'),
    ('SP003', 'Samsung Galaxy S21+ 128GB', 'Samsung Galaxy S21 Plus tiếp tục là một kiệt tác về thiết kế với màn hình viền siêu mỏng tuyệt đẹp, khung kim loại nguyên khối cứng cáp và mặt lưng kính mờ sang trọng. Không chỉ đẹp, Galaxy S21 Plus còn thể hiện sự độc đáo với cụm camera phá cách, nổi bật tạo điểm nhấn trên mặt lưng máy. Trừ phiên bản màu đen nguyên bản, các phiên bản màu khác cụm camera đều được chế tác màu sắc tương phản, cho bạn một vẻ đẹp thời thượng, dẫn đầu xu hướng.', 100, 0, 25990000, 9000000, 'LSP001'),
    ('SP004', 'Samsung Galaxy S20 FE 256GB', 'Samsung Galaxy S20 FE trang bị phần cứng mạnh mẽ hàng đầu thế giới hiện nay với bộ vi xử lý Snapdragon 865; 8GB RAM và 256GB bộ nhớ trong UFS 3.1 siêu tốc. Snapdragon 865 là con chip cực mạnh, mang tới hiệu năng xuất sắc, xử lý mượt mà mọi tác vụ. Tất cả những ứng dụng, đặc biệt là chơi game, đều diễn ra một cách nhanh chóng, đầy cảm hứng trên S20 FE. Bên cạnh đó, bộ nhớ lên tới 256GB mang đến không gian lưu trữ cực lớn, thoải mái để bạn lưu trữ hình ảnh, video, tệp tin, cài ứng dụng mà không lo đầy bộ nhớ.', 100, 0, 15490000, 2000000, 'LSP001'),
    ('SP005', 'Samsung Galaxy A72', 'Trên Galaxy A72, bạn sẽ được thưởng thức những hình ảnh ở một tầm cao mới với màn hình lớn 6,7 inch vô cực Infinity-O, tấm nền Super AMOLED cao cấp, độ sáng lên tới 800 nits, độ phân giải Full HD+ sắc nét. Hơn thế nữa, màn hình này còn trang bị công nghệ Eye Comfort Shield 2 bảo vệ mắt và đặc biệt là công nghệ Real Smooth cùng tấm nền 90Hz để mọi thao tác vuốt chạm đều mượt mà đáng kinh ngạc.', 100, 0, 11490000, 0, 'LSP001'),
    ('SP006', 'Xiaomi POCO X3 Pro NFC 8GB-256GB', 'Trong mức giá tầm trung nhưng cấu hình mà Xiaomi POCO X3 Pro NFC trang bị lại là bộ vi xử lý dành cho những smartphone cao cấp của năm 2021. Bộ vi xử lý Qualcomm Snapdragon 860 mạnh mẽ hàng đầu hiện nay mang đến tốc độ tuyệt hảo, kể cả trong các tựa game đồ họa cao. Thậm chí POCO X3 Pro còn tích hợp công nghệ tản nhiệt chất lỏng, đảm bảo máy mát và hiệu năng ổn định trong suốt quá trình chơi game. Hãy tự tin vào kỹ năng của bạn, Xiaomi POCO X3 Pro NFC sẽ giúp bạn làm chủ tình hình trong mọi cuộc chơi.', 100, 0, 7360000, 700000, 'LSP002'),
    ('SP007', 'Xiaomi Redmi 10 4GB-128GB', 'Trải nghiệm nhiếp ảnh chuyên nghiệp chưa bao giờ dễ dàng đến thế với camera 50MP AI trên Redmi 10. Chỉ đơn giản đưa điện thoại lên và chụp, bạn sẽ có được những bức ảnh chất lượng nhất nhờ hệ thống ống kính tiên tiến và camera AI đã làm hết mọi việc. Bên cạnh camera chính 50MP, bạn còn có camera góc siêu rộng, camera chụp siêu cận cảnh và camera đo độ sâu, cho khả năng chụp ảnh đa dạng trong mọi hoàn cảnh.', 100, 0, 4290000, 0, 'LSP002'),
    ('SP008', 'Xiaomi Redmi Note 10S 8GB-128GB', 'Bộ tứ camera trên Redmi Note 10S luôn sẵn sàng cùng bạn ghi lại những khoảnh khắc đáng nhớ nhất. Thật dễ dàng để chụp ảnh đẹp trong mọi hoàn cảnh với sự đa năng của 4 camera. Nổi bật nhất tất nhiên là camera chính 64MP, chụp ảnh sắc nét tới từng chi tiết; tiếp đến là camera góc siêu rộng 8MP, camera đo độ sâu 2MP và camera macro 2MP. Bạn sẽ không bỏ qua bất cứ điều gì thú vị trong cuộc sống khi đồng hành cùng Xiaomi Redmi Note 10S.', 100, 0, 6490000, 0, 'LSP002'),
    ('SP009', 'Xiaomi Redmi Note 10 Pro 8GB-128GB', 'Màn hình Redmi Note 10 Pro không chỉ đẹp với thiết kế viền siêu mỏng, camera selfie đặt tinh tế và độ phân giải Full HD+ sắc nét mà còn mượt mà hơn bao giờ hết nhờ tần số quét 120Hz. Với tần số quét cao gấp đôi màn hình thông thường, mọi thao tác vuốt chạm, các hoạt động chuyển cảnh đều mượt một cách đáng kinh ngạc. Bạn sẽ được trải nghiệm tốc độ nhanh, mượt chưa từng thấy trên màn hình lớn tuyệt đẹp của Redmi Note 10 Pro.', 100, 0, 7490000, 0, 'LSP002'),
    ('SP010', 'Xiaomi Redmi 9C 4GB-128GB', 'Redmi 9C mang trên mình viên pin dung lượng cao hàng đầu hiện nay với con số lên tới 5000 mAh. Bạn có thể sử dụng thoải mái trong hơn 2 ngày sau một lần sạc đầy. Không chỉ dung lượng cao, mà pin Xiaomi Redmi 9C còn rất bền với chu kỳ sạc lên tới 1000 lần. Nghĩa là sau 2,5 năm, pin của bạn cũng không xuống cấp nhiều, giảm thiểu hiện tượng chai pin.', 100, 0, 3490000, 0, 'LSP002'),
    ('SP011', 'Vsmart Aris Pro 8GB-128GB', 'Không còn những “nốt ruồi” hay “tai thỏ” làm ảnh hưởng đến thẩm mỹ và trải nghiệm xem của bạn nữa, nhờ công nghệ camera selfie ẩn dưới màn hình đầu tiên trên thế giới, Vsmart Aris Pro mang đến một màn hình tràn viền hoàn hảo. Trước mắt bạn sẽ là không gian nội dung của màn hình lớn 6,39 inch, độ phân giải Full HD+ sắc nét và công nghệ AMOLED cao cấp. Hiệu ứng từ hình ảnh tràn viền tuyệt đẹp cho bạn những nội dung hấp dẫn hơn bao giờ hết.', 100, 0, 8290000, 3200000, 'LSP003'),
    ('SP012', 'Vsmart Aris 8GB-128GB', 'So với các đối thủ trong tầm giá, Vsmart Aris có cấu hình vượt trội. Sản phẩm từ Vsmart mang trên mình bị bộ vi xử lý Snapdragon 730 cực mạnh từ Qualcomm, giúp chạy tốt mọi ứng dụng, kể cả những game 3D nặng nhất hiện nay. Việc con chip sản xuất trên tiến trình 8nm tiên tiến cũng giúp điện thoại tiêu hao ít năng lượng hơn. Không chỉ vậy, với phiên bản 8GB RAM và 128GB bộ nhớ trong cực lớn, Vsmart Aris cho khả năng chạy đa nhiệm mượt mà, thoải mái cài đặt, mở nhiều ứng dụng cùng lúc mà không lo hết tài nguyên trong máy.', 100, 0, 6690000, 2200000, 'LSP003'),
    ('SP013', 'Vsmart Joy 4 6GB-64GB', 'Màn hình của chiếc Vsmart này xuất sắc ở mọi phương diện, từ kiểu dáng cho đến độ phân giải. Bạn sẽ được tận hưởng mọi thứ trên một màn hình viền mỏng dạng “đục lỗ”, với camera trước nằm trong khu vực tấm kính màn hình, cho hình ảnh hiển thị lớn và ấn tượng hơn rất nhiều. Đặc biệt, chất lượng hiển thị của màn hình là hết sức tuyệt vời với kích thước 6,53 inch đi cùng độ phân giải Full HD+ 1080x2340 pixels vô cùng sắc nét. Mọi nội dung giải trí đều trở nên hấp dẫn hơn trên màn hình Vsmart Joy 4.', 100, 0, 3990000, 0, 'LSP003'),
    ('SP014', 'iPhone 13 Pro Max 128GB', 'Dù là giải trí khi xem phim, chơi game hay kiểm tra email, đọc tài liệu thì màn hình lớn tới 6,7 inch của iPhone 13 Pro Max cũng luôn cho trải nghiệm tuyệt vời nhất.</br>Không chỉ lớn, đây còn là màn hình chất lượng hàng đầu thế giới smartphone với tấm nền OLED tuyệt đẹp, công nghệ Super Retina XDR siêu nét và độ sáng tối đa đạt mức khó tin, lên tới 1200 nits cho nội dung HDR. Trước mắt bạn là một không gian giải trí mãn nhãn, một thiết bị di động lý tưởng để giải quyết nhanh công việc với màn hình thực sự xuất sắc.', 100, 0, 33990000, 1500000, 'LSP004'),
    ('SP015', 'iPhone 12 Pro 128GB', 'Nhờ viền màn hình mỏng hơn, iPhone 12 Pro đã có thể trang bị một màn hình lớn hơn, nhưng kích thước vẫn nhỏ gọn tương tự iPhone 11 Pro. Giờ đây bạn sẽ có màn hình lớn tới 6,1 inch, để trải nghiệm được nhiều hơn.</br>Ấn tượng hơn nữa, màn hình iPhone 12 Pro siêu sắc nét với công nghệ Super Retina XDR. Tấm nền OLED mang tới hình ảnh trong trẻo, màu sắc chính xác, độ tương phản lên tới 2.000.000:1, độ sáng tối đa 1200 nits. Các công nghệ khác như HDR hay True Tone khiến cho chất lượng hiển thị của iPhone 12 Pro thêm phần hoàn hảo.', 100, 0, 29999000, 4000000, 'LSP004'),
    ('SP016', 'iPhone 11 64GB', 'Có tới 6 sự lựa chọn màu sắc cho iPhone 11 64GB, bao gồm Tím, Vàng, Xanh lục, Đen, Trắng và Đỏ, tha hồ để bạn lựa chọn màu phù hợp với sở thích, cá tính riêng của bản thân. Vẻ đẹp của iPhone 11 đến từ thiết kế cao cấp khi được làm từ khung nhôm nguyên khối và mặt lưng liền lạc với một tấm kính duy nhất. Ở mặt trước, bạn sẽ được chiêm ngưỡng màn hình Liquid Retina lớn 6,1 inch, màu sắc vô cùng chân thực. Tất cả tạo nên chiếc điện thoại tràn đầy hứng khởi.', 100, 0, 16999000, 2000000, 'LSP004'),
    ('SP017', 'iPhone 12 Pro Max 256GB', 'iPhone 12 Pro Max sở hữu màn hình kích thước khó tin, lên tới 6,7 inch, cho bạn trải nghiệm hình ảnh cực đã. Chất lượng đến từ một màn hình công nghệ Super Retina XDR, tấm nền OLED cao cấp và độ phân giải siêu cao thực sự quá tuyệt vời.</br>Mọi thứ đều trở nên sống động trên iPhone 12 Pro Max, đặc biệt khi bạn xem ảnh, xem phim hay chơi game. Còn bất ngờ hơn khi dù màn hình lớn hơn, nhưng iPhone 12 Pro Max vẫn gọn gàng như thế hệ trước nhờ viền màn hình được tối ưu siêu mỏng đầy tinh tế.', 100, 0, 36999000, 6000000, 'LSP004'),
    ('SP018', 'iPhone 13 128GB', 'iPhone 13 là chiếc điện thoại toát lên sự đẳng cấp ngay từ cái nhìn đầu tiên nhờ thiết kế sang trọng với ngôn ngữ thiết kế phẳng và chất lượng hoàn thiện tuyệt vời.</br>Khung nhôm cao cấp kết hợp cùng kính bảo vệ Ceramic Shield siêu cứng tạo nên chiếc điện thoại vừa thời trang, lại vô cùng bền bỉ. Khả năng chống nước chuẩn IP68 giúp bạn hoàn toàn yên tâm trước mọi nguy cơ từ nước trong quá trình sử dụng thường ngày.', 100, 0, 24990000, 1500000, 'LSP004'),
    ('SP019', 'OPPO Find X3 Pro 5G', 'Khám phá màn hình smartphone sở hữu màu sắc phong phú và trung thực bậc nhất từ trước đến nay trên OPPO Find X3 Pro 5G. Bạn sẽ được tận hưởng mọi hình ảnh ở 1 tỷ màu sắc, độ sâu màu 10-bit, độ bao phủ màu 100% P3 cho màu sắc chính xác đáng kinh ngạc. Công nghệ độ sâu màu 10-bit chỉ dành cho những màn hình chuyên dụng và cao cấp đảm bảo độ chuyển màu hoàn hảo, từ tông màu da đến màu bầu trời. Cả thế giới ngoài đời thực được tái hiện ngập tràn màu sắc ngay trên tay bạn. Thậm chí với chuẩn HDR 10+, những nội dung khi bạn xem ở các ứng dụng hỗ trợ như Youtube, Netflix sẽ còn hấp dẫn và sống động hơn.', 100, 0, 26990000, 7000000, 'LSP005'),
    ('SP020', 'Oppo Reno6 5G', 'OPPO Reno6 5G nâng tầm khả năng quay video lên một tầm cao mới bằng những tính năng đầy nghệ thuật. Bạn có thể quay chân dung Bokeh Flare, làm mờ ánh đèn phông nền một cách lung linh huyền ảo, tạo hiệu ứng điện ảnh. Trí tuệ nhân tạo AI trên camera sẽ kết hợp tính năng Live HDR và Siêu video quay đêm để bạn lưu lại những khoảnh khắc ấn tượng lúc bình minh hay hoàng hôn. Ngoài ra bạn còn có thể quay video làm đẹp chân dung tôn vinh vẻ đẹp thần thái; chế độ chân dung màu AI nổi bật; quay video khóa nét chủ thể để hình ảnh luôn sắc nét dù có chuyển động nhanh trong khung hình.', 100, 0, 12990000, 0, 'LSP005'),
    ('SP021', 'OPPO A95 8GB-128GB', 'OPPO A95 có vẻ đẹp hiện đại và thời thượng với công nghệ Glow độc quyền nhà OPPO. Tổng thể thiết kế mềm mại, gọn nhẹ tạo cảm giác sang trọng, cao cấp ngay ánh nhìn đầu tiên.', 100, 0, 6990000, 0, 'LSP005'),
    ('SP022', 'OPPO A94 8GB-128GB', 'Với 4 camera sau, trong đó camera chính độ phân giải lên tới 48MP, OPPO A94 là phương tiện hoàn hảo để ghi lại những khoảnh khắc đáng nhớ trong cuộc sống. Từ chụp ảnh siêu cận macro cho đến chụp góc siêu rộng hay thu phóng từ xa, OPPO A94 đều thể hiện xuất sắc, mang đến những bức ảnh sắc nét đến từng chi tiết.', 100, 0, 7690000, 1100000, 'LSP005'),
    ('SP023', 'OPPO A16k 3GB-32GB', 'OPPO A16k được chế tác hướng tới những giá trị phục vụ người dùng hiệu quả nhất. Phần thân máy được làm mỏng, nhẹ với mặt lưng cấu tạo theo phong cách 3D đem đến cảm giác dễ chịu trong lòng bàn tay. Cấu trúc thẩm mỹ tinh tế, độ hoàn thiện tốt cùng cách sử dụng sắc màu thông minh giúp OPPO A16k khoác lên mình diện mạo vượt trội so với các đối thủ cùng phân khúc.', 100, 0, 3690000, 0, 'LSP005'),
    ('SP024', 'Vivo V23e 8GB - 128GB', 'vivo V23e khoác lên mình thân máy siêu mỏng với độ dày chỉ 7.36mm. Sản phẩm được thiết kế theo phong cách tối giản nhưng không kém phần tinh tế. Nhà sản xuất cho thấy sự thấu hiểu người dùng khi tối ưu kích cỡ thân máy chỉ còn 172 gram, đồng thời phủ một lớp chất liệu siêu mịn nhằm đem đến bề mặt nhám cho các cạnh bao quanh, không chỉ giúp cho trải nghiệm cầm nắm thoải mái hơn, mà còn tối ưu tính thẩm mỹ và gia tăng độ hoàn thiện tổng thể.', 100, 0, 8490000, 500000, 'LSP006'),
    ('SP025', 'Vivo Y21s 4GB+1GB - 128GB', 'vivo Y21s vẫn đi theo ngôn ngữ thiết kế đã làm nên tên tuổi của hãng, đó là đề cao sự mỏng nhẹ. Với độ mỏng chỉ 8.0mm và thiết kế khung viền 2,5D mềm mại nhưng không kém phần hiện đại, vivo Y21s vừa mang lại cảm giác cao cấp, vừa cầm nắm thoải mái trên tay. Phiên bản màu Xanh huyền bí sử dụng công nghệ nhám mờ AG cho mặt lưng nhám tinh xảo, sắc xanh phản chiếu một cách tinh tế, lịch lãm. Trong khi đó phiên bản Trắng ngọc trai được tạo thành từ lớp phủ nano kết hợp với lớp phủ phản quang mới, tạo nên màu sắc tỏa sáng như ngọc trai lấp lánh, sang trọng quyến rũ.', 100, 0, 5290000, 300000, 'LSP006'),
    ('SP026', 'Vivo Y21 4GB+1GB - 64GB', 'Vivo Y21 vô cùng mỏng nhẹ với độ mỏng chỉ 8.0mm và trọng lượng 182 gram, dễ dàng thao tác và sử dụng bằng một tay. Máy có thiết kế tuyệt đẹp với ngôn ngữ thiết kế phẳng cùng mặt lưng tỏa sáng theo phong cách riêng biệt. Phiên bản Xanh ánh kim là sự kết hợp giữa lớp phủ bạc cải tiến và lớp tráng phủ, cho màu xanh lấp lánh theo vũ điệu của ánh sáng. Trong khi đó phiên bản Trắng kim cương sử dụng công nghệ Lazer đánh bóng mặt lưng với độ chính xác cao để tạo ra những họa tiết kim cương sang trọng.', 100, 0, 4290000, 0, 'LSP006'),
    ('SP027', 'Vivo Y15s 3GB - 32GB', 'Hãy giải trí và làm việc, sống với đam mê của bạn mà không bị nỗi lo hết pin làm gián đoạn. vivo Y15s là chiếc điện thoại pin trâu được trang bị viên pin dung lượng lên tới 5000mAh, cho phép bạn xem phim HD trong khoảng 18 giờ hoặc chơi game liên tục trong khoảng gần 8 giờ đồng hồ chỉ sau một lần sạc. Những trải nghiệm hấp dẫn và xuyên suốt giúp bạn tận hưởng cuộc sống một cách đúng chất. Hơn nữa, dung lượng pin cực khủng còn có thể biến vivo Y15s thành một củ sạc dự phòng cho các thiết bị khác.', 100, 0, 3690000, 0, 'LSP006'),
    ('SP028', 'Vivo Y53s 8GB+3GB - 128GB', 'Kế thừa kiểu dáng của những chiếc điện thoại vivo cao cấp, vivo Y53s mang trên mình vẻ đẹp hiện đại với mặt lưng bóng bẩy, hoàn thiện tinh tế. Dù là phiên bản màu Xanh biển sâu hay Xanh đa sắc, bạn cũng đều cảm nhận được sự đẳng cấp và tỉ mỉ trong thiết kế của vivo Y53s. Cụm camera cũng được thiết kế rất độc đáo với hình chữ nhật thuôn dài, vừa tạo điểm nhấn lại vừa gọn gàng, dễ nhìn.', 100, 0, 6990000, 700000, 'LSP006'),
    ('SP029', 'Realme C21y 3GB - 32GB', 'Chiếc Realme C21Y với viên pin dung lượng lên tới 5000mAh sẽ không làm gián đoạn trải nghiệm của bạn khi có thể sử dụng trọn vẹn một ngày mà không lo hết pin. Ngay cả khi pin yếu, chế độ siêu tiết kiệm pin cũng sẽ kéo dài thời gian sử dụng lên đáng kể, đủ cho bạn liên lạc và vào các ứng dụng cần thiết. Hãy tự do khám phá và không để nỗi lo hết pin làm phiền bạn.', 100, 0, 3690000, 300000, 'LSP007'),
    ('SP030', 'Realme C25y 4GB-128GB', '', 100, 0, 4990000, 0, 'LSP007'),
    ('SP031', 'Realme Narzo 30A 4GB - 64GB', 'So với các đối thủ cùng tầm giá, realme narzo 30A có sức mạnh vượt trội khi trang bị bộ vi xử lý Helio G85 với 8 nhân sản xuất trên tiến trình 12nm, tốc độ tối đa 2.0GHz và GPU Mali-G52 chuyên game. Bên cạnh việc chạy tốt các ứng dụng thông thường như đọc báo, xem phim, mạng xã hội, chiếc realme này còn mang tới niềm vui cho các game thủ mobile. Thoải mái thể hiện kỹ năng của mình trong các tựa game yêu thích một cách mượt mà.', 100, 0, 3990000, 200000, 'LSP007'),
    ('SP032', 'Realme C11 2021 2GB - 32GB', 'Là chiếc điện thoại pin trâu với viên pin dung lượng lên tới 5000mAh, bạn có thể tự do trải nghiệm trên realme C11 2021 mà quên đi nỗi lo hết pin. Điện thoại có thể chơi game trong 12,1 giờ hoặc xem phim trong 21,6 giờ. Thậm chí khi cần realme C11 2021 hoàn toàn có thể sạc ngược cho các thiết bị khác, đóng vai trò sạc dự phòng đầy tiện lợi.', 100, 0, 2990000, 0, 'LSP007'),
    ('SP033', 'Realme 8 Pro 8GB - 128GB', 'Realme 8 Pro lấy cảm hứng từ vũ trụ huyền bí, phiên bản màu đen mô phỏng bầu trời đêm huyền ảo với những vì tinh tú lấp lánh. Khẩu hiệu dám bứt phá “Dare to leap” được in lớn phá cách trên mặt lưng, thể hiện cá tính nổi bật. Dù có vẻ ngoài đơn giản nhưng trên thực tế realme 8 Pro được hoàn thiện từ quy trình chống lóa pha lê hoàn toàn mới, tạo nên thiết kế cuốn hút, đầy chiều sâu. Độ mỏng nhẹ ấn tượng và cảm giác mềm mại khi chạm vào giúp điện thoại hoàn hảo trong lòng bàn tay.', 100, 0, 8690000, 1200000, 'LSP007'),
	('SP034', 'Nokia 105 SS (2019)', 'Nokia 105 SS (2019) là phiên bản một SIM của phiên bản mới Nokia 105 2019. Bạn vẫn sẽ có chiếc điện thoại nhỏ gọn, bền bỉ, thời lượng pin siêu dài và khả năng đàm thoại ấn tượng. <br/>Thời lượng pin luôn là ưu điểm của dòng Nokia 105, cho phép bạn thoải mái gọi điện từ sáng sớm đến tối mịt mà không lo hết bin. Chiếc điện thoại nhỏ con này có thời gian chờ lên tới gần 26 ngày và thời gian gọi thoại hơn 14 tiếng liên tục.', 100, 0, 410000, 50000, 'LSP008'),
    ('SP035', 'Nokia 105 DS 4G', 'Nokia DS 4G hoàn toàn mới với thiết kế hiện đại, độ bền đáng tin cậy và thời lượng pin siêu dài vốn đã thành thương hiệu của Nokia, giờ đây lại được bổ sung thêm kết nối mạng 4G LTE, giúp việc giữ liên lạc hay vào mạng trở nên dễ dàng hơn bao giờ hết. <br/>Là một chiếc điện thoại phổ thông nhỏ gọn nhưng Nokia 105 4G vẫn sở hữu kết nối 4G thời thượng, cho bạn khả năng kết nối vượt trội mọi lúc mọi nơi. Bạn có thể gọi điện cho bạn bè, người thân qua dịch vụ thoại chất lượng cao VoLTE, cho chất lượng âm thanh lớn và rõ ràng.', 100, 0, 750000, 50000, 'LSP008'),
    ('SP036', 'Nokia 150 DS (2020)', 'Chiếc điện thoại với 2 SIM, sử dụng dễ dàng nhờ bàn phím T9 quen thuộc và màn hình 2,4 inch, ngoài ra Nokia 150 DS 2020 còn mang đến cho người dùng thời lượng bin xuất sắc cùng độ bền đáng tin cậy. <br />Phục vụ hai nhu cầu cơ bản của một chiếc điện thoại là đàm thoại và nhắn tin, Nokia 150 được xây dựng để sử dụng dễ dàng hơn bao giờ hết. Bạn có thể gọi điện và nhắn tin một cách đơn giản khi máy có kiểu dáng thon dài vừa vặn, màn hình lớn 2,4 inch cùng bàn phím lớn, thao tác nhanh chóng.', 100, 0, 700000, 50000, 'LSP008'),
    ('SP037', 'Nokia 110 DS 4G', 'Đây là một chiếc điện thoại phổ thông nhưng vẫn có thiết kế nổi bật, Nokia 110 DS 4G thổi một luồng gió mới cho dòng điện thoại cơ bản. Bất ngờ hơn nữa, chiếc điện thoại siêu nhỏ gọn, pin "trâu" của bạn còn có thể kết nối 4G, vào mạng Internet tốc độ cao mọi lúc mọi nơi. <br />Bạn sẽ được trải nghiệm dịch vụ thoại chất lượng cao VoLTE, nâng cao chất lượng cuộc gọi, cho âm thanh rõ ràng hơn bao giờ hết. Bên cạnh đó, kết nối 4G tất nhiên sẽ giúp bạn vào mạng internet siêu tốc, đọc báo, truy cập thông tin một cách dễ dàng.', 100, 0, 850000, 50000, 'LSP008'),
    ('SP038', 'Nokia 5.4 4GB - 128GB', 'Thiết kế phong cách, hệ thống camera chuyên nghiệp, sức mạnh hiệu năng dẫn đầu phân khúc chính là những điều hấp dẫn đang chờ đón bạn trên Nokia 5.4. <br/>Với 4 camera sau 48MP đẳng cấp, Nokia 5.4 có thể dễ dàng ghi lại mọi vẻ đẹp cuộc sống bằng những bức ảnh sắc nét, sống động nhất. Bên cạnh đó bạn còn có các công cụ chỉnh hình một cách chuyên nghiệp ngay trên điện thoại trước khi lưu giữ hoặc chia sẻ trên mạng xã hội.', 100, 0, 3490000, 100000, 'LSP008'),
    ('SP039', 'Samsung Galaxy Tab S6 Lite', 'Samsung Galaxy Tab S6 Lite với sự nhỏ gọn cơ động, phần cứng mạnh mẽ và trên hết là việt đi kèm bút S Pen thế hệ mới thông minh, sẽ là chiếc máy tính bảng vô cùng hữu ích dành cho bạn trong cả công việc lẫn giải trí. <br/>Samsung Galaxy Tab S6 Lite sở hữu một thiết kế hiện đại, với viền màn hình siêu mỏng, màn hình lớn tới 10,4 inch sẽ là chiếc máy tính bảng cực kỳ di động, luôn đồng hành bên bạn. Toàn thân máy đều được làm từ kim loại cao cấp, độ mỏng chỉ 7mm và ngôn ngữ thiết kế phẳng thời thượng, tọa nên sự đẳng cấp mỗi khi bạn sử dụng.', 200, 0, 9490000, 500000, 'LSP009'),
    ('SP040', 'Samsung Galaxy Tab A7 Lite', 'Với thiết kế siêu mỏng, tính năng giải trí hấp dẫn và hiệu năng vượt trội, Samsung Galaxy Tab A7 Lite sẽ là người bạn đồng hành đầy phong cách dành cho cuộc sống của bạn. Tha hồi học hỏi, khám phá, kết nối trong niềm cảm hứng của công nghệ. <br/>Chiếc máy tính bảng này có độ mỏng vỏn vẹn 8mm, hoàn thiện theo ngôn ngữ thiết kế phẳng, tinh xảo đến từng chi tiết, nhỏ gọn, dễ dàng để bạn mang đi bất cứ đâu và thậm chí còn có thể sử dụng bằng một tay.', 200, 3, 4390000, 100000, 'LSP009'),
    ('SP041', 'Samsung Galaxy Tab S7 FE', 'Galaxy Tab S7 FE sở hữu thiết kế nguyên khối đơn giản nhưng đầy tinh tế với kiểu dáng siêu mỏng, cụm camera được làm gọn gàng ở mặt sau. Màn hình viền mỏng đều cả 4 cạnh không chỉ nâng cao trải nghiệm xem, mà còn góp phần giúp máy tính bảng nhỏ gọn hơn. <br/>Với màn hình lớn tới 12,4 inch của máy tính bản này giúp hình ảnh chi tiết sống động hơn.', 200, 15, 13490000, 500000, 'LSP009'),
    ('SP042', 'Samsung Galaxy Tab S7 FE WiFi', 'Cùng tận hưởng màu sắc rực rỡ trên màn hình lớn tới 12,4 inch của Galaxy Tab S7 FE WiFi. Độ phân giải 2K cực nét, các chi tiết hiển thị sống động giúp mọi hình ảnh, đoạn phim xem trên máy tính bảng đều có chất lượng điện ảnh. <br/>Để không gian giải trí thêm phần hấp dẫn, cụm loa kép Dolby Atmos được tinh chỉnh bởi AKG sẽ mang đến âm thanh vòm chân thực.', 200, 1, 11990000, 1000000, 'LSP009'),
    ('SP043', 'Lenovo Tab M8-Gen 2', 'Lenovo Tab M8-Gen 2 là chiếc máy tính bảng đa dụng dành cho những ai muốn có được trải nghiệm thông minh trên màn hình lớn với mức chi phí hợp lý. Sản phẩm có không gian hiển thị rộng 8inch dộ phân giải 1280 x 800 pixels và sử dụng công nghệ âm thanh Dolby Audio. Thời lượng pin lên đến 18 giờ cho phép bạn sử dụng suốt cả ngày.', 200, 0, 3490000, 300000, 'LSP010'),
    ('SP044', 'Lenovo Tab P11 Pro WiFi 4G 128GB', 'Không chỉ đẹp đơn thuần, màn hình Lenovo Tab P11 Pro còn mang đến những điều kỳ diệu. Chắc chắn bạn sẽ vô cùng bất ngờ khi nhìn ngắm những nội dung tuyệt đẹp trên màn hình lớn 11.5inch tấm nền OLED cao cấp, độ phân giải 2560 x 1600 pixels siêu sắc nét. Mọi thứ đều hiển thị chân thực một cách đáng kinh ngạc. <br/>Với độ sắc nét hoàn hảo, bảng màu sống động của công nghệ Dolby Vision, màu đen sâu thẳm và độ sáng cực cao, màn hình Lenovo Tab P11 Pro đẹp đến mức bạn ngắm mãi không biết chán. Màn hình này cũng được chứng nhận bảo vệ mắt của TUV, giúp người dùng không bị mỏi mắt dù sử dụng thời gian dài.', 200, 0, 14590000, 3000000, 'LSP010'),
    ('SP045', 'Lenovo Tab M10 32GB (Gen 2)', 'Là sản phẩm hướng tới đối tượng người dùng gia đình và trẻ nhỏ, Lenovo Tab M10 được trang bị khung vỏ kim loại chắc chắn với kỹ nghệ hoàn thiện tốt, đảm bảo độ bền bỉ chắc chắn trong quá trình trẻ sử dụng thiết bị. Nhờ cách thiết kế thông minh và bố trí hợp lý, tỉ lệ màn hình trên thân máy lên tới 85%, giúp tối ưu trải nghiệm khi quan sát hình ảnh.', 200, 0, 5190000, 500000, 'LSP010'),
    ('SP046', 'iPad Pro 12.9 2021 M1 Wi-Fi 128GB', 'iPad Pro M1 12.9 2021 với màn hình lớn 12.9 inch công nghệ Liquid Retina XDR, sức mạnh tương đương máy tính để bàn nhờ bộ vi xử lý Apple M1 và cổng kết nối Thunderbolt sẽ mang đên scho bạn hiệu năng không tưởng ở một thiết bị di động. <br/>Độ sáng màn hình cũng được nâng lên 1000 nits và độ sáng tối đa lên tới 1600 nits, luôn sáng rõ dù bạn sử dụng iPad dưới trời nắng gắt.', 200, 2, 30999000, 1000000, 'LSP011'),
    ('SP047', 'iPad Pro 12.9 2021 M1 Wi-Fi 5G 128GB', 'Với bộ vi xử lý M1, iPad Pro 2021 12.9 chính là chiếc máy tính bảng nhanh nhất từ trước đến nay. Sức mạnh từ 8 nhân CPU và 8 nhân GPU của Apple M1 giúp iPad Pro 2021 12.9 nhanh hơn tới 50%, đồng thời xử lý đồ họa tốt hơn 40% so với thế hệ trước. Giờ đây bạn có thể dựng các mô hình AR phức tạp, hay chơi game đồ họa cao với tay cầm Xbox hay PlayStation.', 200, 3, 34999000, 1000000, 'LSP011'),
    ('SP048', 'iPad Pro 11 2021 M1 Wi-Fi 1 TB', 'Dành cho những người thực sự chuyên nghiệp, iPad Pro 11 inch 2021 M1 phiên bản bộ nhớ tối đa lên đến 2TB cho khả năng lưu trữ gần như vô hạn. Bên cạnh đó là sức mạnh của bộ vi xử lý Apple M1 và hệ thống camera cao cấp đang chờ đón bạn. Vì bộ nhớ lớn nên bạn có thể tha hồ chỉnh sửa, video, âm nhạc, lưu lại mọi bản thu bạn muốn mà không lo đầy bộ nhớ.', 200, 4, 42999000, 1000000, 'LSP011'),
    ('SP049', 'iPad 10.2 2021 Wi-Fi 256GB', 'iPad Gen 9 10.2 2021 mang trên mình bộ vi xử lý Apple A13 Bionic cực mạnh, giúp tất cả đều diễn ra một cách mượt mà và nhanh chóng. Từ duyệt web, xem phim cho đến chơi game hay thậm chí là chạy nhiều ứng dụng cùng lúc, iPad đều hoàn thành xuất sắc. GPU mạnh hơn 20%, cho hiệu xuất đồ họa hoàn hảo, mang tới khả năng chỉnh sửa ảnh, video hay chơi game đỉnh cao.', 200, 4, 13990000, 1000000, 'LSP011'),
    ('SP050', 'iPad 10.2 2021 Wi-Fi + Cellular 64GB', 'iPad Gen 9 10.2 2021 4G LTE tập hợp đầy đủ những điều đã làm yêu thích dòng iPad từ trước đến nay. Bạn có thể làm việc, giải trí, sáng tạo, học tập và kết nối theo cách hiệu quả, thoải mái nhất trên iPad 10.2 mới 2021. <br/>Một màn hình lớn tới 10.2 inch sẵn sàng truyền tải nội dung theo cách ấn tượng nhất. Chất lượng Retina sắc nét, độ chi tiết đáng kinh ngạc, màu sắc sống động và công nghệ True Tone điều chỉnh màn hình theo nhiệt độ của môi trường giúp hình ảnh luôn vô cùng hấp dẫn.', 200, 0, 13990000, 500000, 'LSP011'),
    ('SP051', 'Xiaomi Pad 5 256GB', 'Xiamoni Pad 5 là chiếc máy tính bảng hoàn hảo mà ai cũng muốn sở hữu. Thiết kế mỏng nhẹ thời trang, cấu hình cao cấp hàng đầu, màn hình lớn 11 inch WQHD+ sắc nét, tần số quét 120Hz siêu mượt đi cùng pin dung lượng lên tới 8720mAh, Xiaomi Pad 5 thật sự toàn diện, không có bất cứ điểm gì để chê. <br/>Xiaomi Pad 5 sở hữu màn hình chất lượng hàn đầu trong thế giới máy tính bảng hiện nay. Màn hình kích thước lớn hơn 11 inch, độ phân giải siêu cao WQHD+, hỗ trợ DCI-P3 và hơn 1 tỷ màu sắc, giúp trải nghiệm khi xem phim hay chơi game trở nên hấp dẫn hơn.', 200, 5, 10390000, 100000, 'LSP012'),
    ('SP052', 'Asus VivoBook X515EA-BR1409T/i5-1135G7', 'Asus VivoBook X515EA sở hữu kiểu dáng thanh lịch với các đường nét vuông vắn khỏe khắn, viền màn hình siêu mỏng cho vẻ đẹp hiện đại, tối giản. Hơn nữa, phiên bản VivoBook X515EA BR1409T được sơn màu xám bạc năng động, mạnh mẽ kết hợp cùng khu vực bàn phím màu đen mang đến một thiết kế không bị lỗi thời. VivoBook 15 X215 cũng là một chiếc laptop tương đối nhỏ gọn với trọng lượng chỉ 1,8 kg cùng độ mỏng 19,9 mm dễ dàng đồng hành cùng bạn đi bất cứ đâu.', 300, 10, 16799000, 800000, 'LSP013'),
    ('SP053', 'Asus Vivobook X515EP-BQ189T/i5-1135G7', 'Hiện nay, tính di động và màn hình lớn là 3 tính năng nổi bật nhất trên Asus VivoBook X515EP BQ189T. Với bộ vi xử lý Intel Core i5 thế hệ thứ 11 và cả card đồ họa rời NVIDIA MX330 mạnh mẽ, VivoBook X515EP BQ189T sẽ cùng bạn chinh phục mọi mục tiêu trong công việc.', 300, 5, 18199000, 800000, 'LSP013'),
    ('SP054', 'Asus Vivobook M513UA-L1230T/R5-5500U', 'Asus VivoBook M513 là dòng laptop phổ thông đầu tiên trên thị trường trang bị màn hình OLED cao cấp, cho bạn trải nghiệm hình ảnh sống động hơn bao giờ hết. Bên cạnh đó, sức mạnh của bộ vi xử lý Ryzen 5000 series cũng sẽ giúp bạn làm việc hiệu quả với năng xuất cao nhất.', 300, 4, 18199000, 800000, 'LSP013'),
    ('SP055', 'Asus Vivobook A515EA-L11970T/i5-1135G7', 'Dù là xem phim giải trí hay chỉnh sửa ảnh, làm đồ họa chuyên nghiệp, màn hình OLED của ASUS VivoBook A515 cũng tỏ ra thực sự khác biệt so với phần còn lại. Với gam màu chuẩn 133% sRGB, 100% DCI-P3 đẳng cấp rạp chiếu phim, màu sắc trên màn hình VivoBook A515 được tái tạo phong phú và sống động vượt trội. Thậm chí độ chính xác màu của màn hình OLED vẫn được đảm bảo ngay cả ở độ sáng thấp, điều bạn không thể có được trên màn hình LCD thông thường.', 300, 4, 19199000, 800000, 'LSP013'),
    ('SP056', 'Asus Flip BR11100FKA-BP0531T/N4500', 'Chỉ với chưa đến 10 triệu đồng, bạn đã có một chiếc laptop đa năng có thể xoay gập, laptop có màn hình cảm ứng linh hoạt, thích hợp cho học tập online. ASUS Flip BR1100FKA-BP0531T chắc chắn sẽ được các bé và phụ huynh yêu thích nhờ loạt tính năng chuyên dụng cho công việc giáo dục cũng như giải trí.', 400, 10, 9299000, 700000, 'LSP013'),
	('SP057', 'Laptop Acer Travel Mate B3 TMB311-31-P49D Pentium N5030', 'Với màn hình 11.6 inch, HD mang đến hình ảnh rõ nét, sống động, Hiệu năng ổn định giúp xử lý tốt các tác vụ cơ bản hàng ngày,RAM 4GB DDR4 giúp laptop đa nhiệm ổn đinh, hạn chế giật lag,Ổ cứng SSD giúp khởi động máy, mở ứng dụng nhanh hơn, Laptop gọn nhẹ khoảng 1.4 kg, dễ dàng mang theo sử dụng',  99,  0,  10999000,  9999000, 'LSP014'),
    ('SP058', 'Laptop Acer Nitro 5 Gaming AN515-57-74NU i7', 'Thoải sức chiến game, thiết kế đồ hoạ nhờ Chip Intel Core i7-11800H, RAM 8GB DDR4 đa nhiệm mượt mà, mở được nhiều ứng dụng cùng lúc, Ổ cứng SSD 512GB giúp khởi động máy nhanh, lưu trữ nhiều dữ liệu, Card đồ họa rời NVIDIA GeForce RTX3050Ti 4 GB xử lý đồ họa mượt mà, Màn hình 15.6'' FHD mang đến hình ảnh sắc nét, màu sắc sống động, Trải nghiệm âm thanh to rõ, sống động với công nghệ Acer TrueHarmony',  100,  0,  29990000, 28790000, 'LSP014'),
    ('SP059', 'Acer Aspire 3 i3-1005G1 15.6 inch A315-56-37DV', 'CPU i3-1005G1 xử lý tác vụ cơ bản nhanh chóng, Màn hình FHD 15.6 inch cho hình ảnh chân thật, Intel UHD Graphics, đảm bảo chất lượng đồ họa, Hỗ trợ nhiều cổng kết nối, việc chia sẻ trở nên dễ hơn, Thiết kế gọn nhẹ, dễ dàng mang theo sử dụng',  90,  2, 11990000,  0, 'LSP014'),
    ('SP060', 'Laptop Acer Aspire 3 A315-57G-524Z i5-1035G1 NX.HZRSV.009', 'Card đồ họa rời NVIDIA GeForce MX330 mạnh mẽ xử lý tốt tác vụ đồ họa, Màn hình 15.6 inch Full HD hiển thị hình ảnh sắc nét, màu sắc chân thực, Bộ vi xử lý i5-1035G1, 8GB RAM cho hiệu năng ổn định, xử lý tác vụ mượt mà, Ổ cứng SSD 512GB giúp mở máy nhanh hơn và không gian lưu trữ thoải mái, Acer Apsire 3 có thời lượng pin lên đến 9 tiếng, đáp ứng tốt nhu cầu làm việc, Laptop trang bị các cổng kết nối thông dụng: USB 2.0, USB 3.2 Gen 1, HDMI,..',  100,  3,  16999000,  16490000, 'LSP014'),
    ('SP061', 'Laptop Lenovo IdeaPad 5 14ITL05 i5-1135G7 14 inch 82FE00JKVN', 'Lenovo Ideapad 5 14ITL05 có trọng lượng 1.4 kg, dễ mang theo sử dụng, Bộ vi xử lý i5-1135G7, 8GB RAM cho hiệu năng mạnh mẽ, đa nhiệm tốt, Ổ cứng SSD 512GB cho tốc độ phản hồi, mở máy, mở ứng dụng nhanh, Màn hình Full HD 14 inch hiển thị hình ảnh sắc nét, màu sắc chân thực Tận hưởng âm thanh sống động với công nghệ Realtek High Definition Audio',  89,  2,  18990000, 18490000, 'LSP015'),
    ('SP062', 'Laptop Lenovo ThinkPad T15p Gen 2', 'Được thiết kế để truy cập nhanh, An toàn và bảo mật cao, nếu hệ thống bị hỏng BIOS tự phục hồi sẽ khôi phục nó về trạng thái an toàn trước đó, oa kép cho âm thanh rõ ràng, chính xác cùng với camera cung cấp khả năng phát lại hoàn hảo',  50,  0,  30999000, 0, 'LSP015'),
    ('SP063', 'Laptop Lenovo IdeaPad Gaming 3i', 'Máy tính xách tay chơi game 15,6" mạnh mẽ, Bộ xử lý Intel® Core ™ sẵn sàng cho trò chơi, Hình ảnh sống động, không bị rách',  100,  0,  24890000, 0, 'LSP015'),
    ('SP064', 'Laptop Lenovo Legion 7 16ACHG6', 'Máy tính xách tay mỏng, nhẹ 14 inch với pin lên đến 20 giờ, Các tùy chọn hiển thị tuyệt vời bao gồm Dolby Vision ®, Bảo mật mã hóa và quyền riêng tư mạnh mẽ',  89,  0, 51999000, 50999000, 'LSP015'),
    ('SP065', 'Laptop MacBook Air M1 2020 13 inch 256GB ', 'Thiết kế đẹp, sang trọng, gọn nhẹ dễ dàng mang theo sử dụng, Bộ vi xử lý Apple M1 8-core cho hiệu năng mạnh mẽ, mượt mà, Màn hình Retina 13 inch hiển thị hình ảnh sắc nét chân thực, Thời lượng pin vượt trội, lướt web liên tục 15 giờ, xem video 18 giờ, GPU tích hợp mạnh mẽ, xử lý mượt mà các phần mềm đồ họa, Touch ID thay thế thao tác nhập mật khẩu chỉ bằng một cú chạm',  80,  0,  27990000, 0, 'LSP016'),
    ('SP066', 'Laptop Apple MacBook Pro M1 2020 13 inch 512GB', 'Thiết kế đẹp, gọn nhẹ, đẳng cấp dễ dàng mang theo sử dụng, Bộ vi xử lý Apple M1 8-Core cho hiệu năng mạnh mẽ, mượt mà, Màn hình Retina 13 inch hiển thị hình ảnh sắc nét chân thực, GPU tích hợp mạnh mẽ, xử lý mượt mà nhanh chóng tác vụ đồ họa, Thời lượng pin vượt trội, xem video liên tục 20 giờ, lướt web 17 giờ, Touch ID thay thế thao tác nhập mật khẩu chỉ bằng một cú chạm, Quạt tản nhiệt tiên tiến giúp làm mát nhanh, hoạt động êm á',  100,  0,  39990000, 38990000, 'LSP016'),
    ('SP067', 'Laptop MacBook Air', 'Chiếc MacBook Air có hiệu năng đột phá nhất từ trước đến nay đã xuất hiện. Bộ vi xử lý Apple M1 hoàn toàn mới đưa sức mạnh của MacBook Air M1 13 inch vượt xa khỏi mong đợi người dùng, có thể chạy được những tác vụ nặng và thời lượng pin đáng kinh ngạc.',  100,  0, 28999000, 0, 'LSP016'),
    ('SP068', 'Laptop Dell Inspiron N3505 R5 3450U/8GB/256GB', 'Dell Inspiron N3505 phiên bản màn hình cảm ứng phù hợp cho những ai thích tương tác trực tiếp vào màn hình, trang bị bộ vi xử lý AMD Ryzen 5 tích hợp GPU Radeon Vega 8 đầy mạnh mẽ.',  90, 0, 17999000, 0, 'LSP017'),
    ('SP069', 'Laptop Dell Gaming G5 5500 i7', 'Dell Gaming G5 15 5500 xứng đáng là vũ khí gaming lợi hại bậc nhất khi trang bị card đồ họa rời RTX 2070 đỉnh cao, bộ vi xử lý Intel Core i7 thế hệ thứ 10 mạnh mẽ, cho bạn tự tin tham gia mọi trận chiến ở bất cứ đâu.',  50,  0,  37999000,  0, 'LSP017'),
    ('SP070', 'Laptop Dell Inspiron N3502 Pentium', 'Kiểu dáng đơn giản hiện đại, Màn hình hiển thị lớn, tối ưu cho công việc và giải trí, Bộ vi xử lý 4 nhân 4 luồng hiệu năng tốt, Ổ cứng thể rắn SSD M2 tốc độ cao, Pin đủ cho một ngày làm việc, Đầy đủ cổng kết nối, Loạt tính năng tiện ích ',  89,  0,  11699000, 0, 'LSP017'),
    ('SP071', 'Laptop HP Pavilion Gaming 15 dk1074TX i7', 'Mạnh mẽ hàng đầu với bộ vi xử lý Intel Core i7 thế hệ thứ 10, Card rời GTX 1650, trải nghiệm đồ họa kiến trúc Turing, Tải game nhanh hơn bằng ổ cứng 512GB PCIe NVMe M.2 SSD,Kết nối nhanh chóng, Chơi game mọi lúc mọi nơi, Đắm chìm trong thế giới trò chơi của riêng bạn, ', 90, 0, 27499000, 26124000, 'LSP018'),
    ('SP072', 'HP Envy x360 13 ay0069AU R7 ', 'HP Envy x360 13 ay0069AU là chiếc laptop 2-in-1 xuất sắc bậc nhất hiện nay khi không chỉ linh hoạt với màn hình cảm ứng và khả năng xoay 360 độ mà máy còn trang bị cấu hình mạnh mẽ đáng kinh ngạc.', 99, 0, 27199000, 0, 'LSP018'),
    ('SP073', 'Laptop HP Gaming OMEN 16', 'HP Gaming OMEN 16 b0142TX mang đến trải nghiệm chơi game đầy đủ với màn hình lớn 16,1 inch 144Hz, bộ vi xử lý Intel thế hệ thứ 11 H-Series đi cùng card đồ họa RTX 3050 Ti mạnh mẽ, kèm theo giải pháp tản nhiệt OMEN Tempest, tính năng tối ưu hóa OMEN Gaming Hub và rất nhiều tính năng hấp dẫn khác dành riêng cho game thủ.',  100, 0, 39999000, 0, 'LSP018'),
    ('SP074', 'Pin sạc dự phòng PowerGo Smart Ai 10000mAh Innostyle', 'Với thiết kế nhỏ gọn như một smartphone, hỗ trợ hai cổng nguồn ra USB-A và ghi nhận dung lượng pin lên tới 10.000 mAh, sản phẩm pin sạc dự phòng PowerGo Smart AI Innostyle sẽ hỗ trợ rất nhiều cho bạn trong quá trình sử dụng điện thoại, đặc biệt là cho những chuyến đi xa và cần duy trì nguồn năng lượng cho nhiều thiết bị thông minh.', 89, 0, 599000, 299000, 'LSP019'),
    ('SP075', 'Sạc dự phòng Không dây 10,000mAh Xiaomi Mi Essential ', 'Nếu bạn đang kiếm tìm một bộ pin sạc dự phòng đến từ thương hiệu uy tín, có dung lượng 10.000 mAh và đảm bảo an toàn tuyệt đối thì đừng bỏ qua Mi Wireless Power Bank Essential. Công suất sạc không dây 10W và công suất sạc 18W qua cổng USB-A biến sản phẩm này thành công cụ sạc linh hoạt, đa năng, rất phù hợp cho những chuyến đi xa.', 100, 0, 699000, 490000, 'LSP019'),
    ('SP076', 'Pin sạc dự phòng Li-Polymer 10000mAh VEGER L10 PD&QC3.0 ', '', 100, 1, 799000, 0, 'LSP019'),
	('SP077', 'Ổ cứng WD SSD 120GB, 2.5" SATA III Xanh (WDS120G2G0A)', ' ',100,3,890000,0, 'LSP020'),
	('SP078', 'Ổ cứng trong WD SSD 480GB Sata III M.2-2280 Xanh (WDS480G2G0B)', '',150,20,1630000,0, 'LSP020'),
	('SP079', 'Usb 3.0 OTG Type-C 32G Sandisk', 'USB 3.0 OTG Type-C 32G Sandisk sở hữu một thiết kế độc đáo với cổng kết nối 2 đầu, kích thước nhỏ gọn, ngoại hình bắt mắt, màu sắc sang trọng, khả năng lưu trữ lớn và nhiều tính năng vượt trội khác. Sản phẩm là sự lựa chọn hoàn hảo cho nhiều người dùng.',300,100,320000,64000, 'LSP020'),
	('SP080', 'USB 3.0 32GB Sandisk', 'USB 32GB Sandisk là thiết bị hỗ trợ lưu trữ với dung lượng lớn, tốc độ truyền tải dữ liệu nhanh. Với thiết kế bền bỉ, chống sốc và tiện dụng, bạn sẽ hài lòng khi sở hữu chiếc USB 3.0 hiện đại này.',200,50,250000,50000, 'LSP020'),
	('SP081', 'Ram laptop Kingston 4G D4-2400S17 1Rx16 SODIMM (KVR24S17S6/4)', '',200,50,670000,0, 'LSP020'),
	('SP082', 'Tai nghe choàng đầu có mic SONY MDR - ZX110AP', 'Là một trong những mẫu tai nghe chụp tai có mic gọn nhẹ bậc nhất trên thị trường, Sony MDR - ZX110AP được sáng tạo dành cho những ai yêu trải nghiệm âm nhạc và thường xuyên dịch chuyển. Với thiết kế headband có thể nới rộng hoặc thu gọn tùy thích, bạn sẽ thoải mái mang theo sản phẩm trong những chuyến đi xa.',200,30,540000,0, 'LSP021'),
	('SP083', 'Tai nghe có dây choàng đầu có mic Rapoo VH160', 'Là chiếc tai nghe lý tưởng dành cho các tín đồ eSports, Rapoo VH160 sở hữu cúp tai mềm cách âm tốt, đồng thời thể hiện chất âm xuất sắc nhờ công nghệ âm thanh vòm 7.1 sống động. Bạn sẽ dễ dàng kết nối sản phẩm với laptop, PC và khơi dậy cảm hứng gaming qua đèn LED RGB độc đáo.',150,50,449000,0, 'LSP021'),
	('SP084', 'Tai nghe Xiaomi Mi Earphone Basic', 'Mẫu tai nghe in-ear Mi Basic mà bạn đang theo dõi là sản phẩm mang nhiều nét dấu ấn đặc trưng của Xiaomi: Chất lượng tốt, thiết kế đơn giản và giá thành rất phải chăng. Tin rằng bạn chắc chắn sẽ không phải thất vọng khi lựa chọn Mi Basic để sử dụng như chiếc tai nghe chính của mình.',100,20,150000,0, 'LSP021'),
	('SP085', 'Tai nghe Samsung Galaxy Buds2', 'Với thiết kế sành điệu 3 tone màu và chất âm chuẩn studio, Samsung Galaxy Buds 2 cho thấy mình là chiếc tai nghe True Wireless toàn diện nhất thị trường hiện nay khi sở hữu loạt công nghệ hiện đại như loa hai chiều AKG, chống ồn chủ động ANC, nhận diện giọng nói VPU và kết nối không dây Bluetooth 5.2 mượt mà.',150,50,2990000,0, 'LSP021'),
	('SP086', 'Tai nghe AirPods Pro', 'AirPods Pro sẽ đưa bạn chìm vào không gian âm nhạc sâu lắng và đem tới trải nghiệm giải trí ưu việt chưa từng có trên dòng tai nghe không dây Apple. Những nâng cấp mạnh mẽ về thiết kế và công nghệ giúp tai nghe AirPods Pro trở thành thiết bị nghe nhạc chuyên nghiệp thực thụ.',100,10,4999000,1000000, 'LSP021'),
	('SP087', 'Bàn phím Bluetooth Logitech K380', 'Không gian làm việc, học tập và giải trí của bạn sẽ trở nên tối giản và thanh lịch hơn với sự hiện diện của bàn phím bluetooth Logitech K380. Sản phẩm được thiết kế hướng tới trải nghiệm nhẹ nhàng nhất, linh hoạt nhất và tương thích với cả PC, smartphone hay tablet. Sự gọn gàng của Logitech K380 cho phép bạn mang theo bộ bàn phím này trong balo, túi xách để sử dụng ở bất cứ nơi đâu.',200,50,790000,0, 'LSP022'),
	('SP088', 'Bàn phím + chuột không dây Zadez ZMK-332', 'Việc kết hợp bàn phím và chuột máy tính trong một combo giúp Zadez ZMK-332 tạo được sự đồng bộ trong thao tác khi sử dụng chung một đầu thu tín hiệu duy nhất gắn vào PC hoặc laptop của bạn. Nếu như chuột không dây đem lại cảm nhận êm ái trong từng cú click thì bàn phím chiclet sẽ hỗ trợ người dùng tối đa thông qua hệ thống 104 phím bấm đầy đủ.',150,20,450000,0, 'LSP022'),
	('SP089', 'Bàn phím Game Logitech G512 Lightsync RG', 'Bàn phím gaming Logitech G512 Lightsync RG được tích hợp các nút điều khiển đa phương tiện và đèn LED ở ngay trong tầm tay. Thông qua tổ hợp phím Fn, người dùng có thể nhanh chóng điều khiển nhanh các chức năng như tăng giảm âm lượng, phát/tạm dừng, tắt tiếng, chuyển chế độ chơi game, thay đổi hiệu ứng ánh sáng của hệ thống đèn LED...',100,10,2499000,0, 'LSP022'),
	('SP090', 'Bàn phím không dây Magic Keyboard 2021 Touch ID and Numeric Keypad', 'Chiếc Magic Keyboard bạn đang theo dõi là phiên bản mới nhất và trọn vẹn nhất khi được bổ sung cả cụm phím số cùng các phím điều hướng. Sản phẩm gây ấn tượng bởi phong cách thiết kế tối giản, thanh lịch, đi kèm cảm biến vân tay Touch ID và khả năng tương thích tuyệt vời với máy Mac.',100,10,4999000,0, 'LSP022'),
	('SP091', 'Bàn phím không dây Magic Keyboard 2021 Touch ID', 'Ngoài thế mạnh ở thiết kế tối giản linh hoạt và khả năng tương thích với các sản phẩm Apple, phiên bản bàn phím không dây Magic Keyboard 2021 còn được trang bị cả cảm biến vân tay Touch ID nhằm tiết kiệm thao tác đăng nhập và giảm bớt phiền toái mỗi khi thanh toán online.',100,20,4299000,0, 'LSP022'),
	('SP092', 'Loa dàn 2.0 MICROLAB B18', '',100,20,240000,0, 'LSP023'),
	('SP093', 'Loa MICROLAB M318BT', '',100,30,1129000,0, 'LSP023'),
	('SP094', 'Loa di động SONY SRS-XB12', 'Có thiết kế nhỏ nhắn nhưng ẩn chứa sức mạnh âm thanh đầy nội lực, chiếc loa bluetooth Sony SRS-XB12 được tích hợp công nghệ EXTRA BASS, hứa hẹn đem tới trải nghiệm nhạc sống động và sâu lắng.',50,20,1290000,258000, 'LSP023'),
	('SP095', 'Loa dàn 2.1 Miccrolab U210', '',150,50,699000,0, 'LSP023'),
	('SP096', 'Chuột có dây Rapoo N200', '',100,30,119000,0, 'LSP024'),
	('SP097', 'Chuột không dây Elecom M-IR07DR', 'Chuột không dây Elecom M-IR07DR được chế tác để giúp bạn thực hiện hiệu quả mọi tác vụ một cách cực kỳ yên tĩnh khi giảm bớt các tiếng ồn trong mỗi lượt click hoặc khi bặn sử dụng nút cuộn trang. Sản phẩm sử dụng đèn LED hồng ngoại với độ phân giải 1.200 DPI và thời lượng pin kéo dài suốt 2.5 năm.',100,30,299000,0, 'LSP024'),
	('SP098', 'Chuột Game Logitech G102 Gen2 Lightsync', 'Được thiết kế và tinh chỉnh để phục vụ tối ưu cho tác vụ chơi gaming của những người đam mê thể thao điện tử, chuột Logitech G102 Gen 2 Lightsync sẽ giúp bạn thao tác chính xác tuyệt đối để giành lấy lợi thế trong những pha giao tranh tốc độ cao nhờ hệ thống phím hỗ trợ đi kèm. Sản phẩm được tích hợp công nghệ LIGHTSYNC đầy cảm hứng, thắp sáng không gian gaming của bạn.',100,20,590000,0, 'LSP024'),
	('SP099', 'Chuột không dây Targus W620 ', 'Đem đến sự lựa chọn nhẹ nhàng và đa dụng, chuột không dây Targus W620 có thể giúp ích rất nhiều cho mọi tác vụ trong đời sống của bạn, từ học tập, giải trí cho đến công việc. Điểm đặc biệt ở sản phẩm là khả năng tinh chỉnh độ nhạy quang học giữa ba mức gồm 800, 1200 và 1600 DPI thông qua phím thao tác nhanh.',100,30,315000,0, 'LSP024'),
	('SP100', 'Chuột Game có dây Logitech G402 Hyperion Fury Ultra', 'Logitech G402 Hyperion Fury Ultra thực sự là một trợ thủ đắc lực dành cho các game thủ khi khoác lên mình thiết kế cắt xẻ tràn đầy cảm hứng, sử dụng công nghệ cảm biến siêu nhạy Fusion Engine cùng hệ thống 8 phím bấm có thể lập trình cho các tác vụ khác nhau.',100,20,820000,0, 'LSP024'),
	('SP101', 'Túi chống sốc Zadez 13.3 inches', '',100,10,290000,29000, 'LSP025'),
	('SP102', 'Túi chống sốc Simtop Super Slim 15.6 inches', 'Nếu bạn sở hữu một mẫu laptop màn hình 15.6 inch và đang kiếm tìm giải pháp để bảo vệ thiết bị trong mỗi lần di chuyển, túi chống sốc Simtop Super Slim sẽ là sự lựa chọn phù hợp nhất. Nhờ lợi thế sản xuất từ những chất liệu cao cấp và độ hoàn thiện tốt, sản phẩm ghi nhận khả năng chống sốc, chống xước hết sức hiệu quả.',100,20,690000,138000, 'LSP025'),
	('SP103', 'Túi đeo chéo Tucano Dirtta 11 inches', 'Túi đeo chéo Tucano Dritta 11 inch với chất liệu vải nylon bền bỉ sẽ giúp bạn thoải mái đem theo các vật dụng bên mình mà chẳng ngại các sự cố về nước. Kich cỡ của chiếc túi phù hợp để cất giữ iPad 11 inch, máy đọc sách, sổ ghi chú cùng các vật dụng công nghệ khác như tai nghe, đồng hồ.',120,20,790000,158000, 'LSP025'),
	('SP104', 'Túi chống sốc Zadez ZLB-8512 14', 'Chẳng ngại hư hại laptop do rơi vỡ hay vào nước với sự hỗ trợ của túi chống sốc Zadez ZLB-8512. Sản phẩm sẽ giúp bạn hạn chế những hư hại, tổn thương có thể xảy ra dưới tác động của ngoại lực khi sử dụng. Zadez đã hoàn thiện tỉ mỉ đến từng đường may và đem đến cho chiếc túi thiết kế thanh lịch, dễ dùng.',100,15,290000,29000, 'LSP025');

-- insert HinhAnh
insert HinhAnh (MaHinh, MaSP, TenHinh)
values
	('HA001', 'SP001', 'samsung-galaxy-z-fold3-5g-1.jpg'),
    ('HA002', 'SP002', '637462639794639518_ss-s21-ultra-128-dd.jpg'),
    ('HA003', 'SP002', 'samsung-galaxy-s21-ultra-fpt-4.jpg'),
    ('HA004', 'SP003', '637462639794669527_ss-s21-plus-dd.jpg'),
    ('HA005', 'SP004', '637553049638412708_ss-s20-fe-xanhla-dd.jpg'),
    ('HA006', 'SP005', '637510730660770271_samsung-a72-tim-dd.jpg'),
    ('HA007', 'SP006', '637570519716076314_poco-x3-pro-den-dd.jpg'),
    ('HA008', 'SP007', '637672106067483466_xiaomi-redmi-10-xam-dd.jpg'),
    ('HA009', 'SP007', 'redmi-10-1.jpg'),
    ('HA010', 'SP008', '637569709583556232_xiaomi-note10s-xam-dd.jpg'),
    ('HA011', 'SP009', '637541693612681073_xiaomi-redmi-note-10-pro-xam-dd-1.jpg'),
    ('HA012', 'SP009', 'xiaomi-redmi-note-10-pro-1.jpg'),
    ('HA013', 'SP010', '637623774006210684_xiaomi-redmi-9c-4gb-128gb-dd.jpg'),
    ('HA014', 'SP010', 'redmi-9c-64gb-1.jpg'),
    ('HA015', 'SP011', '637359494094896144_vsmart-aris-pro-xanh-dd.jpg'),
    ('HA016', 'SP012', '637401687179661931_vsmart-aris-xanh-dd.jpg'),
    ('HA017', 'SP012', 'vsmart-aris-8gb-1.jpg'),
    ('HA018', 'SP013', '637359493077638530_vsmart-joy-4-den-dd.jpg'),
    ('HA019', 'SP013', 'vsmart-joy-4-1.jpg'),
    ('HA020', 'SP014', '637673213598401263_iphone-13-pro-max-dd-1.jpg'),
    ('HA021', 'SP014', 'iphone-13-pro-max-2.jpg'),
    ('HA022', 'SP015', '637382695935086033_ip-12-pro-dd.jpg'),
    ('HA023', 'SP015', 'iphone-12-pro-1.jpg'),
    ('HA024', 'SP016', '637393169370871358_ip-11-dd.jpg'),
    ('HA025', 'SP017', '637382721010154236_ip-12-pro-max-dd.jpg'),
    ('HA026', 'SP017', 'iphone-12-pro-max-3.jpg'),
    ('HA027', 'SP018', '637673224696649012_iphone-13-dd-1.jpg'),
    ('HA028', 'SP018', 'iphone-13-1.jpg'),
    ('HA029', 'SP019', '637739831332038316_oppo-find-x3-pro-dd.jpg'),
    ('HA030', 'SP020', '637624919218963466_oppo-reno6-dd.jpg'),
    ('HA031', 'SP020', 'oppo-reno-6-5g-1.jpg'),
    ('HA032', 'SP021', '637730059695307030_oppo-a95-dd.jpg'),
    ('HA033', 'SP022', '637739836690501562_oppo-a94-dd.jpg'),
    ('HA034', 'SP023', '637733878566651810_oppo-a16k-dd.jpg'),
    ('HA035', 'SP023', 'Mo-ta-san-pham-oppo-a16k-3gb-32gb-1.jpg'),
    ('HA036', 'SP024', '637731793300543684_vivo-v23e-xanh-hong-dd.jpg'),
    ('HA037', 'SP024', 'mo-ta-san-pham-vivo-v23e-1.jpg'),
    ('HA038', 'SP025', '637672549881930223_vivo-y21s-xanh-dd.jpg'),
    ('HA039', 'SP026', '637644824833391058_vivo-y21-xanh-dd.jpg'),
    ('HA040', 'SP027', '637707822857432352_00779950-vivo-y15s-trang-xanh-dd.jpg'),
    ('HA041', 'SP028', '637588529466974447_vivo-y53s-xanhden-dd.jpg'),
    ('HA042', 'SP029', '637679927441675274_realme-c21y-xanh-dd.jpg'),
    ('HA043', 'SP029', 'realme-c21y-12.jpg'),
    ('HA044', 'SP030', '637717387178369946_realme-c25y-xanh-dd.jpg'),
    ('HA045', 'SP031', '637571280163165163_realme-narzo-30a-xanh-dd.jpg'),
    ('HA046', 'SP032', '637571288205187101_realme-c11-2021-xanh-dd.jpg'),
    ('HA047', 'SP032', 'realme-narzo-30a-1.jpg'),
    ('HA048', 'SP033', '637544428821348067_realme-8-pro-xanh-dd.jpg'),
    ('HA049', 'SP033', 'realme-8-pro-1.jpg'),
	('HA050', 'SP034', 'Nokia-105-SS(2019).png'),
    ('HA051', 'SP035', 'Nokia-105-DS4G.png'),
    ('HA052', 'SP036', 'Nokia-150-DS(2020).png'),
    ('HA053', 'SP037', 'Nokia-110-DS-4G.png'),
    ('HA054', 'SP038', 'Nokia-5.4-4GB-128GB.png'),
    ('HA055', 'SP039', 'Samsung-Galaxy-Tab-S6-Lite.png'),
    ('HA056', 'SP040', 'Samsung-Galaxy-Tab-A7-Lite.png'),
    ('HA057', 'SP041', 'Samsung-Galaxy-Tab-S7-FE.png'),
    ('HA058', 'SP042', 'Samsung-Galaxy-Tab-S7-FE-WiFi.png'),
    ('HA059', 'SP043', 'Lenovo-Tab-M8-Gen-2.png'),
    ('HA060', 'SP044', 'Lenovo-Tab-P11-Pro-WiFi-4G-128GB.png'),
    ('HA061', 'SP045', 'Lenovo-Tab-M10-32GB-(Gen 2).png'),
    ('HA062', 'SP046', 'iPad-Pro-12.9-2021-M1-Wi-Fi-128GB.png'),
    ('HA063', 'SP047', 'iPad-Pro-12.9-2021-M1-Wi-Fi-5G-128GB.png'),
    ('HA064', 'SP048', 'iPad-Pro-11-2021-M1-Wi-Fi-1-TB.png'),
    ('HA065', 'SP049', 'iPad-10.2-2021-Wi-Fi-256GB.png'),
    ('HA066', 'SP050', 'iPad-10.2-2021-Wi-Fi+Cellular-64GB.png'),
    ('HA067', 'SP051', 'Xiaomi-Pad-5-256GB.png'),
    ('HA068', 'SP052', 'Asus-VivoBook-X515EA-BR1409Ti5-1135G7.png'),
    ('HA069', 'SP053', 'Asus-Vivobook-X515EP-BQ189Ti5-1135G7.png'),
    ('HA070', 'SP054', 'Asus-Vivobook-M513UA-L1230TR5-5500U.png'),
    ('HA071', 'SP055', 'Asus-Vivobook-A515EA-L11970Ti5-1135G7.png'),
    ('HA072', 'SP056', 'Asus-Flip-BR11100FKA-BP0531TN4500.png'),
    ('HA073', 'SP057', 'Laptop-Acer-Travel Mate-B3-TMB311-31-P49D Pentium N5030.jpg'),
    ('HA074', 'SP058', 'Laptop_Acer_Nitro5_Gaming.jpg'),
    ('HA075', 'SP058', 'Laptop__Acer .jpg'),
    ('HA076', 'SP059', 'Acer_Aspire3- i3-1005G115.6A315-56-37DV.jpg'),
    ('HA078', 'SP060', 'Laptop_AcerAspire-1035G1 NX.HZRSV.009.jpg'),
    ('HA079', 'SP060', 'Laptop_Acer_Aspire_NX.HZRSV.009__1.jpg'),
    ('HA081', 'SP061', 'Laptop_Lenovo_IdeaPad-82FE00JKVN-1.jpg'),
    ('HA082', 'SP062', 'Laptop_Lenovo_ThinkPadT15p_Gen-2__2.jpg'),
    ('HA083', 'SP063', 'Gaming-3i-15-88IPG301387-725x515.jpg'),
    ('HA084', 'SP063', 'lenovo-laptop-legion-ideapad-3-gaming-gallery-1.jpg'),
    ('HA085', 'SP064', '60852_laptop_lenovo_legion_7_16achg6_82n60038vn_xam_6.jpg'),
    ('HA086', 'SP065', '637096956683492064_MBP-16-touch-dd.jpg'),
    ('HA087', 'SP066', '637221970108314570_macbook-air-13-2019-gold-dd.jpg'),
    ('HA088', 'SP067', 'Laptop MacBook Air.jpg'),
    ('HA089', 'SP068', 'Laptop-Dell-Inspiron-N3505.jpg'),
    ('HA090', 'SP069', '637493278503711268_dell-den.jpg'),
    ('HA091', 'SP070', '637711277397471845_dell-inspiron1.jpg'),
    ('HA092', 'SP071', '637357846556825196_hp.jpg'),
    ('HA093', 'SP072', 'hp-envy-x360-2020-1.jpg'),
    ('HA094', 'SP073', 'HP-Omen-16-7.jpg'),
    ('HA095', 'SP074', '637713876159168451_PowerGo-white-600x602.jpg'),
    ('HA096', 'SP075', 'Pin-sac-du-phong-khong-day-10000-mah-mi-essential-den-1.jpg'),
    ('HA097', 'SP076', 'Pin-sac-du-phong-li-polymer-10000mah-veger-l10-pd-6.jpg'),
    ('HA098', 'SP077', 'o-cung-wd-ssd-120gb-25-sata-iii-wds120g2g0a-1.jpg'),
	('HA099', 'SP078', 'ssd-wd-m2-480gb bia.jpg'),
    ('HA100', 'SP079', '637418971067925504_b4ac6f9b078c842964ce9b9600f56794.jpg'),
    ('HA101', 'SP080', '637418971067925504_45124_usb_sandisk_cz73_16gb_usb_3_0.jpg'),
    ('HA102', 'SP081', '637038790679460613_4GB 2400MHz.jpg'),
    ('HA103', 'SP082', '637695674664494745_MDR-ZX110APBCE-01.jpg'),
    ('HA104', 'SP083', '637719900945146267_HASP-00774722-dd.jpg'),
    ('HA105', 'SP084', '637663529200028761_tai-nghe-xiaomi-mi-earphone-basic-dd.jpg'),
    ('HA106', 'SP085', '637646214173771101_tai-nghe-samsung-galaxy-buds2-đen-dd.jpg'),
    ('HA107', 'SP086', '637094271122983378_HASP-00629662-dd.jpg'),
    ('HA108', 'SP087', '636217328670897834_HAPK-BAN-PHIM-BLUETOOTH-LOGITECH-K380-00295416.jpg'),
    ('HA109', 'SP088', '637369030270636999_Zadez ZMK-332-AVT.jpg'),
    ('HA110', 'SP089', '637393244083055668_G512-AVT.jpg'),
    ('HA111', 'SP090', '637653479364002673_ban-phim-khong-day-magic-keyboard-2021-touch-id-and-numeric-keypad-dd.jpg'),
    ('HA112', 'SP091', '637653454209097670_ban-phim-khong-day-magic-keyboard-2021-touch-id-dd.jpg'),
    ('HA113', 'SP092', '636991425591023481_b 16 bia.jpg'),
    ('HA114', 'SP093', '636991427220925711_300 bia.jpg'),
    ('HA115', 'SP094', '636952527392663389_Loa-sony-dd.jpg'),
    ('HA116', 'SP095', '637713875060565797_Untitled-1.jpg'),
    ('HA117', 'SP096', '636772096317963039_chuot-co-day-rapoo-n200-1o.jpg'),
    ('HA118', 'SP097', '637680748071955405_2.u5552.d20171010.t171948.436934.jpg'),
    ('HA119', 'SP098', '637369016416307067_G102 Gen2-1.jpg'),
    ('HA120', 'SP099', '637684445077595051_00773549-chuot-khong-day-targus-w620-dd.jpg'),
    ('HA121', 'SP100', '637680738122983264_logitech 402 2.jpg'),
    ('HA122', 'SP101', '637680738122983264_logitech 402 2.jpg'),
    ('HA123', 'SP102', '637746664822955038_avt.jpg'),
    ('HA124', 'SP103', '637746657375689374_avt.jpg'),
    ('HA125', 'SP104', '637521904787198688_00745076-4.jpg');


-- insert DacTinhSanPham
insert DacTinhSanPham (MaDT, MaSP, TenDT, ChiTietDT)
values 
	('DT001', 'SP001', 'Màn hình', '7.6"'), 
    ('DT002', 'SP001', 'RAM', '12 GB'), 
    ('DT003', 'SP001', 'Bộ nhớ trong', '256 GB'), 
    ('DT004', 'SP001', 'CPU', 'Snapdragon 888'), 
    ('DT005', 'SP001', 'Xuất xứ', 'Việt Nam/Trung Quốc'), 
    ('DT006', 'SP001', 'Thời gian ra mắt', '08/2021'),
    ('DT007', 'SP002', 'Màn hình', '6.7"'), 
    ('DT008', 'SP002', 'RAM', '12 GB'), 
    ('DT009', 'SP002', 'Bộ nhớ trong', '128 GB'), 
    ('DT010', 'SP002', 'CPU', 'Exynos 2100'), 
    ('DT011', 'SP002', 'Xuất xứ', 'Việt Nam/Trung Quốc'), 
    ('DT012', 'SP002', 'Thời gian ra mắt', '01/2021'),
    ('DT013', 'SP003', 'Màn hình', '6.7"'), 
    ('DT014', 'SP003', 'RAM', '8 GB'), 
    ('DT015', 'SP003', 'Bộ nhớ trong', '128 GB'), 
    ('DT016', 'SP003', 'CPU', 'Exynos 2100'), 
    ('DT017', 'SP003', 'Xuất xứ', 'Việt Nam/Trung Quốc'), 
    ('DT018', 'SP003', 'Thời gian ra mắt', '01/2021'),
    ('DT019', 'SP004', 'Màn hình', '6.7"'), 
    ('DT020', 'SP004', 'RAM', '12 GB'), 
    ('DT021', 'SP004', 'Bộ nhớ trong', '128 GB'), 
    ('DT022', 'SP004', 'CPU', 'Exynos 2100'), 
    ('DT023', 'SP004', 'Xuất xứ', 'Việt Nam/Trung Quốc'), 
    ('DT024', 'SP004', 'Thời gian ra mắt', '01/2021'),
    ('DT025', 'SP005', 'Màn hình', '6.7"'), 
    ('DT026', 'SP005', 'RAM', '8 GB'), 
    ('DT027', 'SP005', 'Bộ nhớ trong', '256 GB'), 
    ('DT028', 'SP005', 'CPU', 'Snapdragon 720G'), 
    ('DT029', 'SP005', 'Xuất xứ', 'Việt Nam/Trung Quốc'), 
    ('DT030', 'SP005', 'Thời gian ra mắt', '03/2021'),
    ('DT031', 'SP006', 'Màn hình', '6.67"'), 
    ('DT032', 'SP006', 'RAM', '8 GB'), 
    ('DT033', 'SP006', 'Bộ nhớ trong', '256 GB'), 
    ('DT034', 'SP006', 'CPU', 'Snapdragon 860'), 
    ('DT035', 'SP006', 'Xuất xứ', 'Trung Quốc'), 
    ('DT036', 'SP006', 'Thời gian ra mắt', '04/2021'),
    ('DT037', 'SP007', 'Màn hình', '6.5"'), 
    ('DT038', 'SP007', 'RAM', '4 GB'), 
    ('DT039', 'SP007', 'Bộ nhớ trong', '128 GB'), 
    ('DT040', 'SP007', 'CPU', 'MediaTek Helio G88'), 
    ('DT041', 'SP007', 'Xuất xứ', 'Trung Quốc'), 
    ('DT042', 'SP007', 'Thời gian ra mắt', '08/2021'),
    ('DT043', 'SP008', 'Màn hình', '6.43"'), 
    ('DT044', 'SP008', 'RAM', '8 GB'), 
    ('DT045', 'SP008', 'Bộ nhớ trong', '128 GB'), 
    ('DT046', 'SP008', 'CPU', 'MediaTek Helio G95'), 
    ('DT047', 'SP008', 'Xuất xứ', 'Trung Quốc'), 
    ('DT048', 'SP008', 'Thời gian ra mắt', '05/2021'),
    ('DT049', 'SP009', 'Màn hình', '6.67"'),
    ('DT050', 'SP009', 'RAM', '8 GB'), 
    ('DT051', 'SP009', 'Bộ nhớ trong', '128 GB'), 
    ('DT052', 'SP009', 'CPU', 'Snapdragon 732G'), 
    ('DT053', 'SP009', 'Xuất xứ', 'Trung Quốc'), 
    ('DT054', 'SP009', 'Thời gian ra mắt', '03/2021'),
    ('DT055', 'SP010', 'Màn hình', '6.53"'),
    ('DT056', 'SP010', 'RAM', '4 GB'), 
    ('DT057', 'SP010', 'Bộ nhớ trong', '128 GB'), 
    ('DT058', 'SP010', 'CPU', 'Mediatek Helio G35'),
    ('DT059', 'SP010', 'Xuất xứ', 'Trung Quốc'), 
    ('DT060', 'SP010', 'Thời gian ra mắt', '07/2021'),
    ('DT061', 'SP011', 'Màn hình', '6.39"'), 
    ('DT062', 'SP011', 'RAM', '8 GB'), 
    ('DT063', 'SP011', 'Bộ nhớ trong', '128 GB'), 
    ('DT064', 'SP011', 'CPU', 'Snapdragon 730'),
    ('DT065', 'SP011', 'Xuất xứ', 'Việt Nam'), 
    ('DT066', 'SP011', 'Thời gian ra mắt', '09/2021'),
    ('DT067', 'SP012', 'Màn hình', '6.39"'),
    ('DT068', 'SP012', 'RAM', '8 GB'),
    ('DT069', 'SP012', 'Bộ nhớ trong', '128 GB'), 
    ('DT070', 'SP012', 'CPU', 'Adreno 618'), 
    ('DT071', 'SP012', 'Xuất xứ', 'Việt Nam'), 
    ('DT072', 'SP012', 'Thời gian ra mắt', '01/2018'),
    ('DT073', 'SP013', 'Màn hình', '6.53"'), 
    ('DT074', 'SP013', 'RAM', '6 GB'), 
    ('DT075', 'SP013', 'Bộ nhớ trong', '64 GB'), 
    ('DT076', 'SP013', 'CPU', 'Snapdragon 665'),
    ('DT077', 'SP013', 'Xuất xứ', 'Việt Nam'),
    ('DT078', 'SP013', 'Thời gian ra mắt', '--'),
    ('DT079', 'SP014', 'Màn hình', '6.7"'), 
    ('DT080', 'SP014', 'RAM', '6 GB'), 
    ('DT081', 'SP014', 'Bộ nhớ trong', '128 GB'), 
    ('DT082', 'SP014', 'CPU', 'A15 Bionic'), 
    ('DT083', 'SP014', 'Xuất xứ', 'Trung Quốc'), 
    ('DT084', 'SP014', 'Thời gian ra mắt', '09/2021'),
    ('DT085', 'SP015', 'Màn hình', '6.1"'), 
    ('DT086', 'SP015', 'RAM', '6 GB'), 
    ('DT087', 'SP015', 'Bộ nhớ trong', '128 GB'), 
    ('DT088', 'SP015', 'CPU', 'A14 Bionic'),
    ('DT089', 'SP015', 'Xuất xứ', 'Trung Quốc'),
    ('DT090', 'SP015', 'Thời gian ra mắt', '10/2020'),
    ('DT091', 'SP016', 'Màn hình', '6.1"'), 
    ('DT092', 'SP016', 'RAM', '4 GB'),
    ('DT093', 'SP016', 'Bộ nhớ trong', '64 GB'), 
    ('DT094', 'SP016', 'CPU', 'A13 Bionic'), 
    ('DT095', 'SP016', 'Xuất xứ', 'Trung Quốc'),
    ('DT096', 'SP016', 'Thời gian ra mắt', '09/2019'),
    ('DT097', 'SP017', 'Màn hình', '6.7"'), 
    ('DT098', 'SP017', 'RAM', '6 GB'),
    ('DT099', 'SP017', 'Bộ nhớ trong', '256 GB'), 
    ('DT100', 'SP017', 'CPU', 'A14 Bionic'), 
    ('DT101', 'SP017', 'Xuất xứ', 'Trung Quốc'), 
    ('DT102', 'SP017', 'Thời gian ra mắt', '10/2020'),
    ('DT103', 'SP018', 'Màn hình', '6.1"'), 
    ('DT104', 'SP018', 'RAM', '4 GB'), 
    ('DT105', 'SP018', 'Bộ nhớ trong', '128 GB'), 
    ('DT106', 'SP018', 'CPU', 'A15 Bionic'), 
    ('DT107', 'SP018', 'Xuất xứ', 'Trung Quốc'), 
    ('DT108', 'SP018', 'Thời gian ra mắt', '09/2021'),
    ('DT109', 'SP019', 'Màn hình', '6.7"'), 
    ('DT110', 'SP019', 'RAM', '12 GB'), 
    ('DT111', 'SP019', 'Bộ nhớ trong', '256 GB'), 
    ('DT112', 'SP019', 'CPU', 'Snapdragon 888'),
    ('DT113', 'SP019', 'Xuất xứ', 'Trung Quốc'), 
    ('DT114', 'SP019', 'Thời gian ra mắt', '05/2021'),
    ('DT115', 'SP020', 'Màn hình', '6.43"'),
    ('DT116', 'SP020', 'RAM', '8 GB'), 
    ('DT117', 'SP020', 'Bộ nhớ trong', '128 GB'), 
    ('DT118', 'SP020', 'CPU', 'MediaTek Dimensity 900 5G'),
    ('DT119', 'SP020', 'Xuất xứ', 'Trung Quốc'), 
    ('DT120', 'SP020', 'Thời gian ra mắt', '07/2021'),
    ('DT121', 'SP021', 'Màn hình', '6.43"'), 
    ('DT122', 'SP021', 'RAM', '8 GB'), 
    ('DT123', 'SP021', 'Bộ nhớ trong', '128 GB'), 
    ('DT124', 'SP021', 'CPU', 'Snapdragon 662'), 
    ('DT125', 'SP021', 'Xuất xứ', 'Trung Quốc'), 
    ('DT126', 'SP021', 'Thời gian ra mắt', '11/2021'),
    ('DT127', 'SP022', 'Màn hình', '6.43"'),
    ('DT128', 'SP022', 'RAM', '8 GB'),
    ('DT129', 'SP022', 'Bộ nhớ trong', '128 GB'), 
    ('DT130', 'SP022', 'CPU', 'Helio P95'),
    ('DT131', 'SP022', 'Xuất xứ', 'Trung Quốc'), 
    ('DT132', 'SP022', 'Thời gian ra mắt', '03/2021'),
    ('DT133', 'SP023', 'Màn hình', '6.52"'), 
    ('DT134', 'SP023', 'RAM', '3 GB'),
    ('DT135', 'SP023', 'Bộ nhớ trong', '32 GB'), 
    ('DT136', 'SP023', 'CPU', 'Mediatek Helio G35'),
    ('DT137', 'SP023', 'Xuất xứ', 'Trung Quốc'),
    ('DT138', 'SP023', 'Thời gian ra mắt', '11/2021'),
    ('DT139', 'SP024', 'Màn hình', '6.44"'),
    ('DT140', 'SP024', 'RAM', '8 GB'),
    ('DT141', 'SP024', 'Bộ nhớ trong', '128 GB'), 
    ('DT142', 'SP024', 'CPU', 'Mediatek Helio G96'),
    ('DT143', 'SP024', 'Xuất xứ', 'Trung Quốc'),
    ('DT144', 'SP024', 'Thời gian ra mắt', '11/2021'),
    ('DT145', 'SP025', 'Màn hình', '6.51"'),
    ('DT146', 'SP025', 'RAM', '4 GB'),
    ('DT147', 'SP025', 'Bộ nhớ trong', '128 GB'), 
    ('DT148', 'SP025', 'CPU', 'Helio G80'), 
    ('DT149', 'SP025', 'Xuất xứ', 'Trung Quốc'), 
    ('DT150', 'SP025', 'Thời gian ra mắt', '09/2021'),
    ('DT151', 'SP026', 'Màn hình', '6.51"'), 
    ('DT152', 'SP026', 'RAM', '4 GB'), 
    ('DT153', 'SP026', 'Bộ nhớ trong', '64 GB'), 
    ('DT154', 'SP026', 'CPU', 'Helio P35'), 
    ('DT155', 'SP026', 'Xuất xứ', 'Trung Quốc'), 
    ('DT156', 'SP026', 'Thời gian ra mắt', '09/2021'),
    ('DT157', 'SP027', 'Màn hình', '6.51"'), 
    ('DT158', 'SP027', 'RAM', '3 GB'), 
    ('DT159', 'SP027', 'Bộ nhớ trong', '32 GB'), 
    ('DT160', 'SP027', 'CPU', 'Helio P35'),
    ('DT161', 'SP027', 'Xuất xứ', 'Trung Quốc'),
    ('DT162', 'SP027', 'Thời gian ra mắt', '10/2021'),
    ('DT163', 'SP028', 'Màn hình', '6.58"'),
    ('DT164', 'SP028', 'RAM', '8 GB'),
    ('DT165', 'SP028', 'Bộ nhớ trong', '128 GB'), 
    ('DT166', 'SP028', 'CPU', 'Helio G80'),
    ('DT167', 'SP028', 'Xuất xứ', 'Trung Quốc'),
    ('DT168', 'SP028', 'Thời gian ra mắt', '06/2021'),
    ('DT169', 'SP029', 'Màn hình', '6.5"'), 
    ('DT170', 'SP029', 'RAM', '3 GB'),
    ('DT171', 'SP029', 'Bộ nhớ trong', '32 GB'), 
    ('DT172', 'SP029', 'CPU', 'Unisoc T610'),
    ('DT173', 'SP029', 'Xuất xứ', 'Trung Quốc'),
    ('DT174', 'SP029', 'Thời gian ra mắt', '06/2021'),
    ('DT175', 'SP030', 'Màn hình', '6.5"'),
    ('DT176', 'SP030', 'RAM', '4 GB'), 
    ('DT177', 'SP030', 'Bộ nhớ trong', '64 GB'), 
    ('DT178', 'SP030', 'CPU', 'Unisoc T618'), 
    ('DT179', 'SP030', 'Xuất xứ', 'Trung Quốc'),
    ('DT180', 'SP030', 'Thời gian ra mắt', '10/2021'),
    ('DT181', 'SP031', 'Màn hình', '6.5"'),
    ('DT182', 'SP031', 'RAM', '4 GB'),
    ('DT183', 'SP031', 'Bộ nhớ trong', '64 GB'), 
    ('DT184', 'SP031', 'CPU', 'Exynos 2100'), 
    ('DT185', 'SP031', 'Xuất xứ', 'Trung Quốc'),
    ('DT186', 'SP031', 'Thời gian ra mắt', '03/2021'),
    ('DT187', 'SP032', 'Màn hình', '6.5"'), 
    ('DT188', 'SP032', 'RAM', '2 GB'), 
    ('DT189', 'SP032', 'Bộ nhớ trong', '32 GB'), 
    ('DT190', 'SP032', 'CPU', 'SC9863A'), 
    ('DT191', 'SP032', 'Xuất xứ', 'Trung Quốc'),
    ('DT192', 'SP032', 'Thời gian ra mắt', '01/2021'),
    ('DT193', 'SP033', 'Màn hình', '6.4"'), 
    ('DT194', 'SP033', 'RAM', '8 GB'),
    ('DT195', 'SP033', 'Bộ nhớ trong', '128 GB'), 
    ('DT196', 'SP033', 'CPU', '	Snapdragon 720G'),
    ('DT197', 'SP033', 'Xuất xứ', 'Trung Quốc'),
    ('DT198', 'SP033', 'Thời gian ra mắt', '04/2021'),
	('DT199', 'SP034', 'Màn hình', '1.77"'),
    ('DT200', 'SP034', 'RAM', '4MB'),
    ('DT201', 'SP034', 'Bộ nhớ trong', '4MB'),
    ('DT202', 'SP034', 'CPU', 'Không'),
    ('DT203', 'SP034', 'Xuất xứ', 'Trung Quốc'),
    ('DT204', 'SP034', 'Thời gian ra mắt', '08/2019'),
    ('DT205', 'SP035', 'Màn hình', '1.8"'),
    ('DT206', 'SP035', 'RAM', '48MB'),
    ('DT207', 'SP035', 'Bộ nhớ trong', '128MB'),
    ('DT208', 'SP035', 'CPU', 'Unisoc T107'),
    ('DT209', 'SP035', 'Xuất xứ', 'Trung Quốc'),
    ('DT210', 'SP035', 'Thời gian ra mắt', '08/2021'),
    ('DT211', 'SP036', 'Màn hình', '2.4"'),
    ('DT212', 'SP036', 'RAM', '32MB'),
    ('DT213', 'SP036', 'Bộ nhớ trong', '4MB'),
    ('DT214', 'SP036', 'CPU', 'Không'),
    ('DT215', 'SP036', 'Xuất xứ', 'Việt Nam'),
    ('DT216', 'SP036', 'Thời gian ra mắt', '08/2020'),
    ('DT217', 'SP037', 'Màn hình', '1.8"'),
    ('DT218', 'SP037', 'RAM', '48MB'),
    ('DT219', 'SP037', 'Bộ nhớ trong', '128MB'),
    ('DT220', 'SP037', 'CPU', 'Unisoc T107'),
    ('DT221', 'SP037', 'Xuất xứ', 'Trung Quốc'),
    ('DT222', 'SP037', 'Thời gian ra mắt', '08/2021'),
    ('DT223', 'SP038', 'Màn hình', '6.39"'),
    ('DT224', 'SP038', 'RAM', '4GB'),
    ('DT225', 'SP038', 'Bộ nhớ trong', '128GB'),
    ('DT226', 'SP038', 'CPU', 'Snapdragon 662'),
    ('DT227', 'SP038', 'Xuất xứ', 'Trung Quốc'),
    ('DT228', 'SP038', 'Thời gian ra mắt', '01/2021'),
    ('DT229', 'SP039', 'Màn hình', '10.4"'),
    ('DT230', 'SP039', 'RAM', '4GB'),
    ('DT231', 'SP039', 'Bộ nhớ trong', '64GB'),
    ('DT232', 'SP039', 'CPU', 'Exynos 9611'),
    ('DT233', 'SP039', 'Xuất xứ', 'Việt Nam'),
    ('DT234', 'SP039', 'Thời gian ra mắt', '05/2020'),
    ('DT235', 'SP040', 'Màn hình', '8.7"'),
    ('DT236', 'SP040', 'RAM', '3GB'),
    ('DT237', 'SP040', 'Bộ nhớ trong', '32GB'),
    ('DT238', 'SP040', 'CPU', 'Media Tek MT876'),
    ('DT239', 'SP040', 'Xuất xứ', 'Trung Quốc/Việt Nam'),
    ('DT240', 'SP040', 'Thời gian ra mắt', '05/2021'),
    ('DT241', 'SP041', 'Màn hình', '12.4"'),
    ('DT242', 'SP041', 'RAM', '4GB'),
    ('DT243', 'SP041', 'Bộ nhớ trong', '64GB'),
    ('DT244', 'SP041', 'CPU', 'Snapdragon 7500'),
    ('DT245', 'SP041', 'Xuất xứ', 'Trung Quốc/Việt Nam'),
    ('DT246', 'SP041', 'Thời gian ra mắt', '07/2021'),
    ('DT247', 'SP042', 'Màn hình', '12.4"'),
    ('DT248', 'SP042', 'RAM', '4GB'),
    ('DT249', 'SP042', 'Bộ nhớ trong', '64GB'),
    ('DT250', 'SP042', 'CPU', 'Snapdragon 7780'),
    ('DT251', 'SP042', 'Xuất xứ', 'Trung Quốc/Việt Nam'),
    ('DT252', 'SP042', 'Thời gian ra mắt', '07/2021'),
    ('DT253', 'SP043', 'Màn hình', '8.0"'),
    ('DT254', 'SP043', 'RAM', '2GB'),
    ('DT255', 'SP043', 'Bộ nhớ trong', '32GB'),
    ('DT256', 'SP043', 'CPU', 'Helio A22'),
    ('DT257', 'SP043', 'Xuất xứ', 'Trung Quốc'),
    ('DT258', 'SP043', 'Thời gian ra mắt', '10/2019'),
    ('DT259', 'SP044', 'Màn hình', '11.5"'),
    ('DT260', 'SP044', 'RAM', '4GB'),
    ('DT261', 'SP044', 'Bộ nhớ trong', '128GB'),
    ('DT262', 'SP044', 'CPU', 'Snapdragon 7300'),
    ('DT263', 'SP044', 'Xuất xứ', 'Trung Quốc'),
    ('DT264', 'SP044', 'Thời gian ra mắt', '09/2020'),
    ('DT265', 'SP045', 'Màn hình', '10.1"'),
    ('DT266', 'SP045', 'RAM', '2GB'),
    ('DT267', 'SP045', 'Bộ nhớ trong', '32GB'),
    ('DT268', 'SP045', 'CPU', 'Media Helio'),
    ('DT269', 'SP045', 'Xuất xứ', 'Trung Quốc'),
    ('DT270', 'SP045', 'Thời gian ra mắt', '07/2020'),
    ('DT271', 'SP046', 'Màn hình', '12.9"'),
    ('DT272', 'SP046', 'RAM', '8GB'),
    ('DT273', 'SP046', 'Bộ nhớ trong', '128GB'),
    ('DT274', 'SP046', 'CPU', 'Apple M1'),
    ('DT275', 'SP046', 'Xuất xứ', 'Trung Quốc'),
    ('DT276', 'SP046', 'Thời gian ra mắt', '04/2021'),
    ('DT277', 'SP047', 'Màn hình', '12.9"'),
    ('DT278', 'SP047', 'RAM', '8GB'),
    ('DT279', 'SP047', 'Bộ nhớ trong', '128GB'),
    ('DT280', 'SP047', 'CPU', 'Apple M1'),
    ('DT281', 'SP047', 'Xuất xứ', 'Trung Quốc'),
    ('DT282', 'SP047', 'Thời gian ra mắt', '04/2021'),
    ('DT283', 'SP048', 'Màn hình', '11.0"'),
    ('DT284', 'SP048', 'RAM', '16GB'),
    ('DT285', 'SP048', 'Bộ nhớ trong', '1TB'),
    ('DT286', 'SP048', 'CPU', 'Apple M1'),
    ('DT287', 'SP048', 'Xuất xứ', 'Trung Quốc'),
    ('DT288', 'SP048', 'Thời gian ra mắt', '04/2021'),
    ('DT289', 'SP049', 'Màn hình', '10.2"'),
    ('DT290', 'SP049', 'RAM', '3GB'),
    ('DT291', 'SP049', 'Bộ nhớ trong', '256GB'),
    ('DT292', 'SP049', 'CPU', 'A13 Bionic'),
    ('DT293', 'SP049', 'Xuất xứ', 'Trung Quốc'),
    ('DT294', 'SP049', 'Thời gian ra mắt', '09/2021'),
    ('DT295', 'SP050', 'Màn hình', '10.2"'),
    ('DT296', 'SP050', 'RAM', '3GB'),
    ('DT297', 'SP050', 'Bộ nhớ trong', '64GB'),
    ('DT298', 'SP050', 'CPU', 'A13 Bionic'),
    ('DT299', 'SP050', 'Xuất xứ', 'Trung Quốc'),
    ('DT300', 'SP050', 'Thời gian ra mắt', '09/2021'),
    ('DT301', 'SP051', 'Màn hình', '11.0"'),
    ('DT302', 'SP051', 'RAM', '6GB'),
    ('DT303', 'SP051', 'Bộ nhớ trong', '256GB'),
    ('DT304', 'SP051', 'CPU', 'Snapdragon 860'),
    ('DT305', 'SP051', 'Xuất xứ', 'Trung Quốc'),
    ('DT306', 'SP051', 'Thời gian ra mắt', '09/2021'),
    ('DT307', 'SP052', 'Màn hình', '15.6"'),
    ('DT308', 'SP052', 'RAM', '8GB'),
    ('DT309', 'SP052', 'Bộ nhớ trong', '8GB'),
    ('DT310', 'SP052', 'CPU', 'Intel Iris Xe Graphics'),
    ('DT311', 'SP052', 'Xuất xứ', 'Trung Quốc'),
    ('DT312', 'SP052', 'Thời gian ra mắt', '2021'),
    ('DT313', 'SP053', 'Màn hình', '15.6"'),
    ('DT314', 'SP053', 'RAM', '8GB'),
    ('DT315', 'SP053', 'Bộ nhớ trong', '8GB'),
    ('DT316', 'SP053', 'CPU', 'Intel Core i5-1135G7'),
    ('DT317', 'SP053', 'Xuất xứ', 'Trung Quốc'),
    ('DT318', 'SP053', 'Thời gian ra mắt', '2021'),
    ('DT319', 'SP054', 'Màn hình', '15.6"'),
    ('DT320', 'SP054', 'RAM', '8GB'),
    ('DT321', 'SP054', 'Bộ nhớ trong', '8GB'),
    ('DT322', 'SP054', 'CPU', 'AMD Ryzen 5-5500U'),
    ('DT323', 'SP054', 'Xuất xứ', 'Trung Quốc'),
    ('DT324', 'SP054', 'Thời gian ra mắt', '2021'),
    ('DT325', 'SP055', 'Màn hình', '15.6"'),
    ('DT326', 'SP055', 'RAM', '8GB'),
    ('DT327', 'SP055', 'Bộ nhớ trong', '8GB'),
    ('DT328', 'SP055', 'CPU', 'Intel Core i5-1135G7'),
    ('DT329', 'SP055', 'Xuất xứ', 'Trung Quốc'),
    ('DT330', 'SP055', 'Thời gian ra mắt', '2021'),
    ('DT331', 'SP057', 'Màn hình', '11.6"'),
    ('DT332', 'SP057', 'RAM', '4 GB'),
    ('DT333', 'SP057', 'Bộ nhớ trong', '256 GB'),
    ('DT334', 'SP057', 'CPU', 'Intel Pentium N5030'),
    ('DT335', 'SP057', 'Xuất xứ', 'Trung Quốc'),
    ('DT336', 'SP057', 'Thời gian ra mắt', '9/2021'),
    ('DT337', 'SP058', 'Màn hình', '15.6"'),
    ('DT338', 'SP058', 'RAM', '8 GB'),
    ('DT339', 'SP058', 'Bộ nhớ trong', '512GB'),
    ('DT340', 'SP058', 'CPU', 'Intel Core i7'),
    ('DT341', 'SP058', 'Xuất xứ', 'Trung Quốc'),
    ('DT342', 'SP058', 'Thời gian ra mắt', '12/2021'),
    ('DT343', 'SP059', 'Màn hình', '15.6"'),
    ('DT344', 'SP059', 'RAM', '4 GB'),
    ('DT345', 'SP059', 'Bộ nhớ trong', '256GB'),
    ('DT346', 'SP059', 'CPU', 'Intel Core i3'),
    ('DT347', 'SP059', 'Xuất xứ', 'Trung Quốc'),
    ('DT348', 'SP059', 'Thời gian ra mắt', '3/2019'),
    ('DT349', 'SP060', 'Màn hình', '15.6"'),
    ('DT350', 'SP060', 'RAM', '4 GB'),
    ('DT351', 'SP060', 'Bộ nhớ đệm', '6 MB'),
    ('DT352', 'SP060', 'CPU', 'Intel Core i5'),
    ('DT353', 'SP060', 'Xuất xứ', 'Trung Quốc'),
    ('DT354', 'SP060', 'Thời gian ra mắt', '10/2020'),
    ('DT355', 'SP061', 'Màn hình', '14.0"'),
    ('DT356', 'SP061', 'RAM', '8 GB'),
    ('DT357', 'SP061', 'Bộ nhớ trong', '512GB'),
    ('DT358', 'SP061', 'CPU', 'I5-1135G7'),
    ('DT359', 'SP061', 'Xuất xứ', 'Trung Quốc'),
    ('DT360', 'SP061', 'Thời gian ra mắt', '3/2021'),
    ('DT361', 'SP062', 'Màn hình', '15,6"'),
    ('DT362', 'SP062', 'RAM', '64GB'),
    ('DT363', 'SP062', 'Bộ nhớ trong', '24MB'),
    ('DT364', 'SP062', 'CPU', 'Core i7'),
    ('DT365', 'SP062', 'Xuất xứ', 'Việt Nam/Hàn Quốc'),
    ('DT366', 'SP062', 'Thời gian ra mắt', '6/2020'),
    ('DT367', 'SP063', 'Màn hình', '15.6"'),
    ('DT368', 'SP063', 'RAM', '16GB'),
    ('DT369', 'SP063', 'Bộ nhớ trong', '16GB'),
    ('DT370', 'SP063', 'CPU', ' Intel Core i7 '),
    ('DT371', 'SP063', 'Xuất xứ', 'Việt Nam/Hàn Quốc'),
    ('DT372', 'SP063', 'Thời gian ra mắt', '12/2020'),
    ('DT373', 'SP064', 'Màn hình', '16.0"'),
    ('DT374', 'SP064', 'RAM', '16GB'),
    ('DT375', 'SP064', 'Bộ nhớ trong', '512GB'),
    ('DT376', 'SP064', 'CPU', '5800H'),
    ('DT377', 'SP064', 'Xuất xứ', 'Việt Nam/Hàn Quốc'),
    ('DT378', 'SP064', 'Thời gian ra mắt', '10/2021'),
    ('DT379', 'SP065', 'Màn hình', '13.0"'),
    ('DT380', 'SP065', 'RAM', '8 GB'),
    ('DT381', 'SP065', 'Bộ nhớ trong', '256GB'),
    ('DT382', 'SP065', 'CPU', 'Apple M1'),
    ('DT383', 'SP065', 'Xuất xứ', 'Trung Quốc'),
    ('DT384', 'SP065', 'Thời gian ra mắt', '6/2020'),
    ('DT385', 'SP066', 'Màn hình', '13.0"'),
    ('DT386', 'SP066', 'RAM', '8 GB'),
    ('DT387', 'SP066', 'Bộ nhớ trong', '512GB'),
    ('DT388', 'SP066', 'CPU', 'Apple M1'),
    ('DT389', 'SP066', 'Xuất xứ', 'Trung Quốc'),
    ('DT390', 'SP066', 'Thời gian ra mắt', '1/2021'),
    ('DT391', 'SP067', 'Màn hình', '13.3"'),
    ('DT392', 'SP067', 'RAM', '8 GB'),
    ('DT393', 'SP067', 'Bộ nhớ trong', '256 GB'),
    ('DT394', 'SP067', 'CPU', 'I5-1135G7'),
    ('DT395', 'SP067', 'Xuất xứ', 'Trung Quốc'),
    ('DT396', 'SP067', 'Thời gian ra mắt', '9/2020'),
    ('DT397', 'SP068', 'Màn hình', '15.6"'),
    ('DT398', 'SP068', 'RAM', '16 GB'),
    ('DT399', 'SP068', 'Bộ nhớ trong', '512 GB'),
    ('DT400', 'SP068', 'CPU', 'AMD Ryzen 5-3450U'),
    ('DT401', 'SP068', 'Xuất xứ', 'Trung Quốc'),
    ('DT402', 'SP068', 'Thời gian ra mắt', '11/2021'),
    ('DT403', 'SP069', 'Màn hình', '15.6"'),
    ('DT404', 'SP069', 'RAM', '8 GB'),
    ('DT405', 'SP069', 'Bộ nhớ trong', '512GB'),
    ('DT406', 'SP069', 'CPU', 'Intel Core i7'),
    ('DT407', 'SP069', 'Xuất xứ', 'Trung Quốc'),
    ('DT408', 'SP069', 'Thời gian ra mắt', '2021'),
    ('DT409', 'SP070', 'Màn hình', '15.6"'),
    ('DT410', 'SP070', 'RAM', '4 GB'),
    ('DT411', 'SP070', 'Bộ nhớ trong', '128 GB'),
    ('DT412', 'SP070', 'CPU', 'Intel Pentium N5030'),
    ('DT413', 'SP070', 'Xuất xứ', 'Trung Quốc'),
    ('DT414', 'SP070', 'Thời gian ra mắt', '12/2020'),
    ('DT415', 'SP071', 'Màn hình', '5.6"'),
    ('DT416', 'SP071', 'RAM', '8 GB'),
    ('DT417', 'SP071', 'Bộ nhớ trong', '512 GB'),
    ('DT418', 'SP071', 'CPU', 'Intel Core i7'),
    ('DT419', 'SP071', 'Xuất xứ', 'Trung Quốc'),
    ('DT420', 'SP071', 'Thời gian ra mắt', '9/2020'),
    ('DT421', 'SP072', 'Màn hình', '13.3"'),
    ('DT422', 'SP072', 'RAM', '16 GB'),
    ('DT423', 'SP072', 'Bộ nhớ trong', '1 TB'),
    ('DT424', 'SP072', 'CPU', 'Intel Core i5'),
    ('DT425', 'SP072', 'Xuất xứ', 'Trung Quốc'),
    ('DT426', 'SP072', 'Thời gian ra mắt', '1/2021'),
    ('DT427', 'SP073', 'Màn hình', '16.1"'),
    ('DT428', 'SP073', 'RAM', '8 GB'),
    ('DT429', 'SP073', 'Bộ nhớ trong', '512GB'),
    ('DT430', 'SP073', 'CPU', 'I5-1135G7'),
    ('DT431', 'SP073', 'Xuất xứ', 'Trung Quốc'),
    ('DT432', 'SP073', 'Thời gian ra mắt', '3/2021'),
    ('DT433', 'SP074', 'Dung lượng', '10000 mAh'),
    ('DT434', 'SP074', 'Hiệu suất sử dụng', '1.5 lần'),
    ('DT435', 'SP074', 'Số cổng ra', '4 cổng'),
    ('DT436', 'SP074', 'Thời gian sạc', '120 phút'),
    ('DT437', 'SP074', 'Xuất xứ', 'Trung Quốc'),
    ('DT438', 'SP074', 'Thời gian ra mắt', '10/2021'),
    ('DT439', 'SP075', 'Dung lượng', '10000 mAh'),
    ('DT440', 'SP075', 'Hiệu suất sử dụng', '5800 mAh'),
    ('DT441', 'SP075', 'Số cổng ra', '1 cổng'),
    ('DT442', 'SP075', 'Thời gian sạc', '4 giờ '),
    ('DT443', 'SP075', 'Xuất xứ', 'Trung Quốc'),
    ('DT444', 'SP075', 'Thời gian ra mắt', '11/2020'),
    ('DT445', 'SP076', 'Dung lượng', '10000 mAh'),
    ('DT446', 'SP076', 'Hiệu suất sử dụng', '70%'),
    ('DT447', 'SP076', 'Số cổng ra', '4 cổng'),
    ('DT448', 'SP076', 'Thời gian sạc', '6-10 giờ'),
    ('DT449', 'SP076', 'Xuất xứ', 'Trung Quốc'),
    ('DT450', 'SP076', 'Thời gian ra mắt', '9/2021'),
    ('DT457', 'SP077', 'Loại hàng Web', 'Ổ SSD'),
    ('DT458', 'SP077', 'Màu sắc', 'Green'),
    ('DT459', 'SP077', 'Xuất xứ', 'Trung Quốc'),
    ('DT460', 'SP077', 'Thời gian bảo hành', '12 tháng'),
    ('DT461', 'SP078', 'Dung lượng', '480 GB'),
    ('DT462', 'SP078', 'Hệ điều hành tương thích', 'Window, Mac'),
    ('DT463', 'SP078', 'Xuất xứ', 'Trung Quốc'),
    ('DT464', 'SP078', 'Thời gian bảo hành', '12 tháng'),
    ('DT465', 'SP079', 'Thời gian bảo hành', '12 tháng'),
    ('DT466', 'SP079', 'Chất lượng', 'Nhựa cao cấp'),
    ('DT467', 'SP079', 'Chất liệu', 'Nhựa cao cấp'),
    ('DT468', 'SP079', 'Dung lượng', '32 GB'),
    ('DT469', 'SP079', 'Số cổng', '3 cổng'),
    ('DT470', 'SP079', 'Thương hiệu', 'SanDisk'),
    ('DT471', 'SP079', 'Xuât xứ', 'Trung Quốc'),
    ('DT472', 'SP079', 'Thời gian bảo hành', '12 tháng'),
    ('DT473', 'SP080', 'Chất liệu', 'Kim loại + Nhựa'),
    ('DT474', 'SP080', 'Dung lượng', '32 GB'),
    ('DT475', 'SP080', 'Số Cổng', '3 cổng'),
    ('DT476', 'SP080', 'Thương hiệu', 'SanDisk'),
    ('DT477', 'SP080', 'Xuất xứ', 'Trung Quốc'),
    ('DT478', 'SP080', 'Thời gian bảo hành', '12 tháng'),
    ('DT479', 'SP081', 'Dung lượng', '4 GB'),
    ('DT480', 'SP081', 'Hệ điều hành tương thích', 'Window'),
    ('DT481', 'SP081', 'Số cổng', 'DDR4'),
    ('DT482', 'SP081', 'Thương hiệu', 'Kingston'),
    ('DT483', 'SP081', 'Xuất xứ', 'Trung quốc'),
    ('DT484', 'SP082', 'Chất liệu', 'Nhựa'),
    ('DT485', 'SP082', 'Hệ điều hành tương thích', '	iOS, Android, Windows Phone'),
    ('DT486', 'SP082', 'Phụ kiện đi kèm', 'hộp + giấy hướng dẫn sử dụng'),
    ('DT487', 'SP082', 'Thương hiệu', 'Sony'),
    ('DT488', 'SP082', 'Xuất xứ', 'Trung Quốc'),
    ('DT489', 'SP082', 'Thời gian bảo hành', '12 tháng'),
    ('DT490', 'SP083', 'Chất liệu', 'Nhựa, Da'),
    ('DT491', 'SP083', 'Hệ điều hành tương thích', 'Window hỗ trợ thiết bị USB'),
    ('DT492', 'SP083', 'Thương hiệu', 'Rapoo'),
    ('DT493', 'SP083', 'Xuất xứ', 'Trung Quốc'),
    ('DT494', 'SP084', 'Chất liệu', 'Nhựa TPE'),
    ('DT495', 'SP084', 'Hệ điều hành tương thích', 'Android, Windows'),
    ('DT496', 'SP084', 'Thương hiệu', 'Xiaomi'),
    ('DT497', 'SP084', 'Xuất xứ', 'Trung Quốc'),
    ('DT498', 'SP084', 'Thời gian bảo hành', '6 tháng'),
    ('DT499', 'SP085', 'Dòng hàng', 'Galaxy Buds'),
    ('DT500', 'SP085', 'Hệ điuề hành tương thích', 'Android, iOS'),
    ('DT501', 'SP085', 'Loại kết nối', 'Bluetooth'),
    ('DT502', 'SP085', 'Loại tai nghe', 'Không dây'),
    ('DT503', 'SP085', 'Phụ kiện đi kèm', 'Cáp +Sách HDSD'),
    ('DT504', 'SP085', 'Thương hiệu', 'SamSung'),
    ('DT505', 'SP085', 'Xuất xứ', 'Việt Nam'),
    ('DT506', 'SP085', 'Thời gian bảo hành', '12 tháng'),
    ('DT507', 'SP086', 'Chất liệu', 'Nhựa cao cấp'),
    ('DT508', 'SP086', 'Hệ điều hành tương thích', 'iOS, iPadOS, watchOS, macOS, tvOS, Android, Windows'),
    ('DT509', 'SP086', 'Loại kết nối', 'Bluetooth'),
    ('DT510', 'SP086', 'Loại tai nghe', 'Không dây'),
    ('DT511', 'SP086', 'Thương hiệu', 'Apple'),
    ('DT512', 'SP086', 'Xuất xứ', 'Trung Quốc'),
    ('DT513', 'SP086', 'Thời gian bảo hành', '12 tháng'),
    ('DT514', 'SP087', 'Chất liệu', 'Nhựa'),
    ('DT515', 'SP087', 'Loại bàn phím', 'Không dây'),
    ('DT516', 'SP087', 'Thương hiệu', 'Logitech'),
    ('DT517', 'SP087', 'Tính năng', 'Kết nối bluetooth'),
    ('DT518', 'SP087', 'Xuất xứ', 'Trung Quốc'),
    ('DT519', 'SP087', 'Thời gian bảo hành', '12 tháng'),
    ('DT520', 'SP088', 'Thương hiệu', 'Zadez'),
    ('DT521', 'SP088', 'Thời gian bảo hành', '12 tháng'),
    ('DT522', 'SP089', 'Chất liệu', 'Hợp kim Nhôm – Magiê 5052'),
    ('DT523', 'SP089', 'Loại bàn phím', 'Phím cơ'),
    ('DT524', 'SP089', 'Thương hiệu', 'Logitech'),
    ('DT525', 'SP089', 'Xuất xứ', 'Trung Quốc'),
    ('DT526', 'SP089', 'Thời gian bảo hành', '12 tháng'),
    ('DT527', 'SP089', 'Màu sắc', 'Đen'),
    ('DT528', 'SP090', 'Loại bàn phím', 'Không dây'),
    ('DT529', 'SP090', 'Loại kết nối', 'Bluetooth'),
    ('DT530', 'SP090', 'Màu sắc', 'Silver'),
    ('DT531', 'SP090', 'Thương hiệu', 'Apple'),
    ('DT532', 'SP090', 'Xuất xứ', 'Trung Quốc'),
    ('DT533', 'SP090', 'Thời gian bảo hành', '12 tháng'),
    ('DT534', 'SP091', 'Loại bàn phím', 'Không dây'),
    ('DT535', 'SP091', 'Loại kết nối', 'Bluetooth'),
    ('DT536', 'SP091', 'Màu sắc', 'Silver'),
    ('DT537', 'SP091', 'Thương hiệu', 'Apple'),
    ('DT538', 'SP091', 'Xuất xứ', 'Trung Quốc'),
    ('DT539', 'SP091', 'Thời gian bảo hành', '12 tháng'),
    ('DT540', 'SP092', 'Chất liệu', 'Gỗ ép'),
    ('DT541', 'SP092', 'Công suất', '2.5Wx2'),
    ('DT542', 'SP092', 'Loại loa', 'Loa vi tính'),
    ('DT543', 'SP092', 'Thương hiệu', 'Microlab'),
    ('DT544', 'SP092', 'Xuất xứ', 'Trung Quốc'),
    ('DT545', 'SP092', 'Thời gian bảo hành', '12 tháng'),
    ('DT546', 'SP093', 'Chất liệu', 'Gỗ ép'),
    ('DT547', 'SP093', 'Cách kết nối', 'Bluetooth'),
    ('DT548', 'SP093', 'Công suất', '38W'),
    ('DT549', 'SP093', 'Loại loa', 'Loa vi tính'),
    ('DT550', 'SP093', 'Thương hiệu', 'Microlab'),
    ('DT551', 'SP093', 'Xuất xứ', 'Trung Quốc'),
    ('DT552', 'SP093', 'Thời gian bảo hành', '12 tháng'),
    ('DT553', 'SP094', 'Chất liệu', 'Cao su chống trầy xước'),
    ('DT554', 'SP094', 'Cách kết nối', 'Bluetooth'),
    ('DT555', 'SP094', 'Công suất', '10W'),
    ('DT556', 'SP094', 'Phụ kiện kèm theo', 'Cáp Micro USB +dây đeo'),
    ('DT557', 'SP094', 'Thương hiệu', 'Sony'),
    ('DT558', 'SP094', 'Xuất xứ', 'Trung Quốc'),
    ('DT559', 'SP094', 'Thời gian bảo hành', '12 tháng'),
    ('DT560', 'SP095', 'Chất liệu', 'Nhựa'), 
    ('DT561', 'SP095', 'Công suất', '11W'),
    ('DT562', 'SP095', 'Loại loa', 'Loa vi tính'),
    ('DT563', 'SP095', 'Thương hiệu', 'Microlab'),
    ('DT564', 'SP095', 'Xuất xứ', 'Trung Quốc'),
    ('DT565', 'SP095', 'Thời gian bảo hành', '12 tháng'),
    ('DT566', 'SP096', 'Kết nối', 'USB'),
    ('DT567', 'SP096', 'Loại chuột', 'Có dây'),
    ('DT568', 'SP096', 'Thương hiệu', 'Rapoo'),
    ('DT569', 'SP096', 'Xuất xứ', 'Trung Quốc'),
    ('DT570', 'SP096', 'Thời gian bảo hành', '12 tháng'),
    ('DT571', 'SP097', 'Kết nối', 'Bluetooth'),
    ('DT572', 'SP097', 'Loại chuột', 'Không dây'),
    ('DT573', 'SP097', 'Thương hiệu', 'Elecom'),
    ('DT574', 'SP097', 'Xuất xứ', 'Trung Quốc'),
    ('DT575', 'SP096', 'Thời gian bảo hành', '12 tháng'),
    ('DT576', 'SP098', 'Kết nối', 'USB'),
    ('DT577', 'SP098', 'Loại chuột', 'Gaming'),
    ('DT578', 'SP098', 'Thương hiệu', 'Logitech'),
    ('DT579', 'SP098', 'Xuất xứ', 'Trung Quốc'),
    ('DT580', 'SP098', 'Thời gian bảo hành', '12 tháng'),
    ('DT581', 'SP099', 'Kết nối', '	Wireless'),
    ('DT582', 'SP099', 'Loại chuột', 'Không dây'),
    ('DT583', 'SP099', 'Xuất xứ', 'Trung Quốc'),
    ('DT584', 'SP099', 'Thời gian bảo hành', '36 tháng'),
    ('DT585', 'SP100', 'Kết nối', 'USB'),
    ('DT586', 'SP100', 'Loại chuột', 'Gaming'),
    ('DT587', 'SP100', 'Thương hiệu', 'Logitech'),
    ('DT588', 'SP100', 'Xuất xứ', 'Trung Quốc'),
    ('DT589', 'SP100', 'Thời gian bảo hành', '12 tháng'),
    ('DT590', 'SP101', 'Chất liệu', 'Vải'),
    ('DT591', 'SP101', 'Kích thước sản phẩm', '35 x 25 x 1.3 cm'),
    ('DT592', 'SP101', 'Kích thước sử dụng', '13 inches'),
    ('DT593', 'SP101', 'Màu sắc', 'Đen'),
    ('DT594', 'SP101', 'Thương hiệu', 'Zadez'),
    ('DT595', 'SP101', 'Tính năng', 'Chống thấm'),
    ('DT596', 'SP101', 'Nguồn gốc', 'Trung Quốc'),
    ('DT597', 'SP102', 'Chất liệu', 'Vải'),
    ('DT598', 'SP102', 'Kích thước sử dụng', '15.6 inches'),
    ('DT599', 'SP102', 'Màu sắc', 'Đen, Xám'),
    ('DT600', 'SP102', 'Thương hiệu', 'Simtop'),
    ('DT601', 'SP102', 'Tính năng', 'Chống sốc'),
    ('DT602', 'SP102', 'Nguồn gốc', 'Trung Quốc'),
    ('DT603', 'SP103', 'Chất liệu', 'Vải Nylon'),
    ('DT604', 'SP103', 'Kích thước sản phẩm', '30*24*5'),
    ('DT605', 'SP103', 'Kích thước sử dụng', '12 inches'),
    ('DT606', 'SP103', 'Màu sắc', 'Xanh'),
    ('DT607', 'SP103', 'Thương hiệu', 'Tucano'),
    ('DT608', 'SP103', 'Tính năng', 'Dây đeo trợ lực, Thoáng khí'),
    ('DT609', 'SP103', 'Nguồn gốc', 'Trung Quốc'),
    ('DT610', 'SP104', 'Chất liệu', 'Vải Nylon Fabric'),
    ('DT611', 'SP104', 'Kích thước sản phẩm', '25.5 x 36.5 cm'),
    ('DT612', 'SP104', 'Kích thước sử dụng', '14 inches'),
    ('DT613', 'SP104', 'Màu sắc', 'Xanh đen'),
    ('DT614', 'SP104', 'Thương hiệu', 'Zadez'),
    ('DT615', 'SP104', 'Tính năng', 'Chống thấm'),
    ('DT616', 'SP104', 'Nguồn gốc', 'Trung Quốc'),
    ('DT617', 'SP056', 'Màn hình', '15.6"'),
    ('DT618', 'SP056', 'RAM', '8GB'),
    ('DT619', 'SP056', 'Bộ nhớ trong', '8GB'),
    ('DT620', 'SP056', 'CPU', 'Intel Celeron N4500'),
    ('DT621', 'SP056', 'Xuất xứ', 'Trung Quốc'),
    ('DT622', 'SP056', 'Thời gian ra mắt', '2021');
   
insert DanhGia (MaDG, MaSP, MaKH, DanhGia, NhanXet)
values
	('DG001', 'SP001', 'KH001', 5, 'Chất lượng sản phẩm tuyệt vời! Tôi rất hài lòng!'),
    ('DG002', 'SP001', 'KH004', 4, 'Sản phẩm bền lắm ạ!'),
    ('DG003', 'SP001', 'KH005', 5, 'Chất lượng sản phẩm tốt!'),
    ('DG004', 'SP002', 'KH003', 3, 'Sản phẩm đẹp!'),
    ('DG005', 'SP002', 'KH001', 4, 'Sản phẩm bền lắm ạ!'),
    ('DG006', 'SP002', 'KH002', 4, 'Tốt!'),
    ('DG007', 'SP005', 'KH001', 5, 'Sản phẩm bền lắm ạ!'),
	('DG020', 'SP059', 'KH001', 5, 'Chất lượng sản phẩm tuyệt vời! Tôi rất hài lòng!'),
    ('DG021', 'SP060', 'KH004', 4, 'Sản phẩm đẹp!'),
    ('DG022', 'SP060', 'KH005', 5, 'Chất lượng sản phẩm tốt!'),
    ('DG023', 'SP076', 'KH003', 3, 'Sản phẩm đẹp!'),
    ('DG024', 'SP076', 'KH001', 4, 'Sản phẩm bền lắm ạ!'),
    ('DG025', 'SP061', 'KH002', 4, 'Tốt!'),
    ('DG026', 'SP061', 'KH001', 5, 'Sản phẩm đẹp!');
    
insert Admin (MaAD, TenDangNhap, MatKhau, HoTen)
values
	('AD001', 'admin', '123', 'Nguyễn Phan Minh Thư');
	
insert DanhMucTin (MaDMT, TenDM)
values
	('DM001', 'Tin công nghệ'),
	('DM002', 'Review sản phẩm'),
	('DM003', 'Khuyến mãi');
    
insert TinTuc(MaTT, TieuDe, TomTat, NgayDang, MaAD, NoiDung, MaDMT, Anh)
values
	('TT001', 'Đây là 5 lý do bạn nên mua chiếc vivo Y33s ngay trong dịp cuối năm này', 'Phân khúc tầm trung luôn nhộn nhịp bởi các nhà sản xuất khá tập trung và mong muốn mang đến cho người dùng Việt Nam những trải nghiệm tốt nhất. Những ngày vừa qua, vivo Y33s đã tạo ra cơn sốt và hứa hẹn sẽ chiếm trọn niềm tin người dùng.', '2021-12-27', 'AD001', '<strong>1. Thiết kế mỏng nhẹ, khung viền phẳng 2.5D đẳng cấp</strong></br>Vivo luôn mang đến ngôn ngữ thiết kế mỏng nhẹ thời thượng cho smartphone của họ tại thị trường Việt Nam ở hầu như mọi phân khúc. vivo Y33s có độ dày chỉ 8mm và nặng 182g dù cho thiết kế màn hình lớn cùng viên pin dung lượng cao. Bên cạnh đó, khung viền phẳng 2.5D cũng sẽ giúp cho máy được cân bằng, tạo cảm giác cao cấp và thoải mái khi sử dụng.
    <br /><strong>2. Viên pin lớn, sạc siêu tốc tiết kiệm thời gian</strong></br>Vivo Y33s trang bị dung lượng pin 5000mAh giúp bạn có thể thoải mái sử dụng cả ngày mà không cần phải lo lắng vấn đề hết pin. Ngoài ra, Y33s còn được trang bị công nghệ Sạc Siêu Tốc 18W (9V-2A) và công nghệ vivo Energy Guardian (VEG) giúp sạc nhanh, giảm mức tiêu thụ năng lượng và quản lý năng lượng hiệu quả. Và đừng quên chức năng sạc ngược trên Y33s sẽ biến chiếc điện thoại của bạn thành một thiết bị sạc dự phòng tiện lợi.</br><strong>3. Cụm 3 camera sau siêu sắc nét</strong></br>
	Vivo Y33s trang bị camera chính với độ phân giải cao lên đến 50MP, giúp bạn dễ dàng ghi lại những khoảnh khắc đẹp nhất của cuộc sống với độ rõ nét. Thuật toán xóa phông độc quyền của vivo ở camera xóa phông 2MP được nâng cấp để làm cho hậu cảnh trông tự nhiên hơn và bạn dễ dàng khám phá thế giới nhỏ bé và thú vị ngay trước mắt bạn với khoảng cách lấy nét chỉ 4cm đến từ camera siêu cận. 
	<br/><strong>4. Hiệu năng vượt trội, đa nhiệm mượt mà</strong></br>
	Nói về hiệu năng, smartphone nhà vivo cũng không thua kém các đối thủ khác dù ở phân khúc giá như thế nào. Với vivo Y33s, máy được cung cấp sức mạnh bởi Helio G80, một con chip tầm trung được sản xuất tập trung vào việc chơi game, mang đến những trải nghiệm tốt nhất dù bạn sử dụng với tác vụ nào. ', 'DM002', 'tin1.jpg'),
	('TT002', 'Khám phá tuyệt tác xoay gập HP Spectre x360', 
	'Nếu bạn đang tìm một chiếc laptop vừa có vẻ ngoài đẹp mắt vừa có hiệu năng mạnh mẽ để nâng tầm phong cách thì Laptop HP Spectre X360 13-aw2101TU thuộc dòng laptop cao cấp này sẽ là sự lựa chọn lý tưởng dành cho bạn.', 	'2021-12-26', 	'AD001', 	'<strong>1. Thiết kế sắc sảo tựa như đá quý thu hút mọi ánh nhìn</strong></br>
    Mệnh danh là laptop đẹp nhất của HP, Laptop HP Spectre X360 13-aw2101TU 2K0B8PA được thiết kế theo phong cách hiện đại với các đường cắt CNC độc đáo. Bộ khung của máy được làm từ hợp kim nhôm nguyên khối với độ chính xác cao và chắc chắn, đồng thời bật lên đẳng cấp nhờ bản lề kép mạ chrome tỏa sáng từ mọi góc cạnh. Màu sắc xanh đen được cả người dùng nam và nữ yêu thích vì nó thể hiện sự tinh tế và tự tin đậm tính cá nhân dành cho người dùng.
    <br/><strong>2. Nhỏ gọn hơn cho hiệu quả tuyệt đỉnh</strong></br>
	Máy bên ngoài cầm tay khá chắc chắn với trọng lượng chỉ 1,2kg cùng kích thước 30,67 x 19,45 x 1,69 cm vô cùng nhỏ gọn. Chiếc laptop HP này sẽ là một người bạn đồng hành cùng bạn đến mọi nơi. Đây là máy tính đa chế độ nhỏ nhất thế giới với tỷ lệ màn hình trên thân máy đạt 90%.
    <br/><strong>3. Màn hình lộng lẫy cho trải nghiệm xem xuất sắc chưa từng thấy</strong></br>
	Chiếc máy nhỏ gọn này sở hữu màn hình OLED 4K hỗ trợ dải động cao HDR với sắc đen trung thực. Màn hình chống phản chiếu và tăng cường độ tương phản để nội dung hiển thị được rõ ràng và thoải mái ở mọi không gian sử dụng. Đây được xem là màn hình đẹp nhất trong nhiều năm trở lại đây.
	<br/><strong>4.Hiệu suất đỉnh cao, luôn bắt kịp nhịp sống hối hả</strong></br>
	Bộ vi xử lý Intel Core i7-1165G7 đem đến tốc độ xử lý cực nhanh và trơn tru với mọi tác vụ. Đây là dòng CPU Core i7 thuộc CPU Intel Core thế hệ thứ 11 với 4 nhân 8 luồng, bộ nhớ đệm 12MB và xung nhịp tối đa lên đến 4.7GHz. Cùng card đồ họa tích hợp Intel Iris Xe Graphics, bạn có thể chỉnh sửa ảnh và video mượt mà và trơn tru hơn nhờ hiệu suất và tốc độ đỉnh cao.','DM002', 'tin2.jpg'),
	('TT003','Tìm hiểu công nghệ Overstroke trên laptop ASUS','Hiện nay các dòng laptop gaming đang phổ biến với các game thủ. Ngoài cấu hình khủng, thiết kế đẹp, người dùng còn quan tâm đến bàn phím. Và khi nói về bàn phím không thể không nhắc tới ASUS Overstroke - công nghệ đã thay đổi cách nhìn của người dùng về laptop gaming, cho khả năng điều khiển nhanh và chính xác.','2021-12-28','AD001','<strong>1.Công nghệ ASUS Overstroke là gì?</strong></br>Công nghệ ASUS Overstroke là công nghệ độc quyền của ASUS. Công nghệ này cung cấp cho mỗi phím một hành trình phím rộng 1,8mm và tăng điểm truyền động cao hơn trong quy định để cải thiện khả năng phản hồi nhanh. Mỗi phím chỉ cần một lực tối đa cân bằng hoàn hảo là 62 gram (lực cần thiết để nhấn hoàn toàn phím xuống) để giữ cho mỗi hành trình dễ dàng. Công nghệ Overstroke tăng độ chính xác và tốc độ đầu vào với phản hồi nhanh, giúp người dùng một trải nghiệm hoàn hảo để chơi game FPS.
    <br/><strong>2.Công nghệ Overstroke hoạt động như thế nào?</strong></br>
    Các mẫu sản phẩm có công nghệ Overstroke (hình bên trái), các điểm kích hoạt của các phím sau khi được nhấn xuống 1/2 từ trên xuống để cho phép tốc độ truyền tín hiệu cao hơn. Trong khi đó, phím thông thường yêu cầu được nhấn xuống thêm 3/4 từ trên xuống để kích hoạt, điều này mang lại phản hồi chậm hơn.
    <br/><strong>3.Các kiểu máy nào được hỗ trợ công nghệ này?</strong></br>Hiện nay, có khá nhiều dòng laptop được trang bị công nghệ này. Các mẫu FX504 , FX505 và GL504 đều được trang bị giúp người dùng có trải nghiệm tốt hơn khi chơi game.','DM001', 'tin3.jpg'),
	('TT004','Giảm ngay 20% khi chọn mua balo – túi xách – túi chống sốc tại Hai Shop','Từ nay đến 31/12, khi chọn mua balo, túi xách, túi chống sốc của các thương hiệu Tucano, Simtop, Zadez và Targus tại Hai Shop, bạn sẽ được hưởng ưu đãi với mức giá rẻ hơn 20% so với giá bán trước đây.','2021-12-28','AD001','Theo đó, từ nay đến ngày 31/12, khách hàng sẽ được giảm ngay 20% khi chọn mua các loại balo túi xách, túi đeo chéo, túi chống sốc đến từ các thương hiệu nổi tiếng như Tucano, Simtop, Zadez và Targus tại Hai Shop, với mức giá ưu đãi chỉ từ 261.000 đồng là khách hàng đã có thể sở hữu những sản phẩm chất lượng, bền đẹp và tiết kiệm được chi phí.<br/>
	Với nhiều người, balo luôn là vật “bất khả ly thân” mỗi khi ra đường, thích hợp kể cả khi đi học, đi làm hoặc đi chơi rất tiện dụng mà vẫn lịch sự, hợp thời trang. Nếu bạn có ý định trang bị cho mình chiếc balo với chất lượng vượt trội cùng mức giá hợp lý thì không thể bỏ qua mẫu balo Tunaco Loop 15.6 inch của Hai Shop, hiện đang được ưu đãi giảm 20% giá chỉ còn 810.000 đồng.<br/>
	Ngoài balo, túi chống sốc cũng là một sản phẩm cần chuẩn bị để bảo vệ máy tính mỗi khi ra ngoài. Tại Hai Shop hiện đang có rất nhiều sản phẩm túi chống sốc hợp thời trang, chất lượng tốt, có mức giá ưu đãi chỉ từ 261.000 đồng đến từ các thương hiệu nổi tiếng như Simtop, Zadez và Targus để bạn lựa chọn. Bên cạnh những sản phẩm dành cho laptop từ 11-15 inch, tại FPT Shop còn có sẵn những mẫu túi chống sốc dành riêng cho từng dòng Macbook, vừa vặn đến từng milimet.<br/>
	Trong chương trình ưu đãi tháng 12, túi xách, túi đeo chéo cũng là một trong những sản phẩm được ưu đãi giảm 20% và rất được quan tâm dành cho những tín đồ yêu thích sự tiện lợi. Đơn cử như túi đeo chéo Tucano 11” được thiết kế từ chất liệu siệu nhẹ, bền, chống thấm nước nên bảo vệ tốt cho notebook và tablet cũng như khó bám bẩn, hiện đang được ưu đãi giảm 20%, chỉ còn 632.000 đồng khi mua tại Hai Shop.<br/>','DM003', 'tin4.jpg'),
	('TT005','Mua laptop, Hai Shop bảo hành đến 3 năm và lì xì đến 4 triệu','Từ ngày 01 - 31/01/2022, FPT Shop dành tặng thêm nhiều ưu đãi đặc biệt đến các bạn học sinh - sinh viên khi chọn mua laptop tại hệ thống: bảo hành đến 3 năm, lì xì đến 4 triệu đồng, trả góp 0% lãi suất...','2021-12-28','AD001','Chào đón năm 2022, Hai Shop dành tặng những ưu đãi hấp dẫn nhất đến tất cả các bạn học sinh, tân sinh viên, sinh viên khi chọn mua laptop từ ngày 01 - 31/01/2022. Cụ thể, Hai Shop tặng ngay đặc quyền bảo hành đến 3 năm. Đồng thời, khách hàng còn được giảm giá đến 4.000.000 đồng khi trả thẳng, được hưởng lãi suất 0% khi trả góp cũng như nhận thêm nhiều quà tặng thiết thực khác.<br/>
	Trong đó, bảo hành đến 3 năm là ưu đãi độc quyền chỉ có tại Hai Shop, cũng là một trong những ưu đãi hấp dẫn nhất từ trước đến nay. Ngoài thời gian bảo hành chính hãng từ 1 - 2 năm, Hai Shop sẽ tặng thêm 1 năm bảo hành nữa, nâng tổng thời gian bảo hành của máy lên đến 3 năm. 1 năm bảo hành tặng thêm có giá trị tương đương gần 10% giá máy, hỗ trợ rất nhiều nếu máy phát sinh lỗi trong thời gian hết hạn bảo hành của hãng, giúp khách hàng tiết kiệm tối đa chi phí, yên tâm sử dụng dài lâu.<br/>
	Ngoài ra, Hai Shop còn mạnh tay giảm giá cho toàn bộ laptop tại hệ thống: giảm đến 4.000.000 đồng cho laptop AVITA, Acer, Lenovo, Microsoft Surface, Gygabyte, Asus, Dell, HP, MSI, LG, Masstel, Chuwi, MacBook... áp dụng cho hình thức trả thẳng (tức thanh toán 100% giá máy).<br/>','DM003', 'tin5.jpg');
	
-- SELECT tl.* FROM TheLoai tl INNER JOIN DanhMuc dm on dm.MaDM = tl.MaDM WHERE tl.MaDM ='DM01';

/*
-- 1. Liệt kê những khách hàng đã đánh giá sản phẩm với 5 sao.
SELECT * FROM dbo.KhachHang
INNER JOIN dbo.DanhGia ON DanhGia.MaKH = KhachHang.MaKH
WHERE DanhGia = 5;

-- 2. liệt kê tất cả các sản phẩm có loại sản phâm là 'Sạc dự phòng' và từng được khách hàng đánh giá
SELECT * 
FROM dbo.SanPham
INNER JOIN dbo.TheLoai ON TheLoai.MaTL = SanPham.MaTL
INNER JOIN dbo.DanhGia ON DanhGia.MaSP = SanPham.MaSP
WHERE TenTL = 'Sạc dự phòng';

-- 3. tính số sản phẩm đã bán cho tới thời điểm hiện tại
SELECT SUM(SoLuongBan) AS soluong
FROM dbo.SanPham;

-- 4. Liệt kê thông tin khách hàng có họ là 'Huỳnh' mà có sdt kêt thúc là '430' và những khách hàng có họ là 'Nguyễn' mà có sdt kêt thúc là '428'
SELECT *
FROM dbo.KhachHang
WHERE HoTen LIKE N'Huỳnh%' AND SoDienThoai LIKE '%430'
UNION 
SELECT *
FROM dbo.KhachHang
WHERE HoTen LIKE N'Nguyễn%' AND SoDienThoai LIKE '%428';

-- 5. Liệt kê thông tin của toàn bộ thông tin san phẩm, yêu cầu sắp xếp giảm dần theo SoLuongCo và tăng dần theo Gia. 
SELECT *
FROM dbo.SanPham
ORDER BY SoLuongCo DESC, Gia ASC;

-- 1. Tạo các khung nhìn hiển thị các sản phẩm thuộc mỗi danh mục.
create view View_DienThoai
as
	select sanpham.* from sanpham
    inner join theloai on theloai.MaTL = sanpham.MaTL
    inner join danhmuc on danhmuc.MaDM = theloai.MaDM
    where TenDM = 'Điện thoại';
    
create view View_MayTinhBang
as
	select sanpham.* from sanpham
    inner join theloai on theloai.MaTL = sanpham.MaTL
    inner join danhmuc on danhmuc.MaDM = theloai.MaDM
    where TenDM = 'Máy tính bảng';

create view View_Laptop
as
	select sanpham.* from sanpham
    inner join theloai on theloai.MaTL = sanpham.MaTL
    inner join danhmuc on danhmuc.MaDM = theloai.MaDM
    where TenDM = 'Laptop';
    
create view View_PhuKien
as
	select sanpham.* from sanpham
    inner join theloai on theloai.MaTL = sanpham.MaTL
    inner join danhmuc on danhmuc.MaDM = theloai.MaDM
    where TenDM = 'Phụ kiện';
    
-- 2. Tạo thủ tục xóa khách hàng, sao cho thông tin về sổ địa chỉ của khách hàng đó cũng bị xóa theo.

-- Sử dụng DELIMITER để cho phép sử dụng dấu chấm phẩy.
DELIMITER //
drop procedure if exists Delete_KhachHang //

create procedure Delete_KhachHang(Id varchar(10))
begin
	delete from diachi
    where MaKH = Id;
    
	delete from khachhang
    where MaKH = Id;
end //
DELIMITER ;

call Delete_KhachHang('KH001');

-- 3. Tạo thủ tục hiển thị tất cả sản phẩm theo thứ tự n. Với n là tham số đầu vào, nhận các giá trị "moi nhat",
-- "cu nhat", "gia cao", "gia thap".

DELIMITER //
drop procedure if exists SapXepSanPham //

create procedure SapXepSanPham(ThuTu varchar(50))
begin
	if ThuTu = 'moi nhat' then
		select * from sanpham
        order by Id desc;
	elseif ThuTu = 'cu nhat' then
		select * from sanpham
		order by Id asc;
	elseif ThuTu = 'gia cao' then
		select * from sanpham
        order by Gia desc;
	elseif ThuTu = 'gia thap' then
		select * from sanpham
        order by Gia asc;
	else
		select * from sanpham;
	end if;
end //

DELIMITER ;

-- 4. Tạo thủ tục hiển thị sản phẩm không bán được trong x tháng qua. Với x là tham số đầu vào, x <= 12.

DELIMITER //
drop procedure if exists SanPhamTonKho //

create procedure SanPhamTonKho(KhoangTG int)
begin
	declare ThangHienTai, NamHienTai, ThangBatDau, NamBatDau int;
    set ThangHienTai = month(curdate()),  NamHienTai = year(curdate()), ThangBatDau = ThangHienTai - KhoangTG + 1, NamBatDau = NamHienTai;
    
    if (ThangBatDau < 0) then
		begin
			set ThangBatDau = 12 - (KhoangTG - ThangHienTai);
			set NamBatDau = NamHienTai - 1;
		end;
    end if;

	select * from sanpham
    where MaSP not in 
		(select MaSP from hoadon
        where (month(NgayLap) between ThangBatDau and ThangHienTai) and (year(NgayLap) between NamBatDau and NamHienTai));
        
end //

DELIMITER ;

-- 5. Tạo hàm trả về doanh thu của tháng x trong năm hiện tại. 

DELIMITER //
drop function if exists DoanhThuThang //

create function DoanhThuThang(Thang int)
returns int
DETERMINISTIC
begin
	declare tong int;
    set tong = 0;
    
	select sum(Gia - KhuyenMai) into tong from chitiethoadon cthd
 	inner join hoadon hd on hd.MaHD = cthd.MaHD
 	where month(NgayLap) = Thang
 	group by MaSP;
    
    return tong;
end //

DELIMITER ;

-- 6. Tạo trigger cập nhật số lượng hàng hóa khi có khách đặt hàng.

DELIMITER //
drop trigger if exists Trigger_DatHang //

create trigger Trigger_DatHang
before insert on chitiethoadon
for each row
begin
	update sanpham
    set SoLuongCo = SoLuongCo - new.SoLuong, SoLuongBan = SoLuongBan + new.SoLuong
    where sanpham.MaSP = new.MaSP;
end //

DELIMITER ;
*/

    
    
    
	
