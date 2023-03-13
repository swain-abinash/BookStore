package com.contact;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class Contact
 */
@WebServlet("/Contact")
public class Contact extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id=0;
		HttpSession hs=request.getSession();
		String fullname=request.getParameter("name");
		String email=request.getParameter("email");
		String phone=request.getParameter("pone");
		String message=request.getParameter("msg");
		try {
			int help=DatabaseConnection.insertUpdateFromSqlQuery("insert into tblcontact(name,email,mobile,message)values('"+fullname+"','"+email+"','"+phone+"','"+message+"')");
			if(help>0) {
				String success="Thanks for contacting us! We will get in touch with you.";
				hs.setAttribute("message", success);
				response.sendRedirect("contact.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
