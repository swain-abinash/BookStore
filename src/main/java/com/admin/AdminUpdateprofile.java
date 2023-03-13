package com.admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class AdminUpdateprofile
 */
@WebServlet("/AdminUpdateprofile")
public class AdminUpdateprofile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		
		String confpass = request.getParameter("cpass");
		String newpass = request.getParameter("newpass");
		
		HttpSession session = request.getSession();
		
		try {

			if (newpass.equals(confpass)) {

				int editBook = DatabaseConnection.insertUpdateFromSqlQuery("update tbladmin set upass='" + newpass
						+ "' where uname='" + session.getAttribute("uname") + "'");

				String message = "Password change successfully.";
				session.setAttribute("password-change-success", message);
				response.sendRedirect("admin-view-profile.jsp");
			} else {
				String message = "Old password does not match.";
				session.setAttribute("password-change-fail", message);
				response.sendRedirect("admin-change-password.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
