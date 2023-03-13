package com.order;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class GetBookOrders
 */
@WebServlet("/GetBookOrders")
public class GetBookOrders extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("image/jpeg");
		int id = Integer.parseInt(request.getParameter("id"));
		Connection conn = DatabaseConnection.getConnection();
		String sql = "SELECT * FROM tblorder WHERE ID ='" + id + "'";
		PreparedStatement ps;
		try {
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				byte[] imageData = rs.getBytes("book_image"); // extract byte data from the resultset..
				OutputStream os = response.getOutputStream(); // output with the help of outputStream
				os.write(imageData);
				os.flush();
				os.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			response.getOutputStream().flush();
			response.getOutputStream().close();
		}

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession hs = request.getSession();
		int id = 0;
		int quantity = 0;
		int order_no = 1000;
		int orderBook = 0;
		String order_status = null;
		int BookId = 0;
		String Book_name = null;
		String Book_price = null;
		String Book_selling_price = null;
		String Book_total_price = null;
		String Book_status = null;
		String customerName = request.getParameter("name");
		String mobile_number = request.getParameter("phone");
		String email_id = request.getParameter("email");
		String address = request.getParameter("address");

		String payment_mode = request.getParameter("payment");
		int paymentId = Integer.parseInt(request.getParameter("payment_id"));
		HttpSession session = request.getSession();
		session.setAttribute("paymentId", paymentId);

		try {
			ResultSet rsMaxOrderNo = DatabaseConnection.getResultFromSqlQuery("select max(order_no) from tblorder");
			if (rsMaxOrderNo.next()) {
				order_no = rsMaxOrderNo.getInt(1);
				order_no = 1000 + order_no;
			}
			System.out.println("Order Id " + order_no);
			ResultSet totalBook = DatabaseConnection.getResultFromSqlQuery(
					"select tblbook.img,tblbook.bname,tblcart.quantity,tblcart.book_mrp_price,tblcart.book_discount_price,tblcart.total_book_price,tblcart.book_id,tblbook.bookid from tblbook,tblcart where tblbook.bookid=tblcart.book_id and customer_id='"
							+ session.getAttribute("customerId") + "' ");
			while (totalBook.next()) {
				order_no++;
				System.out.println("Order No  " + order_no);
				Blob Book_image_name = totalBook.getBlob(1);
				Book_name = totalBook.getString(2);
				quantity = totalBook.getInt(3);
				Book_price = totalBook.getString(4);
				Book_selling_price = totalBook.getString(5);
				Book_total_price = totalBook.getString(6);
				BookId = totalBook.getInt(8);
				order_status = "Pending";
				Connection connection = DatabaseConnection.getConnection();
				PreparedStatement ps = connection.prepareStatement(
						"insert into tblorder(id,order_no,customer_name,email_id,mobile_no,address,book_image,book_name,quantity,book_mrp_price,book_discount_price,book_total_price,book_order_status,payment_mode,payment_id)value(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
				ps.setInt(1, id);
				ps.setInt(2, order_no);
				ps.setString(3, customerName);
				ps.setString(4, email_id);
				ps.setString(5, mobile_number);
				ps.setString(6, address);
				
				ps.setBlob(7, Book_image_name);
				ps.setString(8, Book_name);
				ps.setInt(9, quantity);
				ps.setString(10, Book_price);
				ps.setString(11, Book_selling_price);
				ps.setString(12, Book_total_price);
				ps.setString(13, order_status);
				ps.setString(14, payment_mode);
				ps.setInt(15, paymentId);
				orderBook = ps.executeUpdate();
				int updateBookQuantityInBook = DatabaseConnection
						.insertUpdateFromSqlQuery("update tblbook set quantity= quantity-'"
								+ quantity + "' where bookid='" + BookId + "'");
			}

			DatabaseConnection.insertUpdateFromSqlQuery(
					"delete from tblcart where customer_id='" + session.getAttribute("customerId") + "'");
			if (orderBook > 0) {
				String message = "Thank you for your order.";
				hs.setAttribute("success", message);
				response.sendRedirect("customer-cart.jsp");
			} else {
				response.sendRedirect("customer-cart.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
