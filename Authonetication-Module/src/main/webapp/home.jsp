<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.biswo.beans.User" %>	

<%
	User us =(User) session.getAttribute("user-msg");
	
	//this code redirect to tyhe login page after logout
	if(us == null) {
		session.setAttribute("login-msg", "Please Login First");
		response.sendRedirect("login.jsp");
	}
	
%>






<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home page</title>
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
	
	<!-- Card content  -->
	<div class="container">
		<div class="row d-flex justify-content-center align-items-center mt-4">
			<div class="col-md-6">
				<div class="card">
				
				<%User user =(User) session.getAttribute("user-msg"); %>
				
				<%
					if(user != null) {
				%>	
					<div class="card-body">
						<h4>Name: <%= user.getName() %></h4>
						<h4>Email: <%= user.getEmail() %></h4>
						<div class="container text-center">
							<a class="btn btn-primary btn-lg text-white" href="logout">Logout</a>
						</div>
					</div>	
				<% 		
					}
				%>
				</div>
			</div>
		</div>
	</div>
	<!-- card content end -->
	
</body>
</html>