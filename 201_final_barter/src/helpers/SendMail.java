package helpers;

import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMail {
	public void send(String firstName, String lastName, String email, String inquiry){
		final String username = "gannys.wicked@gmail.com";
        final String password = "SILLY786059650";

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props,
          new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
          });

        try {

            Message message = new MimeMessage(session);
            try {
				message.setFrom(new InternetAddress("qingshen@gmail.com", "Attention Barter!"));
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            message.addRecipients(Message.RecipientType.CC, InternetAddress.parse("gannys_h@outlook.com, nathan98chang@gmail.com, reedbarnes98@gmail.com, miglani_srishti@yahoo.com"));
            
            message.setSubject("User Feedback");
            message.setText("User feedback from: \n" + 
            		firstName + " " + lastName + "\n" +
            		"Email: " + email + "\n" + 
            		"Inquiry: " + inquiry);

            Transport.send(message);

            System.out.println("Done");

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
	}
}
