package Main;

import java.sql.Connection;
import Main.MySQLConnect;

public class MainClass {

    public static void main(String args[]) {
        Connection conn = null;
        conn = MySQLConnect.Connect();
//        Main.LoaiSanPhamClass.hienthi_loaisanpham();
        Main.LoaiSanPhamClass.them_loaisanpham(conn);
        Main.LoaiSanPhamClass.xoa_loaisanpham(conn);
    }
}
