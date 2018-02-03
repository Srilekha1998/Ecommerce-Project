<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
    <%@include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.16/css/jquery.dataTables.css">
  
<script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.js"></script>

</head>
<body>
<form:form action="${pageContext.request.contextPath}/admin/addcategory" modelAttribute="category">
<tr>
     <td>Category Name:<form:input path="cname"/></td>
     <td><form:errors path="cname"/></td>
</tr>
<tr>
    <td><input type="submit" value="Add" class="btn btn-primary"></td>
</tr>
</form:form>

<table id="myTable" class="display table table-hover" cellspacing="0"
		width="100%">
		<thead>
			<tr>
				<th>Id</th>
				<th>Category Name</th>
				<th>Edit</th>
				<th>Delete</th>
			</tr>
		</thead>
		

		<tfoot>
			<tr>
				<th>Id</th>
				<th>Category Name</th>
				<th>Edit</th>
				<th>Delete</th>
			</tr>
		</tfoot>
	</table>
	<script type="text/javascript">
			$('#myTable').DataTable({
				ajax :{
					url : 'http://localhost:8000/Project/displayCategory',
					dataSrc:''
				},
				columns : [ {
					data : 'id'
				}, {
					data : 'cname'
				},  {
					data: 'id',
					bSortable : 'false' ,
					mRender : function(data, type, full) {
						    return '<a class="btn btn-info btn-sm" href=${pageContext.request.contextPath}/admin/updatecategory/' + data + '>' + 'Edit' + '</a>';
						  }
				},
				{
					data: 'id',
					bSortable : 'false' ,
					mRender : function(data, type, full) {
						    return '<a class="btn btn-info btn-sm" href=${pageContext.request.contextPath}/admin/deletecategory/' + data + '>' + 'Delete' + '</a>';
						  }
				}]
			});
			</script>
</body>
</html>