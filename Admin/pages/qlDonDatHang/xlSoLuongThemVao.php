<?php 

    include('../../../lib/DataProvider.php');

    $sl = $_POST['sl'];
    $id = $_POST['id'];

    $sql = "SELECT SoLuongTon FROM sanpham WHERE MaSanPham = $id";
    $result = DataProvider::ExecuteQuery($sql);
    $row = mysqli_fetch_array($result);

    if($sl > $row['SoLuongTon'])
    {
        echo -1;
    }
    else 
    {
        echo 0;
    }

?>