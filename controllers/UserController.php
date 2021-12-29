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
            // lấy thông tin đăng nhập
            $username = $_POST['username'];
            $password = $_POST['password'];

            if (Customer::isValidAccount($username, $password) == true) {
                session_start();
                $user = new Customer($username, $password);
                $_SESSION['user'] = $user;
                header('Location: index.php?controller=page&action=home'); 
            } else {
                $data = array('title' => 'Đăng nhập', 'message' => 'Tên đăng nhập hoặc mật khẩu sai!',
                            'username' => $username, 'password' => $password);  
                $this->render('login', $data);
            }
        }
        
        public function order() {
            $data = array('title' => 'Đơn hàng của tôi');  
            $this->render('order', $data);
        }

        public function info() {
            $data = array('title' => 'Thông tin của tôi');  
            $this->render('info', $data);
        }

        public function address_list() {
            $data = array('title' => 'Sổ địa chỉ của tôi');  
            $this->render('address_list', $data);
        }

        public function password() {
            $data = array('title' => 'Đổi mật khẩu');  
            $this->render('password', $data);
        }

        public function logout() {
            session_unset(); 
            header('Location: index.php?controller=page&action=home'); 
        }
    }
?>