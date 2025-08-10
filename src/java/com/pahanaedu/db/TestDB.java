package com.pahanaedu.test; // or your preferred package

import java.sql.Connection;

public class TestDB {
    public static void main(String[] args) {
        Connection conn = com.pahanaedu.db.DBConnection.getInstance().getConnection();
        if (conn != null) {
            System.out.println("Connection is successful!");
        } else {
            System.out.println("Connection failed!");
        }
    }
}
