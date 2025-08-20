<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.pahanaedu.model.User" %>
<%
    User loggedUser = (User) session.getAttribute("loggedUser");
    if (loggedUser == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    String role = loggedUser.getRole();
%>
<!DOCTYPE html>
<html>
<head>
    <title>📚 PahanaEdu Dashboard</title>
    <style>
        body {
            margin: 0;
            font-family: "Segoe UI", sans-serif;
            background-color: #f5f6fa;
        }
        .container {
            display: flex;
            height: 100vh;
        }
        .sidebar {
            width: 220px;
            background-color: #1a237e;
            color: white;
            display: flex;
            flex-direction: column;
            padding-top: 20px;
        }
        .sidebar h2 {
            text-align: center;
            font-size: 20px;
            margin-bottom: 30px;
        }
        .sidebar a {
            padding: 15px 20px;
            text-decoration: none;
            color: white;
            font-weight: bold;
            transition: background 0.2s;
        }
        .sidebar a:hover {
            background-color: #3949ab;
        }
        .main-content {
            flex-grow: 1;
        }
        iframe {
            width: 100%;
            height: 100%;
            border: none;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="sidebar">
        <h2>📖 Pahana Edu 📖</h2>
        <a href="dashboard.jsp" target="mainFrame">🏠 Dashboard</a>
        <a href="customers.jsp" target="mainFrame">👥 Customers</a>

        <% if ("admin".equals(role)) { %>
            <a href="users.jsp" target="mainFrame">🧑‍💼 Users</a>
            <a href="salesReport.jsp" target="mainFrame">📊 Sales Report</a>
        <% } %>

        <a href="manageItems.jsp" target="mainFrame">📚 Books</a>
        <a href="sales.jsp" target="mainFrame">💰 Sales</a>
        <a href="help.jsp" target="mainFrame">❓ Help</a>
        <a href="Logout" target="_top">🚪 Logout</a>
    </div>

    <div class="main-content">
        <iframe name="mainFrame" src="dashboard.jsp"></iframe>
    </div>
</div>

</body>
</html>
