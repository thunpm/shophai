<?php require('views/client/layouts/header.php'); ?>
<?php require('views/client/layouts/menu.php'); ?>
<div class="login-block">
    <div id="login">
        <div class="container">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12">
                        <p style="margin-top: 10pxl color: red;"><?php echo isset($message) ? $message : "" ?></p>
                        <form id="login-form" class="form" action="index.php?controller=user&action=check_login" method="post">
                            <h4 class="text-center text-inf">ĐĂNG NHẬP</h4>
                            <div class="form-group">
                                <label for="username" class="text-inf">Tên đăng nhập:</label><br>
                                <input type="text" name="username" id="username" class="form-control" value="<?php echo isset($username) ? $username : "" ?>">
                            </div>
                            <div class="form-group">
                                <label for="password" class="text-inf">Mật khẩu:</label><br>
                                <input type="text" name="password" id="password" class="form-control" value="<?php echo isset($password) ? $password : "" ?>">
                            </div>
                            <div class="form-group">
                                <label for="remember-me" class="text-inf"><span>Ghi nhớ đăng nhập</span> <span><input id="remember-me" name="remember-me" type="checkbox"></span></label><br>
                                <input style="margin-top: 20px;" type="submit" name="submit" class="btn btn-danger btn-md" value="Đăng nhập">
                            </div>
                        </form>
                        <div id="register-link" class="text-right">
                            <a href="index.php?controller=user&action=register" class="text-inf">Bạn chưa có tài khoản? Đăng ký ngay!</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<?php require('views/client/layouts/footer.php'); ?>