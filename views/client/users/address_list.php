<?php
	if (isset($_SESSION['user'])==false) {
        header("location:index.php?controller=user&action=check_login");
        exit();
    } 

?>
<?php require('views/client/layouts/header.php'); ?>
<?php require('views/client/layouts/menu.php'); ?>
<div class="main-block">
    <div class="content">
        <div class="contact__title">
            <h3 class="contact__heading" >THÔNG TIN TÀI KHOẢN</h3>
        </div>
        <div class="user-info-block">
            <div class="list-user-info">
                <ul>
                    <li>
                        <i class="far fa-user-circle"></i>
                        <div>
                            <p>Tài khoản</p>
                           <p><?php echo $TenDangNhap;?></p>
                        </div>
                    </li>
                    <li><a href="index.php?controller=user&action=info"><i class="fas fa-user-edit"></i>    Thông tin tài khoản</a></li>
                    <li><a href="index.php?controller=user&action=password"><i class="fas fa-key"></i>    Thay đổi mật khẩu</a></li>
                    <li><a href="index.php?controller=user&action=order"><i class="far fa-list-alt"></i>    Đơn hàng đã đặt</a></li>
                    <li><a href="index.php?controller=user&action=address_list"><i class="far fa-address-book"></i>    Sổ địa chỉ</a></li>
                </ul>
            </div>
            <div class="user-info">
                <div class="add-address">
                    <a href="#">+ Thêm địa chỉ</a>
                </div>
		      <?php
               
                    
               if(isset($_SESSION['user_add'])&& (is_array($_SESSION['user_add']))){
                       extract($_SESSION['user_add']);
               }
     
     ?>
                <div class="list-address">
                    <div class="address">
                        <div class="info">
                            <ul>
                                <li>Tên:<?php echo $HoTen?></li>
                                <li>Địa chỉ: <?php echo $Tinh  ?></li>
                                <li>Số điện thoại:<?php echo $SoDienThoai?></li>
                            </ul>
                        </div>
                        <div class="info">
                            <p class="mac-dinh">Địa chỉ mặc định</p>
                        </div>
                        <div class="info">
                            <a href="#">Chỉnh sửa</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<?php require('views/client/layouts/footer.php'); ?>
