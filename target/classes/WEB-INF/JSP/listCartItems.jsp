<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
img {
    vertical-align: middle;
    width: 200px;
}
</style>
</head>
<body>
<c:if test="${!empty cartItemsList}">
		<table class="table table-bordered">
			<tr>
				<th width="80">Product ID</th>
				<th width="120">Product Name</th>
				<th width="200">Product Description</th>
				<th width="80">Price</th>
				<th width="80">Quantity</th>
				<th width="80">Total Price</th>
				<th width="200">Image</th>
			</tr>
			<c:forEach items="${cartItemsList}" var="cartItems">
				<tr>
					<td>${cartItems.getProduct().getId()}</td>
					<td>${cartItems.getProduct().getPname()}</td>
					<td>${cartItems.getProduct().getPdescription()}</td>
					<td>${cartItems.getProduct().getCost()}</td>
					<td>${cartItems.getQuantity()}</td>
					<td>${cartItems.getSubTotal()}</td>
					<td><img src="${pageContext.request.contextPath}/resources/Images/${cartItems.getProduct().getId()}.jpg" alt="hello"></td>
					</tr>
			</c:forEach>
			</table>
			<center><b><h1>Grand Total:${cart.getGrandTotal()}</h1></b></center>
			<br>
		<center><a class="btn btn-primary" href="<c:url value='/user/userShowList'/>">Continue Shopping</a></button>
		<a class="btn btn-primary" href="<c:url value='/user/deleteCart'/>">Buy now</a></button></center>
	</c:if>
</body>
</html>