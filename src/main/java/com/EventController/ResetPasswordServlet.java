package com.EventController;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.DBConnection.DatabaseConnection;

@WebServlet("/ResetPasswordServlet")
public class ResetPasswordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String token = request.getParameter("token");
        String newPassword = request.getParameter("newPassword");

        try (Connection connection = DatabaseConnection.getConnection()) {
            String sql = "SELECT * FROM Users WHERE reset_token = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, token);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                String updatePasswordSql = "UPDATE Users SET password = ?, reset_token = NULL WHERE reset_token = ?";
                PreparedStatement updatePasswordStmt = connection.prepareStatement(updatePasswordSql);
                updatePasswordStmt.setString(1, newPassword);
                updatePasswordStmt.setString(2, token);
                updatePasswordStmt.executeUpdate();

                response.sendRedirect("index.jsp?message=Password successfully reset. You can now log in.");
            } else {
                response.sendRedirect("resetPassword.jsp?error=Invalid token.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("resetPassword.jsp?error=An error occurred. Please try again.");
        }
    }
}
