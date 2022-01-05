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

	// function __construct($idCustomer, $username, $password, $fullname, $phoneNumber, $email, $gender, $birthday) { 
	// 	$this->idCustomer = $idCustomer;
    //     $this->username = $username;
    //     $this->password = $password;
    //     $this->fullname = $fullname;
    //     $this->phoneNumber = $phoneNumber;
    //     $this->email = $email;
    //     $this->gender = $gender;
    //     $this->birthday = $birthday;
	// } 

    function __construct($username, $password) { 
        $this->username = $username;
        $this->password = $password;
    }

	static function isValidAccount($username, $password) { 
		$db = DB::getInstance(); 
		$sql = "SELECT * FROM khachhang WHERE TenDangNhap='".$username."' AND MatKhau='".$password."'"; 
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
