<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<head>
</head>
<body>
<form:form action="${pageContext.request.contextPath}/addaddress/${register.id}" modelAttribute="address">
		<table class="table">
		    <tr>
				<td>Door no:</td>
				<td><form:input type="text"  class="form-control input-lg" path="doorno"/></td>
				<td><form:errors path = "doorno"/></td>
			</tr>
			<tr>
				<td>Street name:</td>
				<td><form:input type="text" class="form-control input-lg" path="streetname"/></td>
				<td><form:errors path = "streetname"/></td>
			</tr>
			<tr>
				<td>Area name:</td>
				<td><form:input type="text" class="form-control input-lg" path="areaname"/></td>
				<td><form:errors path = "areaname"/></td>
			</tr>
			<tr>
				<td>City:</td>
				<td><form:input type="text" class="form-control input-lg" path="city" /></td>
				<td><form:errors path = "city"/></td>
			</tr>
			<tr>
				<td>Pin code:</td>
				<td><form:input type="text" class="form-control input-lg" path="pincode"/></td>
				<td><form:errors path = "pincode"/></td>
			</tr>
			<tr>
			    <div class="container">
				<td><input type="submit" value="Submit" class="btn btn-primary btn-lg"></td>
				</div>
			</tr>
		</table>
	</form:form>
</body>
</html>