package com.pahanaedu.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.*;

@WebServlet("/AddUser")
public class AddUser extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // File to store users (inside WEB-INF)
    private static final String USER_FILE = "/WEB-INF/users.txt";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();
        String role = request.getParameter("role");

        // Basic validation
        if(username.isEmpty() || password.isEmpty() || role == null || role.isEmpty()) {
            request.setAttribute("message", "All fields are required!");
            request.setAttribute("msgType", "error");
            request.getRequestDispatcher("addUser.jsp").forward(request, response);
            return;
        }

        // Check if username already exists
        if(isUsernameExists(username, request)) {
            request.setAttribute("message", "Username already taken. Please choose another.");
            request.setAttribute("msgType", "error");
            request.getRequestDispatcher("addUser.jsp").forward(request, response);
            return;
        }

        // Save user data to file - format: username,password,role
        // Note: Password stored as plain text here, not recommended for production
        String userLine = username + "," + password + "," + role + System.lineSeparator();

        String filePath = getServletContext().getRealPath(USER_FILE);
        synchronized(this) {
            try (FileWriter fw = new FileWriter(filePath, true);
                 BufferedWriter bw = new BufferedWriter(fw)) {
                bw.write(userLine);
            } catch (IOException e) {
                e.printStackTrace();
                request.setAttribute("message", "Error saving user. Please try again.");
                request.setAttribute("msgType", "error");
                request.getRequestDispatcher("addUser.jsp").forward(request, response);
                return;
            }
        }

        request.setAttribute("message", "User added successfully!");
        request.setAttribute("msgType", "success");
        request.getRequestDispatcher("addUser.jsp").forward(request, response);
    }

    private boolean isUsernameExists(String username, HttpServletRequest request) throws IOException {
        String filePath = getServletContext().getRealPath(USER_FILE);
        File file = new File(filePath);
        if(!file.exists()) return false;

        try(BufferedReader br = new BufferedReader(new FileReader(file))) {
            String line;
            while((line = br.readLine()) != null) {
                String[] parts = line.split(",");
                if(parts.length > 0 && parts[0].equalsIgnoreCase(username)) {
                    return true;
                }
            }
        }
        return false;
    }
}
