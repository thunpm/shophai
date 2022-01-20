<?php 
	require_once('models/Type.php'); 
	require_once('models/Product.php'); 

	class Category { 
		public $maDM;
		public $tenDM;
		public $listTL;
		public $listSP;

		function __construct($maDM, $tenDM, $listTL, $listSP) { 
			$this->maDM = $maDM;
			$this->tenDM = $tenDM;
			$this->listTL = $listTL;
			$this->listSP = $listSP;
		}

		static function getCategories() {
            $db = DB::getInstance(); 
            $sql = "SELECT MaDM, TenDM FROM danhmuc"; 
            $req = $db->query($sql);
            $list = [];

            foreach ($req->fetchAll() as $item) { 
                $list[] = [
					'MaDM' => $item['MaDM'],
					'TenDM' => $item['TenDM'],
				];
            } 
            return $list;
        }

		static function listDanhMuc() { 
			$db = DB::getInstance(); 
			$sql = "SELECT * FROM DanhMuc"; 
			$req = $db->query($sql);
			$list = [];

			foreach ($req->fetchAll() as $item) { 
				$list[] = new Category($item['MaDM'], $item['TenDM'], Type::listByDanhMuc($item['MaDM']), 
										Product::listByDanhMuc($item['MaDM']));
			} 

			return $list; 
		}

		static function getNameById($maDM) { 
			$db = DB::getInstance(); 
			$sql = "SELECT TenDM FROM DanhMuc WHERE MaDM = '".$maDM."'"; 
			$req = $db->query($sql);

			foreach ($req->fetchAll() as $item) { 
				return $item['TenDM'];
			} 

		}
	}
?>
