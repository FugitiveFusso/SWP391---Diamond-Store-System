/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.khac.swp.fuj.controller;

import com.khac.swp.fuj.order.OrderDAO;
import com.khac.swp.fuj.order.OrderDTO;
import com.khac.swp.fuj.posts.PostDTO;
import com.khac.swp.fuj.ring.RingDTO;
import com.khac.swp.fuj.utils.DBUtils;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "SalesStaffOrderController", urlPatterns = {"/SalesStaffOrderController"})
public class SalesStaffOrderController extends HttpServlet {

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
            String keyword_a = request.getParameter("keyword_a");
            String keyword_b = request.getParameter("keyword_b");

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDate localDate = LocalDate.now();
            String purchasedDate = localDate.format(formatter);
            if (keyword_a == null) {
                keyword_a = "";
            }
            if (keyword_b == null) {
                keyword_b = "";
            }
            String sortCol = request.getParameter("colSort");
            if (sortCol == null) {
                sortCol = "";
            }
            String pageStrA = request.getParameter("pageA");
            String pageStrB = request.getParameter("pageB");

            int pageA = 1;
            int pageB = 1;
            if (pageStrA != null) {
                pageA = Integer.parseInt(pageStrA);
            }
            int pageSizeA = 10; // Set the number of orders per page for the first table
            if (pageStrB != null) {
                pageB = Integer.parseInt(pageStrB);
            }
            int pageSizeB = 10; // Set the number of orders per page for the second table
            OrderDAO orderDAO = new OrderDAO();
            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("salessession") == null) {
                response.sendRedirect("saleslogin.jsp");
                return;
            } else if (action == null || action.equals("list")) {//lists

                OrderDAO dao = new OrderDAO();
                int totalOrdersA = orderDAO.getTotalOrder(keyword_a);
                int totalPagesA = (int) Math.ceil((double) totalOrdersA / pageSizeA);

                if (pageA < 1) {
                    pageA = 1;
                } else if (pageA > totalPagesA) {
                    pageA = totalPagesA;
                }

                List<OrderDTO> listForSales = orderDAO.listForSales(keyword_a, pageA, pageSizeA);
                request.setAttribute("currentPageA", pageA);
                request.setAttribute("totalPagesA", totalPagesA);
                request.setAttribute("pageSizeA", pageSizeA);
                request.setAttribute("sortColA", sortCol);
                request.setAttribute("keyword_a", keyword_a);
                request.setAttribute("salesorderlist", listForSales);

// Handle pagination for the second table
                int totalOrdersB = orderDAO.getTotalOrderReceivedAtStore(keyword_b);
                int totalPagesB = (int) Math.ceil((double) totalOrdersB / pageSizeB);

                if (pageB < 1) {
                    pageB = 1;
                } else if (pageB > totalPagesB) {
                    pageB = totalPagesB;
                }

                List<OrderDTO> receiveAtStore = orderDAO.receivedAtStore(keyword_b, pageB, pageSizeB);
                request.setAttribute("currentPageB", pageB);
                request.setAttribute("totalPagesB", totalPagesB);
                request.setAttribute("pageSizeB", pageSizeB);
                request.setAttribute("sortColB", sortCol);
                request.setAttribute("keyword_b", keyword_b);
                request.setAttribute("receiveatstore", receiveAtStore);

                request.getRequestDispatcher("/salesstafforderlist.jsp").forward(request, response);

            } else if (action.equals("details")) {//details

                Integer id = null;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }

                OrderDTO order = null;
                if (id != null) {
                    order = orderDAO.load(id);
                }

                request.setAttribute("order", order);//object
                request.getRequestDispatcher("/cartdetails.jsp").forward(request, response);
            } else if (action.equals("accept")) {
                Integer orderID = null;
                try {
                    orderID = Integer.parseInt(request.getParameter("orderID"));
                } catch (NumberFormatException ex) {
                    log("Parameter orderID has wrong format.");
                }

                if (orderID != null ) {
                    try {
                                orderDAO.acceptOrder(orderID);
                                request.getSession().setAttribute("success", "Received order Successfully!!!");
                    } catch (Exception e) {
                        log("Error processing order with orderID " + orderID + ": " + e.getMessage());
                        request.getSession().setAttribute("errorMessage", "Error receiving order.");
                    }
                } else {
                    if (orderID == null) {
                        request.getSession().setAttribute("errorMessage", "Invalid order ID.");
                    } else {
                        request.getSession().setAttribute("errorMessage", "Invalid warranty ID.");
                    }
                }

                try {
                    int totalOrdersA = orderDAO.getTotalOrder(keyword_a);
                    int totalPagesA = (int) Math.ceil((double) totalOrdersA / pageSizeA);

                    if (pageA < 1) {
                        pageA = 1;
                    } else if (pageA > totalPagesA) {
                        pageA = totalPagesA;
                    }

                    List<OrderDTO> listForSales = orderDAO.listForSales(keyword_a, pageA, pageSizeA);
                    request.setAttribute("currentPageA", pageA);
                    request.setAttribute("totalPagesA", totalPagesA);
                    request.setAttribute("pageSizeA", pageSizeA);
                    request.setAttribute("sortColA", sortCol);
                    request.setAttribute("keyword_a", keyword_a);
                    request.setAttribute("salesorderlist", listForSales);

// Handle pagination for the second table
                    int totalOrdersB = orderDAO.getTotalOrderReceivedAtStore(keyword_b);
                    int totalPagesB = (int) Math.ceil((double) totalOrdersB / pageSizeB);

                    if (pageB < 1) {
                        pageB = 1;
                    } else if (pageB > totalPagesB) {
                        pageB = totalPagesB;
                    }

                    List<OrderDTO> receiveAtStore = orderDAO.receivedAtStore(keyword_b, pageB, pageSizeB);
                    request.setAttribute("currentPageB", pageB);
                    request.setAttribute("totalPagesB", totalPagesB);
                    request.setAttribute("pageSizeB", pageSizeB);
                    request.setAttribute("sortColB", sortCol);
                    request.setAttribute("keyword_b", keyword_b);
                    request.setAttribute("receiveatstore", receiveAtStore);
                    request.getRequestDispatcher("/salesstafforderlist.jsp").forward(request, response);
                } catch (Exception e) {
                    log("Error forwarding to sales staff order list: " + e.getMessage());
                    request.getSession().setAttribute("errorMessage", "Error loading order list.");
                    response.sendRedirect("errorPage.jsp"); // Redirect to an error page if forwarding fails
                }
            } else if (action.equals("received")) {
                Integer orderID = null;
                try {
                    orderID = Integer.parseInt(request.getParameter("orderID"));
                } catch (NumberFormatException ex) {
                    log("Parameter orderID has wrong format.");
                }
                Integer ringID = null;
                try {
                    ringID = Integer.parseInt(request.getParameter("ringID"));
                } catch (NumberFormatException ex) {
                    log("Parameter ringID has wrong format.");
                }

                if (orderID != null) {
                    try {
                        orderDAO.receivedOrder(orderID);
                        orderDAO.updateWarranty(purchasedDate, ringID);
                        request.getSession().setAttribute("success", "Received order Successfully!!!");
                    } catch (Exception e) {
                        log("Error processing order with orderID " + orderID + ": " + e.getMessage());
                        request.getSession().setAttribute("errorMessage", "Error receiving order.");
                    }
                } else {
                    if (orderID == null) {
                        request.getSession().setAttribute("errorMessage", "Invalid order ID.");
                    }
                }

                try {
                    int totalOrdersA = orderDAO.getTotalOrder(keyword_a);
                    int totalPagesA = (int) Math.ceil((double) totalOrdersA / pageSizeA);

                    if (pageA < 1) {
                        pageA = 1;
                    } else if (pageA > totalPagesA) {
                        pageA = totalPagesA;
                    }

                    List<OrderDTO> listForSales = orderDAO.listForSales(keyword_a, pageA, pageSizeA);
                    request.setAttribute("currentPageA", pageA);
                    request.setAttribute("totalPagesA", totalPagesA);
                    request.setAttribute("pageSizeA", pageSizeA);
                    request.setAttribute("sortColA", sortCol);
                    request.setAttribute("keyword_a", keyword_a);
                    request.setAttribute("salesorderlist", listForSales);

// Handle pagination for the second table
                    int totalOrdersB = orderDAO.getTotalOrderReceivedAtStore(keyword_b);
                    int totalPagesB = (int) Math.ceil((double) totalOrdersB / pageSizeB);

                    if (pageB < 1) {
                        pageB = 1;
                    } else if (pageB > totalPagesB) {
                        pageB = totalPagesB;
                    }

                    List<OrderDTO> receiveAtStore = orderDAO.receivedAtStore(keyword_b, pageB, pageSizeB);
                    request.setAttribute("currentPageB", pageB);
                    request.setAttribute("totalPagesB", totalPagesB);
                    request.setAttribute("pageSizeB", pageSizeB);
                    request.setAttribute("sortColB", sortCol);
                    request.setAttribute("keyword_b", keyword_b);
                    request.setAttribute("receiveatstore", receiveAtStore);
                    request.getRequestDispatcher("/salesstafforderlist.jsp").forward(request, response);
                } catch (Exception e) {
                    log("Error forwarding to sales staff order list: " + e.getMessage());
                    request.getSession().setAttribute("errorMessage", "Error loading order list.");
                    response.sendRedirect("errorPage.jsp"); // Redirect to an error page if forwarding fails
                }
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
