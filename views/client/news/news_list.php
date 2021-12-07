<?php require('views/client/layouts/header.php'); ?>
<?php require('views/client/layouts/menu.php'); ?>

<div class="main">
	<ul class="breadcrum">
        <li class="active"><a href="#" class="breadcrum__active">Trang chủ</a> <span class="active">/&nbsp</span></li>                         
        <li class="active">Tin tức</li>
    </ul> 

	<div class="title">
		<div class="title-left">
			<h3>Tin tức</h3>
		</div>

		<div class="title-right">
			<a href="#">Tin công nghệ</a><a href="#">Review sản phẩm</a><a href="#" style="background-color: #ED5323;">Khuyến mãi</a> 
		</div>

		<div class="clr"></div>
	</div>

	<div class="content">
		<h3><a href="#">Khuyến mãi</a></h3>

		<ul class="list">
			<li>
				<a href="index.php?controller=news&action=news_detail" class="cont">
					<div class="cont-left">
						<img src="assets/images/news/sale.jpg"/>
					</div>

					<div class="cont-right">
						<h4>HAI SHOP GIẢM 500.000Đ CHO KHÁCH HÀNG MUA IPHONE THANH TOÁN QUA ZALOPAY</h4>
						<p><span class="time">14:56</span><span class="date">14/10/2021</span></p>
						<p>Dịch này, ở nhà đặt mua online Iphone 11 VN/A, Iphone 12 VN/A và Iphone 12 Mini VN/A giảm sốc từ ngày 28/06/2021 của Hai Shop thôi ạ!</p>
					</div>

					<div class="clr"></div>
				</a>
			</li>

			<li>
				<a href="index.php?controller=news&action=news_detail" class="cont">
					<div class="cont-left">
						<img src="assets/images/news/sale.jpg"/>
					</div>

					<div class="cont-right">
						<h4>HAI SHOP GIẢM 500.000Đ CHO KHÁCH HÀNG MUA IPHONE THANH TOÁN QUA ZALOPAY</h4>
						<p><span class="time">14:56</span><span class="date">14/10/2021</span></p>
						<p>Dịch này, ở nhà đặt mua online Iphone 11 VN/A, Iphone 12 VN/A và Iphone 12 Mini VN/A giảm sốc từ ngày 28/06/2021 của Hai Shop thôi ạ!</p>
					</div>

					<div class="clr"></div>
				</a>
			</li>

			<li>
				<a href="index.php?controller=news&action=news_detail" class="cont">
					<div class="cont-left">
						<img src="assets/images/news/sale.jpg"/>
					</div>

					<div class="cont-right">
						<h4>HAI SHOP GIẢM 500.000Đ CHO KHÁCH HÀNG MUA IPHONE THANH TOÁN QUA ZALOPAY</h4>
						<p><span class="time">14:56</span><span class="date">14/10/2021</span></p>
						<p>Dịch này, ở nhà đặt mua online Iphone 11 VN/A, Iphone 12 VN/A và Iphone 12 Mini VN/A giảm sốc từ ngày 28/06/2021 của Hai Shop thôi ạ!</p>
					</div>

					<div class="clr"></div>
				</a>
			</li>

			<li>
				<a href="index.php?controller=news&action=news_detail" class="cont">
					<div class="cont-left">
						<img src="assets/images/news/sale.jpg"/>
					</div>

					<div class="cont-right">
						<h4>HAI SHOP GIẢM 500.000Đ CHO KHÁCH HÀNG MUA IPHONE THANH TOÁN QUA ZALOPAY</h4>
						<p><span class="time">14:56</span><span class="date">14/10/2021</span></p>
						<p>Dịch này, ở nhà đặt mua online Iphone 11 VN/A, Iphone 12 VN/A và Iphone 12 Mini VN/A giảm sốc từ ngày 28/06/2021 của Hai Shop thôi ạ!</p>
					</div>

					<div class="clr"></div>
				</a>
			</li>
		</ul>
		
		<!-- phân trang -->
		<ul class="pagination product__pagination">
		<li class="pagination-item">
			<a href="" class="pagination-item__link">
				<i class="pagination-item__icon fas fa-angle-left"></i>
			</a>
		</li>
		<li class="pagination-item pagination-item--active">
			<a href="" class="pagination-item__link">1</a>
		</li>
		<li class="pagination-item">
			<a href="" class="pagination-item__link">2</a>
		</li>
		<li class="pagination-item">
			<a href="" class="pagination-item__link">3</a>
		</li>
		<li class="pagination-item">
			<a href="" class="pagination-item__link">4</a>
		</li>
		<li class="pagination-item">
			<a href="" class="pagination-item__link">5</a>
		</li>
		<li class="pagination-item">
			<a href="" class="pagination-item__link">...</a>
		</li>
		<li class="pagination-item">
			<a href="" class="pagination-item__link">14</a>
		</li>
		<li class="pagination-item">
			<a href="" class="pagination-item__link">
				<i class="pagination-item__icon fas fa-angle-right"></i>
			</a>
		</li>
		</ul>

	</div>
</div>

<?php require('views/client/layouts/footer.php'); ?>