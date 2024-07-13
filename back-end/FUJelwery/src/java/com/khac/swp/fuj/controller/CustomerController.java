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

public class CustomerController extends HttpServlet {

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

            UserDAO userDAO = new UserDAO();
            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("adminsession") == null) {
                response.sendRedirect("adminlogin.jsp");
                return;
            } else if (action == null || action.equals("list")) {//lists

                int totalUsers = userDAO.getTotalUsers("Customer");
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
                List<UserDTO> list = dao.list(keyword, sortCol, "Customer", page, pageSize);
                request.setAttribute("customerlist", list);

                request.getRequestDispatcher("/customerlist.jsp").forward(request, response);

            } else if (action.equals("details")) {//details

                Integer id = null;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }

                UserDTO customer = null;
                if (id != null) {
                    customer = userDAO.load(id, "Customer");
                }

                request.setAttribute("customer", customer);//object
                RequestDispatcher rd = request.getRequestDispatcher("customerdetails.jsp");
                rd.forward(request, response);

            } else if (action.equals("edit")) {//edit
                Integer id = null;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }

                UserDTO customer = null;
                if (id != null) {
                    customer = userDAO.load(id, "Customer");
                }

                request.setAttribute("customer", customer);
                request.setAttribute("nextaction", "update");
                RequestDispatcher rd = request.getRequestDispatcher("customeredit.jsp");
                rd.forward(request, response);

            } else if (action.equals("create")) {//create
                UserDTO customer = new UserDTO();
                request.setAttribute("customer", customer);
                request.setAttribute("nextaction", "insert");
                RequestDispatcher rd = request.getRequestDispatcher("customeredit.jsp");
                rd.forward(request, response);

            } else if (action.equals("update")) {//update
                Integer customerid = null;
                try {
                    customerid = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }
                String customername = request.getParameter("userName");
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

                UserDTO customer = null;
                if (customerid != null) {
                    customer = userDAO.load(customerid, "Customer");
                }
                customer.setUserid(customerid);
                customer.setUsername(customername);
                customer.setFirstname(firstname);
                customer.setLastname(lastname);
                customer.setEmail(email);
                customer.setPhonenumber(phonenumber);
                customer.setAddress(address);
                customer.setPoint(point);
                userDAO.update(customer);

                request.setAttribute("customer", customer);
                RequestDispatcher rd = request.getRequestDispatcher("customerdetails.jsp");
                rd.forward(request, response);

            } else if (action.equals("insert")) {//insert
                try {
                    Connection conn = DBUtils.getConnection();
                    int customerid = 0;
                    String customername = request.getParameter("userName");
                    String firstname = request.getParameter("firstName");
                    String lastname = request.getParameter("lastName");
                    String phonenumber = request.getParameter("phoneNumber");
                    String email = request.getParameter("email");
                    String address = request.getParameter("address");
                    int roleid = Integer.parseInt(request.getParameter("roleID"));
                    Integer point = null;
                    try {
                        point = Integer.parseInt(request.getParameter("point"));
                    } catch (NumberFormatException ex) {
                        log("Parameter point has wrong format.");
                    }
                    PreparedStatement ps = conn.prepareStatement("select max(userID) from [User]");
                    ResultSet rs = ps.executeQuery();
                    if (rs.next()) {
                        customerid = rs.getInt(1);
                        customerid++;
                    }
                    UserDTO customer = new UserDTO();
                    customer.setUserid(customerid);
                    customer.setUsername(customername);
                    customer.setFirstname(firstname);
                    customer.setLastname(lastname);
                    customer.setEmail(email);
                    customer.setPhonenumber(phonenumber);
                    customer.setAddress(address);
                    customer.setPoint(point);
                    customer.setRoleid(roleid);
                    userDAO.insert(customer);
                    request.setAttribute("customer", customer);
                    RequestDispatcher rd = request.getRequestDispatcher("customerdetails.jsp");
                    rd.forward(request, response);
                } catch (SQLException ex) {
                    System.out.println("Insert Customer error!" + ex.getMessage());
                    ex.printStackTrace();
                }

            } else if (action.equals("delete")) {//delete

                Integer id = null;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }

                userDAO.delete(id);

                int totalUsers = userDAO.getTotalUsers("Customer");
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
                List<UserDTO> list = dao.list(keyword, sortCol, "Customer", page, pageSize);
                request.setAttribute("customerlist", list);
                RequestDispatcher rd = request.getRequestDispatcher("customerlist.jsp");
                rd.forward(request, response);
            } else if (action.equals("active")) {//active

                Integer id = null;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }

                userDAO.active(id);

                int totalUsers = userDAO.getTotalUsers("Customer");
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
                List<UserDTO> list = dao.list(keyword, sortCol, "Customer", page, pageSize);
                request.setAttribute("customerlist", list);
                RequestDispatcher rd = request.getRequestDispatcher("customerlist.jsp");
                rd.forward(request, response);
            } else if (action.equals("banned")) {//active

                Integer id = null;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }

                userDAO.banned(id);

                int totalUsers = userDAO.getTotalUsers("Customer");
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
                List<UserDTO> list = dao.list(keyword, sortCol, "Customer", page, pageSize);
                request.setAttribute("customerlist", list);
                RequestDispatcher rd = request.getRequestDispatcher("customerlist.jsp");
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
