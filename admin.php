<?php 
    require_once('connection.php');
    
    // Khởi tạo session PHP nếu chưa khởi tạo
    if (session_id() === '') {
        session_start();
    }

    // require_once('connection.php'); 
    if (isset($_GET['controller'])) { 
	    $controller = $_GET['controller']; 
	    if (isset($_GET['action'])) { 
		    $action = $_GET['action'];
	    } else { 

	    } 
    } else { 
	    $controller = 'page'; 
	    $action = 'login'; 
    } 

    // lấy được controller với action rồi thì xử lý chuyển trang
    $controllers = array('page' => ['home', 'error', 'login', 'check_login', 'info_admin', 'logout'], 
                        'user' => ['list', 'detail', 'delete'],
                        'category' => ['list', 'add', 'edit', 'delete'],
                        'type' => ['list', 'add', 'edit', 'delete'],
                        'product' => ['list', 'add', 'edit', 'delete'],
                        'evaluate' => ['list', 'delete'],
                        'news' => ['list', 'add', 'edit', 'delete'],
                        'invoice' => ['list', 'add', 'update', 'delete'],
                        'statistics' => ['list']);

    if (! array_key_exists($controller, $controllers) || ! in_array($action, $controllers[$controller])) { 
	    $controller = 'page'; 
	    $action = 'error'; 
    }

    $controller = 'Admin'.ucwords($controller, '_');
    include_once('controllers/admin/' . $controller . 'Controller.php');
    // Tạo ra tên controller class từ các giá trị lấy được từ URL sau đó gọi ra để hiển thị trả về cho người dùng
    $class = $controller.'Controller';
    $controller = new $class; 
    $controller->$action(); 
?>