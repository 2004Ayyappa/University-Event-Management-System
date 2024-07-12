<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Events</title>
 <link rel="stylesheet" type="text/css" href="css/adminStyles.css">
 <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha512-Fo3rlrZj/kMVqEX1zq+6f7KXZChcI4k6rZh4HYYzMciJdX+hd1QAMlKjcqO16H0o0vMeNn8TA9DEf1B6rlXJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />    
 <style>
    @import url("https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap");

* {
  margin: 0;
  box-sizing: border-box;
}

body {
  font-family: "Poppins", sans-serif;
}

.container {
  max-width: 1999px;
  width: 90%;
  margin: auto;
}

.navbar {
    width: 100%;
    box-shadow: inset 1px 0px 14px 1px rgb(84 95 107 / 49%);
    background-color: #00beff4a;
}

.nav-container {
  display: flex;
  justify-content: space-between;
  align-items: center;
  height: 62px;
}

.navbar .menu-items {
  display: flex;
}

.navbar .nav-container li {
  list-style: none;
}

.navbar .nav-container a {
  text-decoration: none;
  color: #0e2431;
  font-weight: 500;
  font-size: 1.2rem;
  padding: 0.4rem;
  background-color:#a4e3f97d;
}

.navbar .nav-container a:hover{
    font-weight: bolder;
}

.nav-container {
  display: block;
  position: relative;
  height: 60px;
}

.nav-container .checkbox {
  position: absolute;
  display: block;
  height: 32px;
  width: 32px;
  top: 20px;
  left: 20px;
  z-index: 5;
  opacity: 0;
  cursor: pointer;
}

.nav-container .hamburger-lines {
  display: block;
  height: 26px;
  width: 32px;
  position: absolute;
  top: 17px;
  left: 20px;
  z-index: 2;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}

.nav-container .hamburger-lines .line {
  display: block;
  height: 4px;
  width: 100%;
  border-radius: 10px;
  background: #0e2431;
}

.nav-container .hamburger-lines .line1 {
  transform-origin: 0% 0%;
  transition: transform 0.4s ease-in-out;
}

.nav-container .hamburger-lines .line2 {
  transition: transform 0.2s ease-in-out;
}

.nav-container .hamburger-lines .line3 {
  transform-origin: 0% 100%;
  transition: transform 0.4s ease-in-out;
}

.navbar .menu-items {
    padding-top: 120px;
    box-shadow: inset 0 0 2000px rgba(255, 255, 255, 0);
    height: 100vh;
    width: 100%;
    transform: translate(-150%);
    display: flex;
    flex-direction: column;
    margin-left: -40px;
    padding-left: 50px;
    transition: transform 0.5s ease-in-out;
    text-align: center;
    align-content: space-between;
    justify-content: space-evenly;
    align-items: flex-start;
}

.navbar .menu-items li {
  margin-bottom: 1.2rem;
  font-size: 1.5rem;
  font-weight: 500;
}

.logo {
  position: absolute;
  top: 15px;
  right: 15px;
  font-size: 1.2rem;
  color: black;
}

.nav-container input[type="checkbox"]:checked ~ .menu-items {
  transform: translateX(0);
}

.nav-container input[type="checkbox"]:checked ~ .hamburger-lines .line1 {
  transform: rotate(45deg);
}

.nav-container input[type="checkbox"]:checked ~ .hamburger-lines .line2 {
  transform: scaleY(0);
}

.nav-container input[type="checkbox"]:checked ~ .hamburger-lines .line3 {
  transform: rotate(-45deg);
}

.nav-container input[type="checkbox"]:checked ~ .logo {
  display: none;
}
.nav-container .title {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  font-size: 1.0rem;
  color: #0e2431;
}
.table th {
    background-color: #f0f0f0;
}
.table th, table td {
    padding: 12px;
    text-align: left;
    border-bottom: 1px solid #ddd;
}
.table {
    width: 100%;
    /* border-collapse: collapse; */
    margin-top: 20px;
}
</style>
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
        <h2>Manage Events</h2>
        <br>
        <form action="EventServlet" method="post">
    <input type="hidden" name="action" value="create">
    <label for="eventName">Event Name:</label>
    <input type="text" name="eventName" required>
    <label for="eventDate">Event Date:</label>
    <input type="date" name="eventDate" required>
    <label for="organizedBy">Organized By:</label>
    <input type="text" name="organizedBy" required>
    <label for="imageUrl">Image URL:</label>
    <input type="text" name="imageUrl" required>
    <input type="submit" value="Add Event">
</form>
       <br></br>
        <h3>Existing Events</h3>
        <table>
            <tr>
            <th>Event URL</th>
                <th>Event Name</th>
                <th>Event Date</th>
                <th>Organized By</th>
                <th>Actions</th>
            </tr>
            <%
                Connection conn = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/EP", "root", "2004@Ayyappa");

                    String query = "SELECT * FROM Events";
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        int eventId = rs.getInt("event_id");
                        String eventName = rs.getString("event_name");
                        Date eventDate = rs.getDate("event_date");
                        String organizedBy = rs.getString("organized_by");
                        String imageUrl=rs.getString("image_url");
            %>
            <tr>
            <td><%= imageUrl%></td>
                <td><%= eventName %></td>
                <td><%= eventDate %></td>
                <td><%= organizedBy %></td>
                <td>
                   
                    <form action="EventServlet" method="post" style="display:inline;">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="eventId" value="<%= eventId %>">
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
