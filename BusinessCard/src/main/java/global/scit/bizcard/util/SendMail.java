package global.scit.bizcard.util;

/*import java.net.Authenticator;*/
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMail { // 클래스 이름이랑 생성자 이름 맞추면 됩니당

	public SendMail() {
		super();
		// TODO Auto-generated constructor stub
	}

	private String my_id;// 보내는 사람
	private String my_Password;// 패스워드
	
	private String user; // 받을 사람
	private String title; // 제목
	private String message;// 내용

	private static int result=0;

	

		public SendMail(String my_id, String my_Password, String user, String title, String message) {
		this.my_id = my_id;
		this.my_Password = my_Password;
		
		this.user = user;
		this.title = title;
		this.message = message; 
		System.out.println("생성자초기 안에서 : id : "+my_id+"  pw : "+my_Password);
		Properties p = System.getProperties();
		p.put("mail.smtp.starttls.enable", "true"); // gmail은 무조건 true 고정
		p.put("mail.smtp.host", "smtp.gmail.com"); // smtp 서버 주소
		p.put("mail.smtp.auth", "true"); // gmail은 무조건 true 고정
		p.put("mail.smtp.port", "587"); // gmail 포트

		Authenticator auth = new MyAuthentication();
		
		// session 생성 및 MimeMessage생성
		/*Session session = Session.getDefaultInstance(p, auth);*/
		Session session = Session.getInstance(p, auth);
		MimeMessage msg = new MimeMessage(session);
		
		try {
			
			// 편지보낸시간
			msg.setSentDate(new Date());
			InternetAddress from = new InternetAddress();

			from = new InternetAddress(my_id);

			// 이메일 발신자
			msg.setFrom(from);

			// 이메일 수신자
			InternetAddress to = new InternetAddress(user);
			msg.setRecipient(Message.RecipientType.TO, to);

			// 이메일 제목
			msg.setSubject(title, "UTF-8");

			// 이메일 내용
			msg.setText(message, "UTF-8");

			// 이메일 헤더
			msg.setHeader("content-Type", "text/html");

			// 메일보내기

			Transport.send(msg);
			result=0;
			my_id=null;
			my_Password=null;
			
		} catch (AddressException addr_e) {
			System.out.println("메세지 틀립니다");
			my_id=null;
			my_Password=null;
			result = 1;
			addr_e.printStackTrace();
		} catch (MessagingException msg_e) {
			System.out.println("주소가 이상함");
			my_id=null;
			my_Password=null;
			msg_e.printStackTrace();
			result = 2;
		}
	}

	class MyAuthentication extends Authenticator {

		PasswordAuthentication pa;

		public MyAuthentication() {
			
			String id = my_id;// 구글 ID
			String pw = my_Password;// 구글 비밀번호
			
			// ID와 비밀번호를 입력한다.
			pa = new PasswordAuthentication(id, pw);
			
			
			id=null;
			pw=null;
					
			System.out.println("pa 안에서 : id : "+id+"  pw : "+pw);
			
			System.out.println(pa);
		}

		// 시스템에서 사용하는 인증정보
		public PasswordAuthentication getPasswordAuthentication() {
			return pa;
		}
	}
	@Override
	public String toString() {
		return "SendMail [my_id=" + my_id + ", my_Password=" + my_Password + ", user=" + user + ", title=" + title
				+ ", message=" + message + "]";
	}
	
	
	public static int sendResult(String my_id, String my_Password, String user, String title, String message) {
		
		
		SendMail sm = new SendMail(my_id, my_Password,user, title, message);
		
			System.out.println("만든 메일객체" + sm);
			return result;
	}
}