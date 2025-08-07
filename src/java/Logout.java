package com.pahanaedu.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/Logout")
public class Logout extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }

       
        response.sendRedirect("login.jsp");  
    }
}
