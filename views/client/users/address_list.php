<?php require('views/client/layouts/header.php'); ?>
<?php require('views/client/layouts/menu.php'); ?>
<div class="main-block">
    <div class="content">
        <div class="contact__title">
            <h3 class="contact__heading" >LIÊN HỆ</h3>
        </div>
        <div class="user-info-block">
            <div class="list-user-info">
                <ul>
                    <li>
                        <i class="far fa-user-circle"></i>
                        <div>
                            <p>Tài khoản</p>
                            <p>Thư</p>
                        </div>
                    </li>
                    <li><a href="index.php?controller=user&action=info"><i class="fas fa-user-edit"></i>    Thông tin tài khoản</a></li>
                    <li><a href="index.php?controller=user&action=password"><i class="fas fa-key"></i>    Thay đổi mật khẩu</a></li>
                    <li><a href="index.php?controller=user&action=order"><i class="far fa-list-alt"></i>    Đơn hàng đã đặt</a></li>
                    <li><a href="index.php?controller=user&action=address_list"><i class="far fa-address-book"></i>    Sổ địa chỉ</a></li>
                </ul>
            </div>
            <div class="user-info">
                <div class="add-address">
                    <a href="#">+ Thêm địa chỉ</a>
                </div>
                <div class="list-address">
                    <div class="address">
                        <div class="info">
                            <ul>
                                <li>NGUYỄN PHAN MINH THƯ</li>
                                <li>Địa chỉ: Quảng Nam, Việt Nam</li>
                                <li>Số điện thoại: 0987654321</li>
                            </ul>
                        </div>
                        <div class="info">
                            <p class="mac-dinh">Địa chỉ mặc định</p>
                        </div>
                        <div class="info">
                            <a href="#">Chỉnh sửa</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<?php require('views/client/layouts/footer.php'); ?>