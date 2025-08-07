<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.pahanaedu.dao.CustomerDAO" %>
<%@ page import="com.pahanaedu.model.Customer" %>

<%
    Customer editCustomer = (Customer) request.getAttribute("editCustomer");
    boolean isEditing = (editCustomer != null);

    CustomerDAO dao = new CustomerDAO();
    List<Customer> customers = dao.getAllCustomers();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Customers - Pahana Edu</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            background: #f5f7fa;
        }
        .main-content {
            padding: 20px 30px;
        }
        h1 {
            color: #2c3e50;
            margin-top: 0;
        }
        button {
            background-color: #2980b9;
            color: white;
            border: none;
            padding: 12px 20px;
            border-radius: 6px;
            cursor: pointer;
            font-weight: 600;
            margin-right: 10px;
        }
        button:hover {
            background-color: #1c5980;
        }
        #addCustomerForm {
            margin-top: 20px;
            padding: 20px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            display: none;
        }
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
        #btnBackToList {
            background-color: #95a5a6;
            display: none;
        }
        #btnBackToList:hover {
            background-color: #7f8c8d;
        }
    </style>
    <script>
        // Make this global so addCustomer.jsp can call it
        function showAddCustomerForm() {
            document.getElementById('addCustomerForm').style.display = 'block';
            document.getElementById('customerTable').style.display = 'none';
            document.getElementById('btnToggleAddCustomer').style.display = 'none';
            document.getElementById('btnBackToList').style.display = 'inline-block';
        }

        function showCustomerTable() {
            document.getElementById('addCustomerForm').style.display = 'none';
            document.getElementById('customerTable').style.display = 'block';
            document.getElementById('btnToggleAddCustomer').style.display = 'inline-block';
            document.getElementById('btnBackToList').style.display = 'none';
        }

        window.onload = function () {
            <% if (isEditing) { %>
                showAddCustomerForm();
            <% } else { %>
                showCustomerTable();
            <% } %>
        };
    </script>
</head>
<body>

<div class="main-content">
    <h1>👥 Customers</h1>

    <button id="btnToggleAddCustomer" onclick="showAddCustomerForm()">➕ Add Customer</button>
    <button id="btnBackToList" onclick="showCustomerTable()">🔙 Back to List</button>

    <div id="addCustomerForm">
        <jsp:include page="addCustomer.jsp" />
    </div>

    <div id="customerTable">
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
                <% for (Customer c : customers) { %>
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
                        </td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
