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
    ('SP033', 'Realme 8 Pro 8GB - 128GB', 'Realme 8 Pro lấy cảm hứng từ vũ trụ huyền bí, phiên bản màu đen mô phỏng bầu trời đêm huyền ảo với những vì tinh tú lấp lánh. Khẩu hiệu dám bứt phá “Dare to leap” được in lớn phá cách trên mặt lưng, thể hiện cá tính nổi bật. Dù có vẻ ngoài đơn giản nhưng trên thực tế realme 8 Pro được hoàn thiện từ quy trình chống lóa pha lê hoàn toàn mới, tạo nên thiết kế cuốn hút, đầy chiều sâu. Độ mỏng nhẹ ấn tượng và cảm giác mềm mại khi chạm vào giúp điện thoại hoàn hảo trong lòng bàn tay.', 100, 0, 8690000, 1200000, 'LSP007');

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
    ('HA049', 'SP033', 'realme-8-pro-1.jpg');
    
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
    ('DT198', 'SP033', 'Thời gian ra mắt', '04/2021');
   
insert DanhGia (MaDG, MaSP, MaKH, DanhGia, NhanXet)
values
	('DG001', 'SP001', 'KH001', 5, 'Chất lượng sản phẩm tuyệt vời! Tôi rất hài lòng!'),
    ('DG002', 'SP001', 'KH004', 4, ''),
    ('DG003', 'SP001', 'KH005', 5, 'Chất lượng sản phẩm tốt!'),
    ('DG004', 'SP002', 'KH003', 3, 'Sản phẩm đẹp!'),
    ('DG005', 'SP002', 'KH001', 4, ''),
    ('DG006', 'SP002', 'KH002', 4, 'Tốt!'),
    ('DG007', 'SP005', 'KH001', 5, '');
    
insert Admin (MaAD, TenDangNhap, MatKhau, HoTen)
values
	('AD001', 'admin', '123', 'Nguyễn Phan Minh Thư');

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


    
    
    
	
