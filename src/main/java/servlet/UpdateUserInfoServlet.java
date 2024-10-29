package servlet;

import java.io.IOException;
import java.sql.Date;

import dao.UpdateUserInfoDAO;
import entity.User;
import entity.UserUpdate;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/updateUserInfo")
public class UpdateUserInfoServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub

		User user= (User) req.getSession().getAttribute("User");
		
		int userId=user.getUserId();

		String firstName = req.getParameter("firstName");
		String lastName = req.getParameter("lastName");

		String sex = req.getParameter("sex");

		String birthdayStr = req.getParameter("birthday");
		
		String avatarSrc=req.getParameter("avatarSrc");// khong lay duoc avatarSrc

		Date birthday = Date.valueOf(birthdayStr);

		UserUpdate userUpdate = new UserUpdate(firstName, lastName, sex, birthday, avatarSrc);

		UpdateUserInfoDAO updateUser = new UpdateUserInfoDAO();

		boolean isUpdate = updateUser.isUpdate(userUpdate, userId);

		if (isUpdate) {

			req.getSession().setAttribute("message", "Lưu thông tin thành công!");
			req.getSession().setAttribute("type", "success");
			 resp.sendRedirect(req.getContextPath()+"/userInfo");
		} else {
			req.getSession().setAttribute("message", "email hoặc số điện thoại đã được dùng");
			req.getSession().setAttribute("type", "error");
			req.getRequestDispatcher("/userInfo.jsp").forward(req, resp);
		}

	}

}
