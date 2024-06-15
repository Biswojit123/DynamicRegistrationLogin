package com.biswo.factory;


import java.sql.Connection;
import java.sql.DriverManager;

public class DBconnector {
	private static Connection con;
	
	//static block execute to load and connection
	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/loginpage2","root","Bishnu@123");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public static Connection getConnection() {
		return con;
	}
	
	public static void closeCon() {
		try {
            con.close();
        }catch(Exception e) {
            e.printStackTrace();
        }
	}
}
