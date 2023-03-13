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
	<jsp:include page="admin-side-header.jsp"></jsp:include>
	<br>
	<br>

 	
	<div class="container-fluid">
	<%
									ResultSet rs = DatabaseConnection.getResultFromSqlQuery("select * from tblbook");
									while (rs.next()) {
									%>
	<div class="row">
        <div class="col-md-4 offset-4">
          <div class="card shadow-sm">
           <img alt="" src="AdminAddBook?id=<%=rs.getInt("bookid")%>" width="380" height="300">
            <div class="card-body">
              <p class="card-text">
              <h4>Name:-<%=rs.getString("bname")%></h4>
              <h4>Author:-<%=rs.getString("author")%></h4>
											<h4>ReleaseDate:-<%=rs.getString("releasedate")%></h4>
											<h4>Publisher:-<%=rs.getString("publisher")%></h4>
											<h4>BookType:-<%=rs.getString("btypem")%></h4>
											<h4>Language:-<%=rs.getString("language")%></h4>
											<h4>DisCountPrice:-<%=rs.getString("price")%></h4>
											<h4>MRP:-<del><%=rs.getString("mrpp")%></del></h4>
											<h4>DeliverCharge:-<%=rs.getString("dprice")%></h4>
											<h4>Status:-<%=rs.getString("status")%></h4>
              </p>
              <div class="d-flex justify-content-between align-items-center">
                
                
              </div>
            </div>
          </div>
        </div>
        </div>
        <%} %>
</div>
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