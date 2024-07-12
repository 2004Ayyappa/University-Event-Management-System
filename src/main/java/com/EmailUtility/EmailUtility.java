package com.EmailUtility;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailUtility {
    public static void sendEmail(String to, String subject, String content) {
        final String username = "swami.venigalla2004@gmail.com";
        final String password = "yron wugs otoy nvzd";

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com"); // SMTP server (e.g., smtp.gmail.com for Gmail)
        props.put("mail.smtp.port", "587"); // SMTP port (e.g., 587 for TLS, 465 for SSL)

        Session session = Session.getInstance(props,
          new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
          });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username)); // Sender's email address
            message.setRecipients(Message.RecipientType.TO,
                InternetAddress.parse(to)); // Recipient's email address
            message.setSubject(subject); // Subject of the email
            message.setText(content); // Content of the email

            Transport.send(message); // Send the email

            System.out.println("Email sent successfully.");

        } catch (MessagingException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }
}
