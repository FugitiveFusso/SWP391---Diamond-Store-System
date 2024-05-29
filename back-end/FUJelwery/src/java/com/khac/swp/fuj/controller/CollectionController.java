/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.khac.swp.fuj.controller;

import com.khac.swp.fuj.collection.CollectionDAO;
import com.khac.swp.fuj.collection.CollectionDTO;
import com.khac.swp.fuj.utils.DBUtils;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.SQLException;

/**
 *
 * @author Dell
 */
@WebServlet(name = "CollectionController", urlPatterns = {"/CollectionController"})
public class CollectionController extends HttpServlet {

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

            CollectionDAO collectionDAO = new CollectionDAO();
            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("adminsession") == null) {
                response.sendRedirect("adminlogin.jsp");
                return;
            } else if (action == null || action.equals("list")) {//lists

                CollectionDAO dao = new CollectionDAO();
                List<CollectionDTO> list = dao.list(keyword, sortCol);
                request.setAttribute("collectionlist", list);

                request.getRequestDispatcher("/collectionlist.jsp").forward(request, response);

            } else if (action.equals("details")) {//details

                Integer id = null;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }

                CollectionDTO collection = null;
                if (id != null) {
                    collection = collectionDAO.load(id);
                }

                request.setAttribute("collection", collection);//object
                RequestDispatcher rd = request.getRequestDispatcher("collectiondetails.jsp");
                rd.forward(request, response);
                
            } else if (action.equals("edit")) {//edit
                Integer id = null;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }

                CollectionDTO collection = null;
                if (id != null) {
                    collection = collectionDAO.load(id);
                }

                request.setAttribute("collection", collection);
                request.setAttribute("nextaction", "update");
                RequestDispatcher rd = request.getRequestDispatcher("collectionedit.jsp");
                rd.forward(request, response);

            } else if (action.equals("create")) {//create
                CollectionDTO collection = new CollectionDTO();
                request.setAttribute("collection", collection);
                request.setAttribute("nextaction", "insert");
                RequestDispatcher rd = request.getRequestDispatcher("collectionedit.jsp");
                rd.forward(request, response);

            } else if (action.equals("update")) {//update
                Integer collectionid = null;
                try {
                    collectionid = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }
                String collectionName = request.getParameter("collectionName");
                String collectionImage = request.getParameter("collectionImage");
                String description = request.getParameter("description");

                CollectionDTO collection = null;
                if (collectionid != null) {
                    collection = collectionDAO.load(collectionid);
                }
                collection.setCollectionID(collectionid);
                collection.setCollectionName(collectionName);
                collection.setCollectionImage(collectionImage);
                collection.setCollectionDescription(description);

                request.setAttribute("collection", collection);
                RequestDispatcher rd = request.getRequestDispatcher("collectiondetails.jsp");
                rd.forward(request, response);

            } else if (action.equals("insert")) {//insert
                try {
                    Connection conn = DBUtils.getConnection();
                    int collectionid = 0;
                    String collectionName = request.getParameter("collectionName");
                    String collectionImage = request.getParameter("collectionImage");
                    String description = request.getParameter("descritption");

                    PreparedStatement ps = conn.prepareStatement("select max(collectionID) from [Collection]");
                    ResultSet rs = ps.executeQuery();
                    if (rs.next()) {
                        collectionid = rs.getInt(1);
                        collectionid++;
                    }
                    CollectionDTO collection = new CollectionDTO();
                    collection.setCollectionID(collectionid);
                    collection.setCollectionName(collectionName);
                    collection.setCollectionImage(collectionImage);
                    collection.setCollectionDescription(description);
                    request.setAttribute("collection", collection);
                    collectionDAO.insert(collection);
                    
                    RequestDispatcher rd = request.getRequestDispatcher("collectiondetails.jsp");
                    rd.forward(request, response);
                } catch (SQLException ex) {
                    System.out.println("Insert collection error!" + ex.getMessage());
                    ex.printStackTrace();
                }

            } else if (action.equals("delete")) {//delete

                Integer id = null;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }

                collectionDAO.delete(id);

                List<CollectionDTO> list = collectionDAO.list(keyword, sortCol);
                request.setAttribute("collectionlist", list);
                RequestDispatcher rd = request.getRequestDispatcher("collectionlist.jsp");
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
