package com.khac.swp.fuj.controller;

import com.khac.swp.fuj.ringplacementprice.RingPlacementPriceDAO;
import com.khac.swp.fuj.ringplacementprice.RingPlacementPriceDTO;
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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class RingPlacementPriceController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            RingPlacementPriceDAO rpDAO = new RingPlacementPriceDAO();
            String action = request.getParameter("action");
            String keyword = request.getParameter("keyword");
            if (keyword == null) {
                keyword = "";
            }
            String sortCol = request.getParameter("colSort");

            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("salessession") == null) {
                response.sendRedirect("saleslogin.jsp");
                return;
            } else if (action == null || action.equals("list")) {//lists

                RingPlacementPriceDAO dao = new RingPlacementPriceDAO();
                List<RingPlacementPriceDTO> list = dao.getAllRingPlacementPrice(keyword, sortCol);
                request.setAttribute("rplist", list);

                request.getRequestDispatcher("/rplist.jsp").forward(request, response);

            } else if (action.equals("details")) {//details

                Integer id = null;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }

                RingPlacementPriceDTO rp = null;
                if (id != null) {
                    rp = rpDAO.load(id);
                }

                request.setAttribute("rp", rp);//object
                RequestDispatcher rd = request.getRequestDispatcher("rpdetails.jsp");
                rd.forward(request, response);
            } else if (action.equals("edit")) {//edit
                Integer id = null;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }

                RingPlacementPriceDTO rp = null;
                if (id != null) {
                    rp = rpDAO.load(id);
                }

                request.setAttribute("rp", rp);
                request.setAttribute("nextaction", "update");
                RequestDispatcher rd = request.getRequestDispatcher("rpedit.jsp");
                rd.forward(request, response);

            } else if (action.equals("create")) {//create
                RingPlacementPriceDTO rp = new RingPlacementPriceDTO();
                request.setAttribute("rp", rp);
                request.setAttribute("nextaction", "insert");
                RequestDispatcher rd = request.getRequestDispatcher("rpedit.jsp");
                rd.forward(request, response);

            } else if (action.equals("update")) {//update
                Integer rpid = null;
                try {
                    rpid = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }
                String name = request.getParameter("rName");
                String material = request.getParameter("material");
                String color = request.getParameter("color");
                String price = request.getParameter("rpPrice");

                RingPlacementPriceDTO rp = null;
                if (rpid != null) {
                    rp = rpDAO.load(rpid);
                }
                rp.setId(rpid);
                rp.setName(name);
                rp.setMaterial(material);
                rp.setColor(color);
                rp.setPrice(price);
                rpDAO.update(rp);

                request.setAttribute("rp", rp);
                RequestDispatcher rd = request.getRequestDispatcher("rpdetails.jsp");
                rd.forward(request, response);

            } else if (action.equals("insert")) {//insert
                Connection conn = DBUtils.getConnection();

                String name = request.getParameter("rName");
                String material = request.getParameter("material");
                String color = request.getParameter("color");
                String price = request.getParameter("rpPrice");

                RingPlacementPriceDAO dao = new RingPlacementPriceDAO();
                RingPlacementPriceDTO rp = dao.checkRPExist(name, material, color);
                if (rp == null) {
                    rp = new RingPlacementPriceDTO();
                    rp.setName(name);
                    rp.setMaterial(material);
                    rp.setColor(color);
                    rp.setPrice(price);
                    rpDAO.insert(rp);
                    request.setAttribute("rp", rp);
                    request.setAttribute("success", "Added Successfully!!!");
                    RequestDispatcher rd = request.getRequestDispatcher("rpedit.jsp");
                    rd.forward(request, response);
                } else {
                    request.setAttribute("error", "Your Ring Placement Price is already existed!!!");
                    RequestDispatcher rd = request.getRequestDispatcher("rpedit.jsp");
                    rd.forward(request, response);
                }

            } else if (action.equals("delete")) {//delete

                Integer id = null;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }

                rpDAO.delete(id);

                List<RingPlacementPriceDTO> list = rpDAO.getAllRingPlacementPrice(keyword, sortCol);
                request.setAttribute("rplist", list);
                RequestDispatcher rd = request.getRequestDispatcher("rplist.jsp");
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
