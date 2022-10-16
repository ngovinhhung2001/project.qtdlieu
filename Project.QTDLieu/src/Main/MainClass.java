package Main;

import java.sql.Connection;
import Main.MySQLConnect;

public class MainClass {

    public static void main(String args[]) {
        Connection conn = null;
        conn = MySQLConnect.Connect();
//        Main.LoaiSanPhamClass.hienthi_loaisanpham(conn);
//        Main.LoaiSanPhamClass.them_loaisanpham(conn);
//        Main.LoaiSanPhamClass.sua_loaisanpham(conn);
//        Main.LoaiSanPhamClass.xoa_loaisanpham(conn);
//        Main.SanPhamClass.hienthi_sanpham(conn);
//        Main.SanPhamClass.them_sanpham(conn);
        Main.SanPhamClass.sua_sanpham(conn);
//        Main.SanPhamClass.xoa_loaisanpham(conn);
    }
}
