<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="gray" class="container">
	<div class="logo">E-Commerce</div>
	<h1>Add to Cart</h1>
	<form:form action="${pageContext.request.contextPath}/user/addToCart/${productList.id}" modelAttribute="cartItems">
		<table class="table">
		     <tr>
				<td>Product id:</td>
				<td><form:input type="text" value="${productList.id}" path="product.id"/></td>
			</tr>
			<tr>
				<td>Product name:</td>
				<td><form:input type="text" value="${productList.pname}" path="product.pname"/></td>
			</tr>
			<tr>
				<td>Product Description:</td>
				<td><form:input type="text" value="${productList.pdescription}" path="product.pdescription"/></td>
			</tr>
			<tr>
				<td>Product Price:</td>
				<td><form:input type="text" value="${productList.cost}" path="product.cost"/></td>
			</tr>
			<tr>
			    <td>Category:</td>
			    <td><form:input type="text" value="${productList.category.cname}" path="product.category.id"/></td>
			</tr>
			<tr>
				<td>Quantity:</td>
				<td><form:input type="text" name="quantity" path="quantity"/></td>
				<!--<td><form:errors path = "quantity"/></td>-->
			</tr>
			<tr>
				<td><input type="submit" value="Add" class="btn btn-primary"/></td>
			</tr>
		</table>
	</form:form>
</body>
</html>