package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bcrypt.BCrypt;
import database.ConnectDatabase;

public class ForgotPassDAO {

	private Connection conn;
	private ConnectDatabase db;

	public boolean isForgotPass(String email) {
		boolean isForgotPass = false;

		try {

			
			conn = db.getConnection();
			String sqlSelectEmail = "select * from account where email= ?;";

			PreparedStatement pr = conn.prepareStatement(sqlSelectEmail);

			pr.setString(1, email);
			ResultSet rs = pr.executeQuery();
			if (rs.next()) {
				isForgotPass  = true;
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return isForgotPass;
	}
	public boolean isChangePass(String newPass, String email) {
		boolean isChangePass=false;
		try {
			conn = db.getConnection();
			String hashNewPass=BCrypt.hashpw(newPass, BCrypt.gensalt());
			
			String sqlUpdatePass="update account set pass=? where email=?;";
			PreparedStatement pr=conn.prepareStatement(sqlUpdatePass);
			
			pr.setString(1, hashNewPass);
			pr.setString(2, email);
			
			int i=pr.executeUpdate();
			
			if(i==1) {
				isChangePass=true;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return isChangePass;
		
	}

}
