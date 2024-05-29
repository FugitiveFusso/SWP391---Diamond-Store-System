    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.khac.swp.fuj.controller;

import com.khac.swp.fuj.diamond.DiamondDAO;
import com.khac.swp.fuj.diamond.DiamondDTO;
import com.khac.swp.fuj.users.UserDAO;
import com.khac.swp.fuj.users.UserDTO;
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
@WebServlet(name = "DiamondController", urlPatterns = {"/DiamondController"})
public class DiamondController extends HttpServlet {

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

            DiamondDAO diamondDAO = new DiamondDAO();
            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("adminsession") == null) {
                response.sendRedirect("adminlogin.jsp");
                return;
            } else if (action == null || action.equals("list")) {//lists

                DiamondDAO dao = new DiamondDAO();
                List<DiamondDTO> list = dao.list(keyword, sortCol);
                request.setAttribute("diamondlist", list);

                request.getRequestDispatcher("/diamondlist.jsp").forward(request, response);

            } else if (action.equals("details")) {//details

                Integer id = null;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }

                DiamondDTO diamond = null;
                if (id != null) {
                    diamond = diamondDAO.load(id);
                }

                request.setAttribute("diamond", diamond);//object
                RequestDispatcher rd = request.getRequestDispatcher("diamonddetails.jsp");
                rd.forward(request, response);
                
            } else if (action.equals("edit")) {//edit
                Integer id = null;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }

                DiamondDTO diamond = null;
                if (id != null) {
                    diamond = diamondDAO.load(id);
                }

                request.setAttribute("diamond", diamond);
                request.setAttribute("nextaction", "update");
                RequestDispatcher rd = request.getRequestDispatcher("diamondedit.jsp");
                rd.forward(request, response);

            } else if (action.equals("create")) {//create
                DiamondDTO diamond = new DiamondDTO();
                request.setAttribute("diamond", diamond);
                request.setAttribute("nextaction", "insert");
                RequestDispatcher rd = request.getRequestDispatcher("diamondedit.jsp");
                rd.forward(request, response);

            } else if (action.equals("update")) {//update
                Integer diamondid = null;
                try {
                    diamondid = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }
                String diamondName = request.getParameter("diamondName");
                String diamondImage = request.getParameter("diamondImage");
                String origin = request.getParameter("origin");
                Double caratWeight = Double.parseDouble(request.getParameter("caratWeight"));
                String cut = request.getParameter("cut");
                String color = request.getParameter("color");
                String clarity = request.getParameter("clarity");
                int certificateID = Integer.parseInt(request.getParameter("certificateID"));

                DiamondDTO diamond = null;
                if (diamondid != null) {
                    diamond = diamondDAO.load(diamondid);
                }
                diamond.setDiamondID(diamondid);
                diamond.setDiamondName(diamondName);
                diamond.setDiamondImage(diamondImage);
                diamond.setOrigin(origin);
                diamond.setCaratWeight(caratWeight);
                diamond.setCut(cut);
                diamond.setColor(color);
                diamond.setClarity(clarity);
                diamond.setCertificateID(certificateID);
                diamondDAO.update(diamond);
                request.setAttribute("diamond", diamond);
                RequestDispatcher rd = request.getRequestDispatcher("diamonddetails.jsp");
                rd.forward(request, response);

            } else if (action.equals("insert")) {//insert
                try {
                    Connection conn = DBUtils.getConnection();
                    int diamondid = 0;
                    String diamondName = request.getParameter("diamondName");
                    String diamondImage = request.getParameter("diamondImage");
                    String origin = request.getParameter("origin");
                    double caratWeight = Double.parseDouble(request.getParameter("caratWeight"));
                    String cut = request.getParameter("cut");
                    String color = request.getParameter("color");
                    String clarity = request.getParameter("clarity");
                    int certificateID = Integer.parseInt(request.getParameter("certificateID"));

                    PreparedStatement ps = conn.prepareStatement("select max(diamondID) from [Diamond]");
                    ResultSet rs = ps.executeQuery();
                    if (rs.next()) {
                        diamondid = rs.getInt(1);
                        diamondid++;
                    }
                    DiamondDTO diamond = new DiamondDTO();
                    diamond.setDiamondID(diamondid);
                    diamond.setDiamondName(diamondName);
                    diamond.setDiamondImage(diamondImage);
                    diamond.setOrigin(origin);
                    diamond.setCaratWeight(caratWeight);
                    diamond.setCut(cut);
                    diamond.setColor(color);
                    diamond.setClarity(clarity);
                    diamond.setCertificateID(certificateID);
                    request.setAttribute("diamond", diamond);
                    diamondDAO.insert(diamond);
                    
                    RequestDispatcher rd = request.getRequestDispatcher("diamonddetails.jsp");
                    rd.forward(request, response);
                } catch (SQLException ex) {
                    System.out.println("Insert diamond error!" + ex.getMessage());
                    ex.printStackTrace();
                }

            } else if (action.equals("delete")) {//delete

                Integer id = null;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }

                diamondDAO.delete(id);

                List<DiamondDTO> list = diamondDAO.list(keyword, sortCol);
                request.setAttribute("diamondlist", list);
                RequestDispatcher rd = request.getRequestDispatcher("diamondlist.jsp");
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
