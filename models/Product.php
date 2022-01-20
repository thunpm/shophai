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
public function setMaSP ($maSP)
    	{
        	$this->maSP = $maSP;
    	}

    	public function setTenSP ($tenSP)
    	{
        	$this->tenSP = $tenSP;
    	}
        // lấy list sản phẩm theo mã danh mục
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

        // lấy các sản phẩm liên quan đến 1 sản phẩm đã có
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

        // lấy 1 sản phẩm từ mã sản phẩm
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
               static function getNameById($maSP) { 
			$db = DB::getInstance(); 
			$sql = "SELECT TenSP FROM SanPham WHERE MaSP = '".$maSP."'"; 
			$req = $db->query($sql);

			foreach ($req->fetchAll() as $item) { 
				return $item['TenSP'];
			} 

		}

        static function getByName($tenSP) { 
			$db = DB::getInstance(); 
			$sql = "SELECT MaSP FROM SanPham WHERE TenSP = '".$tenSP."'"; 
			$req = $db->query($sql);

			foreach ($req->fetchAll() as $item) { 
                return $item;
			} 
		
		}
// in ra danh sách sản phẩm
        static function listSanPham()
    {
       $db = DB::getInstance(); 
			$sql = "SELECT * FROM SanPham WHERE SanPham.DaXoa = 0"; 
			$req = $db->query($sql);
			$list = [];

			foreach ($req->fetchAll() as $item) { 
				$list[] = new Product($item['MaSP'], $item['TenSP'], $item['MoTa'], $item['SoLuongCo'], 
                $item['SoLuongBan'], $item['Gia'], $item['KhuyenMai'], $item['MaTL'],
                Picture::listBySanPham($item['MaSP']), Characteristic::listBySanPham($item['MaSP'])); 
			} 

			return $list;
    }


    static function lastID() {
        $db = DB::getInstance(); 
        $sql = "SELECT MaSP FROM SanPham ORDER BY MaSP DESC LIMIT 1"; 
        $req = $db->query($sql);
        $last = null;

        foreach ($req->fetchAll() as $item) { 
            $last = $item['MaSP'];
        } 

        return $last;
    }

// thêm sản phẩm
    static function InsetSP($so,$tenSP,$MoTa,$SoLuongCo,$Gia,$KhuyenMai,$maTL) { 
        $db = DB::getInstance(); 
        $MaSP = Product::lastID();
        if ($MaSP == null) {
            $MaSP = 'SP00';
        }
        $so = substr($MaSP, 2, 3) + 0;
        $so = $so + 1;
        for ($i = 0; $i <= 3 - strlen($so); $i++) {
            $so = $so;
        }
        $so = 'SP'.$so;
    
        $sql= "INSERT INTO `sanpham`(`MaSP`, `TenSP`, `MoTa`, `SoLuongCo`, `Gia`, `KhuyenMai`, `MaTL`) 
                            VALUES ('$so','$tenSP','$MoTa','$SoLuongCo','$Gia','$KhuyenMai','$maTL')";
        
            $req = $db->query($sql);
            // echo"<pre>";
            // print_r($req);
        
    }
    static function InsetHA($MaAnh,$so,$tenHA) { 
        $db = DB::getInstance(); 
        // $so = Product::InsetSP($so,$tenSP,$MoTa,$SoLuongCo,$Gia,$KhuyenMai,$maTL);
        $MaHA = Product::lastID();
        if ($MaHA == null) {
            $MaHA = 'HA00';
        }
        $MaAnh = substr($MaHA, 2, 3) + 0;
        $MaAnh = $MaAnh + 1;
        for ($i = 0; $i <= 3 - strlen($MaAnh); $i++) {
            $MaAnh = $MaAnh;
        }
        $MaAnh = 'HA'.$MaAnh;
    
        $sql= "INSERT INTO `sanpham`(`MaHA`, `MaSP`, `TenHinh`) 
                            VALUES ('$MaHA','$MaAnh','$tenHA')";
        
            $req = $db->query($sql);
            // echo"<pre>";
            // print_r($req);
        
    }

    static function editSP($maSP, $tenSP,$MoTa,$SoLuongCo,$Gia,$KhuyenMai,$maTL) {
       
        $db = DB::getInstance(); 
        $sql= "UPDATE sanpham SET MaSP='$maSP',TenSP='$tenSP',MoTa='$MoTa',SoLuongCo='$SoLuongCo',Gia='$Gia',KhuyenMai='$KhuyenMai',MaTL='$maTL' WHERE MaSP='".$maSP."' ";
        $req = $db->query($sql);
            foreach ($req->fetchAll() as $item) { 
                return true;
            } 
            return false;
            }
    
            static function deleteSP($maSP) {
                $db = DB::getInstance(); 
                $db = DB::getInstance(); 
                $stmt = $db->prepare('update sanpham set DaXoa = 1 where MaSP = :MaSP');
                $stmt->bindParam(':MaSP', $maSP);
                $stmt->execute();
                return 1;
                
            }
    }
?>
