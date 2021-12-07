<?php require('views/client/layouts/header.php'); ?>
<?php require('views/client/layouts/menu.php'); ?>
<div class="pay">
    <div class="product-detail__title">
        <h3 class="product-detail__heading" >THANH TOÁN</h3>
    </div>

    <div class="pay-generality">
        <!-- phương thức thanh toán -->
        <div class="pay-generality__payment">
            <h3 class="pay-generality__name">1. CHỌN PHƯƠNG THỨC THANH TOÁN</h3>    
            <div class="pay-generality__payment-methods">
                <div class="pay-generality__selection">
                    <input name="pay" type="radio" value="Thẻ ngân hàng" />  Thẻ ngân hàng
                </div>
                <div class="pay-generality__selection">
                    <input name="pay" type="radio" value="Ví điện tử" />  Ví điện tử
                </div>
                <div class="pay-generality__selection">
                    <input name="pay" type="radio" value="Điện thoại" />  Điện thoại
                </div>
        </div>
    <!-- phương thức vận chuyển -->
        </div>
        <div class="pay-generality__payment">
            <h3 class="pay-generality__name">2. CHỌN PHƯƠNG THỨC VẬN CHUYỂN</h3>    
            <div class="pay-generality__payment-methods">
                <div class="pay-generality__selection">
                    <input name="transport" type="radio" value="Giao hàng nhanh" />  Giao hàng nhanh
                </div>
                <div class="pay-generality__selection">
                    <input name="transport" type="radio" value="Giao hang tiết kiệm" />  Giao hang tiết kiệm
                </div>
                <div class="pay-generality__selection">
                    <input name="transport" type="radio" value="Giao hàng siêu tốc" />  Giao hàng siêu tốc
                </div>
            </div>
        </div>
        <!-- địa chỉ và đơn hàng -->
        <div class="pay-generality__delivery">
            <div class="pay-generality__delivery-address">
                <div class="pay-generality__delivery-address--item">
                    <h4 class="pay-generality__delivery-name">Địa chỉ giao hàng</h4>
                    
                </div>
                <ul class="pay-generality__information">
                    <li class="pay-generality__information-item pay-generality__information-name">Nguyễn Phan Minh Thư</li>
                    <li class="pay-generality__information-item">Đà Nẵng, Việt Nam</li>
                    <li class="pay-generality__information-item">0987654321</li>
                
                </ul> 
               <a href="#" class="pay-generality__btn">
                     <button class="btn btn_pram"> Thay đổi địa chỉ</button>
                </a>
        </div>
<!-- đơn hàng -->
            <div class="pay-generality__delivery-address">
                <div class="pay-generality__delivery-address--item">
                    <h4 class="pay-generality__delivery-name">Đơn hàng</h4>
                 </div>
               <ul class="pay-generality__information " style="padding-bottom: 15px;" >
                   <li class="pay-generality__information-item" style="font-weight: 500;">3 Sản phẩm</li>
                   <li class="pay-generality__information-item">
                       <a href="#">Xem thông tin</a>
                       <i class=" pay-generality__icon fas fa-play"></i>
                   </li>
               </ul>

               
               <div class="pay-generality__information--list">
                    <div class="pay-generality__provisional">
                        <li class="pay-generality__provisional-name">
                            Tạm tính:    
                        </li>
                        <li class="pay-generality__provisional-price">
                            73.500.000đ
                        </li>
                    </div>
                    <div class="pay-generality__provisional">
                        <li class="pay-generality__provisional-name">
                             Phí vận chuyển:    
                        </li>
                        <li class="pay-generality__provisional-price">
                            100.000đ
                        </li>
                    </div>
                    <div class="pay-generality__provisional">
                        <li class="pay-generality__provisional-name" style="font-weight: 500;">
                        Thành tiền:    
                    </li>
                    <li class="pay-generality__provisional-price" style="color: #ED5323;font-weight: 500;">
                    73.600.000đ
                    </li>
                    </div>

                   
                  </div>

                                
            </div>
            
        </div>
        <div class="count-right">
					<a href="#">ĐẶT HÀNG</a>	
				</div>
				<div class="clr"></div>
    

    </div>
</div>
<?php require('views/client/layouts/footer.php'); ?>