<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="../../../assets/stylesheets/admin/admin_style.css">
   <!-- <link rel="stylesheet" href="../../../assets/stylesheets/client/client_style.css"> -->
    <link rel="stylesheet" type="text/css" href="../../../assets/lib/font-awesome/css/all.css">
    <link rel="stylesheet" type="text/css" href="../../../assets/lib/bootstrap/css/bootstrap.min.css"/>
    <script src="../../../assets/lib/jquery-3.3.1.min.js"></script>
	<script src="../../../assets/lib/popper.min.js"></script>
	<script src="../../../assets/lib/bootstrap/js/bootstrap.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login admin</title>
</head>
<body>
<div class="login-block">
    <div id="login">
        <div class="container">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12">
                       
                        
                        <form id="login-form" class="form" action="" method="post">
                            <h4 class="text-center text-inf">ĐĂNG NHẬP</h4>
                           <div class="form-group">
                                <label for="TenDangNhap" class="text-inf">Tên đăng nhập:</label><br>
                                <input type="text" name="TenDangNhap" id="TenDangNhap" class="form-control"  value="">
                            </div>
                            <div class="form-group">
                                <label for="MatKhau" class="text-inf">Mật khẩu:</label><br>
                                <input type="text" name="password" id="MatKhau" class="form-control" value="">
                            </div>
                            <div class="form-group">
                                
                                <input style="margin-top: 20px;" type="submit" name="submit" class="btn btn-danger btn-md" value="Đăng nhập">
                            </div>
                        </form>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


</body>
</html>
