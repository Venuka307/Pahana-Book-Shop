<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.pahanaedu.model.Sale" %>

<%
    List<Sale> reportList = (List<Sale>) request.getAttribute("reportList");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sales Report - Pahana Edu</title>
    <style>
        table { border-collapse: collapse; width: 100%; }
        th, td { border: 1px solid #ccc; padding: 8px; text-align: left; }
        th { background: #f4f4f4; }
    </style>
</head>
<body>

<h2>Sales Report</h2>

<table>
    <thead>
        <tr>
            <th>Sale ID</th>
            <th>Customer</th>
            <th>Book</th>
            <th>Quantity</th>
            <th>Total</th>
            <th>Date</th>
        </tr>
    </thead>
    <tbody>
    <%
        if (reportList != null && !reportList.isEmpty()) {
            for (Sale sale : reportList) {
    %>
        <tr>
            <td><%= sale.getId() %></td>
            <td><%= sale.getCustomerName() %></td>
            <td><%= sale.getBookTitle() %></td>
            <td><%= sale.getQuantity() %></td>
            <td><%= sale.getTotal() %></td>
            <td><%= sale.getDate() %></td>
        </tr>
    <%
            }
        } else {
    %>
        <tr>
            <td colspan="6">No data found.</td>
        </tr>
    <%
        }
    %>
    </tbody>
</table>

</body>
</html>
