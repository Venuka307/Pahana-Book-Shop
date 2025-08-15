<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>📚 Book Shop Login</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background: #f5f7fa;
        color: #333;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .login-box {
        background: white;
        padding: 30px 35px;
        border-radius: 8px;
        width: 360px;
        box-shadow: 0 2px 8px rgba(0,0,0,0.1);
    }

    .login-box h2 {
        text-align: center;
        margin-bottom: 25px;
        color: #2980b9;
        font-size: 22px;
    }

    .form-group {
        margin-bottom: 15px;
    }

    label {
        display: block;
        font-weight: bold;
        margin-bottom: 6px;
        color: #555;
    }

    input[type="text"],
    input[type="password"] {
        width: 100%;
        padding: 10px;
        border-radius: 6px;
        border: 1px solid #ccc;
        font-size: 14px;
    }

    .options {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-top: 10px;
        font-size: 14px;
    }

    .options a {
        text-decoration: none;
        color: #2980b9;
        font-weight: bold;
    }

    button {
        margin-top: 20px;
        width: 100%;
        background: #2980b9;
        color: white;
        border: none;
        padding: 12px;
        font-size: 16px;
        border-radius: 6px;
        cursor: pointer;
        transition: 0.3s;
    }

    button:hover {
        background: #1f6391;
    }
</style>
</head>
<body>
<div class="login-box">

    <h2>📚 Book Shop Login 📚</h2>

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
    </form>
</div>

<%
    String errorMessage = (String) request.getAttribute("error");
    if (errorMessage != null) {
%>
<script>
    alert("<%= errorMessage %>");
</script>
<% } %>

</body>
</html>
