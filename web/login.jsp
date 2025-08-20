<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>📚 Book Shop Login</title>
<style>
    body {
        font-family: "Segoe UI", Arial, sans-serif;
        background: linear-gradient(135deg, #e3f2fd, #fce4ec);
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .login-box {
        background: white;
        padding: 35px;
        border-radius: 12px;
        width: 360px;
        box-shadow: 0 6px 18px rgba(0,0,0,0.1);
    }

    .emoji-logo {
        font-size: 50px;
        text-align: center;
        display: block;
        margin-bottom: 10px;
    }

    .login-box h2 {
        text-align: center;
        margin-bottom: 25px;
        color: #0d47a1;
        font-size: 24px;
    }

    .form-group {
        margin-bottom: 18px;
    }

    label {
        display: block;
        font-weight: bold;
        margin-bottom: 6px;
        color: #444;
    }

    input[type="text"],
    input[type="password"] {
        width: 100%;
        padding: 12px;
        border-radius: 6px;
        border: 1px solid #ccc;
        font-size: 15px;
        transition: border 0.3s;
    }

    input:focus {
        border-color: #0d47a1;
        outline: none;
        box-shadow: 0 0 5px rgba(13,71,161,0.2);
    }

    .options {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-top: 5px;
        font-size: 14px;
    }

    .options a {
        text-decoration: none;
        color: #0d47a1;
        font-weight: 500;
    }

    button {
        margin-top: 20px;
        width: 100%;
        background: #0d47a1;
        color: white;
        border: none;
        padding: 12px;
        font-size: 16px;
        border-radius: 6px;
        cursor: pointer;
        transition: 0.3s;
    }

    button:hover {
        background: #08306b;
    }

    .error-message {
        color: red;
        font-size: 14px;
        text-align: center;
        margin-top: 12px;
    }

    .success-message {
        color: green;
        font-size: 14px;
        text-align: center;
        margin-top: 12px;
    }
</style>
</head>
<body>
<div class="login-box">

    <span class="emoji-logo">📚</span>
    <h2>Book Shop Login</h2>

    <form action="Login" method="POST">
        <div class="form-group">
            <label for="username">👤 Username</label>
            <input type="text" id="username" name="username" required />
        </div>

        <div class="form-group">
            <label for="password">🔐 Password</label>
            <input type="password" id="password" name="password" required />
        </div>

        <div class="options">
            <label><input type="checkbox" name="remember" /> 💾 Remember Me</label>
            <a href="#">🔎 Forgot Password?</a>
        </div>

        <button type="submit">📖 Login</button>

        
        <%
            String errorMessage = (String) request.getAttribute("error");
            if (errorMessage != null) {
        %>
            <div class="error-message"><%= errorMessage %></div>
        <% } %>

       
        <%
            String successMessage = (String) request.getAttribute("success");
            if (successMessage != null) {
        %>
            <div class="success-message"><%= successMessage %></div>
        <% } %>
    </form>
</div>
</body>
</html>
