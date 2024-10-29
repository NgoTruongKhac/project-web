package email;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailUtil {

	public static void sendEmail(String recipientEmail, String subject, String messageBody) {
		String host = "smtp.gmail.com"; // SMTP của Gmail
		String from = "22130108@st.hcmuaf.edu.vn"; // Email của bạn
		String password = "gvrd ebra yxuq afiy"; // Mật khẩu ứng dụng hoặc mã xác thực

		Properties properties = System.getProperties();
		properties.put("mail.smtp.host", host);
		properties.put("mail.smtp.port", "587"); // Sử dụng cổng 587 cho STARTTLS
		properties.put("mail.smtp.starttls.enable", "true"); // Bật STARTTLS
		properties.put("mail.smtp.auth", "true");

		Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
			protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
				return new javax.mail.PasswordAuthentication(from, password);
			}
		});

		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(from));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(recipientEmail));
			message.setSubject(subject);
			
			//custom UI cho tin nhan email
			String htmlContent="<h2> Mã xác nhận của bạn là:   <span style='color: red; font-size: 30px'>"+messageBody+"</span></h2>";
			message.setContent(htmlContent,"text/html; charset=UTF-8");
			Transport.send(message);
				
		
		} catch (MessagingException mex) {
			mex.printStackTrace();
		}
		
	}
}
