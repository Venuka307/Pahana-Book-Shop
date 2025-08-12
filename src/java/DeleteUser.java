package com.pahanaedu.servlet;

import com.pahanaedu.dao.DAOFactory;
import com.pahanaedu.dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/DeleteUser")
public class DeleteUser extends HttpServlet {

    private UserDAO userDAO;

    @Override
    public void init() {
        // Use DAOFactory to get the UserDAO instance
        userDAO = DAOFactory.getUserDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("id");
        int id = 0;
        try {
            id = Integer.parseInt(idParam);
        } catch (NumberFormatException e) {
            // invalid id, redirect back
            response.sendRedirect("users.jsp");
            return;
        }

        try {
            boolean deleted = userDAO.deleteUser(id);

            HttpSession session = request.getSession();
            if (deleted) {
                session.setAttribute("message", "🗑️ User deleted successfully.");
                session.setAttribute("msgType", "success");
            } else {
                session.setAttribute("message", "❌ Failed to delete user.");
                session.setAttribute("msgType", "error");
            }

            response.sendRedirect("users.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "❌ Error: " + e.getMessage());
            request.setAttribute("msgType", "error");
            request.getRequestDispatcher("users.jsp").forward(request, response);
        }
    }
}
