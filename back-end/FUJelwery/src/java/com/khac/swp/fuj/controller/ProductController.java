package com.khac.swp.fuj.controller;

import com.khac.swp.fuj.order.OrderDAO;
import com.khac.swp.fuj.order.OrderDTO;
import com.khac.swp.fuj.ring.RingDAO;
import com.khac.swp.fuj.ring.RingDTO;
import com.khac.swp.fuj.utils.DBUtils;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "ProductController", urlPatterns = {"/ProductController"})
public class ProductController extends HttpServlet {

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

            RingDAO ringDAO = new RingDAO();
            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("usersession") == null) {
                response.sendRedirect("userlogin.jsp");
                return;
            } else if (action == null || action.equals("list")) {//lists

                RingDAO dao = new RingDAO();
                List<RingDTO> list = dao.list(keyword, sortCol);
                request.setAttribute("productlist", list);

                request.getRequestDispatcher("/productlist.jsp").forward(request, response);

            } else if (action.equals("details")) {//details

                Integer id = null;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }

                RingDTO product = null;
                if (id != null) {
                    product = ringDAO.load(id);
                }

                request.setAttribute("product", product);//object
                request.getRequestDispatcher("/productdetails.jsp").forward(request, response);

            } else if(action.equals("buy")){
                Integer orderID = null;
                try {
                    orderID = Integer.parseInt(request.getParameter("orderID"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }
                
                Integer userID = null;
                try {
                    userID = Integer.parseInt(request.getParameter("userID"));
                } catch (NumberFormatException ex) {
                    log("Parameter ringID has wrong format.");
                }
                
                String orderDate = request.getParameter("orderDate");
                
                Integer ringID = null;
                try {
                    ringID = Integer.parseInt(request.getParameter("ringID"));
                } catch (NumberFormatException ex) {
                    log("Parameter ringID has wrong format.");
                }
                Integer voucherID = null;
                try {
                    voucherID = Integer.parseInt(request.getParameter("voucherID"));
                } catch (NumberFormatException ex) {
                    log("Parameter voucherID has wrong format.");
                }
                Integer ringSize = null;
                try {
                    voucherID = Integer.parseInt(request.getParameter("ringSize"));
                } catch (NumberFormatException ex) {
                    log("Parameter ringSize has wrong format.");
                }
                String status = "pending";
                String delivered = "none";
                
                OrderDAO dao = new OrderDAO();
                OrderDTO order = null;
                        if (order == null) {
                            order = new OrderDTO();
                            order.setOrderID(orderID);
                            order.setUserID(userID);
                            order.setOrderDate(orderDate);
                            order.setRingID(ringID);
                            order.setVoucherID(voucherID);
                            order.setRingSize(ringSize);
                            order.setStatus(status);
                            order.setDelivered(delivered);
                            request.setAttribute("order", order);
                            dao.insert(order);
                            request.setAttribute("success", "Added Successfully!!!");
                            RequestDispatcher rd = request.getRequestDispatcher("productdetails.jsp");
                            rd.forward(request, response);
                        } else {
                            request.setAttribute("error", "Your Diamond is not inserted by wrong Certificate ID");
                            RequestDispatcher rd = request.getRequestDispatcher("productdetails.jsp");
                            rd.forward(request, response);
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
