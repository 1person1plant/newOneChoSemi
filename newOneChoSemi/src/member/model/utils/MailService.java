package member.model.utils;

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

public class MailService {

   private final String USER = "onebunonecho@gmail.com";   // 운영자의 이메일 아이디
   private final String PASSWORD = "Onecho1234";      // 운영자의 이메일 비밀번호

   /*
  		1. Properties -  Java Build Path - Libraries - Add JARs - javax.mail 추가
		
		-> 네이버 메일
		2.1) 네이버 내 메일함 톱니바퀴 - 메일함 관리 - IMAP/SMTP - 사용함 체크
		-> gmail 설정 법
		2.2) gmail 설정 - > 전달 및 POP/IMAP -> IMAP 액세스에서 IMAP 사용 체크
		
		3. 전역변수 USER랑 PASSWORD : 운영자의 네이버 로그인 (이메일/비번)
		(테스트할때만 맞춰놓고 지워두거나 바꿔두기 ==> 깃허브 조심!!)
    */
   
   public MailService(){}
   
   /**
    * 받는사람의 이메일 주소
    * @param email 비밀번호를 찾는 사람의 이메일
    * @param pwd 랜덤으로 임시비밀번호를 만들어 넣은 값
    */
   public void sendMail(String email, String pwd) throws Exception{
      // 이메일 사용을 위해 필요한 속성값들
      Properties prop = new Properties();
//    prop.put("mail.smtp.host", "smtp.naver.com"); // 구글일 경우 smtp.google.com
//    prop.put("mail.smtp.port", 587);           	// 네이버일 경우 465
      prop.put("mail.smtp.host", "smtp.gmail.com"); // 구글일 경우 smtp.google.com
      prop.put("mail.smtp.port", 465);           	// 구글일 경우 465
      prop.put("mail.smtp.auth", "true");
      prop.put("mail.smtp.ssl.enable", "true");		// 구글은 이거 추가해야함
      
      // SSL 사용하고 있을 경우 선택할 수 있는 옵션 인듯 하다
//      prop.put("mail.smtp.ssl.enable", "true");
//      prop.put("mail.smtp.ssl.trust", "smtp.naver.com");

      // 이메일 사용자 세션 인증
      Session ses = Session.getDefaultInstance(prop, new Authenticator(){
         
         @Override
         protected PasswordAuthentication getPasswordAuthentication(){
            return new PasswordAuthentication(USER, PASSWORD);
         }
      });

         MimeMessage msg = new MimeMessage(ses);
         msg.setFrom(new InternetAddress(USER));
         
         msg.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
         
         msg.setSubject("[일분일초] 임시 비밀번호가 발급되었습니다");    // 메일 제목
         
         msg.setText(" [ " + "임시 비밀번호 : " + pwd + " ]  * 반드시 비밀번호를 변경하여 사용하세요.");	// 메일 내용
         
         Transport.send(msg);      // 메일 전송 
   }
}