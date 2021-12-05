<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<title><?php echo isset($title) ? $title : 'Giỏ hàng'; ?></title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<link rel="stylesheet" type="text/css" href="../../../assets/lib/font-awesome/css/all.css">
    <link rel="stylesheet" type="text/css" href="../../../assets/lib/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="../../../assets/stylesheets/client_style.css"/>
    <link rel="stylesheet" type="text/css" href="../../../assets/stylesheets/reset.css"/> -->
    <link rel="stylesheet" type="text/css" href="../../../assets/stylesheets/client_carts_style.css"/>
</head>

<body>
    <?php require('../layouts/header.php'); ?>
	<?php require('../layouts/menu.php'); ?>

	<div class="main">
			<div class="tittle">
				<h2>GIỎ HÀNG</h2>
			</div>
			
			<div class="contain">
				<table>
					<tr>
						<th width="500px">Tên sản phẩm</th>
						<th width="200px">Giá</th>
						<th width="300px">Số lượng</th>
						<th width="200px">Thành tiền</th>
						<th width="150px"></th>
					</tr>

					<tr>
						<td width="500px">
							<div class="cont-left">
								<a href="#"><img src="../../../assets/images/carts/hinh.png" alt=""/></a>
							</div>
							<div class="cont-right">
								<h4><a href="#">Điện Thoại Iphone 12</a></h4>
								<p>Thương hiệu: Apple</p>
								<p>Màu sắc: Trắng</p>
							</div>
							<div class="clr"></div>
						</td>

						<td>
							<p><span class="price">24.500.000 đ</span></p>
						</td>

						<td>
							<span class="tang">-</span><span class="number">1</span><span class="tang">+</span>
						</td>

						<td>
							<p><span class="price">24.500.000 đ</span></p>
						</td>

						<td>
							<span class="edit"><a href="#"><img src="../../../assets/images/carts/edit.png" width="30px" height="30px"/></a></span>
							<a href="#"><img src="../../../assets/images/carts/trash.png" width="30px" height="30px"/></a>
						</td>
					</tr>

					<tr>
						<td>
							<div class="cont-left">
								<a href="#"><img src="../../../assets/images/carts/hinh.png" alt=""/></a>
							</div>
							<div class="cont-right">
								<h4><a href="#">Điện Thoại Iphone 12</a></h4>
								<p>Thương hiệu: Apple</p>
								<p>Màu sắc: Trắng</p>
							</div>
							<div class="clr"></div>
						</td>

						<td>
							<p><span class="price">24.500.000 đ</span></p>
						</td>

						<td>
							<span class="tang">-</span><span class="number">1</span><span class="tang">+</span>
						</td>

						<td>
							<p><span class="price">24.500.000 đ</span></p>
						</td>

						<td>
							<span class="edit"><a href="#"><img src="../../../assets/images/carts/edit.png" width="30px" height="30px"/></a></span>
							<a href="#"><img src="../../../assets/images/carts/trash.png" width="30px" height="30px"/></a>
						</td>
					</tr>

					<tr>
						<td>
							<div class="cont-left">
								<a href="#"><img src="../../../assets/images/carts/hinh.png" alt=""/></a>
							</div>
							<div class="cont-right">
								<h4><a href="#">Điện Thoại Iphone 12</a></h4>
								<p>Thương hiệu: Apple</p>
								<p>Màu sắc: Trắng</p>
							</div>
							<div class="clr"></div>
						</td>

						<td>
							<p><span class="price">24.500.000 đ</span></p>
						</td>

						<td>
							<span class="tang">-</span><span class="number">1</span><span class="tang">+</span>
						</td>

						<td>
							<p><span class="price">24.500.000 đ</span></p>
						</td>

						<td>
							<span class="edit"><a href="#"><img src="../../../assets/images/carts/edit.png" width="30px" height="30px"/></a></span>
							<a href="#"><img src="../../../assets/images/carts/trash.png" width="30px" height="30px"/></a>
						</td>
					</tr>
				</table>

				<div class="count-left">
					<p>Tổng tiền: <span class="price">73.500.000 đ</span></p>
				</div>
				
				<div class="count-right">
					<a href="#">THANH TOÁN</a>	
				</div>
				<div class="clr"></div>
			</div>
		</div>

	<?php require('../layouts/footer.php'); ?>

	<script src="../../../assets/lib/jquery-3.3.1.min.js"></script>
    <script src="../../../assets/lib/popper.min.js"></script>
    <script src="../../../assets/lib/bootstrap/js/bootstrap.min.js"></script>
</body>