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

    // Read messages from session (set by servlets), then clear them
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
    body { font-family: Arial, sans-serif; background:#f5f7fa; color:#333; margin:20px; }
    .container { max-width:1100px; margin:0 auto; }
    .toprow { display:flex; justify-content:space-between; align-items:center; gap:10px; }
    .message { padding:10px 14px; border-radius:6px; margin:12px 0; }
    .message.success { background:#dff0d8; color:#27632a; }
    .message.error { background:#f2dede; color:#8a1f1f; }
    .btn { background:#2980b9; color:#fff; border:none; padding:8px 12px; border-radius:6px; cursor:pointer; }
    .btn.ghost { background:transparent; color:#2980b9; border:1px solid #2980b9; }
    .search { display:flex; gap:8px; align-items:center; }
    input[type=text] { padding:8px; border-radius:6px; border:1px solid #ccc; }
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 12px;
        background: white;
        box-shadow: 0 2px 8px rgba(0,0,0,0.05);
        border-radius: 6px;
        overflow: hidden;
    }
    th, td {
        padding: 12px 15px;
        text-align: left;
        border-bottom: 1px solid #eee;
    }
    th { background-color: #2980b9; color: white; }
    .actions form { display:inline-block; margin:0 4px; }
</style>
</head>
<body>
<div class="container">

    <h1>👥 Customers</h1>

    <% if (message != null) { %>
        <div class="message <%= ("success".equals(msgType) ? "success" : "error") %>">
            <%= message %>
        </div>
    <% } %>

    <div class="toprow">
        <div class="search">
            <form method="get" action="customers.jsp" style="display:flex; gap:8px; align-items:center;">
                <input type="text" name="searchKeyword" placeholder="Search by account, name or email"
                       value="<%= (keyword != null) ? keyword : "" %>" />
                <button type="submit" class="btn">🔍 Search</button>
                <button type="button" class="btn ghost" onclick="window.location='customers.jsp'">Clear</button>
            </form>
        </div>

        <!-- Add Customer Button -->
        <div>
            <a href="addCustomer.jsp"><button class="btn">➕ Add Customer</button></a>
        </div>
    </div>

    <table>
        <thead>
            <tr>
                <th>Account Number</th>
                <th>Name</th>
                <th>Address</th>
                <th>Telephone</th>
                <th>Email</th>
                <th style="width:180px">Actions</th>
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
                    <td class="actions">
                        <form action="EditCustomer" method="get" style="display:inline;">
                            <input type="hidden" name="accountNumber" value="<%= c.getAccountNumber() %>" />
                            <button type="submit" class="btn">✏️ Edit</button>
                        </form>
                        <form action="DeleteCustomer" method="post" style="display:inline;"
                              onsubmit="return confirm('Are you sure you want to delete this customer?');">
                            <input type="hidden" name="accountNumber" value="<%= c.getAccountNumber() %>" />
                            <button type="submit" class="btn" style="background:#c0392b">🗑️ Delete</button>
                        </form>
                    </td>
                </tr>
            <%  } 
               } else { %>
                <tr><td colspan="6" style="text-align:center; padding:20px;">No customers found.</td></tr>
            <% } %>
        </tbody>
    </table>

</div>
</body>
</html>
