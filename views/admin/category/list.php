<?php require_once('views/admin/layouts/sibar.php') ?>

<div id="wrapper">
	<div class="workplace">                         
		<div class="row-fluid">
			<div class="span12">                    
				<div class="head">
				<div class="isw">
					<h1 class="isw-grid__heading">DANH SÁCH DANH MỤC</h1>
					</div>
					<div class="isw-grid">
                       <a href="admin.php?controller=category&action=add"  class="isw-grid__add">
							<h2 class="isw-grid__text">
								<i class="far fa-plus-square isw-grid__icon"></i>
								Thêm danh mục
							</h2>
                       </a>
                    </div>
					                       
					<div class="clear"></div>
				</div>
				<div class="block-sorting">
					<table cellpadding="0" cellspacing="0" width="100%" class="table" id="tSortable">
						<thead>
							<tr>
                                <th width="20%">Mã Danh Mục</th>
								<th width="70%">Tên Danh Mục</th>		 
                                <th width="10%">Thao Tác</th>                              
							</tr>
						</thead>
						<tbody>
							<?php foreach ($categories as $item): ?>
								<tr>
									<td><?= $item['MaDM'] ?></td>
									<td><?= $item['TenDM'] ?></td>
									<td>
										<a href="admin.php?controller=category&action=edit">
											<i class="far fa-edit"></i>
										</a>
										<a href="admin.php?controller=category?action=edit">
											<i class="fas fa-trash-alt customer-icon"></i>
										</a>
									</td>  
									<!-- <td width="187"><input class="btn btn-large" type="submit" value="Xóa User" onClick="return confirm('Bạn có chắc chắn muốn xóa ?');" name="no" ></td>                      -->
								</tr> 
							<?php endforeach ?>
						</tbody>
					</table>		
				</div>
			</div> 
		</div>
	</div>                               
</div>