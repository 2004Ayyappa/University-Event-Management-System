<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
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
}</style>
</head>
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
        <h2>Manage Registered Students</h2>
        <form action="RegisteredStudentsServlet" method="post">
            <input type="hidden" name="action" value="create">
            <label for="user_id">User ID:</label>
            <input type="number" name="user_id" required>
            <label for="event_id">Event ID:</label>
            <input type="number" name="event_id" required>
            <label for="attendance">Attendance:</label>
            <input type="text" name="attendance" required>
            <label for="username">Username:</label>
            <input type="text" name="username" required>
            <label for="event_name">Event Name:</label>
            <input type="text" name="event_name" required>
            <input type="submit" value="Add Registration">
        </form>
       
        <hr>
        <br>
        <h3>Existing Registrations</h3>
        <table>
            <tr>
                <th>Registration ID</th>
                <th>User ID</th>
                <th>Event ID</th>
                <th>Attendance</th>
                <th>Username</th>
                <th>Event Name</th>
                <th>Actions</th>
            </tr>
            <%
                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/EP", "root", "2004@Ayyappa");
                    stmt = conn.createStatement();
                    rs = stmt.executeQuery("SELECT * FROM registrations");

                    while (rs.next()) {
                        int registrationId = rs.getInt("registration_id");
                        int userId = rs.getInt("user_id");
                        int eventId = rs.getInt("event_id");
                        String attendance = rs.getString("attendance");
                        String username = rs.getString("username");
                        String eventName = rs.getString("event_name");
            %>
            <tr>
                <td><%= registrationId %></td>
                <td><%= userId %></td>
                <td><%= eventId %></td>
                <td><%= attendance %></td>
                <td><%= username %></td>
                <td><%= eventName %></td>
                <td>
                   
                    <form action="RegisteredStudentsServlet" method="post" style="display:inline;">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="registration_id" value="<%= registrationId %>">
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
                        if (stmt != null) stmt.close();
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
