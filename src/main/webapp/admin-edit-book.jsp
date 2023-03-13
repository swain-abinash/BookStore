<%@page import="java.sql.ResultSet"%>
<%@page import="com.connection.DatabaseConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- Mobile Metas -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

</head>
<body>
	<jsp:include page="font-header.jsp"></jsp:include>
	<br>
	<br>


	<div class="container-fluid">

		<div class="row">
			<div class="col-md-6">
				<img alt="" src="images/Update-removebg-preview.png">
			</div>
			<div class="col-md-6">
				<h1>AddBook</h1>
				<br> <br>
				<div class="row">
					<div class="col-md-6">
						<%
						int id=Integer.parseInt(request.getParameter("id"));
						ResultSet rs=DatabaseConnection.getResultFromSqlQuery("select * from tblbook where bookid='"+id+"'");
							while(rs.next()){	
						%>
						<form action="AdminUpdateBook" method="post" >
						<label>BookID:-</label> <input type="text" class="form-control"
							name="id" value="<%=rs.getInt("bookid")%>" readonly="readonly"
							style="border-radius: 20px; background: #f1f1f1;">

					</div>
					<div class="col-md-6">
						<label>BookName:-</label> <input type="text" class="form-control"
							name="name" value="<%=rs.getString("bname")%>"
							style="border-radius: 20px; background: #f1f1f1;" readonly="readonly">

					</div>

				</div>
				<div class="row">
					<div class="col-md-6">
						<label>BookAuthor:-</label> <input type="text"
							class="form-control" name="author"  value="<%=rs.getString("author")%>"
							style="border-radius: 20px; background: #f1f1f1;" readonly="readonly">

					</div>
					<div class="col-md-6">
						<label>BookLanguage:-</label> <input type="text"
							class="form-control" name="language"  value="<%=rs.getString("language")%>"
							style="border-radius: 20px; background: #f1f1f1;">

					</div>

				</div>
				<div class="row">
					<div class="col-md-6">
						<label>BookPublisher:-</label> <input type="text"
							class="form-control" name="publisher"  value="<%=rs.getString("publisher")%>"
							style="border-radius: 20px; background: #f1f1f1;" readonly="readonly">

					</div>
					<div class="col-md-6">
						<label>BookReleaseDate:-</label> <input type="date"
							class="form-control" name="releasedate"  value="<%=rs.getString("releasedate")%>"
							style="border-radius: 20px; background: #f1f1f1;" readonly="readonly">

					</div>

				</div>
				<div class="row">
					<div class="col-md-12">
						<label>BookType:-</label> <select name="booktype"
							class="form-control"
							style="border-radius: 20px; background: #f1f1f1;">
							<option><%=rs.getString("btypem")%></option>
							<option>Programming Language</option>
							<option>Biographies</option>
							<option>Dictionaries</option>
							<option>Literature</option>
							<option>English Language Teaching</option>
							<option>Fiction</option>
							<option>References</option>
							<option>History</option>
							<option>Society</option>
							<option>Business</option>
							<option>Law</option>
							<option>Medicine</option>
							<option>Science</option>
							<option>Environment</option>
							<option>Technology</option>
							<option>Computer</option>
							<option>Lifestyle</option>
							<option>Children</option>
						</select>

					</div>
					

				</div>
				<div class="row">
					<div class="col-md-4">
						<label>MrpPrice:-</label> <input type="text" class="form-control"
							name="mrp"  value="<%=rs.getString("mrpp")%>"
							style="border-radius: 20px; background: #f1f1f1;">

					</div>
					<div class="col-md-4">
						<label>DiscountPrice:-</label> <input type="text"
							class="form-control" name="discount"  value="<%=rs.getString("price")%>"
							style="border-radius: 20px; background: #f1f1f1;">

					</div>
					<div class="col-md-4">
						<label>Delivery Charge</label> <input type="text"
							class="form-control" name="dprice"  value="<%=rs.getString("dprice")%>"
							style="border-radius: 20px; background: #f1f1f1;">
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<label>Status:-</label> <select name="status"
							class="form-control"
							style="border-radius: 20px; background: #f1f1f1;">
							<option><%=rs.getString("status")%></option>
							<option>Active</option>
							<option>Inactive</option>
							
						</select>

					</div>
					<div class="col-md-6">
						<label>Image:-</label> <img alt=""
							src="AdminAddBook?id=<%=rs.getInt("bookid")%>" width="80">

					</div>
<%} %>
				</div>
				<br>
				<div class="row">
					<div class="col-md-2 offset-4">

						<input type="submit" class="btn btn-info" value="Update">

					</div>
					<div class="col-md-6">

						<input type="reset" class="btn btn-danger" value="Cancle">
</form>
					</div>

				</div>
			</div>
		</div>

	</div>
	<br>
	<br>
	<br>
	<br>
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
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCh39n5U-4IoWpsVGUHWdqB6puEkhRLdmI&callback=myMap">
		
	</script>
	<!-- End Google Map -->
</body>
</html>