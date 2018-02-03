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
<body>
Do u want to add a new address??
<br>
<br>
<table>
<tr>
<td><button class="btn btn-info"><a href="<c:url value='/address/${register.id}'/>">Add Address</a></button></td>
<td><button class="btn btn-info"><a href="${pageContext.request.contextPath}/">No</a></button></td>
</tr>
</table>
</body>
</html>