package com.khac.swp.fuj.controller;

import com.khac.swp.fuj.category.CategoryDAO;
import com.khac.swp.fuj.category.CategoryDTO;
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

            CategoryDAO categoryDAO = new CategoryDAO();
            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("adminsession") == null) {
                response.sendRedirect("adminlogin.jsp");
                return;
            } else if (action == null || action.equals("list")) {//lists

                CategoryDAO dao = new CategoryDAO();
                List<CategoryDTO> list = dao.list(keyword, sortCol);
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

                CategoryDTO category = null;
                if (categoryid != null) {
                    category = categoryDAO.load(categoryid);
                }
                category.setCategoryID(categoryid);
                category.setCategoryName(categoryName);
                categoryDAO.update(category);

                request.setAttribute("category", category);
                RequestDispatcher rd = request.getRequestDispatcher("categorydetails.jsp");
                rd.forward(request, response);

            } else if (action.equals("insert")) {//insert
                try {
                    Connection conn = DBUtils.getConnection();
                    int categoryid = 0;
                    String categoryName = request.getParameter("categoryName");

                    PreparedStatement ps = conn.prepareStatement("select max(categoryID) from [Category]");
                    ResultSet rs = ps.executeQuery();
                    if (rs.next()) {
                        categoryid = rs.getInt(1);
                        categoryid++;
                    }
                    CategoryDTO category = new CategoryDTO();
                    category.setCategoryID(categoryid);
                    category.setCategoryName(categoryName);
                    request.setAttribute("category", category);
                    categoryDAO.insert(category);

                    RequestDispatcher rd = request.getRequestDispatcher("categorydetails.jsp");
                    rd.forward(request, response);
                } catch (SQLException ex) {
                    System.out.println("Insert category error!" + ex.getMessage());
                    ex.printStackTrace();
                }

            } else if (action.equals("delete")) {//delete

                Integer id = null;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }

                categoryDAO.delete(id);

                List<CategoryDTO> list = categoryDAO.list(keyword, sortCol);
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
