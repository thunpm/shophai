<?php 
    require_once('controllers/BaseController.php'); 

    class NewsController extends BaseController  { 
        function __construct() { 
            $this->folder = 'client/news'; 
        } 

        public function news_list() { 
            $data = array('title' => 'Tin tức'); 
            $this->render('news_list');
        }

        public function news_detail() {
            $data = array('title' => 'Chi tiết tin tức');  
            $this->render('news_detail');
        }
    }
?>