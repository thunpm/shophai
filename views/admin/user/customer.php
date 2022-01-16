<?php 
require_once('../layouts/index.php');
require_once('../sibar/sibar.php')
?>
<div id="wrapper">
  <form method="post" action="">
	<div class="workplace">                         
		<div class="row-fluid">
			<div class="span12">                    
				<div class="head">
					<div class="isw">
					<h1 class="isw-grid__heading">Danh sách user</h1>
					</div>
					                         
					<div class="clear"></div>
				</div>
				<div class="block-sorting">
					<table cellpadding="0" cellspacing="0" width="100%" class="table" id="tSortable">
						<thead>
							<tr>
						
                                <th width="10%">Mã User</th>
								<th width="10%">UserName</th>
								<th width="10%">PassWord</th>
								<th width="20%">Họ Tên</th>
                                <th width="14%">Phone</th>
								<th width="16%">Email</th> 
                                <th width="16%">Địa chỉ</th>  
                                <th></th>                                 
							</tr>
						</thead>
						<tbody>
						
							<tr>
				
                                <td>KH001</td>
								<td>Thu</td>
								<td>123</td>
								<td>Nguyễn Phan Minh Thư</td>
								<td>0898154428</td>      
                                <td>thu@gmail.com</td>
                                <td>Quảng Nam</td>  
                                <td><i class="fas fa-trash-alt customer-icon"></i></td>  
                                <!-- <td width="187"><input class="btn btn-large" type="submit" value="Xóa User" onClick="return confirm('Bạn có chắc chắn muốn xóa ?');" name="no" ></td>                      -->
							</tr> 
						
						<tr>
				
                                <td>KH007</td>
								<td>Dương</td>
								<td>123</td>
								<td>Võ Thùy Dương</td>
								<td>0898154434</td>      
                                <td>Duong@gmail.com</td>
                                <td>Quảng Nam</td>  
                                <td><i class="fas fa-trash-alt customer-icon"></i></td>  
                                <!-- <td width="187"><input class="btn btn-large" type="submit" value="Xóa User" onClick="return confirm('Bạn có chắc chắn muốn xóa ?');" name="no" ></td>                      -->
							</tr> 


							
						</tbody>
					</table>
					
				</div>
			</div>                                
	
    </form>


</div>