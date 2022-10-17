package Main;

import java.sql.Connection;
import Main.MySQLConnect;
import java.text.ParseException;


public class MainClass {

    public static void main(String args[]) throws ParseException {
        Connection conn = null;
        conn = MySQLConnect.Connect();
//        Main.LoaiSanPhamClass.hienthi_loaisanpham(conn);
//        Main.LoaiSanPhamClass.them_loaisanpham(conn);
//        Main.LoaiSanPhamClass.sua_loaisanpham(conn);
//        Main.LoaiSanPhamClass.xoa_loaisanpham(conn);
//        Main.SanPhamClass.hienthi_sanpham(conn);
  //      Main.SanPhamClass.them_sanpham(conn);
//        Main.SanPhamClass.sua_sanpham(conn);
//        Main.SanPhamClass.xoa_sanpham(conn);

   //     Main.LoHangClass.hienthi_thongtinsanpham(conn);
    //     Main.LoHangClass.hienthi_lohang(conn);
   //      Main.LoHangClass.them_lohang(conn);
    //     Main.LoHangClass.sua_lohang(conn);
   //      Main.LoHangClass.xoa_lohang(conn);
     //    Main.LoHangSanpham.hienthi_lohangsanpham(conn);
      //   Main.LoHangSanpham.them_lohangsanpham(conn);
      //   Main.LoHangSanpham.xoa_lohangsanpham(conn);
      //   Main.LoHangSanpham.hienthi_lohangsanpham(conn);
    }
}
