<?php 
    class Type { 
        public $maTL;
        public $tenTL;
        public $maDM;

        function __construct($maTL, $tenTL, $maDM) { 
            $this->maTL = $maTL;
            $this->tenTL = $tenTL;
            $this->maDM = $maDM;
        }

        static function listByDanhMuc($MaDanhMuc) { 
            $db = DB::getInstance(); 
            $sql = "SELECT tl.* FROM TheLoai tl INNER JOIN DanhMuc dm on dm.MaDM = tl.MaDM WHERE tl.MaDM ='".$MaDanhMuc."'"; 
            $req = $db->query($sql);
            $list = [];

            foreach ($req->fetchAll() as $item) { 
                $list[] = new Type($item['MaTL'], $item['TenTL'], $item['MaDM']); 
            } 

            return $list; 
        }
    }
?>
