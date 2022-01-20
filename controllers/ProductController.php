<?php 
    require_once('controllers/BaseController.php'); 
    require_once('models/Product.php'); 
    require_once('models/Category.php'); 
    require_once('models/Evaluate.php'); 

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
            $maSanPham = $_GET['masp'];
            $maDM = $_GET['madanhmuc'];
            $tenDM = Category::getNameById($maDM);
            $sanPham = Product::getSanPham($maSanPham);
            $TheLoai = Type::getTheLoai($sanPham->maTL);
            $nhanXet = Evaluate::listNhanXet($maSanPham);
            $listSPLienQuan = Product::getListSPLienQuan($maSanPham, $TheLoai->maTL);
            $data = array('title' => 'Chi tiết sản phẩm', 'sanPham' => $sanPham, 'tenTheLoai' => $TheLoai->tenTL, 'spLienQuan' => $listSPLienQuan, 'tenDM' => $tenDM, 'maDM' => $maDM, 'nhanXet' => $nhanXet);  
            $this->render('product_detail', $data);
        }
    }
?>