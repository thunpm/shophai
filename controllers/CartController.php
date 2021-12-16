<?php 
    require_once('controllers/BaseController.php'); 

    class CartController extends BaseController  { 
        function __construct() { 
            $this->folder = 'client/carts'; 
        } 

        public function list() { 
            $data = array('title' => 'Giỏ hàng'); 
            $this->render('list', $data);
        }

        public function pay() {
            $data = array('title' => 'Thanh toán');  
            $this->render('pay', $data);
        }
    }
?>