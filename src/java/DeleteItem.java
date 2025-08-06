package com.pahanaedu.servlet;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import java.util.*;

@WebServlet("/DeleteItem")
public class DeleteItem extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String itemIdToDelete = request.getParameter("itemId");
        String filePath = getServletContext().getRealPath("/WEB-INF/items.txt");
        File file = new File(filePath);

        HttpSession session = request.getSession();

        if (!file.exists()) {
            session.setAttribute("message", "❌ No items to delete.");
            session.setAttribute("msgType", "error");
        } else {
            try {
                List<String> allLines = new ArrayList<>();
                try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
                    String line;
                    while ((line = reader.readLine()) != null) {
                        if (!line.startsWith(itemIdToDelete + ",")) {
                            allLines.add(line);
                        }
                    }
                }

                try (BufferedWriter writer = new BufferedWriter(new FileWriter(file, false))) {
                    for (String l : allLines) {
                        writer.write(l);
                        writer.newLine();
                    }
                }

                session.setAttribute("message", "🗑️ Item deleted successfully!");
                session.setAttribute("msgType", "success");

            } catch (Exception e) {
                e.printStackTrace();
                session.setAttribute("message", "❌ Error deleting item: " + e.getMessage());
                session.setAttribute("msgType", "error");
            }
        }

        // Redirect to manageItem.jsp to avoid resubmission on page refresh
        response.sendRedirect(request.getContextPath() + "/manageItem.jsp");
    }
}
