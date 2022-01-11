<?php 
	require_once('models/Product.php'); 
	require_once('models/Items.php'); 
	class Invoice { 
		public $maHD;
		public $maKH;
		public $ngayLap;
		public $detail;

		function __construct($maHD, $maKH, $ngayLap) { 
			$this->maHD = $maHD;
			$this->maKH = $maKH;
			$this->ngayLap = $ngayLap;
		}

		static function lastID() {
			$db = DB::getInstance(); 
			$sql = "SELECT MaHD FROM HoaDon ORDER BY MaHD DESC LIMIT 1"; 
            $req = $db->query($sql);
			$last = null;

			foreach ($req->fetchAll() as $item) { 
                $last = $item['MaHD'];
            } 

			return $last;
		}

		static function add($user, $cart) { 
            $db = DB::getInstance(); 
			$today = date("Y-m-d H:i:s");
			$maHD = Invoice::lastID();
			if ($maHD == null) {
				$maHD = 'HD000';
			}
			$so = substr($maHD, 2, 3) + 0;
			$so = $so + 1;
			for ($i = 0; $i <= 3 - strlen($so); $i++) {
				$so = '0'.$so;
			}
			$so = 'HD'.$so;
            $sql = "INSERT HoaDon(MaHD, MaKH, NgayLap) VALUES ('".$so."', '".$user->idCustomer."', '".$today."')"; 
            $req = $db->query($sql);

			if ($req == true) {
				foreach ($cart->listItems as $item) {
					$sql = "INSERT ChiTietHoaDon(MaHD, MaSP, SoLuong, Gia, KhuyenMai) 
							VALUES ('".$so."', '".$item->sanPham->maSP."', '".$item->soLuong."', '".$item->donGia."', '".$item->khuyenMai."')"; 
            		$req = $db->query($sql);
				}
				return true;	
			} else {
				return false;
			}
        }

		static function listByIdCustomer($maKH) {
			$db = DB::getInstance(); 
			$sql = "SELECT * FROM HoaDon WHERE MaKH='".$maKH."'"; 
            $req = $db->query($sql);
			$list = [];
			$i = 0;

			foreach ($req->fetchAll() as $item) { 
				$i++;
                $list[$i] = new Invoice($item['MaHD'], $item['MaKH'], $item['NgayLap']);
				$sql = "SELECT * FROM ChiTietHoaDon WHERE MaHD='".$item['MaHD']."'"; 
            	$req2 = $db->query($sql);
				$list2 = [];

				foreach ($req2->fetchAll() as $item2) { 
					$sanPham = Product::getSanPham($item2['MaSP']);
                    $list2[] = new Items($sanPham, $item2['SoLuong'], $item2['Gia'], $item2['KhuyenMai']);
				}

				$list[$i]->detail = $list2;
            }

			return $list;
		}

		
	}
?>
