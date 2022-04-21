<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign up page</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

<c:set var="x" value="0"></c:set>
	<c:forEach items="${cartlist }" var="i">
		<c:set var="x" value="${x+1 }"></c:set>
	</c:forEach>

<header>
		<h1>
			<a href="Controller?page=index">LM</a>
		</h1>
		<nav>
			<ul>
				<li><a href="Controller?page=index">Home</a></li>
				<c:choose>
					<c:when test="${session == null}">
						<li><a href="Controller?page=login">Login</a></li>
						<li><a href="Controller?page=sign-up">Sign-up</a></li>
					</c:when>
					<c:when test="${session != null}">
						<li><a href="Controller?page=logout" style="color: #F24638;">Logout</a></li>
						<li><a href="Controller?page=userinfo&username=<c:out value="${username }"/>">My Account</a></li>
					</c:when>
				</c:choose>
				<li><a href="Controller?page=showcart">cart(<c:out value="${x}"/>)</a></li>
			</ul>
		</nav>
	</header>
	

	 <form method="post" action="Controller">
	 
	 <input type="hidden" name="page" value="otpverify">

	 	<div class="">
	 		<label>Please enter your OTP from the email we sent</label>
	 		<input type="text" name="authcode" placeholder="Your OTP" required>
	 	</div>
	 	
	 	<div class="col-md-4">
			<div class="text-center">  <a class="btn btn-primary" href="Controller?page=otpverify&name=<c:out value="${name }"/>&email=<c:out value="${email }"/>&username=<c:out value="${username }"/>&address=<c:out value="${address }"/>&password=<c:out value="${password }"/>">Confirm</a> </div><br>
		</div>
	 	<p>
	 		Have not received an email? <a href="" style="color:#F24638;">Send again!</a>
	 	</p>
	 	
	 </form>
	<br><br><br>
	<footer>
		<div class="footer"> &copy; 2021 Copyright:
	      <a href="Controller?page=index">LM</a>
	    </div>
	</footer>

</body>
</html>