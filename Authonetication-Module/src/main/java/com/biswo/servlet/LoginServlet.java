package com.biswo.servlet;

import java.io.IOException;

import com.biswo.beans.User;
import com.biswo.dao.DataAccessClass;
import com.biswo.factory.DataAccessObject;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//Get the Parameter data from the Form 
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		//Get the User DAO class 
		DataAccessClass das = DataAccessObject.getDataAccessObject();
		User us = das.getLoginCall(email,password);
		
		if(us != null) {
			HttpSession session = request.getSession();
			session.setAttribute("user-msg", us);
			response.sendRedirect("home.jsp");
		}else {
			HttpSession session = request.getSession();
			session.setAttribute("error-msg", "Invalide email And Password...");
			response.sendRedirect("login.jsp");
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
