<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <title>LM</title>
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
  <!-- Bootstrap core CSS -->
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <!-- Material Design Bootstrap -->
  <link href="css/mdb.min.css" rel="stylesheet">
  <!-- Your custom styles (optional) -->
  <link href="css/style.min.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="general.js"></script>
  <style type="text/css">
    html{
    position:relative;
    }
    body{
    font-size:20px;
    }
    header,
    .carousel {
      height: 60vh;
    }

    @media (max-width: 740px) {

      html,
      body,
      header,
      .carousel {
        height: 100vh;
      }
    }

    @media (min-width: 800px) and (max-width: 850px) {

      html,
      body,
      header,
      .carousel {
        height: 100vh;
      }
    }

  </style>
</head>

<body>
	<c:set var="x" value="0"></c:set>
	<c:forEach items="${cartlist }" var="i">
		<c:set var="x" value="${x+1 }"></c:set>
	</c:forEach>
  <!-- Navbar -->
  <nav class="navbar fixed-top navbar-expand-lg navbar-light white scrolling-navbar">
    <div class="container">

      <!-- Brand -->
      <a class="navbar-brand waves-effect" href="Controller?page=index">
        <strong class="blue-text">LM</strong>
      </a>

      <!-- Collapse -->
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <!-- Links -->
      <div class="collapse navbar-collapse" id="navbarSupportedContent">

        <!-- Left -->
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
            <a class="nav-link waves-effect" href="Controller?page=index">Home
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link waves-effect" href="https://mdbootstrap.com/docs/jquery/" target="_blank"></a>
          </li>
          <li class="nav-item">
            <a class="nav-link waves-effect" href="https://mdbootstrap.com/docs/jquery/getting-started/download/"
              target="_blank"></a>
          </li>
          <li class="nav-item">
            <a class="nav-link waves-effect" href="https://mdbootstrap.com/education/bootstrap/" target="_blank"></a>
          </li>
        </ul>

        <!-- Right -->
        <ul class="navbar-nav nav-flex-icons">
          <li class="nav-item">
            <a class="nav-link waves-effect" href="Controller?page=showcart">
              <span class="badge red z-depth-1 mr-1" id="cartupdate"> <c:out value="${x}"/> </span>
              <i class="fas fa-shopping-cart"  ></i>
              <span class="clearfix d-none d-sm-inline-block"> Cart </span>
            </a>
          </li>
          
          <c:choose>
				<c:when test="${session == null}">
					<li><a href="Controller?page=login" class="nav-link waves-effect">Login</a></li>
					<li><a href="Controller?page=sign-up" class="nav-link waves-effect">Sign-up</a></li>
				</c:when>
				<c:when test="${session != null}">
					<li><a  href="Controller?page=userinfo&username=<c:out value="${username }"/>" class="nav-link waves-effect" >My Account(<c:out value="${username }"></c:out>)</a></li>
					<li><a href="Controller?page=logout" class="nav-link waves-effect" style="color: #F24638;">Logout</a></li>
				</c:when>
			</c:choose>
		
          <li class="nav-item">
           
          </li>
          <li class="nav-item">
            
          </li>
          <li class="nav-item">
           
          </li>
        </ul>

      </div>

    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type ="text/javascript" src="general.js"></script>
  </nav>
  <!-- Navbar -->
  <main class="mt-5 pt-4">
  <div class="main" style="text-align:center;">
  	<div class="container wow fadeIn">
  		<div class="card" style="padding-top:50px;padding-bottom:0px;">
			<div class="signup-header" style="margin-bottom:10px;padding-bottom:5px;">
			 	<h2>Login to <mark>LM</mark></h2>
			</div>
	
			 <form method="post" action="Controller">
			 
			 <input type="hidden" name="page" value="login-form">
			 
			 	<!-- Validations errors -->
			 	<font color="#F24638"><c:out value="${msg }"></c:out></font>
			 
			 	<div class="signup-group">
			 		<label>Username</label>
			 		<input type="text" name="username" placeholder="Your Username" value="<c:out value="${username }"></c:out>">
			 	</div>
			 	<div class="signup-group">
			 		<label>Password</label>
			 		<input type="password" name="password" placeholder="Enter password">
			 	</div>
			 	<div class="signup-group">
			 		<button type="submit" name="login" class="signup-btn">Log in</button>
			 	</div>
			 	<p style="margin-top:10px;">
			 		New to LM? <a href="Controller?page=sign-up" style="color:#F24638;">Create Account</a>
			 	</p>
			 </form>
			<br><br><br>
		</div>
	</div>

	</div>	
</main>	
	 <footer class="page-footer text-center font-small mt-4 wow fadeIn" style="position: absolute;bottom:0;width: 100%;">

    <!--Call to action-->

    <!--/.Call to action-->

    <hr class="my-4">

    <!-- Social icons -->
    <div class="pb-4">
      <a href="#" target="_blank">
        <i class="fab fa-facebook-f mr-3"></i>
      </a>

      <a href="#" target="_blank">
        <i class="fab fa-github mr-3"></i>
      </a>

    </div>
    <!-- Social icons -->

    <!--Copyright-->
    <div class="footer-copyright py-3">
      © 2021 Copyright:
      <a href="Controller?page=index"> LM </a>
    </div>
    <!--/.Copyright-->

  </footer>
  <!--/.Footer-->

  <!-- SCRIPTS -->
  <!-- JQuery -->
  <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
  <!-- Bootstrap tooltips -->
  <script type="text/javascript" src="js/popper.min.js"></script>
  <!-- Bootstrap core JavaScript -->
  <script type="text/javascript" src="js/bootstrap.min.js"></script>
  <!-- MDB core JavaScript -->
  <script type="text/javascript" src="js/mdb.min.js"></script>
  <!-- Initializations -->
  <script type="text/javascript">
    // Animations initialization
    new WOW().init();

  </script>


</body>
</html>