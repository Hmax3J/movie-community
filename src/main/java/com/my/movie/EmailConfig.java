package com.my.movie;

import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

@Configuration
public class EmailConfig{
	
    @Bean
    public JavaMailSender javaMailService() {
        JavaMailSenderImpl javaMailSender = new JavaMailSenderImpl();

        javaMailSender.setHost("smtp.naver.com"); // SMTP 서버 주소
        javaMailSender.setUsername("dlwodnjsdlek123@naver.com"); // 설정(발신) 메일 아이디
        javaMailSender.setPassword("dlwodnjsdlek"); // 설정(발신) 메일 패스워드
        javaMailSender.setPort(465); //SMTP port
        javaMailSender.setJavaMailProperties(getMailProperties()); // 메일 인증서버 정보 가져온다.
        javaMailSender.setDefaultEncoding("UTF-8");
        return javaMailSender;
    }

    private Properties getMailProperties() {
        Properties properties = new Properties();
        properties.setProperty("mail.transport.protocol", "smtp"); // 프로토콜 설정
        properties.setProperty("mail.smtp.auth", "true"); // SMTP 인증
        properties.setProperty("mail.smtp.starttls.enable", "true"); // SMTP startles 사용
        properties.setProperty("mail.debug", "true"); // 디버그 사용
        properties.setProperty("mail.smtp.ssl.trust","smtp.naver.com"); // SSL 인증 서버 주소
        properties.setProperty("mail.smtp.ssl.enable","true"); // SSL 사용
        properties.setProperty("mail.smtp.ssl.trust", "smtp.naver.com");
        return properties;
    }
}