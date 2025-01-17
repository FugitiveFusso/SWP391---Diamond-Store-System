package com.khac.swp.fuj.controller;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ForgotPassword
 */
@WebServlet("/forgotPassword")
public class ForgotPassword extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String email = request.getParameter("email");
        RequestDispatcher dispatcher = null;
        HttpSession mySession = request.getSession();

        if (email != null || !email.isEmpty()) {
            // sending otp
            Random rand = new Random();
            int otpvalue = rand.nextInt(900000) + 100000; //ensures the OTP will be between 100000 and 999999
            String otp = String.format("%06d", otpvalue);

            String to = email;// change accordingly
            // Get the session object
            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.socketFactory.port", "465");
            props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.port", "465");
            Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("fuj.khac.diamondshopsystem@gmail.com", "suqydpkcjupexdfe");// Put your email, email va gg app password
                    // id and
                    // password here
                }
            });
            // compose message
            try {
                MimeMessage message = new MimeMessage(session);
                message.setFrom(new InternetAddress(email));// change accordingly
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
                message.setSubject("FUJ: OTP for Reset Password");
                message.setText("YOUR OTP IS: " + otpvalue + ". PLEASE USE THIS CODE TO RESET YOUR PASSWORD IN OUR WEBSITE!\nDO NOT SHARE TO ANYONE ELSE!\n\nBest regards,\n\nFPTU Jewelry – KHAC Team\n\nFour students, Major in Software Engineering, FPT University of HCMC\n\nMobile: (+84) 898876512\n\nEmail: fuj.khac.diamondshopsystem@gmail.com\n\nGitHub: github.com/FugitiveFusso/SWP391-Diamond-Store-System\n\nFollow us on: Facebook | Twitter | LinkedIn\n\n");
                // send message
                Transport.send(message);
                System.out.println("message sent successfully");
            } catch (MessagingException e) {
                throw new RuntimeException(e);
            }
            dispatcher = request.getRequestDispatcher("EnterOtp.jsp");
            request.setAttribute("message", "OTP is sent to your email");
            //request.setAttribute("connection", con);
            mySession.setAttribute("otp", otpvalue);
            mySession.setAttribute("email", email);
            dispatcher.forward(request, response);
            //request.setAttribute("status", "success");
        }

    }

}
