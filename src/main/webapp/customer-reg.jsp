<!DOCTYPE html>
<%@page import="com.connection.DatabaseConnection"%>
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

<body class="sub_page">

  <div class="hero_area">
    <!-- header section strats -->
    <jsp:include page="font-header.jsp"></jsp:include>
    <!-- end header section -->
  </div>

  
<section class="contact_section layout_padding">
    <div class="container">
     <%if(session.getAttribute("success")!=null){
        	session.removeAttribute("success");
        	%>
        	
     <div class="alert alert-success">You have SuccessFully Register.<a href="Customer-login.jsp">Click Hear To Login</a></div>
        <% }
        %>
        <%if(session.getAttribute("failed")!=null){
        	session.removeAttribute("failed");
        	%>
        <div class="alert alert-danger" role="alert"> 
  Registration Failed
</div>
        <%} %>
      <div class="row">
      <div class="col-md-6">
          <div class="img-box">
            <img src="images/Customer-Reg-removebg-preview.png" alt="" style="margin-top: 10rem; width: 40rem;">
          </div>
        </div>
       
        <div class="col-md-6 ">
          <div class="heading_container ">
            <h2 class="">
              Register
            </h2>
          </div>
          <form action="CustomerReg" method="post">
          <%
          int id=DatabaseConnection.generateCustomerId();
          
          %>
          <div>
              <input type="text" name="cid"  value="<%=id%>" readonly="readonly" />
            </div>
            <div>
              <input type="text" name="name" placeholder="Name" />
            </div>
            <div>
              <input type="text" name="mobile" placeholder="Pone Number" />
            </div>
            <div>
              <input type="email" name="email" placeholder="Email" />
            </div>
            <div>
              <select name="gender" class="form-control" style="border-radius: 20px;background: #f1f1f1;">
              <option value="null">ChoseGender</option>
              <option >Male</option>
              <option >Female</option>
              </select>
            </div>
            <br>
            <div class="row">
          <div class="col-md-6"><div>
              <input type="text" name="uname" placeholder="User Name" />
            </div></div>
           <div class="col-md-6"><div>
              <input type="password" name="upass" placeholder="User Password" />
            </div></div>
          </div>
             
            
            <div>
              <input type="text" name="address" class="message-box" placeholder="Address" />
            </div>
            <div class="btn-box">
              <button>
                REGISTER
              </button>
            </div>
          </form>
        </div>
        
      </div>
    </div>
  </section>
  
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