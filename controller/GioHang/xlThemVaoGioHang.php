<?php
    include('../../lib/ShoppingCart.php');
    include('../../lib/DataProvider.php');
    
    session_start();

    if(!isset($_SESSION['MaLoaiTaiKhoan']))
    {
        echo 0;
    }
    else 
    {
        if(isset($_SESSION['SoLuongTrongGioHang']))
        {
            $_SESSION['SoLuongTrongGioHang'] += 1; 
        }

        if(isset($_SESSION['GioHang']) != null)
        {
            $gioHang = unserialize($_SESSION['GioHang']);
        }
        else 
        {
            $gioHang = new ShoppingCart();
        }

        $num = 1;
        if(isset($_POST['num']))
        {
            $num = $_POST['num'];
        }

        if(isset($_POST['id']))
        {
            $id = $_POST['id'];

            $sql = "SELECT SoLuongTon FROM sanpham WHERE MaSanPham = $id";
            $result = DataProvider::ExecuteQuery($sql);
            $row = mysqli_fetch_array($result);
            if($num > $row['SoLuongTon'])
            {
                echo 2;
            }
            else 
            {
                $gioHang->add($id, $num);

                $_SESSION['GioHang'] = serialize($gioHang);

                echo $_SESSION['SoLuongTrongGioHang'];
            }    
        }
    }

    
?>