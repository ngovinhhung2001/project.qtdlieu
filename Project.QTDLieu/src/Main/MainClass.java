package Main;

import java.sql.Connection;

public class MainClass {

    public static void main(String args[]) {
        Connection conn = null;
        Main.LoaiSanPhamClass.hienthi_loaisanpham();
        Main.LoaiSanPhamClass.them_loaisanpham();
    }
}
