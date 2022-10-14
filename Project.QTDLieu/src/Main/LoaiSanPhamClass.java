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
            System.out.println("--------------------");
            System.out.println("Danh sách loại sản phẩm");
            System.out.println("--------------------");
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
    
    public static void hienthi_loaisanpham(int ma_loaisanpham){
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Connection conn = null;
        conn = MySQLConnect.Connect();
        
        try {
            String sql = "SELECT * FROM loaisanpham WHERE ma_loaisanpham = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,ma_loaisanpham);
            rs = pstmt.executeQuery();

            System.out.println("--------------------");
            while (rs.next()) {
                int rs_ma_loaisanpham = rs.getInt("ma_loaisanpham");
                String rs_ten_loaisanpham = rs.getString("ten_loaisanpham");
                String rs_mota_loaisanpham = rs.getString("mota_loaisanpham");
                System.out.println("Mã loại sản phẩm: " + rs_ma_loaisanpham);
                System.out.println("Tên loại sản phẩm: " + rs_ten_loaisanpham);
                System.out.println("Mô tả loại sản phẩm: " + rs_mota_loaisanpham);
                System.out.println("--------------------");
            }
        } catch (SQLException ex) { //xử lý ngoại lệ
            System.out.println("SQLException: " + ex.getMessage());
        }
    }
    
    public static void them_loaisanpham(){
        Scanner sc = new Scanner(System.in);
        System.out.print("Nhập tên loại sản phẩm: ");
        String ten_loaisanpham = sc.nextLine();
        System.out.print("Nhập mô tả loại sản phẩm: ");
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
            System.out.println("Đã thêm thành công");
        }catch (SQLException ex) { //xử lý ngoại lệ
            System.out.println("SQLException: " + ex.getMessage());
        }
    }
    
    public static void sua_loaisanpham(){
        Scanner sc = new Scanner(System.in);
        hienthi_loaisanpham();
        System.out.print("Nhập mã loại sản phẩm muốn chỉnh sửa: ");
        int ma_loaisanpham = sc.nextInt();
        sc.nextLine();
        System.out.println("--------------------");
        System.out.println("Loại sản phẩm vừa chọn ");
        hienthi_loaisanpham(ma_loaisanpham);
        System.out.println("Nhập tên loại sản phẩm muốn chỉnh sửa thành: ");
        String ten_loaisanpham = sc.nextLine();
        System.out.println("Nhập mô tả loại sản phẩm muốn chỉnh sửa thành: ");
        String mota_loaisanpham = sc.nextLine();
        
        CallableStatement cstmt = null;
        Connection conn = null;
        conn = MySQLConnect.Connect();
        
        try{
            String sql = "{call sua_loaisanpham(?,?,?)}";
            cstmt = conn.prepareCall(sql);
            cstmt.setInt(1,ma_loaisanpham);
            cstmt.setString(2,ten_loaisanpham);
            cstmt.setString(3,mota_loaisanpham);
            cstmt.executeQuery();
            System.out.println("Đã chỉnh sửa thành công");
        }catch (SQLException ex) { //xử lý ngoại lệ
            System.out.println("SQLException: " + ex.getMessage());
        }
    }
}
