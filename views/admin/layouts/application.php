<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo isset($title) ? $title : 'Trang chủ Admin'; ?></title>

    <link rel="stylesheet" href="assets/stylesheets/admin/sibar.css">
    <link rel="stylesheet" href="assets/stylesheets/admin/admin_style.css">
    <link rel="stylesheet" href="assets/stylesheets/admin/customer.css">

    <link rel="stylesheet" type="text/css" href="assets/lib/font-awesome/css/all.css">
    <link rel="stylesheet" type="text/css" href="assets/lib/bootstrap/css/bootstrap.min.css"/>
    <script src="assets/lib/jquery-3.3.1.min.js"></script>
	<script src="assets/lib/popper.min.js"></script>
	<script src="assets/lib/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
    <?= @$content ?> 
</body> 