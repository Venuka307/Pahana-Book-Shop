package com.pahanaedu.dao;

import com.pahanaedu.db.DBConnection;
import com.pahanaedu.model.Sales;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SalesDAO {

    public boolean addSale(Sales sale) {
        String sql = "INSERT INTO sales (total, payment_method, cashier_id, customer_name, book_title, quantity) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getInstance().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setDouble(1, sale.getTotal());
            ps.setString(2, sale.getPaymentMethod());
            ps.setInt(3, sale.getCashierId());
            ps.setString(4, sale.getCustomerName());
            ps.setString(5, sale.getBookTitle());
            ps.setInt(6, sale.getQuantity());

            int affectedRows = ps.executeUpdate();
            if (affectedRows == 0) return false;

            try (ResultSet generatedKeys = ps.getGeneratedKeys()) {
                if (generatedKeys.next()) sale.setId(generatedKeys.getInt(1));
            }
            return true;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Sales> getAllSales() {
        List<Sales> list = new ArrayList<>();
        String sql = "SELECT * FROM sales ORDER BY date DESC";
        try (Connection conn = DBConnection.getInstance().getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                list.add(new Sales(
                        rs.getInt("id"),
                        rs.getTimestamp("date").toLocalDateTime(),
                        rs.getDouble("total"),
                        rs.getString("payment_method"),
                        rs.getInt("cashier_id"),
                        rs.getString("customer_name"),
                        rs.getString("book_title"),
                        rs.getInt("quantity")
                ));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
