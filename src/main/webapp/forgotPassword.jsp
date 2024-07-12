<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Forgot Password</title>
    <link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<body>
    <div class="forgot-password-container">
        <h2>Forgot Your Password?</h2>
        <form action="ForgotPasswordServlet" method="post">
            <div class="form-group">
                <label for="email">Enter your email address:</label>
                <input type="email" name="email" class="form-style" id="email" required>
            </div>
            <button type="submit" class="btn">Submit</button>
        </form>
    </div>
</body>
</html>
