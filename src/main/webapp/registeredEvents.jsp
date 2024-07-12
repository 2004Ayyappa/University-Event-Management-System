<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Event List</title>
     <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
     @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@100;300;400;500;600;700&display=swap");
* {
  margin: 0;
  padding: 0;
}
body {
  background: linear-gradient(to left, #c6ffdd, #fbd786, #f7797d);
  height: 100vh;
  font-family: "Poppins", sans-serif;
  font-weight: bold;
}
.btn{
    text-decoration: none;
    color: #fff;    
}
.sidenav{
  padding: 10px 20px;
  width: 0;
  transition-delay: 0.3s;

  transition: 0.5s ease-in-out;
}



.active .sidenav {
    transition: 0.5s ease-in-out;
    height: 100vh;
    width: 220px;
    position: fixed;
    background: linear-gradient(93deg, rgb(250 135 135) -12.61%, rgb(250 42 42) 110.1%);
    padding: 10px 0;
}

.items {
  padding: 20px 0;
  display: none;
}

.active .items{
    display: block;
}


.items ul {
  list-style: none;
}
.items ul li {
  background: rgb(239 33 33);
  margin: 10px 0;
  height: 40px;
  transition: 0.5s ease-in;
  width: 100%;
  border: 1px solid rgba(255, 255, 255, 0.5);
  border-right: 1px solid rgba(255, 255, 255, 0.2);
  border-bottom: 1px solid rgba(255, 255, 255, 0.2);
  font-size: 16px;
  letter-spacing: 1px;
  box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
}

.items li a {
  text-decoration: none;
  color: #fff;
  font-size: 18px;
  font-weight: 600;
  padding: 0 10px;
  letter-spacing: 1px;
}


.logo {
	position: absolute;
	top: 10px;
	right: 30px;
	transition: all 250ms linear;
}
.logo a{
  color: white;
}
.navbar {
width:100%;
    background-color: #333;
    overflow: hidden;
}
 
   .navbar     h1 {
            text-align: center;
            color: white;
        }
        .event-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-bottom: 20px;
        }

        .event-image {
            position: relative;
            width: 300px;
            height: 200px;
            background-size: cover;
            background-position: center;
        }

        .event-details {
            position: absolute;
            bottom: 0;
            background: rgba(0, 0, 0, 0.5);
            color: white;
            width: 100%;
            text-align: center;
            padding: 10px;
        }

        .event-table {
            width: 100%;
            border-collapse: collapse;
        }

        .event-table th, .event-table td {
            border: 2px solid black;
            padding: 8px;
        }

        .event-table th {
            background-color: #1d93a9;
            text-align: center;
        }

       

        .navbar a:hover {
            background-color: #ddd;
            color: black;
        }

        .container {
            padding: 20px;
        }

        .register-button {
            margin-top: 10px;
        }
.form-container input[type="submit"]:hover {
    background-color: #45a049;
}

        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid rgb(64, 0, 64);
        }
        th {
            background-color: #f2f2f2;
        }
      
    </style>
</head>
<body>
    <div class = "navbar">
<h1>Welcome to the University Event Management System</h1>
  <div class="logo">
        <a href="profile.jsp">Profile</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="index.jsp">Logout<i class="fa fa-sign-out" style="font-size:20px"></i> </a>
      </div>
 </div>
 
 <div class="sidenav">
            <span class="btn" href=""><i class="las la-bars la-2x"></i>    </span>

            <div class="items">
                <ul>
                    <li><a href="home.jsp">Home</a></li>
                    <li><a href="eventList.jsp">Events</a></li>
                    <li><a href="registeredEvents.jsp">Registered Events</a></li>
                    <li><a href="certificates.jsp">Certificates</a></li>
                </ul>
            </div>
        </div>
    <div class="container">
        <h2>Your Registered Events</h2>
        <table>
            <tr>
                <th>Event Name</th>
                <th>Attendance</th>
            </tr>
            <%
                Connection conn = null;
                PreparedStatement stmt = null;
                ResultSet rs = null;
                boolean hasEvents = false;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/EP", "root", "2004@Ayyappa");

                    // Retrieve userId from session
                    HttpSession sessionObj = request.getSession();
                    int userId = (int) sessionObj.getAttribute("userId"); // Assuming userId is stored as an integer

                    String sql = "SELECT e.event_name, r.attendance FROM registrations r JOIN events e ON r.event_id = e.event_id WHERE r.user_id = ?";
                    stmt = conn.prepareStatement(sql);
                    stmt.setInt(1, userId);
                    rs = stmt.executeQuery();

                    while (rs.next()) {
                        hasEvents = true;
                        String eventName = rs.getString("event_name");
                        String attendance = rs.getString("attendance");
            %>
            <tr>
                <td><%= eventName %></td>
                <td><%= attendance %></td>
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
                if (!hasEvents) {
            %>
            <tr>
                <td colspan="2">No registered events available.</td>
            </tr>
            <%
                }
            %>
        </table>
    </div>
     <script>     const btn = document.querySelector(".btn");
        

        btn.addEventListener("click",()=>{
       
            document.body.classList.toggle("active")
        })
        </script>
</body>
</html>
