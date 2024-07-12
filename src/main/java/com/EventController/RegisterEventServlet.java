package com.EventController;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.DBConnection.DatabaseConnection;

@WebServlet("/RegisterEventServlet")
public class RegisterEventServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int userId = (int) session.getAttribute("userId");
        String username = (String) session.getAttribute("username");
        int eventId = Integer.parseInt(request.getParameter("eventId"));
        String eventName = request.getParameter("eventName");
        

        // Debugging prints
        System.out.println("userId: " + userId);
        System.out.println("username: " + username);
        System.out.println("eventId: " + eventId);
        System.out.println("eventName: " + eventName);

        try (Connection connection = DatabaseConnection.getConnection()) {
            String sql = "INSERT INTO registrations (user_id, event_id, username, event_name) VALUES (?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, userId);
            statement.setInt(2, eventId);
            statement.setString(3, username);
            statement.setString(4, eventName);
            statement.executeUpdate();
            response.sendRedirect("RegisteredEventsServlet");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
