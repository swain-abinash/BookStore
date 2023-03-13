package com.customer;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class AddBookToCart
 */
@WebServlet("/AddBookToCart")
public class AddBookToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = 0;
		HttpSession hs = request.getSession();
		int bookId = Integer.parseInt(request.getParameter("bookId"));
		double mrp_price = Double.parseDouble(request.getParameter("mrp_price"));
		double discount_price = Double.parseDouble(request.getParameter("discount_price"));
		
		try {	
			if ((String) hs.getAttribute("uname") == null) {
				response.sendRedirect("mandatory-customer-login.jsp");
			} else {
				ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tblcart where book_id='" + bookId + "' and customer_id='"+ hs.getAttribute("customerId")+"'");
				if (resultset.next()) {
					response.sendRedirect("already-medicine-added-in-cart.jsp");
				}else{
					int addToCart = DatabaseConnection.insertUpdateFromSqlQuery("insert into tblcart(id,customer_id,book_id,book_mrp_price,book_discount_price,total_book_price,quantity) values('"
							+ id + "','" + hs.getAttribute("customerId") + "','" + bookId + "','" + mrp_price + "','"
							+ discount_price + "','" + discount_price + "',1)");
					if (addToCart > 0) {
						response.sendRedirect("books.jsp");
					}
				}	
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
