package com.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class AdminUpdateBook
 */
@WebServlet("/AdminUpdateBook")
public class AdminUpdateBook extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		int id=Integer.parseInt(request.getParameter("id"));
		
		
		String language=	request.getParameter("language");
		
		String booktype=	request.getParameter("booktype");
		String mrp=	request.getParameter("mrp");
		String discount =	request.getParameter("discount");
		String dprice=	request.getParameter("dprice");
		String status =	request.getParameter("status");
		
		HttpSession session = request.getSession();
		
		try {

			

				int editCustomer = DatabaseConnection.insertUpdateFromSqlQuery("update tblbook set language='"+language+"',btypem='"+booktype+"',mrpp='"+mrp+"',dprice='"+discount+"',price='"+dprice+"',status='"+status+"' where bookid='"+id+"'");
		
				String message = "BookUpdated successfully.";
				session.setAttribute("bookUpdated", message);
				response.sendRedirect("admin-view-book.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
		}

	}


}
