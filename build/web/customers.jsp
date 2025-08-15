<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, java.util.ArrayList" %>
<%@ page import="com.pahanaedu.model.Customer" %>

<%
    // ===== DUMMY DATA =====
    List<Customer> customers = new ArrayList<>();
    customers.add(new Customer("ACC1001", "John Doe", "12 Main St, Colombo", "0712345678", "john.doe@example.com"));
    customers.add(new Customer("ACC1002", "Jane Smith", "34 Park Ave, Kandy", "0779876543", "jane.smith@example.com"));
    customers.add(new Customer("ACC1003", "Michael Brown", "56 Lake Rd, Galle", "0723456789", "michael.brown@example.com"));
    customers.add(new Customer("ACC1004", "Emily Davis", "78 River St, Negombo", "0761234567", "emily.davis@example.com"));
    customers.add(new Customer("ACC1005", "Daniel Wilson", "90 Hill St, Matara", "0718765432", "daniel.wilson@example.com"));
    customers.add(new Customer("ACC1006", "Sophia Taylor", "56 Ocean Ave, Colombo", "0713456789", "sophia.taylor@example.com"));
    customers.add(new Customer("ACC1007", "Liam Johnson", "78 Hill Rd, Kandy", "0772345678", "liam.johnson@example.com"));
    customers.add(new Customer("ACC1008", "Olivia Martin", "90 Garden St, Galle", "0769876543", "olivia.martin@example.com"));
    customers.add(new Customer("ACC1009", "Noah Lee", "23 Lake St, Negombo", "0723456789", "noah.lee@example.com"));
    customers.add(new Customer("ACC1010", "Ava Walker", "45 River Rd, Matara", "0718765432", "ava.walker@example.com"));
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
    .btn { background:#2980b9; color:#fff; border:none; padding:8px 12px; border-radius:6px; cursor:pointer; }
    .btn.ghost { background:transparent; color:#2980b9; border:1px solid #2980b9; }
    .search { display:flex; gap:8px; align-items:center; }
    input[type=text] { padding:8px; border-radius:6px; border:1px solid #ccc; }
    table { width:100%; border-collapse: collapse; margin-top:12px; background:white; box-shadow:0 2px 8px rgba(0,0,0,0.05); border-radius:6px; overflow:hidden; }
    th, td { padding:12px 15px; text-align:left; border-bottom:1px solid #eee; }
    th { background-color:#2980b9; color:white; }
    .actions form { display:inline-block; margin:0 4px; }
</style>
</head>
<body>
<div class="container">

    <h1>👥 Customers</h1>

    <div class="toprow">
        <div class="search">
            <form method="get" action="customers.jsp" style="display:flex; gap:8px; align-items:center;">
                <input type="text" name="searchKeyword" placeholder="Search by account, name or email" />
                <button type="submit" class="btn">🔍 Search</button>
                <button type="button" class="btn ghost" onclick="window.location='customers.jsp'">Clear</button>
            </form>
        </div>
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
            <% for (Customer c : customers) { %>
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
            <% } %>
        </tbody>
    </table>

</div>
</body>
</html>
