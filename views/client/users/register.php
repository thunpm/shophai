<?php require('views/client/layouts/header.php'); ?>
<?php require('views/client/layouts/menu.php'); ?>
<div class="login-block">
    <div id="login">
        <div class="container">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12">
                        <form id="login-form" class="form" action="index.php?controller=user&action=check_register" method="post">
                            <h4 class="text-center text-inf">ĐĂNG KÝ</h4>
                            <!-- <div class="form-group">
                                <label for="MaKH" class="text-inf">MaKH:</label><br>
                                <input type="text" name="MaKH" id="MaKH" class="form-control">
                            </div> -->
                            <div class="form-group">
                                <label for="HoTen" class="text-inf">Họ và tên:</label><br>
                                <input type="text" name="HoTen" id="HoTen" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="SoDienThoai" class="text-inf">Số điện thoại:</label><br>
                                <input type="text" name="SoDienThoai" id="SoDienThoai" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="TenDangNhap" class="text-inf">Tên đăng nhập:</label><br>
                                <input type="text" name="TenDangNhap" id="TenDangNhap" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="MatKhau" class="text-inf">Mật khẩu:</label><br>
                                <input type="text" name="MatKhau" id="MatKhau" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="XNMatKhau" class="text-inf">Xác nhận mật khẩu:</label><br>
                                <input type="text" name="XNMatKhau" id="XNMatKhau" class="form-control">
                            </div>
                            <div class="form-group">
                                <input style="margin-top: 20px;" type="submit" name="dangky" class="btn btn-danger btn-md" value="Đăng ký">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<?php require('views/client/layouts/footer.php'); ?>
