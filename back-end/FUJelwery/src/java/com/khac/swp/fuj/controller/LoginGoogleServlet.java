/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.khac.swp.fuj.controller;

import com.khac.swp.fuj.logingoogle.GooglePojo;
import com.khac.swp.fuj.logingoogle.GoogleUtils;
import com.khac.swp.fuj.users.UserDAO;
import com.khac.swp.fuj.users.UserDTO;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Dell
 */
@WebServlet(name = "LoginGoogleServlet", urlPatterns = {"/LoginGoogleServlet"})
public class LoginGoogleServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public LoginGoogleServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String code = request.getParameter("code");
        if (code == null || code.isEmpty()) {
            RequestDispatcher dis = request.getRequestDispatcher("userlogin.jsp");
            dis.forward(request, response);
        } else {
            String accessToken = GoogleUtils.getToken(code);
            GooglePojo googlePojo = GoogleUtils.getUserInfo(accessToken);
            request.setAttribute("id", googlePojo.getId());
            String email = googlePojo.getEmail();
            UserDAO dao = new UserDAO();
            UserDTO dto = dao.checkAccountExistByGoogle(email);
            if (dto != null) {
                dto = dao.checkAccountExistByGoogleActive(email);
                if (dto != null) {
                    HttpSession session = request.getSession(true);
                    session.setAttribute("usersession", dto);
                    response.sendRedirect("./user_homepage.jsp");
                } else {
                    request.setAttribute("error", "Your account is banned! Please contact Shop or Register new account!");
                    RequestDispatcher rd = request.getRequestDispatcher("userlogin.jsp");
                    rd.forward(request, response);
                }
            } else {
                request.setAttribute("error", "Your gmail is not signed in! Please try again");
                RequestDispatcher rd = request.getRequestDispatcher("userlogin.jsp");
                rd.forward(request, response);
            }

        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
