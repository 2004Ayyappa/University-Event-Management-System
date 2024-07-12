<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="css/login.css">
    <style>
    * {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}    
 .logo {
    top: 15px;
    right: 30px;  
}     
.logo a{
  right: 15px;
  font-size: 1.2rem;
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
        
</style>
  
</head>

<body>
    <div class = "navbar">
<h1>Welcome to the University Event Management System</h1>
 <div class="logo">
        <a href="studentLogin.jsp">Student</a>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <a href="adminLogin.jsp"> Admin</a>
      </div>
</div>
	<a href="https://front.codes/" class="logo" target="_blank">
		
	</a>

	<div class="section">
		<div class="container">
			<div class="row full-height justify-content-center">
				<div class="col-12 text-center align-self-center py-5">
					<div class="section pb-5 pt-5 pt-sm-2 text-center">
						<h5 class="mb-0 pb-3">
						<span>Student &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;       Admin</span></h5>
			          	<input class="checkbox" type="checkbox" id="reg-log" name="reg-log"/>
			          	<label for="reg-log"></label>
						<div class="card-3d-wrap mx-auto">
							<div class="card-3d-wrapper">
							<form action="LoginServlet" method="post">
								<div class="card-front">
									<div class="center-wrap">
										<div class="section text-center">
											<h4 class="mb-4 pb-3">Student Log In</h4>
											<div class="form-group" >
												<input type="text" name="username" class="form-style" placeholder="Your Username" id="username" autocomplete="off">
												<i class="input-icon uil uil-at"></i>
											</div>	
											<div class="form-group mt-2">
												<input type="password" name="password" class="form-style" placeholder="Your Password" id="password" autocomplete="off">
												<i class="input-icon uil uil-lock-alt"></i>
											</div>
											<input type="submit" class="btn mt-4" value="Login">
                            				<p class="mb-0 mt-4 text-center"><a href="forgotPassword.jsp" class="link">Forgot your password?</a></p>
				      					</div>
			      					</div>
			      				</div>
			      				</form>
			      				
								<div class="card-back">
									<div class="center-wrap">
									<form action="AdminLoginServlet" method="post">
										<div class="section text-center">
											<h4 class="mb-4 pb-3">Admin Log In</h4>
											<div class="form-group">
												<input type="text" name="username" class="form-style" placeholder="Your Username" id="username" autocomplete="off">
												<i class="input-icon uil uil-user"></i>
											</div>	
											
											<div class="form-group mt-2">
												<input type="password" name="password" class="form-style" placeholder="Your Password" id="password" autocomplete="off">
												<i class="input-icon uil uil-lock-alt"></i>
											</div>
											<input type="submit" class="btn mt-4" value="Login">
				      					</div>
				      					</form>
			      					</div>
			      					
			      				</div>
			      			</div>
			      		</div>
			      	</div>
		      	</div>
	      	</div>
	    </div>
	</div>

</body>
</html>
