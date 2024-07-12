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

@WebServlet("/CertificateServlet")
public class CertificateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String eventName = request.getParameter("eventName");
        String userName = request.getParameter("userName");
        String certificateType = request.getParameter("certificateType");
        String certificatePath = request.getParameter("certificatePath");
        int certificateId = request.getParameter("certificateId") != null ? Integer.parseInt(request.getParameter("certificateId")) : 0;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/EP", "root", "2004@Ayyappa");

            if ("create".equals(action)) {
                String sql = "INSERT INTO Certificates (event_name, username, certificate_type, certificate_path) VALUES (?, ?, ?, ?)";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setString(1, eventName);
                stmt.setString(2, userName);
                stmt.setString(3, certificateType);
                stmt.setString(4, certificatePath);
                stmt.executeUpdate();
            } else if ("edit".equals(action)) {
                String sql = "UPDATE Certificates SET event_name=?, username=?, certificate_type=?, certificate_path=? WHERE certificate_id=?";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setString(1, eventName);
                stmt.setString(2, userName);
                stmt.setString(3, certificateType);
                stmt.setString(4, certificatePath);
                stmt.setInt(5, certificateId);
                stmt.executeUpdate();
            } else if ("delete".equals(action)) {
                String sql = "DELETE FROM Certificates WHERE certificate_id=?";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setInt(1, certificateId);
                stmt.executeUpdate();
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("adminCertificates.jsp?error=database");
            return;
        }

        response.sendRedirect("adminCertificates.jsp");
    }
}
