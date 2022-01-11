<?php 
    require_once('controllers/BaseController.php'); 
    require_once('models/Customer.php'); 
    require_once('models/Address.php'); 
    require_once('models/Invoice.php'); 

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
            // check
            $this->login();
        }

         public function check_login() {
            $message = "";
            if (isset($_POST['submit'])&&($_POST['submit'])) {
                $TenDangNhap = $_POST['TenDangNhap'];
                $MatKhau = $_POST['password'];

                $check = Customer::isValidAccount($TenDangNhap, $MatKhau);
                if($check == true) {
                    if (session_status() == PHP_SESSION_NONE) {
                        session_start();
                    }
                    $user = Customer::getByUsername($TenDangNhap);
                    $_SESSION['user'] = $user;
                    header('Location: index.php?controller=page&action=home'); 
                } else {
                    $message = "Tên đăng nhập hoặc mật khẩu không đúng!";
                }
                
                $data = array('title' => 'Đăng nhập', 'message' => $message, 'TenDangNhap' => $TenDangNhap, 'MatKhau' => $MatKhau);  
            
            } else {
                $data = array('title' => 'Đăng nhập', 'message' => $message);  
            
            }
            $this->render('login', $data);
         
        }
    
        public function order() {
            if (isset($_SESSION['user'])) {
                if(isset($_SESSION['user'])) {
                    $_SESSION["user"] = unserialize(serialize($_SESSION["user"]));
                }
                
                $listOrder = Invoice::listByIdCustomer($_SESSION['user']->idCustomer);
                $data = array('title' => 'Đơn hàng của tôi', 'info' => 'order', 'listOrder' => $listOrder);  
                $this->render('order', $data);
            }
        }

        public function info() {
            if(isset($_POST['submit'])&& ($_POST['submit'])) {
                $MaKH = $_POST['MaKH'];
                $HoTen = $_POST['HoTen'];
                $SoDienThoai = $_POST['SoDienThoai'];
                $Email = $_POST['Email'];
                
                Customer::UpdateAccount($MaKH, $HoTen, $SoDienThoai, $Email);
                echo '<script type="text/javascript">
                    alert("Cập nhập thành công!"); 
                    history.go(-1)
                    </script>';
            }

            $data = array('title' => 'Thông tin của tôi', 'info' => 'info'); 
            $this->render('info', $data);
        }

        public function address_list() {
            if (isset($_SESSION['user'])) {
                if(isset($_SESSION['user'])) {
                    $_SESSION["user"] = unserialize(serialize($_SESSION["user"]));
                }
                $user_add = Address::listAddress($_SESSION['user']->idCustomer);
                $data = array('title' => 'Sổ địa chỉ của tôi',  'info' => 'address', 'listAddress' => $user_add);  
                $this->render('address_list', $data);
            } else {
                header('Location: index.php?controller=page&action=home'); 
            }
            
        }

        public function add_address() {
            if (isset($_SESSION['user'])) {
                if(isset($_SESSION['user'])) {
                    $_SESSION["user"] = unserialize(serialize($_SESSION["user"]));
                }
                $user_add = Address::listAddress($_SESSION['user']->idCustomer);
                $data = array('title' => 'Sổ địa chỉ của tôi',  'info' => 'address', 'listAddress' => $user_add);  
                $this->render('address_list', $data);
            } else {
                header('Location: index.php?controller=page&action=home'); 
            }
            
        }

        public function password() {
            if (isset($_POST['submit']) == true) {
                $matkhaucu = $_POST['matkhaucu'];
                $matkhaumoi_1 = $_POST['matkhaumoi_1'];
                $matkhaumoi_2 = $_POST['matkhaumoi_2'];
                $TenDangNhap = $_POST['TenDangNhap'];
                $count = Customer::SeclecPass($TenDangNhap, $matkhaucu);

                if ($count > 0) {
                    if ($matkhaumoi_1 != $matkhaumoi_2 || $matkhaumoi_1 == "" || $matkhaumoi_2 == "") {
                        echo '<script type="text/javascript">
                            alert("Mật khẩu mới không hợp lệ!"); 
                            history.go(-1)
                            </script>';
                    } else {
                        Customer::UpdatePass($matkhaumoi_1);
                        session_unset(); 
                        echo '<script type="text/javascript">
                            alert("Mật khẩu đã được thay đổi."); 
                            location.href = "index.php?controller=user&action=login";
                            </script>';
                    }
                } else {
                    echo '<script type="text/javascript">
                        alert("Mật khẩu cũ không đúng!"); 
                        history.go(-1)
                        </script>';
                }
            } 
            $data = array('title' => 'Đổi mật khẩu',  'info' => 'password');  
            $this->render('password', $data);
        }

        public function logout() {
            session_unset(); 
            header('Location: index.php?controller=page&action=home'); 
        }
        
    }
?>
