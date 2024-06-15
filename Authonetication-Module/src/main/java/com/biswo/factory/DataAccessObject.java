package com.biswo.factory;

import com.biswo.dao.DataAccessClass;

public class DataAccessObject {
	//Get the Data Access class 
	private static DataAccessClass das ;
	
	//Declare the static block
	static {
		//Here we provide the connection object to the DataAccessClass
		das = new DataAccessClass(DBconnector.getConnection());
	}
	
	//Here we return the object
	public static DataAccessClass getDataAccessObject() {
		return das;
	}
}
