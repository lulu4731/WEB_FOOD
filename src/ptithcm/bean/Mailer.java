package ptithcm.bean;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service("mailer")
public class Mailer {
	@Autowired
	JavaMailSender mailer;

	public void send(String from, String to, String subject, String body) {
		try {
			MimeMessage mail = mailer.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(mail, true, "utf-8");
			
			String htmlMsg = "<h3>Món ăn đã được giao. Chúc quý khách ngon miệng</h3>"
	                +"<img src='https://file.vfo.vn/hinh/2014/12/thank-you-8.jpg'>";
			
			helper.setFrom(from, from);
			helper.setTo(to);
			helper.setReplyTo(from, from);
			helper.setSubject(subject);
			if(body.equals("")) {
				helper.setText(body + htmlMsg, true);
			}else {
				helper.setText(body, true);
			}
			

			mailer.send(mail);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}
