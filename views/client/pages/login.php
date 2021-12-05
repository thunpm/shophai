<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<title><?php echo isset($title) ? $title : 'Trang chủ'; ?></title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<link rel="stylesheet" type="text/css" href="../../../assets/lib/font-awesome/css/all.css">
    <link rel="stylesheet" type="text/css" href="../../../assets/lib/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="../../../assets/stylesheets/client_style.css"/>
</head>

<body>
    <?php require('../layouts/header.php'); ?>
	<?php require('../layouts/menu.php'); ?>
	<div class="login-block">
        <div id="login">
            <div class="container">
                <div id="login-row" class="row justify-content-center align-items-center">
                    <div id="login-column" class="col-md-6">
                        <div id="login-box" class="col-md-12">
                            <form id="login-form" class="form" action="" method="post">
                                <h4 class="text-center text-inf">ĐĂNG NHẬP</h4>
                                <div class="form-group">
                                    <label for="username" class="text-inf">Số điện thoại:</label><br>
                                    <input type="text" name="username" id="username" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label for="password" class="text-inf">Mật khẩu:</label><br>
                                    <input type="text" name="password" id="password" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label for="remember-me" class="text-inf"><span>Ghi nhớ đăng nhập</span> <span><input id="remember-me" name="remember-me" type="checkbox"></span></label><br>
                                    <input style="margin-top: 20px;" type="submit" name="submit" class="btn btn-danger btn-md" value="Đăng nhập">
                                </div>
                            </form>
                            <div id="register-link" class="text-right">
                                <a href="register.php" class="text-inf">Bạn chưa có tài khoản? Đăng ký ngay!</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	</div>
	<?php require('../layouts/footer.php'); ?>

	<script src="../../../assets/lib/jquery-3.3.1.min.js"></script>
    <script src="../../../assets/lib/popper.min.js"></script>
    <script src="../../../assets/lib/bootstrap/js/bootstrap.min.js"></script>
</body>