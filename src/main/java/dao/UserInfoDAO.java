package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bcrypt.BCrypt;
import database.ConnectDatabase;
import entity.User;

public class UserInfoDAO {

	private Connection conn;
	private ConnectDatabase db;

	public User userInfo(int userId) {
		// TODO Auto-generated method stub
		User user = null;

		try {

			conn = db.getConnection();
			String SQLLogin = "SELECT * FROM account WHERE userId=?";
			PreparedStatement pr = conn.prepareStatement(SQLLogin);

			// Gán giá trị cho các tham số
			pr.setInt(1, userId);

			// Sử dụng executeQuery() để thực hiện câu lệnh SELECT
			ResultSet rs = pr.executeQuery();

			// Kiểm tra nếu có kết quả trả về, nghĩa là đăng nhập thành công
			if (rs.next()) {

				user = new User(rs.getString(2), rs.getString(3), "", rs.getString(5), rs.getString(6), "");
				user.setUserId(rs.getInt(1));
				user.setSex(rs.getString(9));
				user.setBirthday(rs.getDate(10));
				user.setAvatar(rs.getString(11));
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();

		}
		return user;
	}

}
