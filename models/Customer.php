<?php 

class Customer { 
    public $idCustomer;
    public $username;
    public $password;
    public $fullname;
    public $phoneNumber;
    public $email;
    public $gender;
    public $birthday;

    function __construct($idCustomer, $username, $password, $fullname, $phoneNumber, $email, $gender, $birthday) { 
        $this->idCustomer = $idCustomer;
        $this->username = $username;
        $this->password = $password;
        $this->fullname = $fullname;
        $this->phoneNumber = $phoneNumber;
        $this->email = $email;
        $this->gender = $gender;
        $this->birthday = $birthday;
    } 

    static function isValidAccount($TenDangNhap, $MatKhau) { 
        $db = DB::getInstance(); 
        $sql = "SELECT * FROM khachhang WHERE TenDangNhap='".$TenDangNhap."' AND MatKhau='".$MatKhau."'"; 
        $req = $db->query($sql);

        foreach ($req->fetchAll() as $item) { 
           
           return true;
        } 

        return false;
    }

    static function getByUsername($username) { 
        $db = DB::getInstance(); 
        $sql = "SELECT * FROM KhachHang WHERE TenDangNhap='".$username."'"; 
        $req = $db->query($sql);

        foreach ($req->fetchAll() as $item) { 
           return new Customer($item['MaKH'], $item['TenDangNhap'], $item['MatKhau'], $item['HoTen'],
                            $item['SoDienThoai'], $item['Email'], $item['GioiTinh'], $item['NgaySinh']);
        } 
    }

    static function UpdateAccount($MaKH,$HoTen,$SoDienThoai,$Email) { 
        $db = DB::getInstance(); 
        $sql = "UPDATE khachhang set HoTen='".$HoTen."',SoDienThoai='".$SoDienThoai."',Email='".$Email."' where MaKH='".$MaKH."'"; 
        $req = $db->query($sql);
        foreach ($req->fetchAll() as $item) { 
			return true;
		} 
		return false;
    }

    static function SeclecPass($TenDangNhap,$matkhaucu) { 
		$db = DB::getInstance(); 
		$sql = "SELECT * FROM khachhang WHERE TenDangNhap='".$TenDangNhap."' AND MatKhau='".$matkhaucu."'";
		$req = $db->query($sql);
		foreach ($req->fetchAll() as $item) { 
       
            return $item;
        } 
	
	}
    
    static function UpdatePass($matkhaumoi_1) { 
		$db = DB::getInstance(); 
		$sql = "UPDATE khachhang SET MatKhau='".$matkhaumoi_1."'";

		$req = $db->query($sql);
		foreach ($req->fetchAll() as $item) { 
			return true;
		} 
		return false;
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

?>

