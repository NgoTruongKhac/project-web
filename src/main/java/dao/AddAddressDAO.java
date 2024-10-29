package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import database.ConnectDatabase;
import entity.Address;

public class AddAddressDAO {

	private Connection conn;
	private ConnectDatabase db;

	public boolean addAddress(Address address, int userId) {
		boolean isAdd = false;
		try {
			
			
			conn = db.getConnection();

			if (address.getIsDefault()) {
				// Cập nhật địa chỉ cũ thành không mặc định
				String updateSql = "UPDATE address SET isDefault = 0 WHERE userId = ? AND isDefault = 1;";
				PreparedStatement updatePr = conn.prepareStatement(updateSql);
				updatePr.setInt(1, userId);
				updatePr.executeUpdate();
			}

			
			String sql = "  insert into address (nameAddress,province,district,ward,street,isDefault,userId) values(?,?,?,?,?,?,?);";
			PreparedStatement pr = conn.prepareStatement(sql);
			pr.setString(1, address.getNameAddress());
			pr.setString(2, address.getProvince());
			pr.setString(3, address.getDistrict());
			pr.setString(4, address.getWard());
			pr.setString(5, address.getStreet());
			pr.setInt(6, address.getIsDefault() ? 1 : 0);
			pr.setInt(7, userId);

			int i = pr.executeUpdate();

			if (i == 1) {
				isAdd = true;
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return isAdd;
	}

}
