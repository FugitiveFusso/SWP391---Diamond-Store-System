package com.khac.swp.fuj.controller;

import com.khac.swp.fuj.category.CategoryDAO;
import com.khac.swp.fuj.category.CategoryDTO;
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

@WebServlet(name = "CategoryController", urlPatterns = {"/CategoryController"})
public class CategoryController extends HttpServlet {

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

            CategoryDAO categoryDAO = new CategoryDAO();
            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("salessession") == null) {
                response.sendRedirect("saleslogin.jsp");
                return;
            } else if (action == null || action.equals("list")) {//lists

                int totalCategories = categoryDAO.getTotalCategories(keyword);
                int totalPages = (int) Math.ceil((double) totalCategories / pageSize);

                // Ensure page is within valid range
                if (page < 1) {
                    page = 1;
                } else if (page > totalPages) {
                    page = totalPages;
                }

                List<CategoryDTO> list = categoryDAO.list(keyword, sortCol, page, pageSize);
                request.setAttribute("currentPage", page);
                request.setAttribute("totalPages", totalPages);
                request.setAttribute("pageSize", pageSize);
                request.setAttribute("sortCol", sortCol);
                request.setAttribute("keyword", keyword);
                request.setAttribute("categorylist", list);

                request.getRequestDispatcher("/categorylist.jsp").forward(request, response);

            } else if (action.equals("details")) {//details

                Integer id = null;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }

                CategoryDTO category = null;
                if (id != null) {
                    RingDAO dao_1 = new RingDAO();
                    int totalRCs = dao_1.getTotalRingCountByCategory(id);
                    int totalPages = (int) Math.ceil((double) totalRCs / pageSize);

                    // Ensure page is within valid range
                    if (page < 1) {
                        page = 1;
                    } else if (page > totalPages) {
                        page = totalPages;
                    }

                    List<RingDTO> ring_1 = dao_1.listByCategory(id, page, pageSize);
                    request.setAttribute("currentPage", page);
                    request.setAttribute("totalPages", totalPages);
                    request.setAttribute("pageSize", pageSize);
                    request.setAttribute("sortCol", sortCol);
                    request.setAttribute("keyword", keyword);
                    request.setAttribute("ringclist", ring_1);
                    category = categoryDAO.load(id);
                }

                request.setAttribute("category", category);//object
                RequestDispatcher rd = request.getRequestDispatcher("categorydetails.jsp");
                rd.forward(request, response);

            } else if (action.equals("edit")) {//edit
                Integer id = null;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }

                CategoryDTO category = null;
                if (id != null) {
                    category = categoryDAO.load(id);
                }

                request.setAttribute("category", category);
                request.setAttribute("nextaction", "update");
                RequestDispatcher rd = request.getRequestDispatcher("categoryedit.jsp");
                rd.forward(request, response);

            } else if (action.equals("create")) {//create
                CategoryDTO category = new CategoryDTO();
                request.setAttribute("category", category);
                request.setAttribute("nextaction", "insert");
                RequestDispatcher rd = request.getRequestDispatcher("categoryedit.jsp");
                rd.forward(request, response);

            } else if (action.equals("update")) {//update
                Integer categoryid = null;
                try {
                    categoryid = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }
                String categoryName = request.getParameter("categoryName");
                String categoryImage = request.getParameter("categoryImage");

                CategoryDTO category = null;
                if (categoryid != null) {
                    category = categoryDAO.load(categoryid);
                }
                category.setCategoryID(categoryid);
                category.setCategoryName(categoryName);
                category.setImage(categoryImage);
                categoryDAO.update(category);

                Integer id = null;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }
                if (id != null) {
                    RingDAO dao_1 = new RingDAO();
                    int totalRCs = dao_1.getTotalRingCountByCategory(id);
                    int totalPages = (int) Math.ceil((double) totalRCs / pageSize);

                    // Ensure page is within valid range
                    if (page < 1) {
                        page = 1;
                    } else if (page > totalPages) {
                        page = totalPages;
                    }

                    List<RingDTO> ring_1 = dao_1.listByCategory(id, page, pageSize);
                    request.setAttribute("currentPage", page);
                    request.setAttribute("totalPages", totalPages);
                    request.setAttribute("pageSize", pageSize);
                    request.setAttribute("sortCol", sortCol);
                    request.setAttribute("keyword", keyword);
                    request.setAttribute("ringclist", ring_1);
                    category = categoryDAO.load(id);
                }
                request.setAttribute("category", category);//object
                RequestDispatcher rd = request.getRequestDispatcher("categorydetails.jsp");
                rd.forward(request, response);

            } else if (action.equals("insert")) {//insert
                String categoryImage = request.getParameter("categoryImage");
                String categoryName = request.getParameter("categoryName");

                CategoryDAO dao = new CategoryDAO();
                CategoryDTO category = dao.checkCategoryExistByName(categoryName);
                if (category == null) {

                    category = new CategoryDTO();

                    category.setCategoryName(categoryName);
                    category.setImage(categoryImage);
                    request.setAttribute("category", category);

                    categoryDAO.insert(category);
                    request.setAttribute("success", "Added Successfully!!!");
                    RequestDispatcher rd = request.getRequestDispatcher("categoryedit.jsp");
                    rd.forward(request, response);

                } else {
                    request.setAttribute("error", "Your category ID is already existed!!!");
                    RequestDispatcher rd = request.getRequestDispatcher("categoryedit.jsp");
                    rd.forward(request, response);
                }

            } else if (action.equals("delete")) {//delete

                Integer id = null;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }

                categoryDAO.delete(id);
                int totalCategories = categoryDAO.getTotalCategories(keyword);
                int totalPages = (int) Math.ceil((double) totalCategories / pageSize);

                // Ensure page is within valid range
                if (page < 1) {
                    page = 1;
                } else if (page > totalPages) {
                    page = totalPages;
                }

                List<CategoryDTO> list = categoryDAO.list(keyword, sortCol, page, pageSize);
                request.setAttribute("currentPage", page);
                request.setAttribute("totalPages", totalPages);
                request.setAttribute("pageSize", pageSize);
                request.setAttribute("sortCol", sortCol);
                request.setAttribute("keyword", keyword);
                request.setAttribute("categorylist", list);
                RequestDispatcher rd = request.getRequestDispatcher("categorylist.jsp");
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
