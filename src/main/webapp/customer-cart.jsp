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
						<a href="index.html">Home</a> <span class="mx-2 mb-0">/</span> <strong
							class="text-black">Cart</strong>
					</div>
				</div>
			</div>
		</div>

		<div class="site-section">
		
			<div class="container">
				<%
					int index = 0;
					int paymentId = 1001;
					ResultSet rsCountCheck = DatabaseConnection.getResultFromSqlQuery("select count(*) from tblcart where customer_id='" + session.getAttribute("customerId") + "'");
					rsCountCheck.next();
					int cartItem = rsCountCheck.getInt(1);
					System.out.println("cartItem  " + cartItem);
					if (cartItem > 0) {
				%>
				<%
					String quantity = (String) session.getAttribute("quantity-short");
					if (quantity != null) {
					session.removeAttribute("quantity-short");
				%>
					<div class="alert alert-danger" id="danger">Book quantity is not enough to purchase.</div>
				<%
					}
				%>
				<div class="row mb-5 shadow p-3 mb-5">
					<div class="site-blocks-table">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>SR.No</th>
									<th>Medicine</th>
									<th>Quantity</th>
									<th>MRP(Rs)</th>
									<th>Selling Price(Rs)</th>
									<th>Total Price(Rs)</th>
									<th>Action</th>
								</tr>
							</thead>
							<%
							
								ResultSet totalMedicine = DatabaseConnection.getResultFromSqlQuery("select tblbook.bookid,tblbook.bname,tblcart.quantity,tblcart.book_mrp_price,tblcart.book_discount_price,tblcart.total_book_price,tblcart.book_id from tblbook,tblcart where tblbook.bookid=tblcart.book_id and customer_id='303385'");
								while (totalMedicine.next()) {
									
									
							%>
							<tbody>
							<tr>
								<td class="invert"><%=index%></td>
									<td class="product-thumbnail"><img
										src="AdminAddBook?id=<%=totalMedicine.getInt(1)%>" width="80"" alt=""
										class="pro-image-front" style="width: 150px; height: 100px;"><br><%=totalMedicine.getString(2)%></td>
									<td>
										<form action="UpdateBookQuantity" method="post">
											<div class="input-group mb-3" style="max-width: 80px;">
												<input type="hidden" value="<%=totalMedicine.getInt(7)%>"
													name="bookId"> <input type="text"
													name="quantity" value="<%=totalMedicine.getInt(3)%>"
													class="form-control text-center"> <input
													type="submit" value="+" class="btn btn-outline-primary">
											</div>
										</form>
									</td>
									<td class=""><del><%=totalMedicine.getDouble(4)%>&nbsp;Rs.
										</del></td>
									<td><%=totalMedicine.getDouble(5)%>&nbsp;Rs.</td>
									<td><%=totalMedicine.getDouble(6)%>&nbsp;Rs.</td>
									<td><a href="remove-book-from-cart.jsp?bookId=<%=totalMedicine.getInt(7)%>&quantity=<%=totalMedicine.getInt(3)%>" class="btn btn-primary height-auto btn-sm" onclick="return confirm('Are you sure do you want to delete this medicine?');">X</a></td>
								</tr>
								<%
									}
								%>
								<%
									double finalBill = 0.0;
									ResultSet totolAmount = DatabaseConnection.getResultFromSqlQuery("select sum(total_book_price) from tblcart where customer_id='"+ session.getAttribute("customerId") + "' ");
									if (totolAmount.next()) {
										finalBill = totolAmount.getInt(1);
									}
								%>
								<tr>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td colspan="2"><strong>
												Total Amount.:&nbsp;<%=finalBill%>
												Rs.
											</strong></td>
								</tr>
								
							</tbody>
						</table>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div class="row mb-5">
							<div class="col-md-6">
								<a href="allopathy-medicine.jsp"
									class="btn btn-outline-primary btn-md btn-block">Continue
									Shopping</a>
							</div>
						</div>
					<form action="GetBookOrders" method="post">
						<div class="row">
							<div class="col-md-12">
								<label class="text-black h4" for="coupon">Billing
									Address</label>
								<p>Note: Now only cash on delivery payment mode is
									available.</p>
							</div>
						</div>
						<%
							ResultSet userInfoResult = DatabaseConnection.getResultFromSqlQuery("select * from tblcustomer where cid='"+ session.getAttribute("customerId") + "' and uname='" + session.getAttribute("uname") + "'");
							if (userInfoResult.next()) {
						%>
						<div class="form-group">
							<label>Your Name</label> <input type="text" name="name"
								value="<%=userInfoResult.getString("fullname")%>"
								placeholder="" required="required" style="width: 1135px; height: 40px;"
								class="form-control" readonly>
						</div>
						<div class="form-group">
							<label>Mobile Number</label> <input type="text" name="phone"
								value="<%=userInfoResult.getString("mobile")%>"
								placeholder="" required="required" style="width: 1135px; height: 40px;"
								class="form-control" readonly>
						</div>
						<div class="form-group">
							<label>Email Id</label> <input type="text" name="email"
								value="<%=userInfoResult.getString("email")%>" placeholder=""
								required="required" style="width: 1135px; height: 40px;"
								class="form-control" readonly>
						</div>
						<div class="form-group">
							<label>Address</label> <input type="text" name="address"
								value="<%=userInfoResult.getString("address")%>" placeholder=""
								required="required" style="width: 1135px; height: 100px;"
								class="form-control">
						</div>
						
						<div class="form-group">
							<label>Select Payment Mode</label> <select name="payment"
								style="width: 1135px; height: 40px;" class="form-control">
								<option selected="selected">COD</option>
								<option disabled="disabled">Credit Card</option>
								<option disabled="disabled">Debit Card</option>
								<option disabled="disabled">Online Banking</option>
								<option disabled="disabled">UPI Id</option>
							</select>
						</div>
						<div class="row">
							<%
								ResultSet rsPaymentId = DatabaseConnection.getResultFromSqlQuery("select max(payment_id) from tblorder");
								if (rsPaymentId.next()) {
								paymentId = rsPaymentId.getInt("max(payment_id)");
								paymentId++;
							}
							%>
							<div class="col-md-12">
								<input type="hidden" name="payment_id" value="<%=paymentId%>">
								<button class="btn btn-primary btn-lg btn-block"
									onclick="return confirm('Are you sure do you want to buy this order?');">Buy Products</button>
							</div>
						</div>
						</form>
						<%
							}
						%>
					</div>
				</div>
					<%
					}else{	
				%>
					Thanks for giving order.&nbsp;<a href="customer-book-invoice.jsp?paymentId=<%=paymentId%>">Print Your Medicine Order
					Bill</a><br>
				<%
					if (index == 0) {
				%>
					<strong>There is no item(s) in your Cart.&nbsp;<a href="books.jsp">Shop Now</a></strong>
				<%
					}
				%>
				<%
					}
				%>	
			</div>
		</div>
</div>
<br>
<br>

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