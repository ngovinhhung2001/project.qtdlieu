package Main;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MainClass {

    public static void main(String args[]) {
        Connection conn = null;
        Main.SanPhamClass.hienthi_sanpham();
    }
}
