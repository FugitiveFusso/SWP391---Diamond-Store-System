/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.khac.swp.fuj.controller;

import com.khac.swp.fuj.order.OrderDAO;
import com.khac.swp.fuj.order.OrderDTO;
import com.khac.swp.fuj.ring.RingDTO;
import com.khac.swp.fuj.utils.DBUtils;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.List;
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
@WebServlet(name = "OrderController", urlPatterns = {"/OrderController"})
public class OrderController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String action = request.getParameter("action");
            String keyword = request.getParameter("keyword");
            if (keyword == null) {
                keyword = "";
            }
            String sortCol = request.getParameter("colSort");

            OrderDAO orderDAO = new OrderDAO();
            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("usersession") == null) {
                response.sendRedirect("userlogin.jsp");
                return;
            } else if (action == null || action.equals("list")) {//lists
                Integer id = null;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }
                if (id != null) {
                    OrderDAO dao = new OrderDAO();
                    List<OrderDTO> list = dao.list(id);
                    request.setAttribute("cartlist", list);
                }

                request.getRequestDispatcher("/cartlist.jsp").forward(request, response);

            } else if (action.equals("update")) {//update
                Integer orderID = null;
                try {
                    orderID = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter ringSize has wrong format.");
                }

                Integer ringSize = null;
                try {
                    ringSize = Integer.parseInt(request.getParameter("ringSize"));
                } catch (NumberFormatException ex) {
                    log("Parameter ringSize has wrong format.");
                }

                OrderDTO order = null;
                if (orderID != null) {
                    order = orderDAO.load(orderID);
                }
                order.setOrderID(orderID);
                order.setRingSize(ringSize);

                orderDAO.update(order);
                request.setAttribute("order", order);
                RequestDispatcher rd = request.getRequestDispatcher("cartdetails.jsp");
                rd.forward(request, response);

            } else if (action.equals("purchase")) {//purchase
                Integer orderID = null;
                try {
                    orderID = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter ringSize has wrong format.");
                }

                String status = "purchased";

                OrderDTO order = null;
                if (orderID != null) {
                    order = orderDAO.load(orderID);
                }
                order.setOrderID(orderID);
                order.setStatus(status);

                orderDAO.update(order);
                request.setAttribute("order", order);
                RequestDispatcher rd = request.getRequestDispatcher("cartdetails.jsp");
                rd.forward(request, response);

            } else if (action.equals("delete")) {
                Integer id = null;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }

                if (id != null) {
                    try {
                        orderDAO.delete(id);
                        request.getSession().setAttribute("success", "Delete Successfully!!!");
                    } catch (Exception e) {
                        log("Error deleting order: " + e.getMessage());
                        request.getSession().setAttribute("errorMessage", "Error deleting order.");
                    }
                } else {
                    request.getSession().setAttribute("errorMessage", "Invalid order ID.");
                }

                response.sendRedirect(request.getContextPath() + "/user_homepage.jsp");
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
