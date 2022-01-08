<?php 
	class Invoice { 
		public $maHD;
		public $maKH;
		public $ngayLap;

		function __construct($maHD, $maKH, $ngayLap) { 
			$this->maHD = $maHD;
			$this->maKH = $maKH;
			$this->ngayLap = $ngayLap;
		}

		static function lastID() {
			$db = DB::getInstance(); 
			$sql = "SELECT MaHD ORDER BY MaHD DESC LIMIT 1"; 
            $req = $db->query($sql);

			foreach ($req->fetchAll() as $item) { 
                return $item['MaHD'];
            } 
		}

		static function add($user, $cart) { 
            $db = DB::getInstance(); 
			$today = date("H:i:s d/m/Y");
			$maHD = Invoice::lastID();
			if ($maHD == null) {
				$maHD = 'HD001';
			}
			$so = substr($maHD, 2, 3) + 0;
			$so = $so + 1;
			for ($i = 0; $i < 3 - strlen($so); $i++) {
				$so = '0' + $so;
			}
			$so = 'HD' + $so;
            $sql = "INSERT HoaDon(MaKH, MaHD, NgayLap) VALUES ('".$user->idCustomer."', '".$so."', '".$today."')"; 
            $req = $db->query($sql);
            $list = [];

            foreach ($req->fetchAll() as $item) { 
                $list[] = new Evaluate($item['MaDG'], $item['MaSP'], Customer::getName($item['MaKH']), $item['DanhGia'], $item['NhanXet']); 
            } 
            return $list; 
        }
		
	}
?>
