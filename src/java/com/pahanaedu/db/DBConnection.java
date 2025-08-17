package com.pahanaedu.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static DBConnection instance;
    private Connection conn;

 
    private DBConnection() {
        try {
       
            Class.forName("com.mysql.cj.jdbc.Driver");

            
            String url = "jdbc:mysql://localhost:3306/pahanaedu_db"; 
            String username = "root";    
            String password = "";       
            conn = DriverManager.getConnection(url, username, password);

            System.out.println("Database connected successfully!");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

 
    public static DBConnection getInstance() {
        if (instance == null) {
            instance = new DBConnection();
        }
        return instance;
    }

    
    public Connection getConnection() {
        return conn;
    }
}
