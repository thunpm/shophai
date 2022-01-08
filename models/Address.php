<?php 

class Address { 
    public $maDC;
    public $maKH;
    public $tinh;
    public $huyen;
    public $xa;
    public $soNha;
    public $ghiChu;
    public $macDinh;

    function __construct($maDC, $maKH, $tinh , $huyen, $xa, $soNha, $ghiChu, $macDinh) { 
        $this->maDC = $maDC;
        $this->maKH = $maKH;
        $this->tinh = $tinh;
        $this->huyen = $huyen;
        $this->xa = $xa;
        $this->soNha = $soNha;
        $this->ghiChu = $ghiChu;
        $this->macDinh = $macDinh;
    } 

    static function getAddressByIdCustomer($maKH) { 
        $db = DB::getInstance(); 
        $sql = "SELECT * FROM DiaChi WHERE MakH='".$maKH."' AND MacDinh=1"; 
        $req = $db->query($sql);

        foreach ($req->fetchAll() as $item) { 
            return new Address($item['MaDC'], $item['MaKH'], $item['Tinh'], $item['Huyen'], $item['Xa'], $item['SoNha'], 
                        $item['GhiChu'], $item['MacDinh']); 
        } 

        return 0;
    }
 
}

?>

