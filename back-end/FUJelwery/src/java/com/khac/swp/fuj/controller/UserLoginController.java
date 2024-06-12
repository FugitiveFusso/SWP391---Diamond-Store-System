package com.khac.swp.fuj.controller;

import com.khac.swp.fuj.users.UserDAO;
import com.khac.swp.fuj.users.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "UserLoginController", urlPatterns = {"/userlogin"})
public class UserLoginController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String action = request.getParameter("action");
            String username = request.getParameter("user");
            String password = request.getParameter("password");
            if (action == null || action.equals("login")) {
                UserDAO dao = new UserDAO();
                UserDTO user = dao.login(username, password, "Customer");
                if (user != null) {
                    user = dao.loginActive(username, password, "Customer");
                    if (user != null) {
                        HttpSession session = request.getSession(true);
                        session.setAttribute("usersession", user);
                        response.sendRedirect("./user_homepage.jsp");
                    } else {
                        request.setAttribute("error", "Your account is banned! Please contact Shop or Register new account!");
                        RequestDispatcher rd = request.getRequestDispatcher("userlogin.jsp");
                        rd.forward(request, response);
                    }
                } else {

                    request.setAttribute("error", "Your username or password is incorrect! Please try again");
                    RequestDispatcher rd = request.getRequestDispatcher("userlogin.jsp");
                    rd.forward(request, response);
                }

            } else if (action != null && action.equals("logout")) {
                HttpSession session = request.getSession(false);
                if (session != null) {
                    session.invalidate();
                }
                request.setAttribute("error", "Logout successfully");
                RequestDispatcher rd = request.getRequestDispatcher("userlogin.jsp");
                rd.forward(request, response);
            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
