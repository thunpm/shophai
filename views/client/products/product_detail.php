<?php require('views/client/layouts/header.php'); ?>
<?php require('views/client/layouts/menu.php'); ?>
<div class="product-detail">
    <ul class="breadcrum">
        <li class="active"><a href="index.php?controller=page&action=home" class="breadcrum__active">Trang chủ</a> <span class="active">/&nbsp</span></li> 
        <li class="active"><a href="index.php?controller=product&action=product_list&danhmuc=<?php if($maDM != null) echo $maDM;?>" class="breadcrum__active"><?php if($tenDM != null) echo $tenDM;?></a> <span class="active">/&nbsp</span></li>               
        <li class="active"> Chi tiết sản phẩm</li>
    </ul> 
    <!-- tiêu đề -->
    <div class="product-detail__title">
        <h3 class="product-detail__heading" >CHI TIẾT SẢN PHẨM</h3>
    </div>
    <!-- thông tin  -->
    <div class="product-detail__infor">
        <div class="product-detail__infor-img">
            <?php 
                if($sanPham != null) {
            ?>

            <img src="assets/images/products/<?= $sanPham->listHinh[0]->tenHinh?>" alt="Mô tả" class="product-detail__img-big">
            <br/>
            <?php
            if(count($sanPham->listHinh)> 1) {
            ?>
            <img src="assets/images/products/<?= $sanPham->listHinh[1]->tenHinh?>" alt="Mô tả" class="product-detail__img-small">
            <?php }?>
        </div>
        <div class="product-detail__infor--parameter">

            <h4 class="product-detail__infor--name"><?=$sanPham->tenSP?></h4>

                <div class="product-detail__infor--par">
                    <?php
                    if($sanPham->khuyenMai > 0) { 
                    ?>
                        <span class="product-detail__infor--price"><?=number_format($sanPham->gia - $sanPham->khuyenMai)?> đ</span>
                        <span style="color: #d21809;text-decoration: line-through;font-weight: bold; padding-left: 5px;"><?= number_format($sanPham->gia) ?> đ</span>
                    <?php } else {?>
                        <span class="product-detail__infor--price"><?=number_format($sanPham->gia)?> đ</span>
                    <?php }?>
                    <br/><br/>
                    <span class="product-detail__infor--eva">
                        <span class="product-item">
                        <!--tính tb lượt đáng giá-->
                        <?php
                            if($nhanXet != null && count($nhanXet) > 0) {
                                $soLuongDG = count($nhanXet);
                                $tongDG = 0;
                                foreach($nhanXet as $i) {
                                    $tongDG += $i->danhgia;
                                }
                                $tb = round($tongDG/$soLuongDG);
                        ?>
                        <!--hiển thị số sao-->
                        <?php
                            for($i = 1; $i <=$tb; $i++) {
                        ?>
                            <i class="product-item__star fas fa-star"></i>
                        <?php }?>
                        <!--hiển thị phần sao còn lại-->
                        <?php
                            for($i = $tb+1; $i <=5; $i++) {
                        ?>
                            <i class="fas fa-star"></i>
                        <?php }
                            echo $soLuongDG.' đánh giá';
                        ?>
                        <?php } else {
                            echo '0 đánh giá';
                        }?>
                        </span>
                    </span>
                    <span class="product-detail__infor--sall"><?=$sanPham->soLuongBan?> Đã bán</span>
                </div>

            <h5 class="product-detail__infor-color">Có 4 màu sắc</h5>

            <div class="product-detail__Color">
                <div class="product-detail__Color-infor">
                    <span class="product-detail__Color-infor--back"></span>
                </div>
                <div class="product-detail__Color-infor">
                    <span class="product-detail__Color-infor--while"></span>
                </div>
                <div class="product-detail__Color-infor">
                    <span class="product-detail__Color-infor--bule"></span>
                    </div>
                <div class="product-detail__Color-infor">
                    <span class="product-detail__Color-sinfor--pink"></span>
                </div>
            </div>
            <!-- số lượng muốn mua -->
            <div class="product-detail__number">
                <span class="product-detail__number-name"> Số lượng: </span>
                <button class="product-detail__number-minus product-detail__number-reduce" onclick="giam()">
                    <i class="fas fa-minus"></i>
                </button>
                <input type="hidden" id="soLuongCo" name="id" value="<?= $sanPham->soLuongCo ?>">
                <input onchange="nhap()" id="soLuong" type="text" value="1" class="product-detail__number-minus product-detail__number-one">
                <button class="product-detail__number-minus" onclick="tang()">
                    <i class="fas fa-plus"></i>
                </button>
            </div>
            <!-- thêm giỏ hàng -->
            <form action="index.php?controller=cart&action=add" method="post">
                <input type="hidden" name="id" value="<?= $sanPham->maSP ?>">
                <input id="soLuongMua" type="hidden" name="soLuong" value="1">
                <div class="product-btn">
                    <input type="submit" value="THÊM GIỎ HÀNG" class="btn btn_pram"/>
                </div>
            </form>
            <!-- mua ngay -->
            <!-- <form action="index.php?controller=order&action=add" method="post">
                <input type="hidden" name="id" value="<?= $sanPham->maSP ?>">
                <input type="hidden" name="soLuong" value="">
                <div class="product-btn">
                    <input type="submit" value="MUA NGAY" class="btn btn_pram"/>
                </div>
            </form> -->
            <!-- chương trình khuyến mãi -->
            <div class="box-promotion">
                    <h2 class="box-promotion__wrap">
                    <div class="box-promotion__wrap-ribbon">
                    <a href="#"> Ưu đãi chỉ có tại Hai Shop </a></div></h2>
                <div class="box-content">
                       <li class="box-content__list">
                            <span class="box-content__list-number"> 1 </span>
                            <div class="box-content__list-promotion">
                                <p>Bảo hành 24 tháng.</p>
                            </div>
                        </li>
                        
                    
                    <li class="box-content__list">
                            <span class="box-content__list-number"> 2 </span>
                            <div class="box-content__list-promotion">
                            <p>Giảm thêm 5% khi mua cùng sản phẩm bất kỳ có giá cao hơn.</p>
                            </div>
                        </li>
                        <li class="box-content__list">
                            <span class="box-content__list-number"> 3 </span>
                            <div class="box-content__list-promotion">
                                <p>Giảm 500.000 khi thanh toán bằng ví điện tử.</p>
                            </div>
                        </li>
                    
                </div>
            </div>   
        </div>
        
    
    </div>
    <!-- chi tiết sản phẩm -->
    <div class="product-detail__same">
        <div class="product-detail__shared-heading">
            CHI TIẾT SẢN PHẨM
        </div>
        <!--giới thiệu sản phẩm-->
        <div style="display: flex;">
            <div style="width: 50%; border-right: 2px solid gainsboro;">
                <div class="product-detail__description">
                    <?= $sanPham->moTa?>
                </div>
            </div>
            <div class="product-detail__description">
                <ul>
                    <li class="product-detail__list">Thương hiệu</li>
                    <li class="product-detail__list">Hạng bảo hành</li>
                    <li class="product-detail__list">Loại bảo hành</li>
                    <li class="product-detail__list">Sản phẩm còn lại</li>
                </ul>
                <ul >
                    <li class="product-detail__dots">:  </li>                   
                    <li class="product-detail__dots">: </li>
                    <li class="product-detail__dots">: </li>
                    <li class="product-detail__dots">:</li>
                </ul>
                <ul >
                    <li class="product-detail__list">
                        <span style="color: blue;"><?= $tenTheLoai?></span> </li>
                    <li class="product-detail__list">24 tháng</li>
                    <li class="product-detail__list">Bảo hành nhà sản xuất</li>
                    <li class="product-detail__list"><?=($sanPham->soLuongCo)?></li>
                </ul>
            </div>
        </div>
    </div>
    <!-- thông số kỹ thuật -->
    <div class="product-detail__same">
        <div class="product-detail__shared-heading">
            THÔNG SỐ KỸ THUẬT
        </div>
        <div class="product-detail__parameter">
            <div class="product-detail__parameter-list">
                    <ul>
                    <?php
                        foreach ($sanPham->listDacTinh as $dacTinh) {
                    ?>
                        <li class="product-detail__list"><?=$dacTinh->tenDT?></li>
                    <?php }?>  
                    </ul>

                    <ul >
                    <?php
                        foreach ($sanPham->listDacTinh as $dacTinh) {
                    ?>
                        <li class="product-detail__dots">:  </li>  
                    <?php }?>                
                    </ul>

                    <ul >
                    <?php
                        foreach ($sanPham->listDacTinh as $dacTinh) {
                    ?>
                         <li class="product-detail__list"><?= $dacTinh->chiTietDT ?></li>
                    <?php }?>  
                    </ul>
            </div>
        </div>
        
    </div>
    <?php } ?>
    <!-- sản phẩm tương tự -->
    <div class="product-detail__same">
        <div class="product-detail__shared-heading">
           SẢN PHẨM TƯƠNG TỰ
        </div>
        <div class="product-similar">

                <div id="carouselP10" class="carousel slide" data-ride="carousel" data-interval="false">
					<div class="carousel-inner">
						<div class="carousel-item active">
							<div class="card-list">
								<?php
                                $demSanPham = 0;
                                foreach ($spLienQuan as $sanPham) {
                                    $demSanPham += 1;
                                    if ($demSanPham <= 4) {
                                ?>
                                    <a href="index.php?controller=product&action=product_detail&masp=<?=$sanPham->maSP?>" class="card">
                                        <img class="product-similar-item__img" src="assets/images/products/<?= $sanPham->listHinh[0]->tenHinh?>" alt="Card image cap">
                                        <div class="card-body">
                                            <h5 class="card-title"><?= $sanPham->tenSP ?></h5>
                                            <div class="card-text">
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
                                                <div class="gia">
                                                    <?php
                                                    if ($sanPham->khuyenMai > 0) {
                                                    ?>
                                                        <p class="gia-goc"><?= number_format($sanPham->gia) ?> đ</p>
                                                    <?php
                                                    }
                                                    ?>
                                                    <p class="gia-km"><?= number_format($sanPham->gia-$sanPham->khuyenMai) ?> đ</p>
                                                </div>
                                                <div class="product-item__action">
                                                    <!--<div class="product-item__ration">
                                                        <i class="product-item__star fas fa-star"></i>
                                                        <i class="product-item__star fas fa-star"></i>
                                                        <i class="product-item__star fas fa-star"></i>
                                                        <i class="product-item__star fas fa-star"></i>
                                                        <i class="fas fa-star"></i>
                                                    </div>-->
                                                    <span class="product-similar-item__sold">Đã bán <?= $sanPham->soLuongBan ?> </span>
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
                                            </div>
                                        </div>
                                    </a>
                                <?php
                                    }
                                }
                                ?>
							</div>
						</div>
						<?php
                        if (count($spLienQuan) > 4) {
                        ?>
                        <div class="carousel-item">
                            <div class="card-list">
                                <?php
                                $demSanPham = 0;
                                foreach ($spLienQuan as $sanPham) {
                                    $demSanPham += 1;
                                    if ($demSanPham >= 5 && $demSanPham <= 8) {
                                ?>
                                    <a href="index.php?controller=product&action=product_detail&masp=<?=$sanPham->maSP?>" class="card">
                                        <img class="product-similar-item__img" src="assets/images/products/<?= $sanPham->listHinh[0]->tenHinh?>" alt="Card image cap">
                                        <div class="card-body">
                                            <h5 class="card-title"><?= $sanPham->tenSP ?></h5>
                                            <div class="card-text">
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
                                                <div class="gia">
                                                    <?php
                                                    if ($sanPham->khuyenMai > 0) {
                                                    ?>
                                                        <p class="gia-goc"><?= number_format($sanPham->gia) ?> đ</p>
                                                    <?php
                                                    }
                                                    ?>
                                                    <p class="gia-km"><?= number_format($sanPham->gia-$sanPham->khuyenMai) ?> đ</p>
                                                </div>
                                                <div class="product-item__action">
                                                    <!--<div class="product-item__ration">
                                                        <i class="product-item__star fas fa-star"></i>
                                                        <i class="product-item__star fas fa-star"></i>
                                                        <i class="product-item__star fas fa-star"></i>
                                                        <i class="product-item__star fas fa-star"></i>
                                                        <i class="fas fa-star"></i>
                                                    </div>-->
                                                    <span class="product-similar-item__sold">Đã bán <?= $sanPham->soLuongBan ?> </span>
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
                                            </div>
                                        </div>
                                    </a>
                                <?php
                                    }
                                }
                                ?>
                            </div>
                        </div>
                    <a class="carousel-control-prev" role="button" href="#carouselP10" data-slide="prev">
                        <span class="fas fa-angle-left" aria-hidden="true"></span>
                        <span class="sr-only"></span>
                    </a>    
                    <a class="carousel-control-next" role="button" href="#carouselP10" data-slide="next">
                        <span class="fas fa-angle-right" aria-hidden="true"></span>
                        <span class="sr-only"></span>
                    </a>
                        <?php
                        }
                        ?>
                </div>
        </div>
    </div>
    </div>
    <!-- đánh giá sản phẩm -->
    <div class="product-detail__same">
        <div class="product-detail__shared-heading">
            ĐÁNH GIÁ SẢN PHẨM
        </div>
        <div class="product-detail__evaluate">
            <span class="product-detail__no-evaluate-msg">
            <?php 
            if($nhanXet == null) {
                for($i = 1; $i <=5; $i++) {
            ?>
                    <i class="fas fa-star"></i>
            <?php 
            }
            echo '<img src="https://icon-library.com/images/smile-icon-png/smile-icon-png-0.jpg" alt="" class="product-detail__no-evaluate-img">"';
            echo '<div style="margin-left: 10px;">Chưa có đánh giá nào !</div>';} 
            ?>  
            <!--tính tb lượt đáng giá-->
            <?php 
            if($nhanXet != null && count($nhanXet) > 0) {
                $soLuongDG = count($nhanXet);
                $tongDG = 0;
                foreach($nhanXet as $i) {
                $tongDG += $i->danhgia;
                }
                $trungBinh = round($tongDG/$soLuongDG, 1);
                $tb = round($tongDG/$soLuongDG);
            ?>
                <!--hiển thị số sao-->
                <?php
                    for($i = 1; $i <= $tb; $i++) {
                ?>
                    <i class="product-item__star fas fa-star"></i>
                <?php 
                }
                ?>
                <!--hiển thị phần sao còn lại-->
                <?php
                    for($i = $tb+1; $i <=5; $i++) {
                ?>
                    <i class="fas fa-star"></i>

                <?php 
                }
                echo '</span>';
                echo '<span style="font-size: 24px; font-weight: bold; display: flex; justify-content: center;">'.$trungBinh.'/5 
                        <span style="font-size: 18px; color: #747473; line-height: normal; font-weight: normal; margin-left: 7px;">('.$soLuongDG.' đánh giá)</span>
                    </span>';
                ?>
                <!--hiển thị đánh giá-->
                <div style="padding: 35px 0px 10px 0px;">
                    <table class="table" style="width: 100%;">
                        <?php
                        foreach($nhanXet as $nx) {
                        ?>
                        <tr style="margin-bottom: 10px;">
                            <td style="width: 300px; float: left; padding-right: 100px; border-top: none;">
                                <strong><?=$nx->maKH?></strong>
                            </td>
                            <td style="float: left; border-top: none;">
                                <?php
                                for($i = 1; $i <= $nx->danhgia; $i++) {
                                    echo '<i class="product-item__star fas fa-star"></i>';
                                }
                                ?>
                                <br/>
                                <p style="margin-top: 10px;"><?= $nx->nhanXet ?></p>
                            </td>
                        </tr>
                        <?php 
                        }
                        ?>
                    </table>
                </div>
            <?php    
            }
            ?>
        </div>
    </div>
