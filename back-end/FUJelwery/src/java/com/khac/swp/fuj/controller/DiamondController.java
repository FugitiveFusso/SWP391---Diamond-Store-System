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

@WebServlet(name = "DiamondController", urlPatterns = {"/DiamondController"})
public class DiamondController extends HttpServlet {

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
            if (session == null || session.getAttribute("salessession") == null) {
                response.sendRedirect("saleslogin.jsp");
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
                Integer dpID = null;
                try {
                    dpID = Integer.parseInt(request.getParameter("dpID"));
                } catch (NumberFormatException ex) {
                    log("Parameter dpID has wrong format.");
                }
                Integer certificateID = null;
                try {
                    certificateID = Integer.parseInt(request.getParameter("certificateID"));
                } catch (NumberFormatException ex) {
                    log("Parameter dpID has wrong format.");
                }
                DiamondDTO diamond = null;
                if (diamondid != null) {
                    diamond = diamondDAO.load(diamondid);
                }
                if (diamond != null) {
                    diamond.setDiamondID(diamondid);
                    diamond.setDiamondName(diamondName);
                    diamond.setDiamondImage(diamondImage);
                    diamond.setOrigin(origin);
                    diamond.setDpID(dpID);
                    diamond.setCertificateID(certificateID);
                    diamondDAO.update(diamond);
                }

                request.setAttribute("diamond", diamond);
                RequestDispatcher rd = request.getRequestDispatcher("diamonddetails.jsp");
                rd.forward(request, response);

            } else if (action.equals("insert")) {//insert

                Integer diamondid = null;
                try {
                    diamondid = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }
                String diamondName = request.getParameter("diamondName");
                String diamondImage = request.getParameter("diamondImage");
                String origin = request.getParameter("origin");
                Integer dpID = null;
                try {
                    dpID = Integer.parseInt(request.getParameter("dpID"));
                } catch (NumberFormatException ex) {
                    log("Parameter dpID has wrong format.");
                }
                Integer certificateID = null;
                try {
                    certificateID = Integer.parseInt(request.getParameter("certificateID"));
                } catch (NumberFormatException ex) {
                    log("Parameter dpID has wrong format.");
                }
                DiamondDAO dao = new DiamondDAO();
                DiamondDTO diamond = dao.checkDiamondExistByDiamondPrice(dpID);
                if (diamond != null) {
                    diamond = dao.checkDiamondExistByDiamondCertificate(certificateID);
                    if (diamond != null) {
                        diamond = new DiamondDTO();
                        diamond.setDiamondID(diamondid);
                        diamond.setDiamondName(diamondName);
                        diamond.setDiamondImage(diamondImage);
                        diamond.setOrigin(origin);
                        diamond.setDpID(dpID);
                        diamond.setCertificateID(certificateID);
                        request.setAttribute("diamond", diamond);
                        diamondDAO.insert(diamond);
                        request.setAttribute("success", "Added Successfully!!!");
                        RequestDispatcher rd = request.getRequestDispatcher("diamondedit.jsp");
                        rd.forward(request, response);
                    } else {
                        request.setAttribute("error", "Your Diamond is not inserted by wrong Certificate ID");
                        RequestDispatcher rd = request.getRequestDispatcher("diamondedit.jsp");
                        rd.forward(request, response);
                    }

                } else {
                    request.setAttribute("error", "Your Diamond is not inserted by wrong Diamond Price");
                    RequestDispatcher rd = request.getRequestDispatcher("diamondedit.jsp");
                    rd.forward(request, response);
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
