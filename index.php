<?php 
    // Khởi tạo session PHP nếu chưa khởi tạo
    if (session_id() === '')
    session_start();
    
    // require_once('connection.php'); 
    if (isset($_GET['controller'])) { 
	    $controller = $_GET['controller']; 
	    if (isset($_GET['action'])) { 
		    $action = $_GET['action'];
	    } else { 

	    } 
    } else { 
	    $controller = 'page'; 
	    $action = 'home'; 
    } 

    // lấy được controller với action rồi thì xử lý chuyển trang
    $controllers = array('page' => ['home', 'error', 'contact', 'intro'], 
                        'user' => ['login', 'register', 'order', 'info', 'address_list', 'logout', 'password', 'check_register', 'check_login'],
                        'product' => ['product_detail', 'product_list'],
                        'news' => ['news_list', 'news_detail'],
                        'cart' => ['list', 'pay']);

    if (! array_key_exists($controller, $controllers) || ! in_array($action, $controllers[$controller])) { 
	    $controller = 'page'; 
	    $action = 'error'; 
    }

    $controller = ucwords($controller, '_');
    include_once('controllers/' . $controller . 'Controller.php');
    // Tạo ra tên controller class từ các giá trị lấy được từ URL sau đó gọi ra để hiển thị trả về cho người dùng
    $class = $controller.'Controller';
    $controller = new $class; 
    $controller->$action(); 
?>