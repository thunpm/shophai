<div id="wrapper">
  	<form method="post" action="">
		<div class="row-fluid">
			<div class="span12">                    
				<div class="head">
				<div class="isw">
					<h1 class="isw-grid__heading">SỬA SẢN PHẨM</h1>
					</div>            
					<div class="clear"></div>
				</div>
				<div class="mes" style="color: red; margin-left: 25px ;">
				    <?php
				        if(isset($message)) echo $message;
				    ?>
				</div>
				<div class="block-sorting">
					<table cellpadding="0" cellspacing="0" width="100%" class="table" id="tSortable">
				
		<tr>
						
	  	<td>Mã sản phẩm</td>
	  	<td><input type="text" name="masp"  value="<?php echo isset($item) ? $item->maSP : "" ?>" disabled></td>
	  </tr>

	  <tr>
	  	<td>Tên sản phẩm</td>
	  	<td><input type="text" name="tensanpham" value="<?php echo isset($item) ? $item->tenSP : "" ?>"></td>
	</tr>
	  <tr>
	  <tr>
	  	<td>Hình ảnh</td>
	  	<td><input type="file" name="hinhanh"></td>
	  </tr>
	  <tr>
	  	<td>Mô tả</td>
	  	<td><textarea rows="10"  name="mota" style="resize: none; padding: 12px; border: 1px solid #ccc; width: 100%;   border-radius: 4px;"><?php echo isset($item) ? $item->moTa : "" ?></textarea></td>
	  </tr>
	  	<td>Giá </td>
	  	<td><input type="text" name="giasp" value="<?php echo isset($item) ? $item->gia : "" ?>"></td>
	  </tr>
	  <tr>
	  	<td>Số lượng có</td>
	  	<td><input type="text" name="soluong" value="<?php echo isset($item) ? $item->soLuongCo : "" ?>"></td>
	  </tr>
	  </tr>
	  	<td>Khuyến mãi </td>
	  	<td><input type="text" name="khuyenmai" value="<?php echo isset($item) ? $item->khuyenMai : "" ?>"></td>
	  </tr>
	 
	<tr>
	
	    <td>Danh mục sản phẩm</td>
	    <td>
		
		  	<select name="danhmuc">
			  <?php 
							if($listt != null) {
								foreach($listt as $item) {
						
							
							//  echo"<pre>";
							//  print_r($value);
						?>
	    		
	    		<option value="<?php echo isset($item) ? $item->maTL : "" ?>"><?php echo isset($item) ? $item->tenTL : "" ?></option>
				
				<?php }}?>
	    	</select>
			
	    </td>
	</tr>
	  
					</table>
                    <div class="form-group">       
                        <input style="margin-top: 20px;" type="submit" name="submit" class="btn btn-danger btn-md" value="CẬP NHẬT">
                    </div>
				</div>
			</div>
		</div>                                
    </form>
</div>