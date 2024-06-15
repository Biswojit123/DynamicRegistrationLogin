package com.biswo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.biswo.beans.User;

public class DataAccessClass {
	//Get the connection object
	private  Connection conn;

	public DataAccessClass(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean registrationCall(User us)  {
		//Initialize the boolean value
		boolean b = false;
		String query = "insert into user (name,email,pwd)values(?,?,?)";
		
		//Exception handling
		try(PreparedStatement pst = conn.prepareStatement(query);) {
			
			//Set the User data to the prepared statement
			pst.setString(1, us.getName());
			pst.setString(2, us.getEmail());
			pst.setString(3, us.getPassword());
			
			int rowCount = pst.executeUpdate();
			
			//Here check the data is inserted or not 
			if(rowCount > 0) {
				return b = true ;
			}
				
		}catch(SQLException e) {
			e.printStackTrace();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return b;
	}
	
	
	//Login implementation logic
	public User getLoginCall(String email,String password) {
		
		User us = null;
		
		String query = "Select * from user where email=? and pwd=?";
		
		try(PreparedStatement pst = conn.prepareStatement(query)) {
			
			pst.setString(1, email);
			pst.setString(2, password);
			
			try(ResultSet rs = pst.executeQuery();) {
				
				if(rs.next()) {
					us = new User(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4));
				}
				
			}	
			
		}catch(SQLException e) {
			e.printStackTrace();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return us;
	}
	
}
