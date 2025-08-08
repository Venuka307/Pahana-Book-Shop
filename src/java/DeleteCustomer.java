package com.pahanaedu.servlet;

import com.pahanaedu.dao.CustomerDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/DeleteCustomer")
public class DeleteCustomer extends HttpServlet {

    private CustomerDAO customerDAO;

    @Override
    public void init() {
        customerDAO = new CustomerDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accountNumber = request.getParameter("accountNumber");

        try {
            boolean deleted = customerDAO.deleteCustomer(accountNumber);

            HttpSession session = request.getSession();
            if (deleted) {
                session.setAttribute("message", "🗑️ Customer deleted successfully.");
                session.setAttribute("msgType", "success");
            } else {
                session.setAttribute("message", "❌ Failed to delete customer.");
                session.setAttribute("msgType", "error");
            }

            response.sendRedirect("customers.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "❌ Error: " + e.getMessage());
            request.setAttribute("msgType", "error");
            request.getRequestDispatcher("customers.jsp").forward(request, response);
        }
    }
}
