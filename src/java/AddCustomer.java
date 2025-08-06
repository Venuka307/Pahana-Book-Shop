package com.pahanaedu.servlet;

import com.pahanaedu.dao.CustomerDAO;
import com.pahanaedu.model.Customer;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet("/AddCustomer")
public class AddCustomer extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private CustomerDAO customerDAO;

    @Override
    public void init() {
        customerDAO = new CustomerDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accountNumber = request.getParameter("accountNumber").trim();
        String name = request.getParameter("name").trim();
        String address = request.getParameter("address").trim();
        String telephone = request.getParameter("telephone").trim();

        // 🟡 Debug log
        System.out.println("🚀 Received from form:");
        System.out.println("Account Number: " + accountNumber);
        System.out.println("Name: " + name);
        System.out.println("Address: " + address);
        System.out.println("Telephone: " + telephone);

        if (accountNumber.isEmpty() || name.isEmpty() || address.isEmpty() || telephone.isEmpty()) {
            request.setAttribute("message", "❌ All fields are required.");
            request.setAttribute("msgType", "error");
            request.getRequestDispatcher("addCustomer.jsp").forward(request, response);
            return;
        }

        Customer customer = new Customer(accountNumber, name, address, telephone);

        boolean success = customerDAO.addCustomer(customer);

        // ✅ Log result
        System.out.println("✅ DAO returned: " + success);

        if (success) {
            request.setAttribute("message", "✅ Customer added successfully!");
            request.setAttribute("msgType", "success");
        } else {
            request.setAttribute("message", "❌ Failed to add customer. Maybe duplicate account number.");
            request.setAttribute("msgType", "error");
        }

        request.getRequestDispatcher("addCustomer.jsp").forward(request, response);
    }
}
