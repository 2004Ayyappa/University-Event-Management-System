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

@WebServlet("/EventServlet")
public class EventServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String eventName = request.getParameter("eventName");
        String eventDate = request.getParameter("eventDate");
        String organizedBy = request.getParameter("organizedBy");
        String imageUrl=request.getParameter("imageUrl");
        int eventId = request.getParameter("eventId") != null ? Integer.parseInt(request.getParameter("eventId")) : 0;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/EP", "root", "2004@Ayyappa");

            if ("create".equals(action)) {
                String sql = "INSERT INTO Events (event_name, event_date, organized_by, image_url) VALUES (?, ?, ?, ?)";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, eventName);
                pstmt.setString(2, eventDate);
                pstmt.setString(3, organizedBy);
                pstmt.setString(4, imageUrl);
                pstmt.executeUpdate();
            
            } else if ("edit".equals(action)) {
                String sql = "UPDATE Events SET event_name=?, event_date=?, organized_by=? WHERE event_id=?";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setString(1, eventName);
                stmt.setString(2, eventDate);
                stmt.setString(3, organizedBy);
                stmt.setInt(4, eventId);
                stmt.executeUpdate();
            } else if ("delete".equals(action)) {
                String sql = "DELETE FROM Events WHERE event_id=?";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setInt(1, eventId);
                stmt.executeUpdate();
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("adminEvents.jsp");
    }
}
