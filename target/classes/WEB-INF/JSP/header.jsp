<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page isELIgnored="false"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <title></title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="${pageContext.request.contextPath}/">Home</a></li>
      <!--<li><a href="${pageContext.request.contextPath}/login">Login</a></li>
      <li><a href="${pageContext.request.contextPath}/Register">Register</a></li>
      <li><a href="${pageContext.request.contextPath}\Product">Product</a></li>-->
      <li><a href="${pageContext.request.contextPath}/admin/dataTable">Admin Product Details</a></li>
      <li><a href="${pageContext.request.contextPath}/admin/category">Category</a></li>
      <li><a href="${pageContext.request.contextPath}/admin/searchByCategory">Search By Category</a></li>
      <li><a href="${pageContext.request.contextPath}/user/userShowList">User Product Details</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <security:authorize access="isAnonymous()">
      <li><a href="${pageContext.request.contextPath}/Register"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="${pageContext.request.contextPath}/login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </security:authorize>
      <security:authorize access="isAuthenticated()">
      <li><a href="${pageContext.request.contextPath}/user/cart"><span class="glyphicon glyphicon-shopping-cart">Cart</span></a></li>
      <li><a href="${pageContext.request.contextPath}/logout"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
      </security:authorize>
    </ul>
  </div>
</nav>
</body>
</html>
