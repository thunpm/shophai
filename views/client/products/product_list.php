
<?php require('views/client/layouts/header.php'); ?>
<?php require('views/client/layouts/menu.php'); ?>

<!-- Trang sản phâm -->
<div class="product-detail">
    <ul class="breadcrum">
        <li class="active"><a href="index.php?controller=page&action=home" class="breadcrum__active">Trang chủ</a> <span class="active">/&nbsp</span></li>                
        <li class="active"> Điện thoại</li>
    </ul> 
    <?php 
    if($listDM != null) {
        foreach ($listDM as $danhMuc) {
            if ($danhMuc->maDM == $maDanhMuc) {
    ?>
        <div class="product-list">
            <div class="product-list-filter">
                <div style="width: 35%;">
                    <span class="product-list-filter__label"><?= $danhMuc->tenDM ?></span>
                    <span class="product-list-filter__quantity">(<?= count($danhMuc->listSP) ?> sản phẩm)</span>
                </div>
                <div class="product-moble">
                    <div class="product-moble__icon">
                        <i class="fas fa-chevron-circle-down product-list-moble__icon "></i>
                    </div>
                    <div class="product-list-moble">  
                        <div class="product-list-moble__filter active"> 
                            <button class="filter__btn active">Tất cả</a>
                        </div>
                        <?php
                        foreach ($danhMuc->listTL as $theLoai) {
                        ?>
                            <div class="product-list-moble__filter"> 
                                <button class="filter__btn"><?= $theLoai->tenTL ?></a>
                            </div> 
                        <?php	
                        }
                        ?>	
                    </div>
                </div>    
            </div>
        </div>
        <div class="product-list">
            <div class="product-list-filter">
                <div>
                    <span class="product-list-filter__label">Chọn mức giá</span>
                </div>
                <div class="product-moble">
                    <div class="product-moble__icon">
                        <i class="fas fa-chevron-circle-down product-list-moble__icon "></i>
                    </div>
                    <div class="product-list-moble">
                        <div class="product-list-moble__filter"> 
                            <button class="filter__btn ">Dưới 2 triệu</button>
                        </div> 
                        <div class="product-list-moble__filter"> 
                            <button class="filter__btn">Từ 2 triệu đến 6 triệu</button>
                        </div> 
                        <div class="product-list-moble__filter"> 
                            <button class="filter__btn ">Từ 6 triệu đến 10 triệu</button>
                        </div> 
                        <div class="product-list-moble__filter"> 
                            <button class="filter__btn ">Trên 10 triệu</button>
                        </div> 
                    </div>
                </div>
            </div>
        </div>
        <div class="product-list">
            <div class="product-detail__same">
                <div class="product-list__title">
                    <div class="product-list__title-heading">Bán chạy nhất </div>
                    <div class="product-list__select">
                        <span class="product-list__select-sort">Sắp xếp theo: </span>
                        <div class="select-input">
                            <span class="select-input__label">Bán chạy nhất</span>
                            <i class="fas fa-angle-down select-input__icon"></i>
                            <!-- list options -->
                            <ul class="select-input__list">
                                <li class="select-input__item">
                                    <a href="" class="select-input__link">Bán chạy nhất</a>
                                </li>
                                <li class="select-input__item">
                                    <a href="" class="select-input__link">Mới nhất</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="product-selling">
                    <?php
                    foreach ($danhMuc->listSP as $sanPham) {
                    ?>
                    <div class="product-similar__list">  
                        <a href="index.php?controller=product&action=product_detail" class="product-similar-item">
                            <img class="product-similar-item__img" src="assets/images/products/<?= $sanPham->listHinh[0]->tenHinh?>">
                            <h5 class="product-similar-item__name">Điện thoại iphone 12 Pro Max 256 GB</h5>                         
                            <?php
                            $dem = 0;
                            foreach ($sanPham->listDacTinh as $dacTinh) {
                                $dem += 1;
                                if ($dem <= 4) {
                            ?>
                                <div data-toggle="tooltip" data-placement="top" title="<?= $dacTinh->tenDT ?>" class="dac-tinh">
                                    <?= $dacTinh->chiTietDT ?>
                                </div>
                            <?php
                                }
                            }
                            ?>
                            <div class="product-similar-item__price">
                                <?php
                                if ($sanPham->khuyenMai > 0) {
                                ?>
                                    <span class="product-item__price-current"><?= number_format($sanPham->gia) ?> đ</span>
                                <?php
                                }
                                ?>
                                <span class="product-similar-item__price-old"><?= number_format($sanPham->gia-$sanPham->khuyenMai) ?> đ</span>
                            </div>
                            <div class="product-item__action">
                                <!-- <div class="product-item__ration">
                                    <i class="product-item__star fas fa-star"></i>
                                    <i class="product-item__star fas fa-star"></i>
                                    <i class="product-item__star fas fa-star"></i>
                                    <i class="product-item__star fas fa-star"></i>
                                    <i class="product-item__star fas fa-star"></i>
                                </div> -->
                                <span class="product-similar-item__sold">Đã bán <?= $sanPham->soLuongBan ?></span>
                            </div>                          
                            <?php
                            if ($sanPham->khuyenMai > 0) {
                            ?>
                                <div class="product-similar-item__sale-off">
                                    <span class="product-similar-item__sale-off-label">GIẢM</span>
                                </div>
                            <?php
                            }
                            ?>
                        </a>
                    </div>
                    <?php
                    }
                    ?>
                </div>
                <!-- phân trang -->
                <ul class="pagination product__pagination">
                            <li class="pagination-item">
                                <a href="" class="pagination-item__link">
                                    <i class="pagination-item__icon fas fa-angle-left"></i>
                                </a>
                            </li>
                            <li class="pagination-item pagination-item--active">
                                <a href="" class="pagination-item__link">1</a>
                            </li>
                            <li class="pagination-item">
                                <a href="" class="pagination-item__link">2</a>
                            </li>
                            <li class="pagination-item">
                                <a href="" class="pagination-item__link">3</a>
                            </li>
                            <li class="pagination-item">
                                <a href="" class="pagination-item__link">4</a>
                            </li>
                            <li class="pagination-item">
                                <a href="" class="pagination-item__link">5</a>
                            </li>
                            <li class="pagination-item">
                                <a href="" class="pagination-item__link">...</a>
                            </li>
                            <li class="pagination-item">
                                <a href="" class="pagination-item__link">14</a>
                            </li>
                            <li class="pagination-item">
                                <a href="" class="pagination-item__link">
                                    <i class="pagination-item__icon fas fa-angle-right"></i>
                                </a>
                            </li>
            </ul>
            </div>
        </div>
    <?php
            }
        }
    }
    ?>
</div>

<?php require('views/client/layouts/footer.php'); ?>




