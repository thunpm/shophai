<?php 
    require_once('controllers/BaseController.php'); 

    class ProductController extends BaseController  { 
        function __construct() { 
            $this->folder = 'client/products'; 
        } 

        public function product_list() { 
            $data = array('title' => 'Sản phẩm'); 
            $this->render('product_list');
        }

        public function product_detail() {
            $data = array('title' => 'Chi tiết sản phẩm');  
            $this->render('product_detail');
        }
    }
?>