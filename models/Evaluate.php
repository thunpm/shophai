<?php 
	require_once('models/Customer.php');
	class Evaluate { 
		public $maDG;
		public $maSP;
		public $maKH;
		public $danhgia;
		public $nhanXet;

		function __construct($maDG, $maSP, $maKH, $danhgia, $nhanXet) { 
			$this->maDG = $maDG;
			$this->maSP = $maSP;
			$this->maKH = $maKH;
			$this->danhgia = $danhgia;
			$this->nhanXet = $nhanXet;
		}

		static function store($maSP, $maKH, $danhGia, $nhanXet)
		{
			$maDG = Evaluate::lastID();
			$db = DB::getInstance(); 
			$sql = "INSERT INTO `danhgia`(`MaDG`, `MaSP`, `MaKH`, `DanhGia`, `NhanXet`)
                           VALUE('$maDG','$maSP','$maKH','$danhGia','$nhanXet')"; 
			$req = $db->query($sql);
		}

		//lấy các nhận xét về sản phẩm
		static function listNhanXet($MaSP) { 
            $db = DB::getInstance(); 
            $sql = "SELECT * FROM danhgia
                    WHERE MaSP ='".$MaSP."'"; 
            $req = $db->query($sql);
            $list = [];

            foreach ($req->fetchAll() as $item) { 
                $list[] = new Evaluate($item['MaDG'], $item['MaSP'], Customer::getName($item['MaKH']), $item['DanhGia'], $item['NhanXet']); 
            } 
            return $list; 
        }
		
		static function lastID() {
			$db = DB::getInstance(); 
			$sql = "SELECT MaDG FROM danhgia ORDER BY MaDG DESC LIMIT 1"; 
			$req = $db->query($sql);
			$last = null;
	
			foreach ($req->fetchAll() as $item) { 
				$last = $item['MaDG'];
			} 

			if ($last == null) {
				$last = 'KH000';
			}
			$ID = substr($last, 2, 3) + 0;
			$ID = $ID + 1;
			for ($i = 0; $i <= 3 - strlen($ID); $i++) {
				$ID = '0'.$ID;
			}
			$ID = 'DG'.$ID;
	
			return $ID;
		}
	}
?>
