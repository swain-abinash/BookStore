package com.testing;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.connection.DatabaseConnection;

public class Testing {

	public static void main(String[] args)  {
		int index = 0;
		ResultSet totalMedicine = DatabaseConnection.getResultFromSqlQuery("select tblbook.bookid,tblbook.bname,tblbook.quantity,tblcart.book_mrp_price,tblcart.book_discount_price,tblcart.total_book_price,tblcart.book_id from tblbook,tblcart where tblbook.bookid=tblcart.id and customer_id='303385'");
		try {
			while (totalMedicine.next()) {
				index++;
				System.out.println(index);
				System.out.println("hello");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
