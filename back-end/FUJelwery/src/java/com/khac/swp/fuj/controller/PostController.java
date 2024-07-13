package com.khac.swp.fuj.controller;

import com.khac.swp.fuj.posts.PostDAO;
import com.khac.swp.fuj.posts.PostDTO;
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

public class PostController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            PostDAO postDAO = new PostDAO();
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

            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("adminsession") == null) {
                response.sendRedirect("adminlogin.jsp");
                return;
            } else if (action == null || action.equals("list")) { // lists

                int totalPosts = postDAO.getTotalPosts(keyword);
                int totalPages = (int) Math.ceil((double) totalPosts / pageSize);

                // Ensure page is within valid range
                if (page < 1) {
                    page = 1;
                } else if (page > totalPages) {
                    page = totalPages;
                }

                List<PostDTO> list = postDAO.getAllPost(keyword, sortCol, page, pageSize);
                request.setAttribute("currentPage", page);
                request.setAttribute("totalPages", totalPages);
                request.setAttribute("pageSize", pageSize);
                request.setAttribute("sortCol", sortCol);
                request.setAttribute("keyword", keyword);
                request.setAttribute("postlist", list);

                request.getRequestDispatcher("/postlist.jsp").forward(request, response);
            } else if (action.equals("details")) {//details

                Integer id = null;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }

                PostDTO post = null;
                if (id != null) {
                    post = postDAO.load(id);
                }

                request.setAttribute("post", post);//object
                RequestDispatcher rd = request.getRequestDispatcher("postdetails.jsp");
                rd.forward(request, response);
            } else if (action.equals("edit")) {//edit
                Integer id = null;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }

                PostDTO post = null;
                if (id != null) {
                    post = postDAO.load(id);
                }

                request.setAttribute("post", post);
                request.setAttribute("nextaction", "update");
                RequestDispatcher rd = request.getRequestDispatcher("postedit.jsp");
                rd.forward(request, response);

            } else if (action.equals("create")) {//create
                PostDTO post = new PostDTO();
                request.setAttribute("post", post);
                request.setAttribute("nextaction", "insert");
                RequestDispatcher rd = request.getRequestDispatcher("postedit.jsp");
                rd.forward(request, response);

            } else if (action.equals("update")) {//update
                Integer postid = null;
                try {
                    postid = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }
                String postname = request.getParameter("postName");
                String postimage = request.getParameter("postImage");
                String postdate = request.getParameter("postDate");
                String author = request.getParameter("author");
                String description = request.getParameter("description");
                String posttext = request.getParameter("postText");

                PostDTO post = null;
                if (postid != null) {
                    post = postDAO.load(postid);
                }
                post.setId(postid);
                post.setName(postname);
                post.setImage(postimage);
                post.setDate(postdate);
                post.setAuthor(author);
                post.setDescription(description);
                post.setText(posttext);
                postDAO.update(post);

                request.setAttribute("post", post);
                RequestDispatcher rd = request.getRequestDispatcher("postdetails.jsp");
                rd.forward(request, response);

            } else if (action.equals("insert")) {//insert

                Connection conn = DBUtils.getConnection();

                String postname = request.getParameter("postName");
                String postimage = request.getParameter("postImage");
                String postdate = request.getParameter("postDate");
                String author = request.getParameter("author");
                String description = request.getParameter("description");
                String posttext = request.getParameter("postText");

                PostDAO dao = new PostDAO();
                PostDTO post = dao.checkPostExistByName(postname);
                if (post == null) {
                    post = new PostDTO();
                    post.setName(postname);
                    post.setImage(postimage);
                    post.setDate(postdate);
                    post.setAuthor(author);
                    post.setDescription(description);
                    post.setText(posttext);
                    postDAO.insert(post);

                    request.setAttribute("post", post);
                    request.setAttribute("success", "Added Successfully!!!");
                    RequestDispatcher rd = request.getRequestDispatcher("postedit.jsp");
                    rd.forward(request, response);
                } else {
                    request.setAttribute("error", "Your post name is already existed!!!");
                    RequestDispatcher rd = request.getRequestDispatcher("postedit.jsp");
                    rd.forward(request, response);
                }

            } else if (action.equals("delete")) {//delete

                Integer id = null;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }

                postDAO.delete(id);

                int totalPosts = postDAO.getTotalPosts(keyword);
                int totalPages = (int) Math.ceil((double) totalPosts / pageSize);

                // Ensure page is within valid range
                if (page < 1) {
                    page = 1;
                } else if (page > totalPages) {
                    page = totalPages;
                }

                List<PostDTO> list = postDAO.getAllPost(keyword, sortCol, page, pageSize);
                request.setAttribute("postlist", list);
                request.setAttribute("currentPage", page);
                request.setAttribute("totalPages", totalPages);
                request.setAttribute("pageSize", pageSize);
                request.setAttribute("sortCol", sortCol);
                request.setAttribute("keyword", keyword);

                request.getRequestDispatcher("/postlist.jsp").forward(request, response);
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
