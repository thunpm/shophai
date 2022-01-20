<?php 
    require_once('controllers/admin/AdminBaseController.php');
    require_once('models/Page.php');

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

        public function listContact() {
            $contacts = Page::getContacts();
            $data = array('title' => 'Danh sách phản hồi', 'contacts' => $contacts);
            $this->render('contact', $data);
        }

        public function deleteContact() {
            $MaPH = $_GET['MaPH'];
            Page::deleteContact($MaPH);
            $contacts = Page::getContacts();
            $data = array('title' => 'Danh sách phản hồi', 'contacts' => $contacts);
            $this->render('contact', $data);
        }
    }
?>