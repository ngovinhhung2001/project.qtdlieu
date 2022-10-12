package Main;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.CallableStatement;
import java.util.Scanner;
import Main.MySQLConnect;


public class LoaiSanPhamClass {
    
    public static void hienthi_loaisanpham(){
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Connection conn = null;
        conn = MySQLConnect.Connect();
        
        try {
            String sql = "SELECT * FROM loaisanpham";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                int rs_ma_loaisanpham = rs.getInt("ma_loaisanpham");
                String rs_ten_loaisanpham = rs.getString("ten_loaisanpham");
                String rs_mota_loaisanpham = rs.getString("mota_loaisanpham");
                System.out.println("Mã loại sản phẩm: " + rs_ma_loaisanpham);
                System.out.println("Tên loại sản phẩm: " + rs_ten_loaisanpham);
                System.out.println("Mô tả loại sản phẩm: " + rs_mota_loaisanpham);
                System.out.println("-------------------");
            }
        } catch (SQLException ex) { //xử lý ngoại lệ
            System.out.println("SQLException: " + ex.getMessage());
        }
    }
    
    public static void them_loaisanpham(){
        Scanner sc = new Scanner(System.in);
        System.out.println("Nhập tên loại sản phẩm: ");
        String ten_loaisanpham = sc.nextLine();
        System.out.println("Nhập mô tả loại sản phẩm: ");
        String mota_loaisanpham = sc.nextLine();
        
        CallableStatement cstmt = null;
        Connection conn = null;
        conn = MySQLConnect.Connect();
        
        try{
            String sql = "{call them_loaisanpham(?,?)}";
            cstmt = conn.prepareCall(sql);
            cstmt.setString(1,ten_loaisanpham);
            cstmt.setString(2,mota_loaisanpham);
            cstmt.executeQuery();
        }catch (SQLException ex) { //xử lý ngoại lệ
            System.out.println("SQLException: " + ex.getMessage());
        }
        
    }
}
