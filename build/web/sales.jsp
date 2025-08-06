<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>🧾 New Sale - Pahana Edu</title>
  <style>
    body {
      font-family: 'Georgia', serif;
      background: linear-gradient(to right, #f5f1ea, #d0c7b5);
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    .form-box {
      background: #fff8ef;
      padding: 40px;
      border-radius: 12px;
      width: 400px;
      box-shadow: 0 0 12px rgba(0, 0, 0, 0.15);
    }

    h2 {
      text-align: center;
      margin-bottom: 30px;
      color: #4b3c2b;
    }

    label {
      font-weight: bold;
      color: #5a4838;
    }

    input {
      width: 100%;
      padding: 10px;
      margin-top: 6px;
      margin-bottom: 16px;
      border-radius: 6px;
      border: 1px solid #c8b6a6;
    }

    button {
      width: 100%;
      background: #8b5e3c;
      color: white;
      border: none;
      padding: 12px;
      font-size: 16px;
      border-radius: 6px;
      cursor: pointer;
    }

    button:hover {
      background: #6d4c2b;
    }
  </style>
</head>
<body>
<div class="form-box">
  <h2>🧾 New Sale</h2>
  <form action="Sales" method="POST">
    <label>📇 Customer Account Number</label>
    <input type="text" name="accountNumber" required />

    <label>📘 Item Name</label>
    <input type="text" name="itemName" required />

    <label>🔢 Quantity</label>
    <input type="number" name="quantity" required />

    <label>💰 Unit Price (Rs.)</label>
    <input type="number" name="unitPrice" required />

    <button type="submit">🧾 Generate Bill</button>
  </form>
</div>
</body>
</html>
