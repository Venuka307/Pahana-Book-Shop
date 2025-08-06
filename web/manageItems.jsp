<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.io.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>📦 Manage Items - Pahana Edu</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet" />
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: #f5f7fa;
            margin: 0;
            padding: 30px;
        }
        .container {
            max-width: 900px;
            margin: 0 auto;
            background: white;
            padding: 30px 40px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        h1 {
            text-align: center;
            color: #2c3e50;
            font-weight: 600;
            margin-bottom: 30px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            text-align: left;
            padding: 14px;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #2980b9;
            color: white;
        }
        tr:hover {
            background-color: #f0f8ff;
        }
        .button {
            padding: 6px 12px;
            margin-right: 6px;
            background-color: #2980b9;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            font-weight: bold;
            font-size: 14px;
            display: inline-block;
            border: none;
            cursor: pointer;
        }
        .button:hover {
            background-color: #1c5980;
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
        .add-section {
            margin-top: 40px;
        }
        .add-section h2 {
            color: #2c3e50;
            font-size: 20px;
            margin-bottom: 15px;
        }
        .add-section form {
            display: grid;
            grid-template-columns: 1fr 1fr 1fr auto;
            gap: 12px;
            align-items: center;
        }
        .add-section input {
            padding: 8px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .no-data {
            text-align: center;
            color: #999;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>📦 Manage Items</h1>

    <%
        String message = (String) request.getAttribute("message");
        String msgType = (String) request.getAttribute("msgType");
        if (message != null) {
    %>
    <div class="message <%= msgType %>"><%= message %></div>
    <% } %>

    <table>
        <thead>
        <tr>
            <th>Item ID</th>
            <th>Item Name</th>
            <th>Price (LKR)</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            String filePath = application.getRealPath("/WEB-INF/items.txt");
            File file = new File(filePath);
            if (!file.exists()) {
        %>
        <tr><td colspan="4" class="no-data">No items found.</td></tr>
        <%
            } else {
                try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
                    String line;
                    boolean hasData = false;
                    while ((line = reader.readLine()) != null) {
                        String[] parts = line.split(",", 3);
                        if (parts.length < 3) continue;
                        hasData = true;
        %>
        <tr>
            <td><%= parts[0] %></td>
            <td><%= parts[1] %></td>
            <td><%= parts[2] %></td>
            <td>
                <a class="button" href="EditItem?itemId=<%= parts[0] %>">Edit</a>
                <a class="button" href="DeleteItem?itemId=<%= parts[0] %>" onclick="return confirm('Delete this item?');">Delete</a>
            </td>
        </tr>
        <%
                    }
                    if (!hasData) {
        %>
        <tr><td colspan="4" class="no-data">No items available.</td></tr>
        <%
                    }
                } catch (Exception e) {
        %>
        <tr><td colspan="4" class="no-data" style="color:red;">Error reading items.</td></tr>
        <%
                }
            }
        %>
        </tbody>
    </table>

    <div class="add-section">
        <h2>➕ Add New Item</h2>
        <form method="post" action="<%= request.getContextPath() %>/Item">
            <input type="text" name="itemId" placeholder="Item ID" required />
            <input type="text" name="itemName" placeholder="Item Name" required />
            <input type="text" name="price" placeholder="Price (LKR)" required />
            <button type="submit" class="button">Save</button>
        </form>
    </div>
</div>

</body>
</html>
