<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Page</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"> 
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<header>
		<h1>
			Welcome admin
		</h1>
		<nav>
			<ul>
				<li><a href="admin?page=index">Home</a></li>
				<li><a href="admin?page=addproduct">Add Product</a></li>
				<li><a href="admin?page=orders">Orders Management</a></li>

			</ul>
		</nav>
	</header>
	
	 <sql:setDataSource user="root" password="admin" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/myproject" var="ds"/>
	 
	  <sql:query var="result" dataSource="${ds }">
 
		 select * from product
		 
	   </sql:query>
	   
	  
	
	<div class="container" >
	<h2>Orders List:</h2>
		 <table>
			<tr>
				<th>Order ID</th>
				<th>User ID</th>
				<th>Total Price</th>
				<th>Amount</th>
				<th>date</th>
				<th>Delivery Check</th>
			</tr>
		</table>
		
		 
		  <table style="table-layout: fixed;width: 100%;">
		  <c:forEach items="${orders }" var="order">
		  	<c:if test="${order.deliverycheck == false }">
				<tr>
					<td style="width: 50px;"><c:out value="${order.orderid }"></c:out></td>
					<td style="width: 100px;"><c:out value="${order.userid }"></c:out></td>
					<td style="width: 100px;"><c:out value="${order.totalprice }"></c:out></td>
					<td style="width: 100px;"><c:out value="${order.amount }"/></td>
					<td style="width: 100px;"><c:out value="${order.date }"/></td>
					<td style="width: 100px;"><a href="<%= request.getContextPath() %>/admin?page=check&id=${order.orderid }" style="color: #6bb1f8;">Check</a></td>
				</tr>
			</c:if>	
			</c:forEach>
			</table>
		 <div>
		 	<a class="btn btn-primary" href="<%= request.getContextPath() %>/admin?page=checkedorders" style="display: table;font-size:30px;padding-left:30px;padding-right:30px; margin: 0 auto;margin-bottom:100px;"> Show checked orders </a> 
		 </div>
		 </div>
	 <footer>
		<div class="footer"> &copy; 2021 Copyright:
	      <a href="Controller?page=index">LM</a>
	    </div>
	</footer>
	
</body>
</html>