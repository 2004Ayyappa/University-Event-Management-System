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
import javax.servlet.http.HttpSession;
import com.DBConnection.DatabaseConnection;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try (Connection connection = DatabaseConnection.getConnection()) {
            String sql = "SELECT * FROM Admins WHERE username = ? AND password = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, password);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
            	  int adminId = resultSet.getInt("id");
                  HttpSession session = request.getSession();
                  session.setAttribute("adminId", adminId);
        
                session.setAttribute("adminUsername", username);

                // Add success message attribute to session
              

                response.sendRedirect("adminHome.jsp");
            } else {
                response.sendRedirect("index.jsp?adminLoginError=1");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("index.jsp?error=database");
        }
    }
}
