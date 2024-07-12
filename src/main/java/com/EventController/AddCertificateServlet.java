package com.EventController;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/AddCertificateServlet")
@MultipartConfig
public class AddCertificateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String eventName = request.getParameter("eventName");
        String username = request.getParameter("username");
        String certificateType = request.getParameter("certificateType");
        int certificateId = request.getParameter("certificateId") != null ? Integer.parseInt(request.getParameter("certificateId")) : 0;
        Part filePart = request.getPart("certificatePath");

        String fileName = filePart != null ? filePart.getSubmittedFileName() : null;
        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";

        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        String filePath = null;
        if (filePart != null && fileName != null && !fileName.isEmpty()) {
            // Generate a unique file name to avoid conflicts
            String uniqueFileName = System.currentTimeMillis() + "_" + fileName;
            filePath = uploadPath + File.separator + uniqueFileName;

            // Write the file to disk
            filePart.write(filePath);
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/EP", "root", "2004@Ayyappa");

            if ("create".equals(action)) {
                String sql = "INSERT INTO Certificates (event_name, username, certificate_type, certificate_path) VALUES (?, ?, ?, ?)";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setString(1, eventName);
                stmt.setString(2, username);
                stmt.setString(3, certificateType);
                stmt.setString(4, filePath);
                stmt.executeUpdate();
            } else if ("edit".equals(action)) {
                String sql = "UPDATE Certificates SET event_name=?, username=?, certificate_type=?, certificate_path=? WHERE certificate_id=?";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setString(1, eventName);
                stmt.setString(2, username);
                stmt.setString(3, certificateType);
                stmt.setString(4, filePath);
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
            // Handle exceptions appropriately (e.g., redirect with error message)
            response.sendRedirect("adminCertificates.jsp?error=database");
        }

        response.sendRedirect("adminCertificates.jsp");
    }
}
