<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Reset Password</title>
    <link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<body>
    <div class="reset-password-container">
        <h2>Reset Your Password</h2>
        <form action="ResetPasswordServlet" method="post">
            <input type="hidden" name="token" value="<%= request.getParameter("token") %>">
            <div class="form-group">
                <label for="newPassword">New Password:</label>
                <input type="password" name="newPassword" class="form-style" id="newPassword" required>
            </div>
            <button type="submit" class="btn">Submit</button>
        </form>
    </div>
</body>
</html>
