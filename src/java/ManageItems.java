package com.pahanaedu.servlet;

import com.pahanaedu.dao.ItemDAO;
import com.pahanaedu.model.Item;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/ManageItems")
public class ManageItems extends HttpServlet {

    private ItemDAO itemDAO;

    @Override
    public void init() {
        itemDAO = new ItemDAO(); 
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        List<Item> items = itemDAO.getAllItems();
        request.setAttribute("items", items);
        request.getRequestDispatcher("/manageItems.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("actionType"); // add, edit, delete
        String name = request.getParameter("itemName");
        String priceStr = request.getParameter("itemPrice");
        String qtyStr = request.getParameter("itemQuantity");

        double price = priceStr != null && !priceStr.isEmpty() ? Double.parseDouble(priceStr) : 0;
        int quantity = qtyStr != null && !qtyStr.isEmpty() ? Integer.parseInt(qtyStr) : 0;

        if ("add".equals(action)) {
            Item item = new Item(0, name, price, quantity);
            itemDAO.addItem(item);
        } else if ("edit".equals(action)) {
            int id = Integer.parseInt(request.getParameter("itemId"));
            Item item = new Item(id, name, price, quantity);
            itemDAO.updateItem(item);
        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("itemId"));
            itemDAO.deleteItem(id);
        }

        
        response.sendRedirect("ManageItems");
    }
}
