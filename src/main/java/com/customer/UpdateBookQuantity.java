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
 * Servlet implementation class UpdateBookQuantity
 */
@WebServlet("/UpdateBookQuantity")
public class UpdateBookQuantity extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int Bookquantity = 0;
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		int bookId = Integer.parseInt(request.getParameter("bookId"));
		HttpSession session = request.getSession();
		double book_discount_price = 0.0;
		double productPrice = 0.0;
		try {
			ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select quantity from tblbook where bookid='" + bookId + "'");
			if (resultset.next()) {
				Bookquantity = resultset.getInt("quantity");
			}
			if (Bookquantity> quantity) {
				ResultSet rs = DatabaseConnection.getResultFromSqlQuery("select book_discount_price from tblcart where customer_id='"+ session.getAttribute("customerId") + "' and book_id='" + bookId + "'");
				while (rs.next()) {
					book_discount_price = Double.parseDouble(rs.getString("book_discount_price"));
					productPrice = book_discount_price;
				}
				productPrice = productPrice * quantity;
				int updateQuantity = DatabaseConnection.insertUpdateFromSqlQuery("update tblcart set quantity='"+ quantity + "',total_book_price='" + productPrice + "' where customer_id='"+ session.getAttribute("customerId") + "' and book_id='" + bookId + "' ");
				//int updatebookQuantityInbook = DatabaseConnection.insertUpdateFromSqlQuery("update tblbook set medicine_quantity= book_quantity-'" + quantity+ "' where id='" + bookId + "'");
				if (updateQuantity > 0) {
					response.sendRedirect("customer-cart.jsp");
				}
			} else {
				String message = "book quantity is not enough to purchase.";
				session.setAttribute("quantity-short", message);
				response.sendRedirect("customer-cart.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
