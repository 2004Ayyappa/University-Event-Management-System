<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Certificates</title>
    <link rel="stylesheet" type="text/css" href="css/adminStyles.css">
 <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha512-Fo3rlrZj/kMVqEX1zq+6f7KXZChcI4k6rZh4HYYzMciJdX+hd1QAMlKjcqO16H0o0vMeNn8TA9DEf1B6rlXJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />    
<style>
.navbar .nav-container a {
  text-decoration: none;
  color: #0e2431;
  font-weight: 500;
  font-size: 1.2rem;
  padding: 0.4rem;
  background-color:#a4e3f97d;
}</style></head>
<body>
    <nav>
  <div class="navbar">
    <div class="container nav-container">
      <input class="checkbox" type="checkbox" name="" id="" />
      <div class="hamburger-lines">
        <span class="line line1"></span>
        <span class="line line2"></span>
        <span class="line line3"></span>
      </div>
      <div class="title">
        <h2>University Event Management System</h2>
      </div>
      <div class="logo">
        <a href="profile.jsp">Profile</a>
               <a href="index.jsp">Logout<i class="fa fa-sign-out" style="font-size:25px"></i> </a>
      </div>
      <div class="menu-items">
        <li><a href="adminHome.jsp">Home</a></li>
        <li><a href="adminEvents.jsp">Manage Events</a></li>
        <li><a href="adminRegisteredStudents.jsp">Manage Registered Students</a></li>
        <li><a href="adminCertificates.jsp">Manage Certificates</a></li>
        <li><a href="adminStudents.jsp">Manage Students</a></li>
        <li><a href="index.jsp">Logout<i class="fa fa-sign-out" style="font-size:25px"></i> </a></li>
      </div>
    </div>
  </div>
    <div class="container">
        <h2>Manage Certificates</h2>
        <form action="CertificateServlet" method="post">
            <input type="hidden" name="action" value="create">
            <label for="userName">Username:</label>
            <select name="userName" required>
                <option value="">Select Username</option>
                <% 
                    Connection conn = null;
                    PreparedStatement pstmt = null;
                    ResultSet rs = null;

                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/EP", "root", "2004@Ayyappa");

                        String query = "SELECT DISTINCT username FROM registrations";
                        pstmt = conn.prepareStatement(query);
                        rs = pstmt.executeQuery();

                        while (rs.next()) {
                            String username = rs.getString("username");
                %>
                <option value="<%= username %>"><%= username %></option>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        try {
                            if (rs != null) rs.close();
                            if (pstmt != null) pstmt.close();
                            if (conn != null) conn.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                %>
            </select>
            
            <label for="eventName">Event Name:</label>
            <select name="eventName" required>
                <option value="">Select Event Name</option>
                <% 
                    try {
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/EP", "root", "2004@Ayyappa");

                        String query = "SELECT DISTINCT event_name FROM registrations";
                        pstmt = conn.prepareStatement(query);
                        rs = pstmt.executeQuery();

                        while (rs.next()) {
                            String eventName = rs.getString("event_name");
                %>
                <option value="<%= eventName %>"><%= eventName %></option>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        try {
                            if (rs != null) rs.close();
                            if (pstmt != null) pstmt.close();
                            if (conn != null) conn.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                %>
            </select>
            
            <label for="certificateType">Certificate Type:</label>
            <input type="text" name="certificateType" required>
            
            <label for="certificatePath">Certificate Path:</label>
            <input type="text" name="certificatePath" required>
            
            <input type="submit" value="Add Certificate">
        </form>
        
        <hr>
        <br>
        <h3>Existing Certificates</h3>
        <table>
            <tr>
                <th>Certificate ID</th>
                <th>Username</th>
                <th>Event Name</th>
                <th>Certificate Type</th>
                <th>Certificate Path</th>
                <th>Actions</th>
            </tr>
            <%
                try {
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/EP", "root", "2004@Ayyappa");

                    String query = "SELECT certificate_id, username, event_name, certificate_type, certificate_path FROM certificates";
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        int certificateId = rs.getInt("certificate_id");
                        String userName = rs.getString("username");
                        String eventName = rs.getString("event_name");
                        String certificateType = rs.getString("certificate_type");
                        String certificatePath = rs.getString("certificate_path");
            %>
            <tr>
                <td><%= certificateId %></td>
                <td><%= userName %></td>
                <td><%= eventName %></td>
                <td><%= certificateType %></td>
                <td><%= certificatePath %></td>
                <td>
                    
                    <form action="CertificateServlet" method="post" style="display:inline;">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="certificateId" value="<%= certificateId %>">
                        <input type="submit" value="Delete">
                    </form>
                </td>
            </tr>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    try {
                        if (rs != null) rs.close();
                        if (pstmt != null) pstmt.close();
                        if (conn != null) conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            %>
        </table>
    </div>
    </nav>
</body>
</html>