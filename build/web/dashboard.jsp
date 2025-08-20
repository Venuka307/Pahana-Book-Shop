<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>📊 Dashboard - PahanaEdu</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            font-family: "Poppins", sans-serif;
            background: linear-gradient(135deg, #e3f2fd, #fce4ec);
            padding: 30px;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        h1 {
            font-size: 32px;
            margin-bottom: 40px;
            text-align: center;
            color: #0d47a1;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.1);
        }
        .card-container {
            display: flex;
            flex-wrap: wrap;
            gap: 25px;
            justify-content: center;
            flex-grow: 1;
        }
        .card {
            flex: 1 1 calc(30% - 20px);
            min-width: 250px;
            background: white;
            padding: 30px;
            border-radius: 20px;
            box-shadow: 0 6px 15px rgba(0,0,0,0.15);
            text-align: center;
            transition: all 0.3s ease;
            cursor: pointer;
        }
        .card:hover {
            transform: translateY(-10px) scale(1.03);
            box-shadow: 0 12px 25px rgba(0,0,0,0.25);
        }
        .emoji {
            font-size: 45px;
            margin-bottom: 15px;
            display: block;
        }
        .card-title {
            font-size: 20px;
            font-weight: 600;
            color: #333;
        }
        .card-value {
            font-size: 26px;
            color: #0d47a1;
            margin-top: 12px;
            font-weight: bold;
        }
        
        .card:nth-child(1) { background: #e3f2fd; }
        .card:nth-child(2) { background: #fff3e0; }
        .card:nth-child(3) { background: #f1f8e9; }
        .card:nth-child(4) { background: #ede7f6; }
        .card:nth-child(5) { background: #fff8e1; }
        .card:nth-child(6) { background: #e0f7fa; }

        @media (max-width: 768px) {
            .card { flex: 1 1 100%; }
        }

        
        .footer {
            margin-top: 50px;
            padding: 20px;
            background: #0d47a1;
            color: white;
            text-align: center;
            border-radius: 12px;
        }
        .footer .nav-links {
            margin: 10px 0;
        }
        .footer .nav-links a {
            color: #ffeb3b;
            text-decoration: none;
            margin: 0 15px;
            font-weight: 500;
            transition: color 0.3s;
        }
        .footer .nav-links a:hover {
            color: #fff176;
        }
        .footer p {
            margin: 5px 0;
            font-size: 14px;
        }
    </style>
</head>
<body>

<h1>📚 Welcome To Pahana Edu Book Shop 📚</h1>

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


<div class="footer">
    <div class="nav-links">
        <a href="#">Home</a> |
        <a href="#">Books</a> |
        <a href="#">Customers</a> |
        <a href="#">Sales</a> |
        <a href="#">Help</a>
    </div>
    <p>📞 Contact: +94 77 123 4567 | ✉️ info@pahanaedu.lk</p>
    <p>© 2025 Pahana Book Shop. All rights reserved.</p>
</div>

</body>
</html>
