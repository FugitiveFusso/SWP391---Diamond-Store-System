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

            UserDAO userDAO = new UserDAO();
            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("managersession") == null) {
                response.sendRedirect("managerlogin.jsp");
                return;
            } else if (action == null || action.equals("list")) {//lists

                UserDAO dao = new UserDAO();
                List<UserDTO> list = dao.list(keyword, sortCol, "Sales Staff");
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
                try {
                    Connection conn = DBUtils.getConnection();
                    int salesid = 0;
                    String salesname = request.getParameter("userName");
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
                        salesid = rs.getInt(1);
                        salesid++;
                    }
                    UserDTO sales = new UserDTO();
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
                    RequestDispatcher rd = request.getRequestDispatcher("salesdetails.jsp");
                    rd.forward(request, response);
                } catch (SQLException ex) {
                    System.out.println("Insert sales error!" + ex.getMessage());
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

                List<UserDTO> list = userDAO.list(keyword, sortCol, "Sales Staff");
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
