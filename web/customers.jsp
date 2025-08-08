<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<%@ page import="java.util.List" %>
<%@ page import="com.pahanaedu.dao.CustomerDAO" %>
<%@ page import="com.pahanaedu.model.Customer" %>

<%
    CustomerDAO dao = new CustomerDAO();
    String keyword = request.getParameter("searchKeyword");
    List<Customer> customers;

    if (keyword != null && !keyword.trim().isEmpty()) {
        customers = dao.searchCustomers(keyword.trim());
    } else {
        customers = dao.getAllCustomers();
    }

    String message = (String) session.getAttribute("message");
    String msgType = (String) session.getAttribute("msgType");
    if (message != null) {
        session.removeAttribute("message");
        session.removeAttribute("msgType");
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Customers - Pahana Edu</title>
<style>
    /* your existing CSS here, make sure table styles are intact */
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
        background: white;
        box-shadow: 0 2px 8px rgba(0,0,0,0.05);
        border-radius: 6px;
        overflow: hidden;
    }
    th, td {
        padding: 12px 15px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }
    th {
        background-color: #2980b9;
        color: white;
    }
    /* other styles ... */
</style>
</head>
<body>
<div class="main-content">

    <% if (message != null) { %>
        <div class="message <%= msgType != null ? msgType : "" %>"><%= message %></div>
    <% } %>

    <h1>👥 Customers</h1>

    <!-- Search Form -->
    <form method="get" action="customer.jsp">
        <input type="text" name="searchKeyword" placeholder="Search by account, name or email" 
               value="<%= (keyword != null) ? keyword : "" %>" />
        <button type="submit">🔍 Search</button>
        <button type="button" onclick="window.location='customer.jsp'">Clear</button>
    </form>

    <!-- Add customer button and other UI -->

    <table>
        <thead>
            <tr>
                <th>Account Number</th>
                <th>Name</th>
                <th>Address</th>
                <th>Telephone</th>
                <th>Email</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <% if (customers != null && !customers.isEmpty()) {
                for (Customer c : customers) { %>
                <tr>
                    <td><%= c.getAccountNumber() %></td>
                    <td><%= c.getName() %></td>
                    <td><%= c.getAddress() %></td>
                    <td><%= c.getTelephone() %></td>
                    <td><%= c.getEmail() %></td>
                    <td>
                        <form action="EditCustomer" method="get" style="display:inline;">
                            <input type="hidden" name="accountNumber" value="<%= c.getAccountNumber() %>" />
                            <button type="submit">✏️ Edit</button>
                        </form>
                        <form action="DeleteCustomer" method="post" style="display:inline;"
                              onsubmit="return confirm('Are you sure you want to delete this customer?');">
                            <input type="hidden" name="accountNumber" value="<%= c.getAccountNumber() %>" />
                            <button type="submit">🗑️ Delete</button>
                        </form>
                    </td>
                </tr>
            <%  } 
               } else { %>
                <tr><td colspan="6" style="text-align:center;">No customers found.</td></tr>
            <% } %>
        </tbody>
    </table>
</div>
</body>
</html>
