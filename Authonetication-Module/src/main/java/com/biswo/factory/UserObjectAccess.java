package com.biswo.factory;

import com.biswo.beans.User;

public class UserObjectAccess {
	//Declare the private field as the User
	private static User us ;
	
	static {
		us = new User();
	}
	
	public static User getUserObject() {
		return us;
	}
}
