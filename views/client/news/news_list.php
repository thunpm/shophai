<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<title><?php echo isset($title) ? $title : 'Trang chủ'; ?></title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<link rel="stylesheet" type="text/css" href="../../../assets/lib/font-awesome/css/all.css">
    <link rel="stylesheet" type="text/css" href="../../../assets/lib/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="../../../assets/stylesheets/client_style.css"/>
    <link rel="stylesheet" type="text/css" href="../../../assets/stylesheets/reset.css"/> -->
    <link rel="stylesheet" type="text/css" href="../../../assets/stylesheets/client_news_style.css"/>
</head>

<body>
    <?php require('../layouts/header.php'); ?>
	<?php require('../layouts/menu.php'); ?>

	<div class="main">
			<div class="tt">
				<a href="#">Trang chủ</a><span class="ngoac"> > </span><a href="#">Tin tức</a><span class="ngoac"> > </span><a href="#">Khuyến mãi</a>
			</div>

			<div class="title">
				<div class="title-left">
					<h2>Tin tức</h2>
				</div>

				<div class="title-right">
					<a href="#">Tin công nghệ</a><a href="#">Review sản phẩm</a><a href="#" style="background-color: #ED5323;">Khuyến mãi</a> 
				</div>

				<div class="clr"></div>
			</div>

			<div class="content">
				<h3><a href="#">Khuyến mãi</a></h3>

				<ul>
					<li>
						<div class="cont">
							<div class="cont-left">
								<a href="#"><img src="../../../assets/images/news/sale.jpg"/></a>
							</div>

							<div class="cont-right">
								<h4><a href="#">HAI SHOP GIẢM 500.000Đ CHO KHÁCH HÀNG MUA IPHONE THANH TOÁN QUA ZALOPAY</a></h4>
								<p><span class="time">14:56</span><span class="date">14/10/2021</span></p>
								<p>Dịch này, ở nhà đặt mua online Iphone 11 VN/A, Iphone 12 VN/A và Iphone 12 Mini VN/A giảm sốc từ ngày 28/06/2021 của Hai Shop thôi ạ!</p>
							</div>

							<div class="clr"></div>
						</div>
					</li>

					<li>
						<div class="cont">
							<div class="cont-left">
								<a href="#"><img src="../../../assets/images/news/sale.jpg"/></a>
							</div>

							<div class="cont-right">
								<h4><a href="#">HAI SHOP GIẢM 500.000Đ CHO KHÁCH HÀNG MUA IPHONE THANH TOÁN QUA ZALOPAY</a></h4>
								<p><span class="time">14:56</span><span class="date">14/10/2021</span></p>
								<p>Dịch này, ở nhà đặt mua online Iphone 11 VN/A, Iphone 12 VN/A và Iphone 12 Mini VN/A giảm sốc từ ngày 28/06/2021 của Hai Shop thôi ạ!</p>
							</div>

							<div class="clr"></div>
						</div>
					</li>

					<li>
						<div class="cont">
							<div class="cont-left">
								<a href="#"><img src="../../../assets/images/news/sale.jpg"/></a>
							</div>

							<div class="cont-right">
								<h4><a href="#">HAI SHOP GIẢM 500.000Đ CHO KHÁCH HÀNG MUA IPHONE THANH TOÁN QUA ZALOPAY</a></h4>
								<p><span class="time">14:56</span><span class="date">14/10/2021</span></p>
								<p>Dịch này, ở nhà đặt mua online Iphone 11 VN/A, Iphone 12 VN/A và Iphone 12 Mini VN/A giảm sốc từ ngày 28/06/2021 của Hai Shop thôi ạ!</p>
							</div>

							<div class="clr"></div>
						</div>
					</li>

					<li>
						<div class="cont">
							<div class="cont-left">
								<a href="#"><img src="../../../assets/images/news/sale.jpg"/></a>
							</div>

							<div class="cont-right">
								<h4><a href="#">HAI SHOP GIẢM 500.000Đ CHO KHÁCH HÀNG MUA IPHONE THANH TOÁN QUA ZALOPAY</a></h4>
								<p><span class="time">14:56</span><span class="date">14/10/2021</span></p>
								<p>Dịch này, ở nhà đặt mua online Iphone 11 VN/A, Iphone 12 VN/A và Iphone 12 Mini VN/A giảm sốc từ ngày 28/06/2021 của Hai Shop thôi ạ!</p>
							</div>

							<div class="clr"></div>
						</div>
					</li>
				</ul>
				
				<div class="menuu">
				<p>< <span><a href="#" style="color: #ED5323;">1</a></span><span><a href="#">2</a></span><span><a href="#">3</a></span>...<span><a href="#">8</a></span> ></p>
				</div>
				<div class="clr"></div>
			</div>

		</div>

	<?php require('../layouts/footer.php'); ?>

	<script src="../../../assets/lib/jquery-3.3.1.min.js"></script>
    <script src="../../../assets/lib/popper.min.js"></script>
    <script src="../../../assets/lib/bootstrap/js/bootstrap.min.js"></script>
</body>