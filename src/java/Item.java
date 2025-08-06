package com.pahanaedu.servlet;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;

@WebServlet("/Item")
public class Item extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        System.out.println("✔️ Item servlet doPost called"); // For debugging in console

        String itemId = request.getParameter("itemId");
        String itemName = request.getParameter("itemName");
        String price = request.getParameter("price");

        String filePath = getServletContext().getRealPath("/WEB-INF/items.txt");

        try {
            File file = new File(filePath);
            if (!file.exists()) {
                file.getParentFile().mkdirs();
                file.createNewFile();
            }

            try (BufferedWriter writer = new BufferedWriter(new FileWriter(file, true))) {
                writer.write(itemId + "," + itemName + "," + price);
                writer.newLine();
            }

            request.setAttribute("message", "✅ Item saved successfully!");
            request.setAttribute("msgType", "success");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "❌ Error saving item: " + e.getMessage());
            request.setAttribute("msgType", "error");
        }

        RequestDispatcher rd = request.getRequestDispatcher("manageItem.jsp");
        rd.forward(request, response);
    }
}
