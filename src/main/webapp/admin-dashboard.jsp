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
  <br><br><br><br>
<div class="container">


<div class="content-wrapper">
		<div class="container">
			<div class="row pad-botm">
				<div class="col-md-12">
					<h4 class="header-line">ADMIN DASHBOARD</h4>

				</div>

			</div>

			<div class="row">

				<div class="col-md-3 col-sm-3 col-xs-6">
					<div class="alert alert-info back-widget-set text-center">
						<i class="fa fa-history fa-5x"></i>
						<%
							ResultSet totalProduct=DatabaseConnection.getResultFromSqlQuery("select count(*) from tblbook");
							totalProduct.next();
							int allProducts=totalProduct.getInt(1);
						%>
						<h3>
							<%=allProducts %>
						</h3>
						Total Products
					</div>
				</div>
				<div class="col-md-3 col-sm-3 col-xs-6">
					<div class="alert alert-success back-widget-set text-center">
						<i class="fa fa-users fa-5x"></i>
						<%
							ResultSet totalCustomer=DatabaseConnection.getResultFromSqlQuery("select count(*) from tblcustomer");
							totalCustomer.next();
							int allCustomer=totalCustomer.getInt(1);
						%>
						<h3><%=allCustomer %></h3>
						Total Customers
					</div>
				</div>
				<div class="col-md-3 col-sm-3 col-xs-6">
					<div class="alert alert-warning back-widget-set text-center">
						<i class="fa fa-recycle fa-5x"></i>
						<%
							ResultSet totalOrders=DatabaseConnection.getResultFromSqlQuery("select count(*) from tblorder");
							totalOrders.next();
							int allOrders=totalOrders.getInt(1);
						%>
						<h3><%=allOrders %></h3>
						Total Orders
					</div>
				</div>
				<div class="col-md-3 col-sm-3 col-xs-6">
					<div class="alert alert-danger back-widget-set text-center">
						<i class="fa fa-briefcase fa-5x"></i>
						<%
							ResultSet totalContacts=DatabaseConnection.getResultFromSqlQuery("select count(*) from tblcontact");
							totalContacts.next();
							int allContacts=totalContacts.getInt(1);
						%>
						<h3><%=allContacts %></h3>
						Total Contacts
					</div>
				</div>

			</div>
			
			
			
		</div>
	</div>


</div>
    <br><br><br><br><br><br><br><br>
  <!-- info section -->

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
