<?php 
    include('../../../lib/DataProvider.php');

    if(isset($_POST['txtTen'])) //Kiểm tra có tồn tại chưa
    {
        $ten = $_POST['txtTen'];
        $hinh = $_FILES['fHinh']["name"];

        $file_name=$_FILES['fHinh']['name'];
        $file_size=$_FILES['fHinh']['size'];
        $file_tmp=$_FILES['fHinh']['tmp_name'];
        $file_type=$_FILES['fHinh']['type'];

        //duoi file
        $tmp = explode('.',$_FILES['fHinh']['name']);
        $file_exit = strtolower(end($tmp));
        ///nhung duoi file
        $extensions = array("jpeg","jpg","png");
        //kiem tra
        if(in_array($file_exit,$extensions) == false)
        {
            $errror[]="Vui lòng chọ file có đuôi png,jpg,jpeg";
        }
        if(empty($errror) == true)
        {
            move_uploaded_file($file_tmp,"../../../images/".$file_name);
        }

         // lấy mã lớn nhất của mã loại sản phẩm sau đó tăng lên 1
         $sql = "SELECT MaLoaiSanPham FROM loaisanpham";
         $result = DataProvider::ExecuteQuery($sql);
 
         $maLoaiSanPham = 0;
         while($row = mysqli_fetch_array($result))
         {
            $maLoaiSanPham = $row['MaLoaiSanPham'];
         }
 
         $maLoaiSanPham += 1;

        $sql = "INSERT INTO loaisanpham(MaLoaiSanPham, TenLoaiSanPham, HinhURL, BiXoa) VALUES ($maLoaiSanPham,'$ten', '$hinh', 0)";
        DataProvider::ExecuteQuery($sql);

    }
    DataProvider::ChangeURL('../../index.php?c=2&a=1');
?>