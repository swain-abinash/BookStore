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
						<a href="index.jsp">Home</a> <span class="mx-2 mb-0">/</span> <strong
							class="text-black">Books</strong>
					</div>
				</div>
			</div>
		</div>
		<div class="site-section bg-light">
			<div class="container">
				<div class="row shadow p-3 mb-5">
					 <%
			ResultSet retriveProduct = DatabaseConnection.getResultFromSqlQuery("select * from tblbook ");
			while (retriveProduct.next()) {
		%>
					<div class="col-sm-6 col-lg-4 text-center item mb-4 item-v2">
						<a href="book-single-add-cart.jsp?id=<%=retriveProduct.getInt("bookid")%>"> <img src="AdminAddBook?id=<%=retriveProduct.getInt("bookid")%>"
							alt="Image" style="width:180px;height:200px;"></a>
						<h3 class="text-dark">
							<a href="book-single-add-cart.jsp?id=<%=retriveProduct.getInt("bookid")%>"><%=retriveProduct.getString("bname") %></a>
						</h3>
						<p class="price">
							<del><%=retriveProduct.getString("mrpp")%> Rs/-</del>
							&nbsp; <%=retriveProduct.getString("dprice")%> Rs/-
						</p>
					</div>
					<%
						}
					%>
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