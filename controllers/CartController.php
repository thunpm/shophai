<?php 
    require_once('controllers/BaseController.php'); 
    require_once('models/Product.php'); 
    require_once('models/Cart.php'); 
    require_once('models/Items.php'); 

    class CartController extends BaseController  { 
        function __construct() { 
            $this->folder = 'client/carts'; 
        } 

        public function add() { 
            $maSP = $_POST['id'];
            $message = "";

            if ($maSP != null) {
                $soLuong = $_POST['soLuong'];
                $ok = false;      
                if(isset($_SESSION['cart'])) {
                    $_SESSION["cart"] = unserialize(serialize($_SESSION["cart"]));
                }

                if (isset($_SESSION['cart'])) {
                    $cart = $_SESSION['cart'];
                } else {
                    $cart = new Cart();
                }

                for ($i = 0; $i < count($cart->listItems); $i++) {
                    if ($cart->listItems[$i]->sanPham->maSP == $maSP) {
                        if ($cart->listItems[$i]->soLuong+$soLuong <= $cart->listItems[$i]->sanPham->soLuongCo) {
                            $cart->listItems[$i]->soLuong = $cart->listItems[$i]->soLuong+$soLuong;
                        } else {
                            $cart->listItems[$i]->soLuong = $cart->listItems[$i]->sanPham->soLuongCo;
                            $message = "Số lượng sản phẩm không đủ!";
                        }
                        
                        $ok = true;
                        break;
                    } 
                }

                if ($ok == false) {
                    $sanPham = Product::getSanPham($maSP);
                    $item = new Items($sanPham, $soLuong, $sanPham->gia, $sanPham->khuyenMai);
                    $cart->add($item);
                }

                $_SESSION['cart'] = $cart;
            }
            
            $data = array('title' => 'Giỏ hàng', 'message' => $message); 
            $this->render('list', $data);
        }

        public function edit() {
            $tt = $_GET['tt'];
            $maSP = $_GET['id'];
            $message = "";
            if ($maSP != null) {
                if(isset($_SESSION['cart'])) {
                    $_SESSION["cart"] = unserialize(serialize($_SESSION["cart"]));
                }

                $cart = $_SESSION['cart'];

                if ($tt == 'xoa') {
                    for ($i = 0; $i < count($cart->listItems); $i++) {
                        if ($cart->listItems[$i]->sanPham->maSP == $maSP) {
                            \array_splice($cart->listItems, $i, 1);
                            $message = "Đã xóa thành công!";
                            break;
                        } 
                    }
                } else if ($tt == 'giam') {
                    for ($i = 0; $i < count($cart->listItems); $i++) {
                        if ($cart->listItems[$i]->sanPham->maSP == $maSP) {
                            if ($cart->listItems[$i]->soLuong > 1) {
                                $cart->listItems[$i]->soLuong = $cart->listItems[$i]->soLuong - 1;
                            } else {
                                $message = "Không thể trừ!";
                            }

                            break;
                        } 
                    }
                } else if ($tt == 'tang') {
                    for ($i = 0; $i < count($cart->listItems); $i++) {
                        if ($cart->listItems[$i]->sanPham->maSP == $maSP) {
                            if ($cart->listItems[$i]->soLuong < $cart->listItems[$i]->sanPham->soLuongCo) {
                                $cart->listItems[$i]->soLuong = $cart->listItems[$i]->soLuong + 1;
                            } else {
                                $message = "Số lượng không đủ!";
                            }
                            break;
                        } 
                    }
                } else if ($tt == 'doi') {
                    $soLuong = $_GET['soLuong'];

                    for ($i = 0; $i < count($cart->listItems); $i++) {
                        if ($cart->listItems[$i]->sanPham->maSP == $maSP) {
                            if ($soLuong <= $cart->listItems[$i]->sanPham->soLuongCo
                                && $soLuong >= 1) {
                                $cart->listItems[$i]->soLuong = $soLuong;
                            } else {
                                $message = "Số lượng thay đổi không hợp lệ!";
                            }
                            break;
                        } 
                    }
                }


                $_SESSION['cart'] = $cart;
            }

            $data = array('title' => 'Giỏ hàng', 'message' => $message); 
            $this->render('list', $data);
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