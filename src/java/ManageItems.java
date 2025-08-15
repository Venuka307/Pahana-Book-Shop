package com.pahanaedu.servlet;

import com.pahanaedu.model.Item;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/ManageItems")
public class ManageItems extends HttpServlet {

    @SuppressWarnings("unchecked")
    private List<Item> getItemsFromSession(HttpSession session) {
        Object obj = session.getAttribute("items");
        if (obj instanceof List<?>) {
            return (List<Item>) obj;
        }
        return new ArrayList<>();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        List<Item> items = getItemsFromSession(session);

        if (items.isEmpty()) {
            items.add(new Item(1, "Book A", 250.0, 10));
            items.add(new Item(2, "Book B", 320.0, 5));
            items.add(new Item(3, "Book C", 180.0, 7));
            session.setAttribute("items", items);
        }

        request.setAttribute("items", items);
        request.getRequestDispatcher("manageItems.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        List<Item> items = getItemsFromSession(session);

        String action = request.getParameter("action");

        switch (action) {
            case "add" -> {
                int id = items.size() > 0 ? items.get(items.size() - 1).getId() + 1 : 1;
                String name = request.getParameter("name");
                double price = Double.parseDouble(request.getParameter("price"));
                int qty = Integer.parseInt(request.getParameter("quantity"));
                items.add(new Item(id, name, price, qty));
                session.setAttribute("message", "✅ Item added successfully!");
            }
            case "edit" -> {
                int editId = Integer.parseInt(request.getParameter("id"));
                for (Item i : items) {
                    if (i.getId() == editId) {
                        i.setName(request.getParameter("name"));
                        i.setPrice(Double.parseDouble(request.getParameter("price")));
                        i.setQuantity(Integer.parseInt(request.getParameter("quantity")));
                        break;
                    }
                }
                session.setAttribute("message", "✏️ Item updated successfully!");
            }
            case "delete" -> {
                int deleteId = Integer.parseInt(request.getParameter("id"));
                items.removeIf(item -> item.getId() == deleteId);
                session.setAttribute("message", "🗑️ Item deleted successfully!");
            }
        }

        session.setAttribute("items", items);
        response.sendRedirect("ManageItems");
    }
}
