<?php 

	class Evaluate { 
		public $maDG;
		public $maSP;
		public $maKH;
		public $danhgia;
		public $nhanXet;
		public $soLuong;

		function __construct($maDG, $maSP, $maKH, $danhgia, $nhanXet, $soLuong) { 
			$this->maDG = $maDG;
			$this->maSP = $maSP;
			$this->maKH = $maKH;
			$this->danhgia = $danhgia;
			$this->nhanXet = $nhanXet;
			$this->soLuong = $soLuong;
		}

		//lấy các nhận xét về sản phẩm
		static function listNhanXet($MaSP) { 
            $db = DB::getInstance(); 
            $sql = "SELECT * FROM danhgia
                    WHERE MaSP ='".$MaSP."'"; 
            $req = $db->query($sql);
            $list = [];

            foreach ($req->fetchAll() as $item) { 
                $list[] = new Evaluate($item['MaDG'], $item['MaSP'], $item['MaKH'], $item['DanhGia'], $item['NhanXet'], null); 
            } 

            return $list; 
        }
		
	}
?>
