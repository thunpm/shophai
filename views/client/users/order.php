<?php
	if (isset($_SESSION['user'])==false) {
        header("location:index.php?controller=user&action=check_login");
        exit();
    } 
?>
<?php require('views/client/layouts/header.php'); ?>
<?php require('views/client/layouts/menu.php'); ?>
<div class="main-block">
    <div class="content">
        <div class="contact__title">
            <h3 class="contact__heading" >THÔNG TIN TÀI KHOẢN</h3>
        </div>
        <div class="user-info-block">
            <div class="list-user-info">
                <ul>
                    <li>
                        <i class="far fa-user-circle"></i>
                        <div>
                            <p>Tài khoản</p>
                            <p><?php $user = $_SESSION['user'];
                                echo $user->fullname; ?></p>
                        </div>
                    </li>
                    <input type="hidden" id="in" value="<?= $info ?>">
                    <li id="info"><a href="index.php?controller=user&action=info"><i class="fas fa-user-edit"></i>    Thông tin tài khoản</a></li>
                    <li id="password"><a href="index.php?controller=user&action=password"><i class="fas fa-key"></i>    Thay đổi mật khẩu</a></li>
                    <li id="order"><a href="index.php?controller=user&action=order"><i class="far fa-list-alt"></i>    Đơn hàng đã đặt</a></li>
                    <li id="address"><a href="index.php?controller=user&action=address_list"><i class="far fa-address-book"></i>    Sổ địa chỉ</a></li>
                </ul>
            </div>
            <div class="user-info">
                <table class="table">
                    <tr>
                        <th>Mã đơn hàng</th>
                        <th>Ngày đặt</th>
                        <th>Chi tiết</th>
                    </tr>
                    <?php
                    if (isset($listOrder)) {
                        foreach ($listOrder as $order) {
                    ?>
                    <tr>
                        <td><?= $order->maHD ?></td>
                        <td><?= $order->ngayLap ?></td>
                        <td>
                            <div class="info">
                                <div class="add-address">
                                    <a href="#" data-toggle="modal" data-target="#<?= $order->maHD ?>">Chi tiết</a>
                                </div>
                                <!-- Modal -->
                                <div class="modal fade" id="<?= $order->maHD ?>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" style="max-width: 1000px;">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="<?= $order->maHD ?>">Chi tiết đơn hàng <?= $order->maHD ?></h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <form action="index.php?controller=user&action=add_address" method="POST">
                                                <div class="modal-body"> 
                                                    <table class="table">
                                                        <tr>
                                                            <th>Tên sản phẩm</th>
                                                            <th>Số lượng</th>
                                                            <th>Giá</th>
                                                            <th>Khuyến mãi</th>
                                                            <th>Thành tiền</th>
                                                        </tr>
                                                        <?php
                                                        $tongTien = 0;
                                                        foreach ($order->detail as $item) {
                                                        ?>
                                                        <tr>
                                                            <td><a href="index.php?controller=product&action=product_detail&masp=<?= $item->sanPham->maSP?>&madanhmuc=null"><?= $item->sanPham->tenSP ?></a></td>
                                                            <td><?= $item->soLuong ?></td>
                                                            <td><?= number_format($item->donGia) ?> đ</td>
                                                            <td><?= number_format($item->khuyenMai) ?> đ</td>
                                                            <td><?= number_format(($item->donGia - $item->khuyenMai)*$item->soLuong) ?> đ</td>
                                                        </tr>
                                                        <?php
                                                            $tongTien = $tongTien + ($item->donGia - $item->khuyenMai)*$item->soLuong;
                                                        }
                                                        ?>
                                                    </table>
                                                    <p>Tổng <?= number_format($tongTien) ?> đ</p>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <?php
                        }
                    }
                    ?>
                </table>
            </div>
        </div>
    </div>
</div>
<?php require('views/client/layouts/footer.php'); ?>

<script type="text/javascript">
	$(document).ready(function() {
        var info = $('#in').val();

        if (info == "info") {
            $('#info').css({'background': 'darkgray'});
            
        } else if (info == "address") {
            $('#address').css({'background': 'darkgray'});
            
        } else if (info == "order") {
            $('#order').css({'background': 'darkgray'});
            
        } else if (info == "password") {
            $('#password').css({'background': 'darkgray'});
            
        }
	});	
</script>
