<div class="header">
   	<div class="logo">
   		<a href="#">
            <img src="../../../assets/images/commons/logo.png"/>
        </a>
   	</div>
    <div class="slogan">
   		<p style="font-family: cursive; text-align: center;">HAI SHOP</p>
        <p>Hàng điện tử không bao giờ tử</p>
   	</div>
   	<div class="find">
		<div class="search-box">
			<form action="#" method="POST" onsubmit="return check()">
           		<input id="searchText" type="text" placeholder="Nhập tên sách hoặc tác giả cần tìm" name="searchText" value="">
           		<button type="submit" class="fa fa-search"></button>
           	</form>
        </div>
   	</div>
    <div class="login-cart">
		<a href="../pages/login.php">
			<span class="far fa-user"></span>
			<?php
				// Khởi tạo session PHP nếu chưa khởi tạo
				if (session_id() === '')
				session_start();

				if( isset( $_SESSION['user'] ) ) {
			?>
				<div class="dropdown ">
					<a data-toggle="dropdown" href="#">
						Tên người dùng
					</a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="#">Thông tin tài khoản</a></li>
						<li><a class="dropdown-item" href="#">Thay đổi mật khẩu</a></li>
						<li><a class="dropdown-item" href="#">Đơn hàng đã đặt</a></li>
						<li><a class="dropdown-item" href="#">Sổ địa chỉ</a></li>
						<li><a class="dropdown-item" href="#">Đăng xuất</a></li>
					</ul>
				</div>
			<?php
				} else {	
			?>
				Đăng nhập
			<?php
				}
			?>
		</a>
   	</div>
   	<div class="login-cart">
   		<a href="showCart">
			<span class="fas fa-shopping-cart"></span>
			<t id="text-gio-hang">Giỏ hàng</t>
		</a>
   	</div>
   	
   	<script type="text/javascript">
   		function check() {
   			var s = document.getElementById('searchText').value;
   			
   			if (s == null || s == "") {
   				return false;
   			}
   			
   			return true;
   		}
   	</script>
</div>