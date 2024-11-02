package servlet;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.UUID;

import bcrypt.BCrypt;
import dao.RegisterDAO;
import email.EmailUtil;
import entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import sms.SmsUtil;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub

		try {

			String firstName = req.getParameter("firstName");
			String lastName = req.getParameter("lastName");
			String pass = req.getParameter("pass");
			String emailOrPhone = req.getParameter("emailOrPhone");
			String confirmPass = req.getParameter("confirmPass");

			if (!pass.equals(confirmPass)) {

				req.setAttribute("message", "Mật khẩu không trùng khớp!");
				req.setAttribute("type", "error");
				req.setAttribute("error", "register");
				req.getRequestDispatcher("index.jsp").forward(req, resp);
				return;

			}

			String verificationCode = String.valueOf((int) (Math.random() * 900000) + 100000);
			String verificationSMS = String.valueOf((int) (Math.random() * 900000) + 100000);

//			User user = new User(userName, hashedPassword, email, verificationCode);

			RegisterDAO register = new RegisterDAO();

			boolean isRegister = register.isSuccess(emailOrPhone);
//
			if (isRegister) {

				if (isEmail(emailOrPhone)) {

					String subject = "Mã xác nhận đăng ký";

					EmailUtil.sendEmail(emailOrPhone, subject, verificationCode);

					req.getSession().setAttribute("verificationTime", System.currentTimeMillis());
					req.getSession().setAttribute("verificationCode", verificationCode);
					req.getSession().setAttribute("firstName", firstName);
					req.getSession().setAttribute("lastName", lastName);
					req.getSession().setAttribute("email", emailOrPhone);
					req.getSession().setAttribute("pass", pass);

					req.getRequestDispatcher("verify.jsp").forward(req, resp);

				}

				if (isPhoneNumber(emailOrPhone)) {
					
					SmsUtil.sendSms(emailOrPhone, verificationSMS);

					req.getSession().setAttribute("verificationTime", System.currentTimeMillis());
					req.getSession().setAttribute("verificationSMS", verificationSMS);
					req.getSession().setAttribute("firstName", firstName);
					req.getSession().setAttribute("lastName", lastName);
					req.getSession().setAttribute("phoneNumber", emailOrPhone);
					req.getSession().setAttribute("pass", pass);

					req.getRequestDispatcher("verifyOTP.jsp").forward(req, resp);

				}

			}

			req.setAttribute("message", "email/số điện thoại không đúng hoặc đã được sử dụng");
			req.setAttribute("type", "error");
			req.setAttribute("error", "register");
			req.getRequestDispatcher("index.jsp").forward(req, resp);
			

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}

	// Kiểm tra định dạng email
	private boolean isEmail(String input) {
		String emailRegex = "^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$";
		return input.matches(emailRegex);
	}

	// Kiểm tra định dạng số điện thoại
	private boolean isPhoneNumber(String input) {
		String phoneRegex = "^[+]?\\d{10,15}$";
		return input.matches(phoneRegex);
	}

}
