<%@page import="com.connection.DatabaseConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
    <div class="container">
    	<%
								String credential = (String) session.getAttribute("credential");
								if (credential != null) {
									session.removeAttribute("credential");
								%>
								<div class="alert alert-danger" id="danger">You have enter
									wrong credentials.</div>
								<%
								}
								%>
								<%
								String captchaCode = (String) session.getAttribute("verificationCode");
								if (captchaCode != null) {
									session.removeAttribute("verificationCode");
								%>
								<div class="alert alert-info" id="info">You have enter
									wrong verification code.</div>
								<%
								}
								%>
      <div class="row">
       <div class="col-md-6">
          <div class="img-box">
            <img src="images/adminlogin.png" alt="" style="margin-bottom:60rem;">
          </div>
        </div>
        <div class="col-md-6 ">
          <div class="heading_container ">
            <h2 class="">
              AdminLogin
            </h2>
          </div>
          <form action="AdminLogin" method="post">
            <div>
              <input type="text" name="uname" placeholder="Enter User Name" />
            </div>
            
            <div>
              <input type="password" name="upass" placeholder="Enter User Password" />
            </div>
             <div class="row">
            <%
									String captcha = null;
									Connection connection = DatabaseConnection.getConnection();
									Statement statement = connection.createStatement();
									ResultSet resultset = statement.executeQuery("select captcha from tblcaptcha");
									if (resultset.next()) {
										captcha = resultset.getString(1);
									}
									%>
          <div class="col-md-6"> <input type="text" name="vercode" placeholder="Enter Captcha" /></div>
           <div class="col-md-6"><h6>Captcha Code</h6><lable><%=captcha %></lable></div>
          </div>
            
            <div class="btn-box">
              <button>
                LOGIN
              </button>
            </div>
          </form>
        </div>
       
      </div>
    </div>
  </section>
  
  
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