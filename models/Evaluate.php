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
		
	}
?>
