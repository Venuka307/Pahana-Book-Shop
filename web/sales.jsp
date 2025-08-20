<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pahana Edu - POS System</title>
<style>
body { font-family: Arial, sans-serif; background:#f5f7fa; color:#333; margin:20px; }
.container { display:flex; max-width:1200px; margin:0 auto; gap:15px; }


.cart { width:35%; background:white; padding:15px; border-radius:6px; box-shadow:0 2px 8px rgba(0,0,0,0.05); }
.cart h2 { text-align:center; margin-bottom:10px; color:#2980b9; }
table { width:100%; border-collapse: collapse; margin-top:12px; }
th, td { padding:10px 12px; text-align:center; border-bottom:1px solid #eee; }
th { background-color:#2980b9; color:white; }
.cart-footer { margin-top:10px; text-align:right; font-weight:bold; color:#2980b9; }


.products { flex:1; display:grid; grid-template-columns: repeat(3, 1fr); gap:10px; }
.btn { padding:12px; background:#2980b9; color:white; font-weight:bold; border:none; border-radius:6px; cursor:pointer; text-align:center; transition:0.2s; }
.btn:hover { background:#3498db; }


.sidebar { width:15%; display:flex; flex-direction:column; gap:10px; }
.pay { background:#27ae60; color:white; }
.pay:hover { background:#2ecc71; }
.print { background:#16a085; color:white; }
.clear { background:#c0392b; color:white; }


#receipt {
    display:none; width:280px; padding:10px; margin:20px auto;
    background:#fff; color:#000; font-family:monospace; font-size:12px;
    border:1px solid #000; border-radius:5px; line-height:1.4;
}
#receipt h2 { text-align:center; margin:5px 0; }
#receipt pre { white-space: pre-wrap; word-wrap: break-word; }

@media print {
    body * { visibility:hidden; }
    #receipt, #receipt * { visibility:visible; }
    #receipt { position:absolute; left:0; top:0; width:auto; }
}
</style>
</head>
<body>

<div class="container">
    <!-- CART AREA -->
    <div class="cart">
        <h2>&#x1F4CB; Bookshop Cart</h2>
        <table>
            <thead>
                <tr><th>Book</th><th>Qty</th><th>Price</th><th>Total</th></tr>
            </thead>
            <tbody id="cartBody"></tbody>
        </table>
        <div class="cart-footer">Grand Total: Rs. <span id="grandTotal">0.00</span></div>
    </div>

    
    <div class="products">
        <button class="btn" onclick="addToCart('Harry Potter', 1200)">Harry Potter<br/>Rs.1200</button>
        <button class="btn" onclick="addToCart('Math Grade 10', 950)">Math Grade 10<br/>Rs.950</button>
        <button class="btn" onclick="addToCart('Pen', 50)">Pen<br/>Rs.50</button>
        <button class="btn" onclick="addToCart('Notebook', 200)">Notebook<br/>Rs.200</button>
        <button class="btn" onclick="addToCart('Story Book', 500)">Story Book<br/>Rs.500</button>
        <button class="btn" onclick="addToCart('Science Grade 11', 1100)">Science Grade 11<br/>Rs.1100</button>
        <button class="btn" onclick="addToCart('Lord of the Rings', 1500)">Lord of the Rings<br/>Rs.1500</button>
        <button class="btn" onclick="addToCart('Pencil', 30)">Pencil<br/>Rs.30</button>
        <button class="btn" onclick="addToCart('Coloring Book', 400)">Coloring Book<br/>Rs.400</button>
        <button class="btn" onclick="addToCart('History Grade 12', 900)">History Grade 12<br/>Rs.900</button>
        <button class="btn" onclick="addToCart('C++ Programming', 1250)">C++ Programming<br/>Rs.1250</button>
        <button class="btn" onclick="addToCart('Java for Beginners', 1350)">Java for Beginners<br/>Rs.1350</button>
        <button class="btn" onclick="addToCart('Python Cookbook', 1400)">Python Cookbook<br/>Rs.1400</button>
        <button class="btn" onclick="addToCart('English Grammar', 800)">English Grammar<br/>Rs.800</button>
        <button class="btn" onclick="addToCart('Sri Lanka History', 950)">Sri Lanka History<br/>Rs.950</button>
    </div>

    <!-- SIDEBAR ACTIONS -->
    <div class="sidebar">
        <button class="btn pay" onclick="payCart()">💳 Pay</button>
        <button class="btn print" onclick="printReceipt()">🖨 Print Receipt</button>
        <button class="btn clear" onclick="clearCart()">❌ Clear</button>
    </div>
</div>


<div id="receipt">
    <h2>&#x1F4DA; Pahana Edu</h2>
    <pre id="receiptContent"></pre>
</div>

<script>
document.addEventListener("DOMContentLoaded", function() {
    let cart = [];

    function addToCart(name, price){
        let existing = cart.find(i=>i.name===name);
        if(existing){
            existing.qty++;
            existing.total = existing.qty * existing.price;
        } else {
            cart.push({name:name, qty:1, price:price, total:price});
        }
        renderCart();
    }

    function renderCart(){
        let tbody = document.getElementById("cartBody");
        let receiptContent = document.getElementById("receiptContent");
        tbody.innerHTML = "";
        let grandTotal = 0;
        let receiptText = "📖 PahanaEdu Bookshop\n";
        receiptText += "----------------------------\n";
        receiptText += "Item           Qty   Total\n";
        receiptText += "----------------------------\n";

        cart.forEach(i=>{
            grandTotal += i.total;
            tbody.innerHTML += `<tr>
                <td>${i.name}</td>
                <td>${i.qty}</td>
                <td>Rs.${i.price.toFixed(2)}</td>
                <td>Rs.${i.total.toFixed(2)}</td>
            </tr>`;
            let name = i.name.length>12 ? i.name.substring(0,12) : i.name;
            receiptText += name.padEnd(12,' ') + i.qty.toString().padStart(3,' ') + "  " + i.total.toFixed(2).toString().padStart(6,' ') + "\n";
        });

        receiptText += "----------------------------\n";
        receiptText += "GRAND TOTAL: Rs."+grandTotal.toFixed(2)+"\n";
        receiptText += "Thank you for shopping!\n";
        receiptText += "----------------------------\n";

        receiptContent.innerText = receiptText;
        document.getElementById("grandTotal").innerText = grandTotal.toFixed(2);
    }

    window.addToCart = addToCart;

    window.clearCart = function(){
        cart=[];
        renderCart();
        document.getElementById("receipt").style.display="none";
    }

    window.payCart = function(){
        if(cart.length===0){ alert("Cart is empty!"); return; } 
        document.getElementById("receipt").style.display="block";
    }

    window.printReceipt = function(){
        if(cart.length===0){ alert("No items to print!"); return; }
        window.print();
    }
});
</script>
</body>
</html>
