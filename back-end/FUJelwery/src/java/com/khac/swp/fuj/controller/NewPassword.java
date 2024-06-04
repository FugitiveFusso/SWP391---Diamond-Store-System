package com.khac.swp.fuj.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.khac.swp.fuj.utils.DBUtils;

/**
 * Servlet implementation class NewPassword
 */
@WebServlet("/newPassword")
public class NewPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String newPassword = request.getParameter("password");
		String confPassword = request.getParameter("confPassword");
		RequestDispatcher dispatcher = null;

		if (newPassword != null && confPassword != null && newPassword.equals(confPassword)) {
			try {
				Connection con = DBUtils.getConnection();
				if (con != null) {
					PreparedStatement pst = con.prepareStatement("UPDATE [User] SET password = ? WHERE email = ?");
					pst.setString(1, newPassword);
					pst.setString(2, (String) session.getAttribute("email"));

					int rowCount = pst.executeUpdate();
					if (rowCount > 0) {
						request.setAttribute("status", "resetSuccess");
						dispatcher = request.getRequestDispatcher("userlogin.jsp");
					} else {
						request.setAttribute("status", "resetFailed");
						dispatcher = request.getRequestDispatcher("userlogin.jsp");
					}
					dispatcher.forward(request, response);
					pst.close();
					con.close();
				} else {
					// Handle the case where the connection is null
					request.setAttribute("status", "connectionFailed");
					dispatcher = request.getRequestDispatcher("error.jsp");
					dispatcher.forward(request, response);
				}
			} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("status", "exception");
				dispatcher = request.getRequestDispatcher("error.jsp");
				dispatcher.forward(request, response);
			}
		} else {
			// Handle the case where the passwords do not match
			request.setAttribute("status", "passwordMismatch");
			dispatcher = request.getRequestDispatcher("resetPassword.jsp");
			dispatcher.forward(request, response);
		}
	}
}
