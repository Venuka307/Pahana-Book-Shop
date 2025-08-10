<%@ page contentType="text/html;charset=UTF-8" language="java" session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Add User - Pahana Edu</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet" />
    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: #f5f7fa;
            color: #333;
        }
        .container {
            max-width: 700px;
            margin: 50px auto;
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
            color: #34495e;
        }
        input[type=text], input[type=password], select {
            padding: 10px 12px;
            border: 1.8px solid #bdc3c7;
            border-radius: 6px;
            font-size: 16px;
            transition: border-color 0.3s ease;
        }
        input[type=text]:focus, input[type=password]:focus, select:focus {
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
</head>
<body>

<div class="container">
    <h1>👤 Add New User</h1>
    <form action="${pageContext.request.contextPath}/AddUser" method="post">

        <label for="username">Username</label>
        <input type="text" id="username" name="username" placeholder="Enter username" required pattern="[A-Za-z0-9_]{4,20}" title="4 to 20 characters, letters, numbers or underscore">

        <label for="password">Password</label>
        <input type="password" id="password" name="password" placeholder="Enter password" required minlength="4" />

        <label for="role">Role</label>
        <select id="role" name="role" required>
            <option value="" disabled selected>Select user role</option>
            <option value="admin">Admin</option>
            <option value="staff">Staff</option>
        </select>

        <button type="submit">Add User</button>
    </form>

    <% 
    String message = (String) request.getAttribute("message");
    String msgType = (String) request.getAttribute("msgType");
    if(message != null) {
    %>
        <div class="message <%= msgType %>"><%= message %></div>
    <% } %>
</div>

</body>
</html>
