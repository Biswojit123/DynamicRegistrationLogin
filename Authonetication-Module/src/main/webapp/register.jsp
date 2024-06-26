<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register page</title>
<!-- Bootstrap CDN -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<!-- Font awesome CDN-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- Include the CSS file -->
<link rel="stylesheet" href="CSS/style.css">
</head>
<body class="body-content">
	<!-- NavBar -->
	<nav class="navbar navbar-expand-lg navbar-light bg-custom">
		<a class="navbar-brand" href="#">NavBar</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="#">Home
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="login.jsp">Login</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="register.jsp">Register</a>
				</li>
			</ul>
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="search"
					placeholder="Search" aria-label="Search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>
	</nav>
	<!-- End of NavBar -->

	<!-- Registration card -->
	<div class="container mt-4">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-header text-center c-custom text-white">
						<i class="fa fa-user-circle-o"></i>
						<h5>Registration Page</h5>
					</div>

					<%
					String regMsg = (String) session.getAttribute("reg-msg");

					if (regMsg != null) {
					%>
					<!-- Alert message provided -->
					<div class="alert alert-success" role="alert"><%=regMsg%>Login...<a
							href="login.jsp">Click here</a>
					</div>

					<%
						session.removeAttribute("reg-msg");
					} 
					%>
					
					<!-- Error Occur-->
					<%
					String msgError = (String)session.getAttribute("error-msg");
					
					if(msgError != null) {
					%>
						<div class="alert alert-danger" role="alert"><%=msgError%></div>
					<% 
					session.removeAttribute("error-msg");
					}
					%>
			



					<div class="card-body">
						<form action="register" method="POST">
							<div class="form-group">
								<label for="exampleInputEmail1">Full name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter name"
									name="name">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email"
									name="email">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Password" name="password">
							</div>

							<button type="submit"
								class="btn btn-primary btn-block badge-pill">Register</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Registration card end -->

</body>
</html>