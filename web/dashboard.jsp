<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>📊 Dashboard - PahanaEdu</title>
    <style>
        body {
            margin: 0;
            font-family: "Segoe UI", sans-serif;
            background-color: #f0f4f8;
            padding: 30px;
        }
        h1 {
            font-size: 28px;
            margin-bottom: 30px;
            color: #1a237e;
        }
        .card-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }
        .card {
            flex: 1 1 calc(33.33% - 20px);
            background-color: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            text-align: center;
            transition: transform 0.2s;
        }
        .card:hover {
            transform: scale(1.02);
        }
        .emoji {
            font-size: 40px;
            margin-bottom: 10px;
        }
        .card-title {
            font-size: 18px;
            font-weight: bold;
            color: #333;
        }
        .card-value {
            font-size: 24px;
            color: #1a237e;
            margin-top: 10px;
        }
        @media (max-width: 768px) {
            .card {
                flex: 1 1 100%;
            }
        }
    </style>
</head>
<body>

<h1>📚 Welcome To Pahana Book Shop 📚</h1>

<div class="card-container">

    <div class="card">
        <div class="emoji">📦</div>
        <div class="card-title">Available Books</div>
        <div class="card-value">1,250</div>
    </div>

    <div class="card">
        <div class="emoji">💰</div>
        <div class="card-title">Total Sales</div>
        <div class="card-value">Rs. 145,000</div>
    </div>

    <div class="card">
        <div class="emoji">👥</div>
        <div class="card-title">Registered Customers</div>
        <div class="card-value">320</div>
    </div>

    <div class="card">
        <div class="emoji">📈</div>
        <div class="card-title">Monthly Growth</div>
        <div class="card-value">+12%</div>
    </div>

    <div class="card">
        <div class="emoji">📕</div>
        <div class="card-title">Top Selling Book</div>
        <div class="card-value">"Java Basics"</div>
    </div>

    <div class="card">
        <div class="emoji">🕒</div>
        <div class="card-title">Last Sale</div>
        <div class="card-value">Today, 11:45 AM</div>
    </div>

</div>

</body>
</html>
