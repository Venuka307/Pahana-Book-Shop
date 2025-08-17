<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.pahanaedu.model.Item" %>
<%
    List<Item> items = (List<Item>) request.getAttribute("items");
    if(items == null) {
        items = new java.util.ArrayList<>();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Items</title>
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
</head>
<body>
<div class="container">
    <h1>Manage Items</h1>
    <div class="toprow">
        <div class="search">
            <form method="get" action="ManageItems">
                <input type="hidden" name="action" value="search">
                <input type="text" name="searchKeyword" placeholder="Search by name">
                <button class="btn" type="submit">Search</button>
            </form>
        </div>
        <button class="btn" onclick="showForm()">➕ Add Item</button>
    </div>

    
    <div id="itemForm" class="form-container">
        <h3 id="formTitle">➕ Add Item</h3>
        <form method="post" action="ManageItems">
            <input type="hidden" id="itemId" name="id">
            <input type="hidden" id="actionType" name="action" value="add">
            <div class="form-row">
                <label>Name:</label>
                <input type="text" name="name" id="itemName" required>
            </div>
            <div class="form-row">
                <label>Price:</label>
                <input type="number" step="0.01" name="price" id="itemPrice" required>
            </div>
            <div class="form-row">
                <label>Quantity:</label>
                <input type="number" name="quantity" id="itemQuantity" required>
            </div>
            <button class="btn" type="submit">Save</button>
            <button class="btn delete" type="button" onclick="hideForm()">Back to List</button>
        </form>
    </div>

    <!-- Table of items -->
    <table id="itemsTable">
        <tr>
            <th>ID</th><th>Name</th><th>Price</th><th>Quantity</th><th>Actions</th>
        </tr>
        <% for(Item item : items) { %>
            <tr>
                <td><%= item.getId() %></td>
                <td><%= item.getName() %></td>
                <td><%= item.getPrice() %></td>
                <td><%= item.getQuantity() %></td>
                <td class="actions">
                    <button class="btn ghost" type="button" onclick="showForm(true, '<%=item.getId()%>', '<%=item.getName()%>', '<%=item.getPrice()%>', '<%=item.getQuantity()%>')">Edit</button>
                    <form method="post" action="ManageItems" style="display:inline;">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="id" value="<%=item.getId()%>">
                        <button class="btn delete" type="submit">Delete</button>
                    </form>
                </td>
            </tr>
        <% } %>
    </table>
</div>

<script>
function showForm(edit=false, id='', name='', price='', quantity='') {
    document.getElementById('itemForm').style.display = 'block';
    var table = document.getElementById('itemsTable');
    if(table) table.style.display = 'none';
    document.getElementById('formTitle').innerText = edit ? '✏️ Edit Item' : '➕ Add Item';
    document.getElementById('itemId').value = id;
    document.getElementById('itemName').value = name;
    document.getElementById('itemPrice').value = price;
    document.getElementById('itemQuantity').value = quantity;
    document.getElementById('actionType').value = edit ? 'edit' : 'add';
}

function hideForm() {
    document.getElementById('itemForm').style.display = 'none';
    var table = document.getElementById('itemsTable');
    if(table) table.style.display = 'table';
}
</script>
</body>
</html>
