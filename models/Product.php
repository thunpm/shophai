<?php 
    require_once('models/Picture.php'); 
    require_once('models/Characteristic.php');

    class Product { 
        public $maSP;
        public $tenSP;
        public $moTa;
        public $soLuongCo;
        public $soLuongBan;
        public $gia;
        public $khuyenMai;
        public $maTL;
        public $listHinh;
        public $listDacTinh;

        function __construct($maSP, $tenSP, $moTa, $soLuongCo, $soLuongBan, $gia, $khuyenMai, $maTL, $listHinh, $listDacTinh) { 
            $this->maSP = $maSP;
            $this->tenSP = $tenSP;
            $this->moTa = $moTa;
            $this->soLuongCo = $soLuongCo;
            $this->soLuongBan = $soLuongBan;
            $this->gia = $gia;
            $this->khuyenMai = $khuyenMai;
            $this->maTL = $maTL;
            $this->listHinh = $listHinh;
            $this->listDacTinh = $listDacTinh;
        }

        //lấy list sản phẩm theo mã danh mục
        static function listByDanhMuc($MaDanhMuc) { 
            $db = DB::getInstance(); 
            $sql = "SELECT sp.*, tl.* FROM SanPham sp 
                    INNER JOIN TheLoai tl on sp.MaTL = tl.MaTL 
                    INNER JOIN DanhMuc dm on dm.MaDM = tl.MaDM 
                    WHERE tl.MaDM ='".$MaDanhMuc."'"; 
            $req = $db->query($sql);
            $list = [];

            foreach ($req->fetchAll() as $item) { 
                $list[] = new Product($item['MaSP'], $item['TenSP'], $item['MoTa'], $item['SoLuongCo'], 
                                    $item['SoLuongBan'], $item['Gia'], $item['KhuyenMai'], $item['MaTL'],
                                    Picture::listBySanPham($item['MaSP']), Characteristic::listBySanPham($item['MaSP'])); 
            } 

            return $list; 
        }

        //lấy các sản phẩm liên quan đến 1 sản phẩm đã có
        static function getListSPLienQuan($MaSP, $MaTL) { 
            $db = DB::getInstance(); 
            $sql = "SELECT sp.*, tl.* FROM SanPham sp 
                    INNER JOIN TheLoai tl on sp.MaTL = tl.MaTL 
                    INNER JOIN DanhMuc dm on dm.MaDM = tl.MaDM 
                    WHERE sp.MaSP !='".$MaSP."' AND sp.MaTL = '".$MaTL."'"; 
            $req = $db->query($sql);
            $list = [];

            foreach ($req->fetchAll() as $item) { 
                $list[] = new Product($item['MaSP'], $item['TenSP'], $item['MoTa'], $item['SoLuongCo'], 
                                    $item['SoLuongBan'], $item['Gia'], $item['KhuyenMai'], $item['MaTL'],
                                    Picture::listBySanPham($item['MaSP']), Characteristic::listBySanPham($item['MaSP'])); 
            } 

            return $list; 
        }

        //lấy 1 sản phẩm từ mã sản phẩm
        static function getSanPham($MaSanPham) { 
            $db = DB::getInstance(); 
            $sql = "SELECT sp.*, tl.* FROM SanPham sp 
                    INNER JOIN TheLoai tl on sp.MaTL = tl.MaTL 
                    INNER JOIN DanhMuc dm on dm.MaDM = tl.MaDM 
                    WHERE sp.MaSP ='".$MaSanPham."'"; 
            $req = $db->query($sql);
            $list = [];

            foreach ($req->fetchAll() as $item) { 
                $list[] = new Product($item['MaSP'], $item['TenSP'], $item['MoTa'], $item['SoLuongCo'], 
                                    $item['SoLuongBan'], $item['Gia'], $item['KhuyenMai'], $item['MaTL'],
                                    Picture::listBySanPham($item['MaSP']), Characteristic::listBySanPham($item['MaSP'])); 
            } 

            return $list[0]; 
        }
    }
?>
