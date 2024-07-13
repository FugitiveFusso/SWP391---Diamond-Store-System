package com.khac.swp.fuj.controller;

import com.khac.swp.fuj.certificate.CertificateDAO;
import com.khac.swp.fuj.certificate.CertificateDTO;
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

@WebServlet(name = "CertificateController", urlPatterns = {"/CertificateController"})
public class CertificateController extends HttpServlet {

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
            if (sortCol == null) {
                sortCol = "";
            }
            String pageStr = request.getParameter("page");
            int page = 1;
            if (pageStr != null) {
                page = Integer.parseInt(pageStr);
            }
            int pageSize = 10; // Set the number of posts per page

            CertificateDAO certificateDAO = new CertificateDAO();
            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("salessession") == null) {
                response.sendRedirect("saleslogin.jsp");
                return;
            } else if (action == null || action.equals("list")) {//lists

                int totalCertificates = certificateDAO.getTotalCertificates(keyword);
                int totalPages = (int) Math.ceil((double) totalCertificates / pageSize);

                // Ensure page is within valid range
                if (page < 1) {
                    page = 1;
                } else if (page > totalPages) {
                    page = totalPages;
                }

                List<CertificateDTO> list = certificateDAO.listCertificates(keyword, sortCol, page, pageSize);
                request.setAttribute("currentPage", page);
                request.setAttribute("totalPages", totalPages);
                request.setAttribute("pageSize", pageSize);
                request.setAttribute("sortCol", sortCol);
                request.setAttribute("keyword", keyword);
                request.setAttribute("certificatelist", list);

                request.getRequestDispatcher("/certificatelist.jsp").forward(request, response);

            } else if (action.equals("details")) {//details

                Integer id = null;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }

                CertificateDTO certificate = null;
                if (id != null) {
                    certificate = certificateDAO.load(id);
                }

                request.setAttribute("certificate", certificate);//object
                RequestDispatcher rd = request.getRequestDispatcher("certificatedetails.jsp");
                rd.forward(request, response);

            } else if (action.equals("edit")) {//edit
                Integer id = null;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }

                CertificateDTO certificate = null;
                if (id != null) {
                    certificate = certificateDAO.load(id);
                }

                request.setAttribute("certificate", certificate);
                request.setAttribute("nextaction", "update");
                RequestDispatcher rd = request.getRequestDispatcher("certificateedit.jsp");
                rd.forward(request, response);

            } else if (action.equals("create")) {//create
                CertificateDTO certificate = new CertificateDTO();
                request.setAttribute("certificate", certificate);
                request.setAttribute("nextaction", "insert");
                RequestDispatcher rd = request.getRequestDispatcher("certificateedit.jsp");
                rd.forward(request, response);

            } else if (action.equals("update")) {//update
                Integer certificateid = null;
                try {
                    certificateid = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }
                String certificateImage = request.getParameter("certificateImage");
                String certificateDescription = request.getParameter("description");

                CertificateDTO certificate = null;
                if (certificateid != null) {
                    certificate = certificateDAO.load(certificateid);
                }
                certificate.setCertificateID(certificateid);
                certificate.setCertificateImage(certificateImage);
                certificate.setCertificateDescription(certificateDescription);
                certificateDAO.update(certificate);

                request.setAttribute("certificate", certificate);
                RequestDispatcher rd = request.getRequestDispatcher("certificatedetails.jsp");
                rd.forward(request, response);

            } else if (action.equals("insert")) {//insert
                String certificateImage = request.getParameter("certificateImage");
                String certificateDescription = request.getParameter("description");

                CertificateDAO dao = new CertificateDAO();
                CertificateDTO certificate = dao.checkCertificateExistByDescription(certificateDescription);
                if (certificate == null) {
                    certificate = new CertificateDTO();
                    certificate.setCertificateImage(certificateImage);
                    certificate.setCertificateDescription(certificateDescription);

                    request.setAttribute("certificate", certificate);
                    certificateDAO.insert(certificate);
                    request.setAttribute("success", "Added Successfully!!!");
                    RequestDispatcher rd = request.getRequestDispatcher("certificateedit.jsp");
                    rd.forward(request, response);
                } else {
                    request.setAttribute("error", "Your certificate description is already existed!!!");
                    RequestDispatcher rd = request.getRequestDispatcher("certificateedit.jsp");
                    rd.forward(request, response);
                }

            } else if (action.equals("delete")) {//delete

                Integer id = null;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }

                certificateDAO.delete(id);
                int totalCertificates = certificateDAO.getTotalCertificates(keyword);
                int totalPages = (int) Math.ceil((double) totalCertificates / pageSize);

                // Ensure page is within valid range
                if (page < 1) {
                    page = 1;
                } else if (page > totalPages) {
                    page = totalPages;
                }

                List<CertificateDTO> list = certificateDAO.listCertificates(keyword, sortCol, page, pageSize);
                request.setAttribute("currentPage", page);
                request.setAttribute("totalPages", totalPages);
                request.setAttribute("pageSize", pageSize);
                request.setAttribute("sortCol", sortCol);
                request.setAttribute("keyword", keyword);
                request.setAttribute("certificatelist", list);
                RequestDispatcher rd = request.getRequestDispatcher("certificatelist.jsp");
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
