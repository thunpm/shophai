<?php 
    require_once('controllers/BaseController.php'); 

    class UserController extends BaseController  { 
        function __construct() { 
            $this->folder = 'client/users'; 
        } 

        public function login() { 
            $data = array('title' => 'Đăng nhập'); 
            $this->render('login');
        }

        public function register() {
            $data = array('title' => 'Đăng ký');  
            $this->render('register');
        }

        public function check_register() {
            // check
            $this->login();
        }

        public function check_login() {
            // check
            session_start();
            $_SESSION["user"] = "Thư";
            header('Location: index.php?controller=page&action=home'); 
        }
        public function order() {
            $data = array('title' => 'Đơn hàng của tôi');  
            $this->render('order');
        }

        public function info() {
            $data = array('title' => 'Thông tin của tôi');  
            $this->render('info');
        }

        public function address_list() {
            $data = array('title' => 'Sổ địa chỉ của tôi');  
            $this->render('address_list');
        }

        public function password() {
            $data = array('title' => 'Đổi mật khẩu');  
            $this->render('password');
        }

        public function logout() {
            session_unset(); 
            header('Location: index.php?controller=page&action=home'); 
        }
    }
?>