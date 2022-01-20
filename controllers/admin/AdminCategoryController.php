<?php 
    require_once('controllers/admin/AdminBaseController.php');

    class AdminCategoryController extends AdminBaseController  { 
        function __construct() { 
            $this->folder = 'admin/category'; 
        } 

        public function list() { 
            $data = array('title' => 'Quản lý danh mục'); 
            $this->render('list', $data);
        }

        public function edit() { 
            $data = array('title' => 'Sửa danh mục'); 
            $this->render('edit', $data);
        }

        public function add() { 
            $data = array('title' => 'Thêm danh mục'); 
            $this->render('add', $data);
        }

        public function delete() { 
            $data = array('title' => 'Quản lý danh mục'); 
            $this->render('list', $data);
        }

    }
?>