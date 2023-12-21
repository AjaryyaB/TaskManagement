package com.tms.utils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

import com.tms.exception.EmailException;

@Component
public class EmailSender {

	@Autowired
	private JavaMailSender javaMailSender;

	@Autowired
	private OtpGenerator otpGen;
	

	public String sendEmailforOtp(String to) throws EmailException {
		try {
			SimpleMailMessage message = new SimpleMailMessage();
			message.setTo(to);
			message.setSubject("otp for forgot password");
			String otp = otpGen.getOtp();
			message.setText("otp : " + otp);
			javaMailSender.send(message);
			return otp;
		} catch (MailException e) {
			throw new EmailException("Error sending email", e);
		}
	}

	public String sendConfirmationEmail(String to,String subject,String text) {
		try {
			SimpleMailMessage message = new SimpleMailMessage();
			message.setTo(to);
			message.setSubject(subject);
			message.setText(text);
			javaMailSender.send(message);
			return "Confirmation Email Sent..!";
		} catch (MailException e) {
			throw new EmailException("Error sending email", e);
		}
	}
}

