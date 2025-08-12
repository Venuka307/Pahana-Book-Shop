package com.pahanaedu.servlet;

import com.pahanaedu.dao.DAOFactory;
import com.pahanaedu.dao.UserDAO;
import com.pahanaedu.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/UpdateUser")
public class UpdateUser extends HttpServlet {

    private UserDAO userDAO;

    @Override
    public void init() {
        // Use DAOFactory here
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
            response.sendRedirect("users.jsp");
            return;
        }

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        if (username == null || username.trim().isEmpty()
                || password == null || password.trim().isEmpty()
                || role == null || role.trim().isEmpty()) {

            request.setAttribute("message", "❌ All fields are required.");
            request.setAttribute("msgType", "error");

            User user = new User(id, username, password, role);
            request.setAttribute("editUser", user);

            request.getRequestDispatcher("addUser.jsp").forward(request, response);
            return;
        }

        try {
            User updatedUser = new User(id, username, password, role);

            boolean updated = userDAO.updateUser(updatedUser);

            if (updated) {
                HttpSession session = request.getSession();
                session.setAttribute("message", "✅ User updated successfully.");
                session.setAttribute("msgType", "success");

                response.sendRedirect("users.jsp");
            } else {
                request.setAttribute("message", "❌ Failed to update user.");
                request.setAttribute("msgType", "error");
                request.setAttribute("editUser", updatedUser);
                request.getRequestDispatcher("addUser.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "❌ Error: " + e.getMessage());
            request.setAttribute("msgType", "error");
            request.getRequestDispatcher("addUser.jsp").forward(request, response);
        }
    }
}
