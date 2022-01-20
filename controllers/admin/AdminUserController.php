<?php 
    require_once('controllers/admin/AdminBaseController.php');
    require_once('models/Customer.php'); 

    class AdminUserController extends AdminBaseController  { 
        function __construct() { 
            $this->folder = 'admin/user'; 
        } 

        public function list() { 
            $dulieu=Customer::getAll();
             $data = array('title' => 'Quản lý khách hàng','dulieu' => $dulieu); 
            $this->render('list', $data);
        }


        public function delete() { 
            if (isset($_GET['id'])) {
                $idCustomer = $_GET['id'];
                $message = "";
                if(Customer::delete($idCustomer) == 1) {
                    $message = "Xóa khách hàng thành công!";
                } else {
                    $message = "Lỗi xóa!";
                }
                $dulieu = Customer::getAll();
                    $data = array('title' => 'Quản lý khách hàng', 'message' => $message, 'dulieu' => $dulieu); 
                    $this->render('list', $data); 
            }
         
        }
       

    }
?>