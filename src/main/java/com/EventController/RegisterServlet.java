package com.EventController;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DBConnection.DatabaseConnection;
import com.EmailUtility.EmailUtility;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String token = UUID.randomUUID().toString();


        try (Connection connection = DatabaseConnection.getConnection()) {
            String sql = "INSERT INTO Users (username, email, password, reset_token, status) VALUES (?, ?, ?, ?, 'UNVERIFIED')";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, email);
            statement.setString(3, password);
            statement.setString(4, token);
            statement.executeUpdate();

            // Send verification email
            String subject = "Email Verification";
            String content = "Click the link to verify your email: http://localhost:8080/EP-Project/VerifyServlet?token=" + token;
            EmailUtility.sendEmail(email, subject, content);
            response.sendRedirect("studentLogin.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
