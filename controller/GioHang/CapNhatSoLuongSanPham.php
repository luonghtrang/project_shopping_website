<?php

    if(isset($_POST['s']))
    {
        include('../../lib/ShoppingCart.php');
        include('../../lib/DataProvider.php');

        $s = $_POST['s'];
        $id = $_POST['id'];

        session_start();
        
        $gioHang =  unserialize($_SESSION['GioHang']);  

        $sql = "SELECT SoLuongTon FROM sanpham WHERE MaSanPham = $id";
        $result = DataProvider::ExecuteQuery($sql);
        $row = mysqli_fetch_array($result);
        if($s > $row['SoLuongTon'])
        {
            echo -2;
        }
        else 
        {
            $gioHang->update($id, $s);
    
            // lấy số lượng sau khi update
    
            for($i = 0; $i < count($gioHang->listProduct); $i++)
            {
                if($gioHang->listProduct[$i]->id == $id)
                {
                    echo $gioHang->listProduct[$i]->num;
                    break;
                }
            } 
        } 
        $_SESSION['GioHang'] = serialize($gioHang);
    }
    else 
    {
        echo -1;
    }
?>