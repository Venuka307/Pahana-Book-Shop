<%@ page contentType="text/html;charset=UTF-8" language="java" session="true" %>
<%@ page import="com.pahanaedu.model.Customer" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><%= (request.getAttribute("editCustomer") != null) ? "Edit" : "Add" %> Customer - Pahana Edu</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0; 
            font-family: 'Poppins', sans-serif;
            background: #f5f7fa;
            color: #333;
        }
        .container {
            max-width: 900px;
            margin: 40px auto;
            background: white;
            padding: 30px 40px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        h1 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
            font-weight: 600;
        }
        form {
            display: flex;
            flex-direction: column;
            gap: 18px;
        }
        label {
            font-weight: 600;
            margin-bottom: 6px;
            color: #34495e;
        }
        input[type=text], input[type=tel], input[type=email] {
            padding: 10px 12px;
            border: 1.8px solid #bdc3c7;
            border-radius: 6px;
            font-size: 16px;
            transition: border-color 0.3s ease;
        }
        input[type=text]:focus, input[type=tel]:focus, input[type=email]:focus {
            border-color: #2980b9;
            outline: none;
        }
        button {
            background-color: #2980b9;
            color: white;
            font-weight: 700;
            border: none;
            padding: 14px 0;
            border-radius: 6px;
            cursor: pointer;
            font-size: 18px;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #1c5980;
        }
        .back-button {
            background-color: #95a5a6;
            margin-top: 10px;
            border: none;
            cursor: pointer;
            font-weight: 600;
            font-size: 16px;
            border-radius: 6px;
            padding: 12px 0;
            color: white;
        }
        .back-button:hover {
            background-color: #7f8c8d;
        }
        .message {
            text-align: center;
            padding: 12px;
            border-radius: 6px;
            margin-top: 20px;
        }
        .success {
            background-color: #dff0d8;
            color: #3c763d;
        }
        .error {
            background-color: #f2dede;
            color: #a94442;
        }
    </style>
    <script>
        // This calls the showCustomerTable function in the outer page (customer.jsp)
        function showCustomerTable() {
            if (window.parent && typeof window.parent.showCustomerTable === 'function') {
                window.parent.showCustomerTable();
            }
        }
    </script>
</head>
<body>

<%
    Customer editCustomer = (Customer) request.getAttribute("editCustomer");
    boolean isEditing = (editCustomer != null);
%>

<div class="container">
    <h1><%= isEditing ? "✏️ Edit Customer" : "➕ Add New Customer" %></h1>

    <form action="<%= isEditing ? "UpdateCustomer" : "AddCustomer" %>" method="post">
        <label for="accountNumber">Account Number</label>
        <input type="text" id="accountNumber" name="accountNumber" 
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

        <button type="submit"><%= isEditing ? "Update Customer" : "Add Customer" %></button>
        <button type="button" class="back-button" onclick="showCustomerTable()">⬅ Back to List</button>
    </form>

    <%
        String message = (String) request.getAttribute("message");
        String msgType = (String) request.getAttribute("msgType"); 
        if (message != null && !message.trim().isEmpty()) {
    %>
        <div class="message <%= msgType != null ? msgType : "" %>">
            <%= message %>
        </div>
    <%
        }
    %>
</div>

</body>
</html>
