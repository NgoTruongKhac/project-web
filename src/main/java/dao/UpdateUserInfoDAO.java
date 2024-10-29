package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import database.ConnectDatabase;
import entity.UserUpdate;

public class UpdateUserInfoDAO {
	
	private Connection conn;
	private ConnectDatabase db;
	
	public boolean isUpdate(UserUpdate userUpdate, int userId) {
		boolean isUpdate=false;
		
		try {
			conn=db.getConnection();
			
			String sql="UPDATE account SET firstName=?,lastName=?, sex=?, birthday=?, avatar=? where userId=?;"; 
			
			PreparedStatement pr = conn.prepareStatement(sql);
			pr.setString(1, userUpdate.getFirstName());
			pr.setString(2, userUpdate.getLastName());
			pr.setString(3, userUpdate.getSex());
			pr.setDate(4, userUpdate.getBirthday());
			pr.setString(5, userUpdate.getAvatar());
			pr.setInt(6, userId);
			
			int i=pr.executeUpdate();
			
			if(i==1) {
				isUpdate=true;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return isUpdate;
	}

}
