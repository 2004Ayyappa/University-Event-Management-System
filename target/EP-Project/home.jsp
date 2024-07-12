<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
    <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>    
    @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@100;300;400;500;600;700&display=swap");
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
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
	top: 12px;
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
        }</style>
       
</head>

<body>
    <div class = "navbar">
<h1>Welcome to the University Event Management System</h1>
  <div class="logo">
        <a href="profile.jsp">Profile</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="LogoutServlet">Logout<i class="fa fa-sign-out" style="font-size:25px"></i></a>
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
         <script>     const btn = document.querySelector(".btn");
        

        btn.addEventListener("click",()=>{
       
            document.body.classList.toggle("active")
        })
        </script>
</body>
</html>