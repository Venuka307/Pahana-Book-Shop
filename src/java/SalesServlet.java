package com.pahanaedu.servlet;

import com.pahanaedu.dao.DAOFactory;
import com.pahanaedu.dao.SalesDAO;  
import com.pahanaedu.model.Sales;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/SalesServlet")
public class SalesServlet extends HttpServlet {

    private SalesDAO salesDAO;

    @Override
    public void init() {
        
        salesDAO = DAOFactory.getSalesDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            
            String customerName = request.getParameter("customerName");
            String bookTitle = request.getParameter("bookTitle");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            double unitPrice = Double.parseDouble(request.getParameter("unitPrice"));
            double total = quantity * unitPrice;
            String paymentMethod = request.getParameter("paymentMethod");
            int cashierId = Integer.parseInt(request.getParameter("cashierId"));

            
            Sales sale = new Sales();
            sale.setCustomerName(customerName);
            sale.setBookTitle(bookTitle);
            sale.setQuantity(quantity);
            sale.setTotal(total);
            sale.setPaymentMethod(paymentMethod);
            sale.setCashierId(cashierId);

            
            boolean success = salesDAO.addSale(sale);

            
            request.setAttribute("message", success ? "✅ Sale saved!" : "❌ Failed to save sale.");

        } catch (Exception e) {
           
            request.setAttribute("message", "⚠️ Error: " + e.getMessage());
        }

       
        request.getRequestDispatcher("sales.jsp").forward(request, response);
    }
}
