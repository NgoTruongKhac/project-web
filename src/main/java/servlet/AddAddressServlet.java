package servlet;

import java.io.IOException;

import dao.AddAddressDAO;
import entity.Address;
import entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/addAddress")
public class AddAddressServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String nameAddress = req.getParameter("nameAddress");
		String province = req.getParameter("province");
		String district = req.getParameter("district");
		String ward = req.getParameter("ward");
		String street = req.getParameter("street");
		String isDefaultParam = req.getParameter("isDefault");

		boolean isDefault = (isDefaultParam != null);

		User user = (User) req.getSession().getAttribute("User");

		int userId = user.getUserId();

		Address address = new Address(nameAddress, province, district, ward, street, isDefault);

		AddAddressDAO addAddress = new AddAddressDAO();
		boolean isAdd = addAddress.addAddress(address, userId);

		if (isAdd) {
			req.getSession().setAttribute("message", "Thêm địa chỉ thành công");
			req.getSession().setAttribute("type", "success");
			resp.sendRedirect(req.getContextPath()+"/userInfo");
		}

	}

}
