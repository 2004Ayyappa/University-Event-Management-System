package com.EventController;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.DBConnection.DatabaseConnection;
import com.EventManager.Registration;

@WebServlet("/RegisteredEventsServlet")
public class RegisteredEventsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Registration> registrations = new ArrayList<>();
        
        // Assuming the user's ID is stored in the session
        int userId = (int) request.getSession().getAttribute("userId");
       
        try (Connection connection = DatabaseConnection.getConnection()) {
            String sql = "SELECT e.event_name, r.attendance FROM registrations r JOIN events e ON r.event_id = e.event_id WHERE r.user_id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, userId);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Registration registration = new Registration();
                registration.setEventName(resultSet.getString("event_name"));
                registration.setAttendance(resultSet.getString("attendance"));
                registrations.add(registration);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            
        }

        request.setAttribute("registrations", registrations);
        request.getRequestDispatcher("registeredEvents.jsp").forward(request, response);
    }
}
