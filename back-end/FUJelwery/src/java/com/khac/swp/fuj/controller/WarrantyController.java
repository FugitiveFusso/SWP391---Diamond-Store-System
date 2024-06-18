package com.khac.swp.fuj.controller;

import com.khac.swp.fuj.utils.DBUtils;
import com.khac.swp.fuj.warranty.WarrantyDAO;
import com.khac.swp.fuj.warranty.WarrantyDTO;

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

public class WarrantyController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            WarrantyDAO warrantyDAO = new WarrantyDAO();
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

                WarrantyDAO dao = new WarrantyDAO();
                List<WarrantyDTO> list = dao.getAllWarranty(keyword, sortCol);
                request.setAttribute("warrantylist", list);

                request.getRequestDispatcher("/warrantylist.jsp").forward(request, response);

            } else if (action.equals("details")) {//details

                Integer id = null;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }

                WarrantyDTO warranty = null;
                if (id != null) {
                    warranty = warrantyDAO.load(id);
                }

                request.setAttribute("warranty", warranty);//object
                RequestDispatcher rd = request.getRequestDispatcher("warrantydetails.jsp");
                rd.forward(request, response);
            } else if (action.equals("edit")) {//edit
                Integer id = null;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }

                WarrantyDTO warranty = null;
                if (id != null) {
                    warranty = warrantyDAO.load(id);
                }

                request.setAttribute("warranty", warranty);
                request.setAttribute("nextaction", "update");
                RequestDispatcher rd = request.getRequestDispatcher("warrantyedit.jsp");
                rd.forward(request, response);

            } else if (action.equals("create")) {//create
                WarrantyDTO warranty = new WarrantyDTO();
                request.setAttribute("warranty", warranty);
                request.setAttribute("nextaction", "insert");
                RequestDispatcher rd = request.getRequestDispatcher("warrantyedit.jsp");
                rd.forward(request, response);

            } else if (action.equals("update")) {//update
                Integer warrantyid = null;
                try {
                    warrantyid = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }
                String warrantyname = request.getParameter("warrantyName");
                String warrantyimage = request.getParameter("warrantyImage");
                Integer month = null;
                try {
                    month = Integer.parseInt(request.getParameter("warrantyMonth"));
                } catch (NumberFormatException ex) {
                    log("Parameter month has wrong format.");
                }
                String description = request.getParameter("warrantyDescription");
                String type = request.getParameter("warrantyType");
                String startDate = request.getParameter("startDate");
                String tac = request.getParameter("termsAndConditions");
                WarrantyDTO warranty = null;
                if (warrantyid != null) {
                    warranty = warrantyDAO.load(warrantyid);
                }
                warranty.setId(warrantyid);
                warranty.setName(warrantyname);
                warranty.setImage(warrantyimage);
                warranty.setMonth(month);
                warranty.setDescription(description);
                warranty.setType(type);
                warranty.setStartdate(startDate);
                warranty.setTermsandconditions(tac);
                warrantyDAO.update(warranty);

                request.setAttribute("warranty", warranty);
                RequestDispatcher rd = request.getRequestDispatcher("warrantydetails.jsp");
                rd.forward(request, response);

            } else if (action.equals("insert")) {//insert
                Connection conn = null;
                Integer warrantyid = null;
                Integer month = null;

                try {
                    conn = DBUtils.getConnection();
                    if (conn == null) {
                        throw new SQLException("Failed to establish a database connection.");
                    }

                    String warrantyname = request.getParameter("warrantyName");
                    String warrantyimage = request.getParameter("warrantyImage");

                    try {
                        month = Integer.parseInt(request.getParameter("warrantyMonth"));
                    } catch (NumberFormatException ex) {
                        log("Parameter month has wrong format.");
                        throw new ServletException("Parameter month has wrong format.");
                    }

                    String description = request.getParameter("warrantyDescription");
                    String type = request.getParameter("warrantyType");
                    String startDate = request.getParameter("startDate");
                    String tac = request.getParameter("termsAndConditions");

                    WarrantyDAO dao = new WarrantyDAO();
                    WarrantyDTO warranty = dao.checkWarrantyExistByName(warrantyname);

                    if (warranty == null) {
                        warranty = new WarrantyDTO();
                        warranty.setName(warrantyname);
                        warranty.setImage(warrantyimage);
                        warranty.setMonth(month);
                        warranty.setDescription(description);
                        warranty.setType(type);
                        warranty.setStartdate(startDate);
                        warranty.setTermsandconditions(tac);

                        dao.insert(warranty);
                        request.setAttribute("warranty", warranty);
                        request.setAttribute("success", "Added Successfully!!!");
                        RequestDispatcher rd = request.getRequestDispatcher("warrantyedit.jsp");
                        rd.forward(request, response);
                    } else {
                        request.setAttribute("error", "Your warranty Name already exists!!!");
                        RequestDispatcher rd = request.getRequestDispatcher("warrantyedit.jsp");
                        rd.forward(request, response);
                    }
                } catch (SQLException e) {
                    log("Database connection error: " + e.getMessage());
                    throw new ServletException("Database connection error.", e);
                } catch (Exception e) {
                    log("An error occurred: " + e.getMessage());
                    throw new ServletException("An error occurred.", e);
                } finally {
                    if (conn != null) {
                        try {
                            conn.close();
                        } catch (SQLException e) {
                            log("Failed to close the connection: " + e.getMessage());
                        }
                    }
                }

            } else if (action.equals("delete")) {//delete

                Integer id = null;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }

                warrantyDAO.delete(id);

                List<WarrantyDTO> list = warrantyDAO.getAllWarranty(keyword, sortCol);
                request.setAttribute("warrantylist", list);
                RequestDispatcher rd = request.getRequestDispatcher("warrantylist.jsp");
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
