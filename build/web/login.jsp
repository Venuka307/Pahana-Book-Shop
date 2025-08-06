<%-- 
    Document   : login
    Created on : Aug 6, 2025, 11:10:45 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>📚 Book Shop Login</title>
  <style>
    body {
      margin: 0;
      padding: 0;
      background: linear-gradient(to right, #f5f1ea, #d0c7b5);
      font-family: 'Georgia', serif;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    .login-box {
      background: #fff8ef;
      padding: 40px;
      border-radius: 12px;
      width: 360px;
      box-shadow: 0 0 12px rgba(0, 0, 0, 0.15);
    }

    .login-box h2 {
      text-align: center;
      margin-bottom: 30px;
      color: #4b3c2b;
      font-family: 'Georgia', serif;
    }

    .form-group {
      margin-bottom: 18px;
    }

    label {
      display: block;
      font-weight: bold;
      margin-bottom: 6px;
      color: #5a4838;
    }

    input[type="text"],
    input[type="password"] {
      width: 100%;
      padding: 10px;
      border-radius: 6px;
      border: 1px solid #c8b6a6;
      background: #fff;
      font-size: 14px;
    }

    .options {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-top: 10px;
    }

    .options label {
      font-weight: normal;
      font-size: 14px;
    }

    .options input[type="checkbox"] {
      margin-right: 6px;
    }

    .options a {
      text-decoration: none;
      color: #8b5e3c;
      font-weight: bold;
    }

    button {
      margin-top: 20px;
      width: 100%;
      background: #8b5e3c;
      color: white;
      border: none;
      padding: 12px;
      font-size: 16px;
      border-radius: 6px;
      cursor: pointer;
      transition: 0.3s;
    }

    button:hover {
      background: #6d4c2b;
    }
  </style>
</head>
<body>
  <div class="login-box">
    <h2>📚 Book Shop Login</h2>
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
</body>
</html>

