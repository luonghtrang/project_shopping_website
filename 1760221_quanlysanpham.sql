-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 03, 2020 at 04:15 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `1760221_quanlysanpham`
--

-- --------------------------------------------------------

--
-- Table structure for table `chitietdondathang`
--

CREATE TABLE `chitietdondathang` (
  `MaChiTietDonDatHang` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `SoLuong` int(11) NOT NULL,
  `GiaBan` int(11) NOT NULL,
  `MaDonDatHang` varchar(9) COLLATE utf8_unicode_ci NOT NULL,
  `MaSanPham` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `chitietdondathang`
--

INSERT INTO `chitietdondathang` (`MaChiTietDonDatHang`, `SoLuong`, `GiaBan`, `MaDonDatHang`, `MaSanPham`) VALUES
('CTDDH1312', 1, 210000, 'DH1312201', 42),
('CTDDH1412', 1, 140000, 'DH1412201', 43),
('CTDDH1512', 3, 400000, 'DH1512201', 44),
('CTDDH1712', 100, 200000, 'DH1712201', 1);

-- --------------------------------------------------------

--
-- Table structure for table `dondathang`
--

CREATE TABLE `dondathang` (
  `MaDonDatHang` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `NgayLap` datetime NOT NULL,
  `TongTien` int(11) NOT NULL,
  `MaTaiKhoan` int(11) NOT NULL,
  `MaTinhTrang` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `dondathang`
--

INSERT INTO `dondathang` (`MaDonDatHang`, `NgayLap`, `TongTien`, `MaTaiKhoan`, `MaTinhTrang`) VALUES
('DH1312201', '2019-12-13 11:40:30', 440000, 3, 1),
('DH1412201', '2019-12-14 11:44:44', 170000, 1, 1),
('DH1512201', '2019-12-01 07:07:23', 1230003, 19, 1),
('DH1612201', '2019-12-16 07:09:34', 2130000, 3, 1),
('DH1712201', '2019-12-17 21:01:43', 20030000, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `hangsanxuat`
--

CREATE TABLE `hangsanxuat` (
  `MaHangSanXuat` int(11) NOT NULL,
  `TenHangSanXuat` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `LogoURL` varchar(45) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `BiXoa` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hangsanxuat`
--

INSERT INTO `hangsanxuat` (`MaHangSanXuat`, `TenHangSanXuat`, `LogoURL`, `BiXoa`) VALUES
(1, 'Adidas', 'adidas.png', 0),
(2, 'Puma', 'puma.png', 0),
(3, 'Việt Nam', 'vietnam.png', 0);

-- --------------------------------------------------------

--
-- Table structure for table `loaisanpham`
--

CREATE TABLE `loaisanpham` (
  `MaLoaiSanPham` int(11) NOT NULL,
  `TenLoaiSanPham` varchar(64) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `HinhURL` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `BiXoa` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `loaisanpham`
--

INSERT INTO `loaisanpham` (`MaLoaiSanPham`, `TenLoaiSanPham`, `HinhURL`, `BiXoa`) VALUES
(1, 'Áo', 'shirt.png', 0),
(2, 'Quần', 'trousers.png', 0),
(3, 'Áo Khoác\r\n', 'coat.png', 0);

-- --------------------------------------------------------

--
-- Table structure for table `loaitaikhoan`
--

CREATE TABLE `loaitaikhoan` (
  `MaLoaiTaiKhoan` int(11) NOT NULL,
  `TenLoaiTaiKhoan` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `loaitaikhoan`
--

INSERT INTO `loaitaikhoan` (`MaLoaiTaiKhoan`, `TenLoaiTaiKhoan`) VALUES
(1, 'User'),
(2, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `sanpham`
--

CREATE TABLE `sanpham` (
  `MaSanPham` int(11) NOT NULL,
  `TenSanPham` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `HinhURL` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `GiaSanPham` int(11) NOT NULL,
  `NgayNhap` datetime NOT NULL DEFAULT current_timestamp(),
  `SoLuongTon` int(11) NOT NULL,
  `SoLuongBan` int(11) NOT NULL,
  `SoLuongXem` int(11) NOT NULL,
  `MoTa` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `BiXoa` tinyint(1) NOT NULL,
  `MaLoaiSanPham` int(11) NOT NULL,
  `MaHangSanXuat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sanpham`
--

INSERT INTO `sanpham` (`MaSanPham`, `TenSanPham`, `HinhURL`, `GiaSanPham`, `NgayNhap`, `SoLuongTon`, `SoLuongBan`, `SoLuongXem`, `MoTa`, `BiXoa`, `MaLoaiSanPham`, `MaHangSanXuat`) VALUES
(1, 'Adidas Quần Caro Đen', 'Adidas_Black_Caro_Pants.png', 200000, '2019-12-09 14:20:59', -50, 120, 58, 'Hàng chất lượng cao, uy tín của hãng Adidas', 0, 2, 1),
(2, 'Adidas Quần Thể Thao Đen', 'Adidas_Black_Caro_Pants_2.png', 250000, '2019-12-09 14:20:59', 32, 30, 32, 'Hàng chất lượng cao, uy tín của hãng Adidas', 0, 2, 1),
(3, 'Adidas Áo Khoác Đen', 'Adidas_Black_Coat.png', 300000, '2019-12-09 14:23:00', 18, 10, 10, 'Áo Khoác được nhập từ hãng Adidas có chất lượng cao', 0, 3, 1),
(4, 'Adias Áo Thun Đen', 'Adidas_Black_T_Shirt.png', 500000, '2019-12-09 14:24:25', 10, 2, 100, 'Hàng nhập khẩu từ Adidas có chất lượng rất cao và bền', 0, 1, 1),
(5, 'Adias Áo Thun Đen', 'Adidas_Black_T_Shirt_2.png', 450000, '2019-12-09 14:25:23', 12, 10, 58, 'Hàng nhập khẩu từ Adidas có chất lượng rất cao và bền', 0, 1, 1),
(6, 'Adias Áo Thun Caro Đen', 'Adidas_Black_T_Shirt_Caro.png', 500000, '2019-12-09 14:26:20', 50, 34, 53, 'Hàng nhập khẩu từ Adidas có chất lượng rất cao và bền', 0, 1, 1),
(7, 'Adias Áo Khoác Xanh', 'Adidas_Blue_Coat.png', 750000, '2019-12-09 14:27:15', 95, 68, 23, 'Hàng nhập khẩu từ Adidas có chất lượng rất cao và bền', 0, 3, 1),
(8, 'Adias Quần Thể Thao Xanh', 'Adidas_Blue_Pants.png', 310000, '2019-12-09 14:28:25', 40, 22, 65, 'Hàng nhập khẩu từ Adidas có chất lượng rất cao và bền', 0, 2, 1),
(9, 'Adias Áo Thun Xanh', 'Adidas_Blue_T_Shirt.png', 150000, '2019-12-09 14:29:10', 50, 21, 36, 'Hàng nhập khẩu từ Adidas có chất lượng rất cao và bền', 0, 1, 1),
(10, 'Adias Áo Khoác Nâu', 'Adidas_Brown_Coat.png', 1000000, '2019-12-09 14:30:04', 98, 32, 43, 'Hàng nhập khẩu từ Adidas có chất lượng rất cao và bền', 0, 3, 1),
(11, 'Adias Áo Khoác Xạm', 'Adidas_Concrete_Coat.png', 800000, '2019-12-09 14:30:56', 96, 65, 12, 'Hàng nhập khẩu từ Adidas có chất lượng rất cao và bền', 0, 3, 1),
(12, 'Adias Quần Thể Thao Xạm', 'Adidas_Concrete_Pants.png', 700000, '2019-12-09 14:32:04', 29, 3, 30, 'Hàng nhập khẩu từ Adidas có chất lượng rất cao và bền', 0, 2, 1),
(13, 'Adias Quần Thể Thao Đỏ', 'Adidas_Red_Pants.png', 400000, '2019-12-09 14:32:42', 29, 6, 37, 'Hàng nhập khẩu từ Adidas có chất lượng rất cao và bền', 0, 2, 1),
(14, 'Adias Áo Thun Trắng', 'Adidas_White_T_Shirt.png', 150000, '2019-12-09 14:33:28', 28, 8, 13, 'Hàng nhập khẩu từ Adidas có chất lượng rất cao và bền', 0, 1, 1),
(15, 'Adias Áo Khoác Trẻ Em Đen', 'Adidas_Black_Child_T_Shirt.png', 600000, '2019-12-09 14:34:54', 25, 18, 51, 'Hàng nhập khẩu từ Adidas có chất lượng rất cao và bền', 0, 3, 1),
(16, 'Puma Áo Khoác Đen', 'Puma_Black_Coat.png', 400000, '2019-12-09 14:35:35', 22, 23, 100, 'Hàng nhập khẩu từ Adidas có chất lượng rất cao và bền', 0, 3, 2),
(17, 'Puma Quần Công Sở Đen', 'Puma_Black_Pants.png', 840000, '2019-12-09 14:37:07', 55, 56, 29, 'Hàng nhập khẩu từ Puma có chất lượng rất cao và bền', 0, 2, 2),
(18, 'Puma Quần Thễ Thao Đen', 'Puma_Black_Pants_2.png', 900000, '2019-12-09 14:38:22', 57, 50, 20, 'Hàng nhập khẩu từ Puma có chất lượng rất cao và bền', 0, 2, 2),
(19, 'Puma Áo Thun Đen', 'Puma_Black_T_Shirt.png', 450000, '2019-12-09 14:40:47', 28, 9, 10, 'Hàng nhập khẩu từ Puma có chất lượng rất cao và bền', 0, 1, 2),
(20, 'Puma Áo Thun Đen', 'Puma_Black_T_Shirt_2.png', 290000, '2019-12-09 14:41:39', 29, 21, 87, 'Hàng nhập khẩu từ Puma có chất lượng rất cao và bền', 0, 1, 2),
(21, 'Puma Áo Khoác Trắng Đen', 'Puma_Black_White_Coat.png', 980000, '2019-12-09 14:42:23', 40, 7, 76, 'Hàng nhập khẩu từ Puma có chất lượng rất cao và bền', 0, 3, 2),
(22, 'Puma Áo Khoác Xanh', 'Puma_Blue_Coat.png', 1000000, '2019-12-09 14:43:08', 43, 23, 32, 'Hàng nhập khẩu từ Puma có chất lượng rất cao và bền', 0, 3, 2),
(23, 'Puma Quần Thể Thao Xanh', 'Puma_Blue_Pants.png', 450000, '2019-12-09 14:44:03', 43, 2, 19, 'Hàng nhập khẩu từ Puma có chất lượng rất cao và bền', 0, 2, 2),
(24, 'Adias Quần Thể Thao Nâu', 'Puma_Brown_Pants.png', 490000, '2019-12-09 14:46:39', 34, 26, 87, 'Hàng nhập khẩu từ Puma có chất lượng rất cao và bền', 0, 2, 2),
(25, 'Puma ÁoThun Nâu', 'Puma_Brown_T_Shirt.png', 390000, '2019-12-09 14:48:47', 50, 12, 43, 'Hàng nhập khẩu từ Puma có chất lượng rất cao và bền', 0, 1, 2),
(26, 'Puma Áo khoác Caro', 'Puma_Caro_Coat.png', 460000, '2019-12-09 14:49:50', 28, 15, 20, 'Hàng nhập khẩu từ Puma có chất lượng rất cao và bền', 0, 3, 2),
(27, 'Puma Áo Khoác Xanh rêu', 'Puma_Green_Coat.png', 750000, '2019-12-09 14:52:07', 43, 1, 4, 'Hàng nhập khẩu từ Puma có chất lượng rất cao và bền', 0, 3, 2),
(28, 'Puma Quần Trắng Xạm', 'Puma_White_Pants.png', 150000, '2019-12-09 14:53:14', 50, 24, 70, 'Hàng nhập khẩu từ Puma có chất lượng rất cao và bền', 0, 2, 2),
(29, 'Puma Áo Thun Trắng', 'Puma_White_T_Shirt.png', 250000, '2019-12-09 14:54:09', 25, 20, 48, 'Hàng nhập khẩu từ Puma có chất lượng rất cao và bền', 0, 1, 2),
(30, 'Puma Áo Thun Trắng', 'Puma_White_T_Shirt_2.png', 250000, '2019-12-09 14:54:43', 46, 21, 60, 'Hàng nhập khẩu từ Puma có chất lượng rất cao và bền', 0, 1, 2),
(31, 'Áo Khoác Đen', 'VietNam_Black_Coat.png', 140000, '2019-12-09 14:56:21', 100, 59, 72, 'Hàng Việt Nam chất lượng cao, cực bền, mẫu mã đẹp', 0, 3, 3),
(32, 'Quần Công Sở Đen', 'VietNam_Black_Pants.png', 190000, '2019-12-09 14:57:19', 30, 17, 38, 'Hàng Việt Nam chất lượng cao, cực bền, mẫu mã đẹp', 0, 2, 3),
(33, 'Áo Thun Đen', 'VietNam_Black_T_Shirt.png', 410000, '2019-12-09 14:58:06', 30, 21, 50, 'Hàng Việt Nam chất lượng cao, cực bền, mẫu mã đẹp', 0, 1, 3),
(34, 'Áo Khoác Xanh ', 'VietNam_Blue_Coat.png', 370000, '2019-12-09 14:59:06', 20, 18, 42, 'Hàng Việt Nam chất lượng cao, cực bền, mẫu mã đẹp', 0, 3, 3),
(35, 'Quần Công Sở Đen', 'VietNam_Blue_Pants.png', 190000, '2019-12-09 15:00:16', 80, 31, 101, 'Hàng Việt Nam chất lượng cao, cực bền, mẫu mã đẹp', 0, 2, 3),
(36, 'Quần Công Sở Nâu', 'VietNam_Brown_Pants.png', 290000, '2019-12-09 15:01:00', 19, 31, 57, 'Hàng Việt Nam chất lượng cao, cực bền, mẫu mã đẹp', 0, 2, 3),
(37, 'Áo Thun Caro ', 'VietNam_Caro_T_Shirt.png', 100000, '2019-12-09 15:01:41', 95, 70, 153, 'Hàng Việt Nam chất lượng cao, cực bền, mẫu mã đẹp', 0, 1, 3),
(38, 'Quần Công Sở', 'VietNam_Coffee_Pants.png', 200000, '2019-12-09 15:04:15', 49, 21, 39, 'Hàng Việt Nam chất lượng cao, cực bền, mẫu mã đẹp', 0, 2, 3),
(39, 'Quần Công Sở', 'VietNam_Coffee_Pants_2.png', 200000, '2019-12-09 15:04:50', 12, 26, 40, 'Hàng Việt Nam chất lượng cao, cực bền, mẫu mã đẹp', 0, 2, 3),
(40, 'Áo Khoác Xạm', 'VietNam_Concrete_Coat.png', 400000, '2019-12-09 15:05:34', 40, 20, 51, 'Hàng Việt Nam chất lượng cao, cực bền, mẫu mã đẹp', 0, 3, 3),
(41, 'Áo Khoác Xanh Biển', 'VietNam_Cyan_Coat.png', 400000, '2019-12-09 15:06:28', 19, 15, 51, 'Hàng Việt Nam chất lượng cao, cực bền, mẫu mã đẹp', 0, 3, 3),
(42, 'Áo Thun Đỏ', 'VietNam_Red_T_Shirt.png', 210000, '2019-12-09 15:07:05', -8, 28, 66, 'Hàng Việt Nam chất lượng cao, cực bền, mẫu mã đẹp', 0, 1, 3),
(43, 'Áo Thun Xạm', 'VietNam_White_T_Shirt.png', 140000, '2019-12-09 15:08:47', 20, 33, 8, 'Hàng Việt Nam chất lượng cao, cực bền, mẫu mã đẹp', 0, 1, 3),
(44, 'Áo Khoác Vàng', 'VietNam_Yellow_Coat.png', 400000, '2019-12-09 15:09:32', 35, 52, 86, 'Hàng Việt Nam chất lượng cao, cực bền, mẫu mã đẹp', 0, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `taikhoan`
--

CREATE TABLE `taikhoan` (
  `MaTaiKhoan` int(11) NOT NULL,
  `TenDangNhap` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `MatKhau` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `TenHienThi` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NgaySinh` date DEFAULT NULL,
  `ThanhPho` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `BiXoa` tinyint(1) NOT NULL,
  `MaLoaiTaiKhoan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `taikhoan`
--

INSERT INTO `taikhoan` (`MaTaiKhoan`, `TenDangNhap`, `MatKhau`, `TenHienThi`, `NgaySinh`, `ThanhPho`, `BiXoa`, `MaLoaiTaiKhoan`) VALUES
(1, 'admin', 'admin', 'Admin', '1999-07-05', 'admin', 0, 2),
(2, 'tranquoctrung', 'tranquoctrung', 'Trần Quốc Trung', '1999-07-05', 'Tỉnh Ninh Thuận', 0, 1),
(3, 'trang', 'trang', 'Trang Lương Thị Huyền', '1970-01-01', 'Tỉnh Hà Giang', 0, 1),
(17, '123', '123', '123', '1970-01-01', 'Thành phố Hải Phòng', 0, 1),
(19, '1234', '123', '123', '1970-01-01', 'Thành phố Hải Phòng', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tinhtrang`
--

CREATE TABLE `tinhtrang` (
  `MaTinhTrang` int(11) NOT NULL,
  `TenTinhTrang` varchar(45) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tinhtrang`
--

INSERT INTO `tinhtrang` (`MaTinhTrang`, `TenTinhTrang`) VALUES
(1, 'Đã đặt hàng'),
(2, 'Đã BOM hàng'),
(3, 'Đã thanh toán');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chitietdondathang`
--
ALTER TABLE `chitietdondathang`
  ADD PRIMARY KEY (`MaChiTietDonDatHang`),
  ADD KEY `fk_ctddh_sp` (`MaSanPham`),
  ADD KEY `fk_ctddh_ddh` (`MaDonDatHang`);

--
-- Indexes for table `dondathang`
--
ALTER TABLE `dondathang`
  ADD PRIMARY KEY (`MaDonDatHang`),
  ADD KEY `fk_ddh_tt` (`MaTinhTrang`),
  ADD KEY `fk_ddh_tk` (`MaTaiKhoan`);

--
-- Indexes for table `hangsanxuat`
--
ALTER TABLE `hangsanxuat`
  ADD PRIMARY KEY (`MaHangSanXuat`);

--
-- Indexes for table `loaisanpham`
--
ALTER TABLE `loaisanpham`
  ADD PRIMARY KEY (`MaLoaiSanPham`);

--
-- Indexes for table `loaitaikhoan`
--
ALTER TABLE `loaitaikhoan`
  ADD PRIMARY KEY (`MaLoaiTaiKhoan`);

--
-- Indexes for table `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`MaSanPham`),
  ADD KEY `fk_sp_hsx` (`MaHangSanXuat`),
  ADD KEY `fk_sp_mlsp` (`MaLoaiSanPham`);

--
-- Indexes for table `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD PRIMARY KEY (`MaTaiKhoan`),
  ADD KEY `fk_tk_mltk` (`MaLoaiTaiKhoan`);

--
-- Indexes for table `tinhtrang`
--
ALTER TABLE `tinhtrang`
  ADD PRIMARY KEY (`MaTinhTrang`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chitietdondathang`
--
ALTER TABLE `chitietdondathang`
  MODIFY `MaSanPham` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `dondathang`
--
ALTER TABLE `dondathang`
  MODIFY `MaTaiKhoan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `MaSanPham` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `taikhoan`
--
ALTER TABLE `taikhoan`
  MODIFY `MaTaiKhoan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chitietdondathang`
--
ALTER TABLE `chitietdondathang`
  ADD CONSTRAINT `fk_ctddh_ddh` FOREIGN KEY (`MaDonDatHang`) REFERENCES `dondathang` (`MaDonDatHang`),
  ADD CONSTRAINT `fk_ctddh_sp` FOREIGN KEY (`MaSanPham`) REFERENCES `sanpham` (`MaSanPham`);

--
-- Constraints for table `dondathang`
--
ALTER TABLE `dondathang`
  ADD CONSTRAINT `fk_ddh_tk` FOREIGN KEY (`MaTaiKhoan`) REFERENCES `taikhoan` (`MaTaiKhoan`),
  ADD CONSTRAINT `fk_ddh_tt` FOREIGN KEY (`MaTinhTrang`) REFERENCES `tinhtrang` (`MaTinhTrang`);

--
-- Constraints for table `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `fk_sp_hsx` FOREIGN KEY (`MaHangSanXuat`) REFERENCES `hangsanxuat` (`MaHangSanXuat`),
  ADD CONSTRAINT `fk_sp_mlsp` FOREIGN KEY (`MaLoaiSanPham`) REFERENCES `loaisanpham` (`MaLoaiSanPham`);

--
-- Constraints for table `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD CONSTRAINT `fk_tk_mltk` FOREIGN KEY (`MaLoaiTaiKhoan`) REFERENCES `loaitaikhoan` (`MaLoaiTaiKhoan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
