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

		public function setMaDM ($maDM)
    	{
        	$this->maDM = $maDM;
    	}

    	public function setTenDM ($tenDM)
    	{
        	$this->tenDM = $tenDM;
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

		static function getDanhMuc($maDM) { 
			$db = DB::getInstance(); 
			$sql = "SELECT * FROM DanhMuc WHERE MaDM = '".$maDM."'"; 
			$req = $db->query($sql);
			$list = [];

			foreach ($req->fetchAll() as $item) { 
				$list[] = new Category($item['MaDM'], $item['TenDM'], Type::listByDanhMuc($item['MaDM']), 
										Product::listByDanhMuc($item['MaDM']));
			} 

			return $list[0]; 
		}

		static function getNameById($maDM) { 
			$db = DB::getInstance(); 
			$sql = "SELECT TenDM FROM DanhMuc WHERE MaDM = '".$maDM."'"; 
			$req = $db->query($sql);

			foreach ($req->fetchAll() as $item) { 
				return $item['TenDM'];
			} 

		}

		static function getByName($tenDM) { 
			$db = DB::getInstance(); 
			$sql = "SELECT MaDM FROM DanhMuc WHERE TenDM = '".$tenDM."'"; 
			$req = $db->query($sql);

			foreach ($req->fetchAll() as $item) { 
				return $item['MaDM'];
			} 
		
		}

		static function insertDM($maDM, $tenDM) {
			$kt_maDM = Category::getNameById($maDM);
			if($kt_maDM != null) {
				return 1;
			}

			$kt_tenDM = Category::getByName($tenDM);
			if($kt_tenDM != null) {
				return 2;
			}

			$db = DB::getInstance(); 
			$stmt = $db->prepare('insert into DanhMuc (MaDM, TenDM) values (:MaDM, :TenDM)');
			$stmt->bindParam(':MaDM', $maDM);
			$stmt->bindParam(':TenDM', $tenDM);
			$stmt->execute();
			return 0;
		}

		static function editDM($maDM, $tenDM) {
			$kt_tenDM = Category::getByName($tenDM);
			if($kt_tenDM != null) {
				return 2;
			}

			$db = DB::getInstance(); 
			$stmt = $db->prepare('update DanhMuc set TenDM = :TenDM where MaDM = :MaDM');
			$stmt->bindParam(':MaDM', $maDM);
			$stmt->bindParam(':TenDM', $tenDM);
			$stmt->execute();
			return 0;
		}
	}
?>
