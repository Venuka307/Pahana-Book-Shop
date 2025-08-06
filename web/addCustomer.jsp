<%@ page contentType="text/html;charset=UTF-8" language="java" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- JSTL used for safer variable access -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Customer - Pahana Edu</title>
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
        input[type=text], input[type=tel] {
            padding: 10px 12px;
            border: 1.8px solid #bdc3c7;
            border-radius: 6px;
            font-size: 16px;
            transition: border-color 0.3s ease;
        }
        input[type=text]:focus, input[type=tel]:focus {
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
    <h1>➕ Add New Customer</h1>

    <form action="${pageContext.request.contextPath}/AddCustomer" method="post">
        <label for="accountNumber">Account Number</label>
        <input type="text" id="accountNumber" name="accountNumber" placeholder="e.g. ACC123" required />

        <label for="name">Customer Name</label>
        <input type="text" id="name" name="name" placeholder="Full Name" required />

        <label for="address">Address</label>
        <input type="text" id="address" name="address" placeholder="Address" required />

        <label for="telephone">Telephone Number</label>
        <input type="tel" id="telephone" name="telephone" placeholder="+94XXXXXXXXX" required />

        <button type="submit">Add Customer</button>
    </form>

    <c:if test="${not empty message}">
        <div class="message ${msgType}">
            ${message}
        </div>
    </c:if>
</div>

</body>
</html>
