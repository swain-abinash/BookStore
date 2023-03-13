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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
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
						<a href="index.jsp">Home</a> <span class="mx-2 mb-0">/</span> <a
							href="">View Book</a> <span class="mx-2 mb-0"></span>
					</div>
				</div>
			</div>
		</div>
		<div class="site-section">
			<div class="container">
				<%
					ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tblbook where bookid='" + request.getParameter("id") + "'");
					if (resultset.next()) {
				%>
				<form action="AddBookToCart" method="post">
					<div class="row">
						<div class="col-md-5 mr-auto">
							<div class="border text-center">
								<input type="hidden" name="bookId"
									value="<%=resultset.getInt("bookid")%>"> <img
									src="AdminAddBook?id=<%=resultset.getInt("bookid")%>"
									alt="Image" class="img-fluid p-5" style="width:500px;height:500px;">
							</div>
						</div>
						<div class="col-md-6">
							<h4 class="text-black"><%=resultset.getString("bname")%></h4>
							<p>Author<%=resultset.getString("author")%></p>
							<input type="hidden" name="mrp_price"
								value="<%=resultset.getString("mrpp")%>">
							<input type="hidden" name="discount_price"
								value="<%=resultset.getString("dprice")%>">
							<p>
								<del><%=resultset.getString("mrpp")%>
									Rs/-
								</del>
								&nbsp; <strong class="text-primary h4"><%=resultset.getString("dprice")%>
									Rs/-</strong>
							</p>
							<p>
								Publish Date -
								<%=resultset.getString("releasedate")%></p>
							<p>
								Language:-
								<%=resultset.getString("language")%></p>
							<p>
								<input type="submit" value="Add to cart"
									class="buy-now btn btn-sm height-auto px-4 py-3 btn-primary"
									onclick="return confirm('Are you sure Do you want to add this item in cart?');">
							</p>
						</div>
					</div>
				</form>
				<%
					}
				%>
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