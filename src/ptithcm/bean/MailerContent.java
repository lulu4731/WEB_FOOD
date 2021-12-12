package ptithcm.bean;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service("mailerContent")
public class MailerContent {
	@Autowired
	JavaMailSender mailer;

	public void send(String from, String to, String subject, String body) {
		try {
			MimeMessage mail = mailer.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(mail, true, "utf-8");

			String htmlMsg = "<h3>Đơn hàng quý khách đã giao. Cảm ơn bạn đã đặt món ăn của chúng tôi. Chúc bạn ngon miệng.</h3>"
	                +"<img src='https://file.vfo.vn/hinh/2014/12/thank-you-8.jpg'>";
			
			helper.setFrom(from, from);
			helper.setTo(to);
			helper.setReplyTo(from, from);
			helper.setSubject(subject);
			helper.setText(body + htmlMsg, true);

			mailer.send(mail);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}
