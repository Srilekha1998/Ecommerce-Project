<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
img {
    vertical-align: middle;
    width: 250px;
    height: 250px;
}
.form-horizontal .form-group {
    margin-right: -15px;
    margin-left: -15px;
    padding-left: 450px;
    padding-right: 450px;
}
</style>
</head>
<body>
	<center><h1>Add to Cart</h1></center>
	<form:form class="form-horizontal" action="${pageContext.request.contextPath}/user/addToCart/${productList.id}" modelAttribute="cartItems">
	<center><img src="${pageContext.request.contextPath}/resources/Images/${productList.id}.jpg"><br>
	<h4><label>Product id:${productList.id}</label></h4>
	<h4><label>Product name:${productList.pname}</label></h4>
	<h4><label>Product Description:${productList.pdescription}</label></h4>
	<h4><label>Product Price:${productList.cost}</label></h4>
	<div class="form-group">
	<h4><label class="control-label col-sm-2 input-lg">Quantity:</label>
	<div class="col-sm-10">
	<form:input type="text" class="form-control input-lg" name="quantity" value="1" path="quantity"/></h4>
	</div></div>
	<input type="submit" value="Add to Cart" class="btn btn-primary"/></center>
	</form:form>
</body>
</html>