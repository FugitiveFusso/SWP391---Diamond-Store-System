/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.khac.swp.fuj.controller;

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

/**
 *
 * @author Dell
 */
@WebServlet(name = "RingController", urlPatterns = {"/RingController"})
public class RingController extends HttpServlet {

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

            RingDAO ringDAO = new RingDAO();
            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("adminsession") == null) {
                response.sendRedirect("adminlogin.jsp");
                return;
            } else if (action == null || action.equals("list")) {//lists

                RingDAO dao = new RingDAO();
                List<RingDTO> list = dao.list(keyword, sortCol);
                request.setAttribute("ringlist", list);

                request.getRequestDispatcher("/ringlist.jsp").forward(request, response);

            }else if (action.equals("details")) {//details

                Integer id = null;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }

                RingDTO ring = null;
                if (id != null) {
                    ring = ringDAO.load(id);
                }

                request.setAttribute("ring", ring);//object
                RequestDispatcher rd = request.getRequestDispatcher("ringdetails.jsp");
                rd.forward(request, response);
            } else if (action.equals("edit")) {//edit
                Integer id = null;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }

                RingDTO ring = null;
                if (id != null) {
                    ring = ringDAO.load(id);
                }

                request.setAttribute("ring", ring);
                request.setAttribute("nextaction", "update");
                RequestDispatcher rd = request.getRequestDispatcher("ringedit.jsp");
                rd.forward(request, response);

            } else if (action.equals("create")) {//create
                RingDTO ring = new RingDTO();
                request.setAttribute("ring", ring);
                request.setAttribute("nextaction", "insert");
                RequestDispatcher rd = request.getRequestDispatcher("ringedit.jsp");
                rd.forward(request, response);

            } else if (action.equals("update")) {//update
                Integer ringid = null;
                try {
                    ringid = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }
                String ringName = request.getParameter("ringName");
                String ringImage = request.getParameter("ringImage");
                int diamondID = Integer.parseInt(request.getParameter("diamondID"));
                String gender = request.getParameter("gender");
                double price = Double.parseDouble(request.getParameter("price"));
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                int categoryID = Integer.parseInt(request.getParameter("categoryID"));
                int collectionID = Integer.parseInt(request.getParameter("collectionID"));

                RingDTO ring = null;
                if (ringid != null) {
                    ring = ringDAO.load(ringid);
                }
                    ring.setRingID(ringid);
                    ring.setRingName(ringName);
                    ring.setRingImage(ringImage);
                    ring.setDiamondID(diamondID);
                    ring.setGender(gender);
                    ring.setPrice(price);
                    ring.setQuantity(quantity);
                    ring.setCategoryID(categoryID);
                    ring.setCollectionID(collectionID);

                request.setAttribute("ring", ring);
                RequestDispatcher rd = request.getRequestDispatcher("ringdetails.jsp");
                rd.forward(request, response);

            } else if (action.equals("insert")) {//insert
                try {
                    Connection conn = DBUtils.getConnection();
                    int ringid = 0;
                    String ringName = request.getParameter("ringName");
                    String ringImage = request.getParameter("ringImage");
                    int diamondID = Integer.parseInt(request.getParameter("diamondID"));
                    String gender = request.getParameter("gender");
                    double price = Double.parseDouble(request.getParameter("price"));
                    int quantity = Integer.parseInt(request.getParameter("quantity"));
                    int categoryID = Integer.parseInt(request.getParameter("categoryID"));
                    int collectionID = Integer.parseInt(request.getParameter("collectionID"));

                    PreparedStatement ps = conn.prepareStatement("select max(ringID) from [Ring]");
                    
                    ResultSet rs = ps.executeQuery();
                    if (rs.next()) {
                        ringid = rs.getInt(1);
                        ringid++;
                    }
                    RingDTO ring = new RingDTO();
                    ring.setRingID(ringid);
                    ring.setRingName(ringName);
                    ring.setRingImage(ringImage);
                    ring.setDiamondID(diamondID);
                    ring.setGender(gender);
                    ring.setPrice(price);
                    ring.setQuantity(quantity);
                    ring.setCategoryID(categoryID);
                    ring.setCollectionID(collectionID);
                    request.setAttribute("ring", ring);
                    
                    RequestDispatcher rd = request.getRequestDispatcher("ringdetails.jsp");
                    rd.forward(request, response);
                } catch (SQLException ex) {
                    System.out.println("Insert ring error!" + ex.getMessage());
                    ex.printStackTrace();
                }

            } else if (action.equals("delete")) {//delete

                Integer id = null;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }

                ringDAO.delete(id);

                List<RingDTO> list = ringDAO.list(keyword, sortCol);
                request.setAttribute("ringlist", list);
                RequestDispatcher rd = request.getRequestDispatcher("ringlist.jsp");
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
