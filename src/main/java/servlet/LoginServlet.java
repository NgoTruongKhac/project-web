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
				// Chuyển hướng đến trang index.jsp
				resp.sendRedirect("authorization");


			} else {
				req.setAttribute("message", "mật khẩu hoặc email/sđt không đúng!");
				req.setAttribute("type", "error");
				req.setAttribute("error", "login");
				req.getRequestDispatcher("index.jsp").include(req, resp);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}

}
