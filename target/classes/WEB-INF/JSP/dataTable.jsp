<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<%@include file="header.jsp"%>
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

<style>
#div1 {
    margin-left: 263px;
    margin-top: -60px;
}
img {
    vertical-align: middle;
    width: 200px;
}
</style>
	
</head>
<body>
  <form:form class="form-horizontal" action="${pageContext.request.contextPath}/admin/addproduct" modelAttribute="product">
		<table class="table">
		<div class="form-group">
			<tr>
				<td>Product name:</td>
				<td><form:input class="form-control input-lg" type="text" name="productName" path="pname"/></td>
				<td><form:errors path = "pname"/></td>
			</tr>
		</div>
		<div class="form-group">
			<tr>
				<td>Product Description:</td>
				<td><form:input class="form-control input-lg" type="text" name="productDesc" path="pdescription"/></td>
				<td><form:errors path = "pdescription"/></td>
			</tr>
		</div>
		<div class="form-group">
			<tr>
				<td>Product Price:</td>
				<td><form:input class="form-control input-lg" type="text" name="productPrice" path="cost"/></td>
				<td><form:errors path = "cost"/></td>
			</tr>
		</div>
		<div class="form-group">
			<tr>
			    <td>Category:</td>
			    <td><form:select class="form-control input-lg" path="category.id">
			   	
			    	<form:options items="${categoryList}" itemLabel="cname" itemValue="id" ></form:options>
			    
			    </form:select>
			</tr>
		</div>
			<tr>
				<td><input type="submit" value="Add" class="btn btn-primary"></td>
			</tr>
		</table>
	</form:form>
	<div id="div1"><button class="btn btn-info"><a href="<c:url value='/admin/uploadForm'/>">Upload Image</a></button></div>
<br><br>
	<table id="myTable" class="display table table-hover" cellspacing="0"
		width="100%">
		<thead>
			<tr>
				<th>Id</th>
				<th>Product Name</th>
				<th>Product Description</th>
				<th>Cost</th>
				<th>Category</th>
				<th>Image</th>
				<th>Edit</th>
				<th>Delete</th>
			</tr>
		</thead>
		

		<tfoot>
			<tr>
				<th>Id</th>
				<th>Product Name</th>
				<th>Product Description</th>
				<th>Cost</th>
				<th>Category</th>
				<th>Image</th>
				<th>Edit</th>
				<th>Delete</th>
			</tr>
		</tfoot>
	</table>
	<script type="text/javascript">
			$('#myTable').DataTable({
				ajax :{
					url : 'http://localhost:8000/Project/testing',
					dataSrc:''
				},
				columns : [ {
					data : 'id'
				}, {
					data : 'pname'
				}, {
					data : 'pdescription'
				}, {
					data : 'cost'
				}, {
					data : 'category.cname'
				},
				{
					data: 'id',
					bSortable : 'false' ,
					mRender : function(data, type, full) {
						    return '<img src="${pageContext.request.contextPath}/resources/Images/' + data + '.jpg">';
						  }

				},
				{
					data: 'id',
					bSortable : 'false' ,
					mRender : function(data, type, full) {
						    return '<a class="btn btn-info btn-sm" href=${pageContext.request.contextPath}/admin/updateproduct/' + data + '>' + 'Edit' + '</a>';
						  }
				},
				{
					data: 'id',
					bSortable : 'false' ,
					mRender : function(data, type, full) {
						    return '<a class="btn btn-info btn-sm" href=${pageContext.request.contextPath}/admin/deleteproduct/' + data + '>' + 'Delete' + '</a>';
						  }
				}]
			});
			</script>

</body>
</html>