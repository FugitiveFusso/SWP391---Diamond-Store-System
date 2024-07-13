package com.khac.swp.fuj.controller;

import com.khac.swp.fuj.collection.CollectionDAO;
import com.khac.swp.fuj.collection.CollectionDTO;
import com.khac.swp.fuj.ring.RingDAO;
import com.khac.swp.fuj.ring.RingDTO;
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

@WebServlet(name = "CollectionController", urlPatterns = {"/CollectionController"})
public class CollectionController extends HttpServlet {

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
            RingDAO ringDAO = new RingDAO();
            CollectionDAO collectionDAO = new CollectionDAO();
            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("salessession") == null) {
                response.sendRedirect("saleslogin.jsp");
                return;
            } else if (action == null || action.equals("list")) {//lists

                int totalCollections = collectionDAO.getTotalCollectionCount(keyword);
                int totalPages = (int) Math.ceil((double) totalCollections / pageSize);

                // Ensure page is within valid range
                if (page < 1) {
                    page = 1;
                } else if (page > totalPages) {
                    page = totalPages;
                }

                List<CollectionDTO> list = collectionDAO.list(keyword, sortCol, page, pageSize);
                request.setAttribute("currentPage", page);
                request.setAttribute("totalPages", totalPages);
                request.setAttribute("pageSize", pageSize);
                request.setAttribute("sortCol", sortCol);
                request.setAttribute("keyword", keyword);
                request.setAttribute("collectionlist", list);

                request.getRequestDispatcher("/collectionlist.jsp").forward(request, response);

            } else if (action.equals("details")) {//details

                Integer id = null;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }
                RingDTO ring = null;
                CollectionDTO collection = null;
                if (id != null) {
                    RingDAO dao_1 = new RingDAO();
                    collection = collectionDAO.load(id);
                    List<RingDTO> ring_1 = dao_1.listByCollection(id);
                    request.setAttribute("ringclist", ring_1);
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
                collectionDAO.update(collection);

                Integer id = null;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }
                RingDTO ring = null;
                if (id != null) {
                    RingDAO dao_1 = new RingDAO();
                    collection = collectionDAO.load(id);
                    List<RingDTO> ring_1 = dao_1.listByCollection(id);
                    request.setAttribute("ringclist", ring_1);
                }

                request.setAttribute("collection", collection);//object
                RequestDispatcher rd = request.getRequestDispatcher("collectiondetails.jsp");
                rd.forward(request, response);
            } else if (action.equals("insert")) {//insert
                Connection conn = DBUtils.getConnection();

                String collectionName = request.getParameter("collectionName");
                String collectionImage = request.getParameter("collectionImage");
                String description = request.getParameter("description");

                CollectionDAO dao = new CollectionDAO();
                CollectionDTO collection = dao.checkCollectionExistByName(collectionName);
                if (collection == null) {

                    collection = new CollectionDTO();
                    collection.setCollectionName(collectionName);
                    collection.setCollectionImage(collectionImage);
                    collection.setCollectionDescription(description);
                    request.setAttribute("collection", collection);

                    collectionDAO.insert(collection);
                    request.setAttribute("success", "Added Successfully!!!");
                    RequestDispatcher rd = request.getRequestDispatcher("collectionedit.jsp");
                    rd.forward(request, response);
                } else {
                    request.setAttribute("error", "Your collection name is already existed!!!");
                    RequestDispatcher rd = request.getRequestDispatcher("collectionedit.jsp");
                    rd.forward(request, response);
                }

            } else if (action.equals("delete")) {//delete

                Integer id = null;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }

                collectionDAO.delete(id);
                int totalCollections = collectionDAO.getTotalCollectionCount(keyword);
                int totalPages = (int) Math.ceil((double) totalCollections / pageSize);

                // Ensure page is within valid range
                if (page < 1) {
                    page = 1;
                } else if (page > totalPages) {
                    page = totalPages;
                }

                List<CollectionDTO> list = collectionDAO.list(keyword, sortCol, page, pageSize);
                request.setAttribute("currentPage", page);
                request.setAttribute("totalPages", totalPages);
                request.setAttribute("pageSize", pageSize);
                request.setAttribute("sortCol", sortCol);
                request.setAttribute("keyword", keyword);
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
