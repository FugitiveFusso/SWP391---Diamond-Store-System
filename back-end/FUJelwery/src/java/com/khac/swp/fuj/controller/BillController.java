/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.khac.swp.fuj.controller;

import com.khac.swp.fuj.order.OrderDAO;
import com.khac.swp.fuj.order.OrderDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
@WebServlet(name = "BillController", urlPatterns = {"/BillController"})
public class BillController extends HttpServlet {

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
            } else if (action == null || action.equals("list")) {
                Integer id = null;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }

                if (id != null) {
                    // Pagination for history receive at store
                    String pageStrA = request.getParameter("pageA");
                    int pageA = (pageStrA != null) ? Integer.parseInt(pageStrA) : 1;
                    int pageSizeA = 5; // Number of orders per page for receive at store

                    int totalOrdersA = orderDAO.getTotalOrderHistoryReceiveAtStore(id);
                    int totalPagesA = (int) Math.ceil((double) totalOrdersA / pageSizeA);

                    if (pageA < 1) {
                        pageA = 1;
                    } else if (pageA > totalPagesA) {
                        pageA = totalPagesA;
                    }

                    List<OrderDTO> listReceive = orderDAO.listHistoryReceiveAtStore(id, pageA, pageSizeA);

                    // Pagination for history delivery
                    String pageStrB = request.getParameter("pageB");
                    int pageB = (pageStrB != null) ? Integer.parseInt(pageStrB) : 1;
                    int pageSizeB = 5; // Number of orders per page for delivery

                    int totalOrdersB = orderDAO.getTotalOrderHistoryDelivery(id);
                    int totalPagesB = (int) Math.ceil((double) totalOrdersB / pageSizeB);

                    if (pageB < 1) {
                        pageB = 1;
                    } else if (pageB > totalPagesB) {
                        pageB = totalPagesB;
                    }

                    List<OrderDTO> listDelivery = orderDAO.listHistoryDelivery(id, pageB, pageSizeB);

                    // Set attributes for both paginations
                    request.setAttribute("currentPageA", pageA);
                    request.setAttribute("totalPagesA", totalPagesA);
                    request.setAttribute("pageSizeA", pageSizeA);
                    request.setAttribute("listreceive", listReceive);
                    request.setAttribute("id", id);

                    request.setAttribute("currentPageB", pageB);
                    request.setAttribute("totalPagesB", totalPagesB);
                    request.setAttribute("pageSizeB", pageSizeB);
                    request.setAttribute("listdelivery", listDelivery);
                }

                request.getRequestDispatcher("/user_accountdetails_orderhistory.jsp").forward(request, response);
            } else if (action.equals("detailsprocess_store")) {//details

                Integer id = null;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }

                OrderDTO bill = null;
                if (id != null) {
                    bill = orderDAO.loadBillProcessDetails(id);
                }

                request.setAttribute("bill", bill);//object
                request.getRequestDispatcher("/billlprocessdetails_store.jsp").forward(request, response);

            } else if (action.equals("detailsprocess_home")) {//details

                Integer id = null;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }

                OrderDTO bill = null;
                if (id != null) {
                    bill = orderDAO.loadBillProcessDetails(id);
                }

                request.setAttribute("bill", bill);//object
                request.getRequestDispatcher("/billlprocessdetails_home.jsp").forward(request, response);

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
