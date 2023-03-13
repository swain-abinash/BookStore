package com.admin;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class AdminAddBook
 */
@WebServlet("/AdminAddBook")
@MultipartConfig
public class AdminAddBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("image/jpeg");
		  int id = Integer.parseInt(request.getParameter("id"));
		  Connection conn = DatabaseConnection.getConnection();
		  String sql = "SELECT * FROM tblbook WHERE bookid ='"+id+"'";
		  PreparedStatement ps;
		  try {
		   ps = conn.prepareStatement(sql);
		   ResultSet rs = ps.executeQuery();
		   if(rs.next()){
		    byte [] imageData = rs.getBytes("img"); // extract byte data from the resultset..
		    OutputStream os = response.getOutputStream(); // output with the help of outputStream 
		             os.write(imageData);
		       	  os.close();
		       	 os.flush();
		   }
		  } catch (SQLException e) {
		   // TODO Auto-generated catch block
		   e.printStackTrace();
		   response.getOutputStream().close();
		   response.getOutputStream().flush();
		   
		  }
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	int id=Integer.parseInt(request.getParameter("id"));
		String name=	request.getParameter("name");
		String author=	request.getParameter("author");
		String language=	request.getParameter("language");
		String publisher=	request.getParameter("publisher");
		String releasedate=	request.getParameter("releasedate");
		String booktype=	request.getParameter("booktype");
		String mrp=	request.getParameter("mrp");
		String discount =	request.getParameter("discount");
		String dprice=	request.getParameter("dprice");
		String status =	request.getParameter("status");
        Part part=request.getPart("img");
		if(part!=null) {
			System.out.println(part.getName());
			System.out.println(part.getContentType());
			System.out.println(part.getSize());
		}
		InputStream inputStream=part.getInputStream();
		try {
		Connection cn=DatabaseConnection.getConnection();
		PreparedStatement ps=cn.prepareStatement("insert into tblbook(bookid,bname,author,releasedate,publisher,btypem,language,dprice,mrpp,price,img,status)value(?,?,?,?,?,?,?,?,?,?,?,?)");
		ps.setInt(1, id);
		ps.setString(2, name);
		ps.setString(3,author);
		ps.setString(4,releasedate);
		ps.setString(5,publisher);		
		ps.setString(6,booktype);
		ps.setString(7,language);
		ps.setString(8,discount);
		ps.setString(9,mrp);
		ps.setString(10,dprice );
		ps.setBlob(11, inputStream);
		ps.setString(12, status);
	int addbook=ps.executeUpdate();
	if(addbook>0) {
		response.sendRedirect("admin-view-book.jsp");
	}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
