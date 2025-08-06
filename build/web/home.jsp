<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Pahana Edu | Dashboard</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: #f5f1ec;
        }

        .header {
            background-color: #3f2f25;
            color: #ffffff;
            padding: 24px;
            text-align: center;
            font-size: 28px;
            font-weight: bold;
        }

        .dashboard {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 30px;
            padding: 40px;
        }

        .card {
            background-color: #fff;
            border-radius: 14px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
            text-align: center;
            padding: 28px 20px;
            transition: 0.3s ease-in-out;
            border: 2px solid transparent;
            cursor: pointer;
        }

        .card:hover {
            transform: translateY(-6px);
            border-color: #8d6e63;
        }

        .emoji {
            font-size: 42px;
        }

        .card h3 {
            margin-top: 15px;
            font-size: 18px;
            color: #333;
        }

        .footer {
            text-align: center;
            padding: 18px;
            font-size: 14px;
            color: #777;
            background-color: #e3ded9;
            border-top: 1px solid #ccc;
        }

        @media (max-width: 600px) {
            .dashboard {
                padding: 20px;
                gap: 20px;
            }

            .header {
                font-size: 22px;
                padding: 16px;
            }
        }
    </style>
</head>
<body>

<div class="header">
    📚 Pahana Edu Bookshop - Dashboard
</div>

<div class="dashboard">
    <div class="card" onclick="location.href='CustomerServlet?action=view'">
        <div class="emoji">👥</div>
        <h3>Customers</h3>
    </div>

    <div class="card" onclick="location.href='UserServlet?action=view'">
        <div class="emoji">🙍</div>
        <h3>Users</h3>
    </div>

    <div class="card" onclick="location.href='BookServlet?action=view'">
        <div class="emoji">📚</div>
        <h3>Books</h3>
    </div>

    <div class="card" onclick="location.href='SalesServlet?action=view'">
        <div class="emoji">💰</div>
        <h3>Sales</h3>
    </div>

    <div class="card" onclick="location.href='Help.jsp'">
        <div class="emoji">❓</div>
        <h3>Help</h3>
    </div>

    <div class="card" onclick="location.href='LogoutServlet'">
        <div class="emoji">🚪</div>
        <h3>Logout</h3>
    </div>
</div>

<div class="footer">
    &copy; 2025 Pahana Edu Bookshop | Developed by Venuka Ranjan
</div>

</body>
</html>
