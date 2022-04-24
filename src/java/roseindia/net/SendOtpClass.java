/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package roseindia.net;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author Senet
 */
public class SendOtpClass {
    
    public static void sendMail(final String from,final String password,String to,String sub,String msg){  
          //Get properties object 
        
          
          Properties props = new Properties();    
          props.put("mail.smtp.host", "smtp.gmail.com");    
          props.put("mail.smtp.socketFactory.port", "465");    
          props.put("mail.smtp.socketFactory.class",    
                    "javax.net.ssl.SSLSocketFactory");    
          props.put("mail.smtp.auth", "true");    
          props.put("mail.smtp.port", "465"); 
          props.put("mail.smtp.starttls.enable", "true");
          //get Session   
          Session session = Session.getDefaultInstance(props,    
           new javax.mail.Authenticator() { 
            
           @Override
           protected PasswordAuthentication getPasswordAuthentication() {    
           return new PasswordAuthentication(from,password);  
           }    
          });    
          //compose message    
          try {    
           MimeMessage message = new MimeMessage(session);    
           message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));    
           message.setSubject(sub);    
           message.setText(msg);   
           message.setContent(msg, "text/html");
           //send message  
           Transport.send(message);    
           System.out.println("message sent successfully");    
          } catch (MessagingException e) {throw new RuntimeException(e);}    
      
    }
    
        public static void main(String[] args) {
        String message;
        message="we are testing the eis mail"; 
        SendOtpClass aa= new SendOtpClass();
        aa.sendMail("eis.dcmsme@gmail.com", "987456321a", "rgvjee@gmail.com", "test", message);
        System.out.println("message sent successfully");
    }
    
}
