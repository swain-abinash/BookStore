<!DOCTYPE html>
<%@page import="com.connection.DatabaseConnection"%>
<%@page import="java.sql.ResultSet"%>
<html>

<head>
  <!-- Basic -->
  <meta charset="utf-8" />
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

<body class="sub_page">

  <div class="hero_area">
    <!-- header section strats -->
    <jsp:include page="admin-side-header.jsp"></jsp:include>
    <!-- end header section -->
  </div>
 
 
 <div class="content-wrapper">
		<div class="container">
			<div class="row pad-botm">
				<div class="col-md-12">
					<h4 class="header-line">View Contacts</h4>

				</div>
			</div>
			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="panel panel-success">
						<div class="panel-heading">View Contacts</div>
						<div class="panel-body">
							<div class="table-responsive">
								<table class="table table-striped table-bordered table-hover">
									<thead>
										<tr>
											<th>#</th>
											<th>Name</th>
											<th>Email-Id</th>
											<th>Mobile</th>
											<th>Gender</th>
											<th>Address</th>
											<th>Action</th>
										</tr>
									</thead>
									<%
									ResultSet rs = DatabaseConnection.getResultFromSqlQuery("select * from tblcustomer");
									while (rs.next()) {
									%>
									<tbody>
										<tr>
											<td><%=rs.getInt("cid")%></td>
											<td><%=rs.getString("fullname")%></td>
											<td><%=rs.getString("email")%></td>
											<td><%=rs.getString("mobile")%></td>
											<td><%=rs.getString("gender")%></td>
											<td><%=rs.getString("address")%></td>
											
											<td><a
												href="admin-delete-contacts.jsp?id=<%=rs.getInt("cid")%>"
												class="btn btn-danger" onclick="return confirm('Are you sure Do you want to delete this contact?');">Delete</a></td>
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


		</div>
	</div>
  <!-- info section -->
<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
   <jsp:include page="footer.jsp"></jsp:include>
  <!-- footer section -->

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
