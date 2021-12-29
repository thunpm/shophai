<?php 
    require_once('controllers/BaseController.php'); 
    require_once('models/Product.php'); 
    require_once('models/Category.php'); 

    class ProductController extends BaseController  { 
        function __construct() { 
            $this->folder = 'client/products'; 
        } 

        public function product_list() { 
            $maDanhMuc = $_GET['danhmuc'];
            $data = array('title' => 'Sản phẩm', 'maDanhMuc' => $maDanhMuc); 
            $this->render('product_list', $data);
        }

        public function product_detail() {
            $data = array('title' => 'Chi tiết sản phẩm');  
            $this->render('product_detail', $data);
        }
    }
?>