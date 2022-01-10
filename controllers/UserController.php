<?php 
    require_once('controllers/BaseController.php'); 
    require_once('models/Customer.php'); 

    class UserController extends BaseController  { 
        function __construct() { 
            $this->folder = 'client/users'; 
        } 

        public function login() { 
            $data = array('title' => 'Đăng nhập'); 
            $this->render('login', $data);
        }

        public function register() {
            $data = array('title' => 'Đăng ký');  
            $this->render('register', $data);
        }

               public function check_register() {
            if(isset($_POST['dangky'])&&($_POST['dangky'])){
            //    $MaKH   = $_POST['MaKH'];
                $TenDangNhap      = $_POST['TenDangNhap'];
                $MatKhau   = $_POST['MatKhau'];
                $HoTen   = $_POST['HoTen'];
                $SoDienThoai   = $_POST['SoDienThoai'];
                $XNMatKhau   = $_POST['XNMatKhau'];

                if ($TenDangNhap == "" || $MatKhau == ""  ) {
                    echo '<script type="text/javascript">
                    alert("bạn vui lòng nhập đầy đủ thông tin!."); 
                    history.go(-1)
                    </script>';
                   
                    }else{
                        $query = Customer::getregisterId($TenDangNhap);
                        if ($query > 0)
                        {
                            echo '<script type="text/javascript">
                            alert("User da ton tai.Vui lòng nhập lại!."); 
                            history.go(-1)
                            </script>';
                       
                        }
                          else
                        {
                            if($MatKhau != $XNMatKhau)
                                {
                                    echo '<script type="text/javascript">
                                    alert("Mật khẩu nhập lại không trùng.Vui lòng nhập lại!."); 
                                    history.go(-1)
                                    </script>';
                                   
                                }
                    
                        else
                     {
                        $query=Customer::isRegister($TenDangNhap,$MatKhau,$HoTen,$SoDienThoai);
                        
                            if($query)
                            {
                                echo '<script type="text/javascript">
                                    alert("Có lỗi xảy ra trong quá trình đăng ký.Vui lòng nhập lại!."); 
                                    history.go(-1)
                                    </script>';
                                
                           }
                            else
                            {
                                echo '<script type="text/javascript">
                                    alert("Tài khoản đã được tạo!."); 
                                    history.go(-1)
                                    </script>';
                             }
                        }
                    }
                 }
            }
            
          
      $this->login();

    }

         public function check_login() {
            if(isset($_POST['submit'])&&($_POST['submit'])){
                $TenDangNhap = $_POST['TenDangNhap'];
                $MatKhau = $_POST['password'];

                $user = Customer::isValidAccount($TenDangNhap, $MatKhau);
                if(is_array($user)) {
                    session_start();
                    $_SESSION['user']=$user;
                    header('Location: index.php?controller=page&action=home'); 
                } else {
                    echo '<script type="text/javascript">
                        alert("Tài khoản hoặc mật khẩu sai. Vui lòng nhập lại!."); 
                        history.go(-1)
                        </script>';      
                }

            }
            $data = array('title' => 'Đăng nhập'   );  
            $this->render('login', $data);
         
        }
    
        public function order() {
            $data = array('title' => 'Đơn hàng của tôi');  
            $this->render('order', $data);
        }

        
        public function info() {
            if(isset($_POST['submit'])&& ($_POST['submit'])){
                    $MaKH = $_POST['MaKH'];
                    $HoTen=$_POST['HoTen'];
                $SoDienThoai=$_POST['SoDienThoai'];
                    $Email=$_POST['Email'];
                
                Customer::UpdateAccount($MaKH,$HoTen,$SoDienThoai,$Email);

                    echo '<script type="text/javascript">
                    alert("Cập nhập thành công. Vui lòng đăng nhập lại !"); 
                    history.go(-1)
                        </script>';
                    } 
                $data = array('title' => 'Thông tin của tôi'); 
            
                $this->render('info', $data);
        }

        public function address_list() {
            $user_add = Customer::listaddress();
            if(is_array($user_add)) {
                $_SESSION['user_add']=$user_add;
            
            }
                $data = array('title' => 'Sổ địa chỉ của tôi');  
                $this->render('address_list', $data);
            
            
        }

        public function password() {
            if (isset($_POST['submit']) == true) {
                $matkhaucu = $_POST['matkhaucu'];
                $matkhaumoi_1 = $_POST['matkhaumoi_1'];
                $matkhaumoi_2 = $_POST['matkhaumoi_2'];
                $TenDangNhap = $_POST['TenDangNhap'];
                $count = Customer::SeclecPass($TenDangNhap,$matkhaucu);

                if ($count >0) {
                    Customer::UpdatePass($matkhaumoi_1);
                   echo '<script type="text/javascript">
                        alert("Mật khẩu đã được thay đổi."); 
                        history.go(-1)
                        </script>';

                } elseif ($matkhaumoi_1 != $matkhaumoi_2) {
                    echo '<script type="text/javascript">
                        alert("Mật khẩu nhập lại không khớp. Vui lòng nhập lại."); 
                        history.go(-1)
                        </script>';
               } else {
                    echo '<script type="text/javascript">
                        alert("Mật khẩu cũ không đúng. Vui lòng nhập lại."); 
                        history.go(-1)
                        </script>';
                }
            } 
            $data = array('title' => 'Đổi mật khẩu');  
            $this->render('password', $data);
        }

        public function logout() {
            session_unset(); 
            header('Location: index.php?controller=page&action=home'); 
        }
        
    }
?>
