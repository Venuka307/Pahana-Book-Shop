package com.pahanaedu.servlet;

import com.pahanaedu.dao.DAOFactory;
import com.pahanaedu.dao.UserDAO;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/AddUser")
public class AddUser extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("AddUser Servlet doPost() called"); 
        
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();
        String role = request.getParameter("role");

    
        System.out.println("Received add user request:");
        System.out.println("Username: " + username);
        System.out.println("Password: " + password);
        System.out.println("Role: " + role);

        
        if(username.isEmpty() || password.isEmpty() || role == null || role.isEmpty()) {
            System.out.println("Validation failed: some fields are empty");
            request.setAttribute("message", "All fields are required!");
            request.setAttribute("msgType", "error");
            request.getRequestDispatcher("addUser.jsp").forward(request, response);
            return;
        }

        UserDAO userDAO = DAOFactory.getUserDAO();

     
        boolean exists = userDAO.isUsernameExists(username);
        System.out.println("Does username exist? " + exists);
        if(exists) {
            request.setAttribute("message", "Username already taken. Please choose another.");
            request.setAttribute("msgType", "error");
            request.getRequestDispatcher("addUser.jsp").forward(request, response);
            return;
        }

     
        boolean added = userDAO.addUser(username, password, role);
        System.out.println("User added? " + added);

        if(added) {
            request.setAttribute("message", "User added successfully!");
            request.setAttribute("msgType", "success");
        } else {
            request.setAttribute("message", "Error adding user. Please try again.");
            request.setAttribute("msgType", "error");
        }

        request.getRequestDispatcher("addUser.jsp").forward(request, response);
    }
}
