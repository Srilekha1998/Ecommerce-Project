<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<c:forEach items="${register.getAddress()}" var="register1">
		<table class="table table-bordered" style="width: 300px">
			<tr>
				<td>DoorNo</td>
				<td>${register1.getDoorno()}</td>
			</tr>
			<tr>
				<td>StreetName</td>
				<td>${register1.getStreetname()}</td>
			</tr>
			<tr>
				<td>AreaNumber</td>
				<td>${register1.getAreaname()}</td>
			</tr>
			<tr>
				<td>City</td>
				<td>${register1.getCity()}</td>
			</tr>
			<tr>
				<td>PinCode</td>
				<td>${register1.getPincode()}</td>
			</tr>
		</table>
		<a class="btn btn-info btn-sm"
			href="${flowExecutionUrl}&_eventId_Deliver" onclick="${register.getTempBean().setAddId(register1.getId())}">Deliver</a>
		<br>
		<br>
	</c:forEach>
</body>
</html>