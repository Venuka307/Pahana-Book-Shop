package com.pahanaedu.servlet;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/EditItem")
public class EditItem extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String itemId = request.getParameter("itemId");

        // For now, just show a message — later you can load item details for editing
        request.setAttribute("message", "📝 Edit requested for Item ID: " + itemId);
        request.setAttribute("msgType", "success");

        // Forward back to manageItem.jsp or to a dedicated edit page if you create one
        RequestDispatcher rd = request.getRequestDispatcher("manageItem.jsp");
        rd.forward(request, response);
    }
}
