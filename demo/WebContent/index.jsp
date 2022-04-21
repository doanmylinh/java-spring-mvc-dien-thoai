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

  
   <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" style="margin-top:100px;margin-bottom:0;">
	  <ol class="carousel-indicators" style="padding-bottom:20px;">
	    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
	    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
	  </ol>
	  <div class="carousel-inner">
	    <div class="carousel-item active">
	      <img class="d-block w-100" src="img/slide1.jpg" alt="First slide" style="">
	    </div>
	    <div class="carousel-item">
	      <img class="d-block w-100" src="img/slide2.jpg" alt="Second slide" style="">
	    </div>
	  </div>
	  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev" style="filter: invert(100%);font-size: 40px;">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="sr-only">Previous</span>
	  </a>
	  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next" style="filter: invert(100%);font-size: 40px;">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="sr-only">Next</span>
	  </a>
	</div>

  <!--Main layout-->
  <main>
    <div class="container" style="margin-top:-20px;">

      <!--Navbar-->
      <nav class="navbar navbar-expand-lg navbar-dark mdb-color lighten-3 mt-3 mb-5">

        <!-- Navbar brand -->
        <span class="navbar-brand">Categories:</span>

        <!-- Collapse button -->
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#basicExampleNav"
          aria-controls="basicExampleNav" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <!-- Collapsible content -->
        <div class="collapse navbar-collapse" id="basicExampleNav">

          <!-- Links -->
          <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
              <a class="nav-link" href="Controller?page=all-products">All
                <span class="sr-only">(current)</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="Controller?page=laptops">Laptops</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="Controller?page=mobiles">Mobiles</a>
            </li>


          </ul>
          <!-- Links -->

          <form class="form-inline" method="post" action="Controller">
            <div class="md-form my-0">
            	<input type="hidden" name="page" value="searchpage">
              <input class="form-control mr-sm-2" type="text" name="searchstring" placeholder="Search" aria-label="Search" >
            </div>
          </form>
        </div>
        <!-- Collapsible content -->

      </nav>
      <!--/.Navbar-->

      <!--Section: Products v.3-->

		  <div class="row">
		      	<c:forEach items="${list }" var="product" begin="0" end="8">
					<div class="col-sm-4" style="margin-top:15px;padding:10px;">
			            <div class="card" style="padding-top:5px;">
			              <!--Card image-->
			              <div class="view overlay">
			                <img src="${product.getImage() }" class="card-img-top" style="height: 230px;"
			                  alt="">
			                <a>
			                  <div class="mask rgba-white-slight"></div>
			                </a>
			              </div>
			              <!--Card image-->
			
			              <!--Card content-->
			              <div class="card-body text-center">
			                <!--Category & Title-->
			                <h5>
			                  <strong>
			                    <a href="Controller?page=productdetail?id=<c:out value="${product.getId() }"/>" class="dark-grey-text"><c:out value="${product.getName() }"></c:out></a>
			                  </strong>
			                </h5>
			
			                <h4 class="font-weight-bold blue-text" style="font-size:30px;">
			                  <strong><c:out value="${ product.getPrice() }"></c:out> VND</strong>
			                </h4>
							<div class="text-center"> <a class="btn btn-primary" id="updatecart" style="padding-left:30px;padding-right:30px;border-radius: 8px;"href="Controller?page=addtocart&action=index&id=<c:out value="${product.getId() }"/>">Add to Cart</a> </div><br>
			              </div>
			              <!--Card content-->
		              </div>
					</div>
				</c:forEach>
			</div>


      <!--Section: Products v.3-->

      <!--Pagination-->
      <nav class="d-flex justify-content-center wow fadeIn">
         <div class="pagination" style="width: 1000px;height: auto;margin: 0 auto;position: relative;margin-left:45.8%;">
			<c:forEach var = "i" begin = "1" end = "${pagenumber }">
			  <a href="Controller?page=pagination&currentpage=<c:out value="${i}"/>" class="page-link" ><c:out value="${i }"></c:out></a>
			</c:forEach>							  
		</div>

      </nav>
      <!--Pagination-->

    </div>
  </main>
  <!--Main layout-->

  <!--Footer-->
  <footer class="page-footer text-center font-small mt-4 wow fadeIn" style="bottom:0;">

    <!--Call to action-->

    <!--/.Call to action-->

    <hr class="my-4">

    <!-- Social icons -->
    <div class="pb-4">
      <a href="https://www.facebook.com/mnspidey/" target="_blank">
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
