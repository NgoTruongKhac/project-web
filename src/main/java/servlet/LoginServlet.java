package servlet;

import java.io.IOException;
import java.net.URLEncoder;

import dao.LoginDAO;
import entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// TODO Auto-generated method stub

		try {

			String emailOrPhone = req.getParameter("emailOrPhone");
			String pass = req.getParameter("pass");

			LoginDAO login = new LoginDAO();

			User user = login.isSuccess(emailOrPhone, pass);

			if (user!=null) {
				

				req.getSession().setAttribute("User", user);
				req.getSession().setAttribute("message", "Đăng Nhập thành công!");
				req.getSession().setAttribute("type", "success");

				// Chuyển hướng đến trang index.jsp
				resp.sendRedirect("index.jsp");


			} else {
				req.getSession().setAttribute("message", "mật khẩu hoặc email/sđt không đúng!");
				req.getSession().setAttribute("type", "error");
				req.getSession().setAttribute("error", "login");
				req.getRequestDispatcher("index.jsp").forward(req, resp);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}

}
