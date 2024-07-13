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

public class DeliveryStaffController extends HttpServlet {

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

                int totalUsers = userDAO.getTotalUsers("Delivery Staff");
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
                List<UserDTO> list = dao.list(keyword, sortCol, "Delivery Staff", page, pageSize);
                request.setAttribute("deliverystafflist", list);

                request.getRequestDispatcher("/deliverystafflist.jsp").forward(request, response);

            } else if (action.equals("details")) {//details

                Integer id = null;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }

                UserDTO deliverystaff = null;
                if (id != null) {
                    deliverystaff = userDAO.load(id, "Delivery Staff");
                }

                request.setAttribute("deliverystaff", deliverystaff);//object
                RequestDispatcher rd = request.getRequestDispatcher("deliverystaffdetails.jsp");
                rd.forward(request, response);

            } else if (action.equals("edit")) {//edit
                Integer id = null;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }

                UserDTO deliverystaff = null;
                if (id != null) {
                    deliverystaff = userDAO.load(id, "Delivery Staff");
                }

                request.setAttribute("deliverystaff", deliverystaff);
                request.setAttribute("nextaction", "update");
                RequestDispatcher rd = request.getRequestDispatcher("deliverystaffedit.jsp");
                rd.forward(request, response);

            } else if (action.equals("create")) {//create
                UserDTO deliverystaff = new UserDTO();
                request.setAttribute("deliverystaff", deliverystaff);
                request.setAttribute("nextaction", "insert");
                RequestDispatcher rd = request.getRequestDispatcher("deliverystaffedit.jsp");
                rd.forward(request, response);

            } else if (action.equals("update")) {//update
                Integer deliverystaffid = null;
                try {
                    deliverystaffid = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }
                String deliverystaffname = request.getParameter("userName");
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

                UserDTO deliverystaff = null;
                if (deliverystaffid != null) {
                    deliverystaff = userDAO.load(deliverystaffid, "Delivery Staff");
                }
                deliverystaff.setUserid(deliverystaffid);
                deliverystaff.setUsername(deliverystaffname);
                deliverystaff.setPassword(password);
                deliverystaff.setFirstname(firstname);
                deliverystaff.setLastname(lastname);
                deliverystaff.setEmail(email);
                deliverystaff.setPhonenumber(phonenumber);
                deliverystaff.setAddress(address);
                deliverystaff.setPoint(point);
                userDAO.update(deliverystaff);

                request.setAttribute("deliverystaff", deliverystaff);
                RequestDispatcher rd = request.getRequestDispatcher("deliverystaffdetails.jsp");
                rd.forward(request, response);

            } else if (action.equals("insert")) {//insert

                Connection conn = DBUtils.getConnection();
                Integer deliverystaffid = null;
                try {
                    deliverystaffid = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }
                String deliverystaffname = request.getParameter("userName");
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
                UserDTO deliverystaff = dao.checkAccountExist(deliverystaffname);
                if (deliverystaff == null) {
                    deliverystaff = new UserDTO();
                    deliverystaff.setUserid(deliverystaffid);
                    deliverystaff.setUsername(deliverystaffname);
                    deliverystaff.setPassword(password);
                    deliverystaff.setFirstname(firstname);
                    deliverystaff.setLastname(lastname);
                    deliverystaff.setEmail(email);
                    deliverystaff.setPhonenumber(phonenumber);
                    deliverystaff.setAddress(address);
                    deliverystaff.setPoint(point);
                    deliverystaff.setRoleid(roleid);
                    userDAO.insert(deliverystaff);
                    request.setAttribute("deliverystaff", deliverystaff);
                    request.setAttribute("success", "Added Successfully!!!");
                    RequestDispatcher rd = request.getRequestDispatcher("deliverystaffedit.jsp");
                    rd.forward(request, response);
                } else {
                    request.setAttribute("error", "The username of the Delivery Staff is already existed!!!");
                    RequestDispatcher rd = request.getRequestDispatcher("deliverystaffedit.jsp");
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

                int totalUsers = userDAO.getTotalUsers("Delivery Staff");
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
                List<UserDTO> list = dao.list(keyword, sortCol, "Delivery Staff", page, pageSize);
                request.setAttribute("deliverystafflist", list);
                RequestDispatcher rd = request.getRequestDispatcher("deliverystafflist.jsp");
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
