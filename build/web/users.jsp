<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<%@ page import="java.util.List" %>
<%@ page import="com.pahanaedu.dao.DAOFactory" %>
<%@ page import="com.pahanaedu.dao.UserDAO" %>
<%@ page import="com.pahanaedu.model.User" %>

<%
    UserDAO dao = DAOFactory.getUserDAO();  // Changed here to use DAOFactory
    String keyword = request.getParameter("searchKeyword");
    List<User> users;

    if (keyword != null && !keyword.trim().isEmpty()) {
        users = dao.searchUsers(keyword.trim()); // search with keyword
    } else {
        users = dao.getAllUsers();
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
<title>Users - Pahana Edu</title>
<style>
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
    .message {
        padding: 10px;
        margin-bottom: 15px;
        border-radius: 4px;
    }
    .success {
        background-color: #d4edda;
        color: #155724;
    }
    .error {
        background-color: #f8d7da;
        color: #721c24;
    }
    button {
        background-color: #2980b9;
        color: white;
        border: none;
        border-radius: 5px;
        padding: 8px 15px;
        cursor: pointer;
        font-weight: 600;
        margin-right: 5px;
    }
    button:hover {
        background-color: #1c5980;
    }
    form {
        display: inline;
    }
</style>
</head>
<body>
<div class="main-content">

    <% if (message != null) { %>
        <div class="message <%= msgType != null ? msgType : "" %>"><%= message %></div>
    <% } %>

    <h1>👤 Users</h1>

    <!-- Search Form -->
    <form method="get" action="users.jsp">
        <input type="text" name="searchKeyword" placeholder="Search by username or role" 
               value="<%= (keyword != null) ? keyword : "" %>" />
        <button type="submit">🔍 Search</button>
        <button type="button" onclick="window.location='users.jsp'">Clear</button>
    </form>

    <!-- Add User button -->
    <button onclick="window.location='addUser.jsp'">+ Add User</button>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Username</th>
                <th>Role</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <% if (users != null && !users.isEmpty()) {
                for (User u : users) { %>
                <tr>
                    <td><%= u.getId() %></td>
                    <td><%= u.getUsername() %></td>
                    <td><%= u.getRole() %></td>
                    <td>
                        <form action="EditUser" method="get">
                            <input type="hidden" name="id" value="<%= u.getId() %>" />
                            <button type="submit">✏️ Edit</button>
                        </form>
                        <form action="DeleteUser" method="post" 
                              onsubmit="return confirm('Are you sure you want to delete this user?');">
                            <input type="hidden" name="id" value="<%= u.getId() %>" />
                            <button type="submit">🗑️ Delete</button>
                        </form>
                    </td>
                </tr>
            <%  } 
               } else { %>
                <tr><td colspan="4" style="text-align:center;">No users found.</td></tr>
            <% } %>
        </tbody>
    </table>
</div>
</body>
</html>
