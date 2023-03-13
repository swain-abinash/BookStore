package com.customer;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class CustomerUpdate
 */
@WebServlet("/CustomerUpdate")
public class CustomerUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("cid"));
		String name = request.getParameter("name");
		String mobile = request.getParameter("mobile");
		String email = request.getParameter("email");
		String gender = request.getParameter("gender");
		String uname = request.getParameter("uname");
		String upass = request.getParameter("upass");
		String address = request.getParameter("address");	
HttpSession session=request.getSession();
		
		try {
			int editCustomer=DatabaseConnection.insertUpdateFromSqlQuery("update tblcustomer set email='"+email+"' ,fullname='"+name+"',mobile='"+mobile+"',address='"+address+"',upass='"+upass+"' where cid='"+session.getAttribute("customerId")+"'");

				if(editCustomer>0) {
				String message="Customer profile updated successfully.";
				session.setAttribute("success", message);
				response.sendRedirect("Customer-Profile.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}

	}

}
