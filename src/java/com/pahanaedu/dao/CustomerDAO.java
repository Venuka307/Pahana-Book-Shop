package com.pahanaedu.dao;

import com.pahanaedu.db.DBConnection;
import com.pahanaedu.model.Customer;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerDAO {

    public boolean addCustomer(Customer customer) {
        String sql = "INSERT INTO customers (account_number, name, address, telephone, email) VALUES (?, ?, ?, ?, ?)";
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
            ps.setString(5, customer.getEmail());

            int rows = ps.executeUpdate();
            System.out.println("✅ Insert executed, rows affected: " + rows);
            return rows > 0;

        } catch (SQLException e) {
            System.out.println("❌ Error adding customer: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

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
                    rs.getString("telephone"),
                    rs.getString("email")
                );
                customers.add(customer);
            }

        } catch (SQLException e) {
            System.out.println("❌ Error reading customers: " + e.getMessage());
            e.printStackTrace();
        }

        return customers;
    }

    public Customer getCustomerByAccountNumber(String accountNumber) {
        String sql = "SELECT * FROM customers WHERE account_number = ?";
        Customer customer = null;

        try {
            Connection con = DBConnection.getInstance().getConnection();
            if (con == null) {
                System.out.println("❌ Connection is null while fetching customer.");
                return null;
            }

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, accountNumber);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                customer = new Customer(
                    rs.getString("account_number"),
                    rs.getString("name"),
                    rs.getString("address"),
                    rs.getString("telephone"),
                    rs.getString("email")
                );
            }
        } catch (SQLException e) {
            System.out.println("❌ Error fetching customer: " + e.getMessage());
            e.printStackTrace();
        }

        return customer;
    }

    public boolean updateCustomer(Customer customer) {
        String sql = "UPDATE customers SET name=?, address=?, telephone=?, email=? WHERE account_number=?";
        try {
            Connection con = DBConnection.getInstance().getConnection();
            if (con == null) {
                System.out.println("❌ Connection is null! Check DBConnection.java.");
                return false;
            }

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, customer.getName());
            ps.setString(2, customer.getAddress());
            ps.setString(3, customer.getTelephone());
            ps.setString(4, customer.getEmail());
            ps.setString(5, customer.getAccountNumber());

            int rows = ps.executeUpdate();
            System.out.println("✅ Update executed, rows affected: " + rows);
            return rows > 0;

        } catch (SQLException e) {
            System.out.println("❌ Error updating customer: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteCustomer(String accountNumber) {
        String sql = "DELETE FROM customers WHERE account_number=?";
        try {
            Connection con = DBConnection.getInstance().getConnection();
            if (con == null) {
                System.out.println("❌ Connection is null! Check DBConnection.java.");
                return false;
            }

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, accountNumber);

            int rows = ps.executeUpdate();
            System.out.println("✅ Delete executed, rows affected: " + rows);
            return rows > 0;

        } catch (SQLException e) {
            System.out.println("❌ Error deleting customer: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
    
    // New method for searching customers by keyword (account number, name, or email)
    public List<Customer> searchCustomers(String keyword) {
        List<Customer> customers = new ArrayList<>();
        String sql = "SELECT * FROM customers WHERE account_number LIKE ? OR name LIKE ? OR email LIKE ?";
        try {
            Connection con = DBConnection.getInstance().getConnection();
            if (con == null) {
                System.out.println("❌ Connection is null! Check DBConnection.java.");
                return customers;
            }

            PreparedStatement ps = con.prepareStatement(sql);
            String searchPattern = "%" + keyword + "%";
            ps.setString(1, searchPattern);
            ps.setString(2, searchPattern);
            ps.setString(3, searchPattern);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Customer customer = new Customer(
                    rs.getString("account_number"),
                    rs.getString("name"),
                    rs.getString("address"),
                    rs.getString("telephone"),
                    rs.getString("email")
                );
                customers.add(customer);
            }
        } catch (SQLException e) {
            System.out.println("❌ Error searching customers: " + e.getMessage());
            e.printStackTrace();
        }
        return customers;
    }
}
