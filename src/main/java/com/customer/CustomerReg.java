package com.customer;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.eclipse.jdt.internal.compiler.env.IUpdatableModule.AddReads;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class CustomerReg
 */
@WebServlet("/CustomerReg")
public class CustomerReg extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("cid"));
		String name = request.getParameter("name");
		String mobile = request.getParameter("mobile");
		String email = request.getParameter("email");
		String gender = request.getParameter("gender");
		String uname = request.getParameter("uname");
		String upass = request.getParameter("upass");
		String address = request.getParameter("address");
		HttpSession hs = request.getSession();

		int creg = DatabaseConnection.insertUpdateFromSqlQuery(
				"insert into tblcustomer(cid,fullname,email,mobile,gender,uname,upass,address)value('"+id+"','" + name + "','"
						+ email + "','" + mobile + "','" + gender + "','" + uname + "','" + upass + "','" + address
						+ "')");
		if (creg > 0) {
			hs.setAttribute("success", "successful");
			response.sendRedirect("customer-reg.jsp");
		} else {
			hs.setAttribute("failed", "faildedd");
			response.sendRedirect("customer-reg.jsp");
		}
	}

}
