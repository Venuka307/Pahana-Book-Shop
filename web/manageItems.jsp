<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.pahanaedu.model.Item" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Manage Items - Pahana Edu</title>
<style>
    body { font-family: Arial, sans-serif; background:#f5f7fa; color:#333; margin:20px; }
    .container { max-width:1100px; margin:0 auto; }
    h1 { margin-bottom: 20px; }
    .toprow { display:flex; justify-content:space-between; align-items:center; gap:10px; margin-bottom:10px; }
    .btn { background:#2980b9; color:#fff; border:none; padding:8px 12px; border-radius:6px; cursor:pointer; }
    .btn:hover { opacity:0.9; }
    .btn.ghost { background:transparent; color:#2980b9; border:1px solid #2980b9; }
    .btn.delete { background:#c0392b; }
    .btn.delete:hover { opacity:0.9; }
    .search { display:flex; gap:8px; align-items:center; }
    input[type=text], input[type=number] { padding:8px; border-radius:6px; border:1px solid #ccc; }
    table { width: 100%; border-collapse: collapse; margin-top: 12px; background: white; box-shadow: 0 2px 8px rgba(0,0,0,0.05); border-radius: 6px; overflow: hidden; }
    th, td { padding: 12px 15px; text-align: left; border-bottom: 1px solid #eee; }
    th { background-color: #2980b9; color: white; }
    .actions form { display:inline-block; margin:0 4px; }
    .form-container { background:white; padding:15px; border-radius:6px; box-shadow:0 2px 8px rgba(0,0,0,0.05); margin-bottom:12px; display:none; }
    .form-row { display:flex; flex-wrap:wrap; gap:10px; margin-bottom:10px; }
    .form-row label { width:120px; line-height:32px; }
    .form-row input { flex:1; padding:6px; }
</style>
<script>
    function showForm(edit=false, id='', name='', price='', quantity='') {
        document.getElementById('itemForm').style.display = 'block';
        document.getElementById('itemsTable').style.display = 'table';
        document.getElementById('formTitle').innerText = edit ? '✏️ Edit Item' : '➕ Add Item';
        document.getElementById('itemId').value = id;
        document.getElementById('itemName').value = name;
        document.getElementById('itemPrice').value = price;
        document.getElementById('itemQuantity').value = quantity;
        document.getElementById('actionType').value = edit ? 'edit' : 'add';
    }
    function hideForm() {
        document.getElementById('itemForm').style.display = 'none';
        document.getElementById('itemsTable').style.display = 'table';
    }
</script>
</head>
<body>
<div class="container">

<h1>📚 Manage Items</h1>

<%
    String msg = (String) session.getAttribute("message");
    if (msg != null) {
%>
<script>alert("<%= msg %>");</script>
<%
        session.removeAttribute("message");
    }
%>

<div class="toprow">
    <div class="search">
        <form method="get" action="ManageItems" style="display:flex; gap:8px; align-items:center;">
            <input type="text" name="searchKeyword" placeholder="Search by Name" />
            <button type="submit" class="btn">🔍 Search</button>
            <button type="button" class="btn ghost" onclick="window.location='ManageItems'">Clear</button>
        </form>
    </div>
    <div>
        <button class="btn" onclick="showForm()">➕ Add Item</button>
    </div>
</div>

<!-- Add/Edit Form -->
<div id="itemForm" class="form-container">
    <h3 id="formTitle">➕ Add Item</h3>
    <form action="ManageItems" method="post">
        <input type="hidden" name="action" id="actionType" value="add">
        <input type="hidden" name="id" id="itemId">

        <div class="form-row">
            <label>Name:</label>
            <input type="text" name="name" id="itemName" required>
        </div>
        <div class="form-row">
            <label>Price:</label>
            <input type="number" name="price" id="itemPrice" required step="0.01">
        </div>
        <div class="form-row">
            <label>Quantity:</label>
            <input type="number" name="quantity" id="itemQuantity" required>
        </div>

        <div class="toprow">
            <button type="submit" class="btn">💾 Submit</button>
            <button type="button" class="btn ghost" onclick="hideForm()">↩️ Back to List</button>
        </div>
    </form>
</div>

<!-- Items Table -->
<table id="itemsTable">
    <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Price (Rs.)</th>
            <th>Quantity</th>
            <th style="width:180px">Actions</th>
        </tr>
    </thead>
    <tbody>
<%
    List<Item> itemsList = (List<Item>) session.getAttribute("items");
    if (itemsList != null && !itemsList.isEmpty()) {
        for (Item item : itemsList) {
%>
        <tr>
            <td><%= item.getId() %></td>
            <td><%= item.getName() %></td>
            <td><%= item.getPrice() %></td>
            <td><%= item.getQuantity() %></td>
            <td class="actions">
                <button class="btn" onclick="showForm(true, '<%= item.getId() %>', '<%= item.getName() %>', '<%= item.getPrice() %>', '<%= item.getQuantity() %>')">✏️ Edit</button>
                <form action="ManageItems" method="post" style="display:inline;">
                    <input type="hidden" name="id" value="<%= item.getId() %>">
                    <input type="hidden" name="action" value="delete">
                    <button type="submit" class="btn delete">🗑️ Delete</button>
                </form>
            </td>
        </tr>
<%
        }
    } else {
%>
        <tr>
            <td colspan="5" style="text-align:center;">No items available.</td>
        </tr>
<%
    }
%>
    </tbody>
</table>

</div>
</body>
</html>
