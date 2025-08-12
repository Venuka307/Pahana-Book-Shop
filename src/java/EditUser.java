package com.pahanaedu.servlet;

import com.pahanaedu.dao.DAOFactory;
import com.pahanaedu.dao.UserDAO;
import com.pahanaedu.model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/EditUser")
public class EditUser extends HttpServlet {
    private UserDAO userDAO;

    @Override
    public void init() {
        userDAO = DAOFactory.getUserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("id");
        if (idParam == null || idParam.trim().isEmpty()) {
            response.sendRedirect("users.jsp");
            return;
        }

        int id;
        try {
            id = Integer.parseInt(idParam);
        } catch (NumberFormatException e) {
            response.sendRedirect("users.jsp");
            return;
        }

        User user = userDAO.getUserById(id);

        if (user == null) {
            request.setAttribute("message", "❌ User not found.");
            request.getRequestDispatcher("users.jsp").forward(request, response);
            return;
        }

        request.setAttribute("editUser", user);

        // Forward to addUser.jsp form (used for both add and edit)
        request.getRequestDispatcher("addUser.jsp").forward(request, response);
    }
}
