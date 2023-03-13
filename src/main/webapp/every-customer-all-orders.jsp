<%@page import="com.connection.DatabaseConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <!-- Site Metas -->
  <link rel="icon" href="images/favicon.png" type="image/gif" />
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />

  <title>Bostorek</title>

  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
  <!-- font awesome style -->
  <link href="css/font-awesome.min.css" rel="stylesheet" />

  <!-- Custom styles for this template -->
  <link href="css/style.css" rel="stylesheet" />
  <!-- responsive style -->
  <link href="css/responsive.css" rel="stylesheet" />

</head>
<body>
<jsp:include page="font-header.jsp"></jsp:include>
<section class="contact_section layout_padding">
	
		<div class="bg-light py-3">
			<div class="container">
				<div class="row">
					<div class="col-md-12 mb-0">
						<a href="index.jsp">Home</a> <span class="mx-2 mb-0">/</span> <strong
							class="text-black">View All Orders</strong>
					</div>
				</div>
			</div>
		</div>
		<div class="site-section">
			<div class="container-fluid">
				<div class="row mb-5 shadow p-3 mb-5">
					<div class="site-blocks-table">
						<table id="table" id="table" class="table table-bordered">
							<thead>
								<tr>
									<th>Order No</th>
									<th>Book</th>
									<th>Quantity</th>
									<th>MRP(Rs)</th>
									<th>Selling Price(Rs)</th>
									<th>Total Price(Rs)</th>
									<th>Order Date</th>
									<th>Status</th>
								</tr>
							</thead>
							<%
								int index=0;
								ResultSet totalBook = DatabaseConnection.getResultFromSqlQuery("select * from tblorder where email_id='"+session.getAttribute("email")+"'");
								while (totalBook.next()) {
									index++;
							%>
							<tbody>
								<tr>
									<td><%=totalBook.getInt("order_no")%></td>
									<td class="product-thumbnail"><img
										src="GetBookOrders?id=<%=totalBook.getInt("id")%>" alt=""
										class="pro-image-front" style="width: 150px; height: 100px;"><br><%=totalBook.getString("book_name")%></td>
									<td class=""><%=totalBook.getDouble("quantity")%></td>
									<td><%=totalBook.getDouble("book_mrp_price")%>&nbsp;Rs.</td>
									<td><%=totalBook.getDouble("book_discount_price")%>&nbsp;Rs.</td>
									<td><%=totalBook.getDouble("book_total_price")%>&nbsp;Rs.</td>
									<td><%=totalBook.getString("created_at")%></td>
									<%
										if (totalBook.getString("book_order_status").equals("Delivered")) {
									%>
										<td><font color="green"><strong>Delivered</strong></font></td>
									<%
										} else if(totalBook.getString("book_order_status").equals("In Process")) {
									%>
										<td><font color="blue"><strong>In Process</strong></font></td>
									<%
										} else{
									%>
										<td><font color="red"><strong>Pending</strong></font></td>	
									<%
										}
									%>
								</tr>
								<%
									}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<br>
<br>
<jsp:include page="footer.jsp"></jsp:include>
	 <!-- jQery -->
  <script src="js/jquery-3.4.1.min.js"></script>
  <!-- bootstrap js -->
  <script src="js/bootstrap.js"></script>
  <!-- custom js -->
  <script src="js/custom.js"></script>
  <!-- Google Map -->
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCh39n5U-4IoWpsVGUHWdqB6puEkhRLdmI&callback=myMap">
  </script>
  <!-- End Google Map -->
</body>
</html>