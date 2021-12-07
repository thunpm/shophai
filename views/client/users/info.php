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
                        <label class="text-inf">Họ và tên:</label><br>
                        <input type="text" name="name" id="name" class="form-control">
                    </div>
                    <div class="form-group">
                        <label  class="text-inf">Số điện thoại:</label><br>
                        <input type="text" name="username" id="username" class="form-control">
                    </div>
                    <div class="form-group">
                        <label class="text-inf">Email:</label><br>
                        <input type="text" name="email" id="mail" class="form-control">
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
                        <input style="margin-top: 20px;" type="submit" name="submit" class="btn btn-danger btn-md" value="CHỈNH SỬA">
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<?php require('views/client/layouts/footer.php'); ?>