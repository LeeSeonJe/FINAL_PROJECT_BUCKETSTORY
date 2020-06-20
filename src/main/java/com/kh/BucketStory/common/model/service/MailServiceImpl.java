package com.kh.BucketStory.common.model.service;

import java.io.File;

import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class MailServiceImpl implements MailService {

	// MailService Interface 구현 클래스
	// org.springframework.mail.javamail.JavaMailSender
	private JavaMailSender javaMailSender;

	public void setJavaMailSender(JavaMailSender javaMailSender) {
		this.javaMailSender = javaMailSender;
	}

	@Override
	public boolean send(String subject, String text, String from, String to, String filePath) {
		// javax.mail.internet.MimeMessage
		MimeMessage message = javaMailSender.createMimeMessage();

		// org.springframework.mail.javamail.MimeMessageHelper
		MimeMessageHelper helper;
		try {
			helper = new MimeMessageHelper(message, true, "UTF-8");
			helper.setSubject(subject);
			helper.setText(text, true);
			helper.setFrom(from);
			helper.setTo(to);
			if (filePath != null) {
				File file = new File(filePath);
				if (file.exists()) {
					helper.addAttachment(file.getName(), new File(filePath));
				}
			}
			// 첨부 파일 처리
			javaMailSender.send(message);
			return true;
		} catch (javax.mail.MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
}