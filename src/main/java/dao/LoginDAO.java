package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import bcrypt.BCrypt;
import database.ConnectDatabase;
import entity.User;

public class LoginDAO {

	private Connection conn;
	private ConnectDatabase db;

	public User isSuccess(String emailOrPhone, String pass) {
		// TODO Auto-generated method stub
		User user=null;
		

		try {
			
			conn = db.getConnection();
			String SQLLogin = "SELECT * FROM account WHERE email = ? or phoneNumber= ?";
			PreparedStatement pr = conn.prepareStatement(SQLLogin);

			// Gán giá trị cho các tham số
			pr.setString(1, emailOrPhone);
			pr.setString(2, emailOrPhone);
			

			// Sử dụng executeQuery() để thực hiện câu lệnh SELECT
			ResultSet rs = pr.executeQuery();

			// Kiểm tra nếu có kết quả trả về, nghĩa là đăng nhập thành công
			if (rs.next()) {
				String hashedPass=rs.getString("pass");
				
				if(BCrypt.checkpw(pass, hashedPass)) {
					user=new User(rs.getString(2), rs.getString(3), "", rs.getString(5), rs.getString(6), "");
					user.setUserId(rs.getInt(1));
					user.setSex(rs.getString(9));
					user.setBirthday(rs.getDate(10));
					user.setAvatar(rs.getString(11));
					user.setRole(rs.getString(12));
				}
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		
		}
		return user;
	}
	
	

}
