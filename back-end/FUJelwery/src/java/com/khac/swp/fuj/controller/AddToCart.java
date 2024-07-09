/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.khac.swp.fuj.controller;

import com.khac.swp.fuj.order.OrderDAO;
import com.khac.swp.fuj.order.OrderDTO;
import com.khac.swp.fuj.ring.RingDAO;
import com.khac.swp.fuj.ring.RingDTO;
import com.khac.swp.fuj.utils.DBUtils;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;

/**
 *
 * @author Dell
 */
@WebServlet(name = "AddToCart", urlPatterns = {"/AddToCart"})
public class AddToCart extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html:charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Connection conn = null;
            try {
                conn = DBUtils.getConnection();
                PreparedStatement ps = conn.prepareStatement("SELECT MAX(orderID) FROM [Order]");
                ResultSet rs = ps.executeQuery();
                Integer orderID = null;
                if (rs.next()) {
                    orderID = rs.getInt(1);
                    orderID++;
                }

                Integer ringID = null;
                try {
                    ringID = Integer.parseInt(request.getParameter("ringID"));
                } catch (NumberFormatException ex) {
                    log("Parameter ringID has wrong format.");
                }
                Integer userID = null;
                try {
                    userID = Integer.parseInt(request.getParameter("userID"));
                } catch (NumberFormatException ex) {
                    log("Parameter userID has wrong format.");
                }
                Integer ringSize = null;
                try {
                    ringSize = Integer.parseInt(request.getParameter("ringSize"));
                } catch (NumberFormatException ex) {
                    log("Parameter ringSize has wrong format.");
                }
                String status = "pending";

                OrderDTO order = new OrderDTO();
                order.setOrderID(orderID);
                order.setUserID(userID);
                order.setRingID(ringID);
                order.setRingSize(ringSize);
                order.setStatus(status);

                OrderDAO dao = new OrderDAO();
                dao.insert(order);

                // Redirect to prevent duplicate submission
                Integer id = null;
                try {
                    id = Integer.parseInt(request.getParameter("ringID"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }

                RingDTO product = null;
                RingDAO ringDAO = new RingDAO();
                if (id != null) {
                    product = ringDAO.load(id);
                }

                request.setAttribute("success", "Add the ring to your cart successfully!");

                request.setAttribute("product", product);//object
                request.getRequestDispatcher("/productdetails.jsp").forward(request, response);
            } catch (SQLException e) {
                throw new ServletException(e);
            } finally {
                try {
                    if (conn != null) {
                        conn.close();
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
