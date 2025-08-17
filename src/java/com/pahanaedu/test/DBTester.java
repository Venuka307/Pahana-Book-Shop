package com.pahanaedu.test;

import com.pahanaedu.db.DBConnection;
import java.sql.*;

public class DBTester {  
    public static void main(String[] args) {
        try {
            Connection conn = DBConnection.getInstance().getConnection();
            if (conn != null && !conn.isClosed()) {
                System.out.println("✅ Connection OK");
                ResultSet rs = conn.createStatement().executeQuery("SELECT * FROM items");
                while (rs.next()) {
                    System.out.println(rs.getInt("id") + " | " + rs.getString("name"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
