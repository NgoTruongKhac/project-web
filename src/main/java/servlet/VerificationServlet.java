package servlet;

import java.io.IOException;

import bcrypt.BCrypt;
import dao.ChangeEmailDAO;
import dao.ForgotPassDAO;
import dao.RegisterDAO;
import entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/verifyCode")
public class VerificationServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String verificationCode = (String) req.getSession().getAttribute("verificationCode");		
		String ConfirmverificationCode = req.getParameter("verificationCode");
		String email = (String) req.getSession().getAttribute("email");
		String firstName = (String) req.getSession().getAttribute("firstName");
		String lastName = (String) req.getSession().getAttribute("lastName");
		String pass = (String) req.getSession().getAttribute("pass");
		String hashedPassword = BCrypt.hashpw(pass, BCrypt.gensalt());

		User user = new User(firstName,lastName, hashedPassword, email, null, verificationCode);

		
		long verificationTime = (long) req.getSession().getAttribute("verificationTime");

		long currentTime = System.currentTimeMillis();

		if (currentTime - verificationTime > 300000) {

			req.getSession().setAttribute("message", "mã xác nhận đã hết hạn.");
			req.getSession().setAttribute("type", "error");
			req.getRequestDispatcher("verify.jsp").forward(req, resp);

			return;

		}

		if (!verificationCode.equals(ConfirmverificationCode) ) {
			req.getSession().setAttribute("message", "Mã xác nhận không đúng.");
			req.getSession().setAttribute("type", "error");
			req.getRequestDispatcher("verify.jsp").forward(req, resp);
			return;
		}
		

		RegisterDAO registerDAO = new RegisterDAO();
		


		boolean isVerified = registerDAO.verifyCode(user);
		

		if (isVerified) {

			req.getSession().setAttribute("message", "Đăng ký thành công! Bạn có thể đăng nhập.");
			req.getSession().setAttribute("type", "success");
			req.getRequestDispatcher("index.jsp").forward(req, resp);

		}


	}

}