</div>

<?php require('views/client/layouts/footer.php'); ?>

<script>
    function giam() {
        var soLuongMua = document.getElementById("soLuongMua");
        var soLuong = document.getElementById("soLuong");

        if (soLuong.value > 1) {
            soLuong.value = soLuong.value - 1;
            soLuongMua.value = soLuong.value;
        } else {
            alert("Số lượng cần chọn phải lớn hơn 0!");
        }
    }

    function tang() {
        var soLuongMua = document.getElementById("soLuongMua");
        var soLuongCo = document.getElementById("soLuongCo");
        var soLuong = document.getElementById("soLuong");

        if (Number(soLuong.value) < Number(soLuongCo.value)) {
            soLuong.value = Number(soLuong.value) + 1;
            soLuongMua.value = soLuong.value;
        } else {
            alert("Số lượng hiện có không đủ!");
        }
    }

    function nhap() {
        var soLuongMua = document.getElementById("soLuongMua");
        var soLuongCo = document.getElementById("soLuongCo");
        var soLuong = document.getElementById("soLuong");

        if (Number(soLuong.value) <= Number(soLuongCo.value)) {
            soLuong.value = Number(soLuong.value);
            soLuongMua.value = soLuong.value;
        } else {
            soLuong.value = Number(soLuongCo.value);
            soLuongMua.value = soLuong.value;
            alert("Số lượng hiện có không đủ!");
        }
    }

</script>
