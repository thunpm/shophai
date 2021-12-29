<?php 
    class Picture { 
        public $maHinh;
        public $maSP;
        public $tenHinh;

        function __construct($maHinh, $maSP, $tenHinh) { 
            $this->maHinh = $maHinh;
            $this->maSP = $maSP;
            $this->tenHinh = $tenHinh;
        }

        static function listBySanPham($MaSanPham) { 
            $db = DB::getInstance(); 
            $sql = "SELECT * FROM HinhAnh 
                    WHERE MaSP ='".$MaSanPham."'"; 
            $req = $db->query($sql);
            $list = [];

            foreach ($req->fetchAll() as $item) { 
                $list[] = new Picture($item['MaHinh'], $item['MaSP'], $item['TenHinh']); 
            } 

            return $list; 
        }
    }
?>
