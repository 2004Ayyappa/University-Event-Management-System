package com.EventController;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.DBConnection.DatabaseConnection;
import com.EmailUtility.EmailUtility;

@WebServlet("/ForgotPasswordServlet")
public class ForgotPasswordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");

        try (Connection connection = DatabaseConnection.getConnection()) {
            String sql = "SELECT * FROM Users WHERE email = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, email);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                String resetToken = UUID.randomUUID().toString();
                String updateTokenSql = "UPDATE Users SET reset_token = ? WHERE email = ?";
                PreparedStatement updateTokenStmt = connection.prepareStatement(updateTokenSql);
                updateTokenStmt.setString(1, resetToken);
                updateTokenStmt.setString(2, email);
                updateTokenStmt.executeUpdate();

                String resetLink = "http://localhost:8080/EP-Project/resetPassword.jsp?token=" + resetToken;
                String subject = "Password Reset Request";
                String content = "To reset your password, click the link below:\n" + resetLink;

                EmailUtility.sendEmail(email, subject, content);

                response.sendRedirect("forgotPassword.jsp?message=Check your email for the reset link.");
            } else {
                response.sendRedirect("forgotPassword.jsp?error=Email not found.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("forgotPassword.jsp?error=An error occurred. Please try again.");
        }
    }
}
