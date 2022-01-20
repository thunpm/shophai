<?php 
    require_once('controllers/admin/AdminBaseController.php');
    require_once('models/Product.php'); 
    require_once('models/Type.php'); 
    require_once('models/Picture.php'); 
    class AdminProductController extends AdminBaseController  { 
        function __construct() { 
            $this->folder = 'admin/product'; 
        } 

        public function list() { 
          
            $dulieu= Product::listSanPham();
//  echo"<pre>";
//  print_r($dulieu);
            $data = array('title' => 'Quản lý sản phẩm','dulieu' => $dulieu); 
            $this->render('list', $data);

        }
        
        public function edit() { 
              //lấy dữ liệu 1 san pham đưa ra màn hình
              if (isset($_GET['id'])) {
                $MaSanPham = $_GET['id'];
                $item = Product::getSanPham($MaSanPham);
                $listtype = Type::getLoai();
                if (isset($_POST['submit'])) {
                    $message = "";
                    $maSP = $MaSanPham;
                    $tenSP = $_POST['tensanpham'];
                    $SoLuongCo = $_POST['tensanpham'];
                    $MoTa = $_POST['mota'];
                    $Gia = $_POST['giasp'];
                    $KhuyenMai = $_POST['khuyenmai'];
                    $maTL = $_POST['danhmuc'];
               if($tenSP == "" || $MoTa == "" ||$Gia == "" || $SoLuongCo == "" ||$maTL == "") {
                        $message = "Giá trị nhập vào rỗng!";
                        $item->settenSP ("");
                        $data = array('title' => 'Sửa sản phẩm', 'message' => $message, 'item' => $item,); 
                        $this->render('edit', $data);
                        return;
                    }

                    $add= Product::editSP($maSP, $tenSP,$MoTa,$SoLuongCo,$Gia,$KhuyenMai,$maTL);
                    //tên san pham đã tồn tại
                    if($add== 2) {
                        $message = "Tên san pham đã tồn tại!";
                        
                        $item->settenSP ($tenSP);
                        $data = array('title' => 'Sửa san pham', 'message' => $message, 'item' => $item, 'listtype'=>$listtype); 
                        $this->render('edit', $data);
                        return;
                    }
                    //sửa thành công
                    $message = "Sửa sản phẩm thành công!";
                  
                    $dulieu = Product::listSanPham();
                    $data = array('title' => 'Quản lý sản phẩm', 'message' => $message, 'dulieu' => $dulieu);  
                    $this->render('list', $data);
                    return;
                }  

             $data = array('title' => 'Sửa sản phẩm','item' => $item, 'listt'=>$listtype); 
            $this->render('edit', $data);
            }
          
        }

        public function add() { 
              $listtype = Type::getLoai();
            if(isset($_POST['submit'])&&($_POST['submit'])){
                $so = $_POST['MaSP'];
               $tenSP = $_POST['TenSP'];
               $MoTa = $_POST['MoTa'];
               $Gia = $_POST['Gia'];
               $SoLuongCo = $_POST['SoLuongCo'];
               $KhuyenMai = $_POST['KhuyenMai'];
               $maTL = $_POST['danhmuc'];


             $hinhanh = $_FILES['TenHinh']['name'];
             $target_dir = "assets/images/products/";
             $target_file = $target_dir . basename($_FILES["TenHinh"]["name"]);
             if (move_uploaded_file($_FILES["TenHinh"]["tmp_name"], $target_file)) {
                  //    echo "The file ". htmlspecialchars( basename( $_FILES["TenHinh"]["name"])). " has been uploaded.";
              } else {
                     //   echo "Sorry, there was an error uploading your file.";
              }


               if ($tenSP == "" || $MoTa == "" ||$Gia == "" || $SoLuongCo == "" ||$maTL == "" ){
                    $message = "Giá trị nhập vào rỗng!";
                    $data = array('title' => 'Thêm sản phẩm', 'message' => $message); 
                    $this->render('add', $data);
                    return;
                }

                $add = Product::InsetSP($so,$tenSP,$MoTa,$SoLuongCo,$Gia,$KhuyenMai,$maTL);
                //mã danh mục đã tồn tại
                
                if($add== 1) {
                    $message = "Mã sản phẩm đã tồn tại!";
                    $data = array('title' => 'Thêm sản phẩm', 'message' => $message, 'maSP' => $so, 'tenSP' => $tenSP,); 
                    $this->render('add', $data);
                    return;
                }
                //tên sản phẩm đã tồn tại
                if($add== 2) {
                    $message = "Tên sản phẩm đã tồn tại!";
                    $data = array('title' => 'Thêm sản phẩm', 'message' => $message, 'maSP' => $so, 'tenSP' => $tenSP); 
                    $this->render('add', $data);
                    return;
                }
       
               // thêm thành công
                $message = "Thêm sản phẩm thành công!";
                $dulieu = Product::listSanPham();
                $data = array('title' => 'Quản lý sản phẩm', 'message' => $message, 'dulieu' => $dulieu);  
                $this->render('list', $data);
                return;
            }
            // echo"<pre>";
            // print_r($listtype);
            $data = array('title' => 'Thêm sản phẩm','listt'=>$listtype); 
            $this->render('add', $data);
        }




        public function delete() { 
           
        if (isset($_GET['id'])) {
            $maSP = $_GET['id'];
            $message = "";
            if(Product::deleteSP($maSP)== 1) {
                $message = "Xóa sản phẩm thành công!";
            } else {
                $message = "Lỗi xóa!";
            }
            $dulieu = Product::listSanPham();
            $data = array('title' => 'Quản lý sản phẩm', 'message' => $message, 'dulieu' => $dulieu); 
            $this->render('list', $data); 
        }

    }
    }


?>