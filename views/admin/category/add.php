<?php require_once('views/admin/layouts/sibar.php') ?>

<div id="wrapper">
  	<form method="post" action="">
		<div class="row-fluid">
			<div class="span12">                    
				<div class="head">
					<div class="isw-grid">
                       
                    </div>
					                       
					<div class="clear"></div>
				</div>
				<div class="block-sorting">
					<table cellpadding="0" cellspacing="0" width="100%" class="table" id="tSortable">
						<thead>
							<tr>
                                <th width="20%">Mã Danh Mục</th>
								<th width="60%">Tên Danh Mục</th>                               
							</tr>
						</thead>
						<tbody>
							<tr>
                            <td><input type="text" class="span12" name="MaDM" value=""></td>
								<td><input type="text" class="span12" name="TenDM" value=""></td>
                                <!-- <td width="187"><input class="btn btn-large" type="submit" value="Xóa User" onClick="return confirm('Bạn có chắc chắn muốn xóa ?');" name="no" ></td>                      -->
							</tr> 
						</tbody>
					</table>
					<div class="form-group">
                        <input style="margin-top: 20px;" type="submit" name="submit" class="btn btn-danger btn-md" value="Thêm">
                    </div>
				</div>
			</div>   
		</div>                             
    </form>
</div>