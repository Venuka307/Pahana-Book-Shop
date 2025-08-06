package com.pahanaedu.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static DBConnection instance;
    private Connection connection;

    private final String url = "jdbc:mysql://localhost:3306/pahanaedu_db";
    private final String user = "root";
    private final String password = ""; // Add your password if needed

    private DBConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            this.connection = DriverManager.getConnection(url, user, password);
            System.out.println("✅ DB Connected from Singleton");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("❌ DB Connection failed in Singleton: " + e.getMessage());
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
        if (connection == null) {
            System.out.println("❌ DB connection is NULL in getConnection()!");
        }
        return connection;
    }
}
