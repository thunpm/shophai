<?php 

function isValidAccount($TenDangNhap, $MatKhau) { 
    $db = DB::getInstance(); 
    $sql = "SELECT * FROM khachhang WHERE TenDangNhap='".$TenDangNhap."' AND MatKhau='".$MatKhau."'"; 
    $req = $db->query($sql);

    foreach ($req->fetchAll() as $item) { 
       
       return $item;
    } 
}
    function UpdateAccount($MaKH,$HoTen,$SoDienThoai,$Email) { 
        $db = DB::getInstance(); 
        $sql = "UPDATE khachhang set HoTen='".$HoTen."',SoDienThoai='".$SoDienThoai."',Email='".$Email."' where MaKH='".$MaKH."'"; 
        $req = $db->query($sql);
        foreach ($req->fetchAll() as $item) { 
			return true;
		} 
		return false;
    }

    function SeclecPass($matkhaucu) { 
		$db = DB::getInstance(); 
		$sql = "SELECT * FROM khachhang WHERE  MatKhau='".$matkhaucu."'";
		$req = $db->query($sql);
		foreach ($req->fetchAll() as $item) { 
       
            return $item;
         } 
	
	}
    function UpdatePass($matkhaumoi_1) { 
		$db = DB::getInstance(); 
		$sql = "UPDATE khachhang SET MatKhau='".$matkhaumoi_1."'";

		$req = $db->query($sql);
		foreach ($req->fetchAll() as $item) { 
			return true;
		} 
		return false;
    }

    
?>
