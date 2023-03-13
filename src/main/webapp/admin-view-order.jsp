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

  <title>Bookstore</title>

  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
  <!-- font awesome style -->
  <link href="css/font-awesome.min.css" rel="stylesheet" />

  <!-- Custom styles for this template -->
  <link href="css/style.css" rel="stylesheet" />
  <!-- responsive style -->
  <link href="css/responsive.css" rel="stylesheet" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
<jsp:include page="admin-side-header.jsp"></jsp:include>
<section class="contact_section layout_padding">
   
   
 <div class="content-wrapper">
		<div class="container-fluid">
			<div class="row pad-botm">
				<div class="col-md-12">
					<h4 class="header-line">All Orders</h4>

				</div>

			</div>
			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="panel panel-success">
						<div class="panel-heading">All Orders</div>
						<div class="panel-body">
							<div class="table-responsive">
								<table class="table table-striped table-bordered table-hover">
									<thead>
										<tr>
											<th>#</th>
											<th>Order No</th>
											<th>Customer Details</th>
											<th>Product</th>
											<th>Qty</th>
											<th>Total Amount</th>
											<th>Status</th>
											<th>Order Date & Time</th>
											<th>Payment Mode</th>
											<th>Action</th>
										</tr>
									</thead>
									<%
									ResultSet resultOrders = DatabaseConnection.getResultFromSqlQuery("select * from tblorder");
									while (resultOrders.next()) {
									%>
									<tbody>
										<tr>
											<td><%=resultOrders.getInt(1)%></td>
											<td><%=resultOrders.getInt(2)%></td>
											<td><%=resultOrders.getString(3)%>|<%=resultOrders.getString(4)%>|<%=resultOrders.getString(5)%>|<%=resultOrders.getString(6)%></td>
											<td><img
												src="GetBookOrders?id=<%=resultOrders.getInt("id")%>" alt=""
												class="pro-image-front" style="width: 150px; height: 100px;"><br><%=resultOrders.getString("book_mrp_price")%></td>
											<td><%=resultOrders.getString("quantity")%></td>
											<td><%=resultOrders.getString("book_total_price")%></td>
											<%
											if (resultOrders.getString("book_order_status").equals("Deliver")) {
											%>
											<td><span class="label label-success">Delivered</span></td>
											<%
											} else {
											%>
											<td><span class="label label-danger">Pending</span></td>
											<%
											}
											%>
											<td><%=resultOrders.getString(16)%></td>
											<td><%=resultOrders.getString(17)%></td>
											<%
											if (resultOrders.getString("book_order_status").equals("Deliver")) {
											%>
											<td><a
												href="CustomerProductsOrderStatus?orderId=<%=resultOrders.getInt(2)%>"><button
														class="btn btn-danger"
														onClick="return confirm('Are you sure, You want to change product delivery status');">Pending</button></a></td>
											<%
											} else {
											%>
											<td><a
												href="CustomerProductsOrderStatus?orderId=<%=resultOrders.getInt(2)%>"><button
														class="btn btn-primary"
														onClick="return confirm('Are you sure, You want to change product delivery status?');">Deliver</button></a></td>
											<%
											}
											%>
										</tr>
									</tbody>
									<%
									}
									%>
								</table>
							</div>
						</div>
					</div>
				</div>

			</div>

   
   
   
   
   
   
   
   
  </section>
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