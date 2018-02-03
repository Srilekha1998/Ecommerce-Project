<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="header.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body  background="${pageContext.request.contextPath}/resources/Images/art-gallery1.jpg">
<br><br><br><br><br>
<center><b><h1>Do u want to add a new address??</h1></b></center>
<br>
<br>
<center><table>
<tr>
<td><button class="btn btn-success"><a href="<c:url value='/address/${register.id}'/>">Add Address</a></button></td></center>
<td><button class="btn btn-success"><a href="${pageContext.request.contextPath}/">Go for Shopping</a></button></td></center>
</tr>
</table></center>
</body>
</html>