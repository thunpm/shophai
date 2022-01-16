<?php 
    require_once('controllers/admin/AdminBaseController.php');

    class AdminPageController extends AdminBaseController  { 
        function __construct() { 
            $this->folder = 'admin/pages'; 
        } 

        public function home() { 
            $data = array('title' => 'Trang chủ Admin'); 
            $this->render('home', $data);
        }

        public function error() {
            $data = array('title' => 'Lỗi'); 
            $this->render('error', $data); 
        } 
    }
?>