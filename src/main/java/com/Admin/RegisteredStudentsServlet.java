package com.Admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RegisteredStudentsServlet")
public class RegisteredStudentsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String username = request.getParameter("username");
        String eventName = request.getParameter("event_name");
        String attendance = request.getParameter("attendance");
        int registrationId = request.getParameter("registration_id") != null ? Integer.parseInt(request.getParameter("registration_id")) : 0;
        int userId = request.getParameter("user_id") != null ? Integer.parseInt(request.getParameter("user_id")) : 0;
        int eventId = request.getParameter("event_id") != null ? Integer.parseInt(request.getParameter("event_id")) : 0;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/EP", "root", "2004@Ayyappa");

            if ("create".equals(action)) {
                String sql = "INSERT INTO registrations (user_id, event_id, attendance, username, event_name) VALUES (?, ?, ?, ?, ?)";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setInt(1, userId);
                stmt.setInt(2, eventId);
                stmt.setString(3, attendance);
                stmt.setString(4, username);
                stmt.setString(5, eventName);
                stmt.executeUpdate();
            } else if ("edit".equals(action)) {
                String sql = "UPDATE registrations SET user_id=?, event_id=?, attendance=?, username=?, event_name=? WHERE registration_id=?";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setInt(1, userId);
                stmt.setInt(2, eventId);
                stmt.setString(3, attendance);
                stmt.setString(4, username);
                stmt.setString(5, eventName);
                stmt.setInt(6, registrationId);
                stmt.executeUpdate();
            } else if ("delete".equals(action)) {
                String sql = "DELETE FROM registrations WHERE registration_id=?";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setInt(1, registrationId);
                stmt.executeUpdate();
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("adminRegisteredStudents.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
