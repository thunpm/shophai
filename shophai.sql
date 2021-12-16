drop database shophai;

create database shophai;

use shophai;

create table Customer (
	Id_Customer varchar(10),
    Username nvarchar(50),
    Password nvarchar(50),
    Fullname nvarchar(50),
    PhoneNumber varchar(12),
    Email varchar(50),
    Gender nvarchar(50), -- giới tính
    Birthday date,
    
    primary key (Id_Customer)
);

create table Address (
	Id_Address varchar(10),
    Id_Customer varchar(10),
    Province nvarchar(500), -- tỉnh
    District nvarchar(500), -- huyện
    Ward nvarchar(500), -- xã
    Street nvarchar(500), -- tên đường, số nhà, địa chỉ cụ thể
    Note nvarchar(500),
    DefaultAddress bit default(0),
    
    primary key (Id_Address),
    foreign key (Id_Customer) references Customer (Id_Customer)
);

insert Customer(Id_Customer, Username, Password, Fullname, PhoneNumber)
values
	('KH001', 'thu', '123', N'Nguyễn Phan Minh Thư', '0898154428');
    
-- danh mục
CREATE TABLE Category (
	Id_Category VARCHAR(10) PRIMARY KEY,
	Name_Category NVARCHAR(50) NOT NULL
);

-- loại sản phẩm
 CREATE TABLE ProductType (
  Id_ProductType VARCHAR(10) PRIMARY KEY,
  Name_ProductType NVARCHAR(50) NOT NULL,
  Id_Category VARCHAR(10) NOT NULL,
  FOREIGN KEY (Id_Category) REFERENCES dbo.Category
);

-- sản phẩm
CREATE TABLE Product (
	Id_Product VARCHAR(10) PRIMARY KEY,
	Name_Product VARCHAR(50) NOT NULL,
	Content text NOT NULL,
	Price long NOT NULL,
	Discount NVARCHAR(10) NOT NULL, -- giảm giá
    Sold NVARCHAR(20) NOT NULL,
	Id_ProductType VARCHAR(10) NOT NULL,
	FOREIGN KEY (Id_ProductType) REFERENCES dbo.ProductType
);

-- giỏ hàng
create table Cart (
	Id_Product varchar(10) not null,
	Id_Customer varchar(10) not null,
	Quantily int,
	primary key (Id_Product, Id_Customer),
	constraint KN_PD foreign key (Id_Product) references Product(Id_Product) on delete cascade,
	constraint KN_CT foreign key (Id_Customer) references Customer(Id_Customer) on delete cascade
);

-- hóa đon
create table Bill (
	Id_Bill varchar(10) not null,
	Id_Customer varchar(10) not null,
	Date datetime,
	primary key (Id_Bill),
	constraint KN_PD foreign key (Id_Customer) references Customer(Id_Customer) on delete cascade
);

-- chi tiết hóa đơn
create table DetailBill(
	Id_Bill varchar(10) not null,
	Id_Product varchar(10) not null,
	Quantily int,
	Price float,
	Discount float, -- giam gia
	primary key (Id_Bill, Id_Product),
	constraint KN_Bill foreign key (Id_Bill) references Bill(Id_Bill) on delete cascade,
	constraint KN_PD foreign key (Id_Product) references Product(Id_Product) on delete cascade
);

create table Picture(
	Id_Picture varchar(10) not null,
	Id_Product varchar(10) not null,
	primary key (Id_Picture),
	constraint KN_PD foreign key (Id_Product) references Product(Id_Product) on delete cascade
);
    
    
    
	
