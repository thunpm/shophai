<?php require_once('views/admin/layouts/sibar.php') ?>

<div id="wrapper">
	<div class="workplace">                         
		<div class="row-fluid">
			<div class="span12">                    
				<div class="head">
				<div class="isw">
					<h1 class="isw-grid__heading">DANH SÁCH SẢN PHẨM</h1>
					</div>
					<div class="isw-grid">
                       <a href="admin.php?controller=product&action=add"  class="isw-grid__add">
							<h2 class="isw-grid__text">
								<i class="far fa-plus-square isw-grid__icon"></i>
								Thêm sản phẩm
							</h2>
                       </a>
                    </div>
					<?php
				        if(isset($message)) echo $message;
				    ?>               
					<div class="clear"></div>
				</div>
				<div class="block-sorting">
					
					<table cellpadding="0" cellspacing="0" width="100%" class="table" id="tSortable">
						<thead>
							<tr>
                                <th width="5%">MaSP</th>
								<th width="5%">Tên SP</th>		 
								<th width="20%">Hình ảnh</th>		
								<th width="27%">Mô Tả</th>	 
								<th width="8%">Giá</th>	
								<th width="10%">Số lượng có</th>		
								<th width="10%">Khuyến mãi</th>	 
								<th width="5%">Thể loại</th>
                                <th width="5%"></th>
                                <th width="5%"></th>                                 
							</tr>
						</thead>
						
						<tbody>
						<?php 
							if($dulieu != null) {
								foreach($dulieu as $item) {
						
							
							//  echo"<pre>";
							//  print_r($item);
						?>
							<tr>
                                <td><?=$item->maSP ?></td>
								<td><?=$item->tenSP ?></td>
						
								<td><img src="assets/images/products/<?=  $item->listHinh[0]->tenHinh ?>" width="100%">	</td>
								<td><?=$item->moTa ?></td>	
								<td><?=$item->gia ?></td>
								<td><?=$item->soLuongCo ?></td>	
								<td><?=$item->khuyenMai ?></td>
								<td><?=$item->maTL ?></td>	
                                <td>
									<a href="admin.php?controller=product&action=edit&id=<?=$item->maSP ?>">
										<i class="far fa-edit"></i>
									</a>
								</td> 
								
								<td>
									<a href="admin.php?controller=product&action=delete&id=<?=$item->maSP ?>" onClick="return confirm('Bạn có chắc chắn muốn xóa ?');">
										<i class="fas fa-trash-alt customer-icon"></i>
									</a> 
                               
							</tr> 
							<?php }}?>
						</tbody>
					</table>		
				</div>
			</div> 
		</div>
	</div>                               
</div>
