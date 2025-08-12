<%@ page contentType="text/html;charset=UTF-8" language="java" session="true" %> 
<%@ page import="com.pahanaedu.model.Customer" %>

<%
    Customer editCustomer = (Customer) request.getAttribute("editCustomer");
    boolean isEditing = (editCustomer != null);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title><%= isEditing ? "Edit" : "Add" %> Customer - Pahana Edu</title>
    <style>
        body { font-family: Arial, sans-serif; background:#f5f7fa; margin:20px; }
        .container { max-width:700px; margin:0 auto; background:#fff; padding:22px; border-radius:8px; box-shadow:0 2px 8px rgba(0,0,0,0.06); }
        h1 { margin-top:0; }
        label { display:block; margin-top:10px; font-weight:600; }
        input[type=text], input[type=tel], input[type=email] { width:100%; padding:10px; border:1px solid #ccc; border-radius:6px; box-sizing:border-box; }
        .btn { background:#2980b9; color:#fff; border:none; padding:10px 14px; border-radius:6px; cursor:pointer; margin-top:14px; }
        .back { background:#95a5a6; color:#fff; border:none; padding:10px 12px; border-radius:6px; margin-left:8px; cursor:pointer; }
        .message { margin-top:12px; padding:10px; border-radius:6px; }
        .message.error { background:#f2dede; color:#8a1f1f; }
    </style>
</head>
<body>
<div class="container">
    <h1><%= isEditing ? "✏️ Edit Customer" : "➕ Add New Customer" %></h1>

    <form action="${pageContext.request.contextPath}/AddCustomer" method="post">
        <label for="accountNumber">Account Number</label>
        <input type="text" id="accountNumber" name="account_number"
               value="<%= isEditing ? editCustomer.getAccountNumber() : "" %>"
               placeholder="e.g. ACC123"
               <%= isEditing ? "readonly" : "required" %> />

        <label for="name">Customer Name</label>
        <input type="text" id="name" name="name"
               value="<%= isEditing ? editCustomer.getName() : "" %>"
               placeholder="Full Name" required />

        <label for="address">Address</label>
        <input type="text" id="address" name="address"
               value="<%= isEditing ? editCustomer.getAddress() : "" %>"
               placeholder="Address" required />

        <label for="telephone">Telephone Number</label>
        <input type="tel" id="telephone" name="telephone"
               value="<%= isEditing ? editCustomer.getTelephone() : "" %>"
               placeholder="+94XXXXXXXXX" required />

        <label for="email">Email Address</label>
        <input type="email" id="email" name="email"
               value="<%= isEditing ? editCustomer.getEmail() : "" %>"
               placeholder="email@example.com" required />

        <div>
            <button type="submit" class="btn"><%= isEditing ? "Update Customer" : "Add Customer" %></button>
            <button type="button" class="back" onclick="window.location='customers.jsp'">⬅ Back to List</button>
        </div>
    </form>

    <%
        String message = (String) request.getAttribute("message");
        String msgType = (String) request.getAttribute("msgType");
        if (message != null && !message.trim().isEmpty()) {
    %>
        <div class="message <%= ("error".equals(msgType) ? "error" : "") %>">
            <%= message %>
        </div>
    <%
        }
    %>
</div>
</body>
</html>
