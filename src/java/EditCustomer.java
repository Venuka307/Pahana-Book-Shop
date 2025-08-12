package com.pahanaedu.servlet;

import com.pahanaedu.dao.CustomerDAO;
import com.pahanaedu.model.Customer;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/EditCustomer")
public class EditCustomer extends HttpServlet {
    private CustomerDAO customerDAO;

    @Override
    public void init() {
        customerDAO = new CustomerDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accountNumber = request.getParameter("accountNumber");

        if (accountNumber == null || accountNumber.trim().isEmpty()) {
            response.sendRedirect("customers.jsp");  
            return;
        }

        Customer customer = customerDAO.getCustomerByAccountNumber(accountNumber);

        if (customer == null) {
            HttpSession session = request.getSession();
            session.setAttribute("message", "❌ Customer not found.");
            session.setAttribute("msgType", "error");
            response.sendRedirect("customers.jsp");
            return;
        }

        request.setAttribute("editCustomer", customer);
        request.getRequestDispatcher("addCustomer.jsp").forward(request, response);
    }
}
