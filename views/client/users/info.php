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
            <h3 class="contact__heading" >LIÊN HỆ</h3>
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
                <?php
               
                    
                    if(isset($_SESSION['user'])&& (is_array($_SESSION['user']))){
                            extract($_SESSION['user']);
                    }
          
          ?>
                <form action="index.php?controller=user&action=info" method="post">
               
                <div class="form-group">
                       
                    </div>
                    <div class="form-group">
                        <label for="HoTen" class="text-inf">Họ và tên:</label><br>
                        <input type="text" name="HoTen" id="HoTen" class="form-control" value="<?php echo $HoTen?>">
					
                    </div>
                    <div class="form-group">
                        <label  for="SoDienThoai" class="text-inf">Số điện thoại:</label><br>
                       <input type="text" name="SoDienThoai" id="username" class="form-control" value="<?php echo $SoDienThoai?>"> 
                    </div>
                    <div class="form-group">
                        <label for="Email" class="text-inf">Email:</label><br>
                        <input type="text" name="Email" id="mail" class="form-control" value="<?php echo $Email?>"> 
                    </div>
                
                    
                    <div class="form-group">
                        <label class="text-inf">Giới tính:</label><br>
                        <div class="form-check">
                            <div class="form">
                                <input class="form-check-input" type="checkbox" value="" id="nam">
                                <label class="form-check-label" for="nam">
                                    Nam
                                </label>
                            </div>
                            <div class="form">
                                <input class="form-check-input" type="checkbox" value="" id="nu">
                                <label class="form-check-label" for="nu">
                                    Nữ
                                </label>
                            </div>
                        </div>
                    </div>
                   
                    <div class="form-group">
                    <input type="hidden" name="MaKH" id="MaKH" class="form-control"  value="<?php echo $MaKH?>">
                        <input style="margin-top: 20px;" type="submit" name="submit" class="btn btn-danger btn-md" value="CHỈNH SỬA">
                    </div>
                </form>
         
            </div>
        </div>
    </div>
</div>
<?php require('views/client/layouts/footer.php'); ?>
