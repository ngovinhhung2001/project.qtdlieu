package Main;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import Main.MySQLConnect;

public class SanPhamClass {

    private int ma_sanpham;
    private String ten_sanpham;
    private String mota_sanpham;
    private String ma_loaisanpham;

    public SanPhamClass() {
        this.ma_sanpham = 0;
        this.ten_sanpham = "Unknown";
        this.mota_sanpham = "Unknown";
        this.ma_loaisanpham = "Unknown";
    }

    public SanPhamClass(int ma_sanpham, String ten_sanpham, String mota_sanpham, String ma_loaisanpham) {
        this.ma_sanpham = ma_sanpham;
        this.ten_sanpham = ten_sanpham;
        this.mota_sanpham = mota_sanpham;
        this.ma_loaisanpham = ma_loaisanpham;
    }

    public static void hienthi_sanpham() {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Connection conn = null;

        conn = MySQLConnect.Connect();

        try {
            String sql = "SELECT * FROM sanpham";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                int rs_ma_sanpham = rs.getInt("ma_sanpham");
                String rs_ten_sanpham = rs.getString("ten_sanpham");
                String rs_mota_sanpham = rs.getString("mota_sanpham");
                int rs_ma_loaisanpham = rs.getInt("ma_loaisanpham");
                System.out.println("Mã sản phẩm: " + rs_ma_sanpham);
                System.out.println("Tên sản phẩm: " + rs_ten_sanpham);
                System.out.println("Mô tả sản phẩm: " + rs_mota_sanpham);
                System.out.println("Mã loại sản phẩm: " + rs_ma_loaisanpham);
                System.out.println("-------------------");
            }
        } catch (SQLException ex) { //xử lý ngoại lệ
            System.out.println("SQLException: " + ex.getMessage());
        }
    }
}
