<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.pahanaedu.model.User" %>
<%
    User loggedUser = (User) session.getAttribute("loggedUser");
    if (loggedUser == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>💰 POS - Sales</title>
    <style>
        body { font-family: "Segoe UI", sans-serif; background-color: #f5f6fa; margin:0; padding:20px;}
        h2, h3 { color:#1a237e; }
        input, select, button { padding:5px; margin:5px; }
        table { width:100%; border-collapse: collapse; margin-top:10px; }
        th, td { border:1px solid #ccc; padding:8px; text-align:center; }
        th { background-color:#1a237e; color:white; }
        button { cursor:pointer; }
    </style>
</head>
<body>
<h2>💰 POS - Sales</h2>


<h3>Select Book</h3>
<select id="bookSelect">
    <option value="">-- Select Book --</option>
    <option value="Book A|500">Book A - Rs.500</option>
    <option value="Book B|650">Book B - Rs.650</option>
    <option value="Book C|300">Book C - Rs.300</option>
</select>
<input type="number" id="qty" placeholder="Quantity" min="1" value="1">
<button onclick="addToCart()">Add to Cart</button>


<h3>Add New Book</h3>
<input type="text" id="newBookName" placeholder="Book Name">
<input type="number" id="newBookPrice" placeholder="Price" min="1">
<input type="number" id="newBookQty" placeholder="Quantity" min="1" value="1">
<button onclick="addNewBook()">Add Book</button>


<h3>Cart</h3>
<table id="cartTable">
    <thead>
        <tr>
            <th>Book Name</th>
            <th>Price (Rs.)</th>
            <th>Quantity</th>
            <th>Total (Rs.)</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody></tbody>
</table>

<!-- Pay Button -->
<button onclick="pay()">💳 Pay</button>

<script>
let cart = [];

// Add from dropdown
function addToCart() {
    let sel = document.getElementById('bookSelect');
    let value = sel.value.trim();

    if(!value) { alert('Select a book!'); return; }

    let parts = value.split('|');
    if(parts.length !== 2) { alert('Invalid book format'); return; }

    let name = parts[0].trim();
    let price = parseFloat(parts[1].trim());
    let qty = parseInt(document.getElementById('qty').value);

    if(isNaN(qty) || qty < 1) { alert('Enter valid quantity'); return; }

    let existing = cart.find(item => item.name === name);
    if(existing){ existing.qty += qty; } 
    else { cart.push({name: name, price: price, qty: qty}); }

    renderCart();
}

// Add new book manually
function addNewBook() {
    let name = document.getElementById('newBookName').value.trim();
    let price = parseFloat(document.getElementById('newBookPrice').value);
    let qty = parseInt(document.getElementById('newBookQty').value);

    if(!name || isNaN(price) || price <= 0 || isNaN(qty) || qty < 1){
        alert("Enter valid book details!");
        return;
    }

    let existing = cart.find(item => item.name === name);
    if(existing){ existing.qty += qty; } 
    else { cart.push({name: name, price: price, qty: qty}); }

    // Clear input fields
    document.getElementById('newBookName').value = '';
    document.getElementById('newBookPrice').value = '';
    document.getElementById('newBookQty').value = 1;

    renderCart();
}

// Render cart table
function renderCart() {
    let tbody = document.querySelector('#cartTable tbody');
    tbody.innerHTML = '';
    cart.forEach((item,index) => {
        let total = (item.price * item.qty).toFixed(2);
        let tr = document.createElement('tr');
        tr.innerHTML = `
            <td>${item.name}</td>
            <td>${item.price.toFixed(2)}</td>
            <td>${item.qty}</td>
            <td>${total}</td>
            <td><button onclick="removeItem(${index})">❌ Remove</button></td>
        `;
        tbody.appendChild(tr);
    });
}

// Remove item
function removeItem(index){
    cart.splice(index,1);
    renderCart();
}

// Pay / Print receipt
function pay() {
    if(cart.length===0){ alert('Cart is empty!'); return; }

    let total=0;
    let receipt = "📖 PahanaEdu Bookshop\n";
    receipt += "----------------------------\n";
    receipt += "Item           Qty   Price\n";
    receipt += "----------------------------\n";

    cart.forEach(item=>{
        let lineTotal = item.price * item.qty;
        total += lineTotal;
        let name = item.name.length>12 ? item.name.substring(0,12) : item.name;
        receipt += name.padEnd(12,' ') + item.qty.toString().padStart(3,' ') + "  " + lineTotal.toFixed(2).toString().padStart(6,' ') + "\n";
    });

    receipt += "----------------------------\n";
    receipt += "GRAND TOTAL: Rs. "+total.toFixed(2)+"\n";
    receipt += "Thank you for shopping!\n";
    receipt += "----------------------------\n";

    let printWindow = window.open('','', 'height=400,width=400');
    printWindow.document.write('<pre>'+receipt+'</pre>');
    printWindow.document.write('<button onclick="window.print();">🖨️ Print</button>');
    printWindow.document.close();

    cart = [];
    renderCart();
}
</script>
</body>
</html>
