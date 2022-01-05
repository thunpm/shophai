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
<<<<<<< HEAD
	}

    static function getName($idCustomer) {
        $db = DB::getInstance(); 
        $sql = "SELECT HoTen FROM khachhang WHERE MaKH='".$idCustomer."'"; 
        $req = $db->query($sql);
        $ten = "";

        foreach ($req->fetchAll() as $item) { 
            $ten = $item['HoTen'];
        }
        return $ten; 
    }
}
=======
    }

    
?>
>>>>>>> 701a23f38fa33b7ba4af29648607698b3972e537
