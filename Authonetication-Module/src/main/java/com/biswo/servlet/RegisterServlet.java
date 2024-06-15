package com.biswo.servlet;

import java.io.IOException;

import com.biswo.beans.User;
import com.biswo.dao.DataAccessClass;
import com.biswo.factory.DataAccessObject;
import com.biswo.factory.UserObjectAccess;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/register")
@SuppressWarnings("serial")
public class RegisterServlet extends HttpServlet {
	

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Get the form value
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		//Get the user object to set the value 
		User us = UserObjectAccess.getUserObject();
		
		//Set the Value to the user
		us.setName(name);
		us.setEmail(email);
		us.setPassword(password);
		
		//Get the DataAccess object
		DataAccessClass dac = DataAccessObject.getDataAccessObject();
		
		//Call the registration method for user registration
		boolean b = dac.registrationCall(us);
		
		if(b == true) {
			HttpSession session = request.getSession();
			session.setAttribute("reg-msg", "Registration Successfully.....");
			response.sendRedirect("register.jsp");
		}else {
			HttpSession session = request.getSession();
			session.setAttribute("error-msg", "User already exist Or Try Differently...");
			response.sendRedirect("register.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
	}

}
