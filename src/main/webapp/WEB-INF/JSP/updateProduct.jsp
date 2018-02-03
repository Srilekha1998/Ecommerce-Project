<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title></title>
</head>
<body bgcolor="gray" class="container">
	<div class="logo">E-Commerce</div>
	<h1>Update Product</h1>
	<form:form action="${pageContext.request.contextPath}/admin/editproduct" modelAttribute="product">
		<table class="table">
		     <tr>
				<td>Product id:</td>
				<td><form:input type="text" name="id" value="${productList.id}" path="id"/></td>
			</tr>
			<tr>
				<td>Product name:</td>
				<td><form:input type="text" name="productName" value="${productList.pname}" path="pname"/></td>
				<td><form:errors path = "pname"/></td>
			</tr>
			<tr>
				<td>Product Description:</td>
				<td><form:input type="text" name="productDesc" value="${productList.pdescription}" path="pdescription"/></td>
				<td><form:errors path = "pdescription"/></td>
			</tr>
			<tr>
				<td>Product Price:</td>
				<td><form:input type="text" name="productPrice" value="${productList.cost}" path="cost"/></td>
				<td><form:errors path = "cost"/></td>
			</tr>
			<tr>
			    <td>Category:</td>
			    <td><form:select path="category.id">
			   	
			    	<form:options items="${categoryList}" itemLabel="cname" itemValue="id" ></form:options>
			    
			    </form:select>
			</tr>
			<tr>
				<td><input type="submit" value="Update" class="btn btn-primary"/></td>
			</tr>
		</table>
	</form:form>
</body>
</html>