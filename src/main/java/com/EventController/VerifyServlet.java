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

@WebServlet("/VerifyServlet")
public class VerifyServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String token = request.getParameter("token");

        try (Connection connection = DatabaseConnection.getConnection()) {
            String sql = "SELECT * FROM Users WHERE reset_token = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, token);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                String updateSql = "UPDATE Users SET status = 'VERIFIED' WHERE reset_token = ?";
                PreparedStatement updateStatement = connection.prepareStatement(updateSql);
                updateStatement.setString(1, token);
                updateStatement.executeUpdate();

                response.sendRedirect("verify-success.jsp");
            } else {
                response.sendRedirect("verify-fail.jsp");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("verify-fail.jsp");
        }
    }
}
