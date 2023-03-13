<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<%
	int id=Integer.parseInt(request.getParameter("id"));
	int deleteProduct=DatabaseConnection.insertUpdateFromSqlQuery("delete from tblbook where bookid='"+id+"' ");
	if(deleteProduct>0){
		response.sendRedirect("admin-view-book.jsp");
	}else{
		response.sendRedirect("admin-view-book.jsp");
	}
%>