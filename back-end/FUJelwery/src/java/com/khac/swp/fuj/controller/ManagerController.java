/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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

/**
 *
 * @author phucu
 */
public class ManagerController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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

            UserDAO userDAO = new UserDAO();
            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("adminsession") == null) {
                response.sendRedirect("adminlogin.jsp");
                return;
            } else if (action == null || action.equals("list")) {//lists

                UserDAO dao = new UserDAO();
                List<UserDTO> list = dao.list(keyword, sortCol, "Manager");
                request.setAttribute("managerlist", list);

                request.getRequestDispatcher("/managerlist.jsp").forward(request, response);

            } else if (action.equals("details")) {//details

                Integer id = null;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }

                UserDTO manager = null;
                if (id != null) {
                    manager = userDAO.load(id, "Manager");
                }

                request.setAttribute("manager", manager);//object
                RequestDispatcher rd = request.getRequestDispatcher("managerdetails.jsp");
                rd.forward(request, response);

            } else if (action.equals("edit")) {//edit
                Integer id = null;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }

                UserDTO manager = null;
                if (id != null) {
                    manager = userDAO.load(id, "Manager");
                }

                request.setAttribute("manager", manager);
                request.setAttribute("nextaction", "update");
                RequestDispatcher rd = request.getRequestDispatcher("manageredit.jsp");
                rd.forward(request, response);

            } else if (action.equals("create")) {//create
                UserDTO manager = new UserDTO();
                request.setAttribute("manager", manager);
                request.setAttribute("nextaction", "insert");
                RequestDispatcher rd = request.getRequestDispatcher("manageredit.jsp");
                rd.forward(request, response);

            } else if (action.equals("update")) {//update
                Integer managerid = null;
                try {
                    managerid = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }
                String managername = request.getParameter("userName");
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

                UserDTO manager = null;
                if (managerid != null) {
                    manager = userDAO.load(managerid, "Manager");
                }
                manager.setUserid(managerid);
                manager.setUsername(managername);
                manager.setPassword(password);
                manager.setFirstname(firstname);
                manager.setLastname(lastname);
                manager.setEmail(email);
                manager.setPhonenumber(phonenumber);
                manager.setAddress(address);
                manager.setPoint(point);
                userDAO.update(manager);

                request.setAttribute("manager", manager);
                RequestDispatcher rd = request.getRequestDispatcher("managerdetails.jsp");
                rd.forward(request, response);

            } else if (action.equals("insert")) {//insert
                try {
                    Connection conn = DBUtils.getConnection();
                    int managerid = 0;
                    String managername = request.getParameter("userName");
                    String password = request.getParameter("password");
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
                        managerid = rs.getInt(1);
                        managerid++;
                    }
                    UserDTO manager = new UserDTO();
                    manager.setUserid(managerid);
                    manager.setUsername(managername);
                    manager.setPassword(password);
                    manager.setFirstname(firstname);
                    manager.setLastname(lastname);
                    manager.setEmail(email);
                    manager.setPhonenumber(phonenumber);
                    manager.setAddress(address);
                    manager.setPoint(point);
                    manager.setRoleid(roleid);
                    userDAO.insert(manager);
                    request.setAttribute("manager", manager);
                    RequestDispatcher rd = request.getRequestDispatcher("managerdetails.jsp");
                    rd.forward(request, response);
                } catch (SQLException ex) {
                    System.out.println("Insert manager error!" + ex.getMessage());
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

                List<UserDTO> list = userDAO.list(keyword, sortCol, "Manager");
                request.setAttribute("managerlist", list);
                RequestDispatcher rd = request.getRequestDispatcher("managerlist.jsp");
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
