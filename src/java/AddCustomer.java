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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accountNumber = request.getParameter("account_number");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String telephone = request.getParameter("telephone");
        String email = request.getParameter("email");

        // basic null-safe trimming
        accountNumber = accountNumber != null ? accountNumber.trim() : "";
        name = name != null ? name.trim() : "";
        address = address != null ? address.trim() : "";
        telephone = telephone != null ? telephone.trim() : "";
        email = email != null ? email.trim() : "";

        if (accountNumber.isEmpty() || name.isEmpty() || address.isEmpty() || telephone.isEmpty() || email.isEmpty()) {
            request.setAttribute("message", "❌ All fields are required.");
            request.setAttribute("msgType", "error");
            request.getRequestDispatcher("addCustomer.jsp").forward(request, response);
            return;
        }

        // Check if account number already exists to avoid duplicates
        Customer existing = customerDAO.getCustomerByAccountNumber(accountNumber);
        if (existing != null) {
            request.setAttribute("message", "❌ Account Number already exists! Please use a unique account number.");
            request.setAttribute("msgType", "error");
            request.getRequestDispatcher("addCustomer.jsp").forward(request, response);
            return;
        }

        Customer customer = new Customer(accountNumber, name, address, telephone, email);
        boolean success = customerDAO.addCustomer(customer);

        if (success) {
            HttpSession session = request.getSession();
            session.setAttribute("message", "✅ Customer added successfully!");
            session.setAttribute("msgType", "success");
            response.sendRedirect("customers.jsp");
        } else {
            request.setAttribute("message", "❌ Failed to add customer.");
            request.setAttribute("msgType", "error");
            request.getRequestDispatcher("addCustomer.jsp").forward(request, response);
        }
    }
}
