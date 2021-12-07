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
                            <p>Thư</p>
                        </div>
                    </li>
                    <li><a href="index.php?controller=user&action=info"><i class="fas fa-user-edit"></i>    Thông tin tài khoản</a></li>
                    <li><a href="index.php?controller=user&action=password"><i class="fas fa-key"></i>    Thay đổi mật khẩu</a></li>
                    <li><a href="index.php?controller=user&action=order"><i class="far fa-list-alt"></i>    Đơn hàng đã đặt</a></li>
                    <li><a href="index.php?controller=user&action=address_list"><i class="far fa-address-book"></i>    Sổ địa chỉ</a></li>
                </ul>
            </div>
            <div class="user-info">
                <form action="#" method="post">
                    <div class="form-group">
                        <label class="text-inf">Mật khẩu cũ:</label><br>
                        <input type="password" name="name" id="name" class="form-control">
                    </div>
                    <div class="form-group">
                        <label class="text-inf">Mật khẩu mới:</label><br>
                        <input type="password" name="username" id="username" class="form-control">
                    </div>
                    <div class="form-group">
                        <label class="text-inf">Xác nhận mật khẩu mới:</label><br>
                        <input type="password" name="email" id="mail" class="form-control">
                    </div>
                    <div class="form-group">
                        <input style="margin-top: 20px;" type="submit" name="submit" class="btn btn-danger btn-md" value="CHỈNH SỬA">
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<?php require('views/client/layouts/footer.php'); ?>