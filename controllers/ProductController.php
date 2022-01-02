<?php 
    require_once('controllers/BaseController.php'); 
    require_once('models/Product.php'); 
    require_once('models/Category.php'); 

    class ProductController extends BaseController  { 
        function __construct() { 
            $this->folder = 'client/products'; 
        } 

        public function product_list() { 
            $page = $_GET['page'];
            $maDanhMuc = $_GET['danhmuc'];
            if (isset($_GET['theloai'])) {
                $maTheLoai = $_GET['theloai'];
                if (isset($_GET['gia'])) {
                    $gia = $_GET['gia'];
                    $arr = explode("-", $gia);
                    $giaDau = $arr[0]*1000000;
                    $giaCuoi = $arr[1]*1000000;

                    $data = array('title' => 'Sản phẩm', 'maDanhMuc' => $maDanhMuc, 
                                'page' => $page, 'maTheLoai' => $maTheLoai, 'giaDau' => $giaDau,
                                'giaCuoi' => $giaCuoi); 
                } else {
                    $data = array('title' => 'Sản phẩm', 'maDanhMuc' => $maDanhMuc, 
                                    'page' => $page, 'maTheLoai' => $maTheLoai); 
                }
            } else {
                $data = array('title' => 'Sản phẩm', 'maDanhMuc' => $maDanhMuc, 'page' => $page); 
            }
            
            $this->render('product_list', $data);
        }

        public function product_detail() {
            $data = array('title' => 'Chi tiết sản phẩm');  
            $this->render('product_detail', $data);
        }
    }
?>