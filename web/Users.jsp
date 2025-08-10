<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.pahanaedu.dao.DAOFactory" %>
<%@ page import="com.pahanaedu.dao.UserDAO" %>
<%@ page import="com.pahanaedu.model.User" %>

<%
    UserDAO userDAO = DAOFactory.getUserDAO();
    List<User> users = userDAO.getAllUsers(); // make sure you add this method in UserDAO
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Users - Pahana Edu</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f5f7fa;
            margin: 0; padding: 20px;
            color: #333;
        }
        h2 {
            margin-bottom: 20px;
            font-weight: 600;
            color: #2c3e50;
        }
        .btn {
            background-color: #2980b9;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            margin-bottom: 15px;
        }
        .btn:hover {
            background-color: #1c5980;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            border-radius: 6px;
            overflow: hidden;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #2980b9;
            color: white;
            font-weight: 600;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        .action-btn {
            background-color: #27ae60;
            color: white;
            padding: 6px 12px;
            border-radius: 4px;
            text-decoration: none;
            font-weight: 600;
            margin-right: 8px;
        }
        .action-btn.edit {
            background-color: #2980b9;
        }
        .action-btn.delete {
            background-color: #c0392b;
        }
    </style>
</head>
<body>

<h2>Users List</h2>

<a href="#" id="btnShowAddUserForm" class="btn">+ Add User</a>

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
        <c:forEach var="user" items="${users}">
            <tr>
                <td>${user.id}</td>
                <td>${user.username}</td>
                <td>${user.role}</td>
                <td>
                    <a href="EditUser?id=${user.id}" class="action-btn edit">Edit</a>
                    <a href="DeleteUser?id=${user.id}" class="action-btn delete" onclick="return confirm('Are you sure to delete this user?');">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<script>
    // Optional: Add functionality later to show/hide add user form in the same page
    document.getElementById('btnShowAddUserForm').addEventListener('click', function(e){
        e.preventDefault();
        // code to show add user form dynamically or navigate to addUser.jsp
        window.location.href = 'addUser.jsp';
    });
</script>

</body>
</html>
