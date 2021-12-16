<?php 
    require_once('controllers/BaseController.php'); 

    class PageController extends BaseController  { 
        function __construct() { 
            $this->folder = 'client/pages'; 
        } 

        public function home() { 
            $data = array('title' => 'Trang chủ'); 
            $this->render('home', $data);
        }

        public function contact() {
            $data = array('title' => 'Liên hệ');  
            $this->render('contact', $data);
        }

        public function intro() { 
            $data = array('title' => 'Giới thiệu'); 
            $this->render('intro', $data);
        }

        public function error() {
            $data = array('title' => 'Lỗi'); 
            $this->render('error', $data); 
        } 
    }
?>