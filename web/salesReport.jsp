<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.pahanaedu.model.Sales" %>

<%
    List<Sales> reportList = (List<Sales>) request.getAttribute("reportList");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sales Report - Pahana Edu</title>
<style>
    body { font-family: Arial, sans-serif; background:#f5f7fa; padding:20px; }
    table { border-collapse: collapse; width: 100%; background:#fff; border-radius:6px; box-shadow:0 2px 6px rgba(0,0,0,0.05); }
    th, td { padding:12px; border-bottom:1px solid #ddd; text-align:left; }
    th { background:#2980b9; color:#fff; }
    tr:hover { background:#f1f1f1; }
</style>
</head>
<body>

<h2>📊 Sales Report</h2>

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
        for (Sales sale : reportList) {
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
<tr><td colspan="6">No sales found.</td></tr>
<%
    }
%>
</tbody>
</table>

</body>
</html>
