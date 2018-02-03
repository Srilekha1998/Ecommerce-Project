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
<body>
<form:form action="${pageContext.request.contextPath}/admin/editcategory" modelAttribute="category">
		<table class="table">
		     <tr>
				<td>Category id:</td>
				<td><form:input type="text" name="id" value="${categoryList.id}" path="id"/></td>
			</tr>
			<tr>
				<td>Category name:</td>
				<td><form:input type="text" name="productName" value="${categoryList.cname}" path="cname"/></td>
				<td><form:errors path = "cname"/></td>
			</tr>
			<tr>
				<td><input type="submit" value="Update" class="btn btn-primary"/></td>
			</tr>
		</table>
	</form:form>
</body>
</html>