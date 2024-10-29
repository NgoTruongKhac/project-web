package database;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectDatabase {
	
	private static final String DB_URL="jdbc:sqlserver://LAPTOP-INSKLJFB:1433;databaseName=LaptopStore;encrypt=false";
	private static final String USER="sa";
	private static final String PASS="123";
	
	public static Connection getConnection() {
		Connection conn=null;
		
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			conn=DriverManager.getConnection(DB_URL, USER, PASS);
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	return conn;
	}

	

}
