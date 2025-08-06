package com.pahanaedu.dao;

import com.pahanaedu.db.DBConnection;
import com.pahanaedu.model.Customer;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerDAO {

    public boolean addCustomer(Customer customer) {
        String sql = "INSERT INTO customers (account_number, name, address, telephone) VALUES (?, ?, ?, ?)";

        try {
            Connection con = DBConnection.getInstance().getConnection();
            if (con == null) {
                System.out.println("❌ Connection is null! Check DBConnection.java.");
                return false;
            }

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, customer.getAccountNumber());
            ps.setString(2, customer.getName());
            ps.setString(3, customer.getAddress());
            ps.setString(4, customer.getTelephone());

            int rows = ps.executeUpdate();
            System.out.println("✅ Insert executed, rows affected: " + rows);
            return rows > 0;

        } catch (SQLException e) {
            System.out.println("❌ Error adding customer: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    // This is the missing method your JSP needs
    public List<Customer> getAllCustomers() {
        List<Customer> customers = new ArrayList<>();
        String sql = "SELECT * FROM customers";

        try {
            Connection con = DBConnection.getInstance().getConnection();
            if (con == null) {
                System.out.println("❌ Connection is null while fetching customers.");
                return customers;
            }

            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                Customer customer = new Customer(
                    rs.getString("account_number"),
                    rs.getString("name"),
                    rs.getString("address"),
                    rs.getString("telephone")
                );
                customers.add(customer);
            }

        } catch (SQLException e) {
            System.out.println("❌ Error reading customers: " + e.getMessage());
            e.printStackTrace();
        }

        return customers;
    }
}
