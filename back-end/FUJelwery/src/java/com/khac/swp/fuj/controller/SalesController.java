package com.khac.swp.fuj.controller;

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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SalesController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
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

            UserDAO userDAO = new UserDAO();
            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("adminsession") == null) {
                response.sendRedirect("adminlogin.jsp");
                return;
            } else if (action == null || action.equals("list")) {//lists

                int totalUsers = userDAO.getTotalUsers(keyword, "Sales Staff");
                int totalPages = (int) Math.ceil((double) totalUsers / pageSize);

                // Ensure page is within valid range
                if (page < 1) {
                    page = 1;
                } else if (page > totalPages) {
                    page = totalPages;
                }
                UserDAO dao = new UserDAO();
                request.setAttribute("currentPage", page);
                request.setAttribute("totalPages", totalPages);
                request.setAttribute("pageSize", pageSize);
                request.setAttribute("sortCol", sortCol);
                request.setAttribute("keyword", keyword);
                List<UserDTO> list = dao.list(keyword, sortCol, "Sales Staff", page, pageSize);
                request.setAttribute("saleslist", list);

                request.getRequestDispatcher("/saleslist.jsp").forward(request, response);

            } else if (action.equals("details")) {//details

                Integer id = null;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }

                UserDTO sales = null;
                if (id != null) {
                    sales = userDAO.load(id, "Sales Staff");
                }

                request.setAttribute("sales", sales);//object
                RequestDispatcher rd = request.getRequestDispatcher("salesdetails.jsp");
                rd.forward(request, response);

            } else if (action.equals("edit")) {//edit
                Integer id = null;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }

                UserDTO sales = null;
                if (id != null) {
                    sales = userDAO.load(id, "Sales Staff");
                }

                request.setAttribute("sales", sales);
                request.setAttribute("nextaction", "update");
                RequestDispatcher rd = request.getRequestDispatcher("salesedit.jsp");
                rd.forward(request, response);

            } else if (action.equals("create")) {//create
                UserDTO sales = new UserDTO();
                request.setAttribute("sales", sales);
                request.setAttribute("nextaction", "insert");
                RequestDispatcher rd = request.getRequestDispatcher("salesedit.jsp");
                rd.forward(request, response);

            } else if (action.equals("update")) {//update
                Integer salesid = null;
                try {
                    salesid = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }
                String salesname = request.getParameter("userName");
                String password = request.getParameter("password");
                String firstname = request.getParameter("firstName");
                String lastname = request.getParameter("lastName");
                String phonenumber = request.getParameter("phoneNumber");
                String email = request.getParameter("email");
                String address = request.getParameter("address");
                Integer point = null;
                try {
                    point = Integer.parseInt(request.getParameter("point"));
                } catch (NumberFormatException ex) {
                    log("Parameter point has wrong format.");
                }

                UserDTO sales = null;
                if (salesid != null) {
                    sales = userDAO.load(salesid, "Sales Staff");
                }
                sales.setUserid(salesid);
                sales.setUsername(salesname);
                sales.setPassword(password);
                sales.setFirstname(firstname);
                sales.setLastname(lastname);
                sales.setEmail(email);
                sales.setPhonenumber(phonenumber);
                sales.setAddress(address);
                sales.setPoint(point);
                userDAO.update(sales);

                request.setAttribute("sales", sales);
                RequestDispatcher rd = request.getRequestDispatcher("salesdetails.jsp");
                rd.forward(request, response);

            } else if (action.equals("insert")) {//insert

                Connection conn = DBUtils.getConnection();
                Integer salesid = null;
                try {
                    salesid = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }
                String salesname = request.getParameter("userName");
                String password = request.getParameter("password");
                String firstname = request.getParameter("firstName");
                String lastname = request.getParameter("lastName");
                String phonenumber = request.getParameter("phoneNumber");
                String email = request.getParameter("email");
                String address = request.getParameter("address");

                Integer point = null;
                try {
                    point = Integer.parseInt(request.getParameter("point"));
                } catch (NumberFormatException ex) {
                    log("Parameter point has wrong format.");
                }
                Integer roleid = null;
                try {
                    roleid = Integer.parseInt(request.getParameter("roleID"));
                } catch (NumberFormatException ex) {
                    log("Parameter point has wrong format.");
                }
                UserDAO dao = new UserDAO();
                UserDTO sales = dao.checkAccountExist(salesname);
                if (sales == null) {
                    sales = new UserDTO();
                    sales.setUserid(salesid);
                    sales.setUsername(salesname);
                    sales.setPassword(password);
                    sales.setFirstname(firstname);
                    sales.setLastname(lastname);
                    sales.setEmail(email);
                    sales.setPhonenumber(phonenumber);
                    sales.setAddress(address);
                    sales.setPoint(point);
                    sales.setRoleid(roleid);
                    userDAO.insert(sales);
                    request.setAttribute("sales", sales);
                    request.setAttribute("success", "Added Successfully!!!");
                    RequestDispatcher rd = request.getRequestDispatcher("salesedit.jsp");
                    rd.forward(request, response);
                } else {
                    request.setAttribute("error", "The username of the Sales Staff is already existed!!!");
                    RequestDispatcher rd = request.getRequestDispatcher("salesedit.jsp");
                    rd.forward(request, response);
                }

            } else if (action.equals("delete")) {//delete

                Integer id = null;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }

                userDAO.delete(id);

                int totalUsers = userDAO.getTotalUsers(keyword, "Sales Staff");
                int totalPages = (int) Math.ceil((double) totalUsers / pageSize);

                // Ensure page is within valid range
                if (page < 1) {
                    page = 1;
                } else if (page > totalPages) {
                    page = totalPages;
                }
                UserDAO dao = new UserDAO();
                request.setAttribute("currentPage", page);
                request.setAttribute("totalPages", totalPages);
                request.setAttribute("pageSize", pageSize);
                request.setAttribute("sortCol", sortCol);
                request.setAttribute("keyword", keyword);
                List<UserDTO> list = dao.list(keyword, sortCol, "Sales Staff", page, pageSize);
                request.setAttribute("saleslist", list);
                RequestDispatcher rd = request.getRequestDispatcher("saleslist.jsp");
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
