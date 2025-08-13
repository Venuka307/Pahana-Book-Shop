<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<%@ page import="java.util.*" %>

<%
    // Dummy data for Manage Items
    class Item {
        String id, name, author, category;
        double price;
        int stock;
        Item(String id, String name, String author, String category, double price, int stock) {
            this.id = id;
            this.name = name;
            this.author = author;
            this.category = category;
            this.price = price;
            this.stock = stock;
        }
    }

    List<Item> items = new ArrayList<>();
    items.add(new Item("I001", "Java Basics", "John Doe", "Programming", 1500, 25));
    items.add(new Item("I002", "Advanced Java", "Jane Smith", "Programming", 2000, 15));
    items.add(new Item("I003", "HTML & CSS Design", "Sara Khan", "Web Development", 1200, 30));
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Manage Items - Pahana Edu</title>
<style>
    body { font-family: Arial, sans-serif; background:#f5f7fa; color:#333; margin:20px; }
    .container { max-width:1100px; margin:0 auto; }
    .toprow { display:flex; justify-content:space-between; align-items:center; gap:10px; margin-bottom:10px; }
    .btn { background:#2980b9; color:#fff; border:none; padding:8px 12px; border-radius:6px; cursor:pointer; }
    .btn.ghost { background:transparent; color:#2980b9; border:1px solid #2980b9; }
    .search { display:flex; gap:8px; align-items:center; }
    input[type=text], input[type=number] { padding:8px; border-radius:6px; border:1px solid #ccc; }
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 12px;
        background: white;
        box-shadow: 0 2px 8px rgba(0,0,0,0.05);
        border-radius: 6px;
        overflow: hidden;
    }
    th, td { padding: 12px 15px; text-align: left; border-bottom: 1px solid #eee; }
    th { background-color: #2980b9; color: white; }
    .actions form { display:inline-block; margin:0 4px; }
    .form-container { background:white; padding:15px; border-radius:6px; box-shadow:0 2px 8px rgba(0,0,0,0.05); margin-bottom:12px; display:none; }
    .form-row { display:flex; flex-wrap:wrap; gap:10px; margin-bottom:10px; }
    .form-row label { width:120px; line-height:32px; }
    .form-row input { flex:1; }
</style>
<script>
    function showForm(edit=false, id='', name='', author='', category='', price='', stock='') {
        document.getElementById('itemForm').style.display = 'block';
        document.getElementById('itemsTable').style.display = 'none';
        document.getElementById('formTitle').innerText = edit ? '✏️ Edit Item' : '➕ Add Item';
        document.getElementById('itemId').value = id;
        document.getElementById('itemName').value = name;
        document.getElementById('itemAuthor').value = author;
        document.getElementById('itemCategory').value = category;
        document.getElementById('itemPrice').value = price;
        document.getElementById('itemStock').value = stock;
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

    <!-- Top row: search + Add button -->
    <div class="toprow">
        <div class="search">
            <form method="get" action="manageItems.jsp" style="display:flex; gap:8px; align-items:center;">
                <input type="text" name="searchKeyword" placeholder="Search by Name or Category" />
                <button type="submit" class="btn">🔍 Search</button>
                <button type="button" class="btn ghost" onclick="window.location='manageItems.jsp'">Clear</button>
            </form>
        </div>
        <div>
            <button class="btn" onclick="showForm()">➕ Add Item</button>
        </div>
    </div>

    <!-- Add/Edit Item Form -->
    <div id="itemForm" class="form-container">
        <h3 id="formTitle">➕ Add Item</h3>
        <div class="form-row">
            <label>Item ID:</label>
            <input type="text" id="itemId" placeholder="I004" />
        </div>
        <div class="form-row">
            <label>Name:</label>
            <input type="text" id="itemName" placeholder="Item Name" />
        </div>
        <div class="form-row">
            <label>Author:</label>
            <input type="text" id="itemAuthor" placeholder="Author" />
        </div>
        <div class="form-row">
            <label>Category:</label>
            <input type="text" id="itemCategory" placeholder="Category" />
        </div>
        <div class="form-row">
            <label>Price:</label>
            <input type="number" id="itemPrice" placeholder="1500" />
        </div>
        <div class="form-row">
            <label>Stock:</label>
            <input type="number" id="itemStock" placeholder="25" />
        </div>
        <div class="toprow">
            <button class="btn" onclick="alert('Submit functionality can be added later')">💾 Submit</button>
            <button class="btn ghost" onclick="hideForm()">↩️ Back to List</button>
        </div>
    </div>

    <!-- Items Table -->
    <table id="itemsTable">
        <thead>
            <tr>
                <th>Item ID</th>
                <th>Name</th>
                <th>Author</th>
                <th>Category</th>
                <th>Price (Rs.)</th>
                <th>Stock</th>
                <th style="width:180px">Actions</th>
            </tr>
        </thead>
        <tbody>
            <% for(Item i : items) { %>
                <tr>
                    <td><%= i.id %></td>
                    <td><%= i.name %></td>
                    <td><%= i.author %></td>
                    <td><%= i.category %></td>
                    <td><%= String.format("%.2f", i.price) %></td>
                    <td><%= i.stock %></td>
                    <td class="actions">
                        <button class="btn" onclick="showForm(true,'<%=i.id%>','<%=i.name%>','<%=i.author%>','<%=i.category%>','<%=i.price%>','<%=i.stock%>')">✏️ Edit</button>
                        <button class="btn" style="background:#c0392b" onclick="if(confirm('Delete this item?')) alert('Item deleted (dummy)')">🗑️ Delete</button>
                    </td>
                </tr>
            <% } %>
        </tbody>
    </table>

</div>
</body>
</html>
