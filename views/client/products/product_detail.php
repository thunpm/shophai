<?php require('views/client/layouts/header.php'); ?>
<?php require('views/client/layouts/menu.php'); ?>
<div class="product-detail">
    <ul class="breadcrum">
        <li class="active"><a href="index.php?controller=page&action=home" class="breadcrum__active">Trang chủ</a> <span class="active">/&nbsp</span></li> 
        <li class="active"><a href="index.php?controller=product&action=product_list" class="breadcrum__active">Điện Thoại</a> <span class="active">/&nbsp</span></li>               
        <li class="active"> Chi tiết sản phẩm</li>
    </ul> 
    <!-- tiêu đề -->
    <div class="product-detail__title">
        <h3 class="product-detail__heading" >CHI TIẾT SẢN PHẨM</h3>
    </div>
    <!-- thông tin  -->
    <div class="product-detail__infor">
        <div class="product-detail__infor-img">
            <img src="https://cdn.nguyenkimmall.com/images/thumbnails/180/180/detailed/702/dien-thoai-iphone-12-pro-256gb-xanh-1.jpg" alt="Mô tả" class="product-detail__img-big">
       
            <div class="product-detail__infor-img--item">
                <img src="assets/images/products/minhhoa.jpg" alt="" class="product-detail__img-small">
                <img src="https://www.duchuymobile.com/images/thumbnails/180/180/detailed/37/bac.jpg" alt="" class="product-detail__img-small">
                <img src="https://www.duchuymobile.com/images/thumbnails/180/180/detailed/44/iphone-13-pro-xanh_1ikv-b2.jpg" alt="" class="product-detail__img-small">
                <img src="https://cdn.nguyenkimmall.com/images/thumbnails/180/180/detailed/702/dien-thoai-iphone-12-pro-256gb-xanh-1.jpg" alt="" class="product-detail__img-small">
            
            </div>
        </div>
        <div class="product-detail__infor--parameter">

            <h4 class="product-detail__infor--name">Điện Thoại Iphone 12</h4>

                <div class="product-detail__infor--par">
                    <span class="product-detail__infor--price">24.500.000đ</span>
                    <span class="product-detail__infor--eva">Chưa có đánh giá</span>
                    <span class="product-detail__infor--sall">0 Đã bán</span>
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
               <button class="product-detail__number-minus product-detail__number-reduce"><i class="fas fa-minus"></i></button>
                <input type="text" role="spinbutton" aria-valuenow="1" value="1" class="product-detail__number-minus product-detail__number-one">
                <button class="product-detail__number-minus"><i class="fas fa-plus"></i></button>
            </div>
            <div class="product-btn">
                <a href="index.php?controller=cart&action=list" class="product-btn__add">
                     <button class="btn btn_pram"> THÊM GIỎ HÀNG</button>
                </a>
                <a href="index.php?controller=cart&action=pay" class="product-btn__add">
                    <button class="btn btn_pram product-btn__buying"> MUA NGAY</button>
                </a>
            </div>
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
        <div class="product-detail__description">
            <ul>
                <li class="product-detail__list">Thương hiệu</li>
                <li class="product-detail__list">Hạng bảo hành</li>
                <li class="product-detail__list">Dung lượng pin</li>
                <li class="product-detail__list">Loại bảo hành</li>
                <li class="product-detail__list">Ram</li>
                <li class="product-detail__list">Dung lượng lưu trữ</li>
                <li class="product-detail__list">Sản phẩm còn lại</li>
            </ul>
            <ul >
                <li class="product-detail__dots">:  </li>                   
                <li class="product-detail__dots">: </li>
                <li class="product-detail__dots">: </li>
                <li class="product-detail__dots">:</li>
                <li class="product-detail__dots">: </li>
                <li class="product-detail__dots">: </li>
                <li class="product-detail__dots">: </li>
            </ul>
            <ul >
                <li class="product-detail__list">
                    <span style="color: blue;">Apple</span> </li>
                <li class="product-detail__list">12 tháng</li>
                <li class="product-detail__list">3697mAh</li>
                <li class="product-detail__list">Bảo hành nhà sản xuất</li>
                <li class="product-detail__list">6GB</li>
                <li class="product-detail__list">256 GB</li>
                <li class="product-detail__list">300</li>
            </ul>
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
                        <li class="product-detail__list">Series</li>
                        <li class="product-detail__list">Thời gian bảo hành</li>
                        <li class="product-detail__list">Xuất sứ</li>
                        <li class="product-detail__list">Height(mm)</li>
                        <li class="product-detail__list">Chất liệu</li>
                        <li class="product-detail__list">Trọng lượng</li>
                        <li class="product-detail__list">CPU 2 X Fiestorm</li>
                        <li class="product-detail__list">Số nhân</li>
                        <li class="product-detail__list">Tốc độ tối đa</li>
                        <li class="product-detail__list">Loại SIM</li>
                        <li class="product-detail__list">Công nghệ màn hình</li>
                        <li class="product-detail__list">Kích thước</li>
                        <li class="product-detail__list">Chuẩn màn hình</li>
                        <li class="product-detail__list">Độ phân giải</li>
                        <li class="product-detail__list">Phụ kiện trong hộp</li>
                    </ul>
                    <ul >
                        <li class="product-detail__dots">:  </li>                   
                        <li class="product-detail__dots">: </li>
                        <li class="product-detail__dots">: </li>
                        <li class="product-detail__dots">:</li>
                        <li class="product-detail__dots">: </li>
                        <li class="product-detail__dots">: </li>
                        <li class="product-detail__dots">: </li>
                        <li class="product-detail__dots">:  </li>                   
                        <li class="product-detail__dots">: </li>
                        <li class="product-detail__dots">: </li>
                        <li class="product-detail__dots">:</li>
                        <li class="product-detail__dots">: </li>
                        <li class="product-detail__dots">: </li>
                        <li class="product-detail__dots">: </li>
                    </ul>
                    <ul >
                        <li class="product-detail__list">IPhone 12Pro Max </li>
                        <li class="product-detail__list">12 tháng</li>
                        <li class="product-detail__list">Mỹ</li>
                        <li class="product-detail__list">160.8</li>
                        <li class="product-detail__list">Viên thép, mặt bóng mờ</li>
                        <li class="product-detail__list">228g</li>
                        <li class="product-detail__list">3.1GHz + 4x Icestorm 1.8GB</li>
                        <li class="product-detail__list">6</li>
                        <li class="product-detail__list">3.10GHz</li>
                        <li class="product-detail__list">1 eSIM, 1 Nano SIM</li>
                        <li class="product-detail__list">OLED</li>
                        <li class="product-detail__list">6.7"</li>
                        <li class="product-detail__list">Super Retina XDR</li>
                        <li class="product-detail__list">2778 x 1284 Pixel</li>
                    </ul>

            </div>
            <div class="product-detail__parameter-img">
                <img style="height: 380px;" src="https://cdn.nguyenkimmall.com/images/thumbnails/696/522/companies/_1/TSKT/vien-thong/2020/dien-thoai-iphone-12-pro-256gb-xanh.jpg" alt="Thông số">
            </div>
        </div>
        
    </div>
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
								<a href="index.php?controller=product&action=product_detail" class="card">
									<img class="product-similar-item__img" src="assets/images/products/minhhoa.jpg" alt="Card image cap">
									<div class="card-body">
										<h5 class="card-title">Iphone</h5>
										<div class="card-text">
											<div data-toggle="tooltip" data-placement="top" title="CPU" class="dac-tinh">
												A14 Bionic
											</div>
											<div data-toggle="tooltip" data-placement="top" title="Màn hình" class="dac-tinh">
												6.1"
											</div>
											<div data-toggle="tooltip" data-placement="top" title="RAM" class="dac-tinh">
												4GB
											</div>
											<div data-toggle="tooltip" data-placement="top" title="Bộ nhớ trong" class="dac-tinh">
												64GB
											</div>
											<div class="gia">
												<p class="gia-goc">21,999,000</p>
												<p class="gia-km">19,999,000</p>
											</div>
											<div class="product-item__action">
												<div class="product-item__ration">
													<i class="product-item__star fas fa-star"></i>
													<i class="product-item__star fas fa-star"></i>
													<i class="product-item__star fas fa-star"></i>
													<i class="product-item__star fas fa-star"></i>
													<i class="fas fa-star"></i>
												</div>
												<span class="product-similar-item__sold">Đã bán 88</span>
											</div>
											<div class="product-similar-item__sale-off">
												<span class="product-similar-item_sale-off-percent">10%</span>
												<span class="product-similar-item__sale-off-label">GIẢM</span>
											</div>
										</div>
									</div>
								</a>
								<a href="index.php?controller=product&action=product_detail" class="card">
                                    <img class="product-similar-item__img" src="assets/images/products/minhhoa.jpg" alt="Card image cap">
                                    <div class="card-body">
                                        <h5 class="card-title">Iphone</h5>
                                        <div class="card-text">
                                            <div data-toggle="tooltip" data-placement="top" title="CPU" class="dac-tinh">
                                                A14 Bionic
                                            </div>
                                            <div data-toggle="tooltip" data-placement="top" title="Màn hình" class="dac-tinh">
                                                6.1"
                                            </div>
                                            <div data-toggle="tooltip" data-placement="top" title="RAM" class="dac-tinh">
                                                4GB
                                            </div>
                                            <div data-toggle="tooltip" data-placement="top" title="Bộ nhớ trong" class="dac-tinh">
                                                64GB
                                            </div>
                                            <div class="gia">
                                                <p class="gia-goc">21,999,000</p>
                                                <p class="gia-km">19,999,000</p>
                                            </div>
                                            <div class="product-item__action">
                                                <div class="product-item__ration">
                                                    <i class="product-item__star fas fa-star"></i>
                                                    <i class="product-item__star fas fa-star"></i>
                                                    <i class="product-item__star fas fa-star"></i>
                                                    <i class="product-item__star fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                </div>
                                                <span class="product-similar-item__sold">Đã bán 88</span>
                                            </div>
                                            <div class="product-similar-item__sale-off">
                                                <span class="product-similar-item_sale-off-percent">10%</span>
                                                <span class="product-similar-item__sale-off-label">GIẢM</span>
                                            </div>
                                        </div>
                                    </div>
                                </a>
								<a href="index.php?controller=product&action=product_detail" class="card">
                                    <img class="product-similar-item__img" src="assets/images/products/minhhoa.jpg" alt="Card image cap">
                                    <div class="card-body">
                                        <h5 class="card-title">Iphone</h5>
                                        <div class="card-text">
                                            <div data-toggle="tooltip" data-placement="top" title="CPU" class="dac-tinh">
                                                A14 Bionic
                                            </div>
                                            <div data-toggle="tooltip" data-placement="top" title="Màn hình" class="dac-tinh">
                                                6.1"
                                            </div>
                                            <div data-toggle="tooltip" data-placement="top" title="RAM" class="dac-tinh">
                                                4GB
                                            </div>
                                            <div data-toggle="tooltip" data-placement="top" title="Bộ nhớ trong" class="dac-tinh">
                                                64GB
                                            </div>
                                            <div class="gia">
                                                <p class="gia-goc">21,999,000</p>
                                                <p class="gia-km">19,999,000</p>
                                            </div>
                                            <div class="product-item__action">
                                                <div class="product-item__ration">
                                                    <i class="product-item__star fas fa-star"></i>
                                                    <i class="product-item__star fas fa-star"></i>
                                                    <i class="product-item__star fas fa-star"></i>
                                                    <i class="product-item__star fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                </div>
                                                <span class="product-similar-item__sold">Đã bán 88</span>
                                            </div>
                                            <div class="product-similar-item__sale-off">
                                                <span class="product-similar-item_sale-off-percent">10%</span>
                                                <span class="product-similar-item__sale-off-label">GIẢM</span>
                                            </div>
                                        </div>
                                    </div>
                                </a>
								<a href="index.php?controller=product&action=product_detail" class="card">
                                    <img class="product-similar-item__img" src="assets/images/products/minhhoa.jpg" alt="Card image cap">
                                    <div class="card-body">
                                        <h5 class="card-title">Iphone</h5>
                                        <div class="card-text">
                                            <div data-toggle="tooltip" data-placement="top" title="CPU" class="dac-tinh">
                                                A14 Bionic
                                            </div>
                                            <div data-toggle="tooltip" data-placement="top" title="Màn hình" class="dac-tinh">
                                                6.1"
                                            </div>
                                            <div data-toggle="tooltip" data-placement="top" title="RAM" class="dac-tinh">
                                                4GB
                                            </div>
                                            <div data-toggle="tooltip" data-placement="top" title="Bộ nhớ trong" class="dac-tinh">
                                                64GB
                                            </div>
                                            <div class="gia">
                                                <p class="gia-goc">21,999,000</p>
                                                <p class="gia-km">19,999,000</p>
                                            </div>
                                            <div class="product-item__action">
                                                <div class="product-item__ration">
                                                    <i class="product-item__star fas fa-star"></i>
                                                    <i class="product-item__star fas fa-star"></i>
                                                    <i class="product-item__star fas fa-star"></i>
                                                    <i class="product-item__star fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                </div>
                                                <span class="product-similar-item__sold">Đã bán 88</span>
                                            </div>
                                            <div class="product-similar-item__sale-off">
                                                <span class="product-similar-item_sale-off-percent">10%</span>
                                                <span class="product-similar-item__sale-off-label">GIẢM</span>
                                            </div>
                                        </div>
                                    </div>
                                </a>
							</div>
						</div>
						<div class="carousel-item">
							<div class="card-list">
								<a href="index.php?controller=product&action=product_detail" class="card">
                                    <img class="product-similar-item__img" src="assets/images/products/minhhoa.jpg" alt="Card image cap">
                                    <div class="card-body">
                                        <h5 class="card-title">Iphone</h5>
                                        <div class="card-text">
                                            <div data-toggle="tooltip" data-placement="top" title="CPU" class="dac-tinh">
                                                A14 Bionic
                                            </div>
                                            <div data-toggle="tooltip" data-placement="top" title="Màn hình" class="dac-tinh">
                                                6.1"
                                            </div>
                                            <div data-toggle="tooltip" data-placement="top" title="RAM" class="dac-tinh">
                                                4GB
                                            </div>
                                            <div data-toggle="tooltip" data-placement="top" title="Bộ nhớ trong" class="dac-tinh">
                                                64GB
                                            </div>
                                            <div class="gia">
                                                <p class="gia-goc">21,999,000</p>
                                                <p class="gia-km">19,999,000</p>
                                            </div>
                                            <div class="product-item__action">
                                                <div class="product-item__ration">
                                                    <i class="product-item__star fas fa-star"></i>
                                                    <i class="product-item__star fas fa-star"></i>
                                                    <i class="product-item__star fas fa-star"></i>
                                                    <i class="product-item__star fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                </div>
                                                <span class="product-similar-item__sold">Đã bán 88</span>
                                            </div>
                                            <div class="product-similar-item__sale-off">
                                                <span class="product-similar-item_sale-off-percent">10%</span>
                                                <span class="product-similar-item__sale-off-label">GIẢM</span>
                                            </div>
                                        </div>
                                    </div>
                                </a>
							</div>
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
                </div>
        </div>
    </div>
    <!-- đánh giá sản phẩm -->
    <div class="product-detail__same">
        <div class="product-detail__shared-heading">
            ĐÁNH GIÁ SẢN PHẨM
        </div>
    <div class="product-detail__evaluate">
        
        <img src="https://icon-library.com/images/smile-icon-png/smile-icon-png-0.jpg" alt="" class="product-detail__no-evaluate-img">
        <div class="product-item__rating">
                                            <i class="product-item__star--gold fas fa-star"></i>
                                            <i class="product-item__star--gold fas fa-star"></i>
                                            <i class="product-item__star--gold fas fa-star"></i>
                                            <i class="product-item__star--gold fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                        </div>
         <span class="product-detail__no-evaluate-msg">
                Chưa có đánh giá
           </span>
    </div>
    </div>
</div>
<?php require('views/client/layouts/footer.php'); ?>
