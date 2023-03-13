 <%@page import="java.sql.ResultSet"%>
<%@page import="com.connection.DatabaseConnection"%>
<header class="header_section">
      <div class="container-fluid">
        <nav class="navbar navbar-expand-lg custom_nav-container ">
          <a class="navbar-brand" href="index.html">
            <span>
              Bookstore
            </span>
          </a>

          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class=""> </span>
          </button>

          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav">
              <li class="nav-item active">
                <a class="nav-link pl-lg-0" href="index.jsp">Home <span class="sr-only">(current)</span></a>
              </li>
              <%
		if ((String) session.getAttribute("uname") != null) {
	%>
              <li class="nav-item">
                <a class="nav-link" href="books.jsp"> Books</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="every-customer-all-orders.jsp">MyOrder</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="Customer-Profile.jsp"> <%=session.getAttribute("customer-name") %>  </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="contact.jsp">Contact Us</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="logout.jsp">Logout</a>
              </li>
           
            <li class="nav-item">
          
		<%
			ResultSet resultCount = DatabaseConnection.getResultFromSqlQuery("select count(*) from tblcart where customer_id='" + session.getAttribute("customerId") + "'");
			resultCount.next();
			int count = resultCount.getInt(1);
		%>
		<a href="customer-cart.jsp" class="icons-btn d-inline-block bag">
			<img alt="" src="images/shope.png" width="30"> <span  class="bg-warning"><%=count%></span>
		</a> 
	</li> </ul>
          <%}else{ %>
           <li class="nav-item">
                <a class="nav-link" href="about.jsp"> About</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="books.jsp"> Books</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="catefories.jsp">Categories</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="Customer-login.jsp"> CustomerLogin </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="admin-login.jsp"> AdminLogin </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="contact.jsp">Contact Us</a>
              </li>
            </ul>
          <%} %>  
          </div>
        </nav>
      </div>
    </header>