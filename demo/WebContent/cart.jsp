<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

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
    html,
    body{
    	font-size:20px;
    },
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

	
	<div class="container" style="text-align:center; padding-top:100px;">
	
	
	<c:choose> 
		<c:when test="${x == 1}">
						<h4 class="" style="margin-top:30px">
				            <span class="text-muted">Your cart  </span>
				            <span class="badge badge-secondary badge-pill"><c:out value="${x}"/></span>
    					</h4>
		</c:when>
		<c:when test="${x > 1}">
						<h4 class="" style="margin-top:30px">
				            <span class="text-muted">Your cart  </span>
				            <span class="badge badge-secondary badge-pill"><c:out value="${x}"/></span>
    					</h4>
		</c:when>
		<c:otherwise >
				<h4 style="margin-top: 40px;margin-bottom:100px;">Your Shopping Bag is Empty</h4>
		</c:otherwise>
	
	</c:choose>
	
	
		<c:set var="total" value="0"></c:set>
		<c:forEach items="${cartlist }" var="i">
			<c:forEach items="${list }" var="Product">
				<c:if test="${i == Product.getId() }">
				
				<c:set var="total" value="${total + Product.getPrice() }"></c:set>
				
			<table style="table-layout: fixed;width: 100%;">
				<tr>
					<td style="width: 100px;"><img src="${Product.getImage()}" height="100" width="150" >  (<c:out value="${Product.getName()}"/>)</td>
					<td style="width: 50px;"><c:out value="${Product.getPrice()}"/></td>
					<td style="width: 100px;"><c:out value="${Product.getCategory()}"/></td>
					<td style="width: 100px;"><a href="Controller?page=remove&id=<c:out value="${Product.getId()}"/>"><span class="btn btn-danger">X</span></a></td>
				</tr>
			</table>
				</c:if>
			</c:forEach>
		</c:forEach>
	<div class="line" style="border: 0;background-color: #000;height: 0.7px;cursor: pointer;margin-top:30px;"></div>
	<h4 style="margin-top: 20px;margin-bottom: 40px;">Order Total: (<c:out value="${ total}"></c:out>) VND</h4>
	
	<a href="Controller?page=success&username=<c:out value="${username }"/>&total=<c:out value="${total }"/>&x=<c:out value="${x }"/>"><input type="submit" value="Proceed to Checkout" class="btn btn-success" style="width:100%;padding:8px;font-size:16px;"></a><br>
	<a href="Controller?page=index"><input type="button" value="Continue Shopping" class="btn btn-warning" style="width:100%;padding:8px;font-size:16px;"></a>
	
	
	</div>
  <footer class="page-footer text-center font-small mt-4 wow fadeIn" style="bottom:0;">

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