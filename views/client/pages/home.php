<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<title><?php echo isset($title) ? $title : 'Trang chủ'; ?></title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<link rel="stylesheet" type="text/css" href="../../../assets/lib/font-awesome/css/all.css">
    <link rel="stylesheet" type="text/css" href="../../../assets/lib/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="../../../assets/stylesheets/client_style.css"/>
</head>

<body>
    <?php require('../layouts/header.php'); ?>
	<?php require('../layouts/menu.php'); ?>
	<div class="main-block">
		<div class="content">
			<div class="banner">
				<div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel">
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="../../../assets/images/banners/banner-1.jpg">
						</div>
						<div class="carousel-item">
							<img src="../../../assets/images/banners/banner-2.jpg">
						</div>
						<div class="carousel-item">
							<img src="../../../assets/images/banners/banner-3.jpg">
						</div>
						<div class="carousel-item">
							<img src="../../../assets/images/banners/banner-4.jpg">
						</div>
						<div class="carousel-item">
							<img src="../../../assets/images/banners/banner-5.jpg">
						</div>
					</div>
				</div>
			</div>
			<div class="product-block">
				<div class="product">
					<div class="title-block">
						<div class="title">Điện thoại bán chạy</div>
						<div class="kind">
							<a href="#">iPhone</a>
							<a href="#">Samsung</a>
							<a href="#">ASUS</a>
							<a href="#">Xiaomi</a>
						</div>
					</div>
					<div class="card-list">
						<div class="card">
							<img class="card-img-top" src="../../../assets/images/products/minhhoa.jpg" alt="Card image cap">
							<div class="card-body">
								<h5 class="card-title">Iphone</h5>
								<div class="card-text">
									<p>CPU: A14 Bionic</p>
									<p>Màn hình: 6.1"</p>
									<p>RAM: 4GB</p>
									<p>Bộ nhớ trong: 64GB</p>
									<p class="gia-goc">21,999,000</p>
									<p class="gia-km">19,999,000</p>
								</div>
								<a href="#" class="btn btn-danger">ĐẶT HÀNG</a>
							</div>
						</div>
						<div class="card">
							<img class="card-img-top" src="../../../assets/images/products/minhhoa.jpg" alt="Card image cap">
							<div class="card-body">
								<h5 class="card-title">Iphone</h5>
								<div class="card-text">
									<p>CPU: A14 Bionic</p>
									<p>Màn hình: 6.1"</p>
									<p>RAM: 4GB</p>
									<p>Bộ nhớ trong: 64GB</p>
									<p class="gia-goc">21,999,000</p>
									<p class="gia-km">19,999,000</p>
								</div>
								<a href="#" class="btn btn-danger">ĐẶT HÀNG</a>
							</div>
						</div>
						<div class="card">
							<img class="card-img-top" src="../../../assets/images/products/minhhoa.jpg" alt="Card image cap">
							<div class="card-body">
								<h5 class="card-title">Iphone</h5>
								<div class="card-text">
									<p>CPU: A14 Bionic</p>
									<p>Màn hình: 6.1"</p>
									<p>RAM: 4GB</p>
									<p>Bộ nhớ trong: 64GB</p>
									<p class="gia-goc">21,999,000</p>
									<p class="gia-km">19,999,000</p>
								</div>
								<a href="#" class="btn btn-danger">ĐẶT HÀNG</a>
							</div>
						</div>
						<div class="card">
							<img class="card-img-top" src="../../../assets/images/products/minhhoa.jpg" alt="Card image cap">
							<div class="card-body">
								<h5 class="card-title">Iphone</h5>
								<div class="card-text">
									<p>CPU: A14 Bionic</p>
									<p>Màn hình: 6.1"</p>
									<p>RAM: 4GB</p>
									<p>Bộ nhớ trong: 64GB</p>
									<p class="gia-goc">21,999,000</p>
									<p class="gia-km">19,999,000</p>
								</div>
								<a href="#" class="btn btn-danger">ĐẶT HÀNG</a>
							</div>
						</div>
					</div>
				</div>
				<div class="product">
					<div class="title-block">
						<div class="title">Tablet bán chạy</div>
						<div class="kind">
							<a href="#">iPad</a>
						</div>
					</div>
					<div class="card-list">
						<div class="card">
							<img class="card-img-top" src="../../../assets/images/products/minhhoa2.jpg" alt="Card image cap">
							<div class="card-body">
								<h5 class="card-title">iPad</h5>
								<div class="card-text">
									<p>Màn hình: 6.1"</p>
									<p>RAM: 4GB</p>
									<p>Bộ nhớ trong: 64GB</p>
									<p class="gia-goc">21,999,000</p>
									<p class="gia-km">19,999,000</p>
								</div>
								<a href="#" class="btn btn-danger">ĐẶT HÀNG</a>
							</div>
						</div>
						<div class="card">
							<img class="card-img-top" src="../../../assets/images/products/minhhoa2.jpg" alt="Card image cap">
							<div class="card-body">
								<h5 class="card-title">iPad</h5>
								<div class="card-text">
									<p>Màn hình: 6.1"</p>
									<p>RAM: 4GB</p>
									<p>Bộ nhớ trong: 64GB</p>
									<p class="gia-goc">21,999,000</p>
									<p class="gia-km">19,999,000</p>
								</div>
								<a href="#" class="btn btn-danger">ĐẶT HÀNG</a>
							</div>
						</div>
						<div class="card">
							<img class="card-img-top" src="../../../assets/images/products/minhhoa2.jpg" alt="Card image cap">
							<div class="card-body">
								<h5 class="card-title">iPad</h5>
								<div class="card-text">
									<p>Màn hình: 6.1"</p>
									<p>RAM: 4GB</p>
									<p>Bộ nhớ trong: 64GB</p>
									<p class="gia-goc">21,999,000</p>
									<p class="gia-km">19,999,000</p>
								</div>
								<a href="#" class="btn btn-danger">ĐẶT HÀNG</a>
							</div>
						</div>
						<div class="card">
							<img class="card-img-top" src="../../../assets/images/products/minhhoa2.jpg" alt="Card image cap">
							<div class="card-body">
								<h5 class="card-title">iPad</h5>
								<div class="card-text">
									<p>Màn hình: 6.1"</p>
									<p>RAM: 4GB</p>
									<p>Bộ nhớ trong: 64GB</p>
									<p class="gia-goc">21,999,000</p>
									<p class="gia-km">19,999,000</p>
								</div>
								<a href="#" class="btn btn-danger">ĐẶT HÀNG</a>
							</div>
						</div>
					</div>
				</div>
				<div class="product">
					<div class="title-block">
						<div class="title">Laptop bán chạy</div>
						<div class="kind">
							<a href="#">hp</a>
							<a href="#">Samsung</a>
							<a href="#">ASUS</a>
							<a href="#">DELL</a>
						</div>
					</div>
					<div class="card-list">
						<div class="card">
							<img class="card-img-top" src="../../../assets/images/products/minhhoa3.jpg" alt="Card image cap">
							<div class="card-body">
								<h5 class="card-title">ASUS</h5>
								<div class="card-text">
									<p>CPU: Core i5</p>
									<p>Màn hình: 14"</p>
									<p>RAM: 4GB</p>
									<p>Ổ cứng: SSD 512GB</p>
									<p class="gia-goc">21,999,000</p>
									<p class="gia-km">19,999,000</p>
								</div>
								<a href="#" class="btn btn-danger">ĐẶT HÀNG</a>
							</div>
						</div>
						<div class="card">
							<img class="card-img-top" src="../../../assets/images/products/minhhoa3.jpg" alt="Card image cap">
							<div class="card-body">
								<h5 class="card-title">ASUS</h5>
								<div class="card-text">
									<p>CPU: Core i5</p>
									<p>Màn hình: 14"</p>
									<p>RAM: 4GB</p>
									<p>Ổ cứng: SSD 512GB</p>
									<p class="gia-goc">21,999,000</p>
									<p class="gia-km">19,999,000</p>
								</div>
								<a href="#" class="btn btn-danger">ĐẶT HÀNG</a>
							</div>
						</div>
						<div class="card">
							<img class="card-img-top" src="../../../assets/images/products/minhhoa3.jpg" alt="Card image cap">
							<div class="card-body">
								<h5 class="card-title">ASUS</h5>
								<div class="card-text">
									<p>CPU: Core i5</p>
									<p>Màn hình: 14"</p>
									<p>RAM: 4GB</p>
									<p>Ổ cứng: SSD 512GB</p>
									<p class="gia-goc">21,999,000</p>
									<p class="gia-km">19,999,000</p>
								</div>
								<a href="#" class="btn btn-danger">ĐẶT HÀNG</a>
							</div>
						</div>
						<div class="card">
							<img class="card-img-top" src="../../../assets/images/products/minhhoa3.jpg" alt="Card image cap">
							<div class="card-body">
								<h5 class="card-title">ASUS</h5>
								<div class="card-text">
									<p>CPU: Core i5</p>
									<p>Màn hình: 14"</p>
									<p>RAM: 4GB</p>
									<p>Ổ cứng: SSD 512GB</p>
									<p class="gia-goc">21,999,000</p>
									<p class="gia-km">19,999,000</p>
								</div>
								<a href="#" class="btn btn-danger">ĐẶT HÀNG</a>
							</div>
						</div>
					</div>
				</div>
				<div class="product">
					<div class="title-block">
						<div class="title">Phụ kiện bán chạy</div>
						<div class="kind">
							<a href="#">Apple Watch</a>
							<a href="#">Tai nghe</a>
							<a href="#">Loa</a>
							<a href="#">Sạc</a>
						</div>
					</div>
					<div class="card-list">
						<div class="card">
							<img class="card-img-top" src="../../../assets/images/products/minhhoa4.jpg" alt="Card image cap">
							<div class="card-body">
								<h5 class="card-title">AirPods</h5>
								<div class="card-text">
									<p>Hộp sạc dây</p>
									<p class="gia-goc">21,999,000</p>
									<p class="gia-km">19,999,000</p>
								</div>
								<a href="#" class="btn btn-danger">ĐẶT HÀNG</a>
							</div>
						</div>
						<div class="card">
							<img class="card-img-top" src="../../../assets/images/products/minhhoa4.jpg" alt="Card image cap">
							<div class="card-body">
								<h5 class="card-title">AirPods</h5>
								<div class="card-text">
									<p>Hộp sạc dây</p>
									<p class="gia-goc">21,999,000</p>
									<p class="gia-km">19,999,000</p>
								</div>
								<a href="#" class="btn btn-danger">ĐẶT HÀNG</a>
							</div>
						</div>
						<div class="card">
							<img class="card-img-top" src="../../../assets/images/products/minhhoa4.jpg" alt="Card image cap">
							<div class="card-body">
								<h5 class="card-title">AirPods</h5>
								<div class="card-text">
									<p>Hộp sạc dây</p>
									<p class="gia-goc">21,999,000</p>
									<p class="gia-km">19,999,000</p>
								</div>
								<a href="#" class="btn btn-danger">ĐẶT HÀNG</a>
							</div>
						</div>
						<div class="card">
							<img class="card-img-top" src="../../../assets/images/products/minhhoa4.jpg" alt="Card image cap">
							<div class="card-body">
								<h5 class="card-title">AirPods</h5>
								<div class="card-text">
									<p>Hộp sạc dây</p>
									<p class="gia-goc">21,999,000</p>
									<p class="gia-km">19,999,000</p>
								</div>
								<a href="#" class="btn btn-danger">ĐẶT HÀNG</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<?php require('../layouts/footer.php'); ?>

	<script src="../../../assets/lib/jquery-3.3.1.min.js"></script>
    <script src="../../../assets/lib/popper.min.js"></script>
    <script src="../../../assets/lib/bootstrap/js/bootstrap.min.js"></script>
</body>