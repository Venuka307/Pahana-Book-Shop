package com.pahanaedu.servlet;

import com.pahanaedu.dao.CustomerDAO;
import com.pahanaedu.model.Customer;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/UpdateCustomer")
public class UpdateCustomer extends HttpServlet {

    private CustomerDAO customerDAO;

    @Override
    public void init() {
        customerDAO = new CustomerDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accountNumber = request.getParameter("accountNumber");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String telephone = request.getParameter("telephone");
        String email = request.getParameter("email");

        if (accountNumber == null || accountNumber.trim().isEmpty()
                || name == null || name.trim().isEmpty()
                || address == null || address.trim().isEmpty()
                || telephone == null || telephone.trim().isEmpty()
                || email == null || email.trim().isEmpty()) {

            request.setAttribute("message", "❌ All fields are required.");
            request.setAttribute("msgType", "error");
            Customer customer = new Customer(accountNumber, name, address, telephone, email);
            request.setAttribute("editCustomer", customer);
            request.getRequestDispatcher("addCustomer.jsp").forward(request, response);
            return;
        }

        try {
            Customer updatedCustomer = new Customer(accountNumber, name, address, telephone, email);

            boolean updated = customerDAO.updateCustomer(updatedCustomer);

            if (updated) {
                HttpSession session = request.getSession();
                session.setAttribute("message", "✅ Customer updated successfully.");
                session.setAttribute("msgType", "success");
                response.sendRedirect("customers.jsp");
            } else {
                request.setAttribute("message", "❌ Failed to update customer.");
                request.setAttribute("msgType", "error");
                request.setAttribute("editCustomer", updatedCustomer);
                request.getRequestDispatcher("addCustomer.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "❌ Error: " + e.getMessage());
            request.setAttribute("msgType", "error");
            request.getRequestDispatcher("addCustomer.jsp").forward(request, response);
        }
    }
}
