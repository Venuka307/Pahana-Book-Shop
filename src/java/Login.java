package com.pahanaedu.servlet;

import com.pahanaedu.dao.DAOFactory;
import com.pahanaedu.dao.UserDAO;
import com.pahanaedu.model.User;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/Login")
public class Login extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Invalidate old session first (ensures fresh login)
        HttpSession oldSession = request.getSession(false);
        if (oldSession != null) {
            oldSession.invalidate();
        }

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        UserDAO userDAO = DAOFactory.getUserDAO();
        User user = userDAO.login(username, password);

        if (user != null) {
            // Always create a new session for the logged-in user
            HttpSession session = request.getSession(true);
            session.setAttribute("loggedUser", user);
            response.sendRedirect("home.jsp"); // Successful login → go to dashboard
        } else {
            // Invalid login → forward to login.jsp with alert
            request.setAttribute("error", "❌ Invalid username or password");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
