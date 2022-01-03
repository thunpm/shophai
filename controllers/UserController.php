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
            // check
            $this->login();
        }

         public function check_login() {
            if(isset($_POST['submit'])&&($_POST['submit'])){
                $TenDangNhap = $_POST['TenDangNhap'];
                 $MatKhau = $_POST['MatKhau'];
                $user=isValidAccount($TenDangNhap, $MatKhau);
                if(is_array($user)){
                    session_start();
                    $_SESSION['user']=$user;
                    header('Location: index.php?controller=page&action=home'); 
                }else{
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
           
            UpdateAccount($MaKH,$HoTen,$SoDienThoai,$Email);

            echo '<script type="text/javascript">
            alert("Cập nhập thành công!"); 
            history.go(-1)
                </script>';
            } 
        $data = array('title' => 'Thông tin của tôi'); 
    
        $this->render('info', $data);
}

        public function address_list() {
            $data = array('title' => 'Sổ địa chỉ của tôi');  
            $this->render('address_list', $data);
        }

            public function password() {
            if(isset($_POST['submit'])==true){
                $matkhaucu = $_POST['matkhaucu'];
                $matkhaumoi_1 = $_POST['matkhaumoi_1'];
                $matkhaumoi_2 = $_POST['matkhaumoi_2'];
               $count = SeclecPass($matkhaucu);
                if($count >0){
                    UpdatePass($matkhaumoi_1);
                   echo '<script type="text/javascript">
                   alert("Mật khẩu đã được thay đổi."); 
                   history.go(-1)
          </script>';

                }elseif($matkhaumoi_1 != $matkhaumoi_2) {
                    echo '<script type="text/javascript">
                    alert("Mật khẩu nhập lại không khớp. Vui long nhập lại."); 
                    history.go(-1)
           </script>';
               }
                
                else{
                    echo '<script type="text/javascript">
                    alert("Tài khoản hoặc Mật khẩu cũ không đúng. Vui long nhập lại."); 
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
