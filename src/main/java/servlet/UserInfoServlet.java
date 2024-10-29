package servlet;

import java.io.IOException;
import java.util.List;

import dao.ListAddressDAO;
import dao.UserInfoDAO;
import entity.Address;
import entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/userInfo")
public class UserInfoServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub

		User user = (User) req.getSession().getAttribute("User");

		int userId = user.getUserId();
		
		UserInfoDAO userInfo=new UserInfoDAO();
		User userRefesh=userInfo.userInfo(userId);
		
		ListAddressDAO getListAddress=new ListAddressDAO();
		
		
		List<Address> listAddress=getListAddress.getListAddress(userId);
		
		req.getSession().setAttribute("ListAddress",listAddress);
		
		req.getSession().setAttribute("User",userRefesh);
		
		resp.sendRedirect("userInfo.jsp");

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, resp);
	}
	

}
